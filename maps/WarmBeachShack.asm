WarmBeachShack_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, WARM_BEACH, 1
	warp_event  3,  7, WARM_BEACH, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  3, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, WarmBeachShackEndureFisherScript, -1
	object_event  3,  3, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, WarmBeachShackBodySlamFisherScript, -1

WarmBeachShackBodySlamFisherScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_BODY_SLAM_INTRO
	iftruefwd WarmBeachShackTutorBodySlamScript
	writetext WarmBeachShackBodySlamFisherText
	waitbutton
	setevent EVENT_LISTENED_TO_BODY_SLAM_INTRO
WarmBeachShackTutorBodySlamScript:
	writetext Text_WarmBeachShackBodySlamTutorBodySlamQuestion
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	yesorno
	iffalsefwd .TutorRefused
	setval BODY_SLAM
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpopenedtext Text_WarmBeachShackTutorsRefused

.NoSilverLeaf
	waitbutton
	jumpopenedtext Text_WarmBeachShackTutorsNoSilverLeaf

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "Komm wieder!"
	line "Boioing!"
	done

WarmBeachShackBodySlamFisherText:
	text "Bereit? Boing!"

	para "Wir machen ein"
	line "Sumo-Match, wer"

	para "zuerst aufgibt."

	para "Ich nutze Body"
	line "Slam, und er hält"
	cont "mit Endure durch!"
	done

Text_WarmBeachShackBodySlamTutorBodySlamQuestion:
	text "Soll ich einem"
	line "deiner #mon"

	para "Body Slam für ein"
	line "Silberblatt"
	cont "beibringen?"
	done


WarmBeachShackEndureFisherScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_ENDURE_INTRO
	iftruefwd WarmBeachShackTutorEndureScript
	writetext WarmBeachShackEndureFisherText
	waitbutton
	setevent EVENT_LISTENED_TO_ENDURE_INTRO
WarmBeachShackTutorEndureScript:
	writetext Text_WarmBeachShackEndureTutorEndureQuestion
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	yesorno
	iffalsefwd .TutorRefused
	setval ENDURE
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpopenedtext Text_WarmBeachShackTutorsRefused

.NoSilverLeaf
	waitbutton
	jumpopenedtext Text_WarmBeachShackTutorsNoSilverLeaf

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "Komm wieder! Nnnh!"
	done

WarmBeachShackEndureFisherText:
	text "Bereit? Nnnh!"

	para "Wir machen ein"
	line "Sumo-Match, wer"

	para "zuerst aufgibt."

	para "Er nutzt Body"
	line "Slam, und ich"
	cont "halte mit Endure"
	cont "durch!"
	done

Text_WarmBeachShackEndureTutorEndureQuestion:
	text "Soll ich einem"
	line "deiner #mon"

	para "Endure für ein"
	line "Silberblatt"
	cont "beibringen?"
	done


Text_WarmBeachShackTutorsNoSilverLeaf:
	text "Hä? Du hast keins!"
	done

Text_WarmBeachShackTutorsRefused:
	text "Na gut."
	done