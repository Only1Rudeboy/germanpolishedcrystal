DEF BLUE_CARD_POINT_CAP EQU 30

RadioTower2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  0,  0, RADIO_TOWER_3F, 1
	warp_event 15,  0, RADIO_TOWER_1F, 3

	def_coord_events

	def_bg_events
	bg_event  3,  0, BGEVENT_JUMPTEXT, RadioTower2FSalesSignText
	bg_event  5,  0, BGEVENT_JUMPTEXT, RadioTower2FOaksPKMNTalkSignText
	bg_event 13,  0, BGEVENT_JUMPTEXT, RadioTower2FPokemonRadioSignText

	def_object_events
	object_event 14,  5, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Buena, -1
	object_event  6,  6, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, RadioTower2FSuperNerdText, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 17,  2, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower2FTeacherScript, -1
	object_event  1,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerGruntM4, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  7,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerGruntM5, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  4,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerGruntM6, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 10,  5, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerGruntF2, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  0,  1, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, RadioTower2FBlackBelt1Text, EVENT_RADIO_TOWER_BLACKBELT_BLOCKS_STAIRS
	object_event  1,  1, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, RadioTower2FBlackBelt2Text, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	pokemon_event 12,  1, JIGGLYPUFF, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_PINK, RadioTowerJigglypuffText, -1
	object_event 12,  7, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTowerBuenaPrizeReceptionist, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event  3,  6, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, RadioTower2FRockerText, EVENT_GOLDENROD_CITY_CIVILIANS

	object_const_def
	const RADIOTOWER2F_BUENA

RadioTower2FTeacherScript:
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue_jumptextfaceplayer RadioTower2FTeacherText_Rockets
	jumpthistextfaceplayer

	text "Schlaflieder im"
	line "Radio können #-"
	cont "MON einschläfern."
	done


GenericTrainerGruntM4:
	generictrainer GRUNTM, 4, EVENT_BEAT_ROCKET_GRUNTM_4, GruntM4SeenText, GruntM4BeatenText

	text "Wir lassen es"
	line "nicht zu, dass du"
	cont "unsere Pläne"
	cont "durchkreuzt!"
	done
GenericTrainerGruntM5:
	generictrainer GRUNTM, 5, EVENT_BEAT_ROCKET_GRUNTM_5, GruntM5SeenText, GruntM5BeatenText

	text "Wir sind nicht"
	line "immer böse. Wir"
	cont "tun nur, wonach"
	cont "uns ist."
	done
GenericTrainerGruntM6:
	generictrainer GRUNTM, 6, EVENT_BEAT_ROCKET_GRUNTM_6, GruntM6SeenText, GruntM6BeatenText

	text "Unsere VORSTÄNDE"
	line "wollen die Macht"
	cont "an sich reißen."

	para "Sie haben Großes"
	line "vor. Ich frage"
	cont "mich, was das"
	cont "wohl ist?"
	done
GenericTrainerGruntF2:
	generictrainer GRUNTF, 2, EVENT_BEAT_ROCKET_GRUNTF_2, GruntF2SeenText, GruntF2BeatenText

	text "Du hast mich"
	line "besiegt. Das"
	cont "werde"
	cont "ich nicht"
	cont "vergessen!"
	done
Buena:
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue_jumptextfaceplayer RadioTower2FBuenaPasswordIsHelpText
	faceplayer
	opentext
	checkevent EVENT_MET_BUENA
	iffalsefwd .Introduction
	checkflag ENGINE_BUENAS_PASSWORD_2
	iftruefwd .PlayedAlready
	readvar VAR_HOUR
	ifless EVE_HOUR, .TooEarly
	checkflag ENGINE_BUENAS_PASSWORD
	iffalsefwd .TuneIn
	checkkeyitem BLUE_CARD
	iffalsefwd .NoBlueCard
	readvar VAR_BLUECARDBALANCE
	ifequalfwd BLUE_CARD_POINT_CAP, .BlueCardCapped0
	playmusic MUSIC_BUENAS_PASSWORD
	writetext RadioTower2FBuenaDoYouKnowPasswordText
	special AskRememberPassword
	iffalsefwd .ForgotPassword
	writetext RadioTower2FBuenaJoinTheShowText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	readvar VAR_FACING
	ifnotequal RIGHT, .DontNeedToMove
	applymovement PLAYER, RadioTower2FPlayerWalksToMicrophoneMovement
.DontNeedToMove:
	turnobject PLAYER, RIGHT
	showtext RadioTower2FBuenaEveryoneSayPasswordText
	turnobject RADIOTOWER2F_BUENA, DOWN
	reanchormap
	special SpecialBuenasPassword
	closetext
	iffalsefwd .WrongAnswer
	showtext RadioTower2FBuenaCorrectAnswerText
	readvar VAR_BLUECARDBALANCE
	addval $1
	writevar VAR_BLUECARDBALANCE
	waitsfx
	playsound SFX_TRANSACTION
	setflag ENGINE_BUENAS_PASSWORD_2
	pause 20
	turnobject RADIOTOWER2F_BUENA, RIGHT
	showtext RadioTower2FBuenaThanksForComingText
	special Special_FadeOutMusic
	pause 20
	special RestartMapMusic
	readvar VAR_BLUECARDBALANCE
	ifequalfwd BLUE_CARD_POINT_CAP, .BlueCardCapped1
	end

.Introduction:
	writetext RadioTower2FBuenaShowIntroductionText
	promptbutton
	setevent EVENT_MET_BUENA
	verbosegivekeyitem BLUE_CARD
.TuneIn:
	writetext RadioTower2FBuenaTuneInToMyShowText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftruefwd .Registered0
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	iftruefwd .OfferedNumberBefore
.Registered0:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.ForgotPassword:
	writetext RadioTower2FBuenaComeBackAfterListeningText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	special Special_FadeOutMusic
	pause 20
	special RestartMapMusic
	end

.PlayedAlready:
	writetext RadioTower2FBuenaAlreadyPlayedText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftruefwd .Registered1
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	iftruefwd .OfferedNumberBefore
.Registered1:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	pause 10
	end

.WrongAnswer:
	setflag ENGINE_BUENAS_PASSWORD_2
	showtext RadioTower2FBuenaDidYouForgetText
	turnobject RADIOTOWER2F_BUENA, RIGHT
	pause 20
	showtext RadioTower2FBuenaThanksForComingText
	turnobject RADIOTOWER2F_BUENA, RIGHT
	special Special_FadeOutMusic
	pause 20
	special RestartMapMusic
	end

.NoBlueCard:
	writetext RadioTower2FBuenaNoBlueCardText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftruefwd .Registered2
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	iftruefwd .OfferedNumberBefore
.Registered2:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.BlueCardCapped0:
	writetext RadioTower2FBuenaCardIsFullText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftruefwd .Registered3
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	iftruefwd .OfferedNumberBefore
.Registered3:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.TooEarly:
	writetext RadioTower2FBuenaTuneInAfterSixText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftruefwd .Registered4
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	iftruefwd .OfferedNumberBefore
.Registered4:
	end

.BlueCardCapped1:
	checkcellnum PHONE_BUENA
	iftruefwd .HasNumber
	pause 20
	turnobject RADIOTOWER2F_BUENA, DOWN
	pause 15
	turnobject PLAYER, UP
	pause 15
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	iftruefwd .OfferedNumberBefore
	showemote EMOTE_SHOCK, RADIOTOWER2F_BUENA, 15
	setevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	setevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	opentext
	writetext RadioTower2FBuenaOfferPhoneNumberText
	sjumpfwd .AskForNumber

.OfferedNumberBefore:
	opentext
	writetext RadioTower2FBuenaOfferNumberAgainText
.AskForNumber:
	askforphonenumber PHONE_BUENA
	ifequalfwd $1, .PhoneFull
	ifequalfwd $2, .NumberDeclined
	writetext RadioTower2FRegisteredBuenasNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	promptbutton
	writetext RadioTower2FBuenaCallMeText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	addcellnum PHONE_BUENA
	end

.NumberDeclined:
	writetext RadioTower2FBuenaSadRejectedText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.PhoneFull:
	writetext RadioTower2FBuenaYourPhoneIsFullText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
.HasNumber:
	end

RadioTowerBuenaPrizeReceptionist:
	end




RadioTower2FPlayerWalksToMicrophoneMovement:
	slow_step_down
	slow_step_right
	step_end

RadioTower2FSuperNerdText:
	text "Du kannst überall"
	line "Radio hören."
	cont "Probier's mal"
	cont "aus!"
	done



RadioTower2FRockerText:
	text "Gleich kommt ein"
	line "Radio-Interview"

	para "für meinen neuen"
	line "Song."

	para "Vor großem"
	line "Publikum war"

	para "ich schon oft,"
	line "aber ich hab"

	para "echt Lampen-"
	line "fieber!"
	done

RadioTower2FTeacherText_Rockets:
	text "Warum möchten sie"
	line "den RADIOTURM"
	cont "besetzen?"
	done



RadioTowerJigglypuffText:
	text "PUMMELUFF:"
	line "Pummel…"
	done



RadioTower2FBlackBelt1Text:
	text "Zutritt nur für"
	line "autorisiertes"
	cont "Personal."

	para "Das war nicht"
	line "immer so."

	para "Mit unserem"
	line "INTENDANTEN"
	cont "stimmt"
	cont "irgendetwas"
	cont "nicht…"
	done



RadioTower2FBlackBelt2Text:
	text "Schau dich in"
	line "Ruhe um."

	para "Der INTENDANT ist"
	line "wieder nett. So,"
	cont "wie er früher"
	cont "war."
	done



GruntM4SeenText:
	text "Vor drei Jahren"
	line "war das TEAM"
	cont "ROCKET gezwungen,"
	cont "sich aufzulösen."

	para "Wir arbeiten hier"
	line "gerade an einem"
	cont "Comeback!"
	done



GruntM4BeatenText:
	text "Pah! Keine Zeit"
	line "für Sentimenta-"
	cont "litäten!"
	done



GruntM5SeenText:
	text "Wir sind TEAM"
	line "ROCKET, die #-"
	cont "MON-Ausbeuter!"

	para "Wir lieben es,"
	line "Böses zu tun! "
	cont "Hast du Angst?"
	done



GruntM5BeatenText:
	text "Du glaubst, du"
	line "bist ein Held?"
	done



GruntM6SeenText:
	text "Hey! Halte dich"
	line "aus unseren Ange-"
	cont "legenheiten raus!"
	done



GruntM6BeatenText:
	text "Uff. Ich gebe"
	line "auf."
	done



GruntF2SeenText:
	text "Hahaha!"

	para "Wie langweilig."
	line "Es war viel zu"

	para "leicht, hier das"
	line "Ruder zu"
	cont "übernehmen!"

	para "Komm schon!"
	line "Heitere mich auf!"
	done



GruntF2BeatenText:
	text "We-Wer bist du?"
	done



RadioTower2FBuenaShowIntroductionText:
	text "BUENA: Hallo! Ich"
	line "bin"
	line "BUENA!"

	para "Hast du schon von"
	line "der Radiosendung"
	cont "PASSWORT gehört?"

	para "Wenn du mir das"
	line "Passwort aus der"

	para "Sendung nennen"
	line "kannst, erhältst"
	cont "du Punkte."

	para "Sammle die Punkte"
	line "und tausche sie"

	para "bei diesem netten"
	line "Mädchen da drüben"

	para "gegen einen Preis"
	line "deiner Wahl ein!"

	para "Bitte schön!"

	para "Das ist deine ei-"
	line "gene Punktekarte!"
	done



RadioTower2FBuenaTuneInToMyShowText:
	text "BUENA: Höre dir"
	line "meine PASSWORT-"
	cont "SENDUNG an!"
	done



RadioTower2FBuenaDoYouKnowPasswordText:
	text "BUENA: Hallo!"
	line "Hast du meine"
	cont "Sen-"
	cont "dung gehört?"

	para "Kannst du dich an"
	line "das Passwort von"
	cont "heute erinnern?"
	done



RadioTower2FBuenaJoinTheShowText:
	text "BUENA: Oh, wow!"
	line "Danke!"

	para "Wie war dein Name"
	line "doch gleich?"

	para "…<PLAYER>, na!"

	para "Auf, <PLAYER>."
	line "Mach bei der"
	cont "Sendung mit!"
	done



RadioTower2FBuenaEveryoneSayPasswordText:
	text "BUENA: Alle"
	line "fertig?"

	para "Schreit das"
	line "heuti-"
	line "ge Passwort für"

	para "<PLAYER>"
	line "laut heraus!"
	done



RadioTower2FBuenaComeBackAfterListeningText:
	text "BUENA: Hör dir"
	line "die"
	line "Sendung an und"

	para "komme dann"
	line "wieder!"
	line "Bis später!"
	done



RadioTower2FBuenaAlreadyPlayedText:
	text "BUENA: Tut mir"
	line "leid…"

	para "Du hast pro Tag"
	line "nur einen"
	cont "Versuch."

	para "Probiere morgen"
	line "wieder dein"
	cont "Glück!"
	done



RadioTower2FBuenaCorrectAnswerText:
	text "BUENA: Juhuu!"
	line "Das ist richtig!"

	para "Du hast zugehört!"
	line "Ich bin"
	cont "glücklich!"

	para "Du hast dir einen"
	line "Punkt verdient!"
	done



RadioTower2FBuenaDidYouForgetText:
	text "BUENA: Argh…"
	line "Das ist falsch…"

	para "Hast du das Pass-"
	line "wort vergessen?"
	done



RadioTower2FBuenaThanksForComingText:
	text "BUENA: Jo!"
	line "<PLAYER>"

	para "hat teilgenommen."
	line "Danke dafür!"

	para "Ich hoffe, dass"
	line "alle Zuhörer auch"

	para "teilnehmen!"
	line "Ich warte!"
	done



RadioTower2FBuenaPasswordIsHelpText:
	text "BUENA: Huh? Das"
	line "heutige Passwort?"

	para "HILFE, natürlich!"
	done



RadioTower2FBuenaCardIsFullText:
	text "BUENA: Deine"
	line "BLAUE"
	line "KARTE ist voll."

	para "Hol dir einen"
	line "fan-"
	line "tastischen Preis!"
	done



RadioTower2FBuenaTuneInAfterSixText:
	text "BUENA: Hört die"
	line "PASSWORTSENDUNG"

	para "täglich von sechs"
	line "bis Mitternacht!"

	para "Hört zu und"
	line "besucht mich"
	cont "dann!"
	done



RadioTower2FBuenaNoBlueCardText:
	text "BUENA: Oh? Du"
	line "hast"
	line "deine BLAUE KARTE"
	cont "vergessen?"

	para "Ich kann dir"
	line "keine"
	line "Punkte geben,"
	cont "wenn"
	cont "du sie nicht"
	cont "hast."
	done



RadioTower2FBuenaOfferPhoneNumberText:
	text "BUENA: Oh! Du"
	line "hast"
	line "{d:BLUE_CARD_POINT_CAP}"
	cont "Punkte auf"
	cont "deiner BLAUEN"
	cont "KARTE!"
	cont "Das ist toll!"

	para "Hmm… Es gibt zwar"
	line "keinen Preis für"
	cont "das Erreichen von"
	cont "{d:BLUE_CARD_POINT_CAP}"
	cont "Punkten, aber…"

	para "Du hast mich so"
	line "oft besucht,"

	para "<PLAYER>. Ich"
	line "mache dir ein"
	cont "spe-"
	cont "zielles Angebot!"

	para "Möchtest du meine"
	line "Telefonnummer?"
	done



RadioTower2FBuenaOfferNumberAgainText:
	text "BUENA: <PLAYER>,"
	line "möchtest du meine"

	para "Telefonnummer"
	line "haben?"
	done



RadioTower2FRegisteredBuenasNumberText:
	text "<PLAYER>"
	line "speichert"
	line "BUENAs Nummer."
	done



RadioTower2FBuenaCallMeText:
	text "BUENA: Ich freue"
	line "mich auf deinen"
	cont "Anruf!"
	done



RadioTower2FBuenaSadRejectedText:
	text "BUENA: Argh… Ein"
	line "Spezialpreis…"
	done



RadioTower2FBuenaYourPhoneIsFullText:
	text "BUENA: <PLAYER>,"
	line "In deinem"
	cont "Nummern-"
	cont "speicher ist kein"
	cont "Platz für mich…"
	done



RadioTower2FBuenaReceptionistNoCardText:
	text "Ohne deine BLAUE"
	line "KARTE kannst du"
	cont "keine Punkte"
	cont "eintauschen."

	para "Vergiss deine"
	line "BLAUE KARTE"
	cont "nicht!"
	done



RadioTower2FSalesSignText:
	text "1S VERKAUF"
	done



RadioTower2FOaksPKMNTalkSignText:
	text "PROF. EICHs #-"
	line "MON-TALK"

	para "Die beste Show"
	line "am Äther!"
	done



RadioTower2FPokemonRadioSignText:
	text "Überall,"
	line "jederzeit"
	line "#mon Radio"
	done



