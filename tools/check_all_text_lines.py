#!/usr/bin/env python3
"""Find all dialog text lines exceeding MAX display width."""
from __future__ import annotations

import pathlib
import re

MAX = 17
ROOT = pathlib.Path(__file__).parent.parent
DIRS = ["maps", "data", "text", "engine", "home"]
SKIP = {"data/credits_strings.asm"}
PAT = re.compile(r'(?:text|line|cont|para|next|page)\s+"([^"]*)"')
PH = re.compile(r"\{d:[^}]+\}")

TOKEN_WIDTH = {
    "<PLAYER>": 7,
    "<RIVAL>": 7,
    "<ENEMY>": 7,
    "<USER>": 7,
    "<TARGET>": 7,
    "<STR_VAR1>": 8,
    "<STR_VAR2>": 8,
    "<STR_VAR3>": 8,
    "<ITEM>": 8,
    "<MOVE>": 8,
    "<POKE>": 4,
    "<PK><MN>": 2,
    "<PO><KE>": 2,
    "#mon": 4,
    "#MON": 4,
    "#dex": 4,
    "#DEX": 4,
}


def display_width(s: str) -> int:
    s = PH.sub("##", s).rstrip("@")
    w = 0
    i = 0
    while i < len(s):
        matched = False
        for tok, tw in sorted(TOKEN_WIDTH.items(), key=lambda x: -len(x[0])):
            if s[i : i + len(tok)] == tok:
                w += tw
                i += len(tok)
                matched = True
                break
        if not matched:
            w += 1
            i += 1
    return w


total_bad = 0
files_bad = []
for sub in DIRS:
    base = ROOT / sub
    if not base.exists():
        continue
    for f in sorted(base.rglob("*.asm")):
        rel = str(f.relative_to(ROOT)).replace("\\", "/")
        if rel in SKIP:
            continue
        text = f.read_text(encoding="utf-8", errors="replace")
        bad = []
        for lineno, line in enumerate(text.splitlines(), 1):
            m = PAT.search(line)
            if m:
                s = m.group(1)
                n = display_width(s)
                if n > MAX:
                    bad.append((lineno, n, s))
        if bad:
            files_bad.append((rel, bad))
            total_bad += len(bad)

out = pathlib.Path(__file__).parent / "long_lines_all_report.txt"
with out.open("w", encoding="utf-8") as fp:
    fp.write(f"MAX display width: {MAX}\n")
    fp.write(f"Files with long lines: {len(files_bad)}\n")
    fp.write(f"Total long lines: {total_bad}\n\n")
    for name, bad in files_bad:
        fp.write(f"=== {name} ({len(bad)}) ===\n")
        for lineno, n, s in bad:
            fp.write(f"  L{lineno}: {n} {s}\n")
        fp.write("\n")

print(f"MAX={MAX}  files with long lines: {len(files_bad)}")
print(f"Total long lines: {total_bad}")
for name, bad in files_bad[:20]:
    print(f"\n=== {name} ({len(bad)}) ===")
    for lineno, n, s in bad[:3]:
        print(f"  L{lineno}: {n} {s}")