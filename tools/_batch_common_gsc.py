# -*- coding: utf-8 -*-
from pathlib import Path
p = Path("data/text/common.asm")
t = p.read_text(encoding="utf-8")
orig = t
repls = [
('''_WouldYouLikeToSaveTheGameText::
	text "Möchtest du dein"
	line "Spiel speichern?"
	done''',
'''_WouldYouLikeToSaveTheGameText::
	; GSC: SICHERN
	text "Möchtest du das"
	line "Spiel SICHERN?"
	done'''),

('''_SavedTheGameText::
	text "<PLAYER> speicherte"
	line "das Spiel."
	done''',
'''_SavedTheGameText::
	; GSC
	text "<PLAYER> hat das"
	line "Spiel gesichert."
	done'''),
]
# flexible for PC texts - search patterns
import re

# schaltete -> schaltet
t = t.replace(
'''	text "<PLAYER> schaltete"
	line "den PC ein."''',
'''	text "<PLAYER> schaltet"
	line "den PC ein."''')

# Item-Lager-System -> ITEM-LAGERUNGS-SYSTEM  
t = t.replace("Item-Lager-System", "ITEM-LAGERUNGS-SYSTEM")
t = t.replace("im Item-Lager!", "im ITEM-LAGER!")

n = 0
for old, new in repls:
    if old in t:
        t = t.replace(old, new, 1)
        n += 1
    else:
        print("MISS common:", old[:40])

p.write_text(t, encoding="utf-8")
print("common applied", n, "changed", t!=orig)
