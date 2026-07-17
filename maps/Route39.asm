Route39_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2, 19, ROUTE_39_BARN, 1
	warp_event  7, 19, ROUTE_39_FARMHOUSE, 1
	warp_event  9,  5, ROUTE_39_RUGGED_ROAD_GATE, 3
	warp_event  3, 19, ROUTE_39_BARN, 2

	def_coord_events

	def_bg_events
	bg_event  5, 47, BGEVENT_JUMPTEXT, Route39TrainerTipsText
	bg_event  8, 21, BGEVENT_JUMPTEXT, MoomooFarmSignText
	bg_event 11,  7, BGEVENT_JUMPTEXT, RuggedRoadAheadSignText
	bg_event 15, 23, BGEVENT_JUMPTEXT, Route39SignText
	bg_event  8,  9, BGEVENT_JUMPTEXT, Route39AdvancedTips1Text
	bg_event 10, 47, BGEVENT_JUMPTEXT, Route39AdvancedTips2Text
	bg_event  5, 29, BGEVENT_ITEM + NUGGET, EVENT_ROUTE_39_HIDDEN_NUGGET

	def_object_events
	object_event  7, 30, SPRITE_COWGIRL, SPRITEMOVEDATA_WANDER, 1, 2, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39CowgirlAnnieScript, -1
	object_event 13, 45, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerSailorEugene, -1
	object_event 10, 38, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerPokefanmDerek1, -1
	object_event 11, 35, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerPokefanfRuth, -1
	pokemon_event  3, 28, MILTANK, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_PINK, Route39MiltankText, -1
	pokemon_event  6, 27, MILTANK, SPRITEMOVEDATA_POKEMON, (1 << MORN) | (1 << DAY), PAL_MON_PINK, Route39MiltankText, -1
	pokemon_event  4, 31, MILTANK, SPRITEMOVEDATA_POKEMON, (1 << MORN) | (1 << DAY), PAL_MON_AZURE, Route39MiltankText, -1
	pokemon_event  8, 29, MILTANK, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_PINK, Route39MiltankText, -1
	object_event 13, 23, SPRITE_PSYCHIC, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerPsychicNorman, -1
	fruittree_event  9, 26, FRUITTREE_ROUTE_39, CHESTO_BERRY, PAL_NPC_PURPLE
	object_event  4, 38, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_DARK_PURPLE, OBJECTTYPE_SCRIPT, 0, TrainerPokefanfJaime, -1
	object_event  4, 46, SPRITE_BEAUTY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route39BeautyText, -1
	object_event 15, 12, SPRITE_HIKER, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route39HikerText, -1
	object_event 25, 24, SPRITE_BEAUTY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBeautyOlivia, -1
	tmhmball_event  1, 23, TM_BULLDOZE, EVENT_ROUTE_39_TM_BULLDOZE
	smashrock_event 12, 10
	smashrock_event 15,  8

	object_const_def
	const ROUTE39_COWGIRL

TrainerPokefanmDerek1:
	trainer POKEFANM, DEREK1, EVENT_BEAT_POKEFANM_DEREK, PokefanmDerek1SeenText, PokefanmDerek1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_POKEFANM_DEREK
	opentext
	checkflag ENGINE_DEREK_HAS_NUGGET
	iftruefwd .HasNugget
	checkcellnum PHONE_POKEFANM_DEREK
	iftruefwd .NumberAccepted
	checkpoke PIKACHU
	iffalsefwd .WantsPikachu
	checkevent EVENT_DEREK_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskedAlready
	writetext PokefanMDerekText_NotBragging
	promptbutton
	setevent EVENT_DEREK_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjumpfwd .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_POKEFANM_DEREK
	ifequalfwd $1, .PhoneFull
	ifequalfwd $2, .NumberDeclined
	gettrainername POKEFANM, DEREK1, STRING_BUFFER_3
	scall .RegisteredNumber
	sjumpfwd .NumberAccepted

.HasNugget:
	scall .Gift
	verbosegiveitem NUGGET
	iffalsefwd .NoRoom
	clearflag ENGINE_DEREK_HAS_NUGGET
	sjumpfwd .NumberAccepted

.NoRoom:
	sjumpfwd .PackFull

.WantsPikachu:
	jumpthisopenedtext

	; GSC-DE Dump
	text "PIKACHU muss sein!"
	line "Was meinst du?"
	done

.AskNumber1:
	jumpstd asknumber1m

.AskNumber2:
	jumpstd asknumber2m

.RegisteredNumber:
	jumpstd registerednumberm

.NumberAccepted:
	jumpstd numberacceptedm

.NumberDeclined:
	jumpstd numberdeclinedm

.PhoneFull:
	jumpstd phonefullm

.Gift:
	jumpstd giftm

.PackFull:
	jumpstd packfullm

GenericTrainerPokefanfRuth:
	generictrainer POKEFANF, RUTH, EVENT_BEAT_POKEFANF_RUTH, PokefanfRuthSeenText, PokefanfRuthBeatenText

	; GSC-DE Dump
	text "Weißt du über"
	line "Baby-#MON"
	cont "Bescheid?"

	para "Die sind bestimmt"
	line "super-süß!"
	done

Route39CowgirlAnnieScript:
	checkevent EVENT_GOT_PP_MAX_FROM_ROUTE_39_LEADER
	iftrue_jumptextfaceplayer .AfterText2
	faceplayer
	checkevent EVENT_BEAT_COWGIRL_ANNIE
	iftruefwd .Beaten
	checkevent EVENT_BEAT_BIRD_KEEPER_TOBY
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_SAILOR_HARRY
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_LASS_DANA
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_SCHOOLBOY_CHAD
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_BEAUTY_VALENCIA
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_BEAUTY_OLIVIA
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_POKEFANM_DEREK
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_POKEFANF_RUTH
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_SAILOR_EUGENE
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_PSYCHIC_NORMAN
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_POKEFANF_JAIME
	iffalse_jumptext .IntroText
	opentext
	writetext .QuestionText
	yesorno
	iffalse_jumpopenedtext .RefusedText
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked ROUTE39_COWGIRL
	loadtrainer COWGIRL, ANNIE
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_COWGIRL_ANNIE
.Beaten:
	opentext
	writetext .AfterText1
	promptbutton
	verbosegiveitem PP_MAX
	iffalse_endtext
	setevent EVENT_GOT_PP_MAX_FROM_ROUTE_39_LEADER
	jumpthisopenedtext

.AfterText2:
	; PC-only
	text "Wir machen Käse"
	line "und Joghurt aus"
	cont "MILTANK-Milch."
	done

.IntroText:
	; PC-only
	text "Hey! Erschreck die"
	line "MILTANK nicht!"

	para "… Ach, du willst"
	line "kämpfen?"

	para "Ich arbeite gerade"
	line "auf dem Hof …"

	para "Pass auf: Besieg"
	line "alle anderen von"
	cont "TEAK CITY bis"
	cont "OLIVIANA CITY,"

	para "dann kämpfe ich"
	line "gegen dich."

	para "Manche wollen nur"
	line "nachts kämpfen."
	done

.QuestionText:
	; PC-only
	text "Ich bin mit meinen"
	line "Pflichten fertig,"

	para "und du hast diese"
	line "Routen geräumt."

	para "Mein Team hat JENS"
	line "besiegt,"

	para "und ich glaube,"
	line "wir schaffen es"
	cont "auch gegen dich."

	para "Was meinst du?"
	done

.RefusedText:
	; PC-only
	text "Schade. Dann"
	line "kümmere ich mich"
	cont "wieder um die"
	cont "MILTANK."
	done

.SeenText:
	; PC-only
	text "Ich zeig dir, was"
	line "eine Cowgirl kann!"
	done

.BeatenText:
	; PC-only
	text "Ich hab Milch"
	line "verschüttet…"
	done

.AfterText1:
	; PC-only
	text "Puh! Das war eine"
	line "heftige Pause!"

	para "Danke für den"
	line "Spaß, Partner."

	para "Nimm das mit!"
	done

GenericTrainerSailorEugene:
	generictrainer SAILOR, EUGENE, EVENT_BEAT_SAILOR_EUGENE, SailorEugeneSeenText, SailorEugeneBeatenText

	; GSC-DE Dump
	text "Meine #MON"
	line "wurden eingefangen"
	cont "und sind im Aus-"
	cont "land aufgezogen"
	cont "worden."

	para "Sie begleiten mich"
	line "auf meinen langen"
	cont "Reisen."
	done

GenericTrainerPsychicNorman:
	generictrainer PSYCHIC_T, NORMAN, EVENT_BEAT_PSYCHIC_NORMAN, PsychicNormanSeenText, PsychicNormanBeatenText

	; GSC-DE Dump
	text "Du weißt von den"
	line "unterschiedlichen"
	cont "#MON-Fähig-"
	cont "keiten?"

	para "Bei den Menschen"
	line "ist das ganz"
	cont "ähnlich. Jeder hat"
	cont "unterschiedliche"
	cont "Talente."
	done

TrainerPokefanfJaime:
	faceplayer
	opentext
	checktime 1 << NITE
	iffalsefwd .NotNight
	checkevent EVENT_BEAT_POKEFANF_JAIME
	iftruefwd .Beaten
	writetext PokefanfJaimeSeenText
	waitbutton
	closetext
	winlosstext PokefanfJaimeBeatenText, 0
	loadtrainerwithpal POKEFANF, JAIME, TRAINERPAL_DARK_POKEFANF
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_POKEFANF_JAIME
	endtext

.Beaten:
	jumpthisopenedtext

	; GSC-DE Dump
	text "Ich traf MAUZI"
	line "NACHTs, genau hier"
	cont "auf ROUTE 39."

	para "Ich weiß nicht"
	line "warum, aber es"

	para "scheint es zu"
	line "mögen, wenn ich"
	cont "hier trainiere."

	para "Es scheint mich"
	line "durch das Training"

	para "hier mehr zu"
	line "mögen, als wenn"

	para "ich woanders"
	line "trainiere."
	done

.NotNight:
	jumpthisopenedtext

	; GSC-DE Dump
	text "Ufu… Ich hoffe, es"
	line "wird bald dunkel."
	done

Route39MiltankText:
	; GSC-DE Dump
	text "MILTANK: Muh!"
	done







SailorEugeneSeenText:
	; GSC-DE Dump
	text "Ich bin gerade"
	line "wieder in OLIVIANA"
	cont "angekommen."

	para "Wie steht es nun"
	line "mit dem #MON-"
	cont "Kampf?"
	done





SailorEugeneBeatenText:
	; GSC-DE Dump
	text "Aah!"
	done






PokefanmDerek1SeenText:
	; GSC-DE Dump
	text "Genau der richtige"
	line "Moment, um mit"
	cont "PIKACHU anzugeben!"
	done

PokefanmDerek1BeatenText:
	; GSC-DE Dump
	text "Ich hatte keine"
	line "Zeit, mit PIKACHU"
	cont "zu prahlen…"
	done

PokefanMDerekText_NotBragging:
	; GSC-DE Dump
	text "Ich höre mir deine"
	line "Prahlerei gar"
	cont "nicht an!"

	para "Wir #MON-FANS"
	line "haben ein Gelübde,"

	para "das uns verbietet,"
	line "Leuten beim"
	cont "Prahlen zuzuhören!"
	done







PokefanfRuthSeenText:
	; GSC-DE Dump
	text "Was für süße"
	line "#MON!"

	para "Zeigen wir uns"
	line "gegenseitig unsere"
	cont "#MON, und zwar"
	cont "gleichzeitig!"
	done






PokefanfRuthBeatenText:
	; GSC-DE Dump
	text "Mir macht es"
	line "nichts aus,"
	cont "zu verlieren."
	done






PsychicNormanSeenText:
	; GSC-DE Dump
	text "Zeig doch mal, was"
	line "deine #MON"
	cont "drauf haben."
	done







PsychicNormanBeatenText:
	; GSC-DE Dump
	text "He, deine #MON"
	line "sind sehr fähig!"
	done







PokefanfJaimeSeenText:
	; GSC-DE Dump
	text "Du kommst gerade"
	line "recht."

	para "Auf in den Kampf."
	done





PokefanfJaimeBeatenText:
	; GSC-DE Dump
	text "Oh, wie"
	line "ernüchternd…"
	done






Route39BeautyText:
	; PC-only
	text "Was ist höher: der"
	line "ZINNTURM in"
	cont "TEAK CITY,"

	para "oder der"
	line "LEUCHTTURM in"
	cont "OLIVIANA CITY?"

	para "Der ZINNTURM,"
	line "ohne Zweifel!"
	done

Route39HikerText:
	; PC-only
	text "Nördlich von"
	line "OLIVIANA CITY"
	cont "liegt Johtos"
	cont "Grenze!"

	para "Ein harter Marsch"
	line "durch raues"
	cont "Gelände, dann"

	para "einen eisigen Berg"
	line "erklimmen …"

	para "Ich hab gehört,"
	line "manche #MON"

	para "haben sich an das"
	line "raue Klima"
	cont "angepasst."

	para "Aber ohne"
	line "Suchbrille zur"
	cont "Sicherheit"

	para "kann ich die"
	line "Wanderung nicht"
	cont "mal anfangen …"
	done

Route39SignText:
	; GSC-DE Dump
	text "ROUTE 39"

	para "OLIVIANA CITY -"
	line "TEAK CITY"
	done







Route39AdvancedTips1Text:
	; PC-only
	text "PROFI-TIPPS!"

	para "Sandstürme erhöhen"
	line "die Spezial-Vert."
	cont "von Stein-#MON!"

	para "Und Hagel erhöht"
	line "die Verteidigung"
	cont "von Eis-#MON!"
	done

Route39AdvancedTips2Text:
	; PC-only
	text "PROFI-TIPPS!"

	para "Ein #MON mit"
	line "Facettenauge"

	para "oder einem"
	line "Münzamulett trifft"

	para "eher auf wilde"
	line "#MON mit Item!"
	done

RuggedRoadAheadSignText:
	; PC-only
	text "Holprige Straße"
	line "voraus"

	para "Norden zum"
	line "Schneegipfel"
	done

MoomooFarmSignText:
	; GSC-DE Dump
	text "KUHMUH-FARM"

	para "Unsere Bekömmliche"
	line "Milch Ist Sehr"
	cont "Erfrischend"
	done







Route39TrainerTipsText:
	; GSC-DE Dump
	text "TIPPS für TRAINER"
	line "Benutze KOPFNUSS,"

	para "um #MON"
	line "aus den Bäumen"
	cont "zu schütteln."

	para "Auf den Bäumen"
	line "leben verschiedene"
	cont "Arten von #MON."

	para "Benutze KOPFNUSS"
	line "an jedem Baum, den"
	cont "du siehst!"
	done






