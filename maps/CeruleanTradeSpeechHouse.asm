CeruleanTradeSpeechHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, CERULEAN_CITY, 3
	warp_event  3,  7, CERULEAN_CITY, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeruleanTradeSpeechHouseGrannyText, -1
	object_event  3,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeruleanTradeSpeechHouseGrampsText, -1
	pokemon_event  6,  2, POLIWRATH, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BLUE, CeruleanTradeSpeechHouseRhydonText, -1
	pokemon_event  5,  6, IVYSAUR, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_TEAL, CeruleanTradeSpeechHouseZubatText, -1

CeruleanTradeSpeechHouseGrannyText:
	text "Mein Mann ist"
	line "glücklich mit den"
	cont "#mon, die er im"
	cont "Tausch erhalten"
	cont "hat."
	done


CeruleanTradeSpeechHouseGrampsText:
	text "Ach… Ich bin so"
	line "glücklich…"
	done


CeruleanTradeSpeechHouseRhydonText:
	text "KANGAMA: Gamu"
	line "gamu."
	done


CeruleanTradeSpeechHouseZubatText:
	text "ZUBAT: Zuba zuba."
	done


