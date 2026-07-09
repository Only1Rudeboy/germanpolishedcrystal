CeruleanPoliceStation_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, CERULEAN_CITY, 2
	warp_event  3,  7, CERULEAN_CITY, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeruleanPoliceStationFishingGuruText, -1
	object_event  5,  4, SPRITE_MATRON, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeruleanPoliceStationPokefanFText, -1
	pokemon_event  3,  5, DIGLETT, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BROWN, CeruleanDiglettText, -1

CeruleanPoliceStationFishingGuruText:
	text "Ich habe gehört,"
	line "dass ein"
	cont "zwielich-"
	cont "tiger Typ herum-"
	cont "schleichen soll."

	para "Ich werde nicht"
	line "still halten,"
	cont "wenn"
	cont "sich"
	cont "herausstellt,"
	cont "dass er ein"
	cont "Dieb ist."
	done


CeruleanPoliceStationPokefanFText:
	text "Wir wurden von"
	line "Räubern"
	cont "aufgehalten."
	done


CeruleanDiglettText:
	text "DIGDA: Dig, Dig."
	done


