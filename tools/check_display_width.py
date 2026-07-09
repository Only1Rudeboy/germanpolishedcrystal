#!/usr/bin/env python3
"""Check dialog display width (special tokens count as on-screen width)."""
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
MAX = 17
DIRS = ["maps", "data", "text", "engine", "home"]
SKIP = {"data/credits_strings.asm"}

STR = re.compile(r'(?:text|line|cont|para|next|page|db)\s+"([^"]*)"')
# On-screen width of control tokens (Crystal convention)
TOKEN_WIDTH = {
    "<PLAYER>": 7,
    "<RIVAL>": 7,
    "<ENEMY>": 7,
    "<USER>": 7,
    "<TARGET>": 7,
    "#mon": 4,
    "#MON": 4,
    "<PK><MN>": 2,
    "<POKE>": 4,
    "<ITEM>": 8,
    "<MOVE>": 8,
    "<STR_VAR1>": 8,
    "<STR_VAR2>": 8,
    "<STR_VAR3>": 8,
}


def display_width(s: str) -> int:
    s = re.sub(r"\{d:[^}]+\}", "##", s)
    s = s.rstrip("@")
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


bad = []
for sub in DIRS:
    base = ROOT / sub
    if not base.exists():
        continue
    for path in sorted(base.rglob("*.asm")):
        rel = str(path.relative_to(ROOT)).replace("\\", "/")
        if rel in SKIP:
            continue
        for i, raw in enumerate(path.read_text(encoding="utf-8", errors="replace").splitlines(), 1):
            m = STR.search(raw)
            if not m:
                continue
            s = m.group(1)
            dw = display_width(s)
            if dw > MAX:
                bad.append((rel, i, dw, len(s.rstrip("@")), s[:70]))

print(f"Lines over {MAX} display width: {len(bad)}")
for rel, ln, dw, cl, s in bad[:40]:
    print(f"  {rel}:{ln} disp={dw} chars={cl}: {s}")
if len(bad) > 40:
    print(f"  ... +{len(bad)-40} more")

out = ROOT / "tools" / "display_width_report.txt"
with out.open("w", encoding="utf-8") as fp:
    fp.write(f"Lines over {MAX} display width: {len(bad)}\n\n")
    for rel, ln, dw, cl, s in bad:
        fp.write(f"{rel}:{ln} disp={dw} chars={cl}: {s}\n")
print(f"Report: {out}")