Route36NationalParkGate_MapScriptHeader:
	def_scene_scripts
	scene_script DoNothingScript, SCENE_ROUTE36NATIONALPARKGATE_NOOP
	scene_script DoNothingScript, SCENE_ROUTE36NATIONALPARKGATE_UNUSED
	scene_script Route36NationalParkGateLeaveContestEarlyScene, SCENE_ROUTE36NATIONALPARKGATE_LEAVE_CONTEST_EARLY

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route36NationalParkGateCheckIfContestRunning
	callback MAPCALLBACK_OBJECTS, Route36NationalParkGateCheckIfContestAvailable

	def_warp_events
	warp_event  0,  4, NATIONAL_PARK, 1
	warp_event  0,  5, NATIONAL_PARK, 2
	warp_event  9,  4, ROUTE_36, 1
	warp_event  9,  5, ROUTE_36, 2

	def_coord_events

	def_bg_events
	bg_event  6,  0, BGEVENT_JUMPTEXT, BugCatchingContestExplanationText

	def_object_events
	object_event  0,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route36OfficerScriptContest, EVENT_ROUTE_36_NATIONAL_PARK_GATE_OFFICER_CONTEST_DAY
	object_event  2,  5, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant1BScript, EVENT_BUG_CATCHING_CONTESTANT_1B
	object_event  4,  5, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant2BScript, EVENT_BUG_CATCHING_CONTESTANT_2B
	object_event  2,  6, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant3BScript, EVENT_BUG_CATCHING_CONTESTANT_3B
	object_event  6,  5, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant4BScript, EVENT_BUG_CATCHING_CONTESTANT_4B
	object_event  2,  7, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant5BScript, EVENT_BUG_CATCHING_CONTESTANT_5B
	object_event  5,  6, SPRITE_CAMPER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant6BScript, EVENT_BUG_CATCHING_CONTESTANT_6B
	object_event  3,  6, SPRITE_PICNICKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant7BScript, EVENT_BUG_CATCHING_CONTESTANT_7B
	object_event  4,  7, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant8BScript, EVENT_BUG_CATCHING_CONTESTANT_8B
	object_event  6,  7, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant9BScript, EVENT_BUG_CATCHING_CONTESTANT_9B
	object_event  6,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant10BScript, EVENT_BUG_CATCHING_CONTESTANT_10B
	object_event  3,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route36NationalParkGateOfficerScript, EVENT_ROUTE_36_NATIONAL_PARK_GATE_OFFICER_NOT_CONTEST_DAY

	object_const_def
	const ROUTE36NATIONALPARKGATE_OFFICER1
	const ROUTE36NATIONALPARKGATE_BUG_CATCHER1
	const ROUTE36NATIONALPARKGATE_BUG_MANIAC
	const ROUTE36NATIONALPARKGATE_COOLTRAINER_M
	const ROUTE36NATIONALPARKGATE_POKEFAN_M
	const ROUTE36NATIONALPARKGATE_BUG_CATCHER2
	const ROUTE36NATIONALPARKGATE_YOUNGSTER1
	const ROUTE36NATIONALPARKGATE_LASS
	const ROUTE36NATIONALPARKGATE_BUG_CATCHER3
	const ROUTE36NATIONALPARKGATE_YOUNGSTER2
	const ROUTE36NATIONALPARKGATE_YOUNGSTER3
	const ROUTE36NATIONALPARKGATE_OFFICER2

Route36NationalParkGateCheckIfContestRunning:
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftruefwd .BugContestIsRunning
	setscene SCENE_ROUTE36NATIONALPARKGATE_NOOP
	endcallback

.BugContestIsRunning:
	setscene SCENE_ROUTE36NATIONALPARKGATE_LEAVE_CONTEST_EARLY
	endcallback

Route36NationalParkGateCheckIfContestAvailable:
	checkevent EVENT_WARPED_FROM_ROUTE_35_NATIONAL_PARK_GATE
	iftruefwd .Return
	readvar VAR_WEEKDAY
	ifequalfwd TUESDAY, .SetContestOfficer
	ifequalfwd THURSDAY, .SetContestOfficer
	ifequalfwd SATURDAY, .SetContestOfficer
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftruefwd .SetContestOfficer
	disappear ROUTE36NATIONALPARKGATE_OFFICER1
	appear ROUTE36NATIONALPARKGATE_OFFICER2
	endcallback

.SetContestOfficer:
	appear ROUTE36NATIONALPARKGATE_OFFICER1
	disappear ROUTE36NATIONALPARKGATE_OFFICER2
.Return:
	endcallback

Route36NationalParkGateLeaveContestEarlyScene:
	sdefer .Script
	end

.Script:
	turnobject PLAYER, UP
	opentext
	readvar VAR_CONTESTMINUTES
	addval $1
	setquantity
	writetext Route35NationalParkGateOfficer1WantToFinishText
	yesorno
	iffalsefwd .GoBackToContest
	writetext Route36NationalParkGateOfficer1WaitHereForAnnouncementText
	waitbutton
	closetext
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	callasm DisableDynPalUpdates
	scall .CopyContestants
	disappear ROUTE36NATIONALPARKGATE_OFFICER1
	appear ROUTE36NATIONALPARKGATE_OFFICER2
	applymovement PLAYER, Route36NationalParkGatePlayerWaitWithContestantsMovement
	pause 15
	callasm SetBlackObjectPals
	callasm ClearSavedObjPals
	callasm EnableDynPalUpdatesNoApply
	callasm _UpdateSprites
	callasm DelayFrame
	callasm FadeInPalettes
	jumpstd bugcontestresults

.GoBackToContest:
	writetext Route35NationalParkGateOfficer1OkGoFinishText
	waitbutton
	closetext
	turnobject PLAYER, LEFT
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	waitsfx
	warpfacing LEFT, NATIONAL_PARK_BUG_CONTEST, 35, 18
	end

.CopyContestants:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_1A
	iftruefwd .Not1
	appear ROUTE36NATIONALPARKGATE_BUG_CATCHER1
.Not1:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_2A
	iftruefwd .Not2
	appear ROUTE36NATIONALPARKGATE_BUG_MANIAC
.Not2:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_3A
	iftruefwd .Not3
	appear ROUTE36NATIONALPARKGATE_COOLTRAINER_M
.Not3:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_4A
	iftruefwd .Not4
	appear ROUTE36NATIONALPARKGATE_POKEFAN_M
.Not4:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_5A
	iftruefwd .Not5
	appear ROUTE36NATIONALPARKGATE_BUG_CATCHER2
.Not5:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_6A
	iftruefwd .Not6
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER1
.Not6:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_7A
	iftruefwd .Not7
	appear ROUTE36NATIONALPARKGATE_LASS
.Not7:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_8A
	iftruefwd .Not8
	appear ROUTE36NATIONALPARKGATE_BUG_CATCHER3
.Not8:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_9A
	iftruefwd .Not9
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER2
.Not9:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_10A
	iftruefwd .Not10
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER3
.Not10:
	special UpdateSprites
	end

Route36OfficerScriptContest:
	readvar VAR_WEEKDAY
	ifequalfwd SUNDAY, .ContestNotOn
	ifequalfwd MONDAY, .ContestNotOn
	ifequalfwd WEDNESDAY, .ContestNotOn
	ifequalfwd FRIDAY, .ContestNotOn
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftruefwd Route36Officer_ContestHasConcluded
	faceplayer
	opentext
	callstd daytotext
	writetext Route35NationalParkGateOfficer1AskToParticipateText
	yesorno
	iffalse_jumpopenedtext Route35NationalParkGateOfficer1TakePartInFutureText
	readvar VAR_PARTYCOUNT
	ifgreater $1, .LeaveMonsWithOfficer
	special ContestDropOffMons
	clearevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
.ResumeStartingContest:
	setflag ENGINE_BUG_CONTEST_TIMER
	special PlayMapMusic
	writetext Route35NationalParkGateOfficer1GiveParkBallsText
	promptbutton
	waitsfx
	writetext Route35NationalParkGatePlayerReceivedParkBallsText
	playsound SFX_ITEM
	waitsfx
	writetext Route35NationalParkGateOfficer1ExplainsRulesText
	waitbutton
	closetext
	setflag ENGINE_BUG_CONTEST_TIMER
	special Special_GiveParkBalls
	turnobject PLAYER, LEFT
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	waitsfx
	special Special_SelectRandomBugContestContestants
	warpfacing LEFT, NATIONAL_PARK_BUG_CONTEST, 35, 18
	end

.ContestNotOn:
	jumptextfaceplayer Route36NationalParkGateOfficer1SomeMonOnlySeenInParkText

.LeaveMonsWithOfficer:
	readvar VAR_PARTYCOUNT
	ifless $6, .ContinueLeavingMons
	readvar VAR_BOXSPACE
	iffalse_jumpopenedtext Route35NationalParkGateOfficer1MakeRoomText
.ContinueLeavingMons:
	special CheckFirstMonIsEgg
	iftrue_jumpopenedtext Route35NationalParkGateOfficer1EggAsFirstMonText
	writetext Route35NationalParkGateOfficer1AskToUseFirstMonText
	yesorno
	iffalse_jumpopenedtext Route35NationalParkGateOfficer1ChooseMonAndComeBackText
	special ContestDropOffMons
	iftrue_jumpopenedtext Route35NationalParkGateOfficer1FirstMonCantBattleText
	setevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
	writetext Route35NationalParkGateOfficer1WellHoldYourMonText
	promptbutton
	writetext Route35NationalParkGatePlayersMonLeftWithHelperText
	playsound SFX_GOT_SAFARI_BALLS
	waitsfx
	promptbutton
	sjump .ResumeStartingContest

Route36Officer_ContestHasConcluded:
	checkevent EVENT_CONTEST_OFFICER_HAS_PRIZE
	iffalse_jumptextfaceplayer Route35NationalParkGateOfficer1ContestIsOverText
	faceplayer
	opentext
	writetext Route36NationalParkGateOfficer1HeresThePrizeText
	promptbutton
	readmem wBugContestOfficerPrize
	verbosegiveitem ITEM_FROM_MEM
	iffalse_jumpopenedtext Route36NationalParkGateOfficer1WellHoldPrizeText
	clearevent EVENT_CONTEST_OFFICER_HAS_PRIZE
	endtext

Route36NationalParkGateOfficerScript:
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route36Officer_ContestHasConcluded
	jumptextfaceplayer Route36NationalParkGateOfficer1SomeMonOnlySeenInParkText

BugCatchingContestant1BScript:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse_jumptextfaceplayer BugCatchingContestant1BStillCompetingText
	jumpthistextfaceplayer

	; GSC-DE Dump
	text "ULI: Wow, du hast"
	line "mich besiegt! Du"
	cont "bist sehr gut!"
	done





BugCatchingContestant2BScript:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse_jumptextfaceplayer BugCatchingContestant2BStillCompetingText
	jumpthistextfaceplayer

	text "ALAN: Ich beneide"
	line "dich. Bei mir"
	cont "hat's diesmal"
	cont "einfach nicht"
	cont "geklappt."
	done






BugCatchingContestant3BScript:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse_jumptextfaceplayer BugCatchingContestant3BStillCompetingText
	jumpthistextfaceplayer

	; GSC-DE Dump-Wording
	text "LARS: Gut gemacht!"
	line "Ich werde meine"
	cont "#MON besser"
	cont "trainieren."
	done





BugCatchingContestant4BScript:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse_jumptextfaceplayer BugCatchingContestant4BStillCompetingText
	jumpthistextfaceplayer

	text "WILHELM: Du bist"
	line "der Gewinner? Was"
	cont "hast du gefangen?"
	done





BugCatchingContestant5BScript:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse_jumptextfaceplayer BugCatchingContestant5BStillCompetingText
	jumpthistextfaceplayer

	text "AXEL: Glückwunsch!"
	line "Du hast dir meinen"
	cont "Respekt verdient!"
	done





BugCatchingContestant6BScript:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse_jumptextfaceplayer BugCatchingContestant6BStillCompetingText
	jumpthistextfaceplayer

	; GSC-DE Dump
	text "TILL: Das #MON,"
	line "das du gefangen"
	cont "hast… Das ist"
	cont "cool!"
	done





BugCatchingContestant7BScript:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse_jumptextfaceplayer BugCatchingContestant7BStillCompetingText
	jumpthistextfaceplayer

	; GSC-DE Dump-Wording
	text "CINDY: Du hast"
	line "gewonnen? Das ist"
	cont "toll!"
	para "Hast du Lust, mit"
	line "mir nach"
	cont "Käfer-#MON zu"
	cont "suchen?"
	done





BugCatchingContestant8BScript:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse_jumptextfaceplayer BugCatchingContestant8BStillCompetingText
	jumpthistextfaceplayer

	text "ENNO: Ich… ich"
	line "kann nicht"
	cont "glauben, dass ich"
	cont "beim Käferfangen"
	cont "verloren habe…"
	done





BugCatchingContestant9BScript:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse_jumptextfaceplayer BugCatchingContestant9BStillCompetingText
	jumpthistextfaceplayer

	text "GUIDO: Nächstes"
	line "Mal werde ich"
	cont "gewinnen."
	done






BugCatchingContestant10BScript:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse_jumptextfaceplayer BugCatchingContestant10BStillCompetingText
	jumpthistextfaceplayer

	text "MICHEL: Könntest"
	line "du mir ein paar"
	cont "Tipps geben?"

	para "Ich möchte deinen"
	line "Stil studieren."
	done





Route36NationalParkGatePlayerWaitWithContestantsMovement:
	run_step_down
	run_step_right
	turn_head_up
	step_end

Route36NationalParkGateOfficer1WaitHereForAnnouncementText:
	; GSC-DE Dump
	text "Gut. Warte bitte"
	line "hier auf die"
	para "Bekanntgabe"
	line "der Sieger."
	done






Route36NationalParkGateOfficer1SomeMonOnlySeenInParkText:
	; GSC-DE Dump
	text "Manche #MON"
	line "kann man nur im"
	cont "PARK antreffen."
	done






BugCatchingContestant1BStillCompetingText:
	; GSC-DE Dump
	text "ULI: Glück spielt"
	line "natürlich eine"
	cont "große Rolle dabei."
	para "Man weiß nie,"
	line "welches #MON"
	cont "auftauchen wird."
	done






BugCatchingContestant2BStillCompetingText:
	; GSC-DE Dump-Wording
	text "ALAN: Du gewinnst"
	line "vielleicht mit"
	cont "großen #MON?"
	done






BugCatchingContestant3BStillCompetingText:
	; GSC-DE Dump-Wording
	text "LARS: Vielleicht"
	line "erhältst du eine"
	para "höhere Wertung für"
	line "ein #MON mit"
	cont "ungewöhnlicher"
	cont "Farbe."
	done






BugCatchingContestant4BStillCompetingText:
	; GSC-DE Dump-Wording
	text "WILHELM: Also, ich"
	line "bin zufrieden,"
	para "denn ich habe ein"
	line "#MON gefangen,"
	cont "das ich haben"
	cont "wollte."
	done






BugCatchingContestant5BStillCompetingText:
	text "AXEL: Ich habe"
	line "vorher ein SICHLOR"
	cont "gefangen. Aber ich"
	cont "konnte nicht"
	cont "siegen."
	done






BugCatchingContestant6BStillCompetingText:
	; GSC-DE Dump
	text "TILL: Mit einem"
	line "Käfer-#MON, das"
	para "einen hohen Level"
	line "hat, steigen deine"
	cont "Gewinnchancen."
	para "Ich glaube aber,"
	line "dass auch noch"
	cont "andere Kriterien"
	cont "in die Bewertung"
	cont "eingehen."
	done






BugCatchingContestant7BStillCompetingText:
	; GSC-DE Dump
	text "CINDY: Ich liebe"
	line "Käfer-#MON!"
	done






BugCatchingContestant8BStillCompetingText:
	; GSC-DE Dump
	text "ENNO: Ich hörte,"
	line "dass jemand mit"
	cont "einem RAUPY"
	cont "gewonnen hat!"
	done






BugCatchingContestant9BStillCompetingText:
	text "GUIDO: Mist! Ich"
	line "dachte, ich würde"
	cont "eine höhere"
	cont "Bewertung"
	cont "erreichen…"
	done






BugCatchingContestant10BStillCompetingText:
	text "MICHEL: Ich habe"
	line "viel gelernt, aber"
	para "noch nicht genug,"
	line "um zu siegen."
	done







UnusedSilphScope2Text: ; unreferenced
	text "Ich habe gehört,"
	line "dass es ein"
	cont "#MON gibt, das"
	cont "aussieht wie ein"

	para "Baum. Du kannst"
	line "seine Identität"
	cont "mit Hilfe eines"
	cont "SILPHSCOPE 2"
	cont "erkennen."
	done





; This text is referring to Sudowoodo.
; The SILPHSCOPE2 was later reworked into the SQUIRTBOTTLE.
	text "Ich habe gehört,"
	line "dass es ein"
	cont "#MON gibt, das"
	cont "aussieht wie ein"

	para "Baum. Du kannst"
	line "seine Identität"
	cont "mit Hilfe eines"
	cont "SILPHSCOPE 2"
	cont "erkennen."
	done
Route36NationalParkGateOfficer1WellHoldPrizeText:
	text "Oh, oh… Dein"
	line "BEUTEL ist voll."

	para "Wir bewahren"
	line "deinen Preis auf."
	cont "Aber nur heute."

	para "Schaffe bitte"
	line "Platz und komm"
	cont "dann wieder."
	done






Route36NationalParkGateOfficer1HeresThePrizeText:
	text "<PLAYER>?"
	para "Hier ist der"
	line "Preis, den wir für"
	cont "dich aufbewahrt"
	cont "haben."
	done






