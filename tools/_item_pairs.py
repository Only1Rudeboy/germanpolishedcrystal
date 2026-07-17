# -*- coding: utf-8 -*-
from pathlib import Path
import re, json

# Get item const order exactly like pret (skip NO_ITEM for names? names start with Parkball)
const = Path("constants/item_constants.asm").read_text(encoding="utf-8")
# Find const_def for items
lines = const.splitlines()
order = []
started = False
for line in lines:
    if re.match(r'\s*const\s+NO_ITEM\b', line):
        started = True
        order.append("NO_ITEM")
        continue
    if not started:
        continue
    m = re.match(r'\s*const\s+([A-Z][A-Z0-9_]*)', line)
    if m:
        c = m.group(1)
        if c.startswith("NUM_") or c == "ITEM_C" or c.startswith("USE_"):
            break
        if c.startswith("TM_") or c == "TM01" or "TM_DYNAMIC" in c:
            # TMs might still be items
            pass
        if c.startswith("NAM_"):
            break
        order.append(c)
    # stop at first non-const after items section if we hit "const_def" again
    if started and line.strip().startswith("const_def") and "NO_ITEM" not in line:
        break
    if started and "NUM_ITEMS" in line:
        # include until NUM_ITEMS
        break

# Better: read until NUM_ITEMS
order = []
started = False
for line in lines:
    m = re.match(r'\s*const\s+([A-Z][A-Z0-9_]*)', line)
    if not m:
        if started and ("NUM_ITEMS" in line or "add_tm" in line or "add_hm" in line):
            break
        continue
    c = m.group(1)
    if c == "NO_ITEM":
        started = True
        order.append(c)
        continue
    if not started:
        continue
    if c.startswith("NAM_"):
        break
    if c == "NUM_ITEMS":
        break
    # stop before TMs if separate
    if c.startswith("TM_") or c.startswith("HM_"):
        break
    order.append(c)

names = Path("data/items/names.asm").read_text(encoding="utf-8")
li = re.findall(r'li\s+"([^"]*)"', names)
# names typically skip NO_ITEM
print("first consts", order[:15])
print("first names", li[:15])
print(f"n_const_noitem={len(order)} n_li={len(li)}")

# If NO_ITEM is first const, names align to order[1:]
if order and order[0] == "NO_ITEM":
    paired = list(zip(order[1:], li))
else:
    paired = list(zip(order, li))
print(f"paired {len(paired)}")

items = json.loads(Path("tools/canon_names/items.json").read_text(encoding="utf-8"))

def slug(c):
    return c.lower().replace("_","-").replace("-i","").replace("blackbelt-i","black-belt").replace("metronome-i","metronome")

# Manual slug fixes
SLUG = {
    "POKE_BALL": "poke-ball",
    "BLACKBELT_I": "black-belt",
    "BLACKGLASSES": "black-glasses",
    "SILVERPOWDER": "silver-powder",
    "TWISTEDSPOON": "twisted-spoon",
    "NEVERMELTICE": "never-melt-ice",
    "UP_GRADE": "up-grade",
    "PARALYZEHEAL": "paralyze-heal",
    "ENERGYPOWDER": "energy-powder",
    "ENERGY_ROOT": "energy-root",
    "X_DEFEND": "x-defense",
    "X_SP_ATK": "x-sp-atk",
    "X_SP_DEF": "x-sp-def",
    "METRONOME_I": "metronome",
    "SAFE_GOGGLES": "safety-goggles",
    "PROTECT_PADS": "protective-pads",
    "HEAVY_BOOTS": "heavy-duty-boots",
    "BLUNDRPOLICY": "blunder-policy",
    "SQUIRTBOTTLE": "squirt-bottle",
    "ITEMFINDER": "itemfinder",
    "S_S_TICKET": "ss-ticket",
    "TINYMUSHROOM": "tiny-mushroom",
    "BIG_MUSHROOM": "big-mushroom",
    "BALMMUSHROOM": "balm-mushroom",
    "SLOWPOKETAIL": "slowpoke-tail",
    "DEEPSEATOOTH": "deep-sea-tooth",
    "DEEPSEASCALE": "deep-sea-scale",
    "SOUL_DEW": "soul-dew",
    "LIGHT_BALL": "light-ball",
    "LUCKY_PUNCH": "lucky-punch",
    "THICK_CLUB": "thick-club",
    "STICK": "leek",
    "BERRY": "oran-berry",  # old
}

# Print all paired with official when differ
print("\n=== DIFF (const, current, official_de) ===")
diffs = []
for c, cur in paired:
    s = SLUG.get(c, c.lower().replace("_","-"))
    info = items.get(s)
    de = None
    if info:
        de = info.get("name_de")
    if de and de != cur:
        # normalize
        if de.replace("é","e").lower() != cur.replace("é","e").lower():
            diffs.append((c, cur, de, len(de)))

# focus on broken/truncated
broken = []
for c, cur, de, ln in diffs:
    if any(x in cur for x in ["Trödel","Schicksalb","Wechselpz","Schutzpol","Zimmer","Seltenk","Erinner","SpezAng","SpezVer","Fähig","Lebensorb","Eisenball","Fessel","Auswechsel","Schwäche","Sturmw","Kehl","Fluchtp","Fehler","Schnellst","Wahlglas","Feuerorb","Giftorb","Giftschlamm","Rätsel","Glitzer","Ballon"]) or ln > 12 or len(cur) >= 10 and cur[-1] not in "aeiouäöüAEIOUÄÖÜ.l":
        broken.append((c, cur, de, ln))

print(f"total diffs {len(diffs)}, focus {len(broken)}")
for row in broken[:80]:
    print(f"{row[0]:22} | {row[1]:14} | {row[2]:16} | {row[3]}")

# Write full paired CSV for manual
out = Path("tools/_item_name_pairs.txt")
with out.open("w", encoding="utf-8") as f:
    for c, cur in paired:
        s = SLUG.get(c, c.lower().replace("_","-"))
        info = items.get(s)
        de = info.get("name_de") if info else ""
        flag = "DIFF" if de and de != cur else ("OK" if de else "NOJSON")
        f.write(f"{flag}\t{c}\t{cur}\t{de}\t{len(de) if de else 0}\n")
print("wrote", out)
# show focus section around held items by printing lines 200-240 of pairs
print("\n=== pairs sample around mid ===")
for i, (c, cur) in enumerate(paired):
    if i < 180 or i > 250:
        continue
    s = SLUG.get(c, c.lower().replace("_","-"))
    de = (items.get(s) or {}).get("name_de","")
    print(f"{i:3d} {c:22} {cur:14} | {de}")
