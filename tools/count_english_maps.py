#!/usr/bin/env python3
import re
from pathlib import Path

root = Path(__file__).resolve().parent.parent / "maps"
eng = re.compile(r'^\s+text "[A-Za-z]')
files = []
for p in sorted(root.glob("*.asm")):
    lines = p.read_text(encoding="utf-8", errors="replace").splitlines()
    eng_count = sum(1 for l in lines if eng.search(l))
    if eng_count:
        files.append((eng_count, len(lines), p.name))
files.sort(reverse=True)
print("maps with likely English dialogue:", len(files))
print("total english-ish text lines:", sum(f[0] for f in files))
print("top 20:")
for c, ln, name in files[:20]:
    print(f"  {name}: {c} / {ln}")