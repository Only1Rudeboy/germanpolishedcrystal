MahoganyRedGyaradosSpeechHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, MAHOGANY_TOWN, 2
	warp_event  3,  7, MAHOGANY_TOWN, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, MahoganyRedGyaradosSpeechHouseBlackBeltText, -1
	object_event  6,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MahoganyRedGyaradosSpeechHouseTeacherScript, -1

MahoganyRedGyaradosSpeechHouseTeacherScript:
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue_jumptextfaceplayer MahoganyRedGyaradosSpeechHouseTeacherText_RocketsInRadioTower
	jumpthistextfaceplayer

	text "Mein Lieblings-"
	line "Radioprogramm? Ich"
	cont "würde sagen"
	cont "#mon-Musik."
	done


MahoganyRedGyaradosSpeechHouseBlackBeltText:
	text "Ich hörte, dass"
	line "ein rotes GARADOS"

	para "am SEE erschienen"
	line "sein soll."

	para "Das ist seltsam,"
	line "da schon normale"

	para "GARADOS in diesem"
	line "See sehr selten"

	para "sind…"
	done



MahoganyRedGyaradosSpeechHouseTeacherText_RocketsInRadioTower:
	text "Ich habe Gelächter"
	line "im Radio gehört …"
	para "Das war"
	line "unheimlich."
	done



