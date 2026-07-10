EcruteakLugiaSpeechHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  7, ECRUTEAK_CITY, 7
	warp_event  4,  7, ECRUTEAK_CITY, 7

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_JUMPSTD, radio2

	def_object_events
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakLugiaSpeechHouseGrampsText, -1
	object_event  5,  4, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakLugiaSpeechHouseYoungsterText, -1

EcruteakLugiaSpeechHouseGrampsText:
	text "Dies geschah, als"
	line "ich jung war."

	para "Der Himmel färbte"
	line "sich schwarz. Ein"

	para "riesiges,"
	line "fliegendes #mon"

	para "verdunkelte die"
	line "Sonne."

	para "Ich frage mich,"
	line "was das für ein"

	para "#mon war. Es"
	line "war wie ein Vogel"
	cont "und ein Drache."
	done


EcruteakLugiaSpeechHouseYoungsterText:
	text "Ob es wirklich ein"
	line "so großes #mon"

	para "gibt? Wenn ja, so"
	line "muss es unfassbar"
	cont "mächtig sein."
	done


