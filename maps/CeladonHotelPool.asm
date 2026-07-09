CeladonHotelPool_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 10,  7, CELADON_HOTEL_1F, 4
	warp_event 11,  7, CELADON_HOTEL_1F, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event 10,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonHotelPoolPokefanMText, -1
	object_event  4,  6, SPRITE_CHILD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonHotelPoolChildText, -1
	object_event  5,  3, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SWIM_LEFT_RIGHT, 0, 1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, CeladonHotelPoolSwimmerMScript, -1
	object_event  2,  6, SPRITE_DRAGONITE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_COPY_BG_YELLOW, OBJECTTYPE_COMMAND, jumptext, CeladonHotelPoolSwimRingText, -1
	object_event 12,  4, SPRITE_DRAGONITE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_COPY_BG_RED, OBJECTTYPE_COMMAND, jumptext, CeladonHotelPoolSwimRingText, -1

CeladonHotelPoolSwimmerMScript:
	checkevent EVENT_GOT_SAFE_GOGGLES_FROM_CELADON
	iftrue_jumptextfaceplayer .Text2
	faceplayer
	opentext
	writetext .Text1
	promptbutton
	verbosegiveitem SAFE_GOGGLES
	iffalse_endtext
	setevent EVENT_GOT_SAFE_GOGGLES_FROM_CELADON
	jumpthisopenedtext

.Text2:
	text "Das ist ein sehr"
	line "entspannendes Bad…"
	done

.Text1:
	text "Für langsames"
	line "Rückenschwimmen"
	cont "brauch ich meine"

	para "Schutzbrille nicht."
	line "Du kannst sie"
	cont "haben."
	done

CeladonHotelPoolPokefanMText:
	text "Nun, ich bin"
	line "beeindruckt."

	para "Die Anlagen"
	line "dieses Hotels sind"
	cont "unübertroffen!"
	done

CeladonHotelPoolChildText:
	text "Juhu!"
	done

CeladonHotelPoolSwimRingText:
	text "Ein Schwimmring."
	done
