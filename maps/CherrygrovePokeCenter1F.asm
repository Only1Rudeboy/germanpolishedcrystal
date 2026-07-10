CherrygrovePokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, CHERRYGROVE_CITY, 2
	warp_event  6,  7, CHERRYGROVE_CITY, 2
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalRedScript

	def_object_events
	pc_nurse_event  5, 1
	object_event  1,  6, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygrovePokeCenter1FTeacherScript, -1
	object_event  8,  1, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CherrygrovePokeCenter1FFisherText, -1
	object_event 11,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CherrygrovePokeCenter1FGentlemanText, -1
	object_event  9,  4, SPRITE_LADY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CherrygrovePokeCenter1FLadyText, -1

PokemonJournalRedScript:
	setflag ENGINE_READ_RED_JOURNAL
	jumpthistext

	text "#mon Journal"

	para "Spezial:"
	line "#mon-Trainer"
	cont "Rot!"

	para "Man sagt, Rot"
	line "hat"
	line "seinen Rivalen"

	para "Blau besiegt und"
	line "den Titel des"

	para "#mon-Liga-"
	line "Champions in"
	cont "Rekordzeit"
	cont "errungen."
	done

CherrygrovePokeCenter1FTeacherScript:
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue_jumptextfaceplayer .Text2
	jumpthistextfaceplayer

	text "Das KOMMUNI-"
	line "KATIONS-CENTER"
	cont "im"
	cont "ersten Stock ist"
	cont "gerade fertig."

	para "Aber der Fein-"
	line "schliff fehlt"
	cont "noch."
	done
.Text2:
	text "Das KOMMUNI-"
	line "KATIONS-CENTER"
	cont "im"
	cont "ersten Stock ist"
	cont "gerade fertig."

	para "Ich habe schon"
	line "#mon getauscht!"
	done
CherrygrovePokeCenter1FFisherText:
	text "Das ist toll!"
	line "Ich"
	line "kann so viele"

	para "#mon lagern,"
	line "wie ich will,"
	cont "und"
	cont "das umsonst!"
	done
CherrygrovePokeCenter1FGentlemanText:
	text "Dieser PC steht"
	line "jedem Trainer"
	cont "kos-"
	cont "tenfrei zur"
	cont "Verfü-"
	cont "gung."
	done
CherrygrovePokeCenter1FLadyText:
	text "Das #mon"
	line "Journal hat so"
	cont "faszinie-"
	cont "rende Storys!"

	para "Ich komme ins"
	line "#mon-CENTER für"

	para "die neuesten"
	line "Aus-"
	line "gaben, aber"

	para "man kann es auch"
	line "anderswo"
	cont "abonnieren."
	done
