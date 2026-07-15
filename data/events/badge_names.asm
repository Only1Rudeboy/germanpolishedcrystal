BadgeNames:
	list_start
	; Johto GSC-DE: Zephyr, Horniss, Plan, Nebel, Sturm, Mineral, Gletscher, Legende
	li "Zephyr"
	li "Horniss"
	li "Plan"
	li "Nebel"
	li "Sturm"
	li "Mineral"
	li "Gletscher"
	li "Legende"
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
