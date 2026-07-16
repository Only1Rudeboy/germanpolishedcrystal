ViridianPokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, VIRIDIAN_CITY, 5
	warp_event  6,  7, VIRIDIAN_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalBlueScript

	def_object_events
	pc_nurse_event  5, 1
	object_event  2,  4, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianPokeCenter1FCooltrainermScript, -1
	object_event  8,  4, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, ViridianPokeCenter1FCooltrainerfText, -1
	object_event  3,  6, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, ViridianPokeCenter1FBugCatcherText, -1

PokemonJournalBlueScript:
	setflag ENGINE_READ_BLUE_JOURNAL
	jumpthistext

	text "#MON-Journal"
	para "Spezial: LEITER"
	line "BLAU!"
	para "Man sagt, BLAU"
	line "besucht jedes Jahr"
	cont "seine liebsten"
	cont "#MON im"
	para "SEELENHAUS."
	done

ViridianPokeCenter1FCooltrainermScript:
	checkevent EVENT_BLUE_IN_CINNABAR
	iftrue_jumptextfaceplayer .BlueText
	jumpthistextfaceplayer

	; GSC-DE Dump 3622
	text "Wo um Himmels"
	line "Willen ist der"
	para "ARENALEITER von"
	line "VERTANIA? Ich will"
	cont "ihn herausfordern."
	done
.BlueText:
	; GSC-DE Dump 3623
	text "In der PKMN-ARENA"
	line "von VERTANIA gibt"
	cont "es keine TRAINER."
	para "Der ARENALEITER"
	line "vertritt den"
	para "Grundsatz, auch"
	line "ohne die Hilfe von"
	cont "Untergebenen"
	cont "gewinnen"
	cont "zu können."
	done

ViridianPokeCenter1FCooltrainerfText:
	; GSC-DE Dump 3624
	text "Ich habe gehört,"
	line "dass die PKMN-"
	cont "ARENA auf der"
	cont "ZINNOBERINSEL"
	cont "verschwunden ist."
	para "Ich frage mich,"
	line "was aus PYRO, dem"
	cont "ARENALEITER"
	cont "geworden ist."
	done

ViridianPokeCenter1FBugCatcherText:
	; GSC-DE Dump 3625
	text "Mein großer Traum"
	line "ist es, ARENA-"
	cont "LEITER zu werden."
	done
