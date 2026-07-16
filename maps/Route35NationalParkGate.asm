Route35NationalParkGate_MapScriptHeader:
	def_scene_scripts
	scene_script DoNothingScript, SCENE_ROUTE35NATIONALPARKGATE_NOOP
	scene_script DoNothingScript, SCENE_ROUTE35NATIONALPARKGATE_UNUSED
	scene_script Route35NationalParkGateLeaveContestEarlyScene, SCENE_ROUTE35NATIONALPARKGATE_LEAVE_CONTEST_EARLY

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route35NationalParkGate_CheckIfStillInContest
	callback MAPCALLBACK_OBJECTS, Route35NationalParkGate_CheckIfContestDay

	def_warp_events
	warp_event 15,  0, NATIONAL_PARK, 3
	warp_event 16,  0, NATIONAL_PARK, 4
	warp_event 15,  7, ROUTE_35, 3
	warp_event 16,  7, ROUTE_35, 3
	warp_event  0,  4, ROUTE_35_COAST_NORTH, 1
	warp_event  0,  5, ROUTE_35_COAST_NORTH, 2

	def_coord_events

	def_bg_events
	bg_event 17,  0, BGEVENT_JUMPTEXT, BugCatchingContestExplanationText

	def_object_events
	object_event 14,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route35OfficerScriptContest, EVENT_ROUTE_35_NATIONAL_PARK_GATE_OFFICER_CONTEST_DAY
	object_event 18,  5, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route35NationalParkGateYoungsterText, EVENT_ROUTE_35_NATIONAL_PARK_GATE_BUG_MANIAC
	object_event 12,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route35NationalParkGateOfficerScript, EVENT_ROUTE_35_NATIONAL_PARK_GATE_OFFICER_NOT_CONTEST_DAY
	object_event  5,  2, SPRITE_MATRON, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Route35NationalParkGatePokefanFScript, -1

	object_const_def
	const ROUTE35NATIONALPARKGATE_OFFICER1
	const ROUTE35NATIONALPARKGATE_BUG_MANIAC
	const ROUTE35NATIONALPARKGATE_OFFICER2

Route35NationalParkGate_CheckIfStillInContest:
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftruefwd Route35NationalParkGate_Yes
	setscene SCENE_ROUTE35NATIONALPARKGATE_NOOP
	endcallback

Route35NationalParkGate_Yes:
	setscene SCENE_ROUTE35NATIONALPARKGATE_LEAVE_CONTEST_EARLY
	endcallback

Route35NationalParkGate_CheckIfContestDay:
	readvar VAR_WEEKDAY
	ifequalfwd TUESDAY, Route35NationalParkGate_IsContestDay
	ifequalfwd THURSDAY, Route35NationalParkGate_IsContestDay
	ifequalfwd SATURDAY, Route35NationalParkGate_IsContestDay
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue Route35NationalParkGate_Yes
	disappear ROUTE35NATIONALPARKGATE_OFFICER1
	appear ROUTE35NATIONALPARKGATE_BUG_MANIAC
	appear ROUTE35NATIONALPARKGATE_OFFICER2
	endcallback

Route35NationalParkGate_IsContestDay:
	appear ROUTE35NATIONALPARKGATE_OFFICER1
	disappear ROUTE35NATIONALPARKGATE_BUG_MANIAC
	disappear ROUTE35NATIONALPARKGATE_OFFICER2
	endcallback

Route35NationalParkGateLeaveContestEarlyScene:
	sdefer .Script
	end

.Script:
	applymovement PLAYER, Route35NationalParkGatePlayerApproachOfficer1Movement
	turnobject ROUTE35NATIONALPARKGATE_OFFICER1, RIGHT
	opentext
	readvar VAR_CONTESTMINUTES
	addval $1
	setquantity
	writetext Route35NationalParkGateOfficer1WantToFinishText
	yesorno
	iffalsefwd Route35NationalParkGate_GoBackIn
	writetext Route35NationalParkGateOfficer1WaitAtNorthGateText
	waitbutton
	closetext
	jumpstd bugcontestresultswarp

Route35NationalParkGate_GoBackIn:
	writetext Route35NationalParkGateOfficer1OkGoFinishText
	waitbutton
	closetext
	scall Route35NationalParkGate_EnterContest
	playsound SFX_ENTER_DOOR
	special FadeOutPalettes
	waitsfx
	warpfacing UP, NATIONAL_PARK_BUG_CONTEST, 12, 47
	end

Route35OfficerScriptContest:
	readvar VAR_WEEKDAY
	ifequalfwd SUNDAY, Route35NationalParkGate_NoContestToday
	ifequalfwd MONDAY, Route35NationalParkGate_NoContestToday
	ifequalfwd WEDNESDAY, Route35NationalParkGate_NoContestToday
	ifequalfwd FRIDAY, Route35NationalParkGate_NoContestToday
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue_jumptextfaceplayer Route35NationalParkGateOfficer1ContestIsOverText
	faceplayer
	opentext
	callstd daytotext
	writetext Route35NationalParkGateOfficer1AskToParticipateText
	yesorno
	iffalsefwd Route35NationalParkGate_DeclinedToParticipate
	readvar VAR_PARTYCOUNT
	ifgreater $1, Route35NationalParkGate_LeaveTheRestBehind
	special ContestDropOffMons
	clearevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
Route35NationalParkGate_OkayToProceed:
	setflag ENGINE_BUG_CONTEST_TIMER
	special PlayMapMusic
	writetext Route35NationalParkGateOfficer1GiveParkBallsText
	promptbutton
	writetext Route35NationalParkGatePlayerReceivedParkBallsText
	callasm ShowParkBallIcon
	playsound SFX_ITEM
	waitsfx
	writetext Route35NationalParkGateOfficer1ExplainsRulesText
	waitbutton
	closetext
	special Special_GiveParkBalls
	scall Route35NationalParkGate_EnterContest
	playsound SFX_ENTER_DOOR
	special FadeOutPalettes
	waitsfx
	special Special_SelectRandomBugContestContestants
	warpfacing UP, NATIONAL_PARK_BUG_CONTEST, 12, 47
	end

Route35NationalParkGate_EnterContest:
	readvar VAR_FACING
	ifequalfwd LEFT, Route35NationalParkGate_FacingLeft
	applymovement PLAYER, Route35NationalParkGatePlayerGoAroundOfficerAndEnterParkMovement
	end

Route35NationalParkGate_FacingLeft:
	end

Route35NationalParkGate_LeaveTheRestBehind:
	readvar VAR_PARTYCOUNT
	ifless 6, Route35NationalParkGate_LessThanFullParty
	readvar VAR_BOXSPACE
	iffalse_jumpopenedtext Route35NationalParkGateOfficer1MakeRoomText
Route35NationalParkGate_LessThanFullParty: ; 6a27d
	special CheckFirstMonIsEgg
	iftrue_jumpopenedtext Route35NationalParkGateOfficer1EggAsFirstMonText
	writetext Route35NationalParkGateOfficer1AskToUseFirstMonText
	yesorno
	iffalsefwd Route35NationalParkGate_DeclinedToLeaveMonsBehind
	special ContestDropOffMons
	iftruefwd Route35NationalParkGate_FirstMonIsFainted
	setevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
	writetext Route35NationalParkGateOfficer1WellHoldYourMonText
	promptbutton
	writetext Route35NationalParkGatePlayersMonLeftWithHelperText
	playsound SFX_GOT_SAFARI_BALLS
	waitsfx
	promptbutton
	sjump Route35NationalParkGate_OkayToProceed

Route35NationalParkGate_DeclinedToParticipate:
	jumpopenedtext Route35NationalParkGateOfficer1TakePartInFutureText

Route35NationalParkGate_DeclinedToLeaveMonsBehind:
	jumpopenedtext Route35NationalParkGateOfficer1ChooseMonAndComeBackText

Route35NationalParkGate_FirstMonIsFainted:
	jumpopenedtext Route35NationalParkGateOfficer1FirstMonCantBattleText

Route35NationalParkGateOfficerScript:
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue_jumptextfaceplayer Route35NationalParkGateOfficer1ContestIsOverText
Route35NationalParkGate_NoContestToday:
	jumpthistextfaceplayer

	; GSC-DE Dump
	text "Die Turniere"
	line "werden regelmäßig"

	para "hier im PARK"
	line "abgehalten. Nimm"
	cont "doch auch daran"
	cont "teil!"
	done

Route35NationalParkGatePlayerApproachOfficer1Movement:
	step_down
	turn_head_left
	step_end

Route35NationalParkGatePlayerGoAroundOfficerAndEnterParkMovement:
	step_right
	step_up
	step_up
	step_end

Route35NationalParkGatePokefanFScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_CHARM_INTRO
	iftruefwd Route35NationalParkGateTutorCharmScript
	writetext Route35NationalParkGatePokefanFText
	waitbutton
	setevent EVENT_LISTENED_TO_CHARM_INTRO
Route35NationalParkGateTutorCharmScript:
	writetext Text_Route35NationalParkGateTutorCharm
	waitbutton
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	writetext Text_Route35NationalParkGateTutorQuestion
	yesorno
	iffalsefwd .TutorRefused
	setval CHARM
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpthisopenedtext

	; PC-only (Move Tutor)
	text "Ach, deine #MON"
	line "sind süß genug,"

	para "aber sie könnten"
	line "noch süßer sein!"
	done

.NoSilverLeaf
	jumpthisopenedtext

	; PC-only (Move Tutor)
	text "Tut mir leid, aber"
	line "ohne ein Silber-"

	para "blatt kann ich die"
	line "Attacke nicht"
	cont "beibringen."
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	; PC-only (Move Tutor)
	text "Dein #MON ist"
	line "schon süßer!"
	done

Route35NationalParkGateOfficer1AskToParticipateText:
	; GSC-DE Dump
	text "Heute ist "
	text_ram wStringBuffer3
	text "."
	line "Das heißt, heute"

	para "findet das Käfer-"
	line "turnier statt."

	para "Die Regeln sind"
	line "einfach."

	para "Fange ein Käfer-"
	line "#MON mit einem"
	cont "deiner eigenen"
	cont "#MON."

	para "Das Käfer-#MON"
	line "wird dann von der"
	cont "Jury bewertet."

	para "Möchtest du es"
	line "versuchen?"
	done

Route35NationalParkGateOfficer1GiveParkBallsText:
	; GSC-DE Dump
	text "Hier sind die"
	line "PARKBÄLLE für das"
	cont "Turnier."
	done

Route35NationalParkGatePlayerReceivedParkBallsText:
	; GSC-DE Dump (PC: BUG_CONTEST_BALLS)
	text "<PLAYER> erhält"
	line "{d:BUG_CONTEST_BALLS} PARKBÄLLE."
	done

Route35NationalParkGateOfficer1ExplainsRulesText:
	; GSC-DE Dump (PC: BUG_CONTEST_MINUTES)
	text "Wer das stärkste"
	line "Käfer-#MON"
	cont "fängt, hat"
	cont "gewonnen."

	para "Du hast {d:BUG_CONTEST_MINUTES}"
	line "Minuten Zeit."

	para "Wenn du keine"
	line "PARKBÄLLE mehr"
	cont "hast, ist das"
	cont "Turnier beendet."

	para "Du darfst das"
	line "letzte #MON,"
	cont "das du gefangen"
	cont "hast, behalten."

	para "Los! Fang das"
	line "stärkste Käfer-"
	cont "#MON, das du"
	cont "finden kannst!"
	done

Route35NationalParkGateOfficer1AskToUseFirstMonText:
	; GSC-DE Dump
	text "Oh, oh…"

	para "Du hast mehr als"
	line "ein #MON."

	para "Du musst"
	line "@"
	text_ram wStringBuffer3
	text ""

	para "auswählen - dein"
	line "erstes #MON."

	para "Bist du damit"
	line "einverstanden?"
	done

Route35NationalParkGateOfficer1WellHoldYourMonText:
	; GSC-DE Dump
	text "Gut. Wir passen"
	line "währenddessen auf"
	cont "deine anderen"
	cont "#MON auf."
	done

Route35NationalParkGatePlayersMonLeftWithHelperText:
	; GSC-DE Dump (≤18 wrap)
	text "Die #MON von"
	line "<PLAYER> wurden"
	cont "dem TURNIERHELFER"
	cont "übergeben."
	done

Route35NationalParkGateOfficer1ChooseMonAndComeBackText:
	; GSC-DE Dump
	text "Wähle bitte das"
	line "#MON, mit dem"

	para "du im Turnier"
	line "antreten möchtest,"
	cont "aus und komm dann"
	cont "wieder."
	done

Route35NationalParkGateOfficer1TakePartInFutureText:
	; GSC-DE Dump
	text "Na gut. Wir"
	line "hoffen, dass du"
	cont "später einmal"
	cont "am Turnier teil-"
	cont "nimmst."
	done

Route35NationalParkGateOfficer1FirstMonCantBattleText:
	; GSC-DE Dump
	text "Oh, oh…"
	line "Das erste #MON"

	para "deines Teams kann"
	line "nicht am Turnier"
	cont "teilnehmen."

	para "Tausche es bitte"
	line "mit dem #MON"

	para "aus, das am"
	line "Turnier teilnehmen"

	para "soll und komm dann"
	line "wieder."
	done

Route35NationalParkGateOfficer1MakeRoomText:
	; GSC-DE Dump
	text "Oh, oh…"
	line "Dein Team und"

	para "deine PC-BOX sind"
	line "voll besetzt."

	para "Du hast keinen"
	line "Platz für ein"
	cont "Käfer-#MON,"
	cont "das du fängst."

	para "Schaffe Platz in"
	line "deinem Team oder"

	para "in deiner PC-BOX"
	line "und komm dann"
	cont "wieder."
	done

Route35NationalParkGateOfficer1EggAsFirstMonText:
	; GSC-DE Dump
	text "Oh, oh…"
	line "Ein EI ist an"

	para "erster Stelle in"
	line "deinem Team."

	para "Tausche es bitte"
	line "mit dem #MON,"

	para "das du im Turnier"
	line "einsetzen möchtest"

	para "und komm dann"
	line "wieder."
	done

Route35NationalParkGateOfficer1WantToFinishText:
	; GSC-DE Dump
	text "Du hast noch "
	text_decimal wItemQuantityChangeBuffer, 1, 2
	line "Minute(n)."

	para "Möchtest du jetzt"
	line "aufhören?"
	done

Route35NationalParkGateOfficer1WaitAtNorthGateText:
	; GSC-DE Dump
	text "Gut. Warte bitte"
	line "am Nordtor auf"

	para "die Bekanntgabe"
	line "der Sieger."
	done

Route35NationalParkGateOfficer1OkGoFinishText:
	; GSC-DE Dump
	text "Gut. Geh bitte"
	line "wieder zurück nach"
	cont "draußen und komm"
	cont "zum Ende."
	done

Route35NationalParkGateOfficer1ContestIsOverText:
	; GSC-DE Dump
	text "Das heutige"
	line "Turnier ist be-"
	cont "endet. Wir hoffen,"

	para "dass du wieder"
	line "daran teilnehmen"
	cont "wirst."
	done

Route35NationalParkGateYoungsterText:
	; GSC-DE Dump
	text "Wann findet das"
	line "nächste Käfer-"
	cont "turnier"
	cont "statt?"
	done

BugCatchingContestExplanationText:
	; GSC-DE Dump
	text "Das Käferturnier"
	line "findet jeden"

	para "Dienstag,"
	line "Donnerstag und"
	cont "Samstag statt."

	para "Du erhältst nicht"
	line "nur einen Preis"

	para "allein für die"
	line "Teilnahme, sondern"

	para "auch ein Käfer-"
	line "#MON, das du"

	para "dort fängst."
	done

Route35NationalParkGatePokefanFText:
	; PC-only (Move Tutor intro)
	text "Viele #MON"
	line "kommen mit ihren"
	cont "Trainern in den"
	cont "NATIONALPARK."

	para "Und sie sind alle"
	line "so, so süß!"

	para "Ja, die"
	line "Käfer-#MON"
	cont "auch!"
	done

Text_Route35NationalParkGateTutorCharm:
	; PC-only (Move Tutor)
	text "Ich kann dein"
	line "#MON mit der"
	cont "Attacke Charme"
	cont "noch süßer machen."

	para "Gegnerische"
	line "#MON treffen es"
	cont "danach auch"
	cont "weniger hart!"
	done

Text_Route35NationalParkGateTutorQuestion:
	; PC-only (Move Tutor)
	text "Ich brauche nur"
	line "ein Silberblatt,"

	para "darf ich Charme"
	line "beibringen? Bitte,"
	cont "bitte?"
	done
