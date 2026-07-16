PokemonMansion1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5, 27, CINNABAR_ISLAND, 3
	warp_event  6, 27, CINNABAR_ISLAND, 3
	warp_event 21, 23, POKEMON_MANSION_B1F, 1

	def_coord_events

	def_bg_events
	bg_event 21, 12, BGEVENT_ITEM + FULL_RESTORE, EVENT_POKEMON_MANSION_1F_HIDDEN_FULL_RESTORE
	bg_event 14, 23, BGEVENT_ITEM + PP_UP, EVENT_POKEMON_MANSION_1F_HIDDEN_PP_UP
	bg_event 14, 23, BGEVENT_JUMPTEXT, PokemonMansion1FFlowerPotText
	bg_event  2,  5, BGEVENT_JUMPTEXT, PokemonMansion1FMewtwoStatueText
	bg_event 15, 23, BGEVENT_JUMPTEXT, PokemonMansion1FFlowerPotText
	bg_event 18, 23, BGEVENT_JUMPTEXT, PokemonMansion1FFlowerPotText
	bg_event 19, 23, BGEVENT_JUMPTEXT, PokemonMansion1FFlowerPotText
	bg_event 18, 19, BGEVENT_JUMPTEXT, PokemonMansion1FFlowerPotText
	bg_event 19, 19, BGEVENT_JUMPTEXT, PokemonMansion1FFlowerPotText

	def_object_events
	object_event  9, 10, SPRITE_BURGLAR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBurglarPete, -1
	object_event 27, 14, SPRITE_BURGLAR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBurglarLouis, -1
	itemball_event  6,  4, MOON_STONE, 1, EVENT_POKEMON_MANSION_1F_MOON_STONE
	itemball_event 14,  3, ESCAPE_ROPE, 1, EVENT_POKEMON_MANSION_1F_ESCAPE_ROPE
	itemball_event 17, 22, PROTEIN, 1, EVENT_POKEMON_MANSION_1F_PROTEIN
	itemball_event 27, 22, IRON, 1, EVENT_POKEMON_MANSION_1F_IRON

GenericTrainerBurglarPete:
	generictrainer BURGLAR, PETE, EVENT_BEAT_BURGLAR_PETE, BurglarPeteSeenText, BurglarPeteBeatenText

	text "Einige wertvolle"
	line "Gegenstände"
	para "haben den Ausbruch"
	line "wohl überlebt."
	done

GenericTrainerBurglarLouis:
	generictrainer BURGLAR, LOUIS, EVENT_BEAT_BURGLAR_LOUIS, BurglarLouisSeenText, BurglarLouisBeatenText

	text "Ich will nur Beute"
	line "finden und wieder"
	cont "raus."
	done

BurglarPeteSeenText:
	text "Wer bist du? Hier"
	line "sollte niemand"
	cont "sein."
	done

BurglarPeteBeatenText:
	text "Autsch!"
	done

BurglarLouisSeenText:
	text "Dieser Ort ist"
	line "gruselig!"
	done

BurglarLouisBeatenText:
	text "Aua!"
	done

PokemonMansion1FMewtwoStatueText:
	text "Eine"
	line "#MON-Statue…"
	para "Sie wirkt sehr"
	line "bedrohlich."
	done

PokemonMansion1FFlowerPotText:
	text "Es ist gefüllt mit"
	line "Erde und Asche …"
	done
