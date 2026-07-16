GoldenrodDeptStore3F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 12,  0, GOLDENROD_DEPT_STORE_2F, 1
	warp_event 15,  0, GOLDENROD_DEPT_STORE_4F, 2
	warp_event  2,  0, GOLDENROD_DEPT_STORE_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event 14,  0, BGEVENT_JUMPTEXT, GoldenrodDeptStore3FDirectoryText

	def_object_events
	object_event  6,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, pokemart, MARTTYPE_STANDARD, MART_GOLDENROD_3F, -1
	object_event 12,  5, SPRITE_POKEMANIAC, SPRITEMOVEDATA_SPINRANDOM_FAST, 1, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodDeptStore3FSuperNerdText, -1
	object_event  2,  5, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodDeptStore3FRockerText, -1

GoldenrodDeptStore3FSuperNerdText:
	; GSC-DE Dump
	text "Ich, ich, ich bin"
	line "so ungeduldig!"
	para "Ich setze X-TEMPO"
	line "im Kampf ein, um"
	para "den INIT-Wert"
	line "meiner #MON"
	para "zu erhöhen."
	done

GoldenrodDeptStore3FRockerText:
	; GSC-DE Dump
	text "Hey! Setzt du im"
	line "Kampf X-SPEZIAL"
	cont "ein?"
	para "Es ist toll. Es"
	line "verstärkt alle"
	cont "SPEZIALATTACKEN!"
	done

GoldenrodDeptStore3FDirectoryText:
	; GSC-DE Dump
	text "Für Sieges-"
	line "hungrige"
	para "2S KAMPF-"
	line "   KOLLEKTION"
	done
