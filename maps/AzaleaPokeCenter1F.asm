AzaleaPokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, AZALEA_TOWN, 1
	warp_event  6,  7, AZALEA_TOWN, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalBugsyScript

	def_object_events
	pc_nurse_event  5, 1
	object_event  8,  4, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaPokeCenter1FCooltrainermScript, -1
	object_event 11,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, AzaleaPokeCenter1FGentlemanText, -1
	object_event  8,  1, SPRITE_SIGHTSEER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, AzaleaPokeCenter1FSightseermText, -1
	object_event  2,  5, SPRITE_MATRON, SPRITEMOVEDATA_WANDER, 2, 1, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, AzaleaPokeCenter1FPokefanfText, -1

PokemonJournalBugsyScript:
	setflag ENGINE_READ_BUGSY_JOURNAL
	jumpthistext

	text "#mon-Journal"
	para "Spezialthema:"
	line "Leiter KAI!"
	para "Berichten zufolge"
	line "gewann KAI den"
	para "Käferfänger-"
	line "Wettbewerb so oft,"
	para "dass er nicht mehr"
	line "teilnimmt."
	done

AzaleaPokeCenter1FCooltrainermScript:
	checktime (1 << EVE) | (1 << NITE)
	iftrue_jumptextfaceplayer .NiteText
	jumpthistextfaceplayer

	text "Für einen Mann,"
	line "der #Bälle"

	para "herstellt, ist"
	line "KURT kein großer"

	para "Trainer."

	para "Er hat zwar ein"
	line "#mon, aber"

	para "er setzt es kaum"
	line "ein."
	done

.NiteText:
	text "KURT und Prof."
	line "Eich sind alte"

	para "Freunde."

	para "Sie sind auch eng"
	line "befreundet mit"

	para "Agatha, einem"
	line "ehemaligen"
	cont "Mitglied der Top"
	cont "Vier."
	done

AzaleaPokeCenter1FGentlemanText:
	text "Kennen deine"
	line "#mon"
	cont "VM-Attacken?"

	para "Diese Attacken"
	line "kann man selbst"

	para "einsetzen, wenn"
	line "dein #mon"
	cont "erschöpft ist."
	done

AzaleaPokeCenter1FSightseermText:
	text "Dieser BILL hat"
	line "das System zum"

	para "Aufbewahren von"
	line "#mon in einem"
	cont "PC entwickelt."

	para "BILLs PC kann bis"
	line "zu 20 #mon pro"
	cont "Box lagern."
	done

AzaleaPokeCenter1FPokefanfText:
	text "Kennst du dich mit"
	line "Aprikokos aus?"
	para "Man knackt eine"
	line "auf, höhlt sie aus"
	para "und baut ein"
	line "Spezialgerät ein."
	para "Damit kann man"
	line "#mon fangen."
	para "Bevor #BÄLLE"
	line "erfunden wurden,"
	para "benutzte jeder"
	line "Aprikokos."
	done
