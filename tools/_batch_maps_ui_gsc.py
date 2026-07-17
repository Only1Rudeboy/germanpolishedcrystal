# -*- coding: utf-8 -*-
from pathlib import Path

# 1 Mom Baby
p = Path("maps/PlayersHouse1F.asm")
t = p.read_text(encoding="utf-8")
if "Schatz!" in t and "Beeile dich" in t:
    t = t.replace(
'''	text "Beeile dich,"
	line "Schatz!"''',
'''	; GSC: Baby!
	text "Beeile dich,"
	line "Baby!"''', 1)
    p.write_text(t, encoding="utf-8")
    print("Mom OK")
else:
    # search
    for i, line in enumerate(t.splitlines(), 1):
        if "Schatz" in line or "Beeile" in line:
            print(i, line)

# 2 DarkCave Falkner
p = Path("maps/DarkCaveVioletEntrance.asm")
t = p.read_text(encoding="utf-8")
t2 = t
t2 = t2.replace("Pidgeotto!", "TAUBOGA!")
t2 = t2.replace("Pidgeotto.", "TAUBOGA.")
t2 = t2.replace("Pidgeotto", "TAUBOGA")
t2 = t2.replace("Viola City.", "VIOLA CITY.")
t2 = t2.replace("Viola City", "VIOLA CITY")
t2 = t2.replace("Arenaleiter von", "ARENALEITER von")
# Flügelschlag already DE?
if t2 != t:
    p.write_text(t2, encoding="utf-8")
    print("DarkCave OK")
else:
    print("DarkCave no change")

# 3 pokedex EN UI
p = Path("engine/pokedex/pokedex.asm")
t = p.read_text(encoding="utf-8")
t2 = t.replace('" Results/  @"', '" Treffer/  @"')
t2 = t2.replace('"by Name  @"', '"n. Name  @"')
if t2 != t:
    p.write_text(t2, encoding="utf-8")
    print("Pokedex UI OK")
else:
    print("Pokedex search")
    for i, line in enumerate(t.splitlines(), 1):
        if "Results" in line or "by Name" in line:
            print(i, line)

# 4 Nurse std_text - partial
p = Path("data/text/std_text.asm")
t = p.read_text(encoding="utf-8")
# find nurse heal strings
for i, line in enumerate(t.splitlines(), 1):
    if "heile" in line.lower() or "topfit" in line.lower() or "voll." in line:
        if i < 150:
            print(f"nurse {i}: {line}")

# 5 Buena / tiffany sorry restore GSC
for rel, old, new in [
    ("data/phone/text/buena.asm", 'line "Falsch verbunden!"', 'line "Sorry, verwählt!"'),
    ("data/phone/text/tiffany_caller.asm", 'line "Oh, sorry! Ich war"', None),  # already has sorry
]:
    p = Path(rel)
    if not p.exists():
        continue
    t = p.read_text(encoding="utf-8")
    if old in t and new:
        p.write_text(t.replace(old, new, 1), encoding="utf-8")
        print("fixed", rel)
    elif "Falsch verbunden" in t:
        print("found Falsch", rel)

# 6 start menu SICHERN etc
p = Path("engine/menus/start_menu.asm")
t = p.read_text(encoding="utf-8")
t2 = t
t2 = t2.replace('db "Sichern@"', 'db "SICHERN@"')
t2 = t2.replace('db "Optionen@"', 'db "OPTION@"')
t2 = t2.replace('db "Ende@"', 'db "ZURÜCK@"')
t2 = t2.replace('db "Beutel@"', 'db "BEUTEL@"')
t2 = t2.replace('db "#dex@"', 'db "#DEX@"')
if t2 != t:
    p.write_text(t2, encoding="utf-8")
    print("Start menu OK")
else:
    print("Start menu no change")
    for i, line in enumerate(t.splitlines(), 1):
        if "Sichern" in line or "Optionen" in line or "Beutel" in line or "#dex" in line:
            print(i, line)
