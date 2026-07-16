Route9_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event 21,  7, BGEVENT_JUMPTEXT, Route9SignText
	bg_event 51, 15, BGEVENT_ITEM + ETHER, EVENT_ROUTE_9_HIDDEN_ETHER
	bg_event 42, 12, BGEVENT_ITEM + SOFT_SAND, EVENT_ROUTE_9_HIDDEN_SOFT_SAND
	bg_event 39,  3, BGEVENT_JUMPTEXT, Route9AdvancedTipsSignText

	def_object_events
	object_event 25, 11, SPRITE_CAMPER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerCamperDean, -1
	object_event 43,  8, SPRITE_PICNICKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerPicnickerHeidi, -1
	object_event 15,  4, SPRITE_CAMPER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerCamperSid, -1
	object_event 16, 15, SPRITE_PICNICKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerPicnickerEdna, -1
	object_event 34,  3, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerHikerTim, -1
	object_event 44, 15, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerHikerSidney, -1
	itemball_event 26,  2, MAX_POTION, 1, EVENT_ROUTE_9_MAX_POTION
	tmhmball_event 45,  2, TM_FLASH_CANNON, EVENT_ROUTE_9_TM_FLASH_CANNON
	cuttree_event  4,  8, EVENT_ROUTE_9_CUT_TREE

GenericTrainerCamperDean:
	generictrainer CAMPER, DEAN, EVENT_BEAT_CAMPER_DEAN, CamperDeanSeenText, CamperDeanBeatenText

	; GSC-DE Dump 7049
	text "Meine #mon"
	line "wurden verletzt,"

	para "obwohl ich den"
	line "FELSTUNNEL noch"
	cont "nicht betreten"
	cont "hatte."

	para "Ich bringe sie"
	line "besser sofort in"
	cont "ein #mon-"
	cont "CENTER."
	done
GenericTrainerPicnickerHeidi:
	generictrainer PICNICKER, HEIDI, EVENT_BEAT_PICNICKER_HEIDI, PicnickerHeidiSeenText, PicnickerHeidiBeatenText

	; GSC-DE Dump 7052
	text "Wir backen viele"
	line "gute Sachen, die"

	para "wir mit allen"
	line "teilen. Sie"
	cont "schmecken lecker!"
	done
GenericTrainerCamperSid:
	generictrainer CAMPER, SID, EVENT_BEAT_CAMPER_SID, CamperSidSeenText, CamperSidBeatenText

	; GSC-DE Dump 7055
	text "Entschuldige!"
	line "Ich habe mich"
	cont "geirrt."
	done
GenericTrainerPicnickerEdna:
	generictrainer PICNICKER, EDNA, EVENT_BEAT_PICNICKER_EDNA, PicnickerEdnaSeenText, PicnickerEdnaBeatenText

	; GSC-DE Dump 7058
	text "Energiesparen ist"
	line "wichtig, aber die"

	para "Natur ist noch"
	line "viel wichtiger."
	done
GenericTrainerHikerTim:
	generictrainer HIKER, TIM, EVENT_BEAT_HIKER_TIM, HikerTimSeenText, HikerTimBeatenText

	; GSC-DE Dump 7061
	text "Bei Kämpfen spielt"
	line "Konzentration eine"
	cont "wichtige Rolle."
	done
GenericTrainerHikerSidney:
	generictrainer HIKER, SIDNEY, EVENT_BEAT_HIKER_SIDNEY, HikerSidneySeenText, HikerSidneyBeatenText

	; GSC-DE Dump 7064
	text "Du musst einen"
	line "kleinen Fluss"
	cont "durchqueren, um"
	cont "zum KRAFTWERK"
	cont "zu gelangen."
	done
CamperDeanSeenText:
	; GSC-DE Dump 7047
	text "Ich möchte den"
	line "FELSTUNNEL"
	cont "erforschen."
	done





CamperDeanBeatenText:
	; GSC-DE Dump 7048
	text "Boah! Vorsicht!"
	done





PicnickerHeidiSeenText:
	; GSC-DE Dump 7050
	text "Warst du schon"
	line "beim Picknicken?"

	para "Das macht großen"
	line "Spaß!"
	done





PicnickerHeidiBeatenText:
	; GSC-DE Dump 7051
	text "Ohhhh!"
	done





CamperSidSeenText:
	; GSC-DE Dump 7053
	text "Hey, du Lump!"
	line "Wirf deinen Müll"
	cont "nicht hier hin!"
	done





CamperSidBeatenText:
	; GSC-DE Dump 7054
	text "Ich wollte nur"
	line "klarstellen, dass…"
	done





PicnickerEdnaSeenText:
	; GSC-DE Dump 7056
	text "Die Leute sollten"
	line "ihren Müll nicht"
	cont "hier liegen"
	cont "lassen."
	done





PicnickerEdnaBeatenText:
	; GSC-DE Dump 7057
	text "Ohh… Ich habe"
	line "verloren…"
	done





HikerTimSeenText:
	; GSC-DE Dump 7059
	text "Wenn sie kommt,"
	line "kommt sie vom"
	cont "SILBERBERG…"

	para "Der SILBERBERG ist"
	line "in JOHTO, oder?"
	done





HikerTimBeatenText:
	; GSC-DE Dump 7060
	text "Ich war zu sehr"
	line "mit Singen"
	cont "beschäftigt…"
	done





HikerSidneySeenText:
	; GSC-DE Dump 7062
	text "Ich verrate dir"
	line "ein Geheimnis."

	para "Aber zuerst müssen"
	line "wir kämpfen!"
	done





HikerSidneyBeatenText:
	; GSC-DE Dump 7063
	text "Oh, Mist!"
	line "Ich habe verloren…"
	done





Route9SignText:
	; GSC-DE Dump 7065
	text "ROUTE 9"

	para "AZURIA CITY -"
	line "FELSTUNNEL"
	done





Route9AdvancedTipsSignText:
	text "Profi-Tipps!"
	para "Ein #mon mit"
	line "einem Toxik-Orb"
	cont "wird vergiftet,"
	para "eines mit einem"
	line "Heiß-Orb"
	cont "verbrannt."
	para "Aber die Fähigkeit"
	line "Adrenalin"
	para "macht das zum"
	line "Vorteil und stärkt"
	cont "Angriff!"
	done
