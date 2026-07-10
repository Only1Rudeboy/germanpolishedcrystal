Route2North_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 15, 19, ROUTE_2_NUGGET_SPEECH_HOUSE, 1
	warp_event 16, 35, ROUTE_2_GATE, 1
	warp_event 17, 35, ROUTE_2_GATE, 2
	warp_event 12,  9, DIGLETTS_CAVE, 3
	warp_event  1, 11, VIRIDIAN_FOREST_PEWTER_GATE, 3
	warp_event  2, 11, VIRIDIAN_FOREST_PEWTER_GATE, 4

	def_coord_events

	def_bg_events
	bg_event 11, 11, BGEVENT_JUMPTEXT, Route2DiglettsCaveSignText

	def_object_events
	object_event  6,  6, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBug_maniacEd, -1
	itemball_event 19,  4, CARBOS, 1, EVENT_ROUTE_2_CARBOS
	fruittree_event  7, 13, FRUITTREE_ROUTE_2, LUM_BERRY, PAL_NPC_GREEN
	cuttree_event  5, 10, EVENT_ROUTE_2_CUT_TREE_1
	cuttree_event 15, 22, EVENT_ROUTE_2_CUT_TREE_2
	object_event 12, 10, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route2NorthCooltrainermText, EVENT_VERMILION_CITY_SNORLAX

GenericTrainerBug_maniacEd:
	generictrainer BUG_MANIAC, ED, EVENT_BEAT_BUG_MANIAC_ED, Bug_maniacEdSeenText, Bug_maniacEdBeatenText

	text "Sie stechen, wenn"
	line "du ein Bad nimmst."
	done
Bug_maniacEdSeenText:
	text "Wenn du mit Shorts"
	line "in hohem Gras"

	para "läufst, bekommst"
	line "du dann Schrammen"
	cont "an deinen Beinen?"
	done
Bug_maniacEdBeatenText:
	text "Au, Aua, Aua!"
	done
Route2NorthCooltrainermText:
	text "DIGDAs HOEHLE ist"
	line "eine Sackgasse."

	para "Der Ausgang nach"
	line "ORANIA CITY ist"
	cont "blockiert"

	para "von einem"
	line "schlafenden"
	cont "Relaxo."
	done

Route2DiglettsCaveSignText:
	text "DIGDAs HOEHLE"
	done
