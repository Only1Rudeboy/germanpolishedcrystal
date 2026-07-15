DimCave4F_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, DimCave4FBouldersLand
	callback MAPCALLBACK_STONETABLE, DimCave4FSetUpStoneTable

	def_warp_events
	warp_event  2, 16, DIM_CAVE_5F, 2
	warp_event 27, 29, DIM_CAVE_5F, 3
	warp_event 27, 24, DIM_CAVE_5F, 4 ; hole
	warp_event  5,  5, DIM_CAVE_3F, 1
	warp_event 28, 22, DIM_CAVE_3F, 2
	warp_event 14,  7, DIM_CAVE_3F, 3

	def_coord_events

	def_bg_events
	bg_event 25, 23, BGEVENT_ITEM + CALCIUM, EVENT_DIM_CAVE_4F_HIDDEN_CALCIUM
	bg_event 27, 27, BGEVENT_ITEM + X_ATTACK, EVENT_DIM_CAVE_4F_HIDDEN_X_ATTACK

	def_object_events
	strengthboulder_event 14, 15, EVENT_BOULDER_IN_DIM_CAVE_4F
	object_event 27, 25, SPRITE_BOULDER_ROCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptext, DimCaveFallenBoulderText, EVENT_BOULDER_FELL_IN_DIM_CAVE_4F
	object_event  5, 14, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 0, GenericTrainerScientistJoseph, -1
	object_event 12,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerScientistNigel, -1
	object_event 22, 17, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, DimCave4FSuper_nerdText, -1
	itemball_event 17,  2, MAX_ETHER, 1, EVENT_DIM_CAVE_4F_MAX_ETHER
	itemball_event 27,  8, NUGGET, 1, EVENT_DIM_CAVE_4F_NUGGET
	itemball_event  6, 23, FULL_RESTORE, 1, EVENT_DIM_CAVE_4F_FULL_RESTORE

	object_const_def
	const DIMCAVE4F_BOULDER

DimCave4FBouldersLand:
	checkevent EVENT_BOULDER_FELL_IN_DIM_CAVE_4F
	iftruefwd .skip
	changeblock 26, 24, $c9
	changeblock 4, 24, $b9
.skip
	endcallback

DimCave4FSetUpStoneTable:
	usestonetable .StoneTable
	endcallback

.StoneTable:
	stonetable 6, DIMCAVE4F_BOULDER, .Boulder
	db -1 ; end

.Boulder:
	disappear DIMCAVE4F_BOULDER
	clearevent EVENT_BOULDER_FELL_IN_DIM_CAVE_3F
	pause 30
	playsound SFX_STRENGTH
	earthquake 80
	jumpthistext

	text "Der Fels ist"
	line "heruntergefallen."
	done
GenericTrainerScientistJoseph:
	generictrainer SCIENTIST, JOSEPH, EVENT_BEAT_SCIENTIST_JOSEPH, .SeenText, .BeatenText

	text "Unterirdisches"
	line "Wasser hinterlässt"
	cont "Mineralien."
	para "Menschen bauen sie"
	line "ab, und Mikroben"
	cont "fressen sie."
	done

.SeenText:
	text "Ich erforsche die"
	line "alten Mikroben"

	para "in diesen Felsen."
	done

.BeatenText:
	text "Es tut gut, aus"
	line "dem Labor"
	cont "rauszukommen und"
	cont "Feldarbeit zu"
	cont "machen."
	done

GenericTrainerScientistNigel:
	generictrainer SCIENTIST, NIGEL, EVENT_BEAT_SCIENTIST_NIGEL, .SeenText, .BeatenText

	text "Das fließende"
	line "Wasser treibt ein"
	cont "Wasserrad"
	para "an und versorgt"
	line "Generatoren,"
	para "die"
	line "Bewegungsenergie"
	cont "in Strom"
	cont "umwandeln."
	para "Faszinierend,"
	line "oder?"
	done

.SeenText:
	text "Wie gewinnt man"
	line "Energie aus"
	cont "Wasser?"

	para "Ich verrate es"
	line "dir, wenn du mich"
	cont "besiegst."
	done

.BeatenText:
	text "Autsch! O.K., ich"
	line "verrate es dir."
	done

DimCave4FSuper_nerdText:
	text "Ich laufe die"
	line "Schienen entlang,"
	para "genau wie im Film!"
	para "… Nur dass ich in"
	line "einer Höhle bin …"
	cont "ganz allein …"
	para "… Das macht keinen"
	line "Spaß mehr."
	done
