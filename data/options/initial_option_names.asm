InitialOptionNames:
	table_width 2
	dw .Natures
	dw .Abilities
	dw .PSS
	dw .EVs
	dw .Experience
	dw .Affection
	dw .RTC
	dw .PerfectStats
	dw .TradedMon
	dw .EvolveInBattle
	dw .ColorVariation
	assert_table_length NUM_INITIAL_MENU_OPTIONS

.Natures:
	db "Wesen@"
.Abilities:
	db "Fähigkeiten@"
.PSS:
	db "Phys./Spez.@"
.EVs:
	db "FP-Zuwachs@"
.Experience:
	db "EP-Zuwachs@"
.Affection:
	db "Zuneigung@"
.RTC:
	db "Echtzeituhr@"
.PerfectStats:
	db "Perfekte DVs@"
.TradedMon:
	db "Tausch-#MON@"
.EvolveInBattle:
	db "Entw. im Kampf@"
.ColorVariation:
	db "Farbvariation@"
