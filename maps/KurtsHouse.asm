KurtsHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, KurtsHouseKurtCallback

	def_warp_events
	warp_event  3,  7, AZALEA_TOWN, 4
	warp_event  4,  7, AZALEA_TOWN, 4

	def_coord_events

	def_bg_events
	bg_event  6,  1, BGEVENT_JUMPSTD, radio2
	bg_event  8,  0, BGEVENT_JUMPTEXT, KurtsHouseOakPhotoText
	bg_event  9,  0, BGEVENT_JUMPTEXT, KurtsHouseOakPhotoText
	bg_event  5,  1, BGEVENT_READ, PokemonJournalProfWestwoodScript
	bg_event  2,  1, BGEVENT_READ, PokemonJournalProfWestwoodScript
	bg_event  3,  1, BGEVENT_READ, PokemonJournalProfWestwoodScript
	bg_event  4,  1, BGEVENT_JUMPTEXT, KurtsHouseCelebiStatueText

	def_object_events
	object_event  3,  2, SPRITE_KURT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Kurt1, EVENT_KURTS_HOUSE_KURT_1
	object_event  5,  3, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, KurtsGranddaughter1, EVENT_KURTS_HOUSE_GRANDDAUGHTER_1
	object_event 14,  3, SPRITE_KURT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Kurt2, EVENT_KURTS_HOUSE_KURT_2
	object_event 11,  4, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, KurtsGranddaughter2, EVENT_KURTS_HOUSE_GRANDDAUGHTER_2
	pokemon_event  6,  3, SLOWPOKE, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_PINK, KurtsHouseSlowpokeText, EVENT_KURTS_HOUSE_SLOWPOKE

	object_const_def
	const KURTSHOUSE_KURT1
	const KURTSHOUSE_TWIN1
	const KURTSHOUSE_KURT2
	const KURTSHOUSE_TWIN2

KurtsHouseKurtCallback:
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iffalsefwd .Done
	checkevent EVENT_FOREST_IS_RESTLESS
	iftruefwd .Done
	checkflag ENGINE_KURT_MAKING_BALLS
	iftruefwd .MakingBalls
	disappear KURTSHOUSE_KURT2
	appear KURTSHOUSE_KURT1
	disappear KURTSHOUSE_TWIN2
	appear KURTSHOUSE_TWIN1
	endcallback

.MakingBalls:
	disappear KURTSHOUSE_KURT1
	appear KURTSHOUSE_KURT2
	disappear KURTSHOUSE_TWIN1
	appear KURTSHOUSE_TWIN2
.Done:
	endcallback

Kurt1:
	faceplayer
	opentext
	checkevent EVENT_KURT_GAVE_YOU_APRICORN_BOX
	iftruefwd .GotApricornBox
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iftruefwd .ClearedSlowpokeWell
	writetext KurtsHouseKurtMakingBallsMustWaitText
	waitbutton
	closetext
	special Special_FadeOutMusic
	setevent EVENT_AZALEA_TOWN_SLOWPOKETAIL_ROCKET
	readvar VAR_FACING
	ifequalfwd UP, .RunAround
	turnobject PLAYER, DOWN
	playsound SFX_FLY
	applymovement KURTSHOUSE_KURT1, KurtsHouseKurtExitHouseMovement
	playsound SFX_EXIT_BUILDING
	disappear KURTSHOUSE_KURT1
	waitsfx
	special RestartMapMusic
	end

.RunAround:
	turnobject PLAYER, DOWN
	playsound SFX_FLY
	applymovement KURTSHOUSE_KURT1, KurtsHouseKurtGoAroundPlayerThenExitHouseMovement
	playsound SFX_EXIT_BUILDING
	disappear KURTSHOUSE_KURT1
	waitsfx
	special RestartMapMusic
	end

.ClearedSlowpokeWell:
	writetext KurtsHouseKurtHonoredToMakeBallsText
	promptbutton
	verbosegivekeyitem APRICORN_BOX
	setevent EVENT_KURT_GAVE_YOU_APRICORN_BOX
.GotApricornBox:
	checkevent EVENT_GAVE_KURT_RED_APRICORN
	iftruefwd .GiveLevelBall
	checkevent EVENT_GAVE_KURT_BLU_APRICORN
	iftruefwd .GiveLureBall
	checkevent EVENT_GAVE_KURT_YLW_APRICORN
	iftruefwd .GiveMoonBall
	checkevent EVENT_GAVE_KURT_GRN_APRICORN
	iftruefwd .GiveFriendBall
	checkevent EVENT_GAVE_KURT_WHT_APRICORN
	iftrue .GiveFastBall
	checkevent EVENT_GAVE_KURT_BLK_APRICORN
	iftrue .GiveHeavyBall
	checkevent EVENT_GAVE_KURT_PNK_APRICORN
	iftrue .GiveLoveBall
	checkevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	iftrue .CanGiveGSBallToKurt
.NoGSBall:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftruefwd .CheckApricorns
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	iftruefwd .CheckApricorns
	writetext KurtsHouseKurtBallsFromApricornsText
	waitbutton
.CheckApricorns:
	callasm .CheckHaveAnyApricorns
	iftruefwd .AskApricorn
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue_jumpopenedtext KurtsHouseKurtTurnedOutGreatText
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	iftrue_jumpopenedtext KurtsHouseKurtBallsFromApricornsText
	endtext

.CheckHaveAnyApricorns:
	xor a
	ld hl, wApricorns
	or [hl]
rept NUM_APRICORNS - 1
	inc hl
	or [hl]
endr
	ldh [hScriptVar], a
	ret

.AskApricorn:
	writetext KurtsHouseKurtAskYouHaveAnApricornText
	promptbutton
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	special Special_SelectApricornForKurt
	iffalse_jumpopenedtext KurtsHouseKurtThatsALetdownText
	ifequalfwd BLU_APRICORN, .Blu
	ifequalfwd YLW_APRICORN, .Ylw
	ifequalfwd GRN_APRICORN, .Grn
	ifequalfwd WHT_APRICORN, .Wht
	ifequalfwd BLK_APRICORN, .Blk
	ifequalfwd PNK_APRICORN, .Pnk
; .Red
	setevent EVENT_GAVE_KURT_RED_APRICORN
	sjumpfwd .GaveKurtApricorns

.Blu:
	setevent EVENT_GAVE_KURT_BLU_APRICORN
	sjumpfwd .GaveKurtApricorns

.Ylw:
	setevent EVENT_GAVE_KURT_YLW_APRICORN
	sjumpfwd .GaveKurtApricorns

.Grn:
	setevent EVENT_GAVE_KURT_GRN_APRICORN
	sjumpfwd .GaveKurtApricorns

.Wht:
	setevent EVENT_GAVE_KURT_WHT_APRICORN
	sjumpfwd .GaveKurtApricorns

.Blk:
	setevent EVENT_GAVE_KURT_BLK_APRICORN
	sjumpfwd .GaveKurtApricorns

.Pnk:
	setevent EVENT_GAVE_KURT_PNK_APRICORN
.GaveKurtApricorns:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	writetext KurtsHouseKurtGetStartedText
	waitbutton
	closetext
	follow KURTSHOUSE_KURT1, PLAYER
	applymovement KURTSHOUSE_KURT1, KurtsHouseFollowKurt_MovementData
	stopfollow
	pause 15
	turnobject KURTSHOUSE_KURT1, DOWN
	showtext KurtsHouseKurtItWillTakeADayText
	applymovement PLAYER, KurtsHouseStepAwayFromKurt_MovementData
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	playsound SFX_ENTER_DOOR
	waitsfx
	pause 35
	warpfacing UP, KURTS_HOUSE, 3, 3
	sjump Kurt1

.ThatTurnedOutGreat:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	jumpopenedtext KurtsHouseKurtTurnedOutGreatText

.GiveLevelBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftruefwd KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar LEVEL_BALL, VAR_KURT_APRICORNS
	iffalse_endtext
	clearevent EVENT_GAVE_KURT_RED_APRICORN
	sjump .ThatTurnedOutGreat

.GiveLureBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftruefwd KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar LURE_BALL, VAR_KURT_APRICORNS
	iffalse_endtext
	clearevent EVENT_GAVE_KURT_BLU_APRICORN
	sjump .ThatTurnedOutGreat

.GiveMoonBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftruefwd KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar MOON_BALL, VAR_KURT_APRICORNS
	iffalse_endtext
	clearevent EVENT_GAVE_KURT_YLW_APRICORN
	sjump .ThatTurnedOutGreat

.GiveFriendBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftruefwd KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar FRIEND_BALL, VAR_KURT_APRICORNS
	iffalse_endtext
	clearevent EVENT_GAVE_KURT_GRN_APRICORN
	sjump .ThatTurnedOutGreat

.GiveFastBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftruefwd KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar FAST_BALL, VAR_KURT_APRICORNS
	iffalse_endtext
	clearevent EVENT_GAVE_KURT_WHT_APRICORN
	sjump .ThatTurnedOutGreat

.GiveHeavyBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftruefwd KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar HEAVY_BALL, VAR_KURT_APRICORNS
	iffalse_endtext
	clearevent EVENT_GAVE_KURT_BLK_APRICORN
	sjump .ThatTurnedOutGreat

.GiveLoveBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftruefwd KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar LOVE_BALL, VAR_KURT_APRICORNS
	iffalse_endtext
	clearevent EVENT_GAVE_KURT_PNK_APRICORN
	sjump .ThatTurnedOutGreat

.CanGiveGSBallToKurt:
	checkevent EVENT_GAVE_GS_BALL_TO_KURT
	iftruefwd .GaveGSBallToKurt
	checkkeyitem GS_BALL
	iffalse .NoGSBall
	writetext KurtsHouseKurtWhatIsThatText
	waitbutton
	closetext
	setevent EVENT_GAVE_GS_BALL_TO_KURT
	takekeyitem GS_BALL
	setflag ENGINE_KURT_MAKING_BALLS
	end

.GaveGSBallToKurt:
	checkflag ENGINE_KURT_MAKING_BALLS
	iffalsefwd .NotMakingBalls
	writetext KurtsHouseKurtImCheckingItNowText
	waitbutton
	jumpopenedtext KurtsHouseKurtAhHaISeeText

.NotMakingBalls:
	writetext KurtsHouseKurtThisBallStartedToShakeText
	waitbutton
	closetext
	setevent EVENT_FOREST_IS_RESTLESS
	clearevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	clearevent EVENT_GAVE_GS_BALL_TO_KURT
	special Special_FadeOutMusic
	pause 20
	showemote EMOTE_SHOCK, KURTSHOUSE_KURT1, 30
	readvar VAR_FACING
	ifequalfwd UP, .GSBallRunAround
	turnobject PLAYER, DOWN
	playsound SFX_FLY
	applymovement KURTSHOUSE_KURT1, KurtsHouseKurtExitHouseMovement
	sjumpfwd .KurtHasLeftTheBuilding

.GSBallRunAround:
	turnobject PLAYER, DOWN
	playsound SFX_FLY
	applymovement KURTSHOUSE_KURT1, KurtsHouseKurtGoAroundPlayerThenExitHouseMovement
.KurtHasLeftTheBuilding:
	playsound SFX_EXIT_BUILDING
	disappear KURTSHOUSE_KURT1
	clearevent EVENT_AZALEA_TOWN_KURT
	waitsfx
	special RestartMapMusic
	setmapscene AZALEA_TOWN, SCENE_AZALEATOWN_CELEBI_EVENT
	end

Kurt2:
	faceplayer
	opentext
	checkevent EVENT_GAVE_GS_BALL_TO_KURT
	iftruefwd KurtScript_ImCheckingItNow
KurtMakingBallsScript:
	checkevent EVENT_BUGGING_KURT_TOO_MUCH
	iffalsefwd Script_FirstTimeBuggingKurt
	writetext KurtsHouseKurtDontBotherMeText
	waitbutton
	closetext
	turnobject LAST_TALKED, UP
	end

Script_FirstTimeBuggingKurt:
	writetext KurtsHouseKurtGranddaughterHelpingWorkFasterText
	waitbutton
	closetext
	turnobject LAST_TALKED, UP
	setevent EVENT_BUGGING_KURT_TOO_MUCH
	end

KurtScript_ImCheckingItNow:
	writetext KurtsHouseKurtImCheckingItNowText
	waitbutton
	turnobject LAST_TALKED, UP
	jumpopenedtext KurtsHouseKurtAhHaISeeText

KurtsGranddaughter1:
	faceplayer
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftruefwd KurtsGranddaughter2Subscript
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue_jumptext KurtsGranddaughterFunText
	checkevent EVENT_FOREST_IS_RESTLESS
	iftrue_jumptext KurtsGranddaughterLonelyText
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftrue_jumptext KurtsGranddaughterDadText
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iftrue_jumptext KurtsGranddaughterSlowpokeBackText
	checkevent EVENT_AZALEA_TOWN_SLOWPOKETAIL_ROCKET
	iftrue_jumptext KurtsGranddaughterLonelyText
	jumpthistext

	text "Die FLEGMON sind"
	line "weg … Wurden sie"
	para "von bösen Menschen"
	line "mitgenommen?"
	done

KurtsGranddaughter2:
	faceplayer
KurtsGranddaughter2Subscript:
	opentext
	checkevent EVENT_GAVE_GS_BALL_TO_KURT
	iftruefwd .GSBall
	writetext KurtsGranddaughterHelpText
	waitbutton
	closetext
	turnobject LAST_TALKED, RIGHT
	end

.GSBall:
	writetext KurtsGranddaughterGSBallText
	waitbutton
	closetext
	turnobject LAST_TALKED, RIGHT
	end

PokemonJournalProfWestwoodScript:
	setflag ENGINE_READ_PROF_WESTWOOD_JOURNAL
	jumpthistext

	text "#mon Journal"
	para "Spezial: Prof."
	line "Westwood!"
	para "PROF. WESTWOOD V."
	line "lehrt an der"
	cont "Prismania-Uni."
	para "Die Forschung"
	line "seines Urahnen im"
	cont "Jahr 1925"
	para "führte zur"
	line "Entwicklung"
	cont "moderner #BÄLLE"
	done

KurtsHouseKurtGoAroundPlayerThenExitHouseMovement:
	big_step_right
KurtsHouseKurtExitHouseMovement:
	run_step_down
	run_step_down
	run_step_down
	run_step_down
	run_step_down
	step_end

KurtsHouseFollowKurt_MovementData:
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_down
	step_down
	step_down
	step_right
	step_right
	step_right
	step_up
	step_up
	step_end

KurtsHouseStepAwayFromKurt_MovementData:
	step_down
	step_left
	step_left
	step_end

KurtsHouseKurtMakingBallsMustWaitText:
	text "Hm? Wer bist du?"
	para "<PLAYER>, was? Du"
	line "willst, dass ich"
	cont "ein paar BÄLLE"
	cont "mache?"
	para "Verzeih, aber das"
	line "muss warten."
	para "Kennst du TEAM"
	line "ROCKET? Egal, ich"
	cont "erzähle dir"
	cont "ohnehin darüber."
	para "TEAM ROCKET ist"
	line "eine üble Bande,"
	cont "die #mon für"
	cont "ihre Zwecke"
	cont "einsetzt."
	para "Man sagt, sie"
	line "hätten sich vor"
	cont "drei Jahren"
	cont "aufgelöst."
	para "Aber jetzt sind"
	line "sie am BRUNNEN"
	para "und schneiden den"
	line "FLEGMON die Ruten"
	cont "ab, um sie zu"
	cont "verkaufen!"
	para "Also werde ich"
	line "ihnen eine Lektion"
	cont "erteilen!"
	para "Haltet durch,"
	line "FLEGMON! Der alte"
	cont "KURT ist auf dem"
	cont "Weg!"
	done



KurtsHouseKurtHonoredToMakeBallsText:
	text "KURT: Hi, <PLAYER>!"
	para "Du hast dich am"
	line "BRUNNEN wie ein"
	cont "wahrer Held"
	cont "benommen."
	para "Ich mag deinen"
	line "Stil!"
	para "Es wäre mir eine"
	line "Ehre, für einen"
	cont "Trainer wie dich"
	cont "BÄLLE"
	cont "anzufertigen."
	para "Das ist alles, was"
	line "ich habe. Aber"
	cont "bitte nimm es!"
	done



KurtsHouseKurtBallsFromApricornsText:
	text "KURT: Ich mache"
	line "BÄLLE aus"
	cont "APRIKOKOS."
	para "Pflücke sie von"
	line "Bäumen und bring"
	cont "sie zu mir."
	para "Ich fertige daraus"
	line "BÄLLE an."
	done



KurtsHouseKurtAskYouHaveAnApricornText:
	text "KURT: Hast du eine"
	line "APRIKOKO für mich?"
	para "Schön! Ich werde"
	line "einen BALL daraus"
	cont "machen."
	done



KurtsHouseKurtGetStartedText:
	text "KURT: Ich fange"
	line "gleich an!"
	done

KurtsHouseKurtItWillTakeADayText:
	text "KURT: Ich werde"
	line "einen Tag"
	cont "brauchen, um einen"
	cont "BALL zu machen."
	para "Komm später"
	line "wieder!"
	done



KurtsHouseKurtThatsALetdownText:
	text "KURT: Oh … Du"
	line "lässt mich im"
	cont "Stich?"
	done



KurtsHouseKurtDontBotherMeText:
	text "KURT: Ich arbeite!"
	line "Stör mich nicht!"
	done



KurtsHouseKurtJustFinishedYourBallText:
	text "KURT: Ah, <PLAYER>!"
	line "Ich bin gerade"
	cont "fertig geworden."
	cont "Hier hast du den"
	cont "BALL!"
	done



KurtsHouseKurtTurnedOutGreatText:
	text "KURT: Er ist"
	line "groß-artig"
	cont "geworden."
	para "Versuche, ein"
	line "#mon damit zu"
	cont "fangen."
	done



KurtsHouseKurtGranddaughterHelpingWorkFasterText:
	text "KURT: Da mir meine"
	line "Enkelin jetzt"
	para "hilft, bin ich"
	line "schneller."
	done



KurtsHouseKurtWhatIsThatText:
	text "W-was ist das?"

	para "Das habe ich noch"
	line "nie gesehen."

	para "Es sieht wie ein"
	line "#BALL aus, es"

	para "scheint, aber"
	line "etwas anderes zu"
	cont "sein."

	para "Ich überprüfe das"
	line "für dich."
	done



KurtsHouseKurtImCheckingItNowText:
	text "Ich überprüfe es"
	line "gerade."
	done



KurtsHouseKurtAhHaISeeText:
	text "Ah-ha! Verstehe!"
	line "So ist das …"
	done



KurtsHouseKurtThisBallStartedToShakeText:
	text "<PLAYER>!"

	para "Dieser BALL hat"
	line "sich bewegt, als"
	cont "ich ihn"
	cont "überprüfte."

	para "Da geht etwas vor"
	line "sich!"
	done



KurtsGranddaughterLonelyText:
	text "Großvater ist fort"
	line "… Ich fühle mich"
	cont "so einsam …"
	done



KurtsGranddaughterSlowpokeBackText:
	text "Das FLEGMON, das"
	line "mir mein Vater"
	para "gab, ist wieder"
	line "da. Auch seine"
	para "RUTE wächst wieder"
	line "nach!"
	done



KurtsGranddaughterDadText:
	text "Papa arbeitet für"
	line "SILPH CO., wo er"
	cont "#BÄLLE"
	cont "analysiert."
	para "Ich muss mit"
	line "Großvater und"
	cont "FLEGMON zu Hause"
	cont "bleiben."
	done



KurtsGranddaughterHelpText:
	text "Ich muss jetzt Opa"
	line "helfen!"
	para "Wir machen dir"
	line "einen"
	cont "hervorragenden"
	cont "BALL, warte mal!"
	done



KurtsGranddaughterFunText:
	text "BÄLLE anfertigen"
	line "macht Spaß!"
	done



KurtsGranddaughterGSBallText:
	text "Opa überprüft"
	line "gerade einen BALL."
	para "Ich warte, bis er"
	line "fertig ist."
	done



KurtsHouseSlowpokeText:
	text "FLEGMON: … Gähn?"
	done



KurtsHouseOakPhotoText:
	text "… Ein junger PROF."
	line "EICH?"
	done



KurtsHouseCelebiStatueText:
	text "Eine Statue des"
	line "Waldpatrons."
	done



