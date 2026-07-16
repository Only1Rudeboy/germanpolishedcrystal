CeladonUniversityClassroom2_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2, 11, CELADON_UNIVERSITY_1F, 7
	warp_event  3, 11, CELADON_UNIVERSITY_1F, 7

	def_coord_events

	def_bg_events
	bg_event  2,  0, BGEVENT_JUMPTEXT, CeladonUniversityClassroom2BlackboardText
	bg_event  3,  0, BGEVENT_JUMPTEXT, CeladonUniversityClassroom2BlackboardText
	bg_event  4,  0, BGEVENT_JUMPTEXT, CeladonUniversityClassroom2BlackboardText
	bg_event  6,  1, BGEVENT_JUMPTEXT, CeladonUniversityClassroom2Bookshelf1Text
	bg_event  7,  1, BGEVENT_JUMPTEXT, CeladonUniversityClassroom2Bookshelf2Text

	def_object_events
	object_event  2,  1, SPRITE_BLANCHE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, (1 << MORN) | (1 << DAY), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom2BlancheText, -1
	object_event  2,  1, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, (1 << EVE) | (1 << NITE), PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom2TeacherText, -1
	object_event  4,  5, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom2YoungsterText, -1
	object_event  2,  7, SPRITE_CHILD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom2ChildText, -1
	object_event  5,  7, SPRITE_LADY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom2LadyText, -1
	object_event  3,  9, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonUniversityClassroom2CooltrainermScript, -1

CeladonUniversityClassroom2BlancheText:
	text "Ich bin BLANCHE."
	line "Ich unterrichte"
	cont "hier Geschichte."
	para "Wir müssen aus der"
	line "Geschichte lernen,"
	para "sonst sind wir"
	line "dazu verdammt, sie"
	cont "zu wiederholen."
	done

CeladonUniversityClassroom2TeacherText:
	text "BLANCHE ist leider"
	line "nicht da."
	para "Sie unterrichtet"
	line "nur tagsüber."
	done

CeladonUniversityClassroom2YoungsterText:
	text "Ich blätter durch"
	line "meine Notizen so"
	cont "schnell--AU!"
	cont "Papierschnitt…"
	done

CeladonUniversityClassroom2ChildText:
	text "Wir hatten gerade"
	line "eine Vorlesung"
	para "über PROF."
	line "WESTWOODs Bei-"
	cont "träge zum #DEX."
	para "Ich hörte, dass er"
	line "gegen Ende"
	para "faul wurde und"
	line "sich manches nur"
	cont "ausgedacht hat!"
	done

CeladonUniversityClassroom2LadyText:
	text "Du kommst aus"
	line "JOHTO? Diese"

	para "Region hat so"
	line "faszinierende"
	cont "Geschichte!"
	done

CeladonUniversityClassroom2CooltrainermScript:
	showtext .Text1
	showtextfaceplayer .Text2
	turnobject LAST_TALKED, UP
	end

.Text1: ; text > text
	text "…Zzz… Aah!"
	done

.Text2:
	text "Ähem."
	para "Entschuldige--du"
	line "hast mich"
	cont "erschreckt."
	para "Ich war bis spät"
	line "auf, um eine"
	para "Aufgabe fertig-"
	line "zustellen, drum"
	cont "bin ich erschöpft."
	done

CeladonUniversityClassroom2BlackboardText:
	text "Eine Zeitleiste"
	line "der jüngeren"
	cont "Geschichte."
	para "Vor 400 Jahren:"
	line "Attacke Toxin"
	cont "erfunden."
	para "Vor 71 Jahren:"
	line "moderner #BALL"
	cont "entwickelt."
	para "Vor 27 Jahren:"
	line "erste Mond-"
	cont "landung."
	para "Vor drei Jahren:"
	line "erstes virtuelles"
	cont "#MON er-"
	cont "schaffen."
	para "'Hypothese:"
	line "Technik wächst"
	cont "exponentiell.'"
	done

CeladonUniversityClassroom2Bookshelf1Text:
	text "Ein Buch darüber,"
if DEF(FAITHFUL)
	line "wie der Messing-"
	cont "turm in TEAK"

	para "CITY vor 150"
	line "Jahren abbrannte."
else
	line "wie der Gongturm"
	cont "in TEAK CITY"

	para "vor 150 Jahren"
	line "abbrannte."
endc
	done

CeladonUniversityClassroom2Bookshelf2Text:
	text "Ein Buch mit"
	line "Slang-Begriffen"
	cont "aus den 1980ern."
	cont "Krass!"
	done

