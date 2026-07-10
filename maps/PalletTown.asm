PalletTown_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, PalletTownFlyPoint

	def_warp_events
	warp_event  5,  5, REDS_HOUSE_1F, 1
	warp_event 13,  5, BLUES_HOUSE_1F, 1
	warp_event 12, 11, OAKS_LAB, 1

	def_coord_events

	def_bg_events
	bg_event  7,  9, BGEVENT_JUMPTEXT, PalletTownSignText
	bg_event  3,  5, BGEVENT_JUMPTEXT, RedsHouseSignText
	bg_event 13, 13, BGEVENT_JUMPTEXT, OaksLabSignText
	bg_event 11,  5, BGEVENT_JUMPTEXT, BluesHouseSignText

	def_object_events
	object_event  3,  8, SPRITE_AROMA_LADY, SPRITEMOVEDATA_WANDER, 2, 2, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, PalletTownTeacherText, -1
	object_event 12, 14, SPRITE_FAT_GUY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, PalletTownFisherText, -1
	object_event 17,  7, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, PalletTownYoungsterText, -1
	fruittree_event 12, 21, FRUITTREE_ROUTE_21, ENIGMA_BERRY, PAL_NPC_BLACK

PalletTownFlyPoint:
	setflag ENGINE_FLYPOINT_PALLET
	endcallback

PalletTownTeacherText:
	text "Ich trainiere auch"
	line "#mon. Sie"

	para "dienen mir als"
	line "Leibwächter."
	done


PalletTownFisherText:
	text "Die Technik ist"
	line "unglaublich!"

	para "Du kannst jetzt"
	line "#mon durch die"
	cont "Zeit senden, wie"
	cont "E-Mails."
	done


PalletTownYoungsterText:
	text "Bis dann, Alter!"

	para "…So redet man hier"
	line "plötzlich,"

	para "aber wenn man's"
	line "bedenkt, ist es"
	cont "echt seltsam."
	done

PalletTownSignText:
	text "ALABASTIA"

	para "Eine Stätte des"
	line "Friedens und der"
	cont "Reinheit"
	done


RedsHouseSignText:
	text "HAUS von ROT"
	done


OaksLabSignText:
	text "PROF. EICH #mon"
	line "LABOR"
	done


BluesHouseSignText:
	text "HAUS von BLAU"
	done


