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

	text "Willkommen in"
	line "SAFFRONIA CITY,"
	cont "der Heimat des"
	cont "MAGNETZUGS!"

	para "…So würde ich es"
	line "normalerweise"
	cont "sagen, aber der"
	cont "MAGNETZUG fährt"
	cont "gerade nicht."

	para "Er bekommt keinen"
	line "Strom, weil im"

	para "KRAFTWERK etwas"
	line "nicht stimmt."
	done


Route6SaffronGuardMagnetTrainText:
	text "Der MAGNETZUG ist"
	line "das Aushängeschild"
	para "von SAFFRONIA"
	line "CITY."
	done


