VermilionMart_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, VERMILION_CITY, 5
	warp_event  3,  7, VERMILION_CITY, 5

	def_coord_events

	def_bg_events

	def_object_events
	mart_clerk_event  1,  3, MARTTYPE_STANDARD, MART_VERMILION
	object_event  5,  2, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, VermilionMartSuperNerdText, -1
	object_event  8,  6, SPRITE_LADY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, VermilionMartBeautyText, -1

VermilionMartSuperNerdText:
	; GSC-DE Dump 6088
	text "TEAM ROCKET ist"
	line "nicht mehr in"
	cont "KANTO."

	para "Das allein ist"
	line "schon ein Grund"
	cont "zum Feiern."
	done


VermilionMartBeautyText:
	; GSC-DE Dump 6089
	text "Ich habe vor, in"
	line "SAFFRONIA CITY"
	cont "einkaufen zu"
	cont "gehen."
	done


