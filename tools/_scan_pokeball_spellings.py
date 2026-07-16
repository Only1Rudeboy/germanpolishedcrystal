# -*- coding: utf-8 -*-
"""Scan DE text for Poké Ball spelling variants vs GSC-canon."""
from __future__ import annotations

import re
from collections import defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]

# Matches string-like content mentioning balls
RX = re.compile(
    r"(?:"
    r"#\s*B[ÄAäa]LL[Ee]?"  # #BALL / #BÄLLE / #Bälle / # Bälle
    r"|#BALL"
    r"|Pok[eé][Bb][aäAÄ]ll\w*"
    r"|Pokeb[aä]ll\w*"
    r"|POKEBALL"
    r")",
    re.IGNORECASE,
)

# Also plain BÄLLE / Bälle in dialog context (not "Balltasche" alone)
RX_PLAIN = re.compile(r"\bB[Ää]LL[Ee]?\b")


def main() -> None:
    files = (
        list((ROOT / "maps").rglob("*.asm"))
        + list((ROOT / "data").rglob("*.asm"))
        + list((ROOT / "engine").rglob("*.asm"))
    )
    hits: dict[str, list[str]] = defaultdict(list)

    for f in files:
        s = str(f)
        if ".bak" in s or "backup" in s.lower() or "_upstream" in s:
            continue
        try:
            text = f.read_text(encoding="utf-8", errors="replace")
        except OSError:
            continue
        rel = f.relative_to(ROOT).as_posix()
        for i, line in enumerate(text.splitlines(), 1):
            if not any(
                k in line
                for k in (
                    'text ',
                    "line ",
                    "cont ",
                    "para ",
                    "next ",
                    'li "',
                    'db "',
                    'dw "',
                )
            ):
                continue
            for m in RX.finditer(line):
                key = m.group(0)
                hits[key].append(f"{rel}:{i}: {line.strip()[:110]}")
            # flag mixed plain Bälle without # when in pokeball context
            if "Bäll" in line or "BÄLL" in line or "Bälle" in line:
                if "#" not in line[max(0, line.find("B") - 3) : line.find("B") + 1]:
                    # plain BÄLLE might be intentional (Kurt balls)
                    pass

    out = ROOT / "tools" / "_pokeball_spelling_report.txt"
    with out.open("w", encoding="utf-8") as fh:
        fh.write("POKÉBALL SPELLING SCAN\n")
        fh.write("GSC-canon (dump):\n")
        fh.write("  singular item/dialog: #BALL\n")
        fh.write("  plural dialog:        #BÄLLE / #BÄLLEN\n")
        fh.write("  generic (Kurt etc.):  BÄLLE / BALL (no #)\n")
        fh.write("  item name table:      #BALL / SUPERBALL / …\n")
        fh.write("  NOT canon:            #Bälle, Pokebälle, Pokéball (as free text)\n\n")

        for key in sorted(hits.keys(), key=lambda k: (-len(hits[k]), k)):
            fh.write(f"\n=== [{key}] x{len(hits[key])} ===\n")
            for h in hits[key]:
                fh.write(h + "\n")

    print(f"Report: {out}")
    print("\nVariants:")
    for key in sorted(hits.keys(), key=lambda k: (-len(hits[k]), k)):
        print(f"  {key!r:20} x{len(hits[key])}")
        for h in hits[key][:5]:
            print(f"    {h}")
        if len(hits[key]) > 5:
            print(f"    ... +{len(hits[key])-5}")


if __name__ == "__main__":
    main()
