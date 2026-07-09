#!/usr/bin/env python3
"""Restore dex_entries.asm from first-read German + fix line breaks."""

import re
import sys
from pathlib import Path

MAX_LEN = 18
NUM_LINES = 6

ROOT = Path(__file__).resolve().parent.parent
EN_PATH = ROOT / "data" / "pokemon" / "dex_entries_en.asm"
SRC_PATH = Path(__file__).parent / "de_source_lines.asm"
OUT_PATH = ROOT / "data" / "pokemon" / "dex_entries.asm"

sys.path.insert(0, str(Path(__file__).resolve().parent))
from make_crystal_paragraphs import CATEGORY_DE, join_lines, parse_blocks  # noqa: E402


def pack_line(words, max_len):
    if not words:
        return "", []
    line, i = "", 0
    while i < len(words):
        w = words[i]
        test = f"{line} {w}".strip()
        if len(test) <= max_len:
            line, i = test, i + 1
        elif not line:
            if len(w) <= max_len:
                return w, words[1:]
            return w[: max_len - 1] + "-", [w[max_len - 1 :]] + words[i + 1 :]
        else:
            break
    return line, words[i:]


def format_lines(paragraph):
    paragraph = re.sub(r"\s+", " ", paragraph.strip())
    body = paragraph[:-1] if paragraph.endswith(".") else paragraph
    words = body.split()
    while words:
        remaining = words[:]
        lines = []
        ok = True
        for i in range(NUM_LINES):
            max_l = MAX_LEN - (1 if i == NUM_LINES - 1 else 0)
            line, remaining = pack_line(remaining, max_l)
            lines.append(line)
        if remaining:
            words = words[:-1]
            continue
        last = lines[-1].rstrip(".")
        if len(last) + 1 > MAX_LEN:
            words = words[:-1]
            continue
        lines[-1] = last + ".@"
        if all(ln.replace("@", "") and len(ln.replace("@", "")) <= MAX_LEN for ln in lines):
            return lines
        words = words[:-1]
    raise ValueError(paragraph[:60])


def emit(name, entry, lines):
    out = [f'SECTION "{name}", ROMX', f"{name}::"]
    cats = entry["cats"]
    if len(cats) == 3:  # faithful block has 2 db + maybe
        pass
    if "if DEF(FAITHFUL)" in entry.get("raw", ""):
        de_cats = CATEGORY_DE
        c0 = cats[0].replace("@", "")
        c1 = cats[1].replace("@", "")
        out += ["if DEF(FAITHFUL)", f'\tdb "{de_cats.get(c0, c0)}@"', "else", f'\tdb "{de_cats.get(c1, c1)}@"', "endc"]
    else:
        c = cats[0].replace("@", "") if cats else ""
        out.append(f'\tdb "{CATEGORY_DE.get(c, c)}@"')
    for d, l in zip(["text", "next", "next", "page", "next", "next"], lines):
        out.append(f'\t{d} "{l}"')
    return "\n".join(out)


def parse_blocks_raw(content):
    blocks = []
    for block in re.split(r"\n(?=SECTION )", content):
        m = re.match(r'SECTION "([^"]+)"', block)
        if not m:
            continue
        name = m.group(1)
        cats = re.findall(r'\tdb "([^"]+)"', block)
        lines = re.findall(r'(?:text|next|page) "([^"]*)"', block)
        blocks.append({"name": name, "cats": cats, "lines": lines, "raw": block})
    return blocks


def line_ok(lines):
    for ln in lines:
        core = ln.replace("@", "")
        if len(core) > MAX_LEN:
            return False
    return True


def main():
    if not SRC_PATH.exists():
        raise SystemExit(f"Missing {SRC_PATH}")
    en_blocks = {b["name"]: b for b in parse_blocks_raw(EN_PATH.read_text(encoding="utf-8"))}
    de_blocks = {b["name"]: b for b in parse_blocks_raw(SRC_PATH.read_text(encoding="utf-8"))}
    parts = []
    errors = []
    for name, de in de_blocks.items():
        en = en_blocks[name]
        if line_ok(de["lines"]) and de["lines"][-1].endswith("@"):
            # use source lines directly (fix lone .@)
            lines = de["lines"][:]
            if lines[-1] in (".@", '"."'):
                lines[-2] = lines[-2].rstrip(".") + ".@"
                lines = lines[:-1]
            while len(lines) < NUM_LINES:
                lines.append("")
            lines = lines[:NUM_LINES]
            if lines[-1] and not lines[-1].endswith("@"):
                lines[-1] = lines[-1].rstrip(".") + ".@"
            parts.append(emit(name, en, lines))
        else:
            try:
                para = join_lines(de["lines"])
                if not para.endswith("."):
                    para += "."
                lines = format_lines(para)
                parts.append(emit(name, en, lines))
            except ValueError as e:
                errors.append((name, str(e)))
    if errors:
        for n, e in errors[:15]:
            print(f"ERR {n}: {e}")
        raise SystemExit(f"{len(errors)} failed")
    OUT_PATH.write_text("\n\n".join(parts) + "\n", encoding="utf-8")
    print(f"Wrote {len(parts)} entries")


if __name__ == "__main__":
    main()