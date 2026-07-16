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
	line "automatisch"
	cont "weiter, wenn du"
	cont "Taste(n) gedrückt"
	cont "hältst."
	prompt

.Frame:
	text "Der Rahmen um die"
	line "meisten"
	cont "Textfelder."
	prompt

.Typeface:
	text "Die Schriftart für"
	line "normalen Text."
	prompt

.Keyboard:
	text "Layout für Namen"
	line "und Post:"

	para "ABCDEF oder"
	line "deutsches QWERTZ."
	prompt

.Sound:
	text "Audioausgabe: Mono"
	line "(ein Kanal)"

	para "oder Stereo (zwei,"
	line "links und rechts)."
	prompt

.BattleEffects:
	text "Attacken- und"
	line "Statusanimationen."
	prompt

.BattleStyle:
	text "Nach dem K.O."
	line "eines Gegners:"

	para "Folgend: Der näch-"
	line "ste kommt sofort."

	para "Wechsel: Du kannst"
	line "zuerst wechseln"
	cont "und siehst das"
	cont "nächste #MON."

	para "Vorhers.: Wechseln"
	line "geht, aber ohne"
	cont "den Namen des"
	cont "nächsten #MON."
	prompt

.Nicknames:
	text "Ob neue #MON"
	line "Spitznamen"
	cont "bekommen."
	prompt

.RunningShoes:
	text "B gedrückt halten:"
	line "Mit Laufschuhen"

	para "Aus: zum Laufen,"
	line "An: zum Gehen."
	prompt

.TurningSpeed:
	text "Wie schnell du die"
	line "Richtung in der"
	cont "Spielwelt änderst."
	prompt

.ClockFormat:
	text "Anzeige der Uhr:"
	line "12-Stunden mit"
	cont "AM/PM oder 24-"
	cont "Stunden."
	prompt

.PokedexUnits:
	text "#dex: Größe und"
	line "Gewicht in:"

	para "Imperial: Fuß,"
	line "Zoll, Pfund."

	para "Metrisch: Meter"
	line "und Kilogramm."
	prompt

OptionsDoneDescription:
	text "Optionen speichern"
	line "und Menü"
	cont "verlassen."
	prompt