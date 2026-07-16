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

	; GSC-DE Dump 7068
	text "Der Vulkan auf"
	line "der ZINNOBERINSEL"
	cont "ist ausgebrochen."

	para "Durch die Eruption"
	line "wurde die ROUTE 19"
	cont "durch Felsbrocken"
	cont "zugeschüttet."

	para "Ich frage mich,"
	line "ob die Einwohner"
	cont "der ZINNOBERINSEL"
	cont "in Sicherheit"
	cont "sind…"
	done

; GSC-DE Dump 7069
Route19FuchsiaGateOfficerText_RocksCleared:
	text "Auf der ZINNOBER-"
	line "INSEL wurde"

	para "niemand verletzt."
	line "Das ist großartig!"
	done
