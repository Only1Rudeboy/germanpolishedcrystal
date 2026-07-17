# -*- coding: utf-8 -*-
"""Apply careful item name fixes: official DE, max 12 display chars."""
from pathlib import Path
import re

p = Path("data/items/names.asm")
t = p.read_text(encoding="utf-8")
orig = t

# Exact string replacements (unique names)
# Format: old -> new (must be unique in file)
REPL = {
    # Balls (official DE modern / GSC-near)
    "Erinnerball": "Jubelball",       # Cherish Ball
    "Blitzball": "Flottball",         # Quick Ball official
    # X-items
    "X-SpezAngr": "X-Sp.Ang.",
    "X-SpezVert": "X-Sp.Vert",
    "X-Treffer": "X-Genauig.",        # X Accuracy (was wrong as Treffer)
    # Ability
    "Fähigkapsel": "Fähigk.Kaps.",    # Ability Capsule
    "Fähig-Patch": "Fähig.Pflast.",   # Ability Patch - 12 chars
    # Held items - critical truncations / wrong names
    "Kuschelglo": "Sanftglocke",      # Soothe Bell
    "Muschelglo": "Muschelgl.",       # Shell Bell (Muschelglocke=13)
    "Lebensorb": "Leben-Orb",
    "Trödelschw": "Schwerschw.",      # Lagging Tail (Schwerschweif=13)
    "Schicksalb": "Fatumknoten",      # Destiny Knot
    "Fesselklaue": "Griffklaue",      # Grip Claw
    "Wechselpz": "Wechselhülle",      # Shed Shell
    "Sogwurzel": "Großwurzel",        # Big Root
    "Wehrstein": "Beulenhelm",        # Rocky Helmet
    "Ballon": "Luftballon",           # Air Balloon
    "Bindeband": "Klammerband",       # Binding Band
    "Auswechsler": "Fluchtknopf",     # Eject Button
    "Schwächepakt": "Schwächensch.",  # Weakness Policy (14->12)
    "Sturmweste": "Offensivw.",       # Assault Vest (13->10)
    "Schutzpols": "Schutzpolst.",     # Protective Pads (13->12)
    "Kehlspray": "Halsspray",
    "Fluchtpack": "Fluchttasche",     # Eject Pack
    "Wehrstiefel": "Plateausch.",     # Heavy-Duty Boots
    "Fehlerpakt": "Fehlschlags.",     # Blunder Policy
    "Zimmerserv": "Bizarroserv.",     # Room Service
    "Klarumulett": "Klaramulett",     # Clear Amulet
    "Zinkwürfel": "Gezinkwürfel",     # Loaded Dice
    "Schnellstaub": "Flottstaub",
    "Weitlinse": "Großlinse",
    "Seelenkraut": "Mentalkraut",
    "Kraftkraut": "Energiekraut",
    "Weißkraut": "Schlohkraut",
    "Feuchtstein": "Nassbrocken",
    "Hitzestein": "Heißbrocken",
    "Glattstein": "Glattbrocken",
    "Kaltstein": "Eisbrocken",
    "Wahlglas": "Wahlbrille",
    "Feuerorb": "Heiß-Orb",
    "Giftorb": "Toxik-Orb",
    "Giftschlamm": "Giftschleim",
    "Machoarmband": "Machoband",
    "Kraftgewicht": "Machtgewicht",
    "Kraftarmband": "Machtreif",
    "Kraftgurt": "Machtgurt",
    "Kraftlinse": "Machtlinse",
    "Kraftband": "Machtband",
    "Kraftfußband": "Machtkette",
    "Rätseldisk": "Dubiosdisc",
    "Protektor": "Schützer",
    "Elektrisator": "Stromisierer",
    "Magmatisator": "Magmaisierer",
    "Seltenknoc": "Steinknochen",
    "Flegmonrute": "Flegmon-Rute",
    "Bernstein": "Altbernstein",
    "Glitzerbonbon": "Glitzerbonb.",  # was 13
    # Type boost glass
    "Schattenglas": "Schattenbril.",  # BlackGlasses official Schattenbrille=14
    "Hackattack": "Hackattack",       # keep GSC
    "Scope-Linse": "Scope-Linse",     # keep
    # Boxhandschuh already OK
}

# Apply only as full li "..." replacements to avoid partial hits
applied = []
for old, new in REPL.items():
    if old == new:
        continue
    # verify length
    if len(new) > 12:
        print(f"TOO LONG skip {new} ({len(new)})")
        continue
    old_li = f'li "{old}"'
    new_li = f'li "{new}"'
    if old_li not in t:
        print(f"MISS {old}")
        continue
    # count occurrences
    c = t.count(old_li)
    if c != 1:
        print(f"AMBIG {old} count={c}")
        # still replace all if same meaning
    t = t.replace(old_li, new_li)
    applied.append((old, new, len(new)))

p.write_text(t, encoding="utf-8")
print(f"\nApplied {len(applied)} renames:")
for a in applied:
    print(f"  {a[0]:14} -> {a[1]:14} ({a[2]})")

# Verify no name > 12
import re
overs = []
for m in re.finditer(r'li\s+"([^"]*)"', t):
    n = m.group(1)
    if len(n) > 12:
        overs.append(n)
print("OVER12:", overs)

# Verify critical gone
for bad in ["Trödelschw", "Schicksalb", "Wechselpz", "Schutzpols", "Zimmerserv", "Seltenknoc", "Erinnerball", "Glitzerbonbon", "Ballon"]:
    if f'li "{bad}"' in t:
        print("STILL HAS", bad)
    else:
        print("gone", bad)
