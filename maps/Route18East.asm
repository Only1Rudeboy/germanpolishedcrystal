Route18East_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  0,  6, ROUTE_18_GATE, 3
	warp_event  0,  7, ROUTE_18_GATE, 4

	def_coord_events

	def_bg_events
	bg_event  7,  5, BGEVENT_JUMPTEXT, Route18SignText

	def_object_events
	object_event  7, 12, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBird_keeperBoris, -1
	object_event 11,  6, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBird_keeperBob, -1

; GSC-DE Dump 7129–7135
GenericTrainerBird_keeperBoris:
	generictrainer BIRD_KEEPER, BORIS, EVENT_BEAT_BIRD_KEEPER_BORIS, Bird_keeperBorisSeenText, Bird_keeperBorisBeatenText

	text "Da du so stark"
	line "bist, muss es"
	cont "Spaß machen, gegen"
	cont "dich zu kämpfen."
	done

GenericTrainerBird_keeperBob:
	generictrainer BIRD_KEEPER, BOB, EVENT_BEAT_BIRD_KEEPER_BOB, Bird_keeperBobSeenText, Bird_keeperBobBeatenText

	text "Wenn du kein"
	line "FAHRRAD hast,"

	para "darfst du die"
	line "Abkürzung nicht"
	cont "benutzen."
	done

Bird_keeperBorisSeenText:
	text "Wenn du nach"
	line "#MON suchst,"

	para "musst du ins"
	line "hohe Gras gehen."
	done

Bird_keeperBorisBeatenText:
	text "Yippi!"
	done

Bird_keeperBobSeenText:
	text "Der RADWEG ist"
	line "eine schnelle"
	cont "Abkürzung nach"
	cont "PRISMANIA CITY."
	done

Bird_keeperBobBeatenText:
	text "…Uff!"
	done

Route18SignText:
	text "ROUTE 18"

	para "PRISMANIA CITY -"
	line "FUCHSANIA CITY"
	done
