CeladonUniversityWillowsOffice_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  5, CELADON_UNIVERSITY_2F, 3
	warp_event  4,  5, CELADON_UNIVERSITY_2F, 3

	def_coord_events

	def_bg_events
	bg_event  0,  0, BGEVENT_JUMPTEXT, CeladonUniversityWillowsOfficeBlackboardText
	bg_event  1,  0, BGEVENT_JUMPTEXT, CeladonUniversityWillowsOfficeBlackboardText
	bg_event  2,  1, BGEVENT_JUMPTEXT, CeladonUniversityWillowsOfficeBookshelf1Text
	bg_event  3,  1, BGEVENT_JUMPTEXT, CeladonUniversityWillowsOfficeBookshelf2Text
	bg_event  5,  2, BGEVENT_RIGHT, CeladonUniversityWillowsOfficeComputer

	def_object_events
	object_event  0,  2, SPRITE_WILLOW, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityWillowsOfficeWillowText, -1
	object_event  4,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityWillowsOfficeScientistText, -1

CeladonUniversityWillowsOfficeWillowText:
	text "Hallo! Ich bin"
	line "PROF. WILLOW."
	para "Ich betreue"
	line "Candela, Blanche"
	cont "und Spark bei"
	para "Lehre und"
	line "Forschung."
	para "Du triffst sie"
	line "vielleicht im"
	cont "Unterricht."
	para "Ich erforsche auch"
	line "#MON-"
	cont "Lebensräume und"
	cont "Verbreitung."
	para "Ich bin sehr"
	line "beschäftigt, aber"
	para "meine Assistenten"
	line "helfen mir."
	done

CeladonUniversityWillowsOfficeScientistText:
	text "Ich arbeite als"
	line "Assistent von"
	cont "PROF. WILLOW!"
	para "Ich katalogisiere"
	line "meine"
	cont "Beobachtungen auf"
	cont "Route 7."
	para "Heute sah ich 42"
	line "Rattfratz und 37"
	cont "Tauboga… und ein"
	cont "Vulpix!"
	done

CeladonUniversityWillowsOfficeBlackboardText:
	text "Jemand schrieb"
	line "'NICHT LÖSCHEN'"
	para "mit einem Pfeil zu"
	line "einer"
	cont "unleserlichen"
	cont "Kritzelei …"
	done

CeladonUniversityWillowsOfficeBookshelf1Text:
	text "Ein Buch über"
	line "ökologische"
	cont "Nischen"

	para "und wie #MON"
	line "in ihre Umgebung"
	cont "passen."
	done

CeladonUniversityWillowsOfficeBookshelf2Text:
	text "Ein Werbe-Flyer"
	line "für die"
	cont "SAFARI-ZONE."
	para "Viele exotische"
	line "#MON zieren"
	cont "ihn."
	done

CeladonUniversityWillowsOfficeComputer:
	jumpthistext

	text "'#MON-Transfer-"
	line "System' steht auf"
	cont "dem Bildschirm."
	done
