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
	iffalse_jumpopenedtext RadioTower1FLuckyNumberManNoRoomForYourPrizeText
	itemnotify
	setflag ENGINE_LUCKY_NUMBER_SHOW
	jumpthisopenedtext

RadioTower1FLuckyNumberManComeAgainText:
	text "Versuche nächste"
	line "Woche erneut dein"
	cont "Glück bei der"
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

	text "Ach, nein. Das war"
	line "leider"
	para "falsch. Versuch's"
	line "noch einmal!"
	done
GenericTrainerGruntM3:
	generictrainer GRUNTM, 3, EVENT_BEAT_ROCKET_GRUNTM_3, GruntM3SeenText, GruntM3BeatenText

	text "Du bist zu stark."
	para "Du könntest unsere"
	line "Pläne zerstören."
	cont "Ich muss die"
	cont "anderen warnen …"
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
	text "Guten Tag! Leider"
	line "bieten wir heute"
	cont "keine Führungen"
	cont "an."
	done






RadioTower1FLuckyNumberManAskToPlayText:
	text "Hallo! Bist du"
	line "wegen der"
	cont "GLÜCKS-ZAHLSHOW"
	cont "hier?"
	para "Soll ich die"
	line "ID-Nummern deiner"
	cont "#mon"
	cont "überprüfen?"
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
	text "Soll ich die"
	line "IDNummern deiner"
	cont "#mon prüfen?"
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
	text "Mal sehen, ob du"
	line "Glück hast."
	done






RadioTower1FLuckyNumberManDotDotDotText:
	text "… …"
	done






WonFirstPlaceText:
	text "Toll! Alle fünf"
	line "Ziffern stimmen"
	cont "überein!"

	para "Du gewinnst den"
	line "Hauptpreis!"

	para "Du gewinnst einen"
	line "MEISTERBALL!"
	done
WonSecondPlaceText:
	text "Hey! Du hast die"
	line "letzten vier"
	cont "Ziffern getroffen!"
	para "Du gewinnst den"
	line "zweiten Preis:"
	cont "einen KRONKORKEN!"
	done

WonThirdPlaceText:
	text "Hey! Du hast die"
	line "letzten drei"
	cont "Ziffern getroffen!"
	para "Du gewinnst den"
	line "dritten Preis:"
	cont "einen AP-Max!"
	done

WonFourthPlaceText:
	text "Ach, du hast die"
	line "letzten zwei"
	cont "Ziffern getroffen."
	para "Du gewinnst den"
	line "vierten Preis:"
	cont "einen AP-Plus!"
	done

WonFifthPlaceText:
	text "Ach, du hast die"
	line "letzte Ziffer"
	cont "getroffen."

	para "Du gewinnst den"
	line "fünften Preis:"
	cont "einen"
	cont "SONDERBONBON!"
	done


RadioTower1FLuckyNumberManNoRoomForYourPrizeText:
	text "Du kannst den"
	line "Preis nicht"
	cont "tragen."
	para "Schaffe Platz und"
	line "komm gleich wieder"
	cont "zurück."
	done






RadioTower1FRadioCardWomanOfferQuizText:
	text "Bei uns läuft"
	line "momentan ein"
	cont "besonderes Quiz."
	para "Beantworte die"
	line "fünf Fragen"
	cont "richtig, um ein"
	cont "RADIO-MODUL zu"
	cont "gewinnen."
	para "Stecke es in den"
	line "#COM, um"
	para "überall und zu"
	line "jeder Zeit Radio"
	cont "hören zu können."
	para "Möchtest du am"
	line "Quiz teilnehmen?"
	done






RadioTower1FRadioCardWomanQuestion1Text:
	text "Frage 1:"

	para "Gibt es #mon,"
	line "die nur am"
	cont "Vormittag"
	cont "erscheinen?"
	done






RadioTower1FRadioCardWomanQuestion2Text:
	text "Korrekt! Frage 2:"
	para "Ist diese Aussage"
	line "korrekt?"
	para "Du kannst BEEREN"
	line "nicht im"
	cont "Supermarkt"
	cont "erstehen."
	done






RadioTower1FRadioCardWomanQuestion3Text:
	text "Richtig! Frage 3:"
	para "Ist VM01 BLITZ?"
	done






RadioTower1FRadioCardWomanQuestion4Text:
	text "Nicht übel! Frage"
	line "4:"
	para "Ist FALK der"
	line "ARENALEITER von"
	para "VIOLA CITY, der"
	line "Vogel-#mon"
	cont "einsetzt?"
	done






RadioTower1FRadioCardWomanQuestion5Text:
	text "Wieder richtig!"
	line "Hier die letzte"
	cont "Frage:"
	para "Ist bei den"
	line "Einarmigen"
	cont "Banditen"
	para "in der SPIELHALLE"
	line "von DUKATIA CITY"
	para "ein GLUMANDA auf"
	line "einer Rolle"
	cont "abgebildet?"
	done






RadioTower1FRadioCardWomanYouWinText:
	text "Bingo! Richtig!"
	line "Glückwunsch!"
	para "Hier hast du"
	line "deinen Preis: ein"
	cont "RADIO-MODUL!"
	done






RadioTower1FPokegearIsARadioText:
	text "<PLAYER>s #COM"
	line "kann jetzt auch"
	cont "als Radio"
	cont "verwendet werden!"
	done






RadioTower1FRadioCardWomanTuneInText:
	text "Höre dir bitte"
	line "unsere Shows an!"
	done






RadioTower1FRadioCardWomanNotTakingQuizText:
	text "Oh. Ich verstehe."
	line "Komm wieder, wenn"
	cont "du deine Meinung"
	cont "geändert hast."
	done






RadioTower1FLassText:
	text "BEN ist ein"
	line "großartiger DJ."

	para "Seine sonore"
	line "Stimme lässt mich"
	cont "dahinschmelzen!"
	done






RadioTower1FYoungsterText:
	text "Ich liebe MARGIT"
	line "vom #mon-TALK."
	para "Ich kenne aber nur"
	line "ihre Stimme."
	done






GruntM3SeenText:
	text "Wir haben den"
	line "RADIOTURM"
	cont "übernommen!"
	para "Jetzt verkünden"
	line "wir der Welt die"
	cont "Rückkehr von TEAM"
	cont "ROCKET!"
	done






GruntM3BeatenText:
	text "Zu stark… Die"
	line "Übernahme…"
	cont "misslingt?"
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
	text "EG REZEPTION 1S"
	line "VERKAUF"
	para "2S PERSONAL 3S"
	line "PRODUKTION"
	para "4S BÜRO DES"
	line "INTENDANTEN"
	done






RadioTower1FLuckyChannelSignText:
	text "GLÜCKSKANAL!"
	para "Gewinne mit"
	line "#mon-IDNummern!"
	para "Tausche deine"
	line "#mon, um viele"
	cont "ID-Nummern zu"
	cont "erhalten!"
	done






