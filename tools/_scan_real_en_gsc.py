# -*- coding: utf-8 -*-
from pathlib import Path
import re

# Real EN / non-GSC signals
PATS = [
    (r'\bsorry\b', 'sorry'),
    (r'\bUhm\b', 'Uhm'),
    (r'\bYeah\b', 'Yeah'),
    (r'\bHey\b', 'Hey-en'),  # may be ok in DE
    (r'\bWow\b', 'Wow'),
    (r'\bOK!\b', 'OK! vs O.K.!'),
    (r'\bO\.K\.\b', None),  # GSC ok, skip collect
    (r'\breceived\b', 'received'),
    (r'\bfled\b', 'fled'),
    (r'\bused\b', 'used'),
    (r'\bStrange\b', 'Strange'),
    (r'\bboy\b', 'boy'),
    (r'\bBOY\b', 'BOY'),
    (r'\bItem-Lager', 'Item-Lager'),
    (r'\bPrism@', 'Prism'),
    (r'\bNothing@', 'Nothing'),
    (r'\bSILVER@', 'SILVER default'),
    (r'\bRalph@', 'Ralph'),
    (r'Trug die', 'trug'),
    (r'trug die', 'trug'),
    (r'Gegnerisches', 'Gegnerisches'),
    (r'Ballonschw', 'Ballonschw'),
    (r'Wie heißt Rivale', 'Rivale naming'),
    (r'Fremder', 'Fremder'),
    (r'\bHealth\b', 'Health'),
    (r'\bAttack\b', 'Attack EN'),
    (r'\bDefense\b', 'Defense EN'),
    (r'\bSpeed\b', 'Speed EN'),
    (r'\bSave the game\b', 'Save EN'),
    (r'\bWould you\b', 'Would you'),
    (r'\bWhat\?', 'What?'),
    (r'\bHow about\b', 'How about'),
    (r'\bLet\'s\b', "Let's"),
    (r'\bThanks\b', 'Thanks'),
    (r'\bPlease\b', 'Please'),
    (r'\bHello\b', 'Hello'),
    (r'\bGoodbye\b', 'Goodbye'),
    (r'\bSorry\b', 'Sorry'),
]

text_re = re.compile(r'(?:text|line|cont|para|next|rawchar|db\s+|li\s+)\s+"([^"]*)"')

hits = []
for root in [Path('data'), Path('maps'), Path('engine'), Path('home')]:
    for p in root.rglob('*.asm'):
        if 'backup' in str(p).lower():
            continue
        t = p.read_text(encoding='utf-8', errors='replace')
        for i, line in enumerate(t.splitlines(), 1):
            if line.strip().startswith(';'):
                continue
            for m in text_re.finditer(line):
                s = m.group(1)
                for pat, label in PATS:
                    if label is None:
                        continue
                    if re.search(pat, s):
                        hits.append((label, str(p), i, s))
                        break

# group by label
from collections import defaultdict
g = defaultdict(list)
for h in hits:
    g[h[0]].append(h)

print("=== BY CATEGORY ===")
for k in sorted(g.keys(), key=lambda x: -len(g[x])):
    print(f"\n## {k} ({len(g[k])})")
    for label,p,i,s in g[k][:12]:
        print(f"  {p}:{i}: {s}")
    if len(g[k]) > 12:
        print(f"  ... +{len(g[k])-12} more")
print(f"\nTOTAL {len(hits)}")
