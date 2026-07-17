BluesHouse2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  7,  0, BLUES_HOUSE_1F, 3

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_JUMPTEXT, BluesHouse2FPCText
	bg_event  3,  5, BGEVENT_JUMPTEXT, BluesHouse2FSNESText
	bg_event  4,  1, BGEVENT_READ, PokemonJournalProfOakScript
	bg_event  5,  1, BGEVENT_READ, PokemonJournalProfOakScript

	def_object_events

BluesHouse2FPCText:
	; PC-only
	text "Ein Programm"
	line "simuliert einen"
	cont "Kampf zwischen"
	para "einem TURTOK und"
	line "einem DRAGORAN."
	done

BluesHouse2FSNESText:
	; PC-only (Dump-Ton 6416)
	text "<PLAYER> spielt"
	line "SNES."
	para "Mach besser"
	line "weiter - du hast"
	cont "keine Zeit zu"
	cont "verlieren!"
	done
