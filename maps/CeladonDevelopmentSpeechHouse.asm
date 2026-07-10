CeladonDevelopmentSpeechHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, CELADON_CITY, 16
	warp_event  3,  7, CELADON_CITY, 16

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonDevelopmentSpeechHouseCooltrainermText, -1
	object_event  5,  3, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonDevelopmentSpeechHouseBeautyText, -1

CeladonDevelopmentSpeechHouseCooltrainermText:
	text "Prismania ist zu"
	line "einem beliebten"
	cont "Touristenort"

	para "geworden."

	para "Das Hotel ist"
	line "immer voll"
	cont "ausgebucht!"
	done

CeladonDevelopmentSpeechHouseBeautyText:
	text "Diese Stadt war"
	line "mal ein Zufluchts-"
	cont "ort für Team"

	para "Rocket."

	para "Ich hatte Angst,"
	line "das Haus zu"
	cont "verlassen, solange"

	para "sie hier lauerten!"
	done
