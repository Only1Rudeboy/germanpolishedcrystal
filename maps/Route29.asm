Route29_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_ROUTE29_NOOP
	scene_const SCENE_ROUTE29_CATCH_TUTORIAL

	def_callbacks
	callback MAPCALLBACK_OBJECTS, Route29Tuscany

	def_warp_events
	warp_event 27,  1, ROUTE_29_46_GATE, 3

	def_coord_events
	coord_event 53,  8, SCENE_ROUTE29_CATCH_TUTORIAL, Route29Tutorial1
	coord_event 53,  9, SCENE_ROUTE29_CATCH_TUTORIAL, Route29Tutorial2

	def_bg_events
	bg_event 51,  7, BGEVENT_JUMPTEXT, Route29Sign1Text
	bg_event  3,  5, BGEVENT_JUMPTEXT, Route29Sign2Text
	bg_event 23,  4, BGEVENT_JUMPTEXT, Route29AdvancedTipsSignText

	def_object_events
	object_event 50, 12, SPRITE_LYRA, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LYRA_ROUTE_29
	object_event 29, 12, SPRITE_POKEFAN_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, TuscanyScript, EVENT_ROUTE_29_TUSCANY_OF_TUESDAY
	object_event 27, 16, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route29YoungsterText, -1
	object_event 15, 11, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route29TeacherText, -1
	cuttree_event 30,  9, EVENT_ROUTE_29_CUT_TREE_1
	cuttree_event 21, 11, EVENT_ROUTE_29_CUT_TREE_2
	fruittree_event 12,  2, FRUITTREE_ROUTE_29, ORAN_BERRY, PAL_NPC_BLUE
	object_event 25,  3, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route29FisherText, -1
	object_event 13,  4, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route29CooltrainerMScript, -1
	itemball_event 48,  2, POTION, 1, EVENT_ROUTE_29_POTION

	object_const_def
	const ROUTE29_LYRA
	const ROUTE29_TUSCANY

Route29Tuscany:
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iffalsefwd .TuscanyDisappears
	readvar VAR_WEEKDAY
	ifequalfwd TUESDAY, .TuscanyAppears
.TuscanyDisappears:
	disappear ROUTE29_TUSCANY
	endcallback

.TuscanyAppears
	appear ROUTE29_TUSCANY
	endcallback

Route29Tutorial1:
	turnobject ROUTE29_LYRA, UP
	showemote EMOTE_SHOCK, ROUTE29_LYRA, 15
	special Special_FadeOutMusic
	playmusic MUSIC_LYRA_ENCOUNTER_HGSS
	pause 15
	applymovement ROUTE29_LYRA, LyraMovementData1a
	turnobject PLAYER, LEFT
	opentext
	writetext CatchingTutorialIntroText
	yesorno
	iffalsefwd Route29RefusedTutorial
	closetext
	follow ROUTE29_LYRA, PLAYER
	applymovement ROUTE29_LYRA, LyraMovementData1b
	sjumpfwd Route29TutorialScript

Route29Tutorial2:
	turnobject ROUTE29_LYRA, UP
	showemote EMOTE_SHOCK, ROUTE29_LYRA, 15
	special Special_FadeOutMusic
	playmusic MUSIC_LYRA_ENCOUNTER_HGSS
	pause 15
	applymovement ROUTE29_LYRA, LyraMovementData2a
	turnobject PLAYER, LEFT
	opentext
	writetext CatchingTutorialIntroText
	yesorno
	iffalsefwd Route29RefusedTutorial
	closetext
	follow ROUTE29_LYRA, PLAYER
	applymovement ROUTE29_LYRA, LyraMovementData2b
Route29TutorialScript:
	stopfollow
	loadwildmon PIDGEY, 5
	catchtutorial BATTLETYPE_TUTORIAL
	special DeleteSavedMusic
	playmusic MUSIC_LYRA_DEPARTURE_HGSS
	turnobject ROUTE29_LYRA, UP
	opentext
	writetext CatchingTutorialDebriefText
Route29FinishTutorial:
	promptbutton
	verbosegiveitem POKE_BALL, 5
	writetext CatchingTutorialGoodbyeText
	waitbutton
	closetext
	applymovement ROUTE29_LYRA, LyraMovementData3
	disappear ROUTE29_LYRA
	setscene SCENE_ROUTE29_NOOP
	setevent EVENT_LEARNED_TO_CATCH_POKEMON
	playmusic MUSIC_ROUTE_29
	end

Route29RefusedTutorial:
	setevent EVENT_NEVER_LEARNED_TO_CATCH_POKEMON
	writetext CatchingTutorialRefusedText
	sjump Route29FinishTutorial

Route29CooltrainerMScript:
	checktime (1 << EVE) | (1 << NITE)
	iftrue_jumptextfaceplayer Text_WaitingForMorning
	jumpthistextfaceplayer

	text "Ich warte auf"
	line "#mon, die nur"
	para "abends oder nachts"
	line "auftauchen."
	done

TuscanyScript:
	checkevent EVENT_GOT_SILK_SCARF_FROM_TUSCANY
	iftrue_jumptextfaceplayer TuscanyTuesdayText
	faceplayer
	opentext
	readvar VAR_WEEKDAY
	ifnotequal TUESDAY, TuscanyNotTuesdayScript
	checkevent EVENT_MET_TUSCANY_OF_TUESDAY
	iftruefwd .MetTuscany
	writetext MeetTuscanyText
	promptbutton
	setevent EVENT_MET_TUSCANY_OF_TUESDAY
.MetTuscany:
	writetext TuscanyGivesGiftText
	promptbutton
	verbosegiveitem SILK_SCARF
	iffalse_endtext
	setevent EVENT_GOT_SILK_SCARF_FROM_TUSCANY
	jumpthisopenedtext

	text "DIETLINDE: Findest"
	line "du nicht auch,"
	cont "dass es elegant"
	cont "ist?"
	para "Es verstärkt"
	line "Normal-Attacken."
	para "Ich bin sicher, es"
	line "wird nützlich"
	cont "sein."
	done

TuscanyNotTuesdayScript:
	jumpthisopenedtext

	text "DIETLINDE: Heute"
	line "ist nicht"
	cont "Dienstag. Das ist"
	cont "bedauerlich …"
	done

LyraMovementData1a:
	step_up
LyraMovementData2a:
	step_up
	step_up
	step_up
	step_right
	step_right
	step_end

LyraMovementData1b:
	step_left
	step_left
	step_down
	step_down
	step_down
	step_down
	step_end

LyraMovementData2b:
	step_left
	step_left
	step_down
	step_down
	step_down
	step_end

LyraMovementData3:
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

CatchingTutorialIntroText:
	text "Ich habe dich"
	line "schon mehrmals"
	cont "gesehen."

	para "Wie viele #mon"
	line "hast du gefangen?"

	para "Soll ich dir"
	line "zeigen, wie man"
	cont "#mon fängt?"
	done




CatchingTutorialDebriefText:
	text "So geht das!"
	para "Wenn du sie zuerst"
	line "schwächst,"
	para "kannst du sie"
	line "leichter fangen."
	done




CatchingTutorialRefusedText:
	text "Schade … Ich"
	line "wollte mal mein"
	cont "Fangkönnen zeigen"
	cont "…"
	para "Na ja, nimm das"
	line "hier. Viel Glück!"
	done
CatchingTutorialGoodbyeText:
	text "LYRA: Bis bald!"
	done
Route29YoungsterText:
	text "Yo. Wie geht es"
	line "deinen #mon?"
	para "Sind sie schwach"
	line "und nicht"
	cont "kampfbereit, bleib"
	para "vom hohen Gras"
	line "fern."
	done




Route29TeacherText:
	text "Siehst du die"
	line "Stufen hier?"
	para "Du kannst nicht"
	line "hinaufklettern,"
	cont "aber"
	cont "hinunterspringen!"
	para "So kommst du nach"
	line "Neuborkia, ohne"
	para "durchs Gras zu"
	line "laufen."
	done




Route29FisherText:
	text "Ich wollte eine"
	line "Pause einlegen,"

	para "darum habe ich"
	line "meinen Spielstand"
	cont "abgespeichert."
	done





Route29CoolTrainerMText_WaitingForDay: ; unreferenced
	text "Ich warte auf"
	line "#mon, die nur"

	para "tagsüber"
	line "auftauchen."
	done
Text_WaitingForMorning:
	text "Ich warte auf"
	line "#mon, die"

	para "nur am VORMITTAG"
	line "auftauchen."
	done
MeetTuscanyText:
	text "DIETLINDE: Ich"
	line "glaube, wir"
	para "begegnen uns zum"
	line "ersten Mal!"
	para "Darf ich mich"
	line "vorstellen? Ich"
	para "bin DIETLINDE von"
	line "Dienstag."
	done




TuscanyGivesGiftText:
	text "Da wir uns zum"
	line "ersten Mal sehen,"

	para "schenke ich dir"
	line "ein ROSA BAND."
	done




TuscanyTuesdayText:
	text "DIETLINDE: Bist du"
	line "MONJA meiner"
	cont "älteren Schwester"
	cont "schon begegnet?"
	para "Oder meinem"
	line "kleinen Bruder"
	cont "MITKO?"
	para "Ich bin das zweite"
	line "von sieben"
	cont "Kindern."
	done




Route29Sign1Text:
	text "ROUTE 29"
	para "ROSALIA CITY"
	line "-NEUBORKIA"
	done




Route29Sign2Text:
	text "ROUTE 29"
	para "ROSALIA CITY"
	line "-NEUBORKIA"
	done




Route29AdvancedTipsSignText:
	text "Profi-Tipps!"
	para "Drücke Unten+B im"
	line "Titelbildschirm,"
	para "um die Uhr"
	line "zurückzusetzen!"
	para "Drücke Links+B, um"
	line "die Startoptionen"
	cont "zurückzusetzen!"
	done
