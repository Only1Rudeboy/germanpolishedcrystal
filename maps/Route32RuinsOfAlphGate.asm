Route32RuinsOfAlphGate_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  0,  4, RUINS_OF_ALPH_OUTSIDE, 11
	warp_event  0,  5, RUINS_OF_ALPH_OUTSIDE, 12
	warp_event  9,  4, ROUTE_32, 2
	warp_event  9,  5, ROUTE_32, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route32RuinsOfAlphGateOfficerText, -1
	object_event  8,  2, SPRITE_HIKER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route32RuinsOfAlphGatePokefanMText, -1
	object_event  1,  6, SPRITE_CAMPER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route32RuinsOfAlphGateYoungsterText, -1

Route32RuinsOfAlphGateOfficerText:
	text "ALPH-RUINEN"

	para "Eine Besichti-"
	line "gungsstätte"
	cont "für Touristen."

	para "Versuche, die"
	line "schwenkbaren"

	para "Steintafeln"
	line "zu bewegen!"
	done


Route32RuinsOfAlphGatePokefanMText:
	text "Du untersuchst"
	line "die RUINEN?"

	para "Ich sehe einen"
	line "Wissenschaftler"
	cont "in spe."
	done


Route32RuinsOfAlphGateYoungsterText:
	text "Auf den"
	line "Steintafeln"
	cont "sind Zeichnungen."

	para "Ich versuchte, "
	line "sie zu bewegen."

	para "Ich frage mich, "
	line "was sie"
	cont "darstellen."
	done


