UnionCaveB1FSouth_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  5, UNION_CAVE_1F, 2
	warp_event 17,  3, UNION_CAVE_B2F, 1
	warp_event  5, 33, MURKY_SWAMP, 3
	warp_event 17, 23, ROUTE_32_COAST, 1

	def_coord_events

	def_bg_events
	bg_event  2, 18, BGEVENT_ITEM + X_SP_DEF, EVENT_UNION_CAVE_B1F_SOUTH_HIDDEN_X_SP_DEF
	bg_event 12, 25, BGEVENT_ITEM + NUGGET, EVENT_UNION_CAVE_B1F_SOUTH_HIDDEN_NUGGET
	bg_event  4, 30, BGEVENT_ITEM + FULL_RESTORE, EVENT_UNION_CAVE_B1F_SOUTH_HIDDEN_FULL_RESTORE

	def_object_events
	object_event  5,  4, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPokemaniacAndrew, -1
	object_event 17,  2, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPokemaniacCalvin, -1
	object_event 16, 13, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerHikerPhillip, -1
	object_event 14, 30, SPRITE_HIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerHikerLeonard, -1
	object_event  3, 20, SPRITE_FIREBREATHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerFirebreatherJay, -1
	object_event  7, 30, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSuper_nerdRory, -1
	object_event 12, 17, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerRuin_maniacGlyn, -1
	strengthboulder_event 14, 4
	strengthboulder_event  8, 32
	smashrock_event 11, 15
	smashrock_event 12, 24
	itemball_event 14, 20, DUSK_STONE, 1, EVENT_UNION_CAVE_B1F_SOUTH_DUSK_STONE
	itemball_event  8, 26, SUPER_REPEL, 1, EVENT_UNION_CAVE_B1F_SOUTH_SUPER_REPEL
	itemball_event  2, 28, LIGHT_CLAY, 1, EVENT_UNION_CAVE_B1F_SOUTH_LIGHT_CLAY

GenericTrainerPokemaniacAndrew:
	generictrainer POKEMANIAC, ANDREW, EVENT_BEAT_POKEMANIAC_ANDREW, PokemaniacAndrewSeenText, PokemaniacAndrewBeatenText

	text "Nur ich und meine"
	line "#mon. Ich"
	cont "bin"
	cont "überglücklich."
	done
PokemaniacAndrewSeenText:
	text "Wer ist da?"

	para "Lass mich und"
	line "meine #mon"
	cont "in Frieden!"
	done
PokemaniacAndrewBeatenText:
	text "Verschwinde…"
	line "Geh weg!!"
	done
GenericTrainerPokemaniacCalvin:
	generictrainer POKEMANIAC, CALVIN, EVENT_BEAT_POKEMANIAC_CALVIN, PokemaniacCalvinSeenText, PokemaniacCalvinBeatenText

	text "Ich sollte meine"
	line "Ergebnisse"
	cont "sammeln"
	cont "und anschließend"
	cont "veröffentlichen."

	para "Vielleicht werde"
	line "ich so berühmt"
	cont "wie Prof.Lind."
	done
PokemaniacCalvinSeenText:
	text "Ich bin hierher"
	line "gekommen, um"
	cont "meine #mon-"
	cont "Forschungen"
	cont "durchzuführen."

	para "Ich zeige dir"
	line "meine Ergebnisse"
	cont "in einem Kampf!"
	done
PokemaniacCalvinBeatenText:
	text "Du hast es mir"
	line "aber gezeigt!"
	done
GenericTrainerHikerPhillip:
	generictrainer HIKER, PHILLIP, EVENT_BEAT_HIKER_PHILLIP, HikerPhillipSeenText, HikerPhillipBeatenText

	text "Ich bin lange"
	line "herumgeirrt…"

	para "Das hier macht"
	line "mir"
	line "nichts aus, aber"
	cont "ich bin hungrig!"
	done
HikerPhillipSeenText:
	text "Mir ist schon"
	line "lange niemand"
	cont "mehr begegnet."

	para "Hab keine Angst."
	line "Lass uns kämpfen!"
	done
HikerPhillipBeatenText:
	text "Uurggh…"
	done
GenericTrainerHikerLeonard:
	generictrainer HIKER, LEONARD, EVENT_BEAT_HIKER_LEONARD, HikerLeonardSeenText, HikerLeonardBeatenText

	text "Ich wohne hier"
	line "unten."

	para "Wenn du möchtest,"
	line "kannst du bei"
	cont "mir einziehen."

	para "Es ist noch"
	line "genügend Platz."
	done
HikerLeonardSeenText:
	text "Sieh mal einer"
	line "an!"
	line "Ein Besucher!"
	done
HikerLeonardBeatenText:
	text "Wahahah! Du bist"
	line "aber lebhaft!"
	done
GenericTrainerFirebreatherJay:
	generictrainer FIREBREATHER, JAY, EVENT_BEAT_FIREBREATHER_JAY, .SeenText, .BeatenText

	text "Einmal hat mein"
	line "Hut Feuer"
	cont "gefangen."

	para "Er sah aus wie"
	line "ein Magmar… aber"
	cont "tat weh!"
	done

.SeenText:
	text "Feuer speien hab"
	line "ich von meinen"

	para "#mon gelernt!"
	done

.BeatenText:
	text "Unser Feuer"
	line "konnte dich nicht"
	cont "stoppen…"
	done

GenericTrainerSuper_nerdRory:
	generictrainer SUPER_NERD, RORY, EVENT_BEAT_SUPER_NERD_RORY, .SeenText, .BeatenText

	text "Ein Jiffy ist der"
	line "wissenschaftliche"

	para "Name für ein"
	line "Hundertstel"
	cont "Sekunde."
	done

.SeenText:
	text "Das ist im Nu"
	line "vorbei!"
	done

.BeatenText:
	text "Vielleicht war"
	line "ich etwas"
	cont "daneben…"
	done

GenericTrainerRuin_maniacGlyn:
	generictrainer RUIN_MANIAC, GLYN, EVENT_BEAT_RUIN_MANIAC_GLYN, .SeenText, .BeatenText

	text "In Felsen"
	line "verstecken sich"
	cont "allerlei"

	para "interessante"
	line "Items."
	done

.SeenText:
	text "Meine #mon wurden"
	line "aus Fossilien"

	para "geboren, die ich"
	line "in dieser Höhle"
	cont "fand!"
	done

.BeatenText:
	text "Und in derselben"
	line "Höhle haben sie"
	cont "auch verloren!"
	done
