Route43MahoganyGate_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4,  0, ROUTE_43, 1
	warp_event  5,  0, ROUTE_43, 2
	warp_event  4,  7, MAHOGANY_TOWN, 5
	warp_event  5,  7, MAHOGANY_TOWN, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route43MahoganyGateOfficer, -1

Route43MahoganyGateOfficer:
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue_jumptextfaceplayer Route43MahoganyGateOfficerRocketsClearedText
	jumpthistextfaceplayer

	text "Zuletzt sind hier"
	line "nur Leute durch-"
	cont "gekommen, die zum"
	cont "SEE DES ZORNS"
	cont "wollten."
	done


Route43MahoganyGateOfficerRocketsClearedText:
	text "In letzter Zeit"
	line "geht niemand mehr"
	cont "zum SEE DES"
	cont "ZORNS."
	done


