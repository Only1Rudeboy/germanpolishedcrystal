Route12North_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 10, 15, ROUTE_12_GATE, 1
	warp_event 11, 15, ROUTE_12_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 13, 13, BGEVENT_JUMPTEXT, FishingSpotSignText

	def_object_events
	object_event  6, 11, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerFisherKyle, -1

GenericTrainerFisherKyle:
	generictrainer FISHER, KYLE, EVENT_BEAT_FISHER_KYLE, FisherKyleSeenText, FisherKyleBeatenText

	; GSC-DE Dump 6903
	text "Das Reißen an der"
	line "ANGEL, wenn du"

	para "ein #MON"
	line "fangen möchtest…"

	para "Das ist das"
	line "Schönste für einen"
	cont "Angler wie mich."
	done

FisherKyleSeenText:
	; GSC-DE Dump 6901
	text "Erinnerst du dich?"
	done
FisherKyleBeatenText:
	; GSC-DE Dump 6902
	text "Du erinnerst dich?"
	done
FishingSpotSignText:
	; GSC-DE Dump 6905
	text "ANGELPLATZ"
	done
