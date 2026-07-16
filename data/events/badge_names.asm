BadgeNames:
	list_start
	; Johto GSC-DE (Dump: FLÜGELORDEN / INSEKTORDEN → Kurznamen)
	li "Flügel"
	li "Insekt"
	li "Basis"
	li "Phantom"
	li "Stahl"
	li "Faust"
	li "Gletscher"
	li "Drache"
	; Kanto
	li "Fels"
	li "Quell"
	li "Donner"
	li "Regenbogen"
if DEF(FAITHFUL)
	li "Seele"
	li "Sumpf"
else
	li "Sumpf"
	li "Seele"
endc
	li "Vulkan"
	li "Erde"
	assert_list_length NUM_BADGES
