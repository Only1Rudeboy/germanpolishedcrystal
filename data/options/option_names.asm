OptionNames:
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
	db "Texttempo@"
.TextAutoscroll:
	db "Auto-Text@"
.Frame:
	db "Rahmen@"
.Typeface:
	db "Schriftart@"
.Keyboard:
	db "Tastatur@"
.Sound:
	db "Ton@"
.BattleEffects:
	db "Kampfeffekte@"
.BattleStyle:
	db "Kampfstil@"
.Nicknames:
	db "Spitznamen@"
.RunningShoes:
	db "Laufschuhe@"
.TurningSpeed:
	db "Drehtempo@"
.ClockFormat:
	db "Uhrformat@"
.PokedexUnits:
	db "#dex-Einheiten@"