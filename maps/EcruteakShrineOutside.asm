EcruteakShrineOutside_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, ECRUTEAK_SHRINE_INSIDE, 1
	warp_event  4, 16, ECRUTEAK_CITY, 4
	warp_event  5, 16, ECRUTEAK_CITY, 4
	warp_event  6, 16, ECRUTEAK_CITY, 5
	warp_event  7, 16, ECRUTEAK_CITY, 5

	def_coord_events

	def_bg_events
	bg_event  3, 12, BGEVENT_JUMPTEXT, EcruteakShrineOutsideStatueText
	bg_event  8, 12, BGEVENT_JUMPTEXT, EcruteakShrineOutsideStatueText

	def_object_events
	object_event  8,  8, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakShrineOutsideTwinText, -1
	pokemon_event  9,  8, HOOTHOOT, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BROWN, EcruteakShrineOutsideHoothootText, -1
	object_event  2, 14, SPRITE_SAGE, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakShrineOutsideSageText, -1

EcruteakShrineOutsideTwinText:
	text "Mein Hoothoots"
	line "GESICHT verjagt"
	cont "Geister."
	done

EcruteakShrineOutsideHoothootText:
	text "Hoothoot: Huhu!"
	done

EcruteakShrineOutsideSageText:
	text "An Silvester"
	line "besuchen Leute"
	line "diesen Schrein"

	para "und wünschen sich"
	line "etwas für ihre"
	cont "Zukunft."
	done

EcruteakShrineOutsideStatueText:
	text "Eine #mon-"
	line "Statue…"

	para "Sie wirkt sehr"
	line "gelassen."
	done
