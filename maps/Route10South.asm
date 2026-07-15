Route10South_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  6,  3, ROCK_TUNNEL_1F, 2

	def_coord_events

	def_bg_events
	bg_event  5,  5, BGEVENT_JUMPTEXT, Route10SignText
	bg_event 16,  3, BGEVENT_ITEM + MAX_ETHER, EVENT_ROUTE_10_HIDDEN_MAX_ETHER

	def_object_events
	object_event 17,  5, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerHikerJim, -1
	object_event  4,  7, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerPokefanmRobert, -1
	object_event  8, 12, SPRITE_HEX_MANIAC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerHexManiacAmy, -1
	tmhmball_event  9,  7, TM_VOLT_SWITCH, EVENT_ROUTE_10_TM_VOLT_SWITCH

GenericTrainerHikerJim:
	generictrainer HIKER, JIM, EVENT_BEAT_HIKER_JIM, HikerJimSeenText, HikerJimBeatenText

	text "Ich habe"
	line "Heuschnupfen!"

	para "Hahahatschi!"
	done
GenericTrainerPokefanmRobert:
	generictrainer POKEFANM, ROBERT, EVENT_BEAT_POKEFANM_ROBERT, PokefanmRobertSeenText, PokefanmRobertBeatenText

	text "Sieh nur, was du"
	line "meinen #mon"
	cont "angetan hast…"

	para "Das werde ich dir"
	line "nie verzeihen…"
	done
GenericTrainerHexManiacAmy:
	generictrainer HEX_MANIAC, AMY, EVENT_BEAT_HEX_MANIAC_AMY, HexManiacAmySeenText, HexManiacAmyBeatenText

	text "Eine Hexe fühlt"
	line "sich wohl unter"
	cont "den Geistern…"
	done

HikerJimSeenText:
	text "Hahahah!"
	done






HikerJimBeatenText:
	text "Hahaha-hatschi!"
	done






PokefanmRobertSeenText:
	text "Du magst #mon,"
	line "nicht wahr?"

	para "Ich auch!"
	done






PokefanmRobertBeatenText:
	text "Ich gebe zu, ich"
	line "habe verloren."
	done






HexManiacAmySeenText:
	text "LAVANDIA …"
	para "Wo die Geister der"
	line "#mon schlafen …"
	done

HexManiacAmyBeatenText:
	text "Deine #mon"
	line "strahlen vor"
	cont "Vitalität…"
	done

Route10SignText:
	text "ROUTE 10"
	para "AZURIA CITY -"
	line "LAVANDIA"
	done






