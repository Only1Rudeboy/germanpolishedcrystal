Route5SaffronCityGate_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4,  0, ROUTE_5, 2
	warp_event  5,  0, ROUTE_5, 3
	warp_event  4,  7, SAFFRON_CITY, 9
	warp_event  5,  7, SAFFRON_CITY, 9

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route5SaffronCityGateOfficerText, -1
	object_event  6,  4, SPRITE_BLACK_BELT, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Route5SaffronCityGateBlackBeltScript, -1

Route5SaffronCityGateOfficerText:
	text "Du kommst aus"
	line "JOHTO, nicht wahr?"

	para "Wie gefällt dir"
	line "KANTO? Schön hier,"
	cont "oder nicht?"
	done
Route5SaffronCityGateBlackBeltScript:
	checkevent EVENT_GOT_PROTEIN_FROM_SAFFRON_GATE
	iftrue_jumptextfaceplayer .Text2
	faceplayer
	opentext
	writetext .Text1
	promptbutton
	verbosegiveitem PROTEIN
	iffalse_endtext
	setevent EVENT_GOT_PROTEIN_FROM_SAFFRON_GATE
	jumpthisopenedtext

.Text2:
	text "Iss viel PROTEIN"
	line "und werde stärker!"
	done

.Text1:
	text "Sieh dir diese"
	line "Muskeln an!"

	para "Beeindruckend,"
	line "nicht wahr?"

	para "Du bist ziemlich"
	line "dünn, also wenn du"
	cont "so groß werden"

	para "willst, brauchst"
	line "du etwas davon."
	done
