CeladonUniversityClassroom1_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2, 11, CELADON_UNIVERSITY_1F, 6
	warp_event  3, 11, CELADON_UNIVERSITY_1F, 6

	def_coord_events

	def_bg_events
	bg_event  2,  0, BGEVENT_JUMPTEXT, CeladonUniversityClassroom1BlackboardText
	bg_event  3,  0, BGEVENT_JUMPTEXT, CeladonUniversityClassroom1BlackboardText
	bg_event  4,  0, BGEVENT_JUMPTEXT, CeladonUniversityClassroom1BlackboardText
	bg_event  6,  1, BGEVENT_JUMPTEXT, CeladonUniversityClassroom1Bookshelf1Text
	bg_event  7,  1, BGEVENT_JUMPTEXT, CeladonUniversityClassroom1Bookshelf2Text

	def_object_events
	object_event  0,  6, SPRITE_IMAKUNI, SPRITEMOVEDATA_WANDER, 2, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonUniversityClassroom1ImakuniScript, -1
	object_event  1,  2, SPRITE_ANDY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom1AndyText, -1
	object_event  5,  2, SPRITE_DRAGON_TAMER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptext, CeladonUniversityClassroom1Dragon_tamerText, -1
	object_event  2,  5, SPRITE_LADY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom1LadyText, -1
	object_event  5,  5, SPRITE_ARTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom1Artist1Text, -1
	object_event  4,  7, SPRITE_ARTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, (1 << MORN) | (1 << DAY), PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom1Artist2Text, -1
	object_event  3,  9, SPRITE_ARTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, (1 << EVE) | (1 << NITE), PAL_NPC_PURPLE, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom1Artist3Text, -1

	object_const_def
	const CELADONUNIVERSITYCLASSROOM1_IMAKUNI

CeladonUniversityClassroom1ImakuniScript:
	readvar VAR_FACING
	ifequalfwd UP, .Up
	ifequalfwd DOWN, .Down
	ifequalfwd LEFT, .Left
	turnobject CELADONUNIVERSITYCLASSROOM1_IMAKUNI, RIGHT
	sjumpfwd .Continue

.Up:
	turnobject CELADONUNIVERSITYCLASSROOM1_IMAKUNI, UP
	sjumpfwd .Continue

.Down:
	turnobject CELADONUNIVERSITYCLASSROOM1_IMAKUNI, DOWN
	sjumpfwd .Continue

.Left:
	turnobject CELADONUNIVERSITYCLASSROOM1_IMAKUNI, LEFT
.Continue:
	checkevent EVENT_BEAT_IMAKUNI
	iftruefwd .Beaten
	opentext
	writetext .Text1
	yesorno
	iffalse_jumpopenedtext .Text2
	writetext .Text3
	waitbutton
	closetext
	winlosstext .Text4, 0
	setlasttalked CELADONUNIVERSITYCLASSROOM1_IMAKUNI
	loadtrainer IMAKUNI, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_IMAKUNI
.Beaten
	checkevent EVENT_GOT_PERSIM_BERRY_FROM_IMAKUNI
	iftrue_jumptext .Text6
	opentext
	writetext .Text5
	promptbutton
	verbosegiveitem PERSIM_BERRY
	iffalse_endtext
	setevent EVENT_GOT_PERSIM_BERRY_FROM_IMAKUNI
	jumpthisopenedtext

.Text6:
	text "Im Kampf wie im"
	line "Tanz sind Seele"
	cont "und Rhythmus das"
	cont "Geheimnis."

	para "Hey, das klingt"
	line "ziemlich cool!"

	para "Vielleicht werd"
	line "ich Dichter!"
	done

.Text1:
	text "Hä? W...wer bist"
	line "du?"

	para "Wer? Ich? Du"
	line "kennst mich nicht?"

	para "Ich bin der super"
	line "Musikstar,"
	cont "Imakuni!"

	para "Ich sing den"
	line "#-Rap--du"
	cont "tanzt!"

	para "♪ La di da di da,"
	line "La di da di da… ♪"

	para "Hey! Beweg die"
	line "Füße!"

	para "Was? #mon?"

	para "Du willst gegen"
	line "mich kämpfen?"
	done

.Text2:
	text "Komm schon, sei"
	line "nicht so grausam!"

	para "Du bringst mich"
	line "noch zum Weinen!"
	done

.Text3:
	text "OK, aber wenn ich"
	line "gewinne, tanzt du!"
	done

.Text4:
	text "Auch wenn ich"
	line "verlor, ist das so"
	cont "schlimm?"
	done

.Text5:
	text "Hey! Du bist"
	line "richtig gut!"

	para "Ich geb dir diese"
	line "Beere, aber sag"

	para "niemandem, dass"
	line "ich verlor, OK?"
	done

CeladonUniversityClassroom1AndyText:
	text "Hallo! Ich bin"
	line "Prof. Andy und"
	cont "liebe Kunst!"

	para "Denk dran:"
	line "Zeichne, was du"
	cont "siehst,"

	para "nicht was du zu"
	line "sehen glaubst."

	para "Lass alte Vorstel-"
	line "lungen los, wie"
	cont "Dinge aussehen."
	done

CeladonUniversityClassroom1Dragon_tamerText:
	text "Ich halte diese"
	line "Pose schon eine"
	cont "Weile."
	done

CeladonUniversityClassroom1LadyText:
	text "Man trifft"
	line "einzigartige Leute"
	cont "im Kunstkurs,"

	para "aber der Typ im"
	line "schwarzen Kostüm"
	cont "ist echt suspekt!"
	done

CeladonUniversityClassroom1Artist1Text:
	text "Die Falten dieses"
	line "Umhangs richtig zu"
	cont "treffen ist"
	cont "schwer."
	done

CeladonUniversityClassroom1Artist2Text:
	text "Hatschi!"

	para "Ugh. Wir hatten"
	line "einen Blumen-"
	cont "steckkurs, aber"

	para "jetzt muss ich"
	line "ständig niesen."

	para "Ich bin wohl"
	line "allergisch…"
	done

CeladonUniversityClassroom1Artist3Text:
	text "Tagsüber arbeite"
	line "ich viel,"

	para "drum nehme ich"
	line "abends Kurse."
	done

CeladonUniversityClassroom1BlackboardText:
	text "Hier ist eine"
	line "Beschreibung der"
	cont "Zwei-Punkt-"

	para "und Drei-Punkt-"
	line "Perspektive."
	done

CeladonUniversityClassroom1Bookshelf1Text:
	text "Ein Buch über"
	line "Farbeagle, einen"
	cont "#mon-Künstler."

	para "Voller schöner"
	line "Zeichnungen."
	done

CeladonUniversityClassroom1Bookshelf2Text:
	text "Eine Broschüre"
	line "über Kunst aus dem"
	cont "Seegrasulb-"

	para "Museum."
	done
