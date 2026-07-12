CeladonUniversityPrincipalsOffice_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, CELADON_UNIVERSITY_1F, 5
	warp_event  3,  7, CELADON_UNIVERSITY_1F, 5

	def_coord_events

	def_bg_events
	bg_event  2,  0, BGEVENT_JUMPTEXT, CeladonUniversityPrincipalsOfficeSignpost1Text
	bg_event  3,  0, BGEVENT_JUMPTEXT, CeladonUniversityPrincipalsOfficeSignpost2Text
	bg_event  5,  4, BGEVENT_RIGHT, CeladonUniversityPrincipalsOfficeComputer
	bg_event  1,  1, BGEVENT_JUMPTEXT, CeladonUniversityPrincipalsOfficeBookshelfText

	def_object_events
	object_event  2,  2, SPRITE_MATSUMOTO, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonUniversityPrincipalsOfficeMatsumotoScript, -1

CeladonUniversityPrincipalsOfficeMatsumotoScript:
	checkevent EVENT_GOT_RARE_CANDY_IN_UNIVERSITY
	iftrue_jumptextfaceplayer .Text2
	faceplayer
	opentext
	writetext .Text1
	promptbutton
	verbosegiveitem RARE_CANDY
	iffalse_endtext
	setevent EVENT_GOT_RARE_CANDY_IN_UNIVERSITY
	jumpthisopenedtext

.Text2:
	text "Ich arbeite hart,"
	line "damit hier alles"
	cont "läuft,"

	para "deshalb gönn ich"
	line "mir ab und zu"
	cont "Süßigkeiten."
	done

.Text1:
	text "Hallo, junger"
	line "Trainer!"

	para "Ich bin Professor"
	line "Matsumoto."

	para "Ich bin Rektor der"
	line "Prismania-Uni."

	para "Aber du kannst"
	line "mich Kumpel"
	cont "nennen!"

	para "Hier, nimm"
	line "Süßigkeiten aus"
	cont "meiner Schublade."
	done

CeladonUniversityPrincipalsOfficeSignpost1Text:
	text "Prof. Matsumotos"
	line "Abschluss in"
	cont "Pädagogik."
	done

CeladonUniversityPrincipalsOfficeSignpost2Text:
	text "Ein Foto von"
	line "Prof. Matsumoto"
	cont "vor"

	para "einer"
	line "Abschlussklasse."
	done

CeladonUniversityPrincipalsOfficeComputer:
	jumpthistext

	text "Ein E-Mail-Entwurf"
	line "bittet Alumni um"
	cont "Spenden."
	done

CeladonUniversityPrincipalsOfficeBookshelfText:
	text "Eine komplette"
	line "Sammlung der"

	para "Enzyklopädie"
	line "#monica."
	done
