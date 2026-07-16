ElmsLab_MapScriptHeader:
	def_scene_scripts
	scene_script ElmsLabMeetElmScene, SCENE_ELMSLAB_MEET_ELM
	scene_script DoNothingScript, SCENE_ELMSLAB_CANT_LEAVE
	scene_script DoNothingScript, SCENE_ELMSLAB_NOOP
	scene_script DoNothingScript, SCENE_ELMSLAB_MEET_OFFICER
	scene_script DoNothingScript, SCENE_ELMSLAB_UNUSED
	scene_script DoNothingScript, SCENE_ELMSLAB_AIDE_GIVES_POTION
	scene_script DoNothingScript, SCENE_ELMSLAB_LYRA_BATTLE
	scene_script ElmsLabAideGivesPokeBallsScene, SCENE_ELMSLAB_AIDE_GIVES_POKE_BALLS

	def_callbacks
	callback MAPCALLBACK_OBJECTS, ElmsLabCallback_MoveElm

	def_warp_events
	warp_event  4, 11, NEW_BARK_TOWN, 1
	warp_event  5, 11, NEW_BARK_TOWN, 1

	def_coord_events
	coord_event  4,  6, SCENE_ELMSLAB_CANT_LEAVE, LabTryToLeaveScript
	coord_event  5,  6, SCENE_ELMSLAB_CANT_LEAVE, LabTryToLeaveScript
	coord_event  4,  5, SCENE_ELMSLAB_MEET_OFFICER, MeetCopScript
	coord_event  5,  5, SCENE_ELMSLAB_MEET_OFFICER, MeetCopScript2
	coord_event  4,  8, SCENE_ELMSLAB_AIDE_GIVES_POTION, AideScript_WalkPotions1
	coord_event  5,  8, SCENE_ELMSLAB_AIDE_GIVES_POTION, AideScript_WalkPotions2
	coord_event  4,  6, SCENE_ELMSLAB_LYRA_BATTLE, LyraBattleScript

	def_bg_events
	bg_event  2,  1, BGEVENT_READ, ElmsLabHealingMachine
	bg_event  6,  1, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  7,  1, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  8,  1, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  9,  1, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  0,  7, BGEVENT_JUMPTEXT, ElmsLabTravelTip1Text
	bg_event  1,  7, BGEVENT_JUMPTEXT, ElmsLabTravelTip2Text
	bg_event  2,  7, BGEVENT_JUMPTEXT, ElmsLabTravelTip3Text
	bg_event  3,  7, BGEVENT_JUMPTEXT, ElmsLabTravelTip4Text
	bg_event  6,  7, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  7,  7, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  8,  7, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  9,  7, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  9,  3, BGEVENT_JUMPTEXT, ElmsLabTrashcanText
	bg_event  5,  0, BGEVENT_READ, ElmsLabWindow
	bg_event  3,  5, BGEVENT_DOWN, ElmsLabPC

	def_object_events
	object_event  5,  2, SPRITE_ELM, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ProfElmScript, -1
	object_event  2,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ElmsAideScript, EVENT_ELMS_AIDE_IN_LAB
	object_event  6,  3, SPRITE_BALL_CUT_TREE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_ENV_RED, OBJECTTYPE_SCRIPT, 0, CyndaquilPokeBallScript, EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	object_event  7,  3, SPRITE_BALL_CUT_TREE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_ENV_BLUE, OBJECTTYPE_SCRIPT, 0, TotodilePokeBallScript, EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
	object_event  8,  3, SPRITE_BALL_CUT_TREE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_ENV_GREEN, OBJECTTYPE_SCRIPT, 0, ChikoritaPokeBallScript, EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
	object_event  5,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CopScript, EVENT_COP_IN_ELMS_LAB
	object_event  5, 11, SPRITE_LYRA, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ElmsLabLyraScript, EVENT_LYRA_IN_ELMS_LAB

	object_const_def
	const ELMSLAB_ELM
	const ELMSLAB_ELMS_AIDE
	const ELMSLAB_POKE_BALL1
	const ELMSLAB_POKE_BALL2
	const ELMSLAB_POKE_BALL3
	const ELMSLAB_OFFICER
	const ELMSLAB_LYRA

ElmsLabCallback_MoveElm:
	checkscene
	iftruefwd .Skip
	moveobject ELMSLAB_ELM, 3, 4
.Skip:
	endcallback

ElmsLabMeetElmScene:
	sdefer .Script
	end

.Script:
	follow PLAYER, ELMSLAB_LYRA
	applymovement PLAYER, ElmsLab_WalkUpToElmMovement
	stopfollow
	showemote EMOTE_SHOCK, ELMSLAB_ELM, 15
	turnobject ELMSLAB_ELM, RIGHT
	opentext
	writetext ElmText_Intro
.Loop:
	yesorno
	iftruefwd ElmsLab_ElmGetsEmail
	writetext ElmText_Refused
	sjump .Loop

ElmsLab_ElmGetsEmail:
if !DEF(DEBUG)
	writetext ElmText_Accepted
	promptbutton
	writetext ElmText_ResearchAmbitions
	waitbutton
	closetext
	playsound SFX_GLASS_TING
	pause 30
	showemote EMOTE_SHOCK, ELMSLAB_ELM, 10
	turnobject ELMSLAB_ELM, DOWN
	showtext ElmText_GotAnEmail
	opentext
	turnobject ELMSLAB_ELM, RIGHT
	writetext ElmText_MissionFromMrPokemon
	waitbutton
endc
	closetext
	applyonemovement ELMSLAB_ELM, step_up
	turnobject PLAYER, UP
	applymovement ELMSLAB_ELM, ElmsLab_ElmToDefaultPositionMovement
	turnobject PLAYER, RIGHT
	showtext ElmText_ChooseAPokemon
	setscene SCENE_ELMSLAB_CANT_LEAVE
	end

ElmsLabAideGivesPokeBallsScene:
	sdefer .Script
	end

.Script:
	turnobject ELMSLAB_ELMS_AIDE, DOWN
	showemote EMOTE_SHOCK, ELMSLAB_ELMS_AIDE, 15
	applymovement ELMSLAB_ELMS_AIDE, AideWalksDownMovement
	showtext AideText_ThiefReturnedMon
	applymovement ELMSLAB_ELMS_AIDE, AideWalksBackMovement
	turnobject ELMSLAB_ELMS_AIDE, DOWN
	setscene SCENE_ELMSLAB_NOOP
	end

ProfElmScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SS_TICKET_FROM_ELM
	iftruefwd .CheckMasterBall
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue ElmGiveTicketScript
.CheckMasterBall:
	checkevent EVENT_GOT_MASTER_BALL_FROM_ELM
	iftruefwd .CheckOddSouvenir
	checkflag ENGINE_RISINGBADGE
	iftrue ElmGiveMasterBallScript
.CheckOddSouvenir:
	checkevent EVENT_GOT_ODD_SOUVENIR_FROM_ELM
	iftrue ElmCheckBattleScript
	checkevent EVENT_SHOWED_TOGEPI_TO_ELM
	iftrue ElmGiveOddSouvenirScript
	checkevent EVENT_ELM_WANTS_TO_BATTLE
	iftrue ElmAskBattleScript
	checkevent EVENT_TOLD_ELM_ABOUT_TOGEPI_OVER_THE_PHONE
	iffalsefwd ElmCheckTogepiEgg
	scall ElmEggHatchedScript
	; need to reopen text boxes since ElmCheckGotEggAgain's
	; jumpopenedtext will close them.
	jumpthistext

	text "<PLAYER>? Ich"
	line "dachte, etwas wäre"
	cont "aus dem EI"
	cont "geschlüpft."

	para "Wo ist das"
	line "#MON?"
	done
ElmEggHatchedScript:
	setmonval TOGEPI
	special Special_FindThatSpeciesYourTrainerID
	iftrue ShowElmTogepiScript
	setmonval TOGETIC
	special Special_FindThatSpeciesYourTrainerID
	iftrue ShowElmTogepiScript
	setmonval TOGEKISS
	special Special_FindThatSpeciesYourTrainerID
	iftrue ShowElmTogepiScript
	sjumpfwd ElmCheckGotEggAgain

ElmCheckTogepiEgg:
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	iffalsefwd ElmCheckGotEggAgain
	checkevent EVENT_TOGEPI_HATCHED
	iftrue ElmEggHatchedScript
ElmCheckGotEggAgain:
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE ; why are we checking it again?
	iftrue_jumpopenedtext ElmWaitingEggHatchText
	checkflag ENGINE_ZEPHYRBADGE
	iftrue_jumpopenedtext ElmAideHasEggText
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue_jumpopenedtext ElmStudyingEggText
	checkevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
	iftrue ElmAfterTheftScript
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue_jumpopenedtext ElmDescribesMrPokemonText
	jumpthisopenedtext

	text "Wenn ein wildes"
	line "#MON auftaucht,"
	cont "lass dein #MON"
	cont "kämpfen!"
	done





LabTryToLeaveScript:
	turnobject ELMSLAB_ELM, DOWN
	showtext LabWhereGoingText
	applyonemovement PLAYER, step_up
	end


CyndaquilPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue_jumptext ElmPokeBallText
	turnobject ELMSLAB_ELM, DOWN
	reanchormap
	pokepic CYNDAQUIL
	cry CYNDAQUIL
	waitbutton
	closepokepic
	opentext
	writetext TakeCyndaquilText
	yesorno
	iffalse_jumpopenedtext DidntChooseStarterText
	disappear ELMSLAB_POKE_BALL1
	setevent EVENT_GOT_CYNDAQUIL_FROM_ELM
	writetext ChoseStarterText
	promptbutton
	waitsfx
	givepoke CYNDAQUIL, PLAIN_FORM, 5, ORAN_BERRY
	writetext LyraChoosesStarterText
	waitbutton
	closetext
	applymovement ELMSLAB_LYRA, LyraPicksChikoritaMovement
	pause 15
	disappear ELMSLAB_POKE_BALL3
	opentext
	getmonname CHIKORITA, STRING_BUFFER_3
	writetext LyraReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	writetext LyraNicknamedChikoritaText
	waitbutton
	closetext
	applymovement ELMSLAB_LYRA, LyraAfterChikoritaMovement
	readvar VAR_FACING
	ifequalfwd RIGHT, ElmDirectionsScript
	applymovement PLAYER, AfterCyndaquilMovement
	sjumpfwd ElmDirectionsScript

TotodilePokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue_jumptext ElmPokeBallText
	turnobject ELMSLAB_ELM, DOWN
	reanchormap
	pokepic TOTODILE
	cry TOTODILE
	waitbutton
	closepokepic
	opentext
	writetext TakeTotodileText
	yesorno
	iffalse_jumpopenedtext DidntChooseStarterText
	disappear ELMSLAB_POKE_BALL2
	setevent EVENT_GOT_TOTODILE_FROM_ELM
	writetext ChoseStarterText
	promptbutton
	waitsfx
	givepoke TOTODILE, PLAIN_FORM, 5, ORAN_BERRY
	writetext LyraChoosesStarterText
	waitbutton
	closetext
	applymovement ELMSLAB_LYRA, LyraPicksCyndaquilMovement
	pause 15
	disappear ELMSLAB_POKE_BALL1
	opentext
	getmonname CYNDAQUIL, STRING_BUFFER_3
	writetext LyraReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	writetext LyraNicknamedCyndaquilText
	waitbutton
	closetext
	applymovement ELMSLAB_LYRA, LyraAfterCyndaquilMovement
	applymovement PLAYER, AfterTotodileMovement
	sjumpfwd ElmDirectionsScript

ChikoritaPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue_jumptext ElmPokeBallText
	turnobject ELMSLAB_ELM, DOWN
	reanchormap
	pokepic CHIKORITA
	cry CHIKORITA
	waitbutton
	closepokepic
	opentext
	writetext TakeChikoritaText
	yesorno
	iffalse_jumpopenedtext DidntChooseStarterText
	disappear ELMSLAB_POKE_BALL3
	setevent EVENT_GOT_CHIKORITA_FROM_ELM
	writetext ChoseStarterText
	promptbutton
	waitsfx
	givepoke CHIKORITA, PLAIN_FORM, 5, ORAN_BERRY
	writetext LyraChoosesStarterText
	waitbutton
	closetext
	applymovement ELMSLAB_LYRA, LyraPicksTotodileMovement
	pause 15
	disappear ELMSLAB_POKE_BALL2
	opentext
	getmonname TOTODILE, STRING_BUFFER_3
	writetext LyraReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	writetext LyraNicknamedTotodileText
	waitbutton
	closetext
	applymovement ELMSLAB_LYRA, LyraAfterTotodileMovement
	applymovement PLAYER, AfterChikoritaMovement
	; fallthrough

ElmDirectionsScript:
	turnobject PLAYER, UP
if !DEF(DEBUG)
	showtext ElmDirectionsText1
endc
	addcellnum PHONE_ELM
	opentext
	writetext GotElmsNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	waitbutton
	closetext
	turnobject ELMSLAB_ELM, LEFT
	showtext ElmDirectionsText2
	turnobject ELMSLAB_ELM, DOWN
	showtext ElmDirectionsText3
	setevent EVENT_GOT_A_POKEMON_FROM_ELM
	setevent EVENT_RIVAL_CHERRYGROVE_CITY
	setscene SCENE_ELMSLAB_LYRA_BATTLE
	end

ElmsLabHealingMachine:
	opentext
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftruefwd .CanHeal
	jumpthisopenedtext

	text "Was das wohl"
	line "macht?"
	done




.CanHeal:
	writetext ElmsLabHealingMachineText2
	yesorno
	iftruefwd ElmsLabHealingMachine_HealParty
	endtext

ElmsLabHealingMachine_HealParty:
	special HealParty
	special SaveMusic
	playmusic MUSIC_NONE
	setval 1 ; Machine is in Elm's Lab
	special HealMachineAnim
	pause 30
	special RestoreMusic
	endtext


ElmAfterTheftDoneScript:
	waitendtext






ElmAfterTheftScript:
	writetext ElmAfterTheftText1
	checkkeyitem MYSTERY_EGG
	iffalse ElmAfterTheftDoneScript
	promptbutton
	writetext ElmAfterTheftText2
	waitbutton
	takekeyitem MYSTERY_EGG
	scall ElmJumpBackScript1
	writetext ElmAfterTheftText3
	waitbutton
	scall ElmJumpBackScript2
	writetext ElmAfterTheftText4
	promptbutton
	writetext ElmAfterTheftText5
	promptbutton
	setevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	clearevent EVENT_LYRA_ROUTE_29
	setmapscene ROUTE_29, SCENE_ROUTE29_CATCH_TUTORIAL
	clearevent EVENT_ROUTE_30_YOUNGSTER_JOEY
	setevent EVENT_ROUTE_30_BATTLE
	setscene SCENE_ELMSLAB_NOOP
	writetext ElmAfterTheftText6
	promptbutton
	closetext
	showemote EMOTE_SHOCK, ELMSLAB_ELM, 15
	showtext ElmAfterTheftText7
	end

ShowElmTogepiScript:
	writetext ShowElmTogepiText1
	waitbutton
	closetext
	showemote EMOTE_SHOCK, ELMSLAB_ELM, 15
	setevent EVENT_SHOWED_TOGEPI_TO_ELM
	opentext
	writetext ShowElmTogepiText2
	promptbutton
	writetext ShowElmTogepiText3
	promptbutton
ElmGiveOddSouvenirScript:
	writetext ElmGiveOddSouvenirText1
	promptbutton
	verbosegiveitem ODD_SOUVENIR
	iffalse_endtext
	setevent EVENT_GOT_ODD_SOUVENIR_FROM_ELM
	writetext ElmGiveOddSouvenirText2
	waitbutton
	checkevent EVENT_BATTLED_PROF_ELM
	iffalsefwd ElmAlsoBattleScript
	endtext

ElmGiveMasterBallScript:
	writetext ElmGiveMasterBallText1
	promptbutton
	verbosegiveitem MASTER_BALL
	iffalse_endtext
	setevent EVENT_GOT_MASTER_BALL_FROM_ELM
	writetext ElmGiveMasterBallText2
	waitbutton
	checkevent EVENT_BATTLED_PROF_ELM
	iftrue_endtext
ElmAlsoBattleScript:
	writetext ElmByTheWayText
	waitbutton
	sjumpfwd ElmAskBattleScript

ElmCheckBattleScript:
	checkevent EVENT_BATTLED_PROF_ELM
	iftrue_jumpopenedtext ElmText_CallYou
	checkevent EVENT_BEAT_FALKNER
	iffalse_jumpopenedtext ElmText_CallYou
	writetext ElmBeforeBattleText
	waitbutton
ElmAskBattleScript:
	setevent EVENT_ELM_WANTS_TO_BATTLE
	writetext ElmAskBattleText
	yesorno
	iffalse_jumpopenedtext ElmRefusedBattleText
	writetext ElmSeenText
	waitbutton
	closetext
	winlosstext ElmWinText, ElmLoseText
	setlasttalked ELMSLAB_ELM
	readvar VAR_BADGES
	ifless 2, .Team1
	ifless 4, .Team2
	ifless 8, .Team3
	loadtrainer PROF_ELM, 4
	sjumpfwd .GotTeam
.Team1:
	loadtrainer PROF_ELM, 1
	sjumpfwd .GotTeam
.Team2:
	loadtrainer PROF_ELM, 2
	sjumpfwd .GotTeam
.Team3:
	loadtrainer PROF_ELM, 3
.GotTeam:
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	clearevent EVENT_ELM_WANTS_TO_BATTLE
	setevent EVENT_BATTLED_PROF_ELM
	startbattle
	reloadmap
	special HealParty
	jumpthistextfaceplayer

	text "LIND: Ich bin"
	line "stolz auf dich,"
	cont "<PLAYER>."

	para "Es war richtig,"
	line "dir ein #MON"
	cont "anzuvertrauen!"
	done

ElmGiveTicketScript:
	writetext ElmGiveTicketText1
	promptbutton
	verbosegivekeyitem S_S_TICKET
	writetext ElmGiveTicketText2
	waitbutton
	closetext
	showemote EMOTE_SHOCK, ELMSLAB_ELM, 15
	special Special_FadeOutMusic
	pause 10
	readvar VAR_FACING
	ifequalfwd UP, .Shortest
	ifequalfwd DOWN, .Longest
	disappear ELMSLAB_LYRA
	moveobject ELMSLAB_LYRA, 4, 7
	scall .LyraEntryShort
	scall .LyraAnnouncesGymChallenge
	turnobject PLAYER, RIGHT
	sjumpfwd .Continue

.Longest
	disappear ELMSLAB_LYRA
	moveobject ELMSLAB_LYRA, 4, 6
	appear ELMSLAB_LYRA
	applymovement ELMSLAB_LYRA, LyraRunsInMoreMovement
	turnobject ELMSLAB_ELM, UP
	turnobject ELMSLAB_LYRA, RIGHT
	turnobject PLAYER, LEFT
	scall .LyraAnnouncesGymChallenge
	turnobject PLAYER, DOWN
	sjumpfwd .Continue

.Shortest
	disappear ELMSLAB_LYRA
	moveobject ELMSLAB_LYRA, 5, 8
	scall .LyraEntryShort
	scall .LyraAnnouncesGymChallenge
	turnobject PLAYER, UP

.Continue
	faceplayer
	playmusic MUSIC_PROF_ELM
	showtext ElmAfterTicketText
	setevent EVENT_LYRA_IN_HER_ROOM
	setevent EVENT_GOT_SS_TICKET_FROM_ELM
	end

.LyraAnnouncesGymChallenge
	playmusic MUSIC_LYRA_ENCOUNTER_HGSS
	showtext LyraAnnouncesGymChallengeText
	applymovement ELMSLAB_LYRA, LyraLeavesMovement
	disappear ELMSLAB_LYRA
	pause 10
	end

.LyraEntryShort
	appear ELMSLAB_LYRA
	applymovement ELMSLAB_LYRA, LyraRunsInMovement
	turnobject ELMSLAB_ELM, DOWN
	turnobject ELMSLAB_LYRA, UP
	turnobject PLAYER, DOWN
	end

ElmJumpBackScript1:
	closetext
	readvar VAR_FACING
	scalltable .JumpBackScript1Table
	end
.JumpBackScript1Table
	dw ElmJumpDownScript
	dw ElmJumpUpScript
	dw ElmJumpLeftScript
	dw ElmJumpRightScript

ElmJumpBackScript2:
	closetext
	readvar VAR_FACING
	scalltable .JumpBackScript2Table
	end
.JumpBackScript2Table
	dw ElmJumpUpScript
	dw ElmJumpDownScript
	dw ElmJumpRightScript
	dw ElmJumpLeftScript

ElmJumpUpScript:
	applymovement ELMSLAB_ELM, ElmJumpUpMovement
	opentext
	end

ElmJumpDownScript:
	applymovement ELMSLAB_ELM, ElmJumpDownMovement
	opentext
	end

ElmJumpLeftScript:
	applymovement ELMSLAB_ELM, ElmJumpLeftMovement
	opentext
	end

ElmJumpRightScript:
	applymovement ELMSLAB_ELM, ElmJumpRightMovement
	opentext
	end

LyraBattleScript:
	turnobject ELMSLAB_LYRA, DOWN
	playmusic MUSIC_LYRA_ENCOUNTER_HGSS
	showtext ElmsLabLyraChallengeText
	applymovement ELMSLAB_LYRA, LyraBattleMovement
	turnobject PLAYER, RIGHT
	winlosstext ElmsLabLyraWinText, ElmsLabLyraLossText
	setlasttalked ELMSLAB_LYRA
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftruefwd .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftruefwd .Chikorita
	loadtrainer LYRA1, LYRA1_1
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	special DeleteSavedMusic
	playmusic MUSIC_LYRA_DEPARTURE_HGSS
	iftruefwd .AfterYourDefeat
	sjumpfwd .AfterVictorious

.Totodile:
	loadtrainer LYRA1, LYRA1_2
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	special DeleteSavedMusic
	playmusic MUSIC_LYRA_DEPARTURE_HGSS
	iftruefwd .AfterVictorious
	sjumpfwd .AfterYourDefeat

.Chikorita:
	loadtrainer LYRA1, LYRA1_3
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	special DeleteSavedMusic
	playmusic MUSIC_LYRA_DEPARTURE_HGSS
	iftruefwd .AfterVictorious
	sjumpfwd .AfterYourDefeat

.AfterVictorious:
	showtext ElmsLabLyraText_YouWon
	sjumpfwd .FinishLyra

.AfterYourDefeat:
	showtext ElmsLabLyraText_YouLost
.FinishLyra:
	turnobject ELMSLAB_LYRA, UP
	opentext
	writetext ElmsLabLyraThankYouText
	waitbutton
	turnobject ELMSLAB_LYRA, LEFT
	writetext ElmsLabLyraSeeYouText
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement ELMSLAB_LYRA, LyraLeavesMovement
	disappear ELMSLAB_LYRA
	special HealParty
	setscene SCENE_ELMSLAB_AIDE_GIVES_POTION
	playmapmusic
	end

AideScript_WalkPotions1:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight1
	turnobject PLAYER, DOWN
	scall AideScript_GivePotions
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft1
	end

AideScript_WalkPotions2:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight2
	turnobject PLAYER, DOWN
	scall AideScript_GivePotions
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft2
	end

AideScript_GivePotions:
	opentext
	writetext AideText_GiveYouPotions
	promptbutton
	verbosegiveitem POTION
	setscene SCENE_ELMSLAB_NOOP
	jumpopenedtext AideText_AlwaysBusy

ElmsAideScript:
	checkevent EVENT_GOT_RIVALS_EGG
	iftrue_jumptextfaceplayer AideText_AlwaysBusy
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	iftrue_jumptextfaceplayer AideText_AfterTheft
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue_jumptextfaceplayer AideText_AlwaysBusy
	checkevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
	iftrue_jumptextfaceplayer AideText_TheftTestimony
	jumptextfaceplayer AideText_AlwaysBusy

MeetCopScript2:
	applyonemovement PLAYER, step_left
MeetCopScript:
	applymovement PLAYER, MeetCopScript_WalkUp
CopScript:
	turnobject ELMSLAB_OFFICER, LEFT
	showtext ElmsLabOfficerText1
	disappear ELMSLAB_LYRA
	moveobject ELMSLAB_LYRA, 5, 8
	appear ELMSLAB_LYRA
	applymovement ELMSLAB_LYRA, LyraRunsInMovement
	turnobject ELMSLAB_OFFICER, DOWN
	showtext ElmsLabLyraTheftInnocentText
	pause 10
	turnobject ELMSLAB_OFFICER, LEFT
	opentext
	writetext ElmsLabOfficerText2
	promptbutton
	special SpecialNameRival
	writetext ElmsLabOfficerText3
	waitbutton
	closetext
	applymovement ELMSLAB_LYRA, LyraStepsAsideMovement
	applymovement ELMSLAB_OFFICER, OfficerLeavesMovement
	disappear ELMSLAB_OFFICER
	pause 10
	turnobject ELMSLAB_LYRA, UP
	turnobject PLAYER, DOWN
	showtext ElmsLabLyraTheftGoodbyeText
	applymovement ELMSLAB_LYRA, LyraLeavesMovement
	disappear ELMSLAB_LYRA
	setscene SCENE_ELMSLAB_NOOP
	pause 10
	applymovement PLAYER, MeetCopScript_GiveEgg
	opentext
	sjump ElmAfterTheftScript

ElmsLabLyraScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iffalse_jumptextfaceplayer ElmsLabLyraWhichPokemonText
	jumpthistextfaceplayer

	text "Dein #MON sieht"
	line "auch süß aus!"
	done

ElmsLabWindow:
	checkflag ENGINE_FLYPOINT_VIOLET
	iftrue_jumptext ElmsLabWindowText1
	checkevent EVENT_ELM_CALLED_ABOUT_STOLEN_POKEMON
	iftrue_jumptext ElmsLabWindowText2
	jumptext ElmsLabWindowText1

ElmsLabPC:
	jumpthistext

	text "AUFZEICHNUNGEN ZUR"
	line "#MON-ENTWICK-"
	cont "LUNG"
	para "… steht auf dem"
	line "Bildschirm …"
	done
ElmsLab_WalkUpToElmMovement:
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	turn_head_left
	step_end

LyraPicksChikoritaMovement:
	step_right
LyraPicksTotodileMovement:
	step_right
LyraPicksCyndaquilMovement:
	step_right
	step_right
	step_up
	step_end

LyraAfterChikoritaMovement:
	step_down
	step_left
	step_left
	step_left
	turn_head_up
	step_end

LyraAfterTotodileMovement:
	step_down
	step_left
	step_left
	turn_head_up
	step_end

LyraAfterCyndaquilMovement:
	step_down
	step_left
	turn_head_up
	step_end

LyraBattleMovement:
	step_down
	turn_head_left
	step_end

LyraLeavesMovement:
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end

LyraRunsInMoreMovement:
	step_up
LyraRunsInMovement:
	step_up
	step_up
	step_up
	step_up
	step_end

LyraStepsAsideMovement:
	step_left
	turn_head_right
	step_end

MeetCopScript_WalkUp:
	step_up
	step_up
	turn_head_right
	step_end

MeetCopScript_GiveEgg:
	step_right
	turn_head_up
	step_end

OfficerLeavesMovement:
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end

AideWalksRight1:
	step_right
	step_right
	turn_head_up
	step_end

AideWalksRight2:
	step_right
	step_right
	step_right
	turn_head_up
	step_end

AideWalksLeft1:
	step_left
	step_left
	turn_head_down
	step_end

AideWalksLeft2:
	step_left
	step_left
	step_left
	turn_head_down
	step_end

AideWalksDownMovement:
	step_right
	step_right
	step_down
	step_end

AideWalksBackMovement:
	step_up
	step_left
	step_left
	step_end

ElmJumpUpMovement:
	fix_facing
	run_step_up
	remove_fixed_facing
	step_end

ElmJumpDownMovement:
	fix_facing
	run_step_down
	remove_fixed_facing
	step_end

ElmJumpLeftMovement:
	fix_facing
	run_step_left
	remove_fixed_facing
	step_end

ElmJumpRightMovement:
	fix_facing
	run_step_right
	remove_fixed_facing
	step_end

ElmsLab_ElmToDefaultPositionMovement:
	step_right
	step_right
	step_up
	turn_head_down
	step_end

AfterCyndaquilMovement:
	step_left
	step_up
	turn_head_up
	step_end

AfterTotodileMovement:
	step_left
	step_left
	step_up
	turn_head_up
	step_end

AfterChikoritaMovement:
	step_left
	step_left
	step_left
	step_up
	turn_head_up
	step_end

ElmText_Intro:
	text "LIND: <PLAYER>! Da"
	line "bist du ja!"

	para "Hallo auch an"
	line "dich, LYRA."

	para "Ich muss euch um"
	line "etwas bitten."

	para "Verstehst du …"

	para "Ich schreibe an"
	line "etwas, das ich bei"
	cont "einer Konferenz"
	cont "vorlegen möchte."

	para "Aber da sind noch"
	line "einige Dinge, die"
	cont "ich nicht ganz"
	cont "verstehe."

	para "Darum!"

	para "Ich möchte, dass"
	line "ihr #MON"
	cont "trainiert, die ich"
	cont "vor kurzem"
	cont "gefangen habe."
	done






ElmText_Accepted:
	text "Danke, <PLAYER>!"

	para "Du bist mir eine"
	line "große Hilfe!"
	done






ElmText_Refused:
	text "Aber … ich brauche"
	line "deine Hilfe!"
	done






ElmText_ResearchAmbitions:
	text "Wenn ich meine"
	line "Ergebnisse"
	cont "vorlege, stoßen"
	cont "wir"
	para "sicher noch tiefer"
	line "in die Geheimnisse"
	cont "der #MON vor."
	para "Darauf kannst du"
	line "dich verlassen!"
	done






ElmText_GotAnEmail:
	text "Oh, heh! Ich habe"
	line "eine E-Mail!"
	para "… … … Hm … Mhm …"
	line "…"
	para "Okay …"
	done






ElmText_MissionFromMrPokemon:
	text "Hör gut zu!"
	para "Ich habe einen"
	line "Bekannten namens"
	cont "MR. #MON."
	para "Ständig findet er"
	line "eigenartiges Zeug"
	para "und fängt an,"
	line "darüber zu"
	cont "fantasieren."
	para "Aber jetzt hat er"
	line "mir eine E-Mail"
	cont "geschickt."
	para "Diesmal soll es um"
	line "etwas wirklich"
	cont "Großes gehen."
	para "Das klingt"
	line "faszinierend, aber"
	cont "wir"
	para "sind mitten in der"
	line "#MON-Forschung."
	para "Moment! Ich hab's!"
	para "<PLAYER>, könntest"
	line "du der Sache"
	cont "nachgehen?"
	done






ElmText_ChooseAPokemon:
	text "Ich möchte, dass"
	line "du eines der"
	cont "#MON aus diesen"
	cont "Bällen trainierst."
	para "Du wirst der erste"
	line "Partner dieses"
	cont "#MON sein,"
	cont "<PLAYER>!"
	para "Such dir eins aus!"
	done






LabWhereGoingText:
	text "LIND: Warte! Wohin"
	line "gehst du?"
	done






TakeCyndaquilText:
	text "LIND: Willst du"
	line "FEURIGEL, das"
	cont "Feuer-#MON?"
	done






TakeTotodileText:
	text "LIND: Wählst du"
	line "KARNIMANI, das"
	cont "Wasser-#MON?"
	done






TakeChikoritaText:
	text "LIND: Entscheidest"
	line "du dich für"
	para "ENDIVIE, das"
	line "Pflanzen-#MON?"
	done






DidntChooseStarterText:
	text "LIND: Überlege es"
	line "dir gut!"

	para "Die Wahl deines"
	line "Partners ist sehr"
	cont "wichtig."
	done






ChoseStarterText:
	text "LIND: Gute Wahl!"
	line "Dieses #MON ist"
	cont "wirklich gut!"
	done






ElmDirectionsText1:
	text "MR. #MON lebt"
	line "etwas nördlich"
	para "von ROSALIA CITY,"
	line "dem nächsten Ort."
	para "Der Weg führt dich"
	line "fast direkt"
	cont "dorthin."
	para "Du kannst es nicht"
	line "verfehlen."
	para "Aber nur für den"
	line "Fall … hier ist"
	cont "meine Nummer."
	para "Ruf an, wenn es"
	line "etwas gibt!"
	done






ElmDirectionsText2:
	text "Ist dein #MON"
	line "verletzt, solltest"
	cont "du es mit"
	para "dieser Maschine"
	line "heilen."
	para "Benutze sie so oft"
	line "du willst."
	done






ElmDirectionsText3:
	text "<PLAYER>, ich zähle"
	line "auf dich!"
	done






GotElmsNumberText:
	text "<PLAYER> erhält"
	line "LINDs Nummer."
	done






ElmDescribesMrPokemonText:
	text "MR. #MON findet"
	line "überall seltene"
	cont "Dinge."
	para "Es ist nur dumm,"
	line "dass sie nur"
	cont "selten und nicht"
	cont "brauchbar sind …"
	done






ElmPokeBallText:
	text "Darin ist ein"
	line "#MON, das PROF."
	cont "LIND gefangen hat."
	done






ElmsLabHealingMachineText2:
	text "Willst du deine"
	line "#MON heilen?"
	done






ElmAfterTheftText1:
	text "LIND: <PLAYER>, es"
	line "ist schrecklich …"
	para "Oh, was hat MR."
	line "#MON denn"
	cont "Großes entdeckt?"
	done






ElmAfterTheftText2:
	text "<PLAYER> übergibt"
	line "PROF. LIND das"
	cont "RÄTSEL-EI."
	done






ElmAfterTheftText3:
	text "LIND: Das hier?"
	done






ElmAfterTheftText4:
	text "Aber … ist das"
	line "auch ein"
	cont "#MON-EI?"
	para "Falls ja, dann ist"
	line "es in der Tat eine"
	cont "große Entdeckung!"
	done






ElmAfterTheftText5:
	text "LIND: Wie?!?"
	para "PROF. EICH hat dir"
	line "einen #DEX"
	cont "gegeben?"
	para "<PLAYER>, ist das"
	line "wahr? D-Das ist ja"
	cont "unglaublich!"
	para "Kein anderer ist"
	line "wie er in der"
	para "Lage, das wahre"
	line "Potenzial eines"
	para "Trainers zu"
	line "erkennen."
	para "Wow, <PLAYER>. Es"
	line "ist vielleicht"
	para "deine Bestimmung,"
	line "der CHAMP zu"
	cont "werden."
	para "Es sieht auch so"
	line "aus, als könntest"
	para "du hervorragend"
	line "mit #MON"
	cont "umgehen."
	para "Du solltest die"
	line "Herausforderung"
	para "der #MON-ARENEN"
	line "annehmen."
	para "Die nächste"
	line "PKMN-ARENA"
	cont "befindet sich in"
	cont "VIOLA."
	done






ElmAfterTheftText6:
	text "… <PLAYER>. Der Weg"
	line "zum Ruhm ist"
	para "lang und"
	line "beschwer-lich."
	para "Bevor du"
	line "losziehst,"
	cont "solltest du mit"
	cont "deiner Mama"
	cont "sprechen."
	done






ElmAfterTheftText7:
	text "Und ruf mich auch"
	line "mal an."

	para "Wenn du wissen"
	line "willst, wie sich"

	para "deine #MON"
	line "entwickeln,"

	para "ist meine"
	line "Forschung"
	cont "unschätzbar!"
	done
ElmStudyingEggText:
	text "LIND: Gib nicht"
	line "auf! Ich rufe dich"
	para "an, wenn ich etwas"
	line "über dieses EI"
	cont "herausgefunden"
	cont "habe."
	done






ElmAideHasEggText:
	text "LIND: <PLAYER>?"
	line "Hast du schon"
	cont "meinen"
	cont "Assistenten"
	cont "getroffen?"
	para "Er sollte mit dem"
	line "EI im"
	cont "#MON-CENTER von"
	cont "VIOLA CITY warten."
	para "Du musst ihn"
	line "verpasst haben."
	cont "Versuche, ihn dort"
	cont "zu finden."
	done






ElmWaitingEggHatchText:
	text "LIND: He, hat sich"
	line "das EI irgendwie"
	cont "verändert?"
	done






ShowElmTogepiText1:
	text "LIND: <PLAYER>, du"
	line "siehst großartig"
	cont "aus!"
	done






ShowElmTogepiText2:
	text "Was? Dieses"
	line "#MON!?!"
	done






ShowElmTogepiText3:
	text "Es ist aus dem EI"
	line "geschlüpft! Also"
	cont "schlüpfen alle"
	cont "#MON aus EIERN"
	cont "…"
	para "Nein, vermutlich"
	line "trifft das nicht"
	cont "auf alle #MON"
	cont "zu."
	para "Es wartet wohl"
	line "noch jede Menge"
	cont "Forschungsarbeit"
	cont "auf uns."
	done






ElmGiveOddSouvenirText1:
	text "Danke, <PLAYER>! Du"
	line "hilfst uns beim"
	para "Aufklären vieler"
	line "#MON-Mysterien!"
	para "Bitte nimm dies"
	line "als Zeichen"
	cont "unserer"
	cont "Wertschätzung."
	done
ElmGiveOddSouvenirText2:
	text "Das ist ein"
	line "Souvenir von Herrn"
	cont "#MON."
	para "Er sagte, es sei"
	line "ein Andenken von"
	para "seiner Reise auf"
	line "eine tropische"
	cont "Insel."
	para "Angeblich gibt es"
	line "#MON-Arten, die"
	para "es gerne tragen."
	done
ElmText_CallYou:
	text "LIND: <PLAYER>, ich"
	line "rufe dich an, wenn"
	cont "sich etwas tut."
	done






AideText_AfterTheft:
	text "… Seufz … Das"
	line "gestohlene #MON"
	para "Ich frage mich,"
	line "wie es ihm geht."
	para "Man sagt, dass ein"
	line "#MON, das von"
	para "einem bösen"
	line "Menschen"
	cont "aufgezogen wird,"
	cont "selber böse"
	para "wird."
	done






AideText_ThiefReturnedMon:
	text "<PLAYER>! Rate mal!"
	para "Der Junge, der"
	line "PROF. LINDs"
	cont "#MON gestohlen"
	cont "hat …"
	para "… kam zurück, um"
	line "es zurückzugeben!"
	para "Aber PROF. LIND"
	line "sagte zu ihm …"
	para "Es scheint, als ob"
	line "das #MON dich"
	cont "sehr mag."
	para "#MON geben ihr"
	line "Bestes für"
	cont "jemanden, den sie"
	cont "lieben."
	para "Ich glaube, es"
	line "sollte bei dir"
	cont "bleiben."
	para "… Ist das nicht"
	line "rührend? Ich"
	cont "musste weinen!"
	para "Ich sah das"
	line "Gesicht des"
	cont "Jungen, als er"
	cont "ging."
	para "Er sah so"
	line "glücklich aus!"
	done

ElmGiveMasterBallText1:
	text "LIND: Hi, <PLAYER>!"
	line "Dank dir komme ich"
	para "mit meinen"
	line "Forschungen"
	cont "hervorragend"
	cont "voran!"
	para "Nimm dies als"
	line "Zeichen meiner"
	cont "Dankbarkeit!"
	done






ElmGiveMasterBallText2:
	text "Der MEISTERBALL"
	line "ist der Beste von"
	cont "allen!"
	para "Er ist der"
	line "ultima-tive BALL!"
	cont "Ihm"
	para "kann kein #MON"
	line "entwischen."
	para "Er wird nur"
	line "anerkannten"
	cont "#MON-Forschern"
	cont "überreicht."
	para "Aber ich glaube,"
	line "du hast bessere"
	para "Verwendung dafür"
	line "als ich, <PLAYER>!"
	done






ElmGiveTicketText1:
	text "LIND: <PLAYER>! Da"
	line "bist du ja!"
	para "Ich habe dich"
	line "gerufen, weil ich"
	cont "dir etwas geben"
	cont "möchte."
	para "Es handelt sich um"
	line "ein BOOTSTICKET."
	para "Jetzt kannst du"
	line "auch in KANTO"
	cont "#MON fangen."
	done






ElmGiveTicketText2:
	text "Das Schiff legt in"
	line "OLIVIANA CITY ab."
	para "Aber das weißt du"
	line "ja schon, <PLAYER>."
	para "Schließlich bist"
	line "du mit deinen"
	para "#MON schon viel"
	line "herumge-kommen."
	para "Überbringe PROF."
	line "EICH in KANTO"
	cont "meine Grüße!"
	done







ElmsLabMonEggText: ; unreferenced
	text "Dies ist das"
	line "#MON-EI, das"
	cont "von PROF. LIND"
	cont "untersucht wird."
	done






LyraAnnouncesGymChallengeText:
	text "LYRA: Da bist du,"
	line "<PLAYER>!"
	para "Ich habe deinen"
	line "Kampf gegen den"
	cont "Champion im TV"
	cont "gesehen."
	para "Du warst"
	line "unglaublich!"
	para "Das hat mich"
	line "inspiriert,"
	cont "<PLAYER>."
	para "Auch wenn ich"
	line "dieses Level nie"
	cont "erreiche …"
	para "Ich will es"
	line "versuchen."
	para "Ich will sehen,"
	line "was ich kann."
	para "PROF. LIND, es tut"
	line "mir leid, dass ich"
	para "hier nicht mehr"
	line "helfen kann."
	para "Ich fordere alle"
	line "Arenen in Johto"
	cont "heraus und will in"
	cont "die #MON-Liga!"
	para "Wünsch mir Glück!"
	line "Bis später!"
	done
ElmAfterTicketText:
	text "LIND: Nun gut,"
	line "<PLAYER>, ihr"
	para "habt beide eure"
	line "eigenen Wege."
	para "Ob sie die Liga"
	line "zuerst erreicht?"
	para "Grüß PROF. EICH in"
	line "Kanto von mir!"
	done
ElmBeforeBattleText:
	text "LIND: <PLAYER>! Wie"
	line "läuft deine"
	cont "#MON-Reise?"
	done
ElmByTheWayText:
	text "Da du schon hier"
	line "bist, <PLAYER> …"
	done
ElmAskBattleText:
	text "Ich könnte etwas"
	line "Kampfpraxis"

	para "gegen einen"
	line "talentierten"

	para "Trainer wie dich"
	line "gebrauchen."

	para "Wie wäre es,"
	line "<PLAYER>?"
	done
ElmSeenText:
	text "Zeig mir, wie weit"
	line "du gekommen bist"
	para "seit Neuborkia!"
	done
ElmWinText:
	text "Erstaunlich!"
	done
ElmLoseText:
	text "Hast du es mir"
	line "leicht gemacht?"
	done
ElmRefusedBattleText:
	text "Wenn deine #MON"
	line "Heilung brauchen,"
	para "benutze einfach"
	line "die Maschine hier."
	done
AideText_GiveYouPotions:
	text "<PLAYER>, ich"
	line "möchte, dass du"
	cont "das mitnimmst."
	done
AideText_AlwaysBusy:
	text "Wir sind nur zu"
	line "zweit und wir"
	cont "haben viel zu tun."
	done






AideText_TheftTestimony:
	text "Wir haben ein"
	line "lautes Geräusch"
	cont "gehört …"
	para "Als wir nach dem"
	line "Rechten sahen,"
	cont "wurde ein #MON"
	cont "gestohlen."
	para "Ich kann nicht"
	line "glauben, dass"
	cont "jemand zu so etwas"
	cont "fähig ist!"
	para "… Seufz … Das"
	line "gestohlene #MON"
	para "Ich frage mich,"
	line "wie es ihm geht."
	para "Man sagt, dass ein"
	line "#MON, das"
	para "von einem bösen"
	line "Menschen"
	cont "aufgezogen wird,"
	cont "selber"
	para "böse wird."
	done






ElmsLabOfficerText1:
	text "Ich hörte, dass"
	line "hier ein #MON"
	cont "gestohlen worden"
	cont "sei …"
	para "Ich habe von PROF."
	line "LIND einige"
	cont "Infor-mationen"
	cont "erhalten."
	para "Bei dem Dieb"
	line "handelt es sich um"
	cont "einen jungen Mann"
	cont "mit langen roten"
	cont "Haaren …"
	para "Wie?"
	para "Du hast gegen"
	line "einen solchen"
	cont "Trainer gekämpft?"
	para "Hat er dir auch"
	line "seinen Namen"
	cont "genannt?"
	done






ElmsLabOfficerText2:
	text "O.K.! Sein Name"
	line "war also <RIVAL>."
	para "Danke, dass du mir"
	line "bei den"
	cont "Ermitt-lungen"
	cont "geholfen hast!"
	done






ElmsLabOfficerText3:
	text "O.K.! Sein Name"
	line "war also <RIVAL>."
	para "Danke, dass du mir"
	line "bei den"
	cont "Ermittlungen"
	cont "geholfen hast!"
	done
ElmsLabLyraWhichPokemonText:
	text "Welches #MON"
	line "nimmst du,"
	cont "<PLAYER>?"
	done
LyraChoosesStarterText:
	text "LYRA: Dann nehme"
	line "ich dieses hier!"
	done
LyraReceivedStarterText:
	text "LYRA erhält"
	line ""
	text_ram wStringBuffer3
	text "!"
	done
LyraNicknamedChikoritaText:
	text "LYRA: So süß! Ich"
	line "nenne es Chicory!"
	done
LyraNicknamedCyndaquilText:
	text "LYRA: So süß! Ich"
	line "nenne es Cinder!"
	done
LyraNicknamedTotodileText:
	text "LYRA: So süß! Ich"
	line "nenne es Toto!"
	done
ElmsLabLyraChallengeText:
	text "LYRA: <PLAYER>!"
	line "Lass uns unsere"
	cont "#MON in einem"
	cont "Kampf"
	cont "kennenlernen!"
	done
ElmsLabLyraWinText:
	text "Gut gemacht,"
	line "<PLAYER>!"
	done
ElmsLabLyraLossText:
	text "Juhu! Ich hab"
	line "gewonnen!"
	done
ElmsLabLyraText_YouWon:
ElmsLabLyraText_YouLost:
	text "Das war ein"
	line "spannender Kampf!"
	done
ElmsLabLyraThankYouText:
	text "Danke für das"
	line "#MON, PROF."
	cont "LIND!"
	done
ElmsLabLyraSeeYouText:
	text "<PLAYER>, bis"
	line "später!"

	para "Viel Spaß bei"
	line "deinem Auftrag!"
	done
ElmsLabLyraTheftInnocentText:
	text "LYRA: Moment!"
	line "<PLAYER> hat damit"
	cont "nichts zu tun!"
	para "Ich sah einen"
	line "rothaarigen Jungen"
	cont "am Gebäude!"
	done
ElmsLabLyraTheftGoodbyeText:
	text "LYRA: <PLAYER>,"
	line "gut, dass er"
	para "deine Unschuld"
	line "erkannt hat."
	para "Hoffentlich gibt"
	line "der Dieb das"
	cont "#MON zurück …"
	para "Also, bis bald!"
	done
ElmsLabWindowText1:
	text "Das Fenster ist"
	line "offen."

	para "Eine sanfte Brise"
	line "weht herein."
	done






ElmsLabWindowText2:
	text "Hier ist er"
	line "hereingekommen!"
	done






ElmsLabTravelTip1Text:
	text "<PLAYER> öffnet ein"
	line "Buch."
	para "Reise-Tipp 1:"
	para "Drücke START, um"
	line "das MENÜ zu"
	cont "öffnen."
	done






ElmsLabTravelTip2Text:
	text "<PLAYER> öffnet ein"
	line "Buch."
	para "Reise-Tipp 2:"
	para "Speichere deine"
	line "Fortschritte mit"
	cont "SICHERN!"
	done






ElmsLabTravelTip3Text:
	text "<PLAYER> öffnet ein"
	line "Buch."
	para "Reise-Tipp 3:"
	para "Öffne deinen"
	line "BEUTEL und drücke"
	cont "SELECT, um deine"
	cont "Items zu"
	cont "verwalten."
	done






ElmsLabTravelTip4Text:
	text "<PLAYER> öffnet ein"
	line "Buch."
	para "Reise-Tipp 4:"
	para "Verwalte die"
	line "Attacken deiner"
	cont "#MON. Drücke"
	cont "den A-Knopf, um"
	cont "ihre Position zu"
	cont "verändern."
	done






ElmsLabTrashcanText:
	text "Die Verpackung des"
	line "Snacks, den PROF."
	cont "LIND gegessen hat,"
	cont "befindet sich hier"
	cont "…"
	done






