CeladonMansionRoof_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  1,  1, CELADON_MANSION_3F, 1
	warp_event  6,  1, CELADON_MANSION_3F, 4
	warp_event  2,  5, CELADON_MANSION_ROOF_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event  6,  1, BGEVENT_LEFT, MapCeladonMansionRoofSignpost0Script

	def_object_events
	object_event  7,  5, SPRITE_FAT_GUY, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonMansionRoofFisherText, -1

MapCeladonMansionRoofSignpost0Script:
	jumpthistext

	; GSC-DE Dump
	text "Da ist ein Graffi-"
	line "ti an der Wand…"
	para "<PLAYER> fügte"
	line "einen Schnurrbart"
	cont "hinzu!"
	done

CeladonMansionRoofFisherText:
	; GSC-DE Dump
	text "Hohe Orte - Ich"
	line "liebe sie sehr!"
	para "Ich sage immer, es"
	line "gibt nur eine"
	para "Sache, welche die"
	line "Höhe so sehr"
	para "liebt, wie ich:"
	line "Rauch!"
	done
