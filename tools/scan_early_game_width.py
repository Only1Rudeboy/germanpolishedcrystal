#!/usr/bin/env python3
"""Find dialog lines in early-game maps over safe display width."""
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
MAX = 16  # DE textbox: 18 tiles, 17 clips; 16 is safe with # tokens
EARLY_MAPS = [
    "PlayersHouse1F.asm", "PlayersHouse2F.asm", "NewBarkTown.asm",
    "ElmsLab.asm", "ElmsHouse.asm", "Route29.asm", "CherrygroveCity.asm",
    "MrPokemonsHouse.asm", "Route30.asm", "VioletCity.asm",
    "VioletPokeCenter1F.asm", "Route31.asm", "AzaleaTown.asm",
    "CherrygrovePokeCenter1F.asm", "LyrasHouse1F.asm", "LyrasHouse2F.asm",
]
PAT = re.compile(r'(?:text|line|cont|para|next)\s+"([^"]*)"')
PH = re.compile(r"\{d:[^}]+\}")
TOKEN_WIDTH = {
    "<PLAYER>": 7, "<RIVAL>": 7, "<ENEMY>": 7, "<USER>": 7, "<TARGET>": 7,
    "<STR_VAR1>": 8, "<STR_VAR2>": 8, "<STR_VAR3>": 8, "<ITEM>": 8, "<MOVE>": 8,
    "<POKE>": 4, "<PK><MN>": 2, "<PO><KE>": 2,
    "#mon": 4, "#MON": 4, "#dex": 4, "#DEX": 4,
    "#COM": 4, "#COM": 4, "#gear": 5, "#ball": 5, "#BÄLLE": 6, "#BÄLLE": 6,
}


def display_width(s: str) -> int:
    s = PH.sub("##", s).rstrip("@")
    w = i = 0
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


hits = []
for fn in EARLY_MAPS:
    p = ROOT / "maps" / fn
    if not p.exists():
        continue
    for n, line in enumerate(p.read_text(encoding="utf-8").splitlines(), 1):
        m = PAT.search(line)
        if m and display_width(m.group(1)) > MAX:
            hits.append((display_width(m.group(1)), fn, n, m.group(1)))

print(f"Early-game lines over {MAX} display width: {len(hits)}\n")
for dw, fn, n, s in sorted(hits, key=lambda x: (x[1], x[2])):
    print(f"{fn}:{n} disp={dw}: {s}")