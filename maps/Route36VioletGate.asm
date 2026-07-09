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

	text "In letzter Zeit"
	line "sehe ich kaum"

	para "Leute aus"
	line "Dukatia City."
	done

.ClearedSudowoodo
	jumpthisopenedtext

	text "In letzter Zeit"
	line "ist"
	line "viel los, weil"

	para "viele Leute aus"
	line "Dukatia und"

	para "Viola City"
	line "kommen!"
	done



Route36VioletGateYoungsterText:
	text "Pflanzen sind"
	line "auch"
	line "Lebewesen!"

	para "Sie wollen sich"
	line "auch mal bewegen!"
	done