# -*- coding: utf-8 -*-
from pathlib import Path
import re

battle = Path("data/text/battle.asm").read_text(encoding="utf-8")
# Find remaining non-GSC terms
needles = ["Abbild", "Zukunftssicht", "gesperrt", "Egelsamen", "Bodyguard", "Weißnebel",
           "Lichtschild", "Reflektor", "Zugabe", "putscht", "skizziert", "stiehlt",
           "wich aus", "wappnet", "blies Stacheln", "warf Egelsamen", "floh!",
           "kämpft schon", "zurück!", "Traf ", "schläft!", "einfrieren"]
print("=== BATTLE REMAINING TERMS ===")
for n in needles:
    if n in battle:
        for i, line in enumerate(battle.splitlines(), 1):
            if n in line and not line.strip().startswith(";"):
                print(f"  {i}: {line.strip()}  [{n}]")

# Map place issues
print("\n=== MAP PLACE CASE ===")
pats = [
    (r'Viola City', 'VIOLA CITY'),
    (r'viola city', 'VIOLA CITY'),
    (r'Dukatia City', 'DUKATIA CITY'),
    (r'Dukatia', 'DUKATIA'),
    (r'Neuborkia', 'NEUBORKIA'),
    (r'Rosalia City', 'ROSALIA CITY'),
    (r'Rosalia', 'ROSALIA'),
    (r'Azalea City', 'AZALEA CITY'),
    (r'Ebenholz City', 'EBENHOLZ CITY'),
    (r'Teak City', 'TEAK CITY'),
    (r'Anemonia City', 'ANEMONIA CITY'),
    (r'Oliviana City', 'OLIVIANA CITY'),
    (r'Marmoria City', 'MARMORIA CITY'),
    (r'Pidgeotto', 'TAUBOGA'),
    (r'Rattata', 'RATTFRATZ'),
    (r'Icognito', 'ICOGNITO'),
    (r'#-Com', '#COM'),
    (r'#MON-Center', '#MON-CENTER'),
    (r'#mon-Center', '#MON-CENTER'),
    (r'Erweiterte Tipps', 'Profi-Tipps'),
    (r'Arenaleiter', 'ARENALEITER'),
    (r'Arenaleiterin', 'ARENALEITERIN'),
]
from collections import defaultdict
hits = defaultdict(list)
for p in Path("maps").glob("*.asm"):
    t = p.read_text(encoding="utf-8", errors="replace")
    for i, line in enumerate(t.splitlines(), 1):
        if line.strip().startswith(";"):
            continue
        if not re.search(r'(text|line|cont|para|next)\s+"', line):
            continue
        for pat, fix in pats:
            if re.search(pat, line):
                # skip if already allcaps version of same
                if fix in line and pat.lower() not in ['arenaleiter', 'arenaleiterin']:
                    # still count lowercase variants only
                    if pat[0].islower() or (pat[0].isupper() and pat != fix and pat not in line.replace(fix, '')):
                        pass
                hits[pat].append((str(p), i, line.strip()[:100], fix))

for pat, rows in sorted(hits.items(), key=lambda x: -len(x[1])):
    print(f"\n## {pat} -> {rows[0][3]} ({len(rows)})")
    for p,i,line,fix in rows[:8]:
        print(f"  {p}:{i}: {line}")
    if len(rows) > 8:
        print(f"  ... +{len(rows)-8}")
print(f"\nTOTAL_HITS {sum(len(v) for v in hits.values())}")
