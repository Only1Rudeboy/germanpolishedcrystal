VermilionHouseDiglettsCaveSpeechHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, VERMILION_CITY, 6
	warp_event  3,  7, VERMILION_CITY, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, VermilionDiglettsCaveSpeechHouseGentlemanText, -1

VermilionDiglettsCaveSpeechHouseGentlemanText:
	text "Im Laufe vieler"
	line "Jahre haben die"
	cont "DIGDA einen"
	cont "langen"
	cont "Tunnel gebaut."

	para "Dieser Tunnel"
	line "führt zu einer"
	cont "weit entfernten"
	cont "Stadt."
	done
