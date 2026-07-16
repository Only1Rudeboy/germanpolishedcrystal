CopycatsHouse1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, SAFFRON_CITY, 8
	warp_event  3,  7, SAFFRON_CITY, 8
	warp_event  3,  0, COPYCATS_HOUSE_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CopycatsHouse1FPokefanMText, -1
	object_event  5,  4, SPRITE_MATRON, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CopycatsHouse1FPokefanFScript, -1
	pokemon_event  4,  5, BLISSEY, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_PINK, CopycatsHouse1FBlisseyText, -1

CopycatsHouse1FPokefanMText:
	; GSC-DE Dump 5842
	text "Meine Tochter"
	line "macht gerne"
	cont "Menschen nach."
	para "Dieses Hobby hat"
	line "ihr den Spitznamen"
	para "NACHAHMERIN einge-"
	line "bracht."
	done

CopycatsHouse1FPokefanFScript:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer .Text2
	jumpthistextfaceplayer

	; GSC-DE Dump 5843
	text "Meine Tochter ist"
	line "sehr ichbezogen…"
	para "Sie hat nur wenige"
	line "Freunde."
	done

.Text2:
	; GSC-DE Dump 5844
	text "Vor kurzem hat sie"
	line "ihre #PUPPE,"
	para "die ihr ein Junge"
	line "vor drei Jahren"
	para "geschenkt hat,"
	line "verloren."
	para "Ihre Nachahmerei"
	line "ist seitdem sogar"
	cont "noch besser"
	cont "geworden…"
	done

CopycatsHouse1FBlisseyText:
	; GSC-DE Dump 5845
	text "HEITEIRA: Teirii!"
	done
