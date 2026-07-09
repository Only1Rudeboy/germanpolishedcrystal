RedsHouse2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  7,  0, REDS_HOUSE_1F, 3

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_JUMPTEXT, RedsHouse2FPCText
	bg_event  3,  5, BGEVENT_JUMPTEXT, RedsHouse2FSNESText
	bg_event  4,  1, BGEVENT_READ, PokemonJournalProfOakScript
	bg_event  5,  1, BGEVENT_READ, PokemonJournalProfOakScript

	def_object_events

PokemonJournalProfOakScript:
	setflag ENGINE_READ_PROF_OAK_JOURNAL
	jumpthistext

	text "#mon Journal"

	para "Spezial:"
	line "#mon Prof.Eich!"

	para "Samuel Eichs"
	line "Enkelkinder Blau"
	cont "und SARAH"

	para "wohnen in der"
	line "Nähe seines Labs"
	cont "in ALABASTIA."

	para "Sein Cousin"
	line "Samson soll in"

	para "weit entfernten"
	line "Alola-Region"
	cont "leben."
	done

RedsHouse2FPCText:
	text "Es sieht aus, als"
	line "wäre er seit"
	cont "langer Zeit nicht"
	cont "mehr benutzt"
	cont "worden…"
	done


RedsHouse2FSNESText:
	text "<PLAYER> spielte"
	line "am"
	line "SNES."

	para "Los, los--"
	line "keine Zeit zu"
	line "verlieren!"
	done
