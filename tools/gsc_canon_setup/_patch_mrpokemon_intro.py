# -*- coding: utf-8 -*-
from pathlib import Path

p = Path(__file__).resolve().parents[2] / "maps" / "MrPokemonsHouse.asm"
t = p.read_text(encoding="utf-8")

new_block = '''MrPokemonIntroText1:
	text "Hallo! Du musst"
	line "<PLAYER> sein."

	para "PROF. LIND sagte,"
	line "dass du vorbei-"
	cont "kommen würdest."
	done

MrPokemonIntroText2:
	text "PROF. LIND soll"
	line "das hier unter-"
	cont "suchen."
	done

MrPokemonIntroText3:
	text "Ich kenne ein"
	line "Paar, das eine"
	cont "#MON-PENSION"
	cont "leitet."

	para "Sie gaben mir"
	line "das EI."

	para "Ich war derart"
	line "fasziniert, dass"
	cont "ich PROF. LIND ei-"
	cont "ne E-Mail schrieb."

	para "Was die Entwick-"
	line "lung von #MON"
	cont "betrifft, ist"
	cont "PROF. LIND eine"
	cont "Kapazität."
	done
'''

import re
pat = re.compile(
    r"MrPokemonIntroText1:.*?MrPokemonIntroText4:",
    re.S,
)
m = pat.search(t)
if not m:
    raise SystemExit("block not found")
t2 = t[: m.start()] + new_block + "\n\nMrPokemonIntroText4:" + t[m.end() :]
# fix double MrPokemonIntroText4 if any
t2 = t2.replace("MrPokemonIntroText4:\nMrPokemonIntroText4:", "MrPokemonIntroText4:")
p.write_text(t2, encoding="utf-8", newline="\n")
print("patched", p)
