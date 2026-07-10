#!/usr/bin/env python3
"""Find all map text lines exceeding MAX characters."""
import re
import pathlib
import sys

MAX = 18
root = pathlib.Path(__file__).parent.parent / "maps"
pat = re.compile(r'(?:text|line|cont|para|next|page)\s+"([^"]*)"')

total_bad = 0
files_bad = []
for f in sorted(root.glob("*.asm")):
    text = f.read_text(encoding="utf-8")
    bad = []
    for lineno, line in enumerate(text.splitlines(), 1):
        m = pat.search(line)
        if m:
            s = m.group(1).rstrip("@")
            if len(s) > MAX:
                bad.append((lineno, len(s), s))
    if bad:
        files_bad.append((f.name, bad))
        total_bad += len(bad)

out = pathlib.Path(__file__).parent / "long_lines_report.txt"
with out.open("w", encoding="utf-8") as fp:
    fp.write(f"Files with long lines: {len(files_bad)}\n")
    fp.write(f"Total long lines: {total_bad}\n\n")
    for name, bad in files_bad:
        fp.write(f"=== {name} ({len(bad)}) ===\n")
        for lineno, n, s in bad:
            fp.write(f"  L{lineno}: {n} {s}\n")
        fp.write("\n")

print(f"Files with long lines: {len(files_bad)}")
print(f"Total long lines: {total_bad}")
print(f"Report: {out}")
for name, bad in files_bad[:30]:
    print(f"\n=== {name} ({len(bad)}) ===")
    for lineno, n, s in bad[:5]:
        print(f"  L{lineno}: {n} {s}")