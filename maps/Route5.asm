Route5_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 17, 27, ROUTE_5_UNDERGROUND_PATH_ENTRANCE, 1
	warp_event  8, 31, ROUTE_5_SAFFRON_CITY_GATE, 1
	warp_event  9, 31, ROUTE_5_SAFFRON_CITY_GATE, 2
	warp_event 10, 21, ROUTE_5_CLEANSE_TAG_SPEECH_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 17, 29, BGEVENT_JUMPTEXT, Route5UndergroundPathSignText
	bg_event  5, 27, BGEVENT_JUMPTEXT, Route5AdvancedTipsSignText

	def_object_events
	object_event 17, 28, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route5PokefanMText, EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH

Route5PokefanMText:
	text "Die Straße zum"
	line "KRAFTWERK bleibt"

	para "gesperrt, bis das"
	line "Problem gelöst"
	cont "wurde."
	done


Route5UndergroundPathSignText:
	text "TUNNELPFAD"
	para "AZURIA CITY -"
	line "ORANIA CITY"
	done


Route5AdvancedTipsSignText:
	text "Profi-Tipps!"
	para "Rasereigen ist ein"
	line "mächtiges Item,"
	para "aber es verursacht"
	line "Verwirrung."
	para "Ein #mon mit"
	line "der Fähigkeit"
	cont "Gleichmut"
	para "wird aber nicht"
	line "verwirrt!"
	done
