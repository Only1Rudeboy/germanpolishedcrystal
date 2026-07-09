; These are in the same order as InitialOptions_CallOptionRoutine.Pointers,
; not the *_OPT bit order.
InitialOptionDescriptions:
	table_width 2
	dw .Natures
	dw .Abilities
	dw .PSS
	dw .EVs
	dw .Experience
	dw .AffectionBonus
	dw .RTC
	dw .PerfectIVs
	dw .TradedMon
	dw .EvolveInBattle
	dw .ColorVariation
	assert_table_length NUM_INITIAL_MENU_OPTIONS

.Natures:
	text "Wesen erhöhen"
	line "einen"
	line "Wert, senken aber"
	cont "einen anderen um"
	cont "10%."

	para "Eingeführt in"
	line "Gen. 3."
	prompt

.Abilities:
	text "Fähigkeiten"
	line "wirken"
	line "im Kampf und"

	para "auch außerhalb"
	line "davon."

	para "Eingeführt in"
	line "Gen. 3."
	prompt

.PSS:
	text "Attacken sind"
	line "physisch oder"
	cont "speziell"
	cont "unabhängig"
	cont "vom Typ."

	para "Eingeführt in"
	line "Gen. 4."
	prompt

.EVs:
	assert MODERN_MAX_EV % 4 == 0
	text "Basis-PS erhöhen"
	line STRFMT("Werte um bis zu %d", MODERN_MAX_EV / 4) ; 252 / 4 == 63
	cont "Punkte, je 4"
	cont "Basis-PS einer."

	para "Du kannst jeden"
	line "Wert auf"
	cont "{d:MODERN_MAX_EV}"
	line "Basis-PS setzen,"
	cont "wie früher die"
	cont "Basis-PS-EP,"

	para "oder sie auf"
	line "insgesamt"
	cont "{d:MODERN_EV_LIMIT}"
	cont "begrenzen."

	para "Ersetzte die"
	line "Basis-PS-EP in"
	cont "Gen. 3."
	prompt

.Experience:
	text "Die alte EP-"
	line "Formel von Gen. 1"
	cont "bis Gen. 4 war"
	cont "unskaliert."

	para "Die neue Formel"
	line "ab"
	line "Gen. 5 (wieder in"
	cont "Gen. 7) gibt mehr"
	cont "EP für stärkere"
	cont "Gegner und"
	cont "weniger"
	cont "für schwächere."

	para "EP-Zuwachs kann"
	line "auch"
	cont "ausgeschaltet"
	cont "werden, aber"

	para "EP-Bonbons und"
	line "Sonderbonbons"
	cont "funktionieren"
	cont "noch."
	prompt

.AffectionBonus:
	text "Deine #mon"
	line "profitieren im"
	cont "Kampf, wenn sie"

	para "gute Freunde mit"
	line "dir sind."

	para "Eingeführt in"
	line "Gen. 6."
	prompt

.RTC:
	text "Nutze die"
	line "Echtzeit-"
	line "uhr, um die Zeit"
	cont "zu verfolgen."

	para "Wenn dein Modul"
	line "oder Emulator die"
	cont "Echtzeituhr nicht"
	cont "unterstützt,"

	assert 24 % NO_RTC_SPEEDUP == 0
	para "deaktiviere dies,"
	line "damit ein"
	cont "Spieltag"
	cont STRFMT("%d Stunden dauert.", 24 / NO_RTC_SPEEDUP) ; 24 / 6 == 4
	prompt

.PerfectIVs:
	text "Werte werden so"
	line "berechnet, als"
	cont "wären"
	cont "die DVs perfekt"
	cont "15,"
	cont "für deine #mon"
	cont "und Gegner."
	prompt

.TradedMon:
	text "Getauschte #mon"
	line "gehorchen dir und"
	cont "können Spitznamen"
	cont "bekommen,"

	para "aber EP werden"
	line "nicht verstärkt."
	prompt

.EvolveInBattle:
	text "Deine #mon können"
	line "sich während"
	cont "Trainerkämpfen"
	cont "entwickeln."

	para "Inspiriert von"
	line "Anime-Kämpfen."
	prompt

.ColorVariation:
	text "Einzelne #mon,"
	line "normal und shiny,"
	cont "erhalten leicht"
	cont "abweichende"
	cont "Farben."

	para "Die Variation ist"
	line "zufallsbasiert"
	cont "und"

	para "nicht mit der"
	line "Wertequalität"
	cont "verbunden."

	para "Inspiriert von"
	line "Stadiums Farb-"
	cont "variation durch"
	cont "Spitznamen."
	prompt

InitialOptionsDoneDescription:
	text "Speichere deine"
	line "Wahl und spiele"
	cont "los!"
	prompt