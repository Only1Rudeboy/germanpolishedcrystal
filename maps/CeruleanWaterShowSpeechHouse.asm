CeruleanWaterShowSpeechHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, CERULEAN_CITY, 11
	warp_event  3,  7, CERULEAN_CITY, 11

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeruleanWaterShowSpeechHouseCooltrainerMText, EVENT_TRAINERS_IN_CERULEAN_GYM
	object_event  6,  3, SPRITE_POKEMANIAC, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeruleanWaterShowSpeechHouseSuperNerdText, -1

CeruleanWaterShowSpeechHouseCooltrainerMText:
	; PC-only (C)
	text "MISTY tritt"
	line "manchmal in"
	cont "Wassershows in"
	cont "ihrer ARENA auf."
	para "Das ist ein wahrer"
	line "Anblick!"
	done

CeruleanWaterShowSpeechHouseSuperNerdText:
	; PC-only (C)
	text "Ich hab Graffiti"
	line "auf das Dach der"
	cont "PRISMANIA-ANLAGE"
	cont "gemalt."
	para "Hast du's gesehen?"
	line "Es ist etwas"
	cont "versteckt, hehe…"
	done
