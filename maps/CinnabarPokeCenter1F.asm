CinnabarPokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, CINNABAR_ISLAND, 1
	warp_event  6,  7, CINNABAR_ISLAND, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalBlaineScript

	def_object_events
	pc_nurse_event  5, 1
	object_event  2,  5, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CinnabarPokeCenter1FCooltrainerfText, -1
	object_event  9,  4, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CinnabarPokeCenter1FFisherText, -1

PokemonJournalBlaineScript:
	setflag ENGINE_READ_BLAINE_JOURNAL
	jumpthistext

	text "#mon Journal"

	para "Spezial: Pyro!"

	para "Man sagt, Pyro"
	line "ziehe seine"

	para "Sonnenbrille nur"
	line "ab, wenn er neue"

	para "Rätsel ausdenkt."
	done

CinnabarPokeCenter1FCooltrainerfText:
	text "PYRO, der ARENA-"
	line "LEITER auf der"

	para "ZINNOBERINSEL,"
	line "lebt in einer"
	cont "Höhle auf den SEE-"
	cont "SCHAUMINSELN…"
	done
CinnabarPokeCenter1FFisherText:
	text "Der Vulkanausbruch"
	line "ist jetzt ein Jahr"
	cont "her."
	done
