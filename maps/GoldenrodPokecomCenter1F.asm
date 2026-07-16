GoldenrodPokecomCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, JudgeMachineScreenCallback

	def_warp_events
	warp_event  6, 15, GOLDENROD_CITY, 15
	warp_event  7, 15, GOLDENROD_CITY, 15
	warp_event  1,  6, GOLDENROD_POKECOM_CENTER_OFFICE, 2
	warp_event  0, 15, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 11,  7, BGEVENT_READ, PokemonJournalWhitneyScript
	bg_event 24,  5, BGEVENT_RIGHT, JudgeMachineScript
	bg_event 24,  6, BGEVENT_RIGHT, JudgeMachineScript
	bg_event 24,  7, BGEVENT_RIGHT, JudgeMachineScript
	bg_event 24,  8, BGEVENT_RIGHT, JudgeMachineScript
	bg_event 24,  9, BGEVENT_RIGHT, JudgeMachineScript
	bg_event 24, 10, BGEVENT_RIGHT, JudgeMachineScript
	bg_event 25, 11, BGEVENT_UP, JudgeMachineScript
	bg_event 26, 11, BGEVENT_UP, JudgeMachineScript
	bg_event 27, 11, BGEVENT_UP, JudgeMachineScript
	bg_event 28, 11, BGEVENT_UP, JudgeMachineScript
	bg_event 29,  5, BGEVENT_LEFT, JudgeMachineScript
	bg_event 29,  6, BGEVENT_LEFT, JudgeMachineScript
	bg_event 29,  7, BGEVENT_LEFT, JudgeMachineScript
	bg_event 29,  8, BGEVENT_LEFT, JudgeMachineScript
	bg_event 29,  9, BGEVENT_LEFT, JudgeMachineScript
	bg_event 29, 10, BGEVENT_LEFT, JudgeMachineScript
	bg_event 24,  3, BGEVENT_ITEM + RARE_CANDY, EVENT_GOLDENROD_POKECOM_CENTER_1F_HIDDEN_RARE_CANDY

	def_object_events
	object_event 23, 10, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, JudgeMachineEngineerScript, EVENT_JUDGE_MACHINE_ENGINEER
	object_event  7,  7, SPRITE_BOWING_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FNurseScript, -1
	object_event  0, 12, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodPokecenter1FGameboyKidText, -1
	object_event  3, 11, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodPokecenter1FLassText, -1
	object_event 12, 14, SPRITE_MATRON, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FPokefanF, -1
	object_event 16,  8, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_TEAL, OBJECTTYPE_SCRIPT, 0, WonderTradeReceptionistScript, -1
	object_event  8, 13, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodPokecenter1FSuperNerdText, -1
	object_event 27, 13, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodPokecenter1FPokefanFText_Sunflora, -1
	object_event 21,  6, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodPokecenter1FRockerText, -1
	object_event 18, 13, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodPokecenter1FGrampsText, -1
	object_event 18,  9, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodPokecenter1FLassText_PidgeyMail, -1
	object_event  3,  9, SPRITE_BOULDER_ROCK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_POKECOM_SIGN, OBJECTTYPE_SCRIPT, 0, InfoSignScript, -1
	object_event 23,  3, SPRITE_FLOATING_BALL, SPRITEMOVEDATA_POKECOM_NEWS, 0, 0, -1, PAL_NPC_POKECOM_SIGN, OBJECTTYPE_COMMAND, end, NULL, -1

	object_const_def
	const GOLDENRODPOKECOMCENTER1F_ENGINEER

JudgeMachineScreenCallback:
	checkflag ENGINE_JUDGE_MACHINE
	iffalsefwd .Done
	changeblock 24, 0, $49
	changeblock 26, 0, $4a
	changeblock 28, 0, $4b
	changeblock 24, 2, $4c
	changeblock 26, 2, $4d
	changeblock 28, 2, $4e
.Done
	endcallback

GoldenrodPokecenter1FNurseScript:
	setevent EVENT_WELCOMING_TO_POKECOM_CENTER
	jumpstd pokecenternurse

GoldenrodPokecenter1FGameboyKidText:
	text "Im Kolosseum oben"
	line "gibt es"
	cont "Link-Kämpfe."

	para "Die Ergebnisse"
	line "hängen an der"

	para "Wand. Ich kann mir"
	line "keinen Verlust"
	cont "leisten."
	done

GoldenrodPokecenter1FLassText:
	text "Ein starkes"
	line "#MON muss nicht"
	cont "zwingend gewinnen."
	para "Meist entscheidet"
	line "der Vor- oder"
	cont "Nachteil des Typs."
	para "Ich glaube nicht,"
	line "dass es ein"
	cont "#MON gibt, das"
	cont "allen anderen"
	cont "überlegen ist."
	done
GoldenrodPokecenter1FPokefanF:
	checkevent EVENT_GOT_EVIOLITE_IN_GOLDENROD
	iftrue_jumptextfaceplayer GoldenrodPokecenter1FPokefanFGotEvioliteText
	faceplayer
	opentext
	writetext GoldenrodPokecenter1FPokefanFDoYouHaveEonMailText
	waitbutton
	checkitem EON_MAIL
	iffalse_jumpopenedtext GoldenrodPokecenter1FPokefanFTooBadText
	writetext GoldenrodPokecenter1FAskGiveAwayAnEonMailText
	yesorno
	iffalse_jumpopenedtext GoldenrodPokecenter1FPokefanFTooBadText
	takeitem EON_MAIL
	writetext GoldenrodPokecenter1FPlayerGaveAwayTheEonMailText
	waitbutton
	writetext GoldenrodPokecenter1FPokefanFThisIsForYouText
	waitbutton
	verbosegiveitem EVIOLITE
	iffalsefwd .NoRoomForEviolite
	setevent EVENT_GOT_EVIOLITE_IN_GOLDENROD
	jumpthisopenedtext

	text "Meine Tochter wird"
	line "entzückt sein!"
	done
.NoRoomForEviolite:
	giveitem EON_MAIL
	jumpthisopenedtext

	text "Oh… Ein anderes"
	line "Mal vielleicht."
	done
GoldenrodPokecenter1FPokefanFDoYouHaveEonMailText:
	text "Ach je, deine"
	line "Tasche ist so"
	cont "schwer!"

	para "Oh! Hast du"
	line "zufällig etwas"
	cont "namens"
	cont "ANARA-BRIEF?"

	para "Meine Tochter"
	line "möchte unbedingt"
	cont "einen haben."

	para "Du kannst einen"
	line "hergeben, oder?"
	done

GoldenrodPokecenter1FAskGiveAwayAnEonMailText:
	text "ANARA-BRIEF"
	line "weggeben?"
	done
GoldenrodPokecenter1FPokefanFThisIsForYouText:
	text "Ach, großartig!"
	line "Danke, Schatz!"

	para "Hier, als"
	line "Ausgleich sollst"
	cont "du das haben!"
	done
GoldenrodPokecenter1FPokefanFTooBadText:
	text "Oh? Du hast"
	line "keinen? Schade."
	done
GoldenrodPokecenter1FPlayerGaveAwayTheEonMailText:
	text "<PLAYER> gibt den"
	line "ANARA-BRIEF weg."
	done
GoldenrodPokecenter1FPokefanFGotEvioliteText:
	text "Danke für den"
	line "ANARA-BRIEF!"
	para "Meine Tochter wird"
	line "entzückt sein!"
	done

WonderTradeReceptionistScript:
	opentext
	writetext WonderTradeIntroText
	waitbutton
	checkevent EVENT_INTRODUCED_TEALA
	iftruefwd .introduced
	writetext IntroduceTealaText
	waitbutton
	setevent EVENT_INTRODUCED_TEALA
.introduced
	writetext WonderTradeExplanationText
	promptbutton
	special WonderTrade
	iffalsefwd .done
	playmusic MUSIC_POKECOM_CENTER
	writetext WonderTradeCompleteText
	playsound SFX_DEX_FANFARE_80_109
	waitsfx
	ifnotequal 2, .done
	setevent EVENT_GOT_GS_BALL_FROM_POKECOM_CENTER
	setevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	playmusic MUSIC_SPIKY_EARED_PICHU_HGSS
	writetext WonderTradeForGSBallPichuText
	promptbutton
	verbosegivekeyitem GS_BALL
	writetext WonderTradeForGSBallPichuText2
	waitbutton
.done
	jumpthisopenedtext

	text "Beehre uns bald"
	line "wieder."
	done
WonderTradeIntroText:
	text "Hallo! Willkommen"
	line "im #COM CENTER"
	cont "Wunder-Tausch."
	done

IntroduceTealaText:
	text "Ich bin TEALA,"
	line "deine Tauschbe-"
	cont "gleiterin."
	done

WonderTradeExplanationText:
	text "Du kannst #MON"
	line "mit fernen"
	cont "Trainern tauschen."
	done

WonderTradeCompleteText:
	text "Das ist dein neuer"
	line "Partner."
	para "Bitte passe gut"
	line "auf ihn auf."
	done


WonderTradeForGSBallPichuText:
	text "… Aber was ist"
	line "das? Stimmt etwas"
	cont "nicht mit"
	para "der Wunder-Tausch-"
	line "Maschine?"
	para "Es sieht so aus,"
	line "als hättest du"
	para "gerade ein #MON"
	line "mit dir selbst"
	cont "getauscht."
	para "Das kann nicht"
	line "sein … Du kannst"
	para "nicht an zwei"
	line "Orten gleichzeitig"
	cont "sein."
	para "Außerdem"
	line "kommuniziert die"
	cont "Maschine durch den"
	para "Raum, nicht durch"
	line "die Zeit …"
	para "Und was ist das"
	line "für ein seltsamer"
	cont "Ball, den es"
	para "trägt? Ist das ein"
	line "Aprikoko-Ball?"
	para "Hier, schau mal …"
	done

WonderTradeForGSBallPichuText2:
	text "Es mag"
	line "ungewöhnlich sein,"
	cont "aber ein #MON"
	cont "ist ein #MON."
	para "Bitte pass gut auf"
	line "es auf."
	done

InfoSignScript:
	jumpthistext

	text "#COM CENTER 1F"
	line "Informationen"
	para "Links: Verwaltung"
	para "Mitte:"
	line "Wunder-Tausch"
	para "Rechts:"
	line "<PK><MN>-Richter"
	done

PokemonJournalWhitneyScript:
	setflag ENGINE_READ_WHITNEY_JOURNAL
	jumpthistext

	text "#MON Journal"
	para "Spezial:"
	line "ARENALEITERIN"
	cont "BIANKA!"
	para "Man sagt, BIANKA"
	line "bewundere BRUNO"
	cont "der TOP VIER."
	done

JudgeMachineScript:
	opentext
	special JudgeMachine
	waitendtext

GoldenrodPokecenter1FSuperNerdText:
	text "Wow, dieses"
	line "#MON CENTER ist"
	cont "riesig."
	para "Es wurde gerade"
	line "gebaut. Sie"
	para "haben auch viele"
	line "neue Maschinen"
	cont "installiert."
	done

GoldenrodPokecenter1FLassText_PidgeyMail:
	text "Mir ist was Tolles"
	line "für den"
	cont "Wunder-Tausch"
	cont "eingefallen!"
	para "Ich lasse einen"
	line "Taubsi einen Brief"
	para "tragen und tausche"
	line "es gegen ein"
	cont "anderes!"
	para "Wenn das alle"
	line "machten, könnten"
	para "Briefe mit vielen"
	line "Menschen getauscht"
	cont "werden!"
	para "Ich nenne es"
	line "Taubsi-Brief!"
	para "Wird es populär,"
	line "finde ich"
	cont "vielleicht neue"
	cont "Freunde!"
	done

JudgeMachineEngineerScript:
	checkevent EVENT_BRED_AN_EGG
	iffalsefwd .NotBredYet
	showtextfaceplayer JudgeMachineEngineerFinishedText
	readvar VAR_FACING
	ifnotequal RIGHT, .GoLeft
	applyonemovement GOLDENRODPOKECOMCENTER1F_ENGINEER, step_down
	applyonemovement GOLDENRODPOKECOMCENTER1F_ENGINEER, step_left
.GoLeft
	applymovement GOLDENRODPOKECOMCENTER1F_ENGINEER, JudgeMachineEngineerLeavesMovement
	disappear GOLDENRODPOKECOMCENTER1F_ENGINEER
	setflag ENGINE_JUDGE_MACHINE
	changeblock 24, 0, $49
	changeblock 26, 0, $4a
	changeblock 28, 0, $4b
	changeblock 24, 2, $4c
	changeblock 26, 2, $4d
	changeblock 28, 2, $4e
	end

.NotBredYet:
	showtextfaceplayer JudgeMachineEngineerWorkingText
	turnobject LAST_TALKED, RIGHT
	end

JudgeMachineEngineerWorkingText:
	text "Die"
	line "#MON-Richter-"
	cont "Maschine…"
	para "Das ist mein Traum"
	line "seit langem."
	para "Mit dem Geld des"
	line "#COM CENTERs"
	para "kann er"
	line "Wirklichkeit"
	cont "werden,"
	para "auch wenn der"
	line "Computer so groß"
	cont "ist wie ein"
	cont "Zimmer!"
	para "Denk nur, wie"
	line "nützlich das für"
	cont "Züchter ist, die"
	para "viele Eier"
	line "ausbrüten!"
	para "Ich bin fast"
	line "fertig…"
	done

JudgeMachineEngineerFinishedText:
	text "Die"
	line "#MON-Richter-"
	cont "Maschine…"
	para "Sie ist fertig!"
	line "Mein Traum wurde"
	cont "Wirklichkeit!"
	para "Was ist das? Eine"
	line "Maschine, die"
	para "die Werte jedes"
	line "#MON bewertet!"
	para "Sie nutzt moderne"
	line "Technik, um das"
	para "angeborene"
	line "Potenzial und den"
	para "Einsatz eines"
	line "#MON zu messen."
	para "Die perfekte Art,"
	line "die Kraft eines"
	cont "#MON zu prüfen!"
	para "Probiere sie aus."
	line "Sie ist absolut"
	cont "sicher."
	para "Ich mache erst mal"
	line "Urlaub!"
	done

JudgeMachineEngineerLeavesMovement:
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

GoldenrodPokecenter1FPokefanFText_Sunflora:
	text "Ein Mädchen, das"
	line "ich nicht kenne,"
	cont "schickte mir ihr"
	cont "SONNFLORA."
	para "Du solltest ein"
	line "#MON tauschen,"
	cont "das du willst."
	done

GoldenrodPokecenter1FRockerText:
	text "Die Maschinen hier"
	line "sind noch nicht"
	cont "alle nutzbar."
	para "Trotzdem ist es"
	line "schön, vor allen"
	para "anderen an einen"
	line "trendigen Ort zu"
	cont "kommen."
	done

GoldenrodPokecenter1FGrampsText:
	text "Schon alle diese"
	line "neuen Sachen"

	para "lassen mich jung"
	line "fühlen!"
	done
