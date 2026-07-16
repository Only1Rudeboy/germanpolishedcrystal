CeladonDeptStore5F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 12,  0, CELADON_DEPT_STORE_4F, 1
	warp_event 15,  0, CELADON_DEPT_STORE_6F, 1
	warp_event  2,  0, CELADON_DEPT_STORE_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event 14,  0, BGEVENT_JUMPTEXT, CeladonDeptStore5FDirectoryText

	def_object_events
	object_event  7,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, pokemart, MARTTYPE_STANDARD, MART_CELADON_5F_1, -1
	object_event  8,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, pokemart, MARTTYPE_STANDARD, MART_CELADON_5F_2, -1
	object_event 13,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonDeptStore5FGentlemanText, -1
	object_event  3,  3, SPRITE_SAILOR, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonDeptStore5FSailorText, -1
	object_event  1,  7, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonDeptStore5FTeacherText, -1

CeladonDeptStore5FGentlemanText:
	; GSC-DE Dump
	text "Ich möchte Items"
	line "kaufen, mit denen"
	para "der Status meiner"
	line "#mon verbessert"
	cont "wird, aber ich"
	cont "habe nicht genug"
	cont "Geld…"
	done

CeladonDeptStore5FSailorText:
	; GSC-DE Dump
	text "Ich möchte AP-PLUS"
	line "kaufen, damit die"
	para "AP der Attacken"
	line "steigen, aber das"
	para "kann man nicht"
	line "kaufen…"
	done

CeladonDeptStore5FTeacherText:
	; GSC-DE Dump
	text "Es macht #mon"
	line "glücklich, wenn"
	cont "sie Items"
	cont "benutzen dürfen."
	para "Allerdings mögen"
	line "sie manche Items"
	cont "nicht…"
	done

CeladonDeptStore5FDirectoryText:
	; GSC-DE Dump (PC 5F)
	text "5F: DROGERIE"
	done
