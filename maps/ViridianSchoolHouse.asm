ViridianSchoolHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  9, VIRIDIAN_CITY, 8
	warp_event  3,  9, VIRIDIAN_CITY, 8

	def_coord_events

	def_bg_events
	bg_event  3,  0, BGEVENT_JUMPTEXT, ViridianSchoolHouseBlackboardText
	bg_event  6,  1, BGEVENT_READ, PokemonJournalKiyoScript
	bg_event  7,  1, BGEVENT_READ, PokemonJournalKiyoScript

	def_object_events
	object_event  4,  1, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, ViridianSchoolHouseTeacherText, -1
	object_event  3,  3, SPRITE_BOOK_PAPER_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptext, ViridianSchoolHouseNotesText, -1
	object_event  3,  4, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, ViridianSchoolHouseLass1Text, -1
	object_event  5,  4, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, ViridianSchoolHouseYoungsterScript, -1
	object_event  2,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, ViridianSchoolHouseLass2Text, -1
	object_event  3,  6, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianSchoolHouseGameBoyKidScript, -1

ViridianSchoolHouseTeacherText:
	text "Ich weiß, das ist"
	line "viel Stoff,"

	para "aber bitte"
	line "pass gut auf!"
	done

ViridianSchoolHouseNotesText:
	text "Die Seite ist"
	line "voller"
	line "Kritzeleien."
	para "Ein Labyrinth,"
	line "Blumen, der Buch-"
	cont "stabe S…"
	done

ViridianSchoolHouseLass1Text:
	text "Moment! Ich"
	line "dachte doch, alle"

	para "Feuer-Attacken"
	line "sind Spezial-"
	cont "Attacken?"
	done

ViridianSchoolHouseYoungsterScript:
	checkevent EVENT_GOT_WEAK_POLICY_FROM_VIRIDIAN
	iftrue_jumptextfaceplayer .Text2
	faceplayer
	opentext
	writetext .Text1
	promptbutton
	verbosegiveitem WEAK_POLICY
	iffalse_endtext
	setevent EVENT_GOT_WEAK_POLICY_FROM_VIRIDIAN
	jumpthisopenedtext

.Text2:
	text "“Was ein #mon"
	line "nicht K.O. macht,"

	para "macht es"
	line "stärker.” So"
	cont "wirkt die"
	cont "Schwächepol."
	done

.Text1:
	text "Die Lehrerin gab"
	line "mir"
	cont "Extraexemplare."

	para "Hier, nimm eins."
	done

ViridianSchoolHouseGameBoyKidScript:
	showtextfaceplayer ViridianSchoolHouseGameBoyKidText
	turnobject LAST_TALKED, DOWN
	end

ViridianSchoolHouseGameBoyKidText:
	text "Ich mache Notizen"
	line "am Handy!"

	para "Ich faulenze"
	line "nicht!"
	line "Ehrlich!"
	done

ViridianSchoolHouseLass2Text:
	text "Ich sitze auf dem"
	line "Platz des Helden!"

	para "Warum ist mein"
	line "Leben so lang-"
	cont "weilig?"
	done

ViridianSchoolHouseBlackboardText:
	text "Physische Atta-"
	line "cken nutzen ANGR-"
	cont "und VERT-Werte."

	para "Spezial-Attacken"
	line "nutzen SP.-ANG"
	cont "und SP.-VERT."

	para "Status-Attacken"
	line "richten keinen"
	cont "direkten Schaden"
	cont "an."
	done

PokemonJournalKiyoScript:
	setflag ENGINE_READ_KIYO_JOURNAL
	jumpthistext

	text "#mon Journal"

	para "Spezial:"
	line "Karate-König"
	cont "Kiyo!"

	para "Kiyo soll unter"
	line "dem Meister aus"
	cont "ANEMONIA CITY"

	para "trainiert haben."
	line "Man munkelt, er"
	cont "trainiert noch"

	para "irgendwo in"
	line "JOHTO."
	done
