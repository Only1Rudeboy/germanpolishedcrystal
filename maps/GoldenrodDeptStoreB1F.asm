GoldenrodDeptStoreB1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, GoldenRodDeptStoreB1FClearBoxesCallback
	callback MAPCALLBACK_NEWMAP, GoldenRodDeptStoreUnblockCallback

	def_warp_events
	warp_event 17,  2, GOLDENROD_UNDERGROUND_WAREHOUSE, 3
	warp_event  9,  4, GOLDENROD_DEPT_STORE_ELEVATOR, 1

	def_coord_events

	def_bg_events

	def_object_events
	itemball_event 10, 15, ETHER, 1, EVENT_GOLDENROD_DEPT_STORE_B1F_ETHER
	itemball_event 14,  2, METAL_COAT, 1, EVENT_GOLDENROD_DEPT_STORE_B1F_METAL_COAT
	itemball_event  6,  3, BURN_HEAL, 1, EVENT_GOLDENROD_DEPT_STORE_B1F_BURN_HEAL
	itemball_event 15, 15, ULTRA_BALL, 1, EVENT_GOLDENROD_DEPT_STORE_B1F_ULTRA_BALL
	object_event  9, 10, SPRITE_BLACK_BELT, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodDeptStoreB1FBlackBelt1Text, -1
	object_event  4,  8, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodDeptStoreB1FBlackBelt2Text, -1
	object_event  6, 13, SPRITE_BLACK_BELT, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodDeptStoreB1FBlackBelt3Text, -1
	pokemon_event  7,  7, MACHOKE, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_GRAY, GoldenrodDeptStoreB1FMachokeText, -1

GoldenRodDeptStoreB1FClearBoxesCallback:
	checkevent EVENT_RECEIVED_CARD_KEY
	iftruefwd .GotCardKey
	sjumpfwd .Continue

.GotCardKey:
	changeblock 16, 4, $d
	; fallthrough

.Continue:
	checkevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_2
	iftruefwd .Layout2
	checkevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_3
	iftruefwd .Layout3
	changeblock 10, 8, $d
	endcallback

.Layout2:
	changeblock 4, 10, $d
	endcallback

.Layout3:
	changeblock 10, 12, $d
	endcallback

GoldenRodDeptStoreUnblockCallback:
	clearevent EVENT_GOLDENROD_WAREHOUSE_BLOCKED_OFF
	endcallback

GoldenrodDeptStoreB1FBlackBelt1Text:
	; GSC-DE Dump
	text "Hey! Du"
	line "hältst uns auf!"
	para "Wir arbeiten stets"
	line "im Hintergrund,"
	para "damit uns niemand"
	line "sieht!"
	done

GoldenrodDeptStoreB1FBlackBelt2Text:
	; GSC-DE Dump
	text "Ich verliere die"
	line "Lust am Arbeiten,"
	cont "wenn mir jemand"
	cont "zusieht."
	para "Hey, Gnom,"
	line "zisch ab!"
	done

GoldenrodDeptStoreB1FBlackBelt3Text:
	; GSC-DE Dump
	text "Oohah! Oohah!"
	para "Das Zeug am"
	line "Boden ist Plunder."
	para "Nimm es dir, wenn"
	line "du möchtest!"
	done

GoldenrodDeptStoreB1FMachokeText:
	; GSC-DE Dump
	text "MASCHOCK: Mascho!"
	done
