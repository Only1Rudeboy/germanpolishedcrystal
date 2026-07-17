CeladonUniversityClassroom3_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2, 11, CELADON_UNIVERSITY_1F, 8
	warp_event  3, 11, CELADON_UNIVERSITY_1F, 8

	def_coord_events

	def_bg_events
	bg_event  2,  0, BGEVENT_JUMPTEXT, CeladonUniversityClassroom3BlackboardText
	bg_event  3,  0, BGEVENT_JUMPTEXT, CeladonUniversityClassroom3BlackboardText
	bg_event  4,  0, BGEVENT_JUMPTEXT, CeladonUniversityClassroom3BlackboardText
	bg_event  6,  1, BGEVENT_JUMPTEXT, CeladonUniversityClassroom3Bookshelf1Text
	bg_event  7,  1, BGEVENT_JUMPTEXT, CeladonUniversityClassroom3Bookshelf2Text

	def_object_events
	object_event  2,  1, SPRITE_SPARK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, (1 << MORN) | (1 << DAY), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom3SparkText, -1
	object_event  2,  1, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, (1 << EVE) | (1 << NITE), PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom3TeacherText, -1
	object_event  4,  5, SPRITE_CHILD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom3ChildText, -1
	object_event  3,  7, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom3LassText, -1
	object_event  4,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom3Super_nerdText, -1

CeladonUniversityClassroom3SparkText:
	text "Hey! Ich bin"
	line "SPARK. Ich lehre"
	cont "Wissenschaft…"
	para "gerade"
	line "#biologie."
	para "Wir erforschen,"
	line "wie sich #MON"
	cont "fortpflanzen."
	para "PROF. LIND hat das"
	line "Feld begründet."
	para "Oh, du kennst ihn!"
	line "Stimmt es, dass er"
	cont "wirklich in seinem"
	cont "Labor lebt?"
	done

CeladonUniversityClassroom3TeacherText:
	text "Suchst du Spark?"
	para "Er ist morgen früh"
	line "wieder da."
	done

CeladonUniversityClassroom3ChildText:
	text "#MON im Ball"
	line "werden zu Licht-"
	cont "energie,"

	para "dann zurück in"
	line "Materie verwan-"
	cont "delt, wenn sie"
	cont "rauskommen."

	para "Keine Sorge, das"
	line "tut ihnen kein"
	cont "bisschen weh!"
	done

CeladonUniversityClassroom3LassText:
	text "Mein Lehrer sagte,"
	line "Magneton sei eine"
	para "Vereinigung von"
	line "drei Magnetilo,"
	para "aber Magneton ist"
	line "10-mal schwerer"
	cont "als Magnetilo."
	para "Wie geht das?!"
	done

CeladonUniversityClassroom3Super_nerdText:
	text "Kennst du das"
	line "Elektro-#MON"
	cont "Voltilamm?"

	para "Sein englischer"
	line "Name 'Mareep'"
	cont "kommt von der"

	para "Stromeinheit"
	line "'Ampere.'"

	para "Vertausch die"
	line "Buchstaben, dann"
	cont "siehst du's!"
	done

CeladonUniversityClassroom3BlackboardText:
	text "'Phylogenetik'"
	line "steht an der"
	cont "Tafel."

	para "'…#MON lassen"
	line "sich in 14"
	cont "'Ei-Gruppen'"
	cont "einteilen, plus"
	cont "Ditto."

	para "Baby-#MON"
	line "können sich nicht"
	cont "fortpflanzen."

	para "Legendäre"
	line "#MON wurden"
	cont "nicht erforscht.'"
	done

CeladonUniversityClassroom3Bookshelf1Text:
	text "Ein Buch mit"
	line "Prototyp-Designs"

	para "für technische"
	line "Geräte."

	para "Hey! Ein früher"
	line "#COM-Entwurf"
	cont "ist hier drin!"
	done

CeladonUniversityClassroom3Bookshelf2Text:
	text "Ein Aufsatz von"
	line "PROF. SILKTREE."
	para "'Alph-Ruinen"
	line "Untersuchungs-"
	cont "bericht'…"
	done
