Route12Gate2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  7,  7, ROUTE_12_GATE_2F, -1

	def_coord_events

	def_bg_events
	bg_event  1,  2, BGEVENT_UP, Route12Gate2FBinoculars1
	bg_event  6,  2, BGEVENT_UP, Route12Gate2FBinoculars2

	def_object_events

Route12Gate2FBinoculars1:
	jumpthistext

	text "Durch das Fernglas"
	line "geschaut."
	para "Ein Mann beim"
	line "Angeln!"
	done

Route12Gate2FBinoculars2:
	jumpthistext

	text "Durch das Fernglas"
	line "geschaut."
	para "Das ist der"
	line "FUNKTURM!"
	done
