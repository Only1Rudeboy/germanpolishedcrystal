MrPsychicsHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, SAFFRON_CITY, 5
	warp_event  3,  7, SAFFRON_CITY, 5

	def_coord_events

	def_bg_events
	bg_event  7,  1, BGEVENT_JUMPSTD, difficultbookshelf

	def_object_events
	object_event  5,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MrPsychic, -1

MrPsychic:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_ZEN_HEADBUTT_INTRO
	iftruefwd MrPsychicsHouseTutorZenHeadbuttScript
	writetext MrPsychicText
	waitbutton
	setevent EVENT_LISTENED_TO_ZEN_HEADBUTT_INTRO
MrPsychicsHouseTutorZenHeadbuttScript:
	writetext Text_MrPsychicsHouseTutorZenHeadbutt
	waitbutton
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	writetext Text_MrPsychicsHouseTutorQuestion
	yesorno
	iffalsefwd .TutorRefused
	setval ZEN_HEADBUTT
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpthisopenedtext

	text "…Ich lag falsch?"
	done

.NoSilverLeaf
	jumpthisopenedtext

	text "Du hast kein"
	line "Silberblatt…"
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "Dein #mon kann"
	line "jetzt Zen Headbutt"
	cont "einsetzen."
	done

MrPsychicText:
	text "…"

	para "…"

	para "…"

	para "…Verstanden!"

	para "Du willst Zen"
	line "Headbutt lernen!"
	done

Text_MrPsychicsHouseTutorZenHeadbutt:
	text "Ich bringe deinem"
	line "#mon Zen"

	para "Headbutt bei — für"
	line "ein Silberblatt."
	done


Text_MrPsychicsHouseTutorQuestion:
	text "Soll ich deinem"
	line "#mon Zen"
	cont "Headbutt"
	cont "beibringen?"
	done
