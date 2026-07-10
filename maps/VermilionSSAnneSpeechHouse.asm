VermilionSSAnneSpeechHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, VERMILION_CITY, 14
	warp_event  3,  7, VERMILION_CITY, 14

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, VermilionSSAnneSpeechHouseGrampsText, -1
	object_event  5,  4, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_COMMAND, jumptextfaceplayer, VermilionSSAnneSpeechHouseBeautyText, -1

VermilionSSAnneSpeechHouseGrampsText:
	text "Einmal im Jahr"
	line "legte ein"

	para "Kreuzfahrtschiff,"
	line "die M.S. Anne, in"

	para "ORANIA CITY an."

	para "Bis eines Jahres"
	line "eine Tragödie"

	para "eintrat."

	para "Etwas ging schief"
	line "und das Schiff"

	para "versank tief im"
	line "Meer — für immer"
	cont "verschwunden."
	done

VermilionSSAnneSpeechHouseBeautyText:
	text "Ich hab ein Modell"
	line "der M.S. Anne"

	para "in einem"
	line "Ozeanmuseum weit"
	cont "weg gesehen."
	done
