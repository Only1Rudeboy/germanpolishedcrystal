GoldenrodDeptStore6F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 15,  0, GOLDENROD_DEPT_STORE_5F, 2
	warp_event  2,  0, GOLDENROD_DEPT_STORE_ELEVATOR, 1
	warp_event 13,  0, GOLDENROD_DEPT_STORE_ROOF, 1

	def_coord_events

	def_bg_events
	bg_event 14,  0, BGEVENT_JUMPTEXT, GoldenrodDeptStore6FDirectoryText

	def_object_events
	object_event 10,  2, SPRITE_PICNICKER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodDeptStore6FLassText, -1
	object_event  8,  2, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodDeptStore6FSuperNerdText, -1

GoldenrodDeptStore6FLassText:
	; GSC-DE Dump
	text "Hörst du den"
	line "GLÜCKSKANAL?"
	para "Möchtest du gewin-"
	line "nen, tausche #-"
	cont "MON mit so vielen"
	para "Leuten wie mög-"
	line "lich, um verschie-"
	cont "dene ID-Nummern zu"
	cont "erhalten."
	done

GoldenrodDeptStore6FSuperNerdText:
	; GSC-DE Dump
	text "Wenn du müde bist,"
	line "dann hol dir ein"
	cont "Getränk aus dem"
	cont "Automaten."
	para "Auch deine #MON"
	line "werden sie mögen."
	done

GoldenrodDeptStore6FDirectoryText:
	; GSC-DE Dump
	text "Mach eine"
	line "Einkaufspause!"
	para "5S PLATZ DER"
	line "   EWIGEN STILLE"
	done
