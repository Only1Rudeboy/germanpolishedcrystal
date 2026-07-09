Route39RuggedRoadGate_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_ROUTE39RUGGEDROADGATE_BICYCLE_CHECK

	def_callbacks

	def_warp_events
	warp_event  4,  0, RUGGED_ROAD_SOUTH, 1
	warp_event  5,  0, RUGGED_ROAD_SOUTH, 2
	warp_event  4,  7, ROUTE_39, 3
	warp_event  5,  7, ROUTE_39, 3

	def_coord_events
	coord_event  2,  4, SCENE_ROUTE39RUGGEDROADGATE_BICYCLE_CHECK, Route39RuggedRoadGateGoGogglesCheck
	coord_event  3,  4, SCENE_ROUTE39RUGGEDROADGATE_BICYCLE_CHECK, Route39RuggedRoadGateGoGogglesCheck
	coord_event  4,  4, SCENE_ROUTE39RUGGEDROADGATE_BICYCLE_CHECK, Route39RuggedRoadGateGoGogglesCheck
	coord_event  5,  4, SCENE_ROUTE39RUGGEDROADGATE_BICYCLE_CHECK, Route39RuggedRoadGateStepLeftOneTrigger
	coord_event  6,  4, SCENE_ROUTE39RUGGEDROADGATE_BICYCLE_CHECK, Route39RuggedRoadGateStepLeftTwoTrigger
	coord_event  7,  4, SCENE_ROUTE39RUGGEDROADGATE_BICYCLE_CHECK, Route39RuggedRoadGateStepLeftThreeTrigger

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route39RuggedRoadGateOfficerText, -1
	object_event  7,  5, SPRITE_BEACH_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route39RuggedRoadGateSwimmerScript, -1

	object_const_def
	const ROUTE39RUGGEDROADGATE_OFFICER

Route39RuggedRoadGateSwimmerScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_RARE_CANDY_FROM_RUGGED_ROAD_GATE
	iftrue_jumpopenedtext .LovelyDay
	writetext .BadDay
	checkkeyitem GO_GOGGLES
	iffalse_endtext
	writetext .FoundGoggles
	verbosegiveitem RARE_CANDY
	iffalse_jumpopenedtext .NoRoom
	setevent EVENT_GOT_RARE_CANDY_FROM_RUGGED_ROAD_GATE
	jumpthisopenedtext

	text "Behalte die"
	line "Brille."
	line "Nochmal danke!"
	done

.LovelyDay:
	text "Schöner Tag"
	line "heute,"
	line "nicht wahr?"

	para "Ich habe gehört,"
	line "die Aussicht vom"
	cont "Gipfel ist toll!"
	done

.BadDay:
	text "Argh! Ein"
	line "Bootswächter"
	line "hat mich vom"

	para "Hafen vertrieben,"
	line "als ich am Boot"
	cont "vorbeischwamm."

	para "Und ich habe"
	line "meine"
	line "Go-Brille"
	cont "verloren…"

	para "Mann, heute läuft"
	line "einfach nichts!"
	prompt

.FoundGoggles:
	text "Ach, du hast sie"
	line "gefunden!"

	para "Ich habe aber"
	line "schon neue"
	cont "gekauft…"

	para "Hier, nimm das"
	line "als"
	line "Dankeschön!"
	prompt

.NoRoom:
	text "Oh-oh, deine"
	line "Tasche"
	line "ist ziemlich"
	cont "voll…"
	done


Route39RuggedRoadGateStepLeftThreeTrigger:
	checkkeyitem GO_GOGGLES
	iftrue DoNothingScript
	applymovement PLAYER, Route39RuggedRoadGateStepLeftThreeMovementData
	sjumpfwd Route39RuggedRoadGateCannotPassScript

Route39RuggedRoadGateStepLeftTwoTrigger:
	checkkeyitem GO_GOGGLES
	iftrue DoNothingScript
	applymovement PLAYER, Route39RuggedRoadGateStepLeftTwoMovementData
	sjumpfwd Route39RuggedRoadGateCannotPassScript

Route39RuggedRoadGateStepLeftOneTrigger:
	checkkeyitem GO_GOGGLES
	iftrue DoNothingScript
	applyonemovement PLAYER, step_left
	sjumpfwd Route39RuggedRoadGateCannotPassScript

Route39RuggedRoadGateGoGogglesCheck:
	checkkeyitem GO_GOGGLES
	iftrue DoNothingScript
Route39RuggedRoadGateCannotPassScript:
	showemote EMOTE_SHOCK, ROUTE39RUGGEDROADGATE_OFFICER, 15
	turnobject PLAYER, LEFT
	showtext Route39RuggedRoadGateOfficerCannotPassText
	applymovement PLAYER, Route39RuggedRoadGateCannotPassMovement
	end

Route39RuggedRoadGateStepLeftThreeMovementData:
	step_left
Route39RuggedRoadGateStepLeftTwoMovementData:
	step_left
	step_left
	step_end

Route39RuggedRoadGateCannotPassMovement:
	step_down
	turn_head_up
	step_end

Route39RuggedRoadGateOfficerCannotPassText:
	text "Whoa, wohin"
	line "willst"
	line "du?"

	para "Der Rugged Road"
	line "zum"
	line "Snowtop Mountain"
	cont "ist wirklich"
	cont "hart!"

	para "Ohne Go-Brille"
	line "darf"
	line "ich dich nicht"
	cont "da durchlassen."
	done

Route39RuggedRoadGateOfficerText:
	text "Der Weg zum"
	line "Snowtop"
	line "Mountain kann"

	para "gefährlich sein!"

	para "Deshalb wurde"
	line "dort"
	line "ein #mon-Center"
	cont "gebaut."
	done
