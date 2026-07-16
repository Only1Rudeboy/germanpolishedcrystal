PewterSnoozeSpeechHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, PEWTER_CITY, 5
	warp_event  3,  7, PEWTER_CITY, 5

	def_coord_events

	def_bg_events
	bg_event  7,  1, BGEVENT_JUMPSTD, picturebookshelf

	def_object_events
	object_event  5,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, PewterSnoozeSpeechHouseGrampsText, -1
	object_event  2,  4, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, PewterSnoozeSpeechHouseGrannyText, -1

PewterSnoozeSpeechHouseGrampsText:
	; GSC-DE Dump
	text "Ich mache gerne"
	line "ein Nickerchen,"
	cont "während das Radio"
	cont "läuft…"
	cont "…Zzzz…"
	done

PewterSnoozeSpeechHouseGrannyText:
	; PC-only
	text "ROCKO ist das"
	line "älteste von zehn"
	cont "Kindern."
	para "Keine Ahnung, wie"
	line "seine Eltern das"
	cont "geschafft haben!"
	done
