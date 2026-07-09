StormyBeach_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 30,  4, MURKY_SWAMP, 1
	warp_event 31,  4, MURKY_SWAMP, 2
	warp_event 20, 10, HIDDEN_TREE_GROTTO, 1

	def_coord_events

	def_bg_events
	bg_event 17,  6, BGEVENT_ITEM + STARDUST, EVENT_STORMY_BEACH_HIDDEN_STARDUST
	bg_event 20,  9, BGEVENT_JUMPSTD, treegrotto, HIDDENGROTTO_STORMY_BEACH
	bg_event 21,  9, BGEVENT_JUMPSTD, treegrotto, HIDDENGROTTO_STORMY_BEACH

	def_object_events
	object_event  5, 13, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSwimmerfBarbara, -1
	object_event 14,  8, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBird_keeperJulian, -1
	object_event 28,  7, SPRITE_CAMPER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerCamperFelix, -1
	object_event 24, 11, SPRITE_PICNICKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPicnickerLily, -1
	object_event 26, 17, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SWIM_AROUND, 1, 1, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, StormyBeachSwimmermText, -1
	object_event 32, 12, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_PURPLE, OBJECTTYPE_COMMAND, jumptextfaceplayer, StormyBeachGrampsText, -1
	itemball_event 34,  7, ZINC, 1, EVENT_STORMY_BEACH_ZINC
	smashrock_event 16, 6
	smashrock_event 17, 7
	smashrock_event 12, 9
	smashrock_event 18, 10

GenericTrainerSwimmerfBarbara:
	generictrainer SWIMMERF, BARBARA, EVENT_BEAT_SWIMMERF_BARBARA, .SeenText, .BeatenText

	text "Die Strömung"
	line "zieht"
	line "mich mit…"
	done

.SeenText:
	text "Ich habe mich"
	line "kurz"
	line "ausgeruht, aber"

	para "bin immer bereit"
	line "zu kämpfen!"
	done

.BeatenText:
	text "Ein guter Kampf,"
	line "auch wenn ich"
	cont "verloren habe."
	done

GenericTrainerBird_keeperJulian:
	generictrainer BIRD_KEEPER, JULIAN, EVENT_BEAT_BIRD_KEEPER_JULIAN, .SeenText, .BeatenText

	text "An stürmischen"
	line "Orten wie hier"
	cont "ist"
	cont "Fliegen schwerer."
	done

.SeenText:
	text "Ich trainiere"
	line "hier"
	line "meine Flug-#mon."

	para "Hilfst du mir?"
	done

.BeatenText:
	text "Ich hab verloren…"
	line "Wie schade!"
	done

GenericTrainerCamperFelix:
	generictrainer CAMPER, FELIX, EVENT_BEAT_CAMPER_FELIX, .SeenText, .BeatenText

	text "Wir grillen"
	line "später!"

	para "Ich brauche nur"
	line "noch Brennholz,"
	cont "das mein #mon"
	cont "anzünden kann."
	done

.SeenText:
	text "Ich suche"
	line "Brennholz."
	cont "Hilfst du mir?"
	done

.BeatenText:
	text "Das nehme ich als"
	line "Nein…"
	done

GenericTrainerPicnickerLily:
	generictrainer PICNICKER, LILY, EVENT_BEAT_PICNICKER_LILY, .SeenText, .BeatenText

	text "Ich kam zum Pick-"
	line "nick, habe aber"
	cont "das Essen"
	cont "vergessen!"
	cont "Wie peinlich!"
	done

.SeenText:
	text "Ich hab Hunger!"
	done

.BeatenText:
	text "Ich hab mit"
	line "leerem"
	line "Magen gekämpft!"
	done

StormyBeachSwimmermText:
	text "Wir sind zum"
	line "Campen"
	line "hier,"

	para "aber das Wetter"
	line "sieht nicht gut"
	cont "aus…"
	done

StormyBeachGrampsText:
	text "Spürst du es in"
	line "der"
	line "Luft? Ein Sturm"
	cont "zieht auf."

	para "Ein passendes"
	line "Omen für alle,"

	para "die den Sumpf"
	line "erkunden wollen."
	done
