Route49_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  7,  5, VALENCIA_PORT, 1

	def_coord_events

	def_bg_events
	bg_event 31, 11, BGEVENT_JUMPTEXT, Route49SignText

	def_object_events
	object_event  5, 12, SPRITE_LADY, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route49LadyText, -1
	object_event 31, 17, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route49YoungsterText, -1
	object_event 15,  8, SPRITE_SIGHTSEER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSightseermHari, -1
	object_event 12, 16, SPRITE_TAMER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerTamerJordan, -1
	object_event 25, 19, SPRITE_AROMA_LADY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerAromaLadyPeony, -1
	object_event 25,  7, SPRITE_ROCKER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerGuitaristmGeddy, -1
	itemball_event 21,  6, WHITE_HERB, 1, EVENT_ROUTE_49_WHITE_HERB
	itemball_event 18, 20, CALCIUM, 1, EVENT_ROUTE_49_CALCIUM
	fruittree_event 29, 14, FRUITTREE_ROUTE_49, LUM_BERRY, PAL_NPC_GREEN
	cuttree_event 26, 12, EVENT_ROUTE_49_CUT_TREE_1
	cuttree_event 20, 15, EVENT_ROUTE_49_CUT_TREE_2

Route49LadyText:
	text "Sieh dir das Gras"
	line "und die Bäume an!"

	para "Valencia hat"
	line "einzigartige"
	cont "Flora."
	done

Route49YoungsterText:
	text "Diese Landschaft"
	line "fühlt sich an wie"

	para "ein Abenteuer"
	line "mitten im"
	cont "Dschungel!"
	done

GenericTrainerSightseermHari:
	generictrainer SIGHTSEERM, HARI, EVENT_BEAT_SIGHTSEERM_HARI, .SeenText, .BeatenText

	text "Ich reise viel, um"
	line "jeden"
	cont "#mon-Prof. zu"
	cont "treffen."
	para "Willst du meine"
	line "Fotos sehen?"
	done

.SeenText:
	text "Hey! Ich bin hier,"
	line "um PROF. IVY zu"
	cont "treffen!"
	done

.BeatenText:
	text "Was? Du kennst sie"
	line "schon?"
	done

GenericTrainerTamerJordan:
	generictrainer TAMER, JORDAN, EVENT_BEAT_TAMER_JORDAN, .SeenText, .BeatenText

	text "Wie hast du deine"
	line "#mon so gut"
	cont "gezähmt?"

	para "Sie sind stark,"
	line "aber gleichzeitig"
	cont "ruhig."
	done

.SeenText:
	text "Vorsicht! #mon"
	line "hier können echt"
	cont "wild sein!"
	done

.BeatenText:
	text "Ach! Deine sind"
	line "wohl wilder."
	done

GenericTrainerAromaLadyPeony:
	generictrainer AROMA_LADY, PEONY, EVENT_BEAT_AROMA_LADY_PEONY, .SeenText, .BeatenText

	text "Meine Blubella"
	line "liebt es, hier auf"
	para "dieser friedlichen"
	line "Insel zu leben."
	done

.SeenText:
	text "Willst du meine"
	line "Blubella sehen?"
	done

.BeatenText:
	text "Ach… Blubella"
	line "wollte nicht"
	cont "kämpfen…"
	done

GenericTrainerGuitaristmGeddy:
	generictrainer GUITARISTM, GEDDY, EVENT_BEAT_GUITARISTM_GEDDY, .SeenText, .BeatenText

	text "Du denkst, ich"
	line "spiele Gitarre?"
	cont "Falsch!"

	para "Es ist ein"
	line "6-Saiten-Bass."
	done

.SeenText:
	text "Ich könnte mein"
	line "Leben wohl besser"
	cont "leben,"
	para "als ich denke …"
	para "Darum nennt man"
	line "mich wohl …"
	para "Man nennt mich den"
	line "Arbeiter!"
	done

.BeatenText:
	text "Guter Kampf!"
	line "Vielleicht"
	cont "schreibe ich ein"
	cont "Lied darüber."
	done

Route49SignText:
	text "ROUTE 49"
	line "Valencia-Insel"
	done
