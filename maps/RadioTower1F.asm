RadioTower1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 11
	warp_event  3,  7, GOLDENROD_CITY, 11
	warp_event 15,  0, RADIO_TOWER_2F, 2

	def_coord_events

	def_bg_events
	bg_event  3,  0, BGEVENT_JUMPTEXT, RadioTower1FDirectoryText
	bg_event 13,  0, BGEVENT_JUMPTEXT, RadioTower1FLuckyChannelSignText

	def_object_events
	object_event  8,  6, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RadioTower1FLuckyNumberManScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 14,  6, SPRITE_WHITNEY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTower1FWhitneyScript, EVENT_GOLDENROD_GYM_WHITNEY
	object_event  5,  6, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower1FReceptionistScript, -1
	object_event 17,  5, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, RadioTower1FLassText, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 17,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, RadioTower1FYoungsterText, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 14,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerGruntM3, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 12,  6, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower1FRadioCardWomanScript, EVENT_GOLDENROD_CITY_CIVILIANS

	object_const_def
	const RADIOTOWER1F_FELICITY
	const RADIOTOWER1F_WHITNEY

RadioTower1FReceptionistScript:
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue_jumptextfaceplayer RadioTower1FReceptionistNoToursText
	jumpthistextfaceplayer

	; GSC-DE Dump
	text "Willkommen!"
	done


RadioTower1FLuckyNumberManScript:
	faceplayer
	opentext
	writetext RadioTower1FLuckyNumberManAskToPlayText
	waitbutton
	checkevent EVENT_INTRODUCED_FELICITY
	iftruefwd .introduced
	writetext IntroduceFelicityText
	waitbutton
	setevent EVENT_INTRODUCED_FELICITY
.introduced
	writetext ExplainLuckyNumberShowText
	promptbutton
	checkflag ENGINE_LUCKY_NUMBER_SHOW
	iftruefwd .skip
	special Special_ResetLuckyNumberShowFlag
.skip
	special Special_PrintTodaysLuckyNumber
	checkflag ENGINE_LUCKY_NUMBER_SHOW
	iftrue_jumpopenedtext RadioTower1FLuckyNumberManComeAgainText
	writetext RadioTower1FLuckyNumberManTodayIdIsText
	promptbutton
	closetext
	applymovement RADIOTOWER1F_FELICITY, RadioTower1FLuckyNumberManGoToPCMovement
	opentext
	writetext RadioTower1FLuckyNumberManCheckIfMatchText
	promptbutton
	waitsfx
	writetext RadioTower1FLuckyNumberManDotDotDotText
	playsound SFX_DEX_FANFARE_20_49
	special Special_CheckForLuckyNumberWinners
	closetext
	applymovement RADIOTOWER1F_FELICITY, RadioTower1FLuckyNumberManReturnToPlayerMovement
	opentext
	ifequalfwd 5, .FirstPlace
	ifequalfwd 4, .SecondPlace
	ifequalfwd 3, .ThirdPlace
	ifequalfwd 2, .FourthPlace
	ifequalfwd 1, .FifthPlace
	jumpthisopenedtext

	; GSC-DE Dump
	text "Leider stimmt"
	line "keine deiner"
	cont "Ziffern überein."
	done

.FirstPlace:
	giveitem MASTER_BALL
	writetext WonFirstPlaceText
	special ShowItemIcon
	playsound SFX_1ST_PLACE
	sjumpfwd .Finish

.SecondPlace:
	giveitem BOTTLE_CAP
	writetext WonSecondPlaceText
	special ShowItemIcon
	playsound SFX_2ND_PLACE
	sjumpfwd .Finish

.ThirdPlace:
	giveitem PP_MAX
	writetext WonThirdPlaceText
	special ShowItemIcon
	playsound SFX_2ND_PLACE
	sjumpfwd .Finish

.FourthPlace:
	giveitem PP_UP
	writetext WonFourthPlaceText
	special ShowItemIcon
	playsound SFX_3RD_PLACE
	sjumpfwd .Finish

.FifthPlace:
	giveitem RARE_CANDY
	writetext WonFifthPlaceText
	special ShowItemIcon
	playsound SFX_3RD_PLACE
.Finish:
	waitsfx
	promptbutton
	; Icon already drawn; reload fonts before either pocket-full or itemnotify text.
	callasm LoadFonts_NoOAMUpdate
	iffalse_jumpopenedtext RadioTower1FLuckyNumberManNoRoomForYourPrizeText
	itemnotify
	setflag ENGINE_LUCKY_NUMBER_SHOW
	jumpthisopenedtext

RadioTower1FLuckyNumberManComeAgainText:
	; GSC-DE Dump
	text "Versuche nächste"
	line "Woche erneut"
	cont "dein Glück bei der"
	cont "GLÜCKSZAHLSHOW."
	done






RadioTower1FRadioCardWomanScript:
	checkevent EVENT_GOLDENROD_GYM_WHITNEY
	iftrue_jumptextfaceplayer RadioTower1FRadioCardWomanTuneInText
	faceplayer
	opentext
	writetext RadioTower1FRadioCardWomanOfferQuizText
	yesorno
	iffalse_jumpopenedtext RadioTower1FRadioCardWomanNotTakingQuizText
	writetext RadioTower1FRadioCardWomanQuestion1Text
	yesorno
	iffalsefwd .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanQuestion2Text
	yesorno
	iffalsefwd .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanQuestion3Text
	yesorno
	iftruefwd .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanQuestion4Text
	yesorno
	iftruefwd .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanQuestion5Text
	yesorno
	iftruefwd .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanYouWinText
	promptbutton
	givespecialitem RADIO_CARD
	writetext RadioTower1FPokegearIsARadioText
	promptbutton
	setflag ENGINE_RADIO_CARD
	writetext RadioTower1FRadioCardWomanTuneInText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, RADIOTOWER1F_WHITNEY, 15
	applymovement RADIOTOWER1F_WHITNEY, RadioTower1FWhitneyApproachesMovementData
	turnobject PLAYER, RIGHT
	showtext RadioTower1FWhitney2Text
	applymovement RADIOTOWER1F_WHITNEY, RadioTower1FWhitneyLeaves1MovementData
	turnobject PLAYER, LEFT
	applymovement RADIOTOWER1F_WHITNEY, RadioTower1FWhitneyLeaves2MovementData
	disappear RADIOTOWER1F_WHITNEY
	end

.WrongAnswer:
	playsound SFX_WRONG
	jumpthisopenedtext

	; GSC-DE Dump
	text "Oh, nein."
	line "Das war leider"
	para "falsch. Versuch's"
	line "noch einmal!"
	done
GenericTrainerGruntM3:
	generictrainer GRUNTM, 3, EVENT_BEAT_ROCKET_GRUNTM_3, GruntM3SeenText, GruntM3BeatenText

	; GSC-DE Dump
	text "Du bist zu stark."
	para "Du könntest unsere"
	line "Pläne zerstören."
	cont "Ich muss die"
	cont "anderen warnen…"
	done

RadioTower1FWhitneyScript:
	showtextfaceplayer RadioTower1FWhitney1Text
	turnobject RADIOTOWER1F_WHITNEY, LEFT
	end

RadioTower1FLuckyNumberManGoToPCMovement:
	step_right
	turn_head_up
	step_end

RadioTower1FLuckyNumberManReturnToPlayerMovement:
	step_left
	turn_head_up
	step_end

RadioTower1FWhitneyApproachesMovementData:
	step_up
	step_up
	step_left
	step_end

RadioTower1FWhitneyLeaves1MovementData:
	step_up
	step_left
	step_left
	step_end

RadioTower1FWhitneyLeaves2MovementData:
	step_left
	step_left
	step_left
	step_left
	step_end


RadioTower1FReceptionistNoToursText:
	; GSC-DE Dump
	text "Guten Tag! Leider"
	line "bieten wir heute"
	cont "keine Führungen"
	cont "an."
	done






RadioTower1FLuckyNumberManAskToPlayText:
	; GSC-DE Dump
	text "Hallo! Bist du"
	line "wegen der GLÜCKS-"
	cont "ZAHLSHOW hier?"
	para "Soll ich die"
	line "ID-Nummern deiner"
	cont "#MON über-"
	cont "prüfen?"
	para "Wenn du Glück"
	line "hast, gewinnst du"
	cont "einen Preis."
	done






IntroduceFelicityText:
	text "Ich bin Felicity,"
	line "deine Begleiterin"
	cont "heute."
	done

ExplainLuckyNumberShowText:
	; PC-only (Felicity)
	text "Soll ich die ID-"
	line "Nummern deiner"
	cont "#MON prüfen?"
	para "Bei Glück gewinnst"
	line "du einen Preis."
	done

RadioTower1FLuckyNumberManTodayIdIsText:
	text "Die heutige"
	line "Glücks-ID-Nummer"
	cont "ist "
	text_ram wStringBuffer3
	text "."
	done

RadioTower1FLuckyNumberManCheckIfMatchText:
	; GSC-DE Dump
	text "Mal sehen, ob"
	line "du Glück hast."
	done






RadioTower1FLuckyNumberManDotDotDotText:
	text "… …"
	done






WonFirstPlaceText:
	; GSC-DE Dump (PC: 5 Plätze)
	text "Wow! Alle fünf"
	line "Ziffern stimmen"
	cont "überein!"
	para "Du gewinnst den"
	line "Hauptpreis!"
	para "Du gewinnst einen"
	line "MEISTERBALL!"
	done

WonSecondPlaceText:
	; GSC-DE Dump wording / PC-Preis
	text "Hey! Die letzten"
	line "vier Ziffern"
	cont "stimmen überein!"
	para "Du hast den"
	line "zweiten Preis"
	cont "gewonnen: einen"
	cont "KRONKORKEN!"
	done

WonThirdPlaceText:
	; GSC-DE Dump wording / PC-Preis
	text "Hey! Die letzten"
	line "drei Ziffern"
	cont "stimmen überein!"
	para "Du hast den"
	line "dritten Preis"
	cont "gewonnen: einen"
	cont "AP-Max!"
	done

WonFourthPlaceText:
	; GSC-DE Dump wording / PC-Preis
	text "Ooh, die letzten"
	line "beiden Ziffern"
	cont "stimmen überein."
	para "Du hast den"
	line "vierten Preis"
	cont "gewonnen: einen"
	cont "AP-Plus!"
	done

WonFifthPlaceText:
	; GSC-DE Dump wording / PC-Preis
	text "Ooh, die letzte"
	line "Ziffer stimmt"
	cont "überein."
	para "Du hast den"
	line "fünften Preis"
	cont "gewonnen: einen"
	cont "SONDERBONBON!"
	done

RadioTower1FLuckyNumberManNoRoomForYourPrizeText:
	; GSC-DE Dump
	text "Du kannst den"
	line "Preis nicht"
	cont "tragen."
	para "Schaffe Platz und"
	line "komm gleich"
	cont "wieder zurück."
	done






RadioTower1FRadioCardWomanOfferQuizText:
	; GSC-DE Dump
	text "Bei uns läuft"
	line "momentan ein"
	cont "besonderes Quiz."
	para "Beantworte die"
	line "fünf Fragen"
	cont "richtig, um ein"
	cont "RADIO-MODUL"
	cont "zu gewinnen."
	para "Stecke es in den"
	line "#COM, um"
	para "überall und zu"
	line "jeder Zeit Radio"
	cont "hören zu können."
	para "Möchtest du am"
	line "Quiz teilnehmen?"
	done






RadioTower1FRadioCardWomanQuestion1Text:
	; GSC-DE Dump
	text "Frage 1:"
	para "Gibt es ein #-"
	line "MON, das nur VOR-"
	cont "MITTAGs erscheint?"
	done

RadioTower1FRadioCardWomanQuestion2Text:
	; GSC-DE Dump
	text "Korrekt!"
	line "Frage 2:"
	para "Ist diese Aussage"
	line "korrekt?"
	para "Du kannst BEEREN"
	line "nicht im SUPER-"
	cont "MARKT erstehen."
	done

RadioTower1FRadioCardWomanQuestion3Text:
	; GSC-DE Dump
	text "Richtig!"
	line "Frage 3:"
	para "Ist VM01 BLITZ?"
	done

RadioTower1FRadioCardWomanQuestion4Text:
	; GSC-DE Dump
	text "Nicht übel!"
	line "Frage 4:"
	para "Ist FALK der"
	line "ARENALEITER von"
	para "VIOLA CITY, der"
	line "Vogel-#MON"
	cont "einsetzt?"
	done

RadioTower1FRadioCardWomanQuestion5Text:
	; GSC-DE Dump
	text "Wieder richtig!"
	line "Hier die letzte"
	cont "Frage:"
	para "Ist bei den Ein-"
	line "armigen Banditen"
	para "in der SPIELHALLE"
	line "von DUKATIA CITY"
	para "ein GLUMANDA auf"
	line "einer Rolle abge-"
	cont "bildet?"
	done

RadioTower1FRadioCardWomanYouWinText:
	; GSC-DE Dump
	text "Bingo! Richtig!"
	line "Glückwunsch!"
	para "Hier hast du"
	line "deinen Preis:"
	cont "ein RADIO-MODUL!"
	done

RadioTower1FPokegearIsARadioText:
	; GSC-DE Dump
	text "<PLAYER>s #COM"
	line "kann jetzt auch"
	cont "als Radio ver-"
	cont "wendet werden!"
	done

RadioTower1FRadioCardWomanTuneInText:
	; GSC-DE Dump
	text "Höre dir bitte"
	line "unsere Shows an!"
	done

RadioTower1FRadioCardWomanNotTakingQuizText:
	; GSC-DE Dump
	text "Oh. Ich verstehe."
	line "Komm wieder, wenn"
	cont "du deine Meinung"
	cont "geändert hast."
	done

RadioTower1FLassText:
	; GSC-DE Dump
	text "BEN ist ein"
	line "großartiger DJ."
	para "Seine sonore"
	line "Stimme lässt mich"
	cont "dahinschmelzen!"
	done

RadioTower1FYoungsterText:
	; GSC-DE Dump
	text "Ich liebe MARGIT"
	line "vom #MON-TALK."
	para "Ich kenne aber"
	line "nur ihre Stimme."
	done

GruntM3SeenText:
	; GSC-DE Dump
	text "Endlich haben wir"
	line "den RADIOTURM"
	cont "besetzt!"
	para "Nun wird jeder"
	line "den TEAM ROCKET-"
	para "Terrorapparat"
	line "kennenlernen!"
	para "Wir zeigen euch,"
	line "wie böse wir sind!"
	done

GruntM3BeatenText:
	; GSC-DE Dump
	text "Zu stark! Wir"
	line "müssen dich im"
	cont "Auge behalten…"
	done

RadioTower1FWhitney1Text:
	text "Hallo! Ich bin"
	line "BIANKA!"

	para "Ich hörte von dem"
	line "Quiz für eine"
	cont "Funkkarte,"

	para "also bin ich"
	line "hergekommen…"

	para "Aber dieses Quiz"
	line "ist so schwer!"
	done

RadioTower1FWhitney2Text:
	text "BIANKA: Wow, du"
	line "hast es geschafft!"

	para "Ich dachte, die"
	line "vierte Antwort"
	cont "wäre Aprikokos…"

	para "Ups! Ich muss"
	line "zurück zur ARENA!"
	done

RadioTower1FDirectoryText:
	; GSC-DE Dump
	text "EG REZEPTION"
	line "1S VERKAUF"
	para "2S PERSONAL"
	line "3S PRODUKTION"
	para "4S BÜRO DES"
	line "   INTENDANTEN"
	done

RadioTower1FLuckyChannelSignText:
	; GSC-DE Dump
	text "GLÜCKSKANAL!"
	para "Gewinne mit #-"
	line "MON-ID-Nummern!"
	para "Tausche deine "
	line "#MON, um viele"
	cont "ID-Nummern zu"
	cont "erhalten!"
	done






