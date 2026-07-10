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
	text "Hallo!"
	line "Willkommen im"
	cont "Prismania-"
	cont "Kaufhaus!"

	para "Der Wegweiser ist"
	line "an der Wand."
	done

CeladonDeptStore1FGentlemanText:
	text "Dieses Kaufhaus"
	line "gehört zur"
	cont "selben Kette wie"

	para "das in Dukatia"
	line "City."

	para "Beide wurden"
	line "gleichzeitig"
	cont "renoviert."
	done

CeladonDeptStore1FTeacherText:
	text "Ich bin zum"
	line "ersten Mal hier."

	para "Es ist so groß…"

	para "Ich fürchte, ich"
	line "verlaufe mich."
	done

CeladonDeptStore1FDirectoryText:
	text "1F: Service-"
	line "    schalter"

	para "2F: Trainer-"
	line "    Markt"

	para "3F: Technik-Shop"

	para "4F: Weisen-"
	line "    Geschenke"

	para "5F: Apotheke"

	para "6F: Dach-"
	line "    Atrium"
	done
