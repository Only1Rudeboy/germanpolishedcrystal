CeladonUniversityLounge_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4, 11, CELADON_UNIVERSITY_1F, 10
	warp_event  5, 11, CELADON_UNIVERSITY_1F, 10

	def_coord_events

	def_bg_events
	bg_event  7,  5, BGEVENT_JUMPTEXT, CeladonUniversityLoungeBookshelf1Text
	bg_event  7,  8, BGEVENT_READ, CeladonUniversityLoungeBookshelf2
	bg_event  0,  7, BGEVENT_RIGHT, CeladonUniversityLoungeComputer

	def_object_events
	object_event  5,  8, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonUniversityLoungeNeeshaScript, -1
	object_event  3,  1, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityLoungeLassText, -1
	object_event  5,  3, SPRITE_RICH_BOY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityLoungeRichBoyText, -1
	object_event  5,  4, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityLoungeCooltrainerfText, -1
	object_event  2,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityLoungeSuper_nerd1Text, -1
	object_event  1,  8, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityLoungeSuper_nerd2Text, -1

	object_const_def
	const CELADONUNIVERSITYLOUNGE_NEESHA

CeladonUniversityLoungeNeeshaScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_COOLTRAINERF_NEESHA
	iftruefwd .Beaten
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
	setlasttalked CELADONUNIVERSITYLOUNGE_NEESHA
	loadtrainer COOLTRAINERF, NEESHA
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_COOLTRAINERF_NEESHA
	opentext
.Beaten
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
	text "Hallo! Ich bin"
	line "Neesha! Eine der"
	cont "vier besten"

	para "Trainer der"
	line "PRISMANIA-UNI."

	para "Wir sind die"
	line "PRISMANIAS VIER!"

	para "Soll ich dir"
	line "zeigen, warum wir"
	cont "so berühmt sind?"

	para "Dann lass uns"
	line "kämpfen!"
	done

.IntroText2:
	text "Hallo! Ich bin"
	line "Neesha! Eine der"
	cont "PRISMANIAS VIER!"

	para "Du hast von uns"
	line "gehört, oder?"

	para "Dann lass uns"
	line "kämpfen!"
	done

.NoBattleText:
	text "Keine Lust auf"
	line "eine"
	cont "Herausforderung?"
	done

.SeenText:
	text "Wir wehen dich"
	line "weg!"
	done

.BeatenText:
	text "Eine schmerzhafte"
	line "Niederlage…"
	done

.AfterText1:
	text "Du bist ein"
	line "würdiger Gegner!"

	para "Aber du hast noch"
	line "nicht alles von"

	para "den PRISMANIAS"
	line "Vier gesehen."

	para "Such die anderen"
	line "und fordere sie"
	cont "heraus!"
	done

.AfterText2:
	text "Du hast alle"
	line "PRISMANIAS VIER"
	cont "besiegt?"

	para "So toll!"

	para "Nimm das als"
	line "Preis!"
	done

.FinalText:
	text "Selten fordert"
	line "jemand uns"
	para "PRISMANIAS VIER so"
	line "heraus."
	para "Ich vergesse dich"
	line "nicht, Trainer!"
	done

CeladonUniversityLoungeLassText:
	text "Nächsten Monat"
	line "fahren wir zum"
	cont "MONDBERG."

	para "Vielleicht sehe"
	line "ich ein PIEPI!"
	done

CeladonUniversityLoungeRichBoyText:
	text "Hast du dich je"
	line "gefragt, warum"

	para "Hyperbälle ein"
	line "gelbes H oben"
	cont "haben?"

	para "Weil sie früher"
	line "Hyper-Bälle"
	cont "hießen!"
	done

CeladonUniversityLoungeCooltrainerfText:
	text "#MON mit"
	line "geringerer"
	para "körperlicher Kraft"
	line "versuchen"
	cont "instinktiv, in"
	cont "einen #BALL"
	para "zu gehen."
	done

CeladonUniversityLoungeSuper_nerd1Text:
	text "Was entsteht, wenn"
	line "man einen"
	para "Witz mit einer"
	line "rhetorischen Frage"
	cont "kreuzt?"
	para "… … … … … … … … …"
	line "… … …"
	done

CeladonUniversityLoungeSuper_nerd2Text:
	text "Ich schreibe"
	line "Skripte für ein"
	cont "Spiel."

	para "Benutze kein ASM!"
	done

CeladonUniversityLoungeBookshelf1Text:
	text "Vollgestopft mit"
	line "#MON-Manga!"
	done

CeladonUniversityLoungeBookshelf2:
	opentext
	writetext .Text1
	waitbutton
	checkevent EVENT_GOT_PP_MAX_IN_UNIVERSITY
	iftruefwd .GotItem
	verbosegiveitem PP_MAX
	iffalsefwd .Done
	setevent EVENT_GOT_PP_MAX_IN_UNIVERSITY
.Done
	endtext

.GotItem
	jumpopenedtext .Text2

.Text1:
	text "Dieses Buch hat"
	line "ein Geheimfach, wo"
	para "die Seiten sein"
	line "sollten!"
	done

.Text2:
	text "Schade--es ist"
	line "leer."
	done

CeladonUniversityLoungeComputer:
	jumpthistext

	text "Eine Spielfigur"
	line "rennt durch eine"
	para "2D-PRISMANIA CITY."
	done
