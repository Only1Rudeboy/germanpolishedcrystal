RockTunnelB1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  3, ROCK_TUNNEL_1F, 3
	warp_event 17,  9, ROCK_TUNNEL_1F, 4
	warp_event 23,  3, ROCK_TUNNEL_1F, 5
	warp_event 27, 19, ROCK_TUNNEL_1F, 6
	warp_event  3, 13, ROCK_TUNNEL_1F, 7

	def_coord_events

	def_bg_events
	bg_event  3, 18, BGEVENT_ITEM + MAX_POTION, EVENT_ROCK_TUNNEL_B1F_HIDDEN_MAX_POTION

	def_object_events
	object_event 27, 14, SPRITE_FIREBREATHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerFirebreatherCyd, -1
	object_event 24, 24, SPRITE_HEX_MANIAC, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerHexManiacVivian, -1
	itemball_event  7, 17, IRON, 1, EVENT_ROCK_TUNNEL_B1F_IRON
	itemball_event  8,  4, PP_UP, 1, EVENT_ROCK_TUNNEL_B1F_PP_UP
	itemball_event 15,  2, REVIVE, 1, EVENT_ROCK_TUNNEL_B1F_REVIVE
	strengthboulder_event 10, 25

GenericTrainerFirebreatherCyd:
	generictrainer FIREBREATHER, CYD, EVENT_BEAT_FIREBREATHER_CYD, FirebreatherCydSeenText, FirebreatherCydBeatenText

	text "Ein #mon mit"
	line "BLITZ ist"
	para "hilfreich in"
	line "dunklen Höhlen wie"
	cont "dieser."
	done

GenericTrainerHexManiacVivian:
	generictrainer HEX_MANIAC, VIVIAN, EVENT_BEAT_HEX_MANIAC_VIVIAN, HexManiacVivianSeenText, HexManiacVivianBeatenText

	text "Diese gruselige"
	line "Hexen-Persona"

	para "kostet echt"
	line "Anstrengung."
	done

FirebreatherCydSeenText:
	text "Ich nutze Feuer,"
	line "um den Weg zu"
	cont "finden!"
	done

FirebreatherCydBeatenText:
	text "Hilfe! Das Feuer"
	line "ist erloschen!"
	done

HexManiacVivianSeenText:
	text "Hörst du die"
	line "rufenden Stimmen?"
	done

HexManiacVivianBeatenText:
	text "Es war nur ein"
	line "Echo?!"
	done
