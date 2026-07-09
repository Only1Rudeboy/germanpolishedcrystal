#!/usr/bin/env python3
"""Find lines at 17-18 chars (borderline overflow risk)."""
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
PAT = re.compile(r'(?:text|line|cont|para)\s+"([^"]*)"')
TOK = {"<PLAYER>": 7, "<RIVAL>": 7, "<USER>": 7, "<TARGET>": 7, "#mon": 4, "<PK><MN>": 2}


def display_width(s: str) -> int:
    s = re.sub(r"\{d:[^}]+\}", "##", s).rstrip("@")
    w, i = 0, 0
    while i < len(s):
        hit = False
        for t, tw in sorted(TOK.items(), key=lambda x: -len(x[0])):
            if s[i : i + len(t)] == t:
                w += tw
                i += len(t)
                hit = True
                break
        if not hit:
            w += 1
            i += 1
    return w


bad = []
for sub in ("maps", "data", "text"):
    base = ROOT / sub
    if not base.exists():
        continue
    for path in sorted(base.rglob("*.asm")):
        rel = str(path.relative_to(ROOT)).replace("\\", "/")
        for i, raw in enumerate(path.read_text(encoding="utf-8").splitlines(), 1):
            m = PAT.search(raw)
            if not m:
                continue
            s = m.group(1).rstrip("@")
            cl, dw = len(s), display_width(s)
            if cl >= 17 or dw >= 17:
                bad.append((rel, i, cl, dw, s))

print(f"Borderline lines (chars>=17 or disp>=17): {len(bad)}")
for rel, ln, cl, dw, s in bad[:25]:
    print(f"  {rel}:{ln} c={cl} d={dw}: {s}")
out = ROOT / "tools" / "borderline_report.txt"
out.write_text(
    "\n".join(f"{r}:{ln} c={cl} d={dw}: {s}" for r, ln, cl, dw, s in bad),
    encoding="utf-8",
)
print(f"Report: {out}")