CherrygroveGymSpeechHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, CHERRYGROVE_CITY, 3
	warp_event  3,  7, CHERRYGROVE_CITY, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CherrygroveGymSpeechHousePokefanMText, -1
	object_event  5,  5, SPRITE_CHILD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CherrygroveGymSpeechHouseBugCatcherText, -1

CherrygroveGymSpeechHousePokefanMText:
	text "Möchtest du"
	line "herausfinden, wie"

	para "gut du als #-"
	line "MON-Trainer bist?"

	para "Dann solltest du"
	line "alle #mon ARE-"
	cont "NEN in JOHTO"
	cont "aufsuchen und"
	cont "ORDEN sammeln."
	done


CherrygroveGymSpeechHouseBugCatcherText:
	text "Wenn ich älter"
	line "bin, werde ich"
	cont "auch ein ARENA-"
	cont "LEITER!"

	para "Ich werde meine"
	line "#mon gegen"

	para "die meiner Freunde"
	line "antreten lassen,"

	para "damit sie stärker"
	line "werden!"
	done


