# -*- coding: utf-8 -*-
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[2]
fixed = 0
for base in [ROOT / "maps", ROOT / "data" / "phone" / "text"]:
    if not base.exists():
        continue
    for p in base.rglob("*.asm"):
        if "backup" in p.parts:
            continue
        lines = p.read_text(encoding="utf-8").splitlines()
        changed = False
        for i in range(len(lines) - 1):
            m = re.match(r'^(\s*)(text|line|cont|para)\s+"(.*)"\s*$', lines[i])
            if not m:
                continue
            indent, kind, s = m.group(1), m.group(2), m.group(3)
            j = i + 1
            while j < len(lines) and lines[j].strip() == "":
                j += 1
            if j >= len(lines):
                continue
            if not re.match(r"^\s*(text_ram|text_decimal)\b", lines[j]):
                continue
            if s and s[-1] not in " \t.!?…-–—":
                if re.search(r"[A-Za-z0-9äöüÄÖÜß>]$", s):
                    lines[i] = f'{indent}{kind} "{s} "'
                    changed = True
                    fixed += 1
        if changed:
            p.write_text("\n".join(lines) + "\n", encoding="utf-8", newline="\n")
            print("spaced", p.relative_to(ROOT))
print("total spaced", fixed)
