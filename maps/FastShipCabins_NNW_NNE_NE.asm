FastShipCabins_NNW_NNE_NE_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  0, FAST_SHIP_1F, 2
	warp_event  2, 12, FAST_SHIP_1F, 3
	warp_event  2, 24, FAST_SHIP_1F, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4, 26, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, FastShipLazySailorScript, EVENT_FAST_SHIP_CABINS_NNW_NNE_NE_SAILOR
	object_event  4,  5, SPRITE_PI, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPILooker, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  4,  3, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerCooltrainermSean, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  1,  5, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerCooltrainerfCarol, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  1,  5, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPokemaniacEthan, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  4, 17, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerHikerNoland, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  7, 30, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerGentlemanEdward, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  2, 30, SPRITE_BURGLAR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerBurglarCorey, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND

	object_const_def
	const FASTSHIPCABINS_NNW_NNE_NE_SAILOR

GenericTrainerPILooker:
	generictrainer PI, LOOKER, EVENT_BEAT_PI_LOOKER, PILookerSeenText, PILookerBeatenText

	; PC-only
	text "Mein Deckname ist"
	line "Looker."

	para "So nennt mich"
	line "jeder."

	para "Ich bin auf der"
	line "Suche nach Team"
	cont "Rocket-"
	cont "Mitgliedern."

	para "Was?! Du hast sie"
	line "besiegt?"

	para "Bravo!"
	done

GenericTrainerCooltrainermSean:
	generictrainer COOLTRAINERM, SEAN, EVENT_BEAT_COOLTRAINERM_SEAN, CooltrainermSeanSeenText, CooltrainermSeanBeatenText

	; GSC-DE Dump
	text "Trainer aus JOHTO"
	line "können gegen die"

	para "ARENALEITER aus"
	line "KANTO antreten."
	done

GenericTrainerCooltrainerfCarol:
	generictrainer COOLTRAINERF, CAROL, EVENT_BEAT_COOLTRAINERF_CAROL, CooltrainerfCarolSeenText, CooltrainerfCarolBeatenText

	; GSC-DE Dump
	text "Eines Tages werde"
	line "ich dich besiegen!"
	done

GenericTrainerPokemaniacEthan:
	generictrainer POKEMANIAC, ETHAN, EVENT_BEAT_POKEMANIAC_ETHAN, PokemaniacEthanSeenText, PokemaniacEthanBeatenText

	; GSC-DE Dump
	text "LILLY ist gut,"
	line "aber MARGIT ist"
	cont "die Beste!"

	para "Ich möchte gerne"
	line "alle Radiosender"
	cont "von JOHTO anhören!"
	done

GenericTrainerHikerNoland:
	generictrainer HIKER, NOLAND, EVENT_BEAT_HIKER_NOLAND, HikerNolandSeenText, HikerNolandBeatenText

	; GSC-DE Dump
	text "Ich frage mich, ob"
	line "es in KANTO Berge"

	para "gibt, die eine"
	line "Besteigung wert"
	cont "sind?"
	done

GenericTrainerGentlemanEdward:
	generictrainer GENTLEMAN, EDWARD, EVENT_BEAT_GENTLEMAN_EDWARD, GentlemanEdwardSeenText, GentlemanEdwardBeatenText

	; GSC-DE Dump
	text "Ich gebe auf. Du"
	line "musst nicht danach"

	para "suchen. Vergiss"
	line "es einfach!"
	done

GenericTrainerBurglarCorey:
	generictrainer BURGLAR, COREY, EVENT_BEAT_BURGLAR_COREY, BurglarCoreySeenText, BurglarCoreyBeatenText

	; GSC-DE Dump
	text "Ich habe hier"
	line "eine tolle Münze"

	para "gefunden. Jemand"
	line "muss sie verloren"
	cont "haben…"
	done

FastShipLazySailorScript:
	special SaveMusic
	playmusic MUSIC_HIKER_ENCOUNTER
	showtextfaceplayer SailorStanlySeenText
	winlosstext SailorStanlyBeatenText, SailorStanlyBeatenText
	loadtrainer SAILOR, STANLY
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	reloadmap
	special HealParty
	setevent EVENT_BEAT_SAILOR_STANLY
	showtext SailorStanlyAfterBattleText
	setevent EVENT_FAST_SHIP_LAZY_SAILOR
	setmapscene FAST_SHIP_B1F, SCENE_FASTSHIPB1F_NOOP
	readvar VAR_FACING
	ifequalfwd $3, .Movement2
	applymovement FASTSHIPCABINS_NNW_NNE_NE_SAILOR, FastShipLazySailorLeavesMovement1
	playsound SFX_EXIT_BUILDING
	disappear FASTSHIPCABINS_NNW_NNE_NE_SAILOR
	waitsfx
	end

.Movement2:
	applymovement FASTSHIPCABINS_NNW_NNE_NE_SAILOR, FastShipLazySailorLeavesMovement2
	playsound SFX_EXIT_BUILDING
	disappear FASTSHIPCABINS_NNW_NNE_NE_SAILOR
	waitsfx
	end

FastShipLazySailorLeavesMovement1:
	step_left
	step_left
	step_up
	step_up
	step_end

FastShipLazySailorLeavesMovement2:
	step_down
	step_left
	step_left
	step_up
	step_up
	step_up
	step_end

PILookerSeenText:
	; PC-only
	text "WAAAS?!"
	para "…Wie hast du das"
	line "gewusst?"
	para "Wie konntest du"
	line "mich als"
	cont "IP-Mitglied"
	cont "entlarven?!"
	done

PILookerBeatenText:
	; PC-only
	text "Sehr"
	line "bewundernswert,"
	cont "das musst du sein!"
	done

CooltrainermSeanSeenText:
	; GSC-DE Dump
	text "Ich werde mein"
	line "Können in KANTO"
	cont "testen."
	done

CooltrainermSeanBeatenText:
	; GSC-DE Dump
	text "Ich wollte"
	line "gewinnen!"
	done

CooltrainerfCarolSeenText:
	; GSC-DE Dump
	text "Ich trainiere, um"
	line "der CHAMP zu"
	cont "werden!"
	done

CooltrainerfCarolBeatenText:
	; GSC-DE Dump
	text "Worin unter-"
	line "scheiden wir uns?"
	done

PokemaniacEthanSeenText:
	; GSC-DE Dump
	text "Kennst du LILLY?"
	line "Sie ist ein klasse"
	cont "DJ in KANTO."
	done

PokemaniacEthanBeatenText:
	; GSC-DE Dump
	text "Uargh!"
	done

HikerNolandSeenText:
	; GSC-DE Dump
	text "Bist du allein?"
	line "Lass uns kämpfen!"
	done

HikerNolandBeatenText:
	; GSC-DE Dump
	text "Das ist zu viel"
	line "für mich!"
	done

SailorStanlySeenText:
	; GSC-DE Dump
	text "Richtig, ich bin"
	line "ein Matrose."

	para "Ich habe nicht"
	line "gefaulenzt!"

	para "Die Kabine war"
	line "frei, darum habe"
	cont "ich ein Nickerchen"
	cont "gemacht!"

	para "Was soll's!"
	line "Lass uns kämpfen!"
	done

SailorStanlyBeatenText:
	; GSC-DE Dump
	text "Es war alles meine"
	line "Schuld!"
	done

SailorStanlyAfterBattleText:
	; GSC-DE Dump
	text "Als Matrose muss"
	line "man körperlich"
	cont "arbeiten. Das ist"
	cont "sehr anstrengend!"
	done

GentlemanEdwardSeenText:
	; GSC-DE Dump
	text "Oh, nein. Ich"
	line "habe etwas sehr"
	cont "Wichtiges ver-"
	cont "loren."
	done

GentlemanEdwardBeatenText:
	; GSC-DE Dump
	text "Ich… ich kann es"
	line "nicht finden…"
	done

BurglarCoreySeenText:
	; GSC-DE Dump
	text "Juhu!"
	line "Was für ein Glück!"
	done

BurglarCoreyBeatenText:
	; GSC-DE Dump
	text "Pech gehabt!"
	line "Ich habe verloren!"
	done
