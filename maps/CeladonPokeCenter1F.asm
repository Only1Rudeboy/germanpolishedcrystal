CeladonPokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, CELADON_CITY, 5
	warp_event  6,  7, CELADON_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalErikaScript

	def_object_events
	pc_nurse_event  5, 1
	object_event  2,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumpstd, happinesschecknpc, -1
	object_event  1,  3, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonPokeCenter1FPharmacistText, -1
	object_event 11,  5, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonPokeCenter1FCooltrainerfText, -1
	object_event 11,  6, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonPokeCenter1FLassText, -1

PokemonJournalErikaScript:
	setflag ENGINE_READ_ERIKA_JOURNAL
	jumpthistext

	; PC-only Class C
	text "#mon-Journal"
	para "Sonderbericht:"
	line "ARENALEITERIN"
	cont "ERIKA!"
	para "Gerüchten zufolge"
	line "sieht man ERIKA"
	cont "oft in der"
	para "PRISMANIA-ARENA"
	line "ein Nickerchen"
	cont "machen."
	done

CeladonPokeCenter1FPharmacistText:
	; GSC-DE Dump
	text "Das Versteck von"
	line "TEAM ROCKET befin-"
	cont "det sich im Keller"
	cont "der SPIELHALLE."
	para "Oh, warte. Das war"
	line "vor drei Jahren."
	done

CeladonPokeCenter1FCooltrainerfText:
	; GSC-DE Dump
	text "ERIKA versteht es"
	line "meisterlich, mit"
	para "Pflanzen-#mon"
	line "umzugehen."
	para "Eine Unachtsamkeit"
	line "wird dir bei ihr"
	cont "übel bekommen."
	done

CeladonPokeCenter1FLassText:
	; PC-only Class C
	text "ERIKA ist nicht"
	line "nur ARENALEITERIN."
	para "Sie hält auch"
	line "Vorlesungen an der"
	cont "Uni."
	done
