CeladonUniversityHyperTestRoom_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2, 11, CELADON_UNIVERSITY_2F, 4
	warp_event  3, 11, CELADON_UNIVERSITY_2F, 4

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_READ, CeladonUniversityHyperTestRoomMagikarpSign
	bg_event  6,  1, BGEVENT_JUMPTEXT, CeladonUniversityHyperTestRoomBookshelf1Text
	bg_event  7,  1, BGEVENT_JUMPTEXT, CeladonUniversityHyperTestRoomBookshelf2Text
	bg_event  7,  4, BGEVENT_RIGHT, CeladonUniversityHyperTestRoomComputer
	bg_event  7,  6, BGEVENT_RIGHT, CeladonUniversityHyperTestRoomComputer

	def_object_events
	object_event  4,  2, SPRITE_WESTWOOD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonUniversityHyperTestRoomWestwoodScript, -1
	object_event  6,  7, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityHyperTestRoomScientistText, -1
	object_event  1,  6, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityHyperTestRoomTwin1Text, -1
	object_event  1,  8, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityHyperTestRoomTwin2Text, -1

CeladonUniversityHyperTestRoomWestwoodScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_DRAGON_RAGE_MAGIKARP
	iftrue_jumpopenedtext .TestOverText
	checkevent EVENT_PASSED_CELADON_HYPER_TEST
	iftruefwd .GiveMagikarp
	writetext .GreetingText
	waitbutton
	checkevent EVENT_LISTENED_TO_WESTWOOD_INTRO
	iftruefwd .HeardIntro
	writetext .IntroText
	waitbutton
	setevent EVENT_LISTENED_TO_WESTWOOD_INTRO
.HeardIntro
	writetext .QuestionText
	yesorno
	iffalse_jumpopenedtext .RefusedText
	checkflag ENGINE_TOOK_HYPER_TEST
	iftrue_jumpopenedtext .AlreadyTookText
	setflag ENGINE_TOOK_HYPER_TEST
	writetext .BeginText
	waitbutton

	writetext .Question1IntroText
	waitbutton
	closetext
	reanchormap
	trainerpic SILHOUETTE
	waitbutton
	closepokepic
	opentext
	writetext .Question1QuestionText
	loadmenu .Question1MenuData
	verticalmenu
	closewindow
	ifnotequal $2, .WrongAnswer
	waitsfx
	playsound SFX_ELEVATOR_END
	writetext .CorrectText
	promptbutton

	writetext .Question2IntroText
	waitbutton
	closetext
	cry SLOWKING
	waitsfx
	opentext
	writetext .Question2QuestionText
	loadmenu .Question2MenuData
	verticalmenu
	closewindow
	ifnotequal $3, .WrongAnswer
	waitsfx
	playsound SFX_ELEVATOR_END
	writetext .CorrectText
	promptbutton

	writetext .Question3IntroText
	waitbutton
	writetext .Question3QuestionText
	loadmenu .Question3MenuData
	verticalmenu
	closewindow
	ifnotequal $4, .WrongAnswer
	waitsfx
	playsound SFX_ELEVATOR_END
	writetext .CorrectText
	promptbutton

	writetext .Question4IntroText
	waitbutton
	writetext .Question4QuestionText
	loadmenu .Question4MenuData
	verticalmenu
	closewindow
	ifnotequal $1, .WrongAnswer
	waitsfx
	playsound SFX_ELEVATOR_END
	writetext .CorrectText
	promptbutton

	writetext .Question5IntroText
	waitbutton
	writetext .Question5QuestionText
	loadmenu .Question5MenuData
	verticalmenu
	closewindow
	ifnotequal $3, .WrongAnswer
	waitsfx
	playsound SFX_ELEVATOR_END
	writetext .CorrectText
	promptbutton

	writetext .Question6IntroText
	waitbutton
	writetext .Question6QuestionText
	loadmenu .Question6MenuData
	verticalmenu
	closewindow
	ifnotequal $4, .WrongAnswer
	waitsfx
	playsound SFX_ELEVATOR_END
	writetext .CorrectText
	promptbutton

	setevent EVENT_PASSED_CELADON_HYPER_TEST
.GiveMagikarp:
	writetext .CongratulationsText
	waitbutton

	givepoke MAGIKARP, MAGIKARP_MASK1_FORM, 10, EVIOLITE, ULTRA_BALL, DRAGON_RAGE
	iffalse_jumpopenedtext .PartyAndBoxFullText
	setevent EVENT_GOT_DRAGON_RAGE_MAGIKARP
	jumpopenedtext .TestOverText

.WrongAnswer:
	waitsfx
	playsound SFX_WRONG
	jumpthisopenedtext

	text "Das ist leider"
	line "falsch!"

	para "Du kannst den"
	line "Hyper-Test morgen"
	cont "wiederholen."
	done

.GreetingText:
	text "PROF. WESTWOOD?"
	line "Das bin ich."
	done

.IntroText:
	text "Ein Forscher von"
	line "Weltrang!"
	para "Meine Forschung"
	line "ist unübertroffen."
	para "Bald bekomme ich"
	line "sicher eine"
	cont "Auszeichnung …"
	done

.QuestionText:
	text "Ähem. Was war das?"
	para "Du willst den"
	line "Hyper-Test der"
	cont "PRISMANIA-UNI?"
	done

.BeginText:
	text "Ausgezeichnet!"
	para "Der Hyper-Test hat"
	line "sechs Fragen und"
	cont "testet alle Sinne"
	para "unter Druck!"
	para "Wenn du bestehst,"
	line "gibt es einen"
	para "Preis, der unserer"
	line "Uni würdig ist!"
	done

.CorrectText:
	text "Richtig!"
	done

.Question1IntroText:
	text "Frage 1: Schau"
	line "genau hin!"
	done

.Question1QuestionText:
	text "Welches #MON"
	line "hat diese"
	cont "Silhouette?"
	done

.Question2IntroText:
	text "Frage 2: Hör genau"
	line "hin!"
	done

.Question2QuestionText:
	text "Welches #MON"
	line "macht diesen Ruf?"
	done

.Question3IntroText:
	text "Frage 3:"
	done

.Question3QuestionText:
	text "Welches Medikament"
	line "schmeckt bitter?"
	done

.Question4IntroText:
	text "Frage 4:"
	done

.Question4QuestionText:
	text "Welches #MON"
	line "hat Trockenhaut?"
	done

.Question5IntroText:
	text "Frage 5:"
	done

.Question5QuestionText:
	text "Welche Beere"
	line "riecht blau?"
	done

.Question6IntroText:
	text "Frage 6: Denk gut"
	line "nach!"
	done

.Question6QuestionText:
	text "Wer ist der"
	line "angesehenste"
	cont "Professor?"
	done

.CongratulationsText:
	text "Glückwunsch!"
	para "Du hast den"
	line "Hyper-Test mit"
	cont "Bravour bestanden!"
	para "Hier dein Preis…"
	line "ein speziell ge-"
	cont "züchteter Karpador"
	cont "mit Drachenwut!"
	done

.TestOverText:
	text "Unsere Studenten"
	line "haben die Zähig-"
	para "keit eines"
	line "Karpador, der sich"
	cont "entwickeln will."
	para "Und du auch!"
	done

.PartyAndBoxFullText:
	text "Ach nein! Dein"
	line "Team und die Box"
	cont "sind voll…"
	done

.RefusedText:
	text "Na gut, wenn du"
	line "sicher bist."
	done

.AlreadyTookText:
	text "Du hast den Test"
	line "heute schon"
	cont "versucht!"

	para "Morgen kannst du"
	line "es nochmal."
	done


.Question1MenuData:
	db MENU_BACKUP_TILES
	menu_coords 0, 1, 12, 11
	dw .Question1MenuData2
	db 1 ; default option

.Question1MenuData2:
	db $81 ; flags
	db 4 ; items
	db "Nachtara@"
	db "Glaziola@"
	db "Snobilikat@"
	db "GIRAFARIG@"

.Question2MenuData:
	db MENU_BACKUP_TILES
	menu_coords 0, 1, 13, 11
	dw .Question2MenuData2
	db 1 ; default option

.Question2MenuData2:
	db $81 ; flags
	db 4 ; items
	db "Heiteira@"
	db "Baldorfish@"
	db "Laschoking@"
	db "Omot@"

.Question3MenuData:
	db MENU_BACKUP_TILES
	menu_coords 0, 1, 13, 11
	dw .Question3MenuData2
	db 1 ; default option

.Question3MenuData2:
	db $81 ; flags
	db 4 ; items
	db "Elixier@"
	db "Kalzium@"
	db "Gegengift@"
	db "Heilpuder@"

.Question4MenuData:
	db MENU_BACKUP_TILES
	menu_coords 0, 1, 12, 11
	dw .Question4MenuData2
	db 1 ; default option

.Question4MenuData2:
	db $81 ; flags
	db 4 ; items
	db "Parasek@"
	db "Magmar@"
	db "Sandamer@"
	db "Sarzenia@"

.Question5MenuData:
	db MENU_BACKUP_TILES
	menu_coords 0, 1, 14, 11
	dw .Question5MenuData2
	db 1 ; default option

.Question5MenuData2:
	db $81 ; flags
	db 4 ; items
	db "Cheribeere@"
	db "Miraculbeere@"
	db "Oranbeere@"
	db "Pechabeere@"

.Question6MenuData:
	db MENU_BACKUP_TILES
	menu_coords 0, 1, 15, 11
	dw .Question6MenuData2
	db 1 ; default option

.Question6MenuData2:
	db $81 ; flags
	db 4 ; items
	db "PROF. EICH@"
	db "PROF. LIND@"
	db "PROF. WILLOW@"
	db "PROF. WESTWOOD@"

CeladonUniversityHyperTestRoomScientistText:
	text "Der Hyper-Test ist"
	line "ein Ritual für"
	cont "alle"
	para "Absolventen der"
	line "PRISMANIA-UNI."
	para "Er testet alle"
	line "Fähigkeiten bis"
	cont "zum Äußersten!"
	done

CeladonUniversityHyperTestRoomTwin1Text:
	text "Ich bestehe den"
	line "Hyper-Test vor"
	cont "dir!"
	done

CeladonUniversityHyperTestRoomTwin2Text:
	text "Nein, ich bestehe"
	line "den Hyper-Test vor"
	cont "dir!"
	done

CeladonUniversityHyperTestRoomMagikarpSign:
	reanchormap
	pokepic MAGIKARP, MAGIKARP_MASK1_FORM
	cry MAGIKARP
	waitbutton
	closepokepic
	jumpthistext

	text "Ein Karpador"
	line "schwimmt herum."
	done

CeladonUniversityHyperTestRoomBookshelf1Text:
	text "In diesem Buch"
	line "steckt ein"
	cont "Lesezeichen."

	para "Jemand ist noch"
	line "nicht fertig!"
	done

CeladonUniversityHyperTestRoomBookshelf2Text:
	text "Eine Ausgabe von"
	line "Nintendo Power!"

	para "Auf dem Cover ist"
	line "ein großes"
	cont "PIKACHU."
	done

CeladonUniversityHyperTestRoomComputer:
	jumpthistext

	text "Auf dem Desktop"
	line "liegt eine Datei"
	cont "fragen.txt."

	para "Besser nicht"
	line "schummeln!"
	done
