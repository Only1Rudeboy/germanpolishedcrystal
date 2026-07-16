Route2South_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 19,  3, ROUTE_2_GATE, 3
	warp_event  9,  7, VIRIDIAN_FOREST_VIRIDIAN_GATE, 3

	def_coord_events

	def_bg_events
	bg_event  9, 29, BGEVENT_JUMPTEXT, Route2SignText

	def_object_events
	object_event 14, 23, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerBug_maniacRob, -1
	object_event  4, 16, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBug_maniacDoug, -1
	itemball_event 18, 30, ELIXIR, 1, EVENT_ROUTE_2_ELIXIR
	cuttree_event 15, 16, EVENT_ROUTE_2_CUT_TREE_3
	cuttree_event 16, 24, EVENT_ROUTE_2_CUT_TREE_4
	cuttree_event 16, 30, EVENT_ROUTE_2_CUT_TREE_5

GenericTrainerBug_maniacRob:
	generictrainer BUG_MANIAC, ROB, EVENT_BEAT_BUG_MANIAC_ROB, Bug_maniacRobSeenText, Bug_maniacRobBeatenText

	; GSC-DE Dump 7085
	text "Ich werde mir"
	line "stärkere Käfer-"
	cont "#MON suchen."
	done
GenericTrainerBug_maniacDoug:
	generictrainer BUG_MANIAC, DOUG, EVENT_BEAT_BUG_MANIAC_DOUG, Bug_maniacDougSeenText, Bug_maniacDougBeatenText

	; GSC-DE Dump 7091
	text "Käfer-#MON"
	line "zischen wie"
	para "Plüschtiere, wenn"
	line "du sie auf den"
	cont "Bauch drückst."
	para "Ich mag das"
	line "Gefühl!"
	done
Bug_maniacRobSeenText:
	; GSC-DE Dump 7083
	text "Meine Käfer-#MON"
	line "sind zäh. Du"
	cont "wirst verlieren!"
	done
Bug_maniacRobBeatenText:
	; GSC-DE Dump 7084
	text "Ich wurde"
	line "vermöbelt…"
	done
Bug_maniacDougSeenText:
	; GSC-DE Dump 7089
	text "Warum mögen"
	line "Mädchen keine"
	cont "Käfer-#MON?"
	done
Bug_maniacDougBeatenText:
	; GSC-DE Dump 7090
	text "Sinnlos!"
	done
Route2SignText:
	; GSC-DE Dump 7092
	text "ROUTE 2"
	para "VERTANIA CITY -"
	line "MARMORIA CITY"
	done
