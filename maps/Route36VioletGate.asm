Route36VioletGate_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  0,  4, ROUTE_36, 5
	warp_event  0,  5, ROUTE_36, 6
	warp_event  9,  4, VIOLET_CITY, 10
	warp_event  9,  5, VIOLET_CITY, 11

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route36VioletGateOfficerScript, -1
	object_event  5,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route36VioletGateYoungsterText, -1

Route36VioletGateOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftruefwd .ClearedSudowoodo
	jumpthisopenedtext

	; kein Dump-Anker; CAPS-Orte
	text "In letzter Zeit"
	line "sehe ich kaum"
	para "Leute aus DUKATIA"
	line "CITY."
	done

.ClearedSudowoodo
	jumpthisopenedtext

	; kein Dump-Anker; CAPS-Orte
	text "In letzter Zeit"
	line "ist viel los, weil"
	para "viele Leute aus"
	line "DUKATIA und"
	para "VIOLA CITY kommen!"
	done

Route36VioletGateYoungsterText:
	; GSC-DE Dump
	text "Ich habe einen"
	line "wackeligen Baum"
	cont "gesehen!"
	para "Wenn du ihn be-"
	line "rührst, windet er"
	cont "sich und tanzt!"
	cont "Cool!"
	done
