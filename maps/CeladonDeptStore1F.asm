CeladonDeptStore1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  7,  7, CELADON_CITY, 1
	warp_event  8,  7, CELADON_CITY, 17
	warp_event 15,  0, CELADON_DEPT_STORE_2F, 2
	warp_event  2,  0, CELADON_DEPT_STORE_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event 14,  0, BGEVENT_JUMPTEXT, CeladonDeptStore1FDirectoryText

	def_object_events
	object_event 10,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonDeptStore1FReceptionistText, -1
	object_event 11,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonDeptStore1FGentlemanText, -1
	object_event  5,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonDeptStore1FTeacherText, -1

CeladonDeptStore1FReceptionistText:
	; GSC-DE Dump
	text "Hallo! Willkommen"
	line "im EINKAUFSZENTRUM"
	cont "von PRISMANIA"
	cont "CITY!"
	para "Die Übersicht"
	line "ist an der Wand."
	done

CeladonDeptStore1FGentlemanText:
	; GSC-DE Dump
	text "Dieses EINKAUFS-"
	line "ZENTRUM gehört"
	para "derselben Kette"
	line "an, wie das in"
	cont "DUKATIA CITY."
	para "Sie wurden beide"
	line "zur selben Zeit"
	cont "renoviert."
	done

CeladonDeptStore1FTeacherText:
	; GSC-DE Dump
	text "Ich bin zum"
	line "ersten Mal hier."
	para "Es ist so groß…"
	para "Ich habe Angst,"
	line "mich zu verlaufen."
	done

CeladonDeptStore1FDirectoryText:
	; GSC-DE Dump (PC-Etagen)
	text "1F: KUNDEN-"
	line "    INFORMATION"
	para "2F: ZUBEHÖR für"
	line "    TRAINER"
	para "3F: TM-LADEN"
	para "4F: GESCHENK-"
	line "    ARTIKEL"
	para "5F: DROGERIE"
	para "6F: DACHTERRASSE"
	done
