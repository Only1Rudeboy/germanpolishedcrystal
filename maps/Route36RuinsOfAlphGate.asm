Route36RuinsOfAlphGate_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4,  0, ROUTE_36, 3
	warp_event  5,  0, ROUTE_36, 4
	warp_event  4,  7, RUINS_OF_ALPH_OUTSIDE, 10
	warp_event  5,  7, RUINS_OF_ALPH_OUTSIDE, 10

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route36RuinsOfAlphGateOfficerText, -1
	object_event  7,  5, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 2, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route36RuinsOfAlphGateGrampsText, -1

Route36RuinsOfAlphGateOfficerText:
	; GSC-DE Dump
	text "Fragst du dich"
	line "nicht, wer so"
	cont "etwas tun sollte"
	cont "und warum?"
	done

Route36RuinsOfAlphGateGrampsText:
	; GSC-DE Dump
	text "Hast du diesen"
	line "merkwürdigen Baum"
	para "auf der Straße"
	line "gesehen?"
	para "Das könnte"
	line "erklären, weshalb"
	para "immer weniger"
	line "Menschen die"
	para "ALPH-RUINEN"
	line "besuchen."
	done
