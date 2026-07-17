# -*- coding: utf-8 -*-
"""Deep item name audit: length, truncations, GSC dump, official DE."""
from pathlib import Path
import re, json

ITEM_NAME_MAX = 12  # ITEM_NAME_LENGTH 13 incl @

# Parse current names.asm
names_path = Path("data/items/names.asm")
text = names_path.read_text(encoding="utf-8")
# li "Name" or li "#BALL" etc
entries = []
for i, line in enumerate(text.splitlines(), 1):
    m = re.match(r'\s*li\s+"([^"]*)"', line)
    if m:
        entries.append((i, m.group(1)))

print(f"ITEM_COUNT {len(entries)}")

# Length issues
print("\n=== OVER MAX LENGTH (>12) ===")
for i, n in entries:
    # # expands to 1 or 4? for display #MON=4, # alone often 1 in items #BALL
    disp = n.replace("#MON", "####").replace("#mon", "####")
    # #BALL style: # is 1
    if len(disp) > 12:
        print(f"  L{i} len={len(disp)}: {n!r}")

print("\n=== SUSPICIOUS TRUNCATION (ends mid-word / no vowel end / 10-12 cut) ===")
# heuristic: ends with consonant cluster without period, length 9-12, looks cut
for i, n in entries:
    if n.endswith(".") or n.endswith("@"):
        continue
    if len(n) >= 9 and not re.search(r'[aeiouäöüAEIOUÄÖÜ]$', n) and not n.endswith(("ball","Ball","trank","Trank","stein","Stein","beere","Beere","flöte","Flöte","flügel","Flügel","saft","Saft","staub","Staub","band","Band","kapsel","Kapsel","orb","Orb","weste","Weste","glas","Glas","pakt","Pakt","pack","Pack","spray","Spray","root","Root","disk","Disk","disc","Disc","punch","Punch","grade","Grade","powder","Powder","weight","Weight")):
        # exclude known full words
        if n in ("Masterball","Hyperball","Superball","Pokéball","Freizeitball","Netzball","Tauchball","Nestball","Wiederball","Timerball","Luxusball","Premierball","Heilball","Flottball","Dämmerball","Traumball","Jubelball"):
            continue
        print(f"  L{i} len={len(n)}: {n!r}")

# GSC dump item-like ALLCAPS ending @
dump = Path("tools/_gsc_de_crystal_msg.txt").read_text(encoding="utf-8", errors="replace")
# extract short ALLCAPS item names from dump
gsc_items = set()
for m in re.finditer(r'^([A-ZÄÖÜ][A-ZÄÖÜa-zäöüß\- #]{1,20})@\s*$', dump, re.M):
    gsc_items.add(m.group(1).strip())
# also from known GSC item block patterns
for m in re.finditer(r'([A-ZÄÖÜ#][A-ZÄÖÜ\- ]{2,18})@', dump):
    s = m.group(1).strip()
    if 3 <= len(s) <= 13 and s.isupper() or s.startswith("#"):
        gsc_items.add(s)

print(f"\nGSC_ITEM_CANDIDATES {len(gsc_items)}")

# Load official if present
off = {}
for cand in [
    Path("tools/canon_names/items.json"),
    Path("tools/canon_names/item_names.json"),
    Path("tools/canon_names/de_items.json"),
]:
    if cand.exists():
        data = json.loads(cand.read_text(encoding="utf-8"))
        print(f"loaded {cand} type={type(data)}")
        if isinstance(data, dict):
            off = data
        elif isinstance(data, list):
            for row in data:
                if isinstance(row, dict):
                    en = row.get("en") or row.get("english") or row.get("name_en")
                    de = row.get("de") or row.get("german") or row.get("name_de") or row.get("localized_name")
                    if en and de:
                        off[en] = de
        break

print(f"OFFICIAL_MAP {len(off)}")
if off:
    # sample keys
    for k in list(off.keys())[:5]:
        print(" sample", k, "->", off[k] if not isinstance(off[k], dict) else list(off[k].keys())[:3])

# Print all current names for review
print("\n=== ALL CURRENT NAMES ===")
for i, n in entries:
    print(f"{i:4d}|{len(n):2d}|{n}")
