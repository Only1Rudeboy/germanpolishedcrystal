Route15FuchsiaGate2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  7,  7, ROUTE_15_FUCHSIA_GATE_2F, -1

	def_coord_events

	def_bg_events
	bg_event  1,  2, BGEVENT_UP, Route15FuchsiaGate2FBinoculars1
	bg_event  6,  2, BGEVENT_UP, Route15FuchsiaGate2FBinoculars2

	def_object_events

Route15FuchsiaGate2FBinoculars1:
	jumpthistext

	text "Durch das"
	line "Fernglas"
	cont "geschaut."

	para "Die SAFARI-ZONE"
	line "sieht üppig aus!"
	done

Route15FuchsiaGate2FBinoculars2:
	jumpthistext

	text "Durch das"
	line "Fernglas"
	cont "geschaut."

	para "Sieht aus wie"
	line "eine Insel!"
	done
