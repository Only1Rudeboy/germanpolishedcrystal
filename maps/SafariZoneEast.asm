SafariZoneEast_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2, 24, SAFARI_ZONE_HUB, 3
	warp_event  2, 25, SAFARI_ZONE_HUB, 4
	warp_event  2,  6, SAFARI_ZONE_NORTH, 1
	warp_event  2,  7, SAFARI_ZONE_NORTH, 2
	warp_event 27, 11, SAFARI_ZONE_EAST_REST_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event  6, 24, BGEVENT_JUMPTEXT, SafariZoneEastAreaSignText
	bg_event 28, 12, BGEVENT_JUMPTEXT, SafariZoneEastRestHouseSignText
	bg_event  8,  6, BGEVENT_JUMPTEXT, SafariZoneEastTrainerTipsSignText

	def_object_events
	object_event  9, 11, SPRITE_COWGIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerCowgirlApril, -1
	itemball_event 22, 15, CARBOS, 1, EVENT_SAFARI_ZONE_EAST_CARBOS
	itemball_event  7, 13, SILVERPOWDER, 1, EVENT_SAFARI_ZONE_EAST_SILVERPOWDER
	itemball_event  5,  3, FULL_RESTORE, 1, EVENT_SAFARI_ZONE_EAST_FULL_RESTORE

GenericTrainerCowgirlApril:
	generictrainer COWGIRL, APRIL, EVENT_BEAT_COWGIRL_APRIL, CowgirlAprilSeenText, CowgirlAprilBeatenText

	text "Manchmal siehst du"
	line "10 gleiche"
	para "#MON"
	line "hintereinander!"
	done

CowgirlAprilSeenText:
	text "Juhu! Ich habe"
	line "gerade eine ganze"
	cont "Herde #MON"
	cont "gefangen!"
	done

CowgirlAprilBeatenText:
	text "Mist, verdammt!"
	done

SafariZoneEastAreaSignText:
	text "SAFARI-ZONE"
	line "Ostbereich"
	done

SafariZoneEastRestHouseSignText:
	text "Rasthaus"
	done

SafariZoneEastTrainerTipsSignText:
	text "TIPPS für TRAINER"

	para "Suche nachts oder"
	line "morgens nach"
	cont "seltenen #MON!"
	done
