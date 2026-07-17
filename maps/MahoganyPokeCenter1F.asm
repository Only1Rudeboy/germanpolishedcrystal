MahoganyPokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, MAHOGANY_TOWN, 4
	warp_event  6,  7, MAHOGANY_TOWN, 4
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalPryceScript

	def_object_events
	pc_nurse_event  5, 1
	object_event  9,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, MahoganyPokeCenter1FPokefanmText, -1
	object_event  1,  3, SPRITE_CAMPER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, MahoganyPokeCenter1FYoungsterText, -1
	object_event  2,  3, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, MahoganyPokeCenter1FCooltrainerfText, -1

PokemonJournalPryceScript:
	setflag ENGINE_READ_PRYCE_JOURNAL
	; PC: #MON Journal
	jumpthistext

	text "#MON Journal"
	para "Spezial:"
	line "ARENALEITER NORBERT!"
	para "NORBERTs zweiter"
	line "Vorname lautet"
	cont "WILLOW."
	para "Sein Kampfstil"
	line "soll so flexibel"
	para "sein wie ein"
	line "Weidenbaum im"
	cont "Winter."
	para "Daher nennt man"
	line "ihn den"
	cont "Wintertrainer."
	done

MahoganyPokeCenter1FPokefanmText:
	; GSC-DE Dump
	text "Wie? TEAM ROCKET"
	line "ist wieder da?"
	para "Ich sah einige"
	line "Männer in Schwarz"
	cont "am SEE DES ZORNS…"
	done

MahoganyPokeCenter1FYoungsterText:
	; GSC-DE Dump
	text "Ich verhindere,"
	line "dass sich meine"
	cont "#MON zu"
	cont "rasch entwickeln."
	para "Ich bringe ihnen"
	line "verschiedene"
	cont "Attacken bei, be-"
	cont "vor ich sie sich"
	cont "entwickeln lasse."
	done

MahoganyPokeCenter1FCooltrainerfText:
	; GSC-DE Dump
	text "#MON werden"
	line "stärker, wenn sie"
	para "sich entwickeln."
	line "Aber sie erlernen"
	para "neue Attacken auch"
	line "langsamer."
	done
