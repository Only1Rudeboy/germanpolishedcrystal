SafariZoneHub_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 16, 27, SAFARI_ZONE_FUCHSIA_GATE, 1
	warp_event 17, 27, SAFARI_ZONE_FUCHSIA_GATE, 2
	warp_event 31, 12, SAFARI_ZONE_EAST, 1
	warp_event 31, 13, SAFARI_ZONE_EAST, 2
	warp_event  2, 12, SAFARI_ZONE_WEST, 5
	warp_event  2, 13, SAFARI_ZONE_WEST, 6
	warp_event 16,  2, SAFARI_ZONE_NORTH, 5
	warp_event 17,  2, SAFARI_ZONE_NORTH, 6
	warp_event 19, 21, SAFARI_ZONE_HUB_REST_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 16, 24, BGEVENT_JUMPTEXT, SafariZoneHubAreaSignText
	bg_event 20, 22, BGEVENT_JUMPTEXT, SafariZoneHubRestHouseSignText

	def_object_events
	object_event 26,  6, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerBug_maniacKai, -1
	itemball_event 15, 12, NUGGET, 1, EVENT_SAFARI_ZONE_HUB_NUGGET
	itemball_event  8, 21, ULTRA_BALL, 1, EVENT_SAFARI_ZONE_HUB_ULTRA_BALL

GenericTrainerBug_maniacKai:
	generictrainer BUG_MANIAC, KAI, EVENT_BEAT_BUG_MANIAC_KAI, Bug_maniacKaiSeenText, Bug_maniacKaiBeatenText

	text "BLUZUK ist so"
	line "ähnlich wie"
	cont "SMETTBO!"

	para "Gewicht, Augen,"
	line "Fähigkeiten…"

	para "Evolution ist"
	line "manchmal seltsam."
	done

Bug_maniacKaiSeenText:
	text "Mein BLUZUK"
	line "entwickelte sich"
	cont "zu OMOT?!"
	done

Bug_maniacKaiBeatenText:
	text "Ich dachte, es"
	line "wird sich sicher"
	cont "zu SMETTBO"
	cont "entwickeln!"
	done

SafariZoneHubAreaSignText:
	text "SAFARI-ZONE"
	line "Zentralbereich"
	done

SafariZoneHubRestHouseSignText:
	text "Rasthaus"
	done
