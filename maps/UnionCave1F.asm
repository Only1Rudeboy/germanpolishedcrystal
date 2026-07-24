UnionCave1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  3, UNION_CAVE_B1F_NORTH, 3
	warp_event  3, 45, UNION_CAVE_B1F_SOUTH, 1
	warp_event 17, 43, ROUTE_33, 1
	warp_event 17, 15, ROUTE_32, 4

	def_coord_events

	def_bg_events
	bg_event  7, 19, BGEVENT_ITEM + GREAT_BALL, EVENT_UNION_CAVE_1F_HIDDEN_GREAT_BALL
	bg_event  2, 33, BGEVENT_ITEM + BIG_PEARL, EVENT_UNION_CAVE_1F_HIDDEN_BIG_PEARL
	bg_event  8, 33, BGEVENT_ITEM + PARALYZEHEAL, EVENT_UNION_CAVE_1F_HIDDEN_PARALYZEHEAL

	def_object_events
	object_event  3, 18, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerHikerDaniel, -1
	object_event  7, 37, SPRITE_POKEMANIAC, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerPokemaniacLarry, -1
	object_event 11, 20, SPRITE_HIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerHikerRussell, -1
	object_event 15, 39, SPRITE_FIREBREATHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerFirebreatherRay, -1
	object_event 11, 32, SPRITE_FIREBREATHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerFirebreatherBill, -1
	object_event  5,  3, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerRuin_maniacJones, -1
	itemball_event 15, 33, GREAT_BALL, 1, EVENT_UNION_CAVE_1F_GREAT_BALL
	itemball_event  2,  8, X_ATTACK, 1, EVENT_UNION_CAVE_1F_X_ATTACK
	itemball_event  3, 28, POTION, 1, EVENT_UNION_CAVE_1F_POTION
	itemball_event 12, 45, AWAKENING, 1, EVENT_UNION_CAVE_1F_AWAKENING

GenericTrainerPokemaniacLarry:
	generictrainer POKEMANIAC, POKEMANIAC_LARRY, EVENT_BEAT_POKEMANIAC_LARRY, PokemaniacLarrySeenText, PokemaniacLarryBeatenText

	; GSC-DE Dump
	text "Jeden Freitag"
	line "kannst du #MON"
	para "in dieser Höhle"
	line "brüllen hören."
	done
GenericTrainerHikerRussell:
	generictrainer HIKER, RUSSELL, EVENT_BEAT_HIKER_RUSSELL, HikerRussellSeenText, HikerRussellBeatenText

	; GSC-DE Dump
	text "O.K.! Ich habe"
	line "mich entschieden."
	para "Ich gehe erst,"
	line "wenn meine #MON"
	cont "stärker sind!"
	done
GenericTrainerHikerDaniel:
	generictrainer HIKER, DANIEL, EVENT_BEAT_HIKER_DANIEL, HikerDanielSeenText, HikerDanielBeatenText

	; GSC-DE Dump
	text "Ich wurde ge-"
	line "nötigt, eine"
	cont "FLEGMONRUTE zu"
	cont "kaufen."
	para "Mir tut das arme"
	line "#MON Leid."
	done
GenericTrainerFirebreatherBill:
	generictrainer FIREBREATHER, BILL, EVENT_BEAT_FIREBREATHER_BILL, FirebreatherBillSeenText, FirebreatherBillBeatenText

	; GSC-DE Dump
	text "Am Wochenende"
	line "kannst du #MON"
	para "in dieser Höhle"
	line "brüllen hören."
	done
GenericTrainerFirebreatherRay:
	generictrainer FIREBREATHER, RAY, EVENT_BEAT_FIREBREATHER_RAY, FirebreatherRaySeenText, FirebreatherRayBeatenText

	; GSC-DE Dump
	text "Das Feuer meines"
	line "#MON"
	cont "erleuchtet diese"
	cont "Höhle."
	done
GenericTrainerRuin_maniacJones:
	generictrainer RUIN_MANIAC, JONES, EVENT_BEAT_RUIN_MANIAC_JONES, Ruin_maniacJonesSeenText, Ruin_maniacJonesBeatenText

	; GSC-DE Stil: Ortsname in CAPS ("RUINEN")
	text "Die RUINEN"
	line "verbergen etwas…"
	para "Das spüre ich!"
	done

HikerRussellSeenText:
	; GSC-DE Dump
	text "Du bist auf dem"
	line "Weg nach AZALEA"
	cont "CITY, nicht wahr?"
	para "Lass meine #MON"
	line "entscheiden, ob"
	cont "du eines Kampfes"
	cont "würdig bist."
	done





HikerRussellBeatenText:
	; GSC-DE Dump
	text "Oh, oh, oh!"
	done





PokemaniacLarrySeenText:
	; GSC-DE Dump
	text "Um #MON zu"
	line "finden, wandere"
	cont "ich durch das"
	cont "Land."
	para "Suchst du auch"
	line "nach #MON?"
	para "Dann bist du"
	line "mein Rivale!"
	done





PokemaniacLarryBeatenText:
	; GSC-DE Dump
	text "Uff. Mein armes"
	line "#MON…"
	done





HikerDanielSeenText:
	; GSC-DE Dump
	text "Whoa! Was für"
	line "eine Überraschung!"
	para "Ich habe nicht"
	line "erwartet, hier auf"
	cont "jemanden zu"
	cont "treffen!"
	done





HikerDanielBeatenText:
	; GSC-DE Dump
	text "Whoa! Du hast"
	line "es mir gegeben!"
	done





FirebreatherBillSeenText:
	; GSC-DE Dump
	text "ZUBATs SUPERSCHALL"
	line "verwirrt mein"
	cont "#MON noch"
	cont "immer."
	para "Das ärgert mich"
	line "wirklich sehr!"
	done





FirebreatherBillBeatenText:
	text "Ich bin durch!"
	done





FirebreatherRaySeenText:
	; GSC-DE Dump
	text "Mit Licht jagt"
	line "einem eine Höhle"
	cont "keine Angst ein."
	para "Bist du stark"
	line "genug, jagen dir"
	cont "#MON keine"
	cont "Angst ein."
	done





FirebreatherRayBeatenText:
	text "BLITZ!"
	done





Ruin_maniacJonesSeenText:
	; GSC-DE Dump 2921
	text "Kennst du die"
	line "ALPH-RUINEN?"
	done

Ruin_maniacJonesBeatenText:
	text "Hahaha!"
	done
