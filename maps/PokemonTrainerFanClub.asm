PokemonTrainerFanClub_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  6, 17, SAFFRON_CITY, 16
	warp_event  7, 17, SAFFRON_CITY, 16

	def_coord_events

	def_bg_events
	bg_event  0, 10, BGEVENT_READ, PokemonJournalBrunoScript
	bg_event  1, 10, BGEVENT_READ, PokemonJournalBrunoScript

	def_object_events

PokemonJournalBrunoScript:
	setflag ENGINE_READ_BRUNO_JOURNAL
	jumpthistext

	text "#MON Journal"
	para "Spezial: TOP VIER"
	line "BRUNO!"
	para "BRUNO soll der TOP"
	line "VIER aus"
	para "brennendem Ehrgeiz"
	line "beigetreten sein,"
	cont "um gegen"
	para "die besten Trainer"
	line "zu kämpfen."
	done
