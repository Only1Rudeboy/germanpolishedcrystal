IcePath1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4, 19, ROUTE_44, 1
	warp_event 36, 27, BLACKTHORN_CITY, 7
	warp_event 37,  5, ICE_PATH_B1F, 1
	warp_event 37, 13, ICE_PATH_B1F, 7

	def_coord_events

	def_bg_events

	def_object_events
	object_event 29, 10, SPRITE_SKIER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSkierMaria, -1
	object_event 28,  3, SPRITE_BOARDER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerBoarderStefan, -1
	tmhmball_event 31,  7, HM_WATERFALL, EVENT_GOT_HM06_WATERFALL
	itemball_event 32, 23, PP_UP, 1, EVENT_ICE_PATH_1F_PP_UP
	itemball_event 35,  9, HEAT_ROCK, 1, EVENT_ICE_PATH_1F_HEAT_ROCK

GenericTrainerSkierMaria:
	generictrainer SKIER, MARIA, EVENT_BEAT_SKIER_MARIA, SkierMariaSeenText, SkierMariaBeatenText

	text "Es hat eine Weile"
	line "gedauert, bis ich"
	para "mit Skiern"
	line "vertraut war."
	done

GenericTrainerBoarderStefan:
	generictrainer BOARDER, STEFAN, EVENT_BEAT_BOARDER_STEFAN, BoarderStefanSeenText, BoarderStefanBeatenText

	text "Snowboarden hält"
	line "mich warm!"
	done

SkierMariaSeenText:
	text "Bewunderst du"
	line "meine Skitechnik?"
	done

SkierMariaBeatenText:
	text "Deine"
	line "Kampftechnik ist"
	cont "bewundernswert!"
	done

BoarderStefanSeenText:
	text "Brrr… So kalt!"
	para "Lass uns mit einem"
	line "#MON-Kampf"
	cont "aufwärmen!"
	done

BoarderStefanBeatenText:
	text "Diese Kälte ist"
	line "die Scham der"
	cont "Niederlage…"
	done
