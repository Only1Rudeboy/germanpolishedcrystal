Route10PokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, ROUTE_10_NORTH, 1
	warp_event  6,  7, ROUTE_10_NORTH, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalAgathaScript

	def_object_events
	pc_nurse_event  5, 1
	object_event  8,  2, SPRITE_GYM_GUY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route10PokeCenter1FGymGuyScript, -1
	object_event  9,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route10PokeCenter1FGentlemanText, -1
	object_event  2,  3, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route10PokeCenter1FCooltrainerfText, -1

PokemonJournalAgathaScript:
	setflag ENGINE_READ_AGATHA_JOURNAL
	jumpthistext

	text "#mon Journal"

	para "Spezial: Ex-TOP"
	line "VIER Agatha!"

	para "In ihrer Jugend"
	line "rivalisierten"
	cont "Agatha und"

	para "PROF. EICH um die"
	line "Vorherrschaft als"
	cont "Trainer."
	done

Route10PokeCenter1FGymGuyScript:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer .Text2
	jumpthistextfaceplayer

	text "Der DIREKTOR des"
	line "KRAFTWERKs sucht"
	para "einen starken"
	line "#mon-Trainer."
	para "Er braucht Hilfe"
	line "bei der Suche nach"
	para "einem gestohlenen"
	line "Gegenstand."
	done
.Text2:
	text "Ich hörte, dass"
	line "TEAM ROCKET sich"
	para "in JOHTO"
	line "reformierte, aber"
	cont "kurz danach wieder"
	cont "zerschlagen wurde."
	para "Darüber weiß ich"
	line "leider nichts."
	done
Route10PokeCenter1FGentlemanText:
	text "Ein #mon-CENTER"
	line "neben einem"
	cont "Tunnel?"

	para "Das ist sehr"
	line "praktisch."
	done
Route10PokeCenter1FCooltrainerfText:
	text "Wenn du das"
	line "Gebäude verlässt,"
	para "kannst du das Dach"
	line "eines großen"
	cont "Hauses sehen."
	para "Das ist das"
	line "KRAFTWERK."
	done
