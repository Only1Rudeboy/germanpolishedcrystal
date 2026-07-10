FuchsiaBillSpeechHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, FUCHSIA_CITY, 3
	warp_event  3,  7, FUCHSIA_CITY, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_MATRON, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, BillsBrotherText, -1
	object_event  6,  4, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, BillsBrothersHouseYoungsterText, -1

BillsBrotherText:
	text "Mein Opa ist bei"
	line "meinem Bruder BILL"
	cont "in DUKATIA CITY."
	done

BillsBrothersHouseYoungsterText:
	text "Ich hab seltsame,"
	line "langsame #mon"
	cont "auf dem Radweg"
	cont "gesehen."
	done
