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
	text "Wesen: +10% auf"
	line "einen Wert, -10%"
	cont "auf einen anderen."

	para "Eingeführt in Gen."
	line "3."
	prompt

.Abilities:
	text "Fähigkeiten wirken"
	line "im Kampf und oft"
	cont "auch außerhalb."

	para "Eingeführt in Gen."
	line "3."
	prompt

.PSS:
	text "Attacken sind"
	line "physisch oder"
	cont "speziell - nicht"
	cont "mehr nach Typ."

	para "Eingeführt in Gen."
	line "4."
	prompt

.EVs:
	assert MODERN_MAX_EV % 4 == 0
	text "Fleiß-Punkte (FP)"
	line "aus Kämpfen er-"
	cont "höhen Statuswerte."
	cont "Je 4 FP geben +1."

	para "Alle: pro Stat bis"
	line STRFMT("%d FP.", MODERN_MAX_EV)

	para "{d:MODERN_EV_LIMIT}: max."
	line "{d:MODERN_EV_LIMIT} FP"
	cont "insgesamt."

	para "Nein: keine FP."
	line "Ersetzten KP-EP"
	cont "ab Gen. 3."
	prompt

.Experience:
	text "Alt: EP-Formel"
	line "wie Gen. 1-4"
	cont "(ohne Skalierung)."

	para "Neu: ab Gen. 5"
	line "mehr EP gegen"
	cont "stärkere Gegner,"
	cont "weniger gegen"
	cont "schwächere."

	para "Nein: keine EP"
	line "aus Kämpfen."
	cont "Bonbons und"
	cont "Sonderbonbons"
	cont "wirken weiter."
	prompt

.AffectionBonus:
	text "Deine #MON"
	line "bekommen Kampf-"
	cont "vorteile, wenn"

	para "sie dich gut"
	line "mögen (Zuneigung)."

	para "Eingeführt in Gen."
	line "6."
	prompt

.RTC:
	text "Echtzeituhr für"
	line "Tageszeit und"
	cont "Ereignisse."

	para "Ohne RTC im Emula-"
	line "tor: abschalten,"
	assert 24 % NO_RTC_SPEEDUP == 0
	cont "dann dauert ein"
	cont "Spieltag"
	cont STRFMT("%d Stunden.", 24 / NO_RTC_SPEEDUP)
	prompt

.PerfectIVs:
	; Gen 2 DVs are 0-15; code forces DV=$F when on
	text "Statuswerte so,"
	line "als hätten alle"

	para "#MON in jedem"
	line "Wert den maxi-"
	cont "malen DV (0-15:"
	cont "hier immer 15)."

	para "Gilt für dein Team"
	line "und Gegner."
	prompt

.TradedMon:
	text "Getauschte #MON"
	line "gehorchen dir und"
	cont "dürfen Spitznamen"
	cont "bekommen."

	para "Kein Extra-EP für"
	line "Tausch-#MON."
	prompt

.EvolveInBattle:
	text "Deine #MON"
	line "können sich im"
	cont "Trainerkampf"
	cont "entwickeln."

	para "Inspiriert vom"
	line "Anime."
	prompt

.ColorVariation:
	text "Einzelne #MON"
	line "(normal und shiny)"
	cont "bekommen leicht"
	cont "andere Farben."

	para "Zufällig - nicht"
	line "an DV-Qualität"
	cont "gekoppelt."

	para "Idee: Stadium-"
	line "Farbvariation."
	prompt

InitialOptionsDoneDescription:
	text "Einstellungen"
	line "sichern und das"
	cont "Spiel starten!"
	prompt
