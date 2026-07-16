CeladonUniversityLibrary2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  7,  0, CELADON_UNIVERSITY_LIBRARY_1F, 3

	def_coord_events

	def_bg_events
	bg_event  4,  0, BGEVENT_JUMPTEXT, CeladonUniversityLibrary1FSignpost1Text
	bg_event 10,  0, BGEVENT_JUMPTEXT, CeladonUniversityLibrary1FSignpost2Text
	bg_event  0,  3, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf1Text
	bg_event  1,  3, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf2Text
	bg_event  2,  3, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf3Text
	bg_event  3,  3, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf4Text
	bg_event  4,  3, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf5Text
	bg_event  5,  3, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf6Text
	bg_event  8,  3, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf7Text
	bg_event  9,  3, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf8Text
	bg_event 10,  3, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf9Text
	bg_event 11,  3, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf10Text
	bg_event 12,  3, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf11Text
	bg_event 13,  3, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf12Text
	bg_event  6,  7, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf13Text
	bg_event  7,  7, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf14Text
	bg_event  8,  7, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf15Text
	bg_event  9,  7, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf16Text
	bg_event 10,  7, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf17Text
	bg_event 11,  7, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf18Text
	bg_event 12,  7, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf19Text
	bg_event 13,  7, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf20Text
	bg_event  1,  6, BGEVENT_RIGHT, CeladonUniversityLibrary2FComputer1
	bg_event  3,  6, BGEVENT_RIGHT, CeladonUniversityLibrary2FComputer2
	bg_event  1,  8, BGEVENT_RIGHT, CeladonUniversityLibrary2FComputer3
	bg_event  3,  8, BGEVENT_RIGHT, CeladonUniversityLibrary2FComputer1
	bg_event  1, 10, BGEVENT_RIGHT, CeladonUniversityLibrary2FComputer1
	bg_event  3, 10, BGEVENT_RIGHT, CeladonUniversityLibrary2FComputer4

	def_object_events
	object_event  3,  4, SPRITE_COSPLAYER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityLibrary2FCosplayerText, -1
	object_event 11,  5, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityLibrary2FLassText, -1
	object_event  0,  9, SPRITE_ARTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonUniversityLibrary2FArtistScript, -1
	object_event  2, 11, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityLibrary2FSuper_nerdText, -1
	object_event  8, 11, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityLibrary2FCooltrainerfText, -1
	object_event 11, 10, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityLibrary2FYoungsterText, -1
	itemball_event  0,  1, TIMER_BALL, 1, EVENT_CELADON_UNIVERSITY_LIBRARY_2F_TIMER_BALL

CeladonUniversityLibrary2FCosplayerText:
	text "In der Stadt zu"
	line "leben ist toll!"
	para "Ich kann mein"
	line "Cosplay-Outfit"
	cont "tragen"
	para "und niemand schaut"
	line "schief!"
	done

CeladonUniversityLibrary2FLassText:
	text "Beurteile ein Buch"
	line "nie nach dem"
	cont "Cover."
	para "Manchmal verbirgt"
	line "sich hinter einem"
	para "langweiligen"
	line "Äußeren die beste"
	cont "Geschichte."
	done

CeladonUniversityLibrary2FArtistScript:
	showtext .Text1
	showtextfaceplayer .Text2
	turnobject LAST_TALKED, RIGHT
	end

.Text1:
	text "'JASMIN blickte in"
	line "ERIKAs tiefe"
	cont "braune Augen … '"
	done

.Text2:
	text "Hä? Verschwinde!"
	para "Es ist unhöflich,"
	line "über jemandes"
	cont "Schulter zu lesen!"
	done

CeladonUniversityLibrary2FSuper_nerdText:
	text "Der 'net"
	line "send'-Befehl zeigt"
	cont "eine"
	para "Nachricht auf dem"
	line "Bildschirm aller"
	cont "anderen!"
	para "Hmm, was soll ich"
	line "schicken…"
	para "'Gratis Pizza im"
	line "Büro von PROF."
	cont "WESTWOOD!'"
	para "Hehehe."
	done

CeladonUniversityLibrary2FCooltrainerfText:
	text "Das ist mein Buch."
	line "Und ich werde es"
	cont "LESEN!"
	done

CeladonUniversityLibrary2FYoungsterText:
	text "Ich lese über ein"
	line "legendäres"
	cont "#MON"
	para "mit der Kraft, den"
	line "Raum zu ver-"
	cont "zerren. Echt"
	cont "gruselig…"
	done

CeladonUniversityLibrary2FBookshelf1Text:
	text "Ein Buch mit"
	line "#MON eines"
	para "uralten Alphabets."
	para "Mit je einem von"
	line "jeder Art können"
	cont "sie Wünsche"
	cont "erfüllen."
	done

CeladonUniversityLibrary2FBookshelf2Text:
	text "Dieses Buch"
	line "zerfällt."
	para "Der Titel ist"
	line "nicht mehr lesbar,"
	para "aber es zeigt ein"
	line "#MON in"
	cont "schwerer Rüstung."
	done

CeladonUniversityLibrary2FBookshelf3Text:
	text "Ein Buch mit einem"
	line "riesigen"
	cont "Vorhängeschloss."
	para "Besser, du lässt"
	line "es in Ruhe."
	done

CeladonUniversityLibrary2FBookshelf4Text:
	text "Dieses Buch ist in"
	line "einer fremden"
	cont "Sprache!"
	para "Leg es lieber"
	line "zurück …"
	done

CeladonUniversityLibrary2FBookshelf5Text:
	text "Hinter diesen"
	line "Büchern…"

	para "Nö. Hier ist"
	line "nichts."
	done

CeladonUniversityLibrary2FBookshelf6Text:
	text "Ein Buch über"
	line "#MON mit"
	para "regionalen"
	line "Unterschieden."
	para "Ein Raichu sieht"
	line "etwas seltsam aus"
	cont "…"
	done

CeladonUniversityLibrary2FBookshelf7Text:
	text "Ein Buch über"
	line "#MON-"
	cont "Wettbewerbe."

	para "Auf dem Cover ist"
	line "ein"
	cont "beeindruckendes"
	cont "Gebäude."
	done

CeladonUniversityLibrary2FBookshelf8Text:
	text "Auf dem Cover"
	line "reitet ein Junge"

	para "auf einem"
	line "#MON."

	para "'Wie man sein"
	line "Dragoran dres-"
	cont "siert' steht fett"
	cont "drauf."
	done

CeladonUniversityLibrary2FBookshelf9Text:
	text "Ein Buch über eine"
	line "Welt voller"
	cont "#MON!"
	para "'Pikachus"
	line "Abenteuer im"
	cont "#Park' steht"
	para "auf dem Cover."
	done

CeladonUniversityLibrary2FBookshelf10Text:
	text "Ein Buch über eine"
	line "Insel riesiger"
	cont "#MON-Roboter."
	para "' #MON-Robotik'"
	line "von ANNE DROID …"
	done

CeladonUniversityLibrary2FBookshelf11Text:
	text "'Vergib und"
	line "vergiss' von SAUL"
	cont "GOODE."

	para "Ein Mann mit"
	line "breitem Grinsen"
	cont "ist abgebildet."
	done

CeladonUniversityLibrary2FBookshelf12Text:
	text "'Schwerelosigkeit'"
	line "von ANDY GRAVITY."
	cont "Klingt luftig!"
	done

CeladonUniversityLibrary2FBookshelf13Text:
	text "Ein Buch über die"
	line "Biologie von"
	cont "#MON."

	para "Es ist riesig!"
	done

CeladonUniversityLibrary2FBookshelf14Text:
	text "Dieses Buch ist"
	line "voller Spinnweben."
	para "Wohl schon lange"
	line "nicht gelesen."
	done

CeladonUniversityLibrary2FBookshelf15Text:
	text "Ein Buch über ein"
	line "furchterregendes"
	cont "#MON."

	para "'Absofusion und"
	line "das Tao-Trio'"
	cont "steht"

	para "in großen"
	line "Buchstaben."
	done

CeladonUniversityLibrary2FBookshelf16Text:
	text "'Alte"
	line "#MONopolis:"
	cont "Geschichte"

	para "ausgestorbener"
	line "#MON'"

	para "Klingt spannend!"
	done

CeladonUniversityLibrary2FBookshelf17Text:
	text "Ein Buch mit dem"
	line "Titel"
	cont "'Typenrollen:"

	para "Das Geheimnis von"
	line "Mogelbaum'."
	done

CeladonUniversityLibrary2FBookshelf18Text:
	text "Ein Buch über"
	line "einen uralten"
	cont "Baum,"

	para "bewacht von drei"
	line "Titanen."

	para "Er wirkt fast"
	line "magisch."
	done

CeladonUniversityLibrary2FBookshelf19Text:
	text "Eine Kopie der"
	line "Originalstrecke"
	cont "des Magnetzugs!"

	para "Eine geplante"
	line "Station in TEAK"
	cont "CITY ist ein-"
	cont "gezeichnet."
	done

CeladonUniversityLibrary2FBookshelf20Text:
	text "Rote Bücher, blaue"
	line "Bücher, gelbe"
	cont "Bücher, grüne"
	cont "Bücher …"
	para "Bücher in jeder"
	line "Farbe!"
	done

CeladonUniversityLibrary2FComputer1:
	jumpthistext

	text "Ein"
	line "Login-Bildschirm"
	cont "mit einem"
	para "Karpador im"
	line "Hintergrund."
	done

CeladonUniversityLibrary2FComputer2:
	jumpthistext

	text "Jemand hat sich"
	line "nicht abgemeldet!"
	done

CeladonUniversityLibrary2FComputer3:
	jumpthistext

	text "Eine Geschichte"
	line "voller Grammatik-"
	cont "und Rechtschreib-"
	cont "fehler."
	done

CeladonUniversityLibrary2FComputer4:
	jumpthistext

	text "Eine Webseite, wie"
	line "man ein 'l33t"
	cont "h4x0r' wird."
	done
