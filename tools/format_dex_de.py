#!/usr/bin/env python3
"""Format German Pokedex paragraphs into dex_entries.asm (max 18 chars/line)."""

import re
import sys
from pathlib import Path

MAX_LEN = 18
NUM_LINES = 6

ROOT = Path(__file__).resolve().parent.parent
EN_PATH = ROOT / "data" / "pokemon" / "dex_entries_en.asm"
OUT_PATH = ROOT / "data" / "pokemon" / "dex_entries.asm"

sys.path.insert(0, str(Path(__file__).resolve().parent))
from dex_de_paragraphs import PARAGRAPHS, CATEGORIES  # noqa: E402


def parse_en_entries(content: str) -> list[dict]:
    entries = []
    for block in re.split(r"\n(?=SECTION )", content):
        if not block.strip():
            continue
        m = re.match(r'SECTION "([^"]+)"', block)
        if not m:
            continue
        name = m.group(1)
        entry = {
            "name": name,
            "has_faithful": "if DEF(FAITHFUL)" in block,
        }
        if entry["has_faithful"]:
            entry["categories"] = re.findall(r'\tdb "([^"]+)"', block)
        else:
            cat = re.search(r'\tdb "([^"]+)"', block)
            entry["category"] = cat.group(1) if cat else ""
        entries.append(entry)
    return entries


def pack_line(words: list[str], max_len: int) -> tuple[str, list[str]]:
    if not words:
        return "", []
    line = ""
    i = 0
    while i < len(words):
        w = words[i]
        test = f"{line} {w}".strip()
        if len(test) <= max_len:
            line = test
            i += 1
        elif not line:
            if len(w) <= max_len:
                return w, words[1:]
            return w[: max_len - 1] + "-", [w[max_len - 1 :]] + words[i + 1 :]
        else:
            break
    return line, words[i:]


def format_paragraph(paragraph: str) -> list[str]:
    paragraph = re.sub(r"\s+", " ", paragraph.strip())
    if paragraph.endswith("."):
        body = paragraph[:-1]
    else:
        body = paragraph

    remaining = body.split()
    lines: list[str] = []

    for i in range(NUM_LINES):
        max_l = MAX_LEN - (1 if i == NUM_LINES - 1 else 0)
        line, remaining = pack_line(remaining, max_l)
        if not line and remaining:
            line, remaining = pack_line(remaining, max_l)
        lines.append(line)

    if remaining:
        raise ValueError(f"Overflow {len(remaining)}: {' '.join(remaining[:5])}")

    last = lines[-1].rstrip(".")
    if len(last) + 1 > MAX_LEN:
        last = last[: MAX_LEN - 1].rstrip("-").rstrip()
    lines[-1] = last + ".@"

    for i, ln in enumerate(lines, 1):
        core = ln.replace("@", "")
        if not core:
            raise ValueError(f"Empty line {i}")
        if len(core) > MAX_LEN:
            raise ValueError(f"Line {i} too long ({len(core)}): {core}")
    return lines


def emit_entry(entry: dict) -> str:
    name = entry["name"]
    lines = format_paragraph(PARAGRAPHS[name])
    out = [f'SECTION "{name}", ROMX', f"{name}::"]

    if entry["has_faithful"]:
        cats = CATEGORIES.get(name, entry["categories"])
        out += [
            "if DEF(FAITHFUL)",
            f'\tdb "{cats[0]}@"',
            "else",
            f'\tdb "{cats[1]}@"',
            "endc",
        ]
    else:
        cat = CATEGORIES.get(name, entry.get("category", ""))
        out.append(f'\tdb "{cat}@"')

    for directive, line in zip(["text", "next", "next", "page", "next", "next"], lines):
        out.append(f'\t{directive} "{line}"')
    return "\n".join(out)


def main():
    entries = parse_en_entries(EN_PATH.read_text(encoding="utf-8"))
    errors = []
    parts = []
    for e in entries:
        try:
            parts.append(emit_entry(e))
        except ValueError as exc:
            errors.append((e["name"], str(exc)))
    if errors:
        for name, err in errors[:20]:
            print(f"ERROR {name}: {err}")
        raise SystemExit(f"{len(errors)} entries failed")
    OUT_PATH.write_text("\n\n".join(parts) + "\n", encoding="utf-8")
    print(f"Wrote {len(entries)} entries")


if __name__ == "__main__":
    main()