VioletNicknameSpeechHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  7, VIOLET_CITY, 4
	warp_event  4,  7, VIOLET_CITY, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletNicknameSpeechHouseTeacherText, -1
	object_event  6,  4, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletNicknameSpeechHouseLassText, -1
	object_event  5,  2, SPRITE_EEVEE, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, VioletNicknameSpeechHouseBirdScript, -1
	object_event  0,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, (1 << EVE) | (1 << NITE), PAL_NPC_PURPLE, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletNicknameSpeechHouseGrampsText, -1

VioletNicknameSpeechHouseBirdScript:
	faceplayer
	showcrytext VioletNicknameSpeechHouseBirdText, EEVEE
	end

VioletNicknameSpeechHouseTeacherText:
	text "Sie verwendet die"
	line "Namen ihrer"
	cont "Lieblingsspeisen,"
	para "als Spitznamen für"
	line "ihre #mon,"
	cont "meine ich."
	done






VioletNicknameSpeechHouseLassText:
	text "Ich nenne mein"
	line "TAUBSI ERDBEERE!"
	done






VioletNicknameSpeechHouseGrampsText:
	; PC-Flavor, Orden-Name dump-konsistent
	text "Der FLÜGELORDEN"
	line "ist nach einem"
	cont "alten Gott des"
	para "Westwinds benannt."
	line "Passend für eine"
	cont "Flug-ARENA."
	done

VioletNicknameSpeechHouseBirdText:
	text "ERDBEERE: Taubsii!"
	done






