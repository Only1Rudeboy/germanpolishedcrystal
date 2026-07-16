CeladonDeptStore2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 12,  0, CELADON_DEPT_STORE_3F, 1
	warp_event 15,  0, CELADON_DEPT_STORE_1F, 3
	warp_event  2,  0, CELADON_DEPT_STORE_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event 14,  0, BGEVENT_JUMPTEXT, CeladonDeptStore2FDirectoryText

	def_object_events
	object_event 13,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, pokemart, MARTTYPE_STANDARD, MART_CELADON_2F_1, -1
	object_event 14,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, pokemart, MARTTYPE_STANDARD, MART_CELADON_2F_2, -1
	object_event  5,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonDeptStore2FPokefanMText, -1
	object_event  6,  2, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonDeptStore2FYoungsterText, -1

CeladonDeptStore2FPokefanMText:
	; GSC-DE Dump
	text "Ich bin erst vor"
	line "kurzem Trainer"
	para "geworden. Mein"
	line "Sohn hat mir dazu"
	cont "geraten."
	para "Dieses riesige"
	line "Angebot an nütz-"
	cont "lichen Items ist"
	cont "überwältigend."
	done

CeladonDeptStore2FYoungsterText:
	; GSC-DE Dump
	text "Mein Papa hat sich"
	line "sehr schwer getan,"
	para "die Bezeichnungen"
	line "aller Items zu"
	para "lernen und zu"
	line "unterscheiden,"
	para "wann man sie"
	line "einsetzt…"
	done

CeladonDeptStore2FDirectoryText:
	; GSC-DE Dump (PC 2F)
	text "Nützliche Items"
	line "für Trainer!"
	para "2F: ZUBEHÖR für"
	line "    TRAINER"
	done
