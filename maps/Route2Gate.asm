Route2Gate_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4,  0, ROUTE_2_NORTH, 2
	warp_event  5,  0, ROUTE_2_NORTH, 3
	warp_event  4,  7, ROUTE_2_SOUTH, 1
	warp_event  5,  7, ROUTE_2_SOUTH, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  6,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route2GateScientistText, -1

Route2GateScientistText:
	text "Bist du <PLAYER>?"

	para "Ich bin der"
	line "ASSISTENT von"
	cont "PROF. EICH."

	para "Ich wusste nicht,"
	line "dass du hier bist."

	para "PROF. EICHs LABOR"
	line "ist gleich hier in"
	cont "ALABASTIA."
	done


