SlowpokeWellB2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  9, 11, SLOWPOKE_WELL_B1F, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  4, SPRITE_GYM_GUY, SPRITEMOVEDATA_WANDER, 2, 1, -1, 0, OBJECTTYPE_SCRIPT, 1, SlowpokeWellB2FGymGuideScript, -1
	itemball_event 15,  5, DAMP_ROCK, 1, EVENT_SLOWPOKE_WELL_B2F_DAMP_ROCK

SlowpokeWellB2FGymGuideScript:
	checkevent EVENT_GOT_KINGS_ROCK_IN_SLOWPOKE_WELL
	iftrue_jumptextfaceplayer SlowpokeWellB2FGymGuideText_GotKingsRock
	faceplayer
	opentext
	writetext SlowpokeWellB2FGymGuideText
	promptbutton
	verbosegiveitem KINGS_ROCK
	iffalse_endtext
	setevent EVENT_GOT_KINGS_ROCK_IN_SLOWPOKE_WELL
	endtext

SlowpokeWellB2FGymGuideText:
	text "Ich warte darauf,"
	line "dass sich FLEGMON"
	cont "entwickelt."
	para "Aufgrund meiner"
	line "Beobachtungen habe"
	cont "ich eine neue"
	cont "Entdeckung"
	cont "gemacht."
	para "Trägt FLEGMON"
	line "einen KING-STEIN"
	para "wird es oft von"
	line "einem MUSCHAS"
	cont "gebissen."
	para "Hier, ich gebe dir"
	line "einen von meinen."
	done



SlowpokeWellB2FGymGuideText_GotKingsRock:
	text "Ich werde mich wie"
	line "FLEGMON verhalten."
	para "Ich werde geduldig"
	line "abwarten, bis es"
	cont "sich entwickelt."
	done



