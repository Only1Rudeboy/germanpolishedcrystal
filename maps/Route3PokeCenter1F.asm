Route3PokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, ROUTE_3, 2
	warp_event  6,  7, ROUTE_3, 2
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalKarenScript

	def_object_events
	pc_nurse_event  5, 1
	object_event  9,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route3PokeCenter1FPokefanM1Text, -1
	object_event  2,  5, SPRITE_HIKER, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route3PokeCenter1FPokefanM2Text, -1
	object_event 11,  3, SPRITE_CAMPER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route3PokeCenter1FYoungsterText, -1

PokemonJournalKarenScript:
	setflag ENGINE_READ_KAREN_JOURNAL
	jumpthistext

	text "#mon Journal"
	para "Spezial: Top Vier"
	line "MELANIE!"
	para "MELANIE soll mit"
	line "Unlicht-#mon"
	para "trainiert haben,"
	line "um ihren düsteren"
	para "Ruf zu überwinden."
	done

Route3PokeCenter1FPokefanM1Text:
	text "Vor ein paar"
	line "Jahren verkaufte"
	cont "ich einem"

	para "Jungen einen"
	line "seltsam farbigen"
	cont "Karpador…"

	para "Ich dachte, mit"
	line "ihm stimmt was"
	cont "nicht."

	para "Es war ein"
	line "seltenes"
	cont "schillerndes"
	cont "#mon!"

	para "Ich hätte viel"
	line "mehr Geld machen"
	cont "können!"
	done

Route3PokeCenter1FPokefanM2Text:
	text "Ich erinnere mich:"
	para "Als ich den Berg"
	para "bestieg, stand"
	line "hier noch nichts."
	para "Heute ist alles"
	line "bequemer."
	done

Route3PokeCenter1FYoungsterText:
	text "Viele Trainer sind"
	line "am Berg."
	para "Und viele wilde"
	line "#mon auch."
	para "Man weiß nie, wen"
	line "oder was man"
	cont "trifft."
	done
