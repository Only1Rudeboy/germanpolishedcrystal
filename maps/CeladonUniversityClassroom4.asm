CeladonUniversityClassroom4_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2, 11, CELADON_UNIVERSITY_1F, 9
	warp_event  3, 11, CELADON_UNIVERSITY_1F, 9

	def_coord_events

	def_bg_events
	bg_event  2,  0, BGEVENT_JUMPTEXT, CeladonUniversityClassroom4BlackboardText
	bg_event  3,  0, BGEVENT_JUMPTEXT, CeladonUniversityClassroom4BlackboardText
	bg_event  4,  0, BGEVENT_JUMPTEXT, CeladonUniversityClassroom4BlackboardText
	bg_event  6,  1, BGEVENT_READ, CeladonUniversityClassroom4Bookshelf1
	bg_event  7,  1, BGEVENT_JUMPTEXT, CeladonUniversityClassroom4Bookshelf2Text

	def_object_events
	object_event  5,  2, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonUniversityClassroom4RaymondScript, -1
	object_event  2,  1, SPRITE_CANDELA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, (1 << MORN) | (1 << DAY), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom4CandelaText, -1
	object_event  2,  1, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, (1 << EVE) | (1 << NITE), PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom4TeacherText, -1
	object_event  2,  5, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom4Bug_catcherText, -1
	object_event  3,  7, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom4FisherText, -1
	object_event  5,  7, SPRITE_AROMA_LADY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom4LadyText, -1
	object_event  4,  9, SPRITE_RICH_BOY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonUniversityClassroom4Rich_boyScript, -1

	object_const_def
	const CELADONUNIVERSITYCLASSROOM4_RAYMOND

CeladonUniversityClassroom4RaymondScript:
	faceplayer
	checkevent EVENT_BEAT_COOLTRAINERM_RAYMOND
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
	setlasttalked CELADONUNIVERSITYCLASSROOM4_RAYMOND
	loadtrainer COOLTRAINERM, COOLTRAINERM_RAYMOND
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_COOLTRAINERM_RAYMOND
.Beaten
	opentext
	setevent EVENT_INTRODUCED_CELADON_FOUR
	checkevent EVENT_BEAT_COOLTRAINERM_COREY
	iffalse_jumpopenedtext .AfterText1
	checkevent EVENT_BEAT_COOLTRAINERM_RAYMOND
	iffalse_jumpopenedtext .AfterText1
	checkevent EVENT_BEAT_COOLTRAINERM_FERGUS
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
	text "Hey! Ich bin"
	line "Raymond! Ruf mich"
	cont "Ray."

	para "Ich bin einer der"
	line "vier besten"
	cont "Trainer"
	cont "der"
	cont "Prismania-Uni."

	para "Wir sind die"
	line "Prismanias Vier!"

	para "Willst du unsere"
	line "Künste sehen?"

	para "Lass uns kämpfen!"
	line "Außer du hast"
	cont "Angst"
	cont "zu verlieren."
	done

.IntroText2:
	text "Hey! Ich bin"
	line "Raymond! Ruf mich"
	cont "Ray."

	para "Ich bin einer der"
	line "Prismanias Vier!"

	para "Du willst uns"
	line "alle"
	line "herausfordern?"

	para "Lass uns kämpfen!"
	line "Außer du hast"
	cont "Angst"
	cont "zu verlieren."
	done

.NoBattleText:
	text "Ich wusste, du"
	line "hast Angst."
	done

.SeenText:
	text "Los geht's!"
	done

.BeatenText:
	text "Ohhhh nein!"
	done

.AfterText1:
	text "Wie kann das"
	line "sein?"
	line "Ich bin einer der"
	cont "Prismanias Vier!"

	para "Ich hab zwar"
	line "verloren, aber"
	cont "meine"
	cont "drei Freunde"

	para "rächen mich!"

	para "Such sie selbst!"
	done

.AfterText2:
	text "Du hast alle"
	line "Prismanias Vier"
	cont "besiegt?"

	para "Unmöglich!"

	para "…Na gut. Du hast"
	line "es verdient."
	done

.FinalText:
	text "Wenn du die"
	line "Prismanias Vier"

	para "besiegt hast,"
	line "trägst du jede"
	cont "Last."
	done

CeladonUniversityClassroom4CandelaText:
	text "Hallo! Ich bin"
	line "Candela. Ich"
	cont "lehre #mon-Kampf!"

	para "Ich erforsche"
	line "Wege, die"

	para "natürliche Kraft"
	line "von #mon zu"
	cont "steigern."
	done

CeladonUniversityClassroom4TeacherText:
	text "Candela? Sie"
	line "unterrichtet nur"
	cont "tagsüber."
	done

CeladonUniversityClassroom4Bug_catcherText:
	text "Meine Dozentin"
	line "sagte, mein #mon"

	para "könnte es mit den"
	line "Besten aufnehmen."

	para "Sein Potenzial"
	line "war"
	line "das beste, das"
	cont "sie"
	cont "je gesehen hat!"
	done

CeladonUniversityClassroom4FisherText:
	text "Der Prof sagte,"
	line "mein #mon ist ein"
	cont "Wunder!"

	para "Ein atemberauben-"
	line "des #mon."
	done

CeladonUniversityClassroom4LadyText:
	text "Die Professorin"
	line "sagte, mein #mon"

	para "hat sie einfach"
	line "verblüfft."

	para "Es kann wohl"
	line "wirklich alles!"
	done

CeladonUniversityClassroom4Rich_boyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_ABILITY_CAP_IN_UNIVERSITY
	iftruefwd .GotItem
	writetext .Text1
	promptbutton
	verbosegiveitem ABILITY_CAP
	iffalse_endtext
	setevent EVENT_GOT_ABILITY_CAP_IN_UNIVERSITY
.GotItem:
	writetext .Text2
	waitendtext

.Text1:
	text "Wir lernen über"
	line "#mon-Fähig-"
	cont "keiten."

	para "Manche Arten"
	line "haben mehr als"
	cont "eine Fähigkeit."

	para "Damit kannst du"
	line "zwischen ihnen"
	cont "wechseln!"
	done

.Text2:
	text "Es gibt seltene"
	line "“versteckte"
	cont "Fähigkeiten“, die"

	para "eine Fähigkeits-"
	line "kappe nicht"
	cont "ändert."

	para "Aber! Hat ein #-"
	line "mon mit einer"

	para "Fähigkeitskappe"
	line "ein Ei, kann das"

	para "Baby vielleicht"
	line "eine versteckte"
	cont "Fähigkeit haben!"
	done

CeladonUniversityClassroom4BlackboardText:
	text "Beachte im Kampf:"
	line "- Typen-Chart"
	cont "-"
	cont "Attacken-Effekte"
	cont "-"
	cont "Attacken-Katego-"
	cont "ri-"
	cont "en"
	cont "- Status"
	cont "- Getragene Items"
	cont "- Basis-Werte"
	cont "- EP-Werte"
	cont "- Wesen"
	cont "- Fähigkeiten"
	cont "- Wetter"
	cont "- Sonstiges?"
	done

CeladonUniversityClassroom4Bookshelf1:
	checkevent EVENT_GOT_X_SP_ATK_IN_UNIVERSITY
	iftrue_jumptext .Text2
	opentext
	writetext .Text1
	promptbutton
	verbosegiveitem X_SP_ATK
	iffalse_endtext
	setevent EVENT_GOT_X_SP_ATK_IN_UNIVERSITY
	endtext

.Text1:
	text "Dieses Regal ist"
	line "ein Chaos!"

	para "<PLAYER> hat die"
	line "Bücher sortiert."

	para "…Oh?"
	done

.Text2:
	text "Dieses Regal ist"
	line "schön ordentlich."
	done

CeladonUniversityClassroom4Bookshelf2Text:
	text "Ein #mon-"
	line "Malbuch."

	para "Was macht das"
	line "hier?"
	done
