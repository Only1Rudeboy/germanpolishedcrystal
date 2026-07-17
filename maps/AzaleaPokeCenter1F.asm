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

	text "#MON-Journal"
	para "Spezialthema:"
	line "ARENALEITER KAI!"
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
	line "der #BÄLLE"

	para "herstellt, ist"
	line "KURT kein großer"

	para "Trainer."

	para "Er hat zwar ein"
	line "#MON, aber"

	para "er setzt es kaum"
	line "ein."
	done

.NiteText:
	text "KURT und PROF."
	line "EICH sind alte"

	para "Freunde."

	para "Sie sind auch eng"
	line "befreundet mit"

	para "AGATHA, einem"
	line "ehemaligen"
	cont "Mitglied der TOP"
	cont "VIER."
	done

AzaleaPokeCenter1FGentlemanText:
	; GSC-DE Dump
	text "Beherrschen deine"
	line "#MON VM-"
	cont "Attacken?"
	para "Diese Attacken"
	line "können auch einge-"
	cont "setzt werden, wenn"
	para "dein #MON be-"
	line "siegt worden ist."
	done

AzaleaPokeCenter1FSightseermText:
	; GSC-DE Dump
	text "Dieser BILL hat"
	line "das #MON-"
	cont "LAGERUNGS-SYSTEM"
	cont "für PC entwickelt."
	para "Auf BILLs PC kön-"
	line "nen bis zu 20"
	cont "#MON pro BOX"
	cont "gelagert werden."
	done

AzaleaPokeCenter1FPokefanfText:
	; GSC-DE Dump
	text "Weißt du über"
	line "APRIKOKOS Be-"
	cont "scheid?"
	para "Brich eine auf,"
	line "höhle sie aus und"
	para "verbinde sie mit"
	line "einer speziellen"
	cont "Vorrichtung."
	para "Dann kannst du"
	line "#MON damit"
	cont "fangen."
	para "Vor der Erfindung"
	line "von #BÄLLEN hat"
	para "jeder APRIKOKOS"
	line "verwendet."
	done
