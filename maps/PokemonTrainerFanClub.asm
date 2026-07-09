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

	text "#mon Journal"

	para "Spezial:"
	line "TOP VIER Bruno!"

	para "Bruno soll der"
	line "TOP VIER aus"

	para "brennendem Ehr-"
	line "geiz beigetreten"
	cont "sein, um gegen"

	para "die besten"
	line "Trainer zu"
	cont "kämpfen."
	done
