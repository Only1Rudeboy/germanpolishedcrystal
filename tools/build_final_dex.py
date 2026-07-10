#!/usr/bin/env python3
"""Build dex_entries.asm from German paragraphs with validated 6-line wrapping."""

import importlib.util
import re
from pathlib import Path

MAX_LEN = 18
NUM_LINES = 6

ROOT = Path(__file__).resolve().parent.parent
EN_PATH = ROOT / "data" / "pokemon" / "dex_entries_en.asm"
OUT_PATH = ROOT / "data" / "pokemon" / "dex_entries.asm"
TOOLS = Path(__file__).resolve().parent


def load_module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


sp = load_module("sp", TOOLS / "shorten_paragraphs.py")
fp = load_module("fp", TOOLS / "fetch_de_paragraphs.py")
dt = load_module("dt", TOOLS / "dex_de_text.py")
CATEGORY_DE = fp.CATEGORY_DE


def paragraphs_for(name):
    if name in sp.OVERRIDES:
        return sp.OVERRIDES[name]
    if name in fp.MANUAL_DE:
        return fp.MANUAL_DE[name]
    if name in dt.TEXT:
        return dt.TEXT[name]
    raise KeyError(name)


def shorten(text, limit=100):
    text = re.sub(r"\s+", " ", text.strip())
    if len(text) <= limit:
        return text if text.endswith(".") else text + "."
    sents = re.split(r"(?<=[.!?])\s+", text)
    out = ""
    for s in sents:
        trial = (out + " " + s).strip()
        if len(trial) <= limit:
            out = trial
        else:
            break
    if out:
        return out if out.endswith(".") else out + "."
    words = text.split()
    out = ""
    for w in words:
        trial = (out + " " + w).strip()
        if len(trial) <= limit - 1:
            out = trial
        else:
            break
    return (out + ".") if out else text[: limit - 1] + "."


def hyphen_cuts(word, max_len):
    if len(word) <= max_len:
        return [(word, "")]
    cuts = []
    for cut in range(min(max_len - 1, len(word) - 1), 2, -1):
        cuts.append((word[:cut] + "-", word[cut:]))
    if not cuts:
        cuts.append((word[: max_len - 1] + "-", word[max_len - 1 :]))
    return cuts


def line_limit(line_idx):
    return MAX_LEN - 1 if line_idx == NUM_LINES - 1 else MAX_LEN


def wrap_words(words, en_lines=None):
    if not words:
        return [""] * NUM_LINES

    remaining = list(words)
    lines = []

    for li in range(NUM_LINES):
        ml = line_limit(li)
        line = ""

        while remaining:
            w = remaining[0]
            trial = f"{line} {w}".strip() if line else w
            if len(trial) <= ml:
                line = trial
                remaining.pop(0)
                continue
            if line:
                room = ml - len(line) - 1
                if room >= 3 and len(w) >= 12:
                    for left, right in hyphen_cuts(w, room):
                        piece = f"{line} {left}".strip()
                        if len(piece) <= ml and right:
                            line = piece
                            remaining[0] = right
                            break
                    else:
                        break
                    break
                break
            if len(w) <= ml:
                break
            left, right = hyphen_cuts(w, ml)[0]
            line = left
            if right:
                remaining[0] = right
            else:
                remaining.pop(0)
            break

        lines.append(line)

    if remaining:
        return None
    if any(len(ln) > line_limit(i) for i, ln in enumerate(lines)):
        return None
    return lines


def rebalance_last(lines):
    lines = list(lines[:NUM_LINES])
    while len(lines) < NUM_LINES:
        lines.append("")
    if not lines[-1].strip():
        for i in range(NUM_LINES - 2, -1, -1):
            if not lines[i]:
                continue
            words = lines[i].split()
            if len(words) > 1:
                lines[-1] = words[-1]
                lines[i] = " ".join(words[:-1])
                break
            lines[-1] = lines[i]
            lines[i] = ""
            break
    return lines


def finalize_lines(lines):
    lines = rebalance_last(lines)
    last = lines[-1].rstrip(".")
    if not last:
        return None
    if len(last) + 1 > MAX_LEN:
        for left, right in hyphen_cuts(last, MAX_LEN - 1):
            if right:
                lines[-2] = f"{lines[-2]} {left}".strip() if lines[-2] else left
                last = right.rstrip(".")
                if len(last) + 1 <= MAX_LEN:
                    break
        else:
            return None
    lines[-1] = last + ".@"
    for i, ln in enumerate(lines):
        core = ln.replace("@", "")
        if core and len(core) > line_limit(i):
            return None
    return lines


def _norm(text):
    return text.replace(" ", "").replace("-", "").replace(".", "")


def verify_words(source_words, lines):
    joined = _norm("".join(ln.replace("@", "") for ln in lines))
    src = _norm("".join(source_words))
    return joined == src


def format_paragraph(paragraph, en_lines=None, allow_shorten=True):
    paragraph = re.sub(r"\s+", " ", paragraph.strip())
    source_words = (paragraph[:-1] if paragraph.endswith(".") else paragraph).split()

    limits = [200]
    if allow_shorten:
        limits += [108, 100, 92, 84, 76]

    for limit in limits:
        text = paragraph
        if limit < len(paragraph) and allow_shorten:
            text = shorten(paragraph, limit)
        body = text[:-1] if text.endswith(".") else text
        words = body.split()
        lines = wrap_words(words, en_lines)
        if lines is not None:
            result = finalize_lines(lines)
            if result is not None and verify_words(words, result):
                return result

    raise ValueError(paragraph[:70])


def parse_en_lines(block):
    raw = re.findall(r'(?:text|next|page) "([^"]*)"', block)
    return [ln.replace("@", "") for ln in raw]


def parse_en_entries(content):
    entries = []
    for block in re.split(r"\n(?=SECTION )", content):
        m = re.match(r'SECTION "([^"]+)"', block)
        if not m:
            continue
        name = m.group(1)
        e = {"name": name, "has_faithful": "if DEF(FAITHFUL)" in block, "block": block}
        if e["has_faithful"]:
            e["categories"] = re.findall(r'\tdb "([^"]+)"', block)
        else:
            c = re.search(r'\tdb "([^"]+)"', block)
            e["category"] = c.group(1) if c else ""
        e["en_lines"] = parse_en_lines(block)
        entries.append(e)
    return entries


def cat_de(name):
    key = name.replace("@", "")
    return CATEGORY_DE.get(key, key)


def emit_entry(entry, lines):
    name = entry["name"]
    out = [f'SECTION "{name}", ROMX', f"{name}::"]
    if entry["has_faithful"]:
        cats = entry["categories"]
        out += [
            "if DEF(FAITHFUL)",
            f'\tdb "{cat_de(cats[0])}@"',
            "else",
            f'\tdb "{cat_de(cats[1])}@"',
            "endc",
        ]
    else:
        out.append(f'\tdb "{cat_de(entry.get("category", ""))}@"')
    for d, l in zip(["text", "next", "next", "page", "next", "next"], lines):
        out.append(f'\t{d} "{l}"')
    return "\n".join(out)


def main():
    en_content = EN_PATH.read_text(encoding="utf-8")
    entries = parse_en_entries(en_content)
    errors = []
    parts = []
    for e in entries:
        try:
            raw = paragraphs_for(e["name"])
            is_fixed = e["name"] in sp.OVERRIDES or e["name"] in fp.MANUAL_DE
            para = raw if is_fixed else shorten(raw, 108)
            try:
                lines = format_paragraph(
                    para, e["en_lines"], allow_shorten=not is_fixed
                )
            except ValueError:
                para = shorten(raw, 96)
                lines = format_paragraph(para, e["en_lines"], allow_shorten=True)
            parts.append(emit_entry(e, lines))
        except (KeyError, ValueError) as ex:
            errors.append((e["name"], str(ex)))
    if errors:
        for n, err in errors[:20]:
            print(f"ERR {n}: {err}")
        raise SystemExit(f"{len(errors)} failed")
    OUT_PATH.write_text("\n\n".join(parts) + "\n", encoding="utf-8")
    print(f"Wrote {len(entries)} entries")


if __name__ == "__main__":
    main()