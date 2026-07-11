CeladonUniversityLibrary1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  6, 11, CELADON_UNIVERSITY_1F, 4
	warp_event  7, 11, CELADON_UNIVERSITY_1F, 4
	warp_event  7,  0, CELADON_UNIVERSITY_LIBRARY_2F, 1

	def_coord_events

	def_bg_events
	bg_event  4,  0, BGEVENT_JUMPTEXT, CeladonUniversityLibrary1FSignpost1Text
	bg_event 10,  0, BGEVENT_JUMPTEXT, CeladonUniversityLibrary1FSignpost2Text
	bg_event  0,  3, BGEVENT_JUMPTEXT, CeladonUniversityLibrary1FBookshelf1Text
	bg_event  1,  3, BGEVENT_JUMPTEXT, CeladonUniversityLibrary1FBookshelf2Text
	bg_event  2,  3, BGEVENT_JUMPTEXT, CeladonUniversityLibrary1FBookshelf3Text
	bg_event  3,  3, BGEVENT_JUMPTEXT, CeladonUniversityLibrary1FBookshelf4Text
	bg_event  4,  3, BGEVENT_JUMPTEXT, CeladonUniversityLibrary1FBookshelf5Text
	bg_event  5,  3, BGEVENT_JUMPTEXT, CeladonUniversityLibrary1FBookshelf6Text
	bg_event  0,  7, BGEVENT_JUMPTEXT, CeladonUniversityLibrary1FBookshelf7Text
	bg_event  1,  7, BGEVENT_JUMPTEXT, CeladonUniversityLibrary1FBookshelf8Text
	bg_event  2,  7, BGEVENT_JUMPTEXT, CeladonUniversityLibrary1FBookshelf9Text
	bg_event  3,  7, BGEVENT_JUMPTEXT, CeladonUniversityLibrary1FBookshelf10Text
	bg_event  4,  7, BGEVENT_JUMPTEXT, CeladonUniversityLibrary1FBookshelf11Text
	bg_event  5,  7, BGEVENT_JUMPTEXT, CeladonUniversityLibrary1FBookshelf12Text

	def_object_events
	object_event  6,  3, SPRITE_AROMA_LADY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityLibrary1FLadyText, -1
	object_event 11,  7, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityLibrary1FGentlemanText, -1
	object_event  0,  5, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityLibrary1FCooltrainerfText, -1
	object_event  9,  5, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonUniversityLibrary1FGameboyKidScript, -1
	object_event  3,  8, SPRITE_MATRON, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityLibrary1FPokefan_fText, -1
	object_event 11,  3, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, CeladonUniversityLibrary1FCooltrainermScript, -1
	object_event  2, 11, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityLibrary1FTeacherText, -1
	object_event 10,  7, SPRITE_BOOK_PAPER_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptext, CeladonUniversityLibrary1FBookText, -1

CeladonUniversityLibrary1FLadyText:
	text "Diese Bibliothek"
	line "liegt auf dem"
	cont "Uni-Gelände,"

	para "ist aber für alle"
	line "zugänglich."

	para "Ist das nicht"
	line "toll?"
	done

CeladonUniversityLibrary1FGentlemanText:
	text "Pst! Siehst du"
	line "nicht, dass ich"
	cont "lese?"
	done

CeladonUniversityLibrary1FCooltrainerfText:
	text "Prof.Lind hat hier"
	line "früher gelehrt,"

	para "deshalb hat die"
	line "Bibliothek alle"
	cont "seine Artikel."

	para "Ich habe jeden von"
	line "Anfang bis Ende"
	cont "gelesen!"
	done

CeladonUniversityLibrary1FGameboyKidScript:
	showtextfaceplayer .Text
	turnobject LAST_TALKED, DOWN
	end

.Text:
	text "Mein #dex hat"
	line "ein Spiel-Upgrade."

	para "Ich spiele Tetris!"
	done

CeladonUniversityLibrary1FPokefan_fText:
	text "Wir haben eine"
	line "Leihvereinbarung"

	para "mit der Bibliothek"
	line "von Fleetburg in"
	cont "Sinnoh."
	done

CeladonUniversityLibrary1FCooltrainermScript:
	checkevent EVENT_GOT_FOCUS_BAND_IN_UNIVERSITY
	iftrue_jumptextfaceplayer .Text2
	faceplayer
	opentext
	writetext .Text1
	promptbutton
	verbosegiveitem FOCUS_BAND
	iffalse_endtext
	setevent EVENT_GOT_FOCUS_BAND_IN_UNIVERSITY
	jumpopenedtext .Text2

.Text1:
	text "Ich habe bald eine"
	line "große Prüfung,"

	para "deshalb bleibe ich"
	line "hier eine Weile."

	para "Ich muss nur"
	line "durchhalten."

	para "Dabei hilft mir"
	line "das hier."
	done

.Text2:
	text "Willst du, dass"
	line "deine #mon"

	para "durchhalten? Gib"
	line "ihnen dieses"
	cont "Fokusband."
	done

CeladonUniversityLibrary1FTeacherText:
	text "Ich bin die"
	line "Oberbibliotheka-"
	cont "ri-"
	cont "n."

	para "Wenn du etwas"
	line "brauchst, sag"
	cont "Bescheid."

	para "Aber leise. Das"
	line "ist eine"
	cont "Bibliothek."
	done

CeladonUniversityLibrary1FBookText:
	text "Ein Buch über"
	line "Blumenarrangeme-"
	cont "nts."

	para "Auf dem Cover ist"
	line "ein Sonnflora."
	done

CeladonUniversityLibrary1FSignpost1Text:
	text "Bitte die lesenden"
	line "Studierenden nicht"
	cont "stören."
	done

CeladonUniversityLibrary1FSignpost2Text:
	text "Bitte kein Essen"
	line "oder Getränke in"

	para "die Bibliothek"
	line "mitbringen."
	done

CeladonUniversityLibrary1FBookshelf1Text:
	text "Huch? Jemand hat"
	line "ein altes Foto in"
	cont "dieses Buch"
	cont "gelegt."

	para "Erika und ein Mann"
	line "mit sanftem"
	cont "Lächeln"

	para "posieren fröhlich"
	line "neben einem"
	cont "Myrapla."
	done

CeladonUniversityLibrary1FBookshelf2Text:
	text "Ein Fotoalbum mit"
	line "vielen #mon-"
	cont "Bildern."

	para "“Todd Snaps Foto-"
	line "sammlung” steht"
	cont "auf dem Cover."
	done

CeladonUniversityLibrary1FBookshelf3Text:
	text "Ein Buch über"
	line "einen Mann, der"
	cont "seinem"

	para "#mon ein"
	line "Instrument"
	cont "beibrachte."

	para "Sie wirken wie"
	line "beste Freunde."
	done

CeladonUniversityLibrary1FBookshelf4Text:
	text "Ein Buch über"
	line "#mon-"
	cont "Palindrome."

	para "Auf dem Cover sind"
	line "Evoli und"
	cont "Girafarig."
	done

CeladonUniversityLibrary1FBookshelf5Text:
	text "Ein Buch über"
	line "Spielzeug-#mon,"

	para "die durch einen"
	line "Wunderschlüssel"
	cont "lebendig werden."

	para "Sie sehen süß aus."
	done

CeladonUniversityLibrary1FBookshelf6Text:
	text "Ein Buch über eine"
	line "#mon-"
	cont "Marionette,"

	para "die nicht lügen"
	line "kann."

	para "“Pinpokéo” steht"
	line "auf dem Cover."
	done

CeladonUniversityLibrary1FBookshelf7Text:
	text "Ein Bu… Moment…"

	para "Das ist ein"
	line "Videospiel!"

	para "Auf der Verpackung"
	line "ist ein #mon-"
	cont "Flipper."
	done

CeladonUniversityLibrary1FBookshelf8Text:
	text "Ein Buch eines"
	line "Angel-Gurus mit"

	para "Tipps für"
	line "Anfänger."

	para "“Chancen und"
	line "Ruten” steht auf"
	cont "dem Cover."
	done

CeladonUniversityLibrary1FBookshelf9Text:
	text "Ein Handbuch zum"
	line "#mon-Sammel-"
	cont "kartenspiel."
	done

CeladonUniversityLibrary1FBookshelf10Text:
	text "Ein Kochbuch"
	line "voller"
	cont "#mon-Rezepte!"

	para "Pummeluff-Gelee,"
	line "Glumanda-Chutney,"
	cont "Mampfax-Snacks…"
	done

CeladonUniversityLibrary1FBookshelf11Text:
	text "Ein Leitfaden zum"
	line "Mischen von"
	cont "Poffin."

	para "Ein berühmter"
	line "#mon-Züchter"
	cont "ist auf dem Cover."
	done

CeladonUniversityLibrary1FBookshelf12Text:
	text "“Das geheime Leben"
	line "des Lachens” von"
	cont "Joe King. Wortwitz"
	cont "pur!"
	done
