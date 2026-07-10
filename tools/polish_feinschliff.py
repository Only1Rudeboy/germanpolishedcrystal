#!/usr/bin/env python3
"""Apply targeted DE-Crystal style polish (informal du, typos, signs)."""
from __future__ import annotations

import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
SCAN = [ROOT / "maps", ROOT / "data"]

# Exact substring replacements inside dialogue strings only (order matters).
REPLACEMENTS = [
    ("Du möschtest", "Du möchtest"),
    ("#mon rischtisch", "#mon richtig"),
    ("Findest Du Alles,", "findest du alles,"),
    ("was Dein Herz", "was dein Herz"),
    ("Begehrt!", "begehrt!"),
    ("Für Dich", "für dich"),
    ("Sprechen!", "sprechen!"),
    ("Wir Ziehen Dein", "Wir ziehen dein"),
    ("#mon Für", "#mon für"),
    ("Dich Auf!", "dich auf!"),
    ("Sie können deinen", "Man kann deinen"),
]

STRING_LINE = re.compile(r'^(\s*(?:text|line|para|cont|next|page)\s+")(.*)(")\s*$')

changed: list[str] = []


def polish_line(line: str) -> str:
    m = STRING_LINE.match(line)
    if not m:
        for old, new in REPLACEMENTS:
            if old in line:
                line = line.replace(old, new)
        return line

    prefix, body, suffix = m.group(1), m.group(2), m.group(3)
    original = body
    for old, new in REPLACEMENTS:
        if old in body:
            body = body.replace(old, new)
    if body != original:
        changed.append(f"{original!r} -> {body!r}")
    return prefix + body + suffix


def main() -> None:
    for base in SCAN:
        if not base.exists():
            continue
        for path in sorted(base.rglob("*.asm")):
            if "_upstream_extract" in str(path):
                continue
            text = path.read_text(encoding="utf-8")
            lines = text.splitlines(keepends=True)
            new_lines = [polish_line(l.rstrip("\r\n")) + (l[len(l.rstrip("\r\n")):]) for l in lines]
            new_text = "".join(new_lines)
            if new_text != text:
                path.write_text(new_text, encoding="utf-8")
                print(f"updated {path.relative_to(ROOT)}")

    print(f"\n{len(changed)} string tweaks")
    for item in changed[:30]:
        print(f"  {item}")
    if len(changed) > 30:
        print(f"  ... +{len(changed) - 30} more")


if __name__ == "__main__":
    main()