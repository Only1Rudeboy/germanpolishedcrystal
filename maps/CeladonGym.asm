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

	; GSC-DE Dump
	text "Das ist eine"
	line "schöne Attacke."
	para "Die Hälfte des zu-"
	line "gefügten Schadens"
	cont "wird zur Heilung"
	para "deines #MON"
	line "verwendet."
	para "Verwende sie,"
	line "wann immer du"
	cont "möchtest…"
	done

GenericTrainerLassMichelle:
	generictrainer LASS, MICHELLE, EVENT_BEAT_LASS_MICHELLE, LassMichelleSeenText, LassMichelleBeatenText

	; GSC-DE Dump
	text "Ich wurde nur"
	line "unvorsichtig, das"
	cont "ist alles!"
	done

GenericTrainerPicnickerTanya:
	generictrainer PICNICKER, TANYA, EVENT_BEAT_PICNICKER_TANYA, PicnickerTanyaSeenText, PicnickerTanyaBeatenText

	; GSC-DE Dump
	text "Oh, sieh nur, all"
	line "die ORDEN. Kein"
	para "Wunder, dass ich"
	line "verloren habe!"
	done

GenericTrainerBeautyJulia:
	generictrainer BEAUTY, JULIA, EVENT_BEAT_BEAUTY_JULIA, BeautyJuliaSeenText, BeautyJuliaBeatenText

	; GSC-DE Dump
	text "Wie werde ich nur"
	line "so damenhaft"
	cont "wie ERIKA?"
	done

GenericTrainerAroma_ladyDahlia:
	generictrainer AROMA_LADY, DAHLIA, EVENT_BEAT_AROMA_LADY_DAHLIA, Aroma_ladyDahliaSeenText, Aroma_ladyDahliaBeatenText

	; PC-only Class C
	text "Myrapla verströmt"
	line "üblen Gestank,"
	para "doch ERIKA macht"
	line "daraus ein süßes"
	cont "Parfüm."
	done

GenericTrainerTwinsJoandzoe1:
	generictrainer TWINS, JOANDZOE1, EVENT_BEAT_TWINS_JO_AND_ZOE, TwinsJoandzoe1SeenText, TwinsJoandzoe1BeatenText

	; GSC-DE Dump
	text "ERIKA wird es dir"
	line "heimzahlen!"
	done

GenericTrainerTwinsJoandzoe2:
	generictrainer TWINS, JOANDZOE2, EVENT_BEAT_TWINS_JO_AND_ZOE, TwinsJoandzoe2SeenText, TwinsJoandzoe2BeatenText

	; GSC-DE Dump
	text "ERIKA ist viel"
	line "stärker!"
	done

CeladonGymStatue:
	gettrainername ERIKA, 1, STRING_BUFFER_4
	checkflag ENGINE_RAINBOWBADGE
	iftruefwd .Beaten
	jumpstd gymstatue1
.Beaten:
	jumpstd gymstatue2

ErikaBeforeBattleText:
	; GSC-DE Dump
	text "ERIKA: Hallo…"
	line "Schönes Wetter,"
	para "nicht?"
	line "Einfach herrlich…"
	para "…Ich könnte gleich"
	line "einschlafen…"
	para "Ich heiße ERIKA."
	line "Ich bin die ARENA-"
	cont "LEITERIN von"
	cont "PRISMANIA CITY."
	para "…Wirklich? Den"
	line "ganzen Weg von"
	cont "JOHTO? Wie nett…"
	para "Oh, entschuldige."
	line "Ich wusste"
	para "nicht, dass du"
	line "gegen mich kämpfen"
	cont "willst."
	para "Nun gut. Ich werde"
	line "jedenfalls nicht"
	cont "verlieren."
	done

ErikaBeatenText:
	; GSC-DE Dump
	text "ERIKA: Oh!"
	line "Ich gebe mich"
	cont "geschlagen…"
	para "Du bist außerge-"
	line "wöhnlich stark…"
	para "Ich gebe dir den"
	line "FARBORDEN…"
	done

ErikaExplainTMText:
	; GSC-DE Dump
	text "ERIKA: Das war ein"
	line "herrlicher Kampf."
	para "Das spornt zu"
	line "neuen Taten an."
	para "Nimm bitte diese"
	line "TM an."
	para "Es ist GIGASAUGER."
	done

ErikaAfterBattleText:
	; GSC-DE Dump
	text "ERIKA: Eine"
	line "Niederlage ist"
	para "nicht sehr"
	line "angenehm…"
	para "Aber es ist ein"
	line "Ansporn, sich"
	para "mehr anzustrengen,"
	line "wenn man weiß,"
	para "dass es starke"
	line "Trainer gibt…"
	done

LassMichelleSeenText:
	; GSC-DE Dump
	text "Glaubst du, dass"
	line "eine PKMN-ARENA"
	cont "nur mit Mädchen"
	cont "selten ist?"
	done

LassMichelleBeatenText:
	; GSC-DE Dump
	text "Ach nee!"
	done

PicnickerTanyaSeenText:
	; GSC-DE Dump
	text "Oh, ein Kampf?"
	line "Das macht mir ein"
	cont "bisschen Angst,"
	cont "aber von mir aus!"
	done

PicnickerTanyaBeatenText:
	; GSC-DE Dump
	text "Ach, das war es?"
	done

BeautyJuliaSeenText:
	; GSC-DE Dump
	text "Hast du die"
	line "Blumen betrachtet"
	cont "oder mich?"
	done

BeautyJuliaBeatenText:
	; GSC-DE Dump
	text "Wie ärgerlich!"
	done

Aroma_ladyDahliaSeenText:
	; PC-only Class C
	text "Ein faszinierender"
	line "Duft umgibt dich…"
	done

Aroma_ladyDahliaBeatenText:
	; PC-only Class C
	text "Der üble Duft der"
	line "Niederlage…"
	done

TwinsJoandzoe1SeenText:
	; GSC-DE Dump
	text "Wir zeigen dir"
	line "#MON-Attacken,"
	cont "die ERIKA uns"
	cont "beigebracht hat!"
	done

TwinsJoandzoe1BeatenText:
	; GSC-DE Dump
	text "Oh… Wir haben"
	line "verloren…"
	done

TwinsJoandzoe2SeenText:
	; GSC-DE Dump
	text "Wir werden ERIKA"
	line "beschützen!"
	done

TwinsJoandzoe2BeatenText:
	; GSC-DE Dump
	text "Wir hatten keine"
	line "Chance…"
	done
