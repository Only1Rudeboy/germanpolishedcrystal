Route19FuchsiaGate_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4,  0, FUCHSIA_CITY, 9
	warp_event  5,  0, FUCHSIA_CITY, 10
	warp_event  4,  7, ROUTE_19, 1
	warp_event  5,  7, ROUTE_19, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route19FuchsiaGateOfficerScript, -1

Route19FuchsiaGateOfficerScript:
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue_jumptextfaceplayer Route19FuchsiaGateOfficerText_RocksCleared
	jumpthistextfaceplayer

	text "Der Vulkan der"
	line "ZINNOBERINSEL ist"
	cont "ausgebrochen."
	para "Er schleuderte"
	line "Felsbrocken, die"
	para "ROUTE 19 auf"
	line "unbestimmte Zeit"
	cont "blockieren."
	para "Ich hoffe, den"
	line "Leuten auf der"
	para "ZINNOBERINSEL geht"
	line "es gut …"
	done


Route19FuchsiaGateOfficerText_RocksCleared:
	text "Auf der"
	line "ZINNOBER-INSEL"
	cont "wurde"
	para "niemand verletzt."
	line "Das ist großartig!"
	done


