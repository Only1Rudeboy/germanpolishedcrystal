IlexForest_MapScriptHeader:
	def_scene_scripts
	scene_script IlexForestFarfetchdQuestScene, SCENE_ILEXFOREST_FARFETCHD_QUEST
	scene_script IlexForestCutSceneScene, SCENE_ILEXFOREST_CUT_SCENE
	scene_const SCENE_ILEXFOREST_NOOP

	def_callbacks
	callback MAPCALLBACK_OBJECTS, IlexForestFarfetchdCallback

	def_warp_events
	warp_event  3,  7, ROUTE_34_ILEX_FOREST_GATE, 3
	warp_event  5, 44, ILEX_FOREST_AZALEA_GATE, 1
	warp_event  5, 45, ILEX_FOREST_AZALEA_GATE, 2
	warp_event 25, 24, HIDDEN_TREE_GROTTO, 1

	def_coord_events
	coord_event  9, 31, SCENE_ILEXFOREST_NOOP, IlexForestApprenticeTrigger

	def_bg_events
	bg_event  5, 19, BGEVENT_JUMPTEXT, IlexForestSignpost
	bg_event 17, 33, BGEVENT_JUMPTEXT, IlexForestTrainerTips
	bg_event 13,  9, BGEVENT_ITEM + ETHER, EVENT_ILEX_FOREST_HIDDEN_ETHER
	bg_event 24, 16, BGEVENT_ITEM + SUPER_POTION, EVENT_ILEX_FOREST_HIDDEN_SUPER_POTION
	bg_event  3, 19, BGEVENT_ITEM + FULL_HEAL, EVENT_ILEX_FOREST_HIDDEN_FULL_HEAL
	bg_event 20,  9, BGEVENT_JUMPTEXT, Text_IlexForestMossRock
	bg_event 10, 24, BGEVENT_UP, IlexForestShrineScript
	bg_event 25, 24, BGEVENT_ITEM + SILVER_LEAF, EVENT_ILEX_FOREST_HIDDEN_SILVER_LEAF_1
	bg_event 19,  8, BGEVENT_ITEM + SILVER_LEAF, EVENT_ILEX_FOREST_HIDDEN_SILVER_LEAF_2
	bg_event 25, 23, BGEVENT_JUMPSTD, treegrotto, HIDDENGROTTO_ILEX_FOREST
	bg_event 26, 23, BGEVENT_JUMPSTD, treegrotto, HIDDENGROTTO_ILEX_FOREST

	def_object_events
	object_event 16, 33, SPRITE_FARFETCH_D, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, IlexForestFarfetchdScript, EVENT_ILEX_FOREST_FARFETCHD
	object_event  7, 30, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, IlexForestCharcoalMasterScript, EVENT_ILEX_FOREST_CHARCOAL_MASTER
	object_event 10, 31, SPRITE_KURT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ILEX_FOREST_KURT
	object_event  5, 26, SPRITE_PICNICKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Text_IlexForestLass, EVENT_ILEX_FOREST_LASS
	object_event 10, 26, SPRITE_CELEBI, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ILEX_FOREST_CELEBI
	object_event  9, 25, SPRITE_LYRA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, IlexForestLyraScript, EVENT_ILEX_FOREST_LYRA
	object_event  9, 30, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, IlexForestCharcoalApprenticeScript, EVENT_ILEX_FOREST_APPRENTICE
	object_event 17, 16, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, IlexForestHeadbuttGuyScript, -1
	object_event 14,  3, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 0, GenericTrainerBugCatcherWayne, -1
	object_event  4, 16, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, IlexForestHoneyBoyText, EVENT_ROUTE_34_ILEX_FOREST_GATE_LASS
	cuttree_event 10, 27, EVENT_ILEX_FOREST_CUT_TREE
	itemball_event 22, 34, REVIVE, 1, EVENT_ILEX_FOREST_REVIVE
	itemball_event 11, 19, X_ATTACK, 1, EVENT_ILEX_FOREST_X_ATTACK
	itemball_event 25, 17, ANTIDOTE, 1, EVENT_ILEX_FOREST_ANTIDOTE
	itemball_event 29,  3, MULCH, 1, EVENT_ILEX_FOREST_MULCH

	object_const_def
	const ILEXFOREST_FARFETCHD
	const ILEXFOREST_BLACK_BELT
	const ILEXFOREST_KURT
	const ILEXFOREST_LASS
	const ILEXFOREST_CELEBI
	const ILEXFOREST_LYRA
	const ILEXFOREST_YOUNGSTER

IlexForestCutSceneScene:
	sdefer IlexForestFinishCelebiEventScript
IlexForestFarfetchdQuestScene:
	end

IlexForestFarfetchdCallback:
	checkevent EVENT_GOT_HM01_CUT
	iftruefwd .Static
	readmem wFarfetchdPosition
	ifequalfwd  1, .PositionOne
	ifequalfwd  2, .PositionTwo
	ifequalfwd  3, .PositionThree
	ifequalfwd  4, .PositionFour
	ifequalfwd  5, .PositionFive
	ifequalfwd  6, .PositionSix
	ifequalfwd  7, .PositionSeven
	ifequalfwd  8, .PositionEight
	ifequalfwd  9, .PositionNine
	ifequalfwd 10, .PositionTen
.Static:
	endcallback

.PositionOne:
	moveobject ILEXFOREST_FARFETCHD, 16, 33
	appear ILEXFOREST_FARFETCHD
	endcallback

.PositionTwo:
	moveobject ILEXFOREST_FARFETCHD, 17, 27
	appear ILEXFOREST_FARFETCHD
	endcallback

.PositionThree:
	moveobject ILEXFOREST_FARFETCHD, 22, 26
	appear ILEXFOREST_FARFETCHD
	endcallback

.PositionFour:
	moveobject ILEXFOREST_FARFETCHD, 31, 24
	appear ILEXFOREST_FARFETCHD
	endcallback

.PositionFive:
	moveobject ILEXFOREST_FARFETCHD, 30, 33
	appear ILEXFOREST_FARFETCHD
	endcallback

.PositionSix:
	moveobject ILEXFOREST_FARFETCHD, 26, 37
	appear ILEXFOREST_FARFETCHD
	endcallback

.PositionSeven:
	moveobject ILEXFOREST_FARFETCHD, 24, 33
	appear ILEXFOREST_FARFETCHD
	endcallback

.PositionEight:
	moveobject ILEXFOREST_FARFETCHD, 17, 31
	appear ILEXFOREST_FARFETCHD
	endcallback

.PositionNine:
	moveobject ILEXFOREST_FARFETCHD, 12, 37
	appear ILEXFOREST_FARFETCHD
	endcallback

.PositionTen:
	moveobject ILEXFOREST_FARFETCHD, 8, 30
	appear ILEXFOREST_FARFETCHD
	endcallback

IlexForestCharcoalApprenticeScript:
	checkevent EVENT_HERDED_FARFETCHD
	iftrue_jumptextfaceplayer IlexForestApprenticeAfterText
	setscene SCENE_ILEXFOREST_FARFETCHD_QUEST
	jumpthistextfaceplayer

	text "Oh nein… Mein Chef"
	line "wird stinksauer"
	cont "sein…"

	para "Das PORENTA, das"
	line "für die Holz-"

	para "kohle Bäume"
	line "zerschneidet, ist"
	cont "mir abgehauen."

	para "Ich kann hier im"
	line "STEINEICHEN-WALD"
	cont "nicht nach ihm"
	cont "suchen."

	para "Er ist mir zu"
	line "groß, dunkel und"
	cont "gruselig…"
	done


IlexForestFarfetchdScript:
	faceplayer
	readmem wFarfetchdPosition
	ifequalfwd  0, .Position1
	showcrytext Text_Kwaaaa, FARFETCH_D
	readmem wFarfetchdPosition
	ifequalfwd  2, .Position2
	ifequalfwd  3, .Position3
	ifequalfwd  4, .Position4
	ifequalfwd  5, .Position5
	ifequalfwd  6, .Position6
	ifequalfwd  7, .Position7
	ifequalfwd  8, .Position8
	ifequalfwd  9, .Position9
	ifequal 10, DoNothingScript

.Position1:
	faceplayer
	opentext
	writetext Text_ItsTheMissingPokemon
	promptbutton
	writetext Text_Kwaaaa
	cry FARFETCH_D
	waitbutton
	closetext
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetchd_Pos1_Pos2
.NewPosition2:
	moveobject ILEXFOREST_FARFETCHD, 17, 27
	setval 2
.NewPosition:
	disappear ILEXFOREST_FARFETCHD
	appear ILEXFOREST_FARFETCHD
	writemem wFarfetchdPosition
	end

.Position2:
	readvar VAR_FACING
	ifequalfwd DOWN, .Position2_Down
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetchd_Pos2_Pos3
.NewPosition3:
	moveobject ILEXFOREST_FARFETCHD, 22, 26
	setval 3
	sjump .NewPosition

.Position2_Down:
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetchd_Pos2_Pos8
.NewPosition8:
	moveobject ILEXFOREST_FARFETCHD, 17, 31
	setval 8
	sjump .NewPosition

.Position3:
	readvar VAR_FACING
	ifequalfwd LEFT, .Position3_Left
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetchd_Pos3_Pos4
.NewPosition4:
	moveobject ILEXFOREST_FARFETCHD, 31, 24
	setval 4
	sjump .NewPosition

.Position3_Left:
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetchd_Pos3_Pos2
	sjump .NewPosition2

.Position4:
	readvar VAR_FACING
	ifequalfwd UP, .Position4_Up
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetchd_Pos4_Pos5
.NewPosition5:
	moveobject ILEXFOREST_FARFETCHD, 30, 33
	setval 5
	sjump .NewPosition

.Position4_Up:
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetchd_Pos4_Pos3
	sjump .NewPosition3

.Position5:
	readvar VAR_FACING
	ifequalfwd UP, .Position5_Up
	ifequalfwd LEFT, .Position5_Left
	ifequalfwd RIGHT, .Position5_Right
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetchd_Pos5_Pos6
.NewPosition6:
	moveobject ILEXFOREST_FARFETCHD, 26, 37
	setval 6
	sjump .NewPosition

.Position5_Left:
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetchd_Pos5_Pos7
.NewPosition7:
	moveobject ILEXFOREST_FARFETCHD, 24, 33
	setval 7
	sjump .NewPosition

.Position5_Up:
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetched_Pos5_Pos4_Up
	sjump .NewPosition4

.Position5_Right:
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetched_Pos5_Pos4_Right
	sjump .NewPosition4

.Position6:
	readvar VAR_FACING
	ifequalfwd RIGHT, .Position6_Right
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetched_Pos6_Pos7
	sjump .NewPosition7

.Position6_Right:
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetched_Pos6_Pos5
	sjump .NewPosition5

.Position7:
	readvar VAR_FACING
	ifequalfwd DOWN, .Position7_Down
	ifequalfwd LEFT, .Position7_Left
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetched_Pos7_Pos8
	sjump .NewPosition8

.Position7_Left:
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetched_Pos7_Pos6
	sjump .NewPosition6

.Position7_Down:
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetched_Pos7_Pos5
	sjump .NewPosition5

.Position8:
	readvar VAR_FACING
	ifequalfwd UP, .Position8_Up
	ifequalfwd LEFT, .Position8_Left
	ifequalfwd RIGHT, .Position8_Right
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetched_Pos8_Pos9
	moveobject ILEXFOREST_FARFETCHD, 12, 37
	setval 9
	sjump .NewPosition

.Position8_Right:
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetched_Pos8_Pos7
	sjump .NewPosition7

.Position8_Up:
.Position8_Left:
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetched_Pos8_Pos2
	sjump .NewPosition2

.Position9:
	readvar VAR_FACING
	ifequalfwd DOWN, .Position9_Down
	ifequalfwd RIGHT, .Position9_Right
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetched_Pos9_Pos10
	appear ILEXFOREST_BLACK_BELT
	setevent EVENT_CHARCOAL_KILN_BOSS
	setevent EVENT_HERDED_FARFETCHD
	moveobject ILEXFOREST_FARFETCHD, 8, 30
	setval 10
	sjump .NewPosition

.Position9_Right:
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetched_Pos9_Pos8_Right
	sjump .NewPosition8

.Position9_Down:
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetched_Pos9_Pos8_Down
	sjump .NewPosition8

IlexForestFinishCelebiEventScript:
	setevent EVENT_TIME_TRAVEL_FINISHED
	clearevent EVENT_TIME_TRAVELING
	setscene SCENE_ILEXFOREST_FARFETCHD_QUEST
	pause 30
	showemote EMOTE_SHOCK, ILEXFOREST_LYRA, 15
	applyonemovement ILEXFOREST_LYRA, slow_step_down
	turnobject ILEXFOREST_LYRA, RIGHT
	turnobject PLAYER, LEFT
	opentext
	writetext Text_IlexForestLyraWorried
	waitbutton
	writetext Text_IlexForestLyraArmorSuit
	waitbutton
	closetext
	follow ILEXFOREST_LYRA, PLAYER
	applyonemovement ILEXFOREST_LYRA, slow_step_up
	stopfollow
	turnobject PLAYER, UP
	turnobject ILEXFOREST_LYRA, DOWN
	setlasttalked ILEXFOREST_LYRA
	opentext
	sjumpfwd IlexForestLyraContinueScript

IlexForestLyraScript:
	faceplayer
	opentext
	writetext Text_IlexForestLyraArmorSuit
	promptbutton
IlexForestLyraContinueScript:
	verbosegiveitem ARMOR_SUIT
	iffalse_endtext
	setevent EVENT_GOT_ARMOR_SUIT
	writetext Text_IlexForestLyraGoodbye
	waitbutton
	closetext
	readvar VAR_FACING
	ifequalfwd LEFT, .NotBlockingPath
	applymovement PLAYER, MovementData_PlayerStepAside
.NotBlockingPath
	applymovement ILEXFOREST_LYRA, MovementData_IlexForestLyraLeaves
	disappear ILEXFOREST_LYRA
	end

IlexForestApprenticeTrigger:
	showemote EMOTE_SHOCK, ILEXFOREST_YOUNGSTER, 15
	turnobject PLAYER, UP
	sjump IlexForestCharcoalApprenticeScript

IlexForestCharcoalMasterScript:
	checkevent EVENT_GOT_HM01_CUT
	iftrue_jumptextfaceplayer Text_CharcoalMasterTalkAfter
	faceplayer
	opentext
	writetext Text_CharcoalMasterIntro
	promptbutton
	verbosegivetmhm HM_CUT
	setevent EVENT_GOT_HM01_CUT
	writetext Text_CharcoalMasterOutro
	waitbutton
	closetext
	setevent EVENT_ILEX_FOREST_FARFETCHD
	setevent EVENT_ILEX_FOREST_APPRENTICE
	setevent EVENT_ILEX_FOREST_CHARCOAL_MASTER
	clearevent EVENT_CHARCOAL_KILN_FARFETCH_D
	clearevent EVENT_CHARCOAL_KILN_APPRENTICE
	clearevent EVENT_CHARCOAL_KILN_BOSS
	end

IlexForestHeadbuttGuyScript:
	faceplayer
	opentext
	checkkeyitem WING_CASE
	iftruefwd IlexForestTutorHeadbuttScript
	writetext Text_HeadbuttIntro
	promptbutton
	verbosegivekeyitem WING_CASE
	writetext Text_HeadbuttIntro2
	waitbutton
	setevent EVENT_LISTENED_TO_HEADBUTT_INTRO
IlexForestTutorHeadbuttScript:
	writetext Text_IlexForestTutorHeadbutt
	waitbutton
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	writetext Text_IlexForestTutorQuestion
	yesorno
	iffalsefwd .TutorRefused
	setval HEADBUTT
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpthisopenedtext

	text "Na gut."
	done

.NoSilverLeaf
	jumpthisopenedtext

	text "Ach, aber du hast"
	line "keine"
	cont "Silberblätter."

	para "Manchmal findest"
	line "du sie bei wilden"

	para "Myrapla oder am"
	line "Boden."
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "Benutze KOPFNUSS,"
	line "um Bäume zu"
	cont "schütteln."
	cont "Manchmal fallen"
	cont "schlafende #mon"
	cont "herunter."
	done

GenericTrainerBugCatcherWayne:
	generictrainer BUG_CATCHER, WAYNE, EVENT_BEAT_BUG_CATCHER_WAYNE, BugCatcherWayneSeenText, BugCatcherWayneBeatenText

	text "Ein #mon, das"
	line "ich noch nie zuvor"

	para "sah, fiel aus dem"
	line "Baum, als ich"
	cont "KOPFNUSS"
	cont "einsetzte."

	para "Ich sollte"
	line "KOPFNUSS auch an"
	cont "anderen Stellen"
	cont "einsetzen."
	done
IlexForestShrineScript:
	checkevent EVENT_FOREST_IS_RESTLESS
	iffalsefwd .DontDoCelebiEvent
	checkkeyitem GS_BALL
	iftruefwd .AskCelebiEvent
.DontDoCelebiEvent:
	checkevent EVENT_TIME_TRAVEL_FINISHED
	iftruefwd .DontDoGiovanniEvent
	checkpoke CELEBI
	iftruefwd .StartGiovanniEvent
.DontDoGiovanniEvent
	jumptext Text_IlexForestShrine

.AskCelebiEvent:
	opentext
	writetext Text_ShrineCelebiEvent
	yesorno
	iftruefwd .CelebiEvent
	endtext

.CelebiEvent:
	takekeyitem GS_BALL
	clearevent EVENT_FOREST_IS_RESTLESS
	setevent EVENT_AZALEA_TOWN_KURT
	disappear ILEXFOREST_LASS
	clearevent EVENT_ROUTE_34_ILEX_FOREST_GATE_LASS
	writetext Text_InsertGSBall
	waitbutton
	closetext
	pause 20
	showemote EMOTE_SHOCK, PLAYER, 20
	special Special_FadeOutMusic
	applymovement PLAYER, IlexForestPlayerStepsDownMovement
	pause 30
	turnobject PLAYER, DOWN
	pause 20
	clearflag ENGINE_HAVE_EXAMINED_GS_BALL
	special Special_CelebiShrineEvent
	loadwildmon CELEBI, 30
	startbattle
	reloadmapafterbattle
	pause 20
	special CheckBattleCaughtResult
	iffalse DoNothingScript
	setflag ENGINE_PLAYER_CAUGHT_CELEBI
	appear ILEXFOREST_KURT
	applymovement ILEXFOREST_KURT, IlexForestKurtStepsUpMovement
	showtext Text_KurtCaughtCelebi
	applymovement ILEXFOREST_KURT, IlexFOrestKurtStepsDownMovement
	disappear ILEXFOREST_KURT
	end

.StartGiovanniEvent:
	showtext Text_IlexForestShrine
	showemote EMOTE_SHOCK, PLAYER, 15
	appear ILEXFOREST_CELEBI
	playsound SFX_BALL_POOF
	turnobject PLAYER, DOWN
	waitsfx
	pause 15
	cry CELEBI
	waitsfx
	pause 15
	applymovement ILEXFOREST_CELEBI, MovementData_CelebiDance
	pause 15
	showtext Text_CelebiDancedBeautifully
	playsound SFX_JUMP_OVER_LEDGE
	applymovement ILEXFOREST_CELEBI, MovementData_CelebiHop
	applyonemovement PLAYER, slow_step_down
	waitsfx
	special Special_FadeOutMusic
	playmusic MUSIC_LYRA_ENCOUNTER_HGSS
	moveobject ILEXFOREST_LYRA, 5, 26
	appear ILEXFOREST_LYRA
	applymovement ILEXFOREST_LYRA, MovementData_IlexForestLyraApproaches
	turnobject PLAYER, LEFT
	showtext Text_IlexForestLyraHello
	special RestartMapMusic
	pause 30
	playsound SFX_GAME_FREAK_LOGO_GS
	special FadeOutPalettes
	special LoadMapPalettes
	turnobject ILEXFOREST_CELEBI, DOWN
	pause 30
	special FadeInPalettes_EnableDynNoApply
	waitsfx
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, UP
	pause 15
	turnobject ILEXFOREST_LYRA, UP
	turnobject PLAYER, DOWN
	pause 15
	turnobject ILEXFOREST_LYRA, RIGHT
	turnobject PLAYER, LEFT
	showtext Text_IlexForestLyraWhatWasThat
	cry CELEBI
	showemote EMOTE_SHOCK, PLAYER, 15
	applymovement PLAYER, MovementData_PlayerStepBack
	waitsfx
	playsound SFX_PROTECT
	applymovement ILEXFOREST_CELEBI, MovementData_CelebiFloat
	waitsfx
	playsound SFX_GAME_FREAK_LOGO_GS
	special FadeOutPalettes
	pause 30
	waitsfx
	disappear ILEXFOREST_CELEBI
	disappear ILEXFOREST_LYRA
	setevent EVENT_TIME_TRAVELING
	warp ROUTE_22_PAST, 6, 7
	end

MovementData_Farfetchd_Pos1_Pos2:
	big_step_up
MovementData_Farfetched_Pos8_Pos2:
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	step_end

MovementData_Farfetchd_Pos2_Pos3:
	run_step_up
	run_step_up
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_down
	step_end

MovementData_Farfetchd_Pos4_Pos5:
	big_step_down
MovementData_Farfetchd_Pos2_Pos8:
	run_step_down
	run_step_down
	run_step_down
	run_step_down
	run_step_down
	step_end

MovementData_Farfetchd_Pos3_Pos4:
MovementData_Farfetched_Pos7_Pos5:
	big_step_right
MovementData_Farfetched_Pos8_Pos7:
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	step_end

MovementData_Farfetchd_Pos3_Pos2:
	run_step_up
	run_step_left
	run_step_left
	run_step_left
	run_step_left
	step_end

MovementData_Farfetchd_Pos4_Pos3:
	run_step_left
	jump_step_left
	run_step_left
	run_step_left
	step_end

MovementData_Farfetchd_Pos5_Pos6:
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	big_step_down
MovementData_Farfetchd_Pos5_Pos7:
	run_step_left
	run_step_left
	run_step_left
	run_step_left
	step_end

MovementData_Farfetched_Pos5_Pos4_Up:
	run_step_up
	run_step_up
	run_step_up
	run_step_right
	run_step_up
	step_end

MovementData_Farfetched_Pos5_Pos4_Right:
	run_step_right
	turn_head_up
	step_sleep_1
	turn_head_down
	step_sleep_1
	turn_head_up
	step_sleep_1
	run_step_down
	run_step_down
	fix_facing
	jump_step_up
	step_sleep_8
	step_sleep_8
	remove_fixed_facing
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	step_end

MovementData_Farfetched_Pos6_Pos7:
	run_step_left
	run_step_left
	run_step_left
	run_step_up
	run_step_up
	run_step_right
	run_step_up
	run_step_up
	step_end

MovementData_Farfetched_Pos6_Pos5:
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	step_end

MovementData_Farfetched_Pos7_Pos8:
	run_step_up
	run_step_up
	run_step_left
	run_step_left
	run_step_left
	run_step_left
	run_step_left
	step_end

MovementData_Farfetched_Pos7_Pos6:
	run_step_down
	run_step_down
	run_step_left
	run_step_down
	run_step_down
	run_step_right
	run_step_right
	run_step_right
	step_end

MovementData_Farfetched_Pos8_Pos9:
	run_step_down
	run_step_left
	run_step_down
	run_step_down
	run_step_down
	run_step_down
	run_step_down
	step_end

MovementData_Farfetched_Pos9_Pos10:
	run_step_left
	run_step_left
	fix_facing
	jump_step_right
	step_sleep_8
	step_sleep_8
	remove_fixed_facing
	run_step_left
	run_step_left
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	step_end

MovementData_Farfetched_Pos9_Pos8_Right:
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	step_end

MovementData_Farfetched_Pos9_Pos8_Down:
	run_step_left
	run_step_left
	fix_facing
	jump_step_right
	step_sleep_8
	step_sleep_8
	remove_fixed_facing
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	step_end

IlexForestKurtStepsUpMovement:
	step_up
	step_up
	step_up
	step_up
	step_end

IlexFOrestKurtStepsDownMovement:
	step_down
	step_down
	step_down
	step_down
	step_end

IlexForestPlayerStepsDownMovement:
	fix_facing
	slow_step_down
	remove_fixed_facing
	step_end

MovementData_CelebiDance:
	slow_step_left
	slow_step_right
	slow_step_right
	slow_step_left
	step_sleep_4
	turn_head_up
	step_sleep_4
	turn_head_left
	step_sleep_4
	turn_head_down
	step_sleep_4
	turn_head_right
	step_sleep_4
	turn_head_up
	step_sleep_4
	turn_head_left
	step_sleep_4
	turn_head_down
	step_sleep_4
	turn_head_right
	step_sleep_4
	turn_head_up
	step_sleep_4
	step_end

MovementData_CelebiHop:
	jump_step_down
	slow_step_up
	step_end

MovementData_CelebiFloat:
	turn_head_down
	fix_facing
	slow_step_up
	slow_step_up
	slow_step_up
	remove_fixed_facing
	step_end

MovementData_PlayerStepBack:
	fix_facing
	slow_step_right
	remove_fixed_facing
	step_end

MovementData_IlexForestLyraApproaches:
	slow_step_right
	slow_step_right
	slow_step_right
	slow_step_right
	step_end

MovementData_PlayerStepAside:
	slow_step_right
	turn_head_left
	step_end

MovementData_IlexForestLyraLeaves:
	slow_step_down
	slow_step_left
	slow_step_left
	slow_step_left
	slow_step_left
	step_end


IlexForestApprenticeAfterText:
	text "Wow! Vielen Dank"
	line "auch!"

	para "Die #mon von"
	line "meinem Boss"
	cont "gehorchen mir"
	cont "nicht, da ich"
	cont "keinen ORDEN"
	cont "besitze."
	done





Text_ItsTheMissingPokemon:
	text "Das ist das"
	line "verschollene"
	cont "#mon!"
	done





Text_Kwaaaa:
	text "PORENTA: Quack!"
	done





Text_CharcoalMasterIntro:
	text "Ah! Mein PORENTA!"

	para "Du hast es für uns"
	line "gefunden?"

	para "Wir können ohne es"
	line "nicht den"

	para "ZERSCHNEIDER"
	line "einsetzen, mit dem"
	cont "wir Bäume fällen,"
	cont "um Holzkohle zu"
	cont "finden."

	para "Danke!"

	para "Wie kann ich dir"
	line "danken…"

	para "Ah genau! Nimm"
	line "dies."
	done





Text_CharcoalMasterOutro:
	text "Diese VM enthält"
	line "ZERSCHNEIDER."

	para "Bring sie einem"
	line "#mon bei, um"
	cont "kleine Sträucher"
	cont "zu zerschneiden."

	para "Du benötigst noch"
	line "den ORDEN aus der"

	para "#mon-ARENA von"
	line "AZALEA CITY, um"
	cont "sie einzusetzen."
	done





Text_CharcoalMasterTalkAfter:
	text "Soll ich dich"
	line "lehren, wie man"

	para "ein Köhler wird?"

	para "In zehn Jahren"
	line "wirst du ein"
	cont "Meister sein!"
	done





Text_HeadbuttIntro:
	text "Was ich mache? Ich"
	line "setze"

	para "KOPFNUSS ein, um"
	line "Bäume zu"

	para "schütteln. Das"
	line "macht Spaß!"

	para "Probier es doch"
	line "auch einmal!"
	done





Text_HeadbuttIntro2:
	text "Ach, und wenn"
	line "keins deiner"
	cont "#mon KOPFNUSS"
	cont "kann?"

	para "Kein Problem!"
	done

Text_IlexForestTutorHeadbutt:
	text "Ich bringe deinem"
	line "#mon KOPFNUSS"

	para "bei, wenn du mir"
	line "ein Silberblatt"
	cont "gibst."
	done


Text_IlexForestTutorQuestion:
	text "Soll ich deinem"
	line "#mon KOPFNUSS"
	cont "beibringen?"
	done



Text_IlexForestLass:
	text "Ist dem Waldpatron"
	line "etwas zugestoßen?"
	done





Text_IlexForestMossRock:
	text "Der Felsen ist mit"
	line "Moos bedeckt."

	para "Er fühlt sich"
	line "angenehm kühl an."
	done

IlexForestSignpost:
	text "Der STEINEICHEN-"
	line "WALD ist so dicht,"

	para "dass man den"
	line "Himmel nicht sehen"
	cont "kann."

	para "Halte Ausschau"
	line "nach verlorenen"
	cont "Gegenständen."
	done
IlexForestTrainerTips:
	text "Trainer-Tipps"

	para "Solange du eine VM"
	line "in deinem RUCKSACK"
	cont "hast,"

	para "und ein #mon im"
	line "Team, das die VM"

	para "einsetzen kann,"
	line "kannst du sie"

	para "auch außerhalb von"
	line "Kämpfen nutzen."

	para "Du musst sie ihm"
	line "nicht mal"
	cont "beibringen!"
	done

Text_IlexForestShrine:
	text "STEINEICHENWALD-"
	line "SCHREIN…"

	para "Er wurde zu Ehren"
	line "des Waldpatrons"
	cont "aufgestellt…"
	done





Text_ShrineCelebiEvent:
	text "STEINEICHENWALD-"
	line "SCHREIN…"

	para "Er wurde zu Ehren"
	line "des Waldpatrons"
	cont "aufgestellt…"

	para "Ach? Was ist das?"

	para "Ein Loch. Es"
	line "scheint, als ob"

	para "der GS-BALL genau"
	line "hier hinein passt."

	para "Den GS-BALL hier"
	line "hineinlegen?"
	done





Text_InsertGSBall:
	text "<PLAYER> legt den"
	line "GS-BALL hinein."
	done





Text_KurtCaughtCelebi:
	text "Wow, das war doch"
	line "schon etwas!"

	para "<PLAYER>, das war"
	line "klasse. Danke!"

	para "Die Legenden um"
	line "diesen SCHREIN"
	cont "waren doch wahr."

	para "Ich fühle mich"
	line "dadurch beflügelt."

	para "Es spornt mich an,"
	line "bessere BÄLLE zu"
	cont "fertigen!"

	para "Ich gehe!"
	done





Text_CelebiDancedBeautifully:
	text "Celebi hat"
	line "wunderschön"
	cont "getanzt!"
	done

Text_IlexForestLyraHello:
	text "Lyra: Hi,"
	line "<PLAYER>. Kennst"
	cont "du die"

	para "Legende vom"
	line "SCHREIN?"

	para "Man sagt, dass"
	line "Leute"
	cont "verschwinden,"

	para "wenn sie ihn"
	line "stören."
	done

Text_IlexForestLyraWhatWasThat:
	text "Lyra: … Was war"
	line "das?"
	done

Text_IlexForestLyraWorried:
	text "Lyra: …<PLAYER>?"
	line "Du bist wirklich"
	cont "zurück?"

	para "Ich hab dich so"
	line "vermisst! Celebi"

	para "hat mich hierher"
	line "geschickt und du"
	cont "warst weg…"

	para "Ich dachte, du"
	line "bleibst für immer"
	cont "in der Vergangen-"
	cont "heit stecken!"

	para "…"

	para "Wenigstens sind"
	line "wir beide wieder"
	cont "sicher in unserer"
	cont "Zeit zurück."
	done

Text_IlexForestLyraArmorSuit:
	text "Lyra: Was für ein"
	line "seltsames"
	cont "Abenteuer hattest"
	cont "du allein?"

	para "Das hast du fallen"
	line "lassen, als Celebi"
	cont "dich"
	cont "zurückbrachte…"
	done

Text_IlexForestLyraGoodbye:
	text "Lyra: Das war ein"
	line "echt seltsamer"
	cont "Tag."

	para "Ich bin erschöpft,"
	line "ich gehe jetzt"
	cont "besser."

	para "Du solltest dich"
	line "auch ausruhen,"
	cont "<PLAYER>."

	para "Bis bald!"
	done

BugCatcherWayneSeenText:
	text "Schleich dich"
	line "nicht an!"

	para "Du hast ein"
	line "#mon verjagt!"
	done





BugCatcherWayneBeatenText:
	text "Dieses #mon"
	line "habe ich noch nie"
	cont "zuvor gesehen…"
	done





IlexForestHoneyBoyText:
	text "Ich schmiere"
if DEF(FAITHFUL)
	line "Honig auf den"
	cont "Boden."
else
	line "süßen Honig auf"
	cont "den Boden."
endc

	para "Das #mon meiner"
	line "Schwester sammelt"
	cont "ihn."

	para "So lockt man"
	line "#mon auf dem"

	para "gleichen Level wie"
	line "ich an, für faire"
	cont "Kämpfe."
	done
