Route6SaffronGate_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4,  0, SAFFRON_CITY, 12
	warp_event  5,  0, SAFFRON_CITY, 13
	warp_event  4,  7, ROUTE_6, 2
	warp_event  5,  7, ROUTE_6, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route6SaffronGuardScript, -1

Route6SaffronGuardScript:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer Route6SaffronGuardMagnetTrainText
	jumpthistextfaceplayer

	; GSC-DE Dump 6108
	text "Willkommen in"
	line "SAFFRONIA CITY,"
	cont "der Heimat des"
	cont "MAGNETZUGs!"

	para "…Das sage ich"
	line "sonst immer, aber"

	para "der MAGNETZUG"
	line "fährt momentan"
	cont "nicht."

	para "Die Stromzufuhr"
	line "ist unterbrochen,"

	para "weil es im"
	line "KRAFTWERK ein"

	para "Problem gibt."
	done


Route6SaffronGuardMagnetTrainText:
	; GSC-DE Dump 6109
	text "Der MAGNETZUG ist"
	line "das Aushängeschild"

	para "von SAFFRONIA"
	line "CITY."
	done


