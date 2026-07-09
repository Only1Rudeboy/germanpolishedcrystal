#!/usr/bin/env python3
"""Generate crystal-style German paragraphs from EN + translation table."""

import re
from pathlib import Path

EN_PATH = Path(__file__).resolve().parent.parent / "data" / "pokemon" / "dex_entries_en.asm"
OUT_PATH = Path(__file__).resolve().parent / "dex_de_paragraphs.py"

# Crystal-style German (shorter, matches EN structure) - keyed by entry name
# Generated from polished crystal DE translation pass
from crystal_de_text import TEXT as CRYSTAL_TEXT, CATS as CRYSTAL_CATS  # noqa: E402


def parse_en(content):
    entries = []
    for block in re.split(r"\n(?=SECTION )", content):
        m = re.match(r'SECTION "([^"]+)"', block)
        if not m:
            continue
        name = m.group(1)
        cats = re.findall(r'\tdb "([^"]+)"', block)
        entries.append({"name": name, "cats": cats})
    return entries


def main():
    entries = parse_en(EN_PATH.read_text(encoding="utf-8"))
    lines = ["# Crystal-style German Pokedex paragraphs", "PARAGRAPHS = {"]
    for e in entries:
        t = CRYSTAL_TEXT[e["name"]].replace("\\", "\\\\").replace('"', '\\"')
        lines.append(f'    "{e["name"]}": "{t}",')
    lines.append("}")
    lines.append("")
    lines.append("CATEGORIES = {")
    for e in entries:
        if e["name"] in CRYSTAL_CATS:
            c = CRYSTAL_CATS[e["name"]]
            if isinstance(c, list):
                lines.append(f'    "{e["name"]}": [{", ".join(chr(34)+x+chr(34) for x in c)}],')
            else:
                lines.append(f'    "{e["name"]}": "{c}",')
    lines.append("}")
    OUT_PATH.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(f"Wrote {len(entries)} paragraphs")


if __name__ == "__main__":
    main()