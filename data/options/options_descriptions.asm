OptionsDescriptions:
	table_width 2
	dw .TextSpeed
	dw .TextAutoscroll
	dw .Frame
	dw .Typeface
	dw .Keyboard
	dw .Sound
	dw .BattleEffects
	dw .BattleStyle
	dw .Nicknames
	dw .RunningShoes
	dw .TurningSpeed
	dw .ClockFormat
	dw .PokedexUnits
	assert_table_length NUM_OPTIONS

.TextSpeed:
	text "Wie schnell Text"
	line "angezeigt wird."
	prompt

.TextAutoscroll:
	text "Text scrollt"
	line "auto-"
	line "matisch weiter,"
	cont "wenn du Taste(n)"
	cont "gedrückt hältst."
	prompt

.Frame:
	text "Der Rahmen um"
	line "die meisten"
	cont "Textfelder."
	prompt

.Typeface:
	text "Die Schriftart"
	line "für"
	line "normalen Text."
	prompt

.Keyboard:
	text "Das"
	line "Tastaturlayout"
	line "zum Eingeben von"
	cont "Namen und Post."
	prompt

.Sound:
	text "Audioausgabe:"
	line "Mono (ein Kanal)"

	para "oder Stereo"
	line "(zwei,"
	line "links und"
	cont "rechts)."
	prompt

.BattleEffects:
	text "Attacken- und"
	line "Status-"
	cont "animationen."
	prompt

.BattleStyle:
	text "Nach dem K.O."
	line "eines"
	line "Gegners:"

	para "Fest: Der nächste"
	line "Gegner kommt."

	para "Wechsel: Du"
	line "kannst"
	line "zuerst wechseln."

	para "Vorhersage: Zeigt"
	line "den nächsten"
	cont "Gegner."
	prompt

.Nicknames:
	text "Ob neue #mon"
	line "Spitznamen"
	cont "bekommen."
	prompt

.RunningShoes:
	text "B gedrückt"
	line "halten:"
	line "Mit Laufschuhen"

	para "Aus: zum Laufen,"
	line "An: zum Gehen."
	prompt

.TurningSpeed:
	text "Wie schnell du"
	line "die"
	line "Richtung in der"
	cont "Spielwelt"
	cont "änderst."
	prompt

.ClockFormat:
	text "Das Uhrenformat:"
	line "12-Stunden mit"
	cont "AM/PM."
	prompt

.PokedexUnits:
	text "#dex: Größe und"
	line "Gewicht in:"

	para "Imperial: Fuß,"
	line "Zoll und Pfund."

	para "Metrisch: Meter"
	line "und Kilogramm."
	prompt

OptionsDoneDescription:
	text "Optionen"
	line "speichern"
	line "und Menü"
	cont "verlassen."
	prompt