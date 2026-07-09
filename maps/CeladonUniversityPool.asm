CeladonUniversityPool_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  6,  9, CELADON_UNIVERSITY_2F, 6
	warp_event  7,  9, CELADON_UNIVERSITY_2F, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event 11,  5, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonUniversityPoolFergusScript, -1
	object_event  9,  1, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityPoolLassText, -1
	object_event  4,  4, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SWIM_UP_DOWN, 1, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityPoolSwimmer_girlText, -1
	object_event  3,  8, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityPoolTeacherText, -1
	itemball_event 12,  8, WATER_STONE, 1, EVENT_CELADON_UNIVERSITY_POOL_WATER_STONE

	object_const_def
	const CELADONUNIVERSITYPOOL_FERGUS

CeladonUniversityPoolFergusScript:
	faceplayer
	checkevent EVENT_BEAT_COOLTRAINERM_FERGUS
	iftruefwd .Beaten
	opentext
	checkevent EVENT_INTRODUCED_CELADON_FOUR
	iftruefwd .IntroducedCeladonFour1
	writetext .IntroText1
	sjumpfwd .AfterIntro
.IntroducedCeladonFour1
	writetext .IntroText2
.AfterIntro
	yesorno
	iffalse_jumpopenedtext .NoBattleText
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked CELADONUNIVERSITYPOOL_FERGUS
	loadtrainer COOLTRAINERM, FERGUS
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_COOLTRAINERM_FERGUS
.Beaten
	opentext
	setevent EVENT_INTRODUCED_CELADON_FOUR
	checkevent EVENT_BEAT_COOLTRAINERM_COREY
	iffalse_jumpopenedtext .AfterText1
	checkevent EVENT_BEAT_COOLTRAINERM_RAYMOND
	iffalse_jumpopenedtext .AfterText1
	checkevent EVENT_BEAT_COOLTRAINERF_NEESHA
	iffalse_jumpopenedtext .AfterText1
	checkevent EVENT_GOT_CHOICE_BAND_FROM_CELADON_FOUR
	iftrue_jumpopenedtext .FinalText
	writetext .AfterText2
	promptbutton
	verbosegiveitem CHOICE_BAND
	iffalse_endtext
	setevent EVENT_GOT_CHOICE_BAND_FROM_CELADON_FOUR
	jumpopenedtext .FinalText

.IntroText1:
	text "Ich bin Fergus!"
	line "Einer der vier"
	cont "besten Trainer"

	para "der"
	line "Prismania-Uni."

	para "Man nennt uns die"
	line "Prismanias Vier!"

	para "Ich beweise dir"
	line "mit einem Kampf,"
	cont "dass ich es"

	para "verdient habe!"
	done

.IntroText2:
	text "Ich bin Fergus!"
	line "Einer der"
	cont "Prismanias Vier!"

	para "Du forderst alle"
	line "vier heraus?"

	para "Na gut, lass uns"
	line "kämpfen!"
	done

.NoBattleText:
	text "Dann komm mir"
	line "nicht in die"
	cont "Quere."
	done

.SeenText:
	text "Wir zeigen dir!"
	line "Los geht's!"
	done

.BeatenText:
	text "Unmöglich!"
	done

.AfterText1:
	text "Ich habe so viel"
	line "Zeit ins Training"
	cont "gesteckt, aber du"

	para "hast uns trotzdem"
	line "geschlagen."

	para "Mit deiner Kraft"
	line "solltest du die"

	para "restlichen Pris-"
	line "manias Vier"
	cont "herausfordern!"
	done

.AfterText2:
	text "Alle Prismanias"
	line "Vier verloren"
	cont "gegen dich?"

	para "Du bist echt"
	line "was Besonderes!"

	para "Du hast dir das"
	line "verdient!"
	done

.FinalText:
	text "Die Prismanias"
	line "Vier sind hier"
	cont "groß, aber du"

	para "machst draußen"
	line "Furore."

	para "Weiter so!"
	done

CeladonUniversityPoolLassText:
	text "Autsch!"

	para "Ich massiere"
	line "einen"
	line "Krampf im Bein."
	done

CeladonUniversityPoolSwimmer_girlText:
	text "Ich habe mich für"
	line "ein Spezialpro-"
	cont "gramm beworben,"

	para "um auf den"
	line "Seeschauminseln"
	cont "zu studieren!"

	para "Ich muss mich auf"
	line "hartes Schwimmen"
	cont "vorbereiten."
	done

CeladonUniversityPoolTeacherText:
	text "OK, noch fünf"
	line "Runden!"
	done
