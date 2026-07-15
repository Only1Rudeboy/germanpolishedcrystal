Route30BerrySpeechHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, ROUTE_30, 1
	warp_event  3,  7, ROUTE_30, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route30BerryHousePokefanMScript, -1

Route30BerryHousePokefanMScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_MULCH_FROM_ROUTE_30_HOUSE
	iftruefwd .GotMulch
	writetext Route30BerrySpeechHouseMonEatBerriesText
	promptbutton
	verbosegiveitem MULCH
	iffalse_endtext
	setevent EVENT_GOT_MULCH_FROM_ROUTE_30_HOUSE
.GotMulch:
	jumpthisopenedtext

	text "Ich kaufe"
	line "erstklassigen"
	cont "Dünger in Dukatia"
	cont "City."
	done

Route30BerrySpeechHouseMonEatBerriesText:
	text "Weißt du, #mon"
	line "essen Beeren."
	para "Nach dem Pflücken"
	line "brauchen sie Zeit,"
	cont "um nachzuwachsen,"
	para "aber Dünger auf"
	line "dem Boden"
	cont "beschleunigt das!"
	para "Hier, ich teile"
	line "etwas mit dir!"
	done
