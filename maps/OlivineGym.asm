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

	text "…Mit dieser TM"
	line "kannst du dein"
	cont "#mon"
	cont "Eisenschweif"
	cont "lehren."
	done
OlivineGymGuyScript:
	checkevent EVENT_BEAT_JASMINE
	iftrue_jumptextfaceplayer OlivineGymGuyWinText
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iffalse_jumptextfaceplayer OlivineGymGuyPreText
	jumpthistextfaceplayer

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
	text "…Danke für deine"
	line "Hilfe beim"
	cont "LEUCHTTURM…"
	para "Erlaube mir, mich"
	line "vorzustellen!"
	para "Ich bin JASMIN,"
	line "eine"
	cont "ARENALEITERIN. Ich"
	cont "setze"
	cont "STAHL-#mon ein."
	para "…Hast du von"
	line "diesem Typ schon"
	cont "gehört?"
	para "Er wurde erst vor"
	line "kurzer Zeit"
	cont "entdeckt."
	para "…Ähm… Darf ich"
	line "beginnen?"
	done
Jasmine_BetterTrainer:
	text "…Du bist ein"
	line "besserer Trainer"
	cont "als ich."
	para "Das gilt für"
	line "Geschick und"
	cont "Feingefühl."
	para "Nach den Regeln"
	line "der LIGA"
	cont "überreiche ich dir"
	cont "diesen ORDEN."
	done
Jasmine_BadgeSpeech:
	text "Der MINERALORDEN"
	line "erhöht die VERT"
	cont "deiner #mon."
	para "…Ähm… Bitte nimm"
	line "auch das…"
	done
Text_ReceivedTM09: ; unreferenced
	text "<PLAYER> erhält"
	line "TM09."
	done



Jasmine_GoodLuck:
	text "Ähm … Ich weiß"
	line "nicht, wie ich das"
	cont "sagen soll, aber …"
	cont "Viel Glück!"
	done



OlivineGymGuyWinText:
	text "Das war großartig!"
	para "Der Typ Stahl,"
	line "was?"
	para "Das war eine"
	line "unheimliche"
	cont "Begegnung der"
	cont "unbekannten Art."
	done
OlivineGymGuyPreText:
	text "JASMIN, die"
	line "ARE-NALEITERIN,"
	cont "ist im LEUCHTTURM."
	para "Sie kümmert sich"
	line "um ein krankes"
	cont "#mon."
	para "Ein starker"
	line "Trainer muss auch"
	cont "Mitgefühl zeigen."
	done
