Route1617Gate2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  7,  7, ROUTE_16_17_GATE_2F, -1

	def_coord_events

	def_bg_events
	bg_event  1,  2, BGEVENT_UP, Route1617Gate2FBinoculars1
	bg_event  6,  2, BGEVENT_UP, Route1617Gate2FBinoculars2

	def_object_events
	object_event 2, 5, SPRITE_PSYCHIC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Route1617Gate2FPsychicScript, -1

Route1617Gate2FPsychicScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_TRICK_ROOM_INTRO
	iftruefwd Route1617Gate2FTutorTrickRoomScript
	writetext Route1617Gate2FPsychicText
	waitbutton
	setevent EVENT_LISTENED_TO_TRICK_ROOM_INTRO
Route1617Gate2FTutorTrickRoomScript:
	writetext Text_Route1617Gate2FTutorTrickRoom
	waitbutton
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	writetext Text_Route1617Gate2FTutorQuestion
	yesorno
	iffalsefwd .TutorRefused
	setval TRICK_ROOM
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpthisopenedtext

	text "Schade."
	done

.NoSilverLeaf
	jumpthisopenedtext

	text "Aber ich brauche"
	line "zuerst ein"
	cont "Silber-"
	cont "blatt,"

	para "also komm wieder,"
	line "wenn du eins"
	cont "hast."
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "Meine Technik ist"
	line "ziemlich clever,"
	cont "findest du nicht?"
	done

Route1617Gate2FBinoculars1:
	jumpthistext

	text "Durch das"
	line "Fernglas"
	line "geschaut."

	para "Das ist das Kauf-"
	line "haus in Dukatia!"
	done

Route1617Gate2FBinoculars2:
	jumpthistext

	text "Durch das"
	line "Fernglas"
	line "geschaut."

	para "Da ist ein langer"
	line "Weg über Wasser!"
	done

Route1617Gate2FPsychicText:
	text "Nicht weit von"
	line "hier"
	line "gibt es einen"
	cont "Psycho,"

	para "der in einem"
	line "#mon-Kampf seine"

	para "Umgebung"
	line "verändern"
	line "kann."

	para "Er ist mein"
	line "Vorbild,"
	line "deshalb habe ich"

	para "an meiner eigenen"
	line "Technik"
	cont "gearbeitet."
	done

Text_Route1617Gate2FTutorTrickRoom:
	text "Ich kann deinem"
	line "#mon die Attacke"
	cont "Trick Room"
	cont "beibringen."

	para "Damit können"
	line "lang-"
	line "samere #mon"

	para "für eine Weile"
	line "schnellere über-"
	cont "holen."
	done

Text_Route1617Gate2FTutorQuestion:
	text "Ist ein"
	line "Silberblatt"
	line "ein fairer Preis?"
	done