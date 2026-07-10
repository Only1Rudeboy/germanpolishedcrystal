CeladonHotelRoom3_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  5, CELADON_HOTEL_2F, 4
	warp_event  4,  5, CELADON_HOTEL_2F, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonHotelRoom3GrampsText, -1
	itemball_event  5,  2, ROOM_SERVICE, 1, EVENT_CELADON_HOTEL_ROOM_3_ROOM_SERVICE

CeladonHotelRoom3GrampsText:
	text "Ich komme schon,"
	line "seit ich ein"
	cont "Knirps war,"
	cont "jedes Jahr in"
	cont "dieses Hotel."

	para "Es fühlt sich fast"
	line "wie ein zweites"
	cont "Zuhause an!"
	done
