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

	; PC-only Journal
	text "#MON-Journal"
	para "Spezial: #MON"
	line "PROF. EICH!"
	para "Samuel Eichs"
	line "Enkelkinder BLAU"
	cont "und SARAH"
	para "wohnen in der Nähe"
	line "seines Labs in"
	cont "ALABASTIA."
	para "Sein Cousin Samson"
	line "soll in der"
	para "weit entfernten"
	line "Alola-Region"
	cont "leben."
	done

RedsHouse2FPCText:
	; GSC-DE Dump 6417
	text "Es sieht aus, als"
	line "wäre er seit"
	cont "langer Zeit nicht"
	cont "mehr benutzt"
	cont "worden…"
	done

RedsHouse2FSNESText:
	; GSC-DE Dump 6416 (N64→SNES PC)
	text "<PLAYER> spielt"
	line "SNES."
	para "Mach besser"
	line "weiter - du hast"
	cont "keine Zeit zu"
	cont "verlieren!"
	done
