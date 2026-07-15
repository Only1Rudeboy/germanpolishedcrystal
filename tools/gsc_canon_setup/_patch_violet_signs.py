# -*- coding: utf-8 -*-
from pathlib import Path

p = Path(__file__).resolve().parents[2] / "maps" / "VioletCity.asm"
t = p.read_text(encoding="utf-8")

# Gym sign
old_gym = """VioletGymSignText:
	text "PKMN-ARENA von"
	line "VIOLA CITY"
	cont "LEITUNG: FALK"
	para "Der elegante"
	line "Meister der Flug-"
	cont "#mon"
	done"""
new_gym = """VioletGymSignText:
	text "PKMN-ARENA von"
	line "VIOLA CITY"

	para "LEITUNG: FALK"
	line "Der elegante"

	para "Meister der Flug-"
	line "#MON"
	done"""

old_sprout = """SproutTowerSignText:
	text "KNOFENSA-TURM"

	para "Erfahre die Art"
	line "der #mon"
	done"""
new_sprout = """SproutTowerSignText:
	text "KNOFENSA-TURM"

	para "Erfahre die Art"
	line "der #MON"
	done"""

old_earl = """EarlsPokemonAcademySignText:
	text "EARLs"
	line "#mon-AKADEMIE"
	done"""
new_earl = """EarlsPokemonAcademySignText:
	text "EARLs #-"
	line "MON-AKADEMIE"
	done"""

for name, old, new in [
    ("gym", old_gym, new_gym),
    ("sprout", old_sprout, new_sprout),
    ("earl", old_earl, new_earl),
]:
    if old in t:
        t = t.replace(old, new)
        print("ok", name)
    else:
        print("fail", name)

# Gramps dump-ish
t = t.replace(
    "FALK von der #mon-Arena in Viola City",
    "FALK von der PKMN-ARENA in VIOLA CITY",
)
t = t.replace(
    "FALK von der #mon-Arena",
    "FALK von der PKMN-ARENA",
)

p.write_text(t, encoding="utf-8", newline="\n")
print("written")
