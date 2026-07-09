QuietCave1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 19, 33, ROUTE_47, 5
	warp_event  5, 25, QUIET_CAVE_B1F, 1
	warp_event 27, 23, QUIET_CAVE_B1F, 2
	warp_event 21,  9, QUIET_CAVE_B1F, 3
	warp_event  3, 17, QUIET_CAVE_B1F, 4
	warp_event 31, 13, QUIET_CAVE_B1F, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event  6,  8, SPRITE_HEX_MANIAC, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerHexManiacAshley, -1
	object_event 13, 17, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerCooltrainermHenri, -1
	object_event 23, 25, SPRITE_HIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerHikerGrady, -1
	object_event 29,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerScientistCarl, -1
	itemball_event 10, 23, NUGGET, 1, EVENT_QUIET_CAVE_1F_NUGGET
	itemball_event 26,  4, TWISTEDSPOON, 1, EVENT_QUIET_CAVE_1F_TWISTEDSPOON
	itemball_event 14,  2, DUSK_STONE, 1, EVENT_QUIET_CAVE_1F_DUSK_STONE
	itemball_event  3,  3, DUSK_BALL, 1, EVENT_QUIET_CAVE_1F_DUSK_BALL

GenericTrainerHexManiacAshley:
	generictrainer HEX_MANIAC, ASHLEY, EVENT_BEAT_HEX_MANIAC_ASHLEY, HexManiacAshleySeenText, HexManiacAshleyBeatenText

	text "Ich sehe Dinge,"
	line "die andere nicht"
	cont "sehen…"
	done

GenericTrainerCooltrainermHenri:
	generictrainer COOLTRAINERM, HENRI, EVENT_BEAT_COOLTRAINERM_HENRI, CooltrainermHenriSeenText, CooltrainermHenriBeatenText

	text "Ein vielfältiges"
	line "Team, das sich"

	para "gegenseitig die"
	line "Schwächen aus-"
	cont "gleicht, ist der"
	cont "Schlüssel."
	done

GenericTrainerHikerGrady:
	generictrainer HIKER, GRADY, EVENT_BEAT_HIKER_GRADY, HikerGradySeenText, HikerGradyBeatenText

	text "Man könnte eine"
	line "Stecknadel fallen"
	cont "hören!"
	done

GenericTrainerScientistCarl:
	generictrainer SCIENTIST, CARL, EVENT_BEAT_SCIENTIST_CARL, ScientistCarlSeenText, ScientistCarlBeatenText

	text "Interessant, dass"
	line "so eine ruhige"

	para "Umgebung direkt"
	line "neben rauschendem"
	cont "Wasser existiert."
	done

HexManiacAshleySeenText:
	text "Die Geister haben"
	line "mir deine Nieder-"
	cont "lage gezeigt!"
	done

HexManiacAshleyBeatenText:
	text "Nein! Die Geister"
	line "können nicht"
	cont "irren!"
	done

CooltrainermHenriSeenText:
	text "Kannst du mit"
	line "meinem"
	cont "ausgewogenen"
	cont "#mon-Team"
	cont "umgehen?"
	done

CooltrainermHenriBeatenText: ; text > text
	text "Anscheinend"
	line "schon!"
	done

HikerGradySeenText:
	text "Ich hab dich"
	line "gehört,"
	line "bevor ich dich"
	cont "sah!"
	done

HikerGradyBeatenText:
	text "Ach!"
	done

ScientistCarlSeenText:
	text "Ich erforsche die"
	line "Akustik dieses"
	cont "Höhlensystems."
	done

ScientistCarlBeatenText:
	text "Meine Studien"
	line "helfen beim"
	cont "Kämpfen nicht!"
	done
