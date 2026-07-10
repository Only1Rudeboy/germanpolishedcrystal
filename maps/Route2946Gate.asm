Route2946Gate_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4,  0, ROUTE_46, 1
	warp_event  5,  0, ROUTE_46, 2
	warp_event  4,  7, ROUTE_29, 1
	warp_event  5,  7, ROUTE_29, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route29Route46GateOfficerText, -1
	object_event  6,  4, SPRITE_CAMPER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route29Route46GateYoungsterText, -1

Route29Route46GateOfficerText:
	text "Du kannst die"
	line "Stufen nicht"
	cont "hinaufklettern."

	para "Du kannst sie aber"
	line "hinabspringen und"
	cont "sie als Abkürzung"
	cont "benutzen."
	done
Route29Route46GateYoungsterText:
	text "Verschiedene"
	line "#mon tauchen"
	cont "hier auf."

	para "Wenn du alle"
	line "schnappen"
	cont "möchtest, dann"
	cont "musst du überall"
	cont "suchen."
	done
