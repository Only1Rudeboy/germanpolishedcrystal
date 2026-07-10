CeladonGym_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4, 17, CELADON_CITY, 8
	warp_event  5, 17, CELADON_CITY, 8

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, CeladonGymStatue
	bg_event  6, 15, BGEVENT_READ, CeladonGymStatue

	def_object_events
	object_event  5,  3, SPRITE_ERIKA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonGymErikaScript, -1
	object_event  7,  8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerLassMichelle, -1
	object_event  2,  8, SPRITE_PICNICKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerPicnickerTanya, -1
	object_event  3,  5, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerBeautyJulia, -1
	object_event  6,  5, SPRITE_AROMA_LADY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerAroma_ladyDahlia, -1
	object_event  4, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerTwinsJoandzoe1, -1
	object_event  5, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerTwinsJoandzoe2, -1

CeladonGymErikaScript:
	faceplayer
	opentext
	checkflag ENGINE_RAINBOWBADGE
	iftruefwd .FightDone
	writetext ErikaBeforeBattleText
	waitbutton
	closetext
	winlosstext ErikaBeatenText, 0
	loadtrainer ERIKA, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ERIKA
	setevent EVENT_BEAT_LASS_MICHELLE
	setevent EVENT_BEAT_PICNICKER_TANYA
	setevent EVENT_BEAT_BEAUTY_JULIA
	setevent EVENT_BEAT_AROMA_LADY_DAHLIA
	setevent EVENT_BEAT_TWINS_JO_AND_ZOE
	opentext
	givebadge RAINBOWBADGE, KANTO_REGION
	callstd kantopostgymevents
.FightDone:
	checkevent EVENT_GOT_TM19_GIGA_DRAIN
	iftrue_jumpopenedtext ErikaAfterBattleText
	writetext ErikaExplainTMText
	promptbutton
	verbosegivetmhm TM_GIGA_DRAIN
	setevent EVENT_GOT_TM19_GIGA_DRAIN
	jumpthisopenedtext

	text "Es ist Kraftsauger"

	para "Es ist eine tolle"
	line "Attacke, die die"
	cont "Hälfte des"

	para "Schadens nutzt, um"
	line "dein #mon zu"
	cont "heilen."

	para "Nutze sie, wenn"
	line "es dir gefällt…"
	done

GenericTrainerLassMichelle:
	generictrainer LASS, MICHELLE, EVENT_BEAT_LASS_MICHELLE, LassMichelleSeenText, LassMichelleBeatenText

	text "Ich war einfach"
	line "nur unachtsam!"
	done

GenericTrainerPicnickerTanya:
	generictrainer PICNICKER, TANYA, EVENT_BEAT_PICNICKER_TANYA, PicnickerTanyaSeenText, PicnickerTanyaBeatenText

	text "Oh, schau dir all"
	line "deine Orden an."

	para "Kein Wunder, dass"
	line "ich verlor!"
	done

GenericTrainerBeautyJulia:
	generictrainer BEAUTY, JULIA, EVENT_BEAT_BEAUTY_JULIA, BeautyJuliaSeenText, BeautyJuliaBeatenText

	text "Wie werde ich nur"
	line "so damenhaft wie"
	cont "Erika?"
	done

GenericTrainerAroma_ladyDahlia:
	generictrainer AROMA_LADY, DAHLIA, EVENT_BEAT_AROMA_LADY_DAHLIA, Aroma_ladyDahliaSeenText, Aroma_ladyDahliaBeatenText

	text "Myrapla verströmt"
	line "üblen Gestank,"

	para "doch Erika macht"
	line "daraus ein süßes"
	cont "Parfüm."
	done

GenericTrainerTwinsJoandzoe1:
	generictrainer TWINS, JOANDZOE1, EVENT_BEAT_TWINS_JO_AND_ZOE, TwinsJoandzoe1SeenText, TwinsJoandzoe1BeatenText

	text "Erika wird sich"
	line "für uns rächen!"
	done

GenericTrainerTwinsJoandzoe2:
	generictrainer TWINS, JOANDZOE2, EVENT_BEAT_TWINS_JO_AND_ZOE, TwinsJoandzoe2SeenText, TwinsJoandzoe2BeatenText

	text "Erika ist viel,"
	line "viel stärker!"
	done

CeladonGymStatue:
	gettrainername ERIKA, 1, STRING_BUFFER_4
	checkflag ENGINE_RAINBOWBADGE
	iftruefwd .Beaten
	jumpstd gymstatue1
.Beaten:
	jumpstd gymstatue2

ErikaBeforeBattleText:
	text "Erika: Hallo…"
	line "Schönes Wetter,"

	para "nicht wahr?"
	line "Es ist so"
	cont "angenehm…"

	para "…Ich fürchte, ich"
	line "nicke gleich ein…"

	para "Mein Name ist"
	line "Erika. Ich leite"
	cont "die Arena hier."

	para "…Oh? Den weiten"
	line "Weg von Johto,"
	cont "sagst du? Nett…"

	para "Oh, tut mir leid,"
	line "ich wusste nicht,"

	para "dass du mich"
	line "herausfordern"
	cont "willst."

	para "Nun gut, aber ich"
	line "werde nicht"
	cont "verlieren."
	done

ErikaBeatenText:
	text "Erika: Oh!"
	line "Ich gebe auf…"

	para "Du bist wirklich"
	line "stark…"

	para "Ich gebe dir den"
	line "Regenbogenorden…"
	done

ErikaExplainTMText:
	text "Erika: Das war"
	line "ein herrlicher"
	cont "Kampf."

	para "Ich fühlte mich"
	line "inspiriert. Bitte"
	cont "nimm dieses TM."
	done


ErikaAfterBattleText:
	text "Erika: Verlieren"
	line "hinterlässt einen"
	cont "bitteren"

	para "Nachgeschmack…"

	para "Doch zu wissen,"
	line "dass es starke"

	para "Trainer gibt,"
	line "spornt mich an,"
	cont "besser zu werden…"
	done

LassMichelleSeenText:
	text "Findest du eine"
	line "reine Mädchen-"
	cont "Arena selten?"
	done

LassMichelleBeatenText:
	text "Oh, bäh!"
	done

PicnickerTanyaSeenText:
	text "Oh, ein Kampf?"
	line "Etwas gruselig,"
	cont "aber OK!"
	done

PicnickerTanyaBeatenText:
	text "Oh, das war's?"
	done

BeautyJuliaSeenText:
	text "Schaust du die"
	line "Blumen an oder"
	cont "mich?"
	done

BeautyJuliaBeatenText:
	text "Wie ärgerlich!"
	done

Aroma_ladyDahliaSeenText:
	text "Ein faszinieren-"
	line "der Duft umgibt"
	cont "dich…"
	done

Aroma_ladyDahliaBeatenText:
	text "Der üble Duft"
	line "der Niederlage…"
	done

TwinsJoandzoe1SeenText:
	text "Wir zeigen dir"
	line "#mon-Attacken,"
	cont "die uns Erika"

	para "beigebracht hat!"
	done

TwinsJoandzoe1BeatenText:
	text "Oh… Verloren…"
	done

TwinsJoandzoe2SeenText:
	text "Wir beschützen"
	line "Erika!"
	done

TwinsJoandzoe2BeatenText:
	text "Wir verloren…"
	done
