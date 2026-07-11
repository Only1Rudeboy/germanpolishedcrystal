SafariZoneWest_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 22,  2, SAFARI_ZONE_NORTH, 8
	warp_event 23,  2, SAFARI_ZONE_NORTH, 9
	warp_event 28,  2, SAFARI_ZONE_NORTH, 3
	warp_event 29,  2, SAFARI_ZONE_NORTH, 4
	warp_event 31, 24, SAFARI_ZONE_HUB, 5
	warp_event 31, 25, SAFARI_ZONE_HUB, 6
	warp_event 13, 13, SAFARI_ZONE_WEST_REST_HOUSE_1, 1
	warp_event  5,  5, SAFARI_ZONE_WEST_REST_HOUSE_2, 1

	def_coord_events

	def_bg_events
	bg_event 26, 24, BGEVENT_JUMPTEXT, SafariZoneWestAreaSignText
	bg_event 14, 14, BGEVENT_JUMPTEXT, SafariZoneWestRestHouseSignText
	bg_event 28,  6, BGEVENT_JUMPTEXT, SafariZoneWestTrainerTips1SignText
	bg_event 19,  5, BGEVENT_JUMPTEXT, SafariZoneWestTrainerTips2SignText
	bg_event 13,  6, BGEVENT_ITEM + NUGGET, EVENT_SAFARI_ZONE_WEST_HIDDEN_NUGGET

	def_object_events
	object_event 22, 23, SPRITE_LASS, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerLassDuplica, -1
	object_event 23, 12, SPRITE_CAMPER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerCamperAmos, -1
	object_event 12, 19, SPRITE_TAMER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerTamerBrett, -1
	itemball_event 14,  9, MAX_REVIVE, 1, EVENT_SAFARI_ZONE_WEST_MAX_REVIVE

GenericTrainerLassDuplica:
	generictrainer LASS, DUPLICA, EVENT_BEAT_LASS_DUPLICA, LassDuplicaSeenText, LassDuplicaBeatenText

	text "Ich kann super"
	line "imitieren!"

	para "Eines Tages werde"
	line "ich Arenaleiterin"
	cont "in FUCHSANIA und"

	para "imitiere Janine."
	done

GenericTrainerCamperAmos:
	generictrainer CAMPER, AMOS, EVENT_BEAT_CAMPER_AMOS, CamperAmosSeenText, CamperAmosBeatenText

	text "Ich durchkämme"
	line "Land und Meer nach"
	cont "neuen #mon."
	done

GenericTrainerTamerBrett:
	generictrainer TAMER, BRETT, EVENT_BEAT_TAMER_BRETT, TamerBrettSeenText, TamerBrettBeatenText

	text "Du musst #mon"
	line "mit"
	cont "Selbstvertrauen"
	cont "kommandieren."

	para "ORDEN zu sammeln"
	line "kann dabei helfen."
	done

LassDuplicaSeenText:
	text "Um Ditto richtig"
	line "zu nutzen, musst"
	cont "du alle #mon"
	cont "kennen!"
	done

LassDuplicaBeatenText:
	text "Ich muss noch viel"
	line "lernen."
	done

CamperAmosSeenText:
	text "In der SAFARI-"
	line "ZONE leben viele"
	cont "#mon."

	para "Ich will sie alle"
	line "fangen!"
	done

CamperAmosBeatenText:
	text "Ich verlor--ich"
	line "muss sie"
	cont "trainieren!"
	done

TamerBrettSeenText:
	text "Weißt du, wie man"
	line "aggressive #mon"
	cont "handhabt?"
	done

TamerBrettBeatenText:
	text "Ja, du weißt es!"
	done

SafariZoneWestAreaSignText:
	text "SAFARI-ZONE"
	line "Westlicher Bereich"
	done

SafariZoneWestRestHouseSignText:
	text "Erholungshaus"
	done

SafariZoneWestTrainerTips1SignText:
	text "TIPPS für TRAINER"

	para "Feuer-#mon"
	line "können nicht"
	cont "verbrennen,"

	para "Elektro-#mon"
	line "nicht paralysiert"

	para "und Eis-#mon"
	line "nicht eingefroren"
	cont "werden."
	done

SafariZoneWestTrainerTips2SignText:
	text "TIPPS für TRAINER"

	para "Bei einem"
	line "Sandsturm erhalten"

	para "Gestein-#mon"
	line "einen Bonus auf"
	cont "ihre Spezial-Vert."
	done
