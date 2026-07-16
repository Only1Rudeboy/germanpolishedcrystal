OlivineGym_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4, 15, OLIVINE_CITY, 2
	warp_event  5, 15, OLIVINE_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  3, 13, BGEVENT_READ, OlivineGymStatue
	bg_event  6, 13, BGEVENT_READ, OlivineGymStatue

	def_object_events
	object_event  5,  3, SPRITE_JASMINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineGymJasmineScript, EVENT_OLIVINE_GYM_JASMINE
	object_event  7, 13, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OlivineGymGuyScript, -1
	object_event  3, 10, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 2, OlivineGymGentlemanPreston, EVENT_OLIVINE_GYM_JASMINE
	object_event  6,  7, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 2, OlivineGymLassConnie, EVENT_OLIVINE_GYM_JASMINE

OlivineGymJasmineScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_JASMINE
	iftruefwd .FightDone
	writetext Jasmine_SteelTypeIntro
	waitbutton
	closetext
	winlosstext Jasmine_BetterTrainer, 0
	loadtrainer JASMINE, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_JASMINE
	opentext
	givebadge MINERALBADGE, JOHTO_REGION
	clearevent EVENT_GOLDENROD_CITY_ROCKET_TAKEOVER
	setmapscene ROUTE_42, SCENE_ROUTE42_LYRA
.FightDone:
	checkevent EVENT_GOT_TM23_IRON_TAIL
	iftrue_jumpopenedtext Jasmine_GoodLuck
	writetext Jasmine_BadgeSpeech
	promptbutton
	verbosegivetmhm TM_IRON_TAIL
	setevent EVENT_GOT_TM23_IRON_TAIL
	jumpthisopenedtext

	; GSC-DE Dump
	text "…Mit dieser TM"
	line "kannst du deinen"
	cont "#MON EISEN-"
	cont "SCHWEIF lehren."
	done

OlivineGymGuyScript:
	checkevent EVENT_BEAT_JASMINE
	iftrue_jumptextfaceplayer OlivineGymGuyWinText
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iffalse_jumptextfaceplayer OlivineGymGuyPreText
	jumpthistextfaceplayer

	; GSC-DE Dump
	text "JASMIN setzt den"
	line "neu entdeckten Typ"
	cont "Stahl ein."
	para "Ich weiß nicht"
	line "viel darüber."
	done
OlivineGymLassConnie:
	trainer 0, 0, EVENT_SPOKE_TO_LASS_CONNIE, .SeenText, 0, 0, .Script

.Script:
	endifjustbattled
	checkevent EVENT_BEAT_JASMINE
	iftrue_jumptextfaceplayer .AfterText
	jumpthistextfaceplayer

.SeenText:
	text "Kicher… Ich weiß,"
	line "wie gut du bist,"

	para "das habe ich am"
	line "LEUCHTTURM"
	cont "gesehen."

	para "Zeig das JASMIN"
	line "auch!"

	para "Viel Glück!"
	done
.AfterText:
	text "Du bist toll… Mit"
	line "so viel Po-"

	para "tenzial solltest"
	line "du noch höher"
	cont "hinaus."

	para "Warst du schon in"
	line "MAHAGONIA CITY?"
	done
OlivineGymGentlemanPreston:
	trainer 0, 0, EVENT_SPOKE_TO_GENTLEMAN_PRESTON, .SeenText, 0, 0, .Script

.Script:
	endifjustbattled
	checkevent EVENT_BEAT_JASMINE
	iftrue_jumptextfaceplayer .AfterText
	jumpthistextfaceplayer

.SeenText:
	text "Ich wusste, dass"
	line "du kommen würdest."
	para "Danke, dass du der"
	line "ARENALEITERIN"
	cont "geholfen hast,"
	para "aber ein Kampf ist"
	line "etwas anderes."
	para "Los geht's!"
	done
.AfterText:
	text "Beeindruckend! Hol"
	line "dir noch mehr"
	para "Orden mit so viel"
	line "Können!"
	done
OlivineGymStatue:
	gettrainername JASMINE, 1, STRING_BUFFER_4
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iftruefwd .Returned
	jumpstd gymstatue0
.Returned
	checkflag ENGINE_MINERALBADGE
	iftruefwd .Beaten
	jumpstd gymstatue1
.Beaten
	readvar VAR_BADGES
	ifgreater 13, .LyraToo
	jumpstd gymstatue2
.LyraToo
	jumpstd gymstatue3

Jasmine_SteelTypeIntro:
	; GSC-DE Dump
	text "…Danke für deine"
	line "Hilfe beim LEUCHT-"
	cont "TURM…"
	para "Erlaube mir, mich"
	line "vorstellen zu dür-"
	cont "fen!"
	para "Ich bin JASMIN,"
	line "eine ARENALEITE-"
	cont "RIN. Ich setze"
	cont "STAHL-#MON ein."
	para "…Hast du von die-"
	line "sem Typ schon ge-"
	cont "hört?"
	para "Er wurde erst vor"
	line "kurzer Zeit ent-"
	cont "deckt."
	para "…Ähm… Darf ich be-"
	line "ginnen?"
	done

Jasmine_BetterTrainer:
	; GSC-DE Dump
	text "…Du bist ein bes-"
	line "serer Trainer als"
	para "ich. Das betrifft"
	line "sowohl Geschick,"
	para "als auch Fein-"
	line "gefühl."
	para "In Übereinstimmung"
	line "mit den Regeln der"
	para "LIGA überreiche"
	line "ich dir diesen"
	cont "ORDEN."
	done

Jasmine_BadgeSpeech:
	; GSC-DE Dump: STAHLORDEN (Engine: MINERALBADGE)
	text "Der STAHLORDEN"
	line "erhöht die VERT"
	cont "deiner #MON."
	para "…Ähm… Bitte nimm"
	line "auch das…"
	done

Text_ReceivedTM09: ; unreferenced
	; GSC-DE Dump
	text "<PLAYER> erhält"
	line "TM09."
	done

Jasmine_GoodLuck:
	; GSC-DE Dump
	text "Ähm… Ich weiß"
	line "nicht, wie ich das"
	cont "sagen soll, aber…"
	cont "Viel Glück!"
	done

OlivineGymGuyWinText:
	; GSC-DE Dump
	text "Das war großartig!"
	para "Der Typ Stahl,"
	line "was?"
	para "Das war eine un-"
	line "heimliche Begeg-"
	cont "nung der unbe-"
	cont "kannten Art."
	done

OlivineGymGuyPreText:
	; GSC-DE Dump
	text "JASMIN, die ARE-"
	line "NALEITERIN, ist im"
	cont "LEUCHTTURM."
	para "Sie kümmert sich"
	line "um ein krankes"
	cont "#MON."
	para "Ein starker Trai-"
	line "ner muss auch Mit-"
	cont "gefühl zeigen."
	done
