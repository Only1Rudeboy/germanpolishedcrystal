FuchsiaCity_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, FuchsiaCityFlyPoint

	def_warp_events
	warp_event  5, 13, FUCHSIA_MART, 2
	warp_event  8, 27, FUCHSIA_GYM, 1
	warp_event 11, 27, FUCHSIA_BILL_SPEECH_HOUSE, 1
	warp_event 19, 27, FUCHSIA_POKECENTER_1F, 1
	warp_event 27, 27, SAFARI_ZONE_WARDENS_HOME, 1
	warp_event 18,  3, SAFARI_ZONE_FUCHSIA_GATE, 3
	warp_event 37, 22, ROUTE_15_FUCHSIA_GATE, 1
	warp_event 37, 23, ROUTE_15_FUCHSIA_GATE, 2
	warp_event  7, 33, ROUTE_19_FUCHSIA_GATE, 1
	warp_event  8, 33, ROUTE_19_FUCHSIA_GATE, 2
	warp_event 15, 27, FUCHSIA_SAFARI_BALL_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 21, 19, BGEVENT_JUMPTEXT, FuchsiaCitySignText
	bg_event  5, 29, BGEVENT_JUMPTEXT, FuchsiaGymSignText
	bg_event 21, 15, BGEVENT_JUMPTEXT, SafariZoneOfficeSignText
	bg_event 27, 29, BGEVENT_JUMPTEXT, WardensHomeSignText
	bg_event 17,  5, BGEVENT_JUMPTEXT, SafariZoneClosedSignText
	bg_event 13, 19, BGEVENT_JUMPTEXT, NoLitteringSignText
	bg_event  7,  7, BGEVENT_JUMPTEXT, SafariZoneExhibitSignText
	bg_event 13,  7, BGEVENT_JUMPTEXT, SafariZoneExhibitSignText
	bg_event 27,  7, BGEVENT_JUMPTEXT, SafariZoneExhibitSignText
	bg_event 33,  7, BGEVENT_JUMPTEXT, SafariZoneExhibitSignText
	bg_event 31, 13, BGEVENT_JUMPTEXT, SafariZoneExhibitSignText
	bg_event  9, 15, BGEVENT_JUMPTEXT, SafariZoneExhibitSignText
	bg_event 11, 35, BGEVENT_JUMPTEXT, FuchsiaCityCarefulSwimmingSignText
	bg_event 22, 13, BGEVENT_JUMPTEXT, SafariZoneOfficeClosedSignText
	bg_event 31, 27, BGEVENT_JUMPTEXT, HouseForSaleSignText
	bg_event 26, 12, BGEVENT_ITEM + NUGGET, EVENT_FUCHSIA_CITY_HIDDEN_NUGGET

	def_object_events
	object_event 19, 17, SPRITE_CAMPER, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, FuchsiaCityYoungsterText, -1
	object_event 10,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, FuchsiaCityPokefanMText, -1
	object_event 16, 13, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, FuchsiaCityTeacherText, -1
	object_event 28,  8, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WANDER, 2, 2, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, FuchsiaCityPokefanFText, -1
	cuttree_event 16, 19, EVENT_FUCHSIA_CITY_CUT_TREE
	fruittree_event 14, 17, FRUITTREE_FUCHSIA_CITY, LIECHI_BERRY, PAL_NPC_RED

FuchsiaCityFlyPoint:
	setflag ENGINE_FLYPOINT_FUCHSIA
	endcallback

; GSC-DE Dump 6175–6183, 6586, 7178
FuchsiaCityYoungsterText:
	text "Einer der TOP VIER"
	line "war früher einmal"

	para "der ARENALEITER in"
	line "FUCHSANIA CITY."
	done

FuchsiaCityPokefanMText:
	text "KOGAs Tochter ist"
	line "jetzt ARENA-"
	cont "LEITERIN, nachdem"

	para "ihr Vater den TOP"
	line "VIER beigetreten"
	cont "ist."
	done

FuchsiaCityTeacherText:
	text "Schade, dass die"
	line "SAFARI-ZONE"

	para "geschlossen ist…"
	line "Das ist schließ-"
	cont "lich FUCHSANIAs"
	cont "Hauptattraktion."
	done

FuchsiaCityPokefanFText:
	text "Als der WÄRTER der"
	line "SAFARI-ZONE weg"
	cont "war,"

	para "gab es keinen mehr"
	line "für den Zoo."

	para "Also wurden die"
	line "#mon in die"
	cont "Wildnis entlassen."
	done

FuchsiaCitySignText:
	text "FUCHSANIA CITY"

	para "Sieh nur! Die"
	line "Rosarote"
	cont "Lieblichkeit!"
	done

FuchsiaGymSignText:
	text "PKMN-ARENA von"
	line "FUCHSANIA CITY"
	cont "LEITUNG: JANINA"

	para "Die Giftige"
	line "Ninja-Meisterin"
	done

SafariZoneOfficeSignText:
	text "Hier ist eine"
	line "Nachricht…"

	para "Bis auf weiteres"
	line "bleibt das BÜRO"

	para "der SAFARI-ZONE"
	line "geschlossen."
	done

SafariZoneOfficeClosedSignText:
	text "Es ist verriegelt…"
	done

WardensHomeSignText:
	text "SAFARI-ZONE"
	line "HAUS DES WÄRTERs"
	done

SafariZoneClosedSignText:
	text "Der WÄRTER ist"
	line "verreist. Deshalb"

	para "ist die SAFARI-"
	line "ZONE"
	cont "geschlossen."
	done

NoLitteringSignText:
	text "Verunreinigung des"
	line "Parks ist"
	cont "verboten."

	para "Hinterlasse"
	line "bitte keinen"
	cont "Abfall."
	done

SafariZoneExhibitSignText:
	text "Das Schild wurde"
	line "abgerissen…"
	done

HouseForSaleSignText:
	text "Was ist das?"

	para "Haus zu verkaufen…"
	line "Hier wohnt"
	cont "niemand."
	done

FuchsiaCityCarefulSwimmingSignText:
	text "Sei auf der Hut,"
	line "wenn du zu den"
	cont "SEESCHAUMINSELN"
	cont "schwimmst."

	para "ORDNUNGSAMT VON"
	line "FUCHSANIA CITY"
	done
