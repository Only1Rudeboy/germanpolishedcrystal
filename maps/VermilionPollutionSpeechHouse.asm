VermilionPollutionSpeechHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, VERMILION_CITY, 13
	warp_event  3,  7, VERMILION_CITY, 13

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  4, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VermilionPollutionSpeechHouseBreederText, -1
	object_event  5,  3, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, VermilionPollutionSpeechHouseCooltrainerMText, -1

VermilionPollutionSpeechHouseBreederText:
	text "Orania ist ein"
	line "wunderbarer Ort,"
	para "aber in einem"
	line "Hafen muss man auf"
	cont "Verschmutzung"
	cont "achten!"
	done

VermilionPollutionSpeechHouseCooltrainerMText:
	text "Dank all der"
	line "Kreuzfahrtschiffe"
	para "bekommen wir"
	line "Besucher aus aller"
	cont "Welt!"
	done
