EcruteakCity_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, EcruteakCityFlyPoint

	def_warp_events
	warp_event 35, 26, ROUTE_42_ECRUTEAK_GATE, 1
	warp_event 35, 27, ROUTE_42_ECRUTEAK_GATE, 2
	warp_event 23, 11, ECRUTEAK_HOUSE, 1
	warp_event 17,  9, ECRUTEAK_SHRINE_OUTSIDE, 3
	warp_event 18,  9, ECRUTEAK_SHRINE_OUTSIDE, 4
	warp_event 23, 27, ECRUTEAK_POKECENTER_1F, 1
	warp_event  5, 21, ECRUTEAK_LUGIA_SPEECH_HOUSE, 1
	warp_event 23, 21, DANCE_THEATRE, 1
	warp_event 29, 21, ECRUTEAK_MART, 2
	warp_event  6, 27, ECRUTEAK_GYM, 1
	warp_event 13, 27, ECRUTEAK_ITEMFINDER_HOUSE, 1
	warp_event  5, 17, VALERIES_HOUSE, 1
	warp_event  5,  5, BURNED_TOWER_1F, 1
	warp_event  0, 18, ROUTE_38_ECRUTEAK_GATE, 3
	warp_event  0, 19, ROUTE_38_ECRUTEAK_GATE, 4
	warp_event 29, 27, ECRUTEAK_CHERISH_BALL_HOUSE, 1
	warp_event 13, 17, ECRUTEAK_DESTINY_KNOT_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 15, 21, BGEVENT_JUMPTEXT, EcruteakCitySign
	bg_event  8, 28, BGEVENT_JUMPTEXT, EcruteakGymSign
	bg_event 21, 21, BGEVENT_JUMPTEXT, EcruteakDanceTheaterSign
	bg_event  7,  9, BGEVENT_JUMPTEXT, BurnedTowerSign
	bg_event 15, 11, BGEVENT_JUMPTEXT, EcruteakShrineSign
	bg_event 21, 11, BGEVENT_JUMPTEXT, EcruteakBarrierStationSign
	bg_event 21, 26, BGEVENT_JUMPTEXT, EcruteakCityAdvancedTips
	bg_event 25, 14, BGEVENT_ITEM + HYPER_POTION, EVENT_ECRUTEAK_CITY_HIDDEN_HYPER_POTION
	bg_event 33, 16, BGEVENT_ITEM + RARE_CANDY, EVENT_ECRUTEAK_CITY_HIDDEN_RARE_CANDY
	bg_event  1, 17, BGEVENT_ITEM + ULTRA_BALL, EVENT_ECRUTEAK_CITY_HIDDEN_ULTRA_BALL
	bg_event  6,  6, BGEVENT_ITEM + ETHER, EVENT_ECRUTEAK_CITY_HIDDEN_ETHER

	def_object_events
	object_event 20, 15, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakCityGramps1Text, -1
	object_event 20, 21, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakCityGramps2Text, -1
	object_event 19, 26, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakCityLass1Text, -1
	object_event  8, 10, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakCityLass2Script, -1
	object_event  9, 22, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakCityFisherScript, -1
	object_event 11, 16, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakCityYoungsterText, -1
	object_event  3, 10, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakCityGramps3Text, EVENT_ECRUTEAK_CITY_GRAMPS
	object_event 11, 11, SPRITE_HEX_MANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, (1 << EVE) | (1 << NITE), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakCityHexManiacText, -1
	object_event 11, 11, SPRITE_SIGHTSEER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, (1 << MORN) | (1 << DAY), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakCitySightseerMText, -1
	pokemon_event 12, 11, SMEARGLE, SPRITEMOVEDATA_POKEMON, (1 << MORN) | (1 << DAY), PAL_MON_BROWN, EcruteakCitySmeargleText, -1
	object_event 16,  9, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_ARCH_TREE_LEFT, 0, 0, -1, PAL_NPC_COPY_BG_GREEN, OBJECTTYPE_COMMAND, end, NULL, -1
	object_event 19,  9, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_ARCH_TREE_RIGHT, 0, 0, -1, PAL_NPC_COPY_BG_GREEN, OBJECTTYPE_COMMAND, end, NULL, -1

EcruteakCityFlyPoint:
	setflag ENGINE_FLYPOINT_ECRUTEAK
	endcallback

EcruteakCityLass2Script:
	checkevent EVENT_RELEASED_THE_BEASTS
	iftrue_jumptextfaceplayer EcruteakCityLass2Text_ReleasedBeasts
	jumpthistextfaceplayer

	text "Der Turm, der"
	line "hier mal stand…"

	para "Meine Oma sagte,"
	line "er war früher"
	cont "viel höher."
	done

EcruteakCityFisherScript:
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iftrue_jumptextfaceplayer EcruteakCityFisherText_JasmineReturned
	jumpthistextfaceplayer

	text "Ich hörte ein"
	line "Gerücht über den"
	cont "LEUCHTTURM von"
	cont "OLIVIANA CITY."

	para "Das #mon, das"
	line "als Leuchtfeuer"

	para "dient, ist"
	line "erkrankt. Klingt"
	cont "nach Ärger."
	done

EcruteakCityGramps1Text:
	text "Es gab zwei Türme"
	line "in TEAK CITY. Ei-"
	cont "nen im Osten, ei-"
	cont "nen im Westen."
	done






EcruteakCityGramps2Text:
	text "Na, Kröte?"
	line "Hast du gelernt"
	cont "zu"

	para "tanzen wie die"
	line "KIMONO-GIRLS?"

	para "Ich habe gehört,"
	line "dass dir ein ei-"
	cont "genartiger Mann"
	cont "etwas Nettes"
	cont "geben"

	para "wird, wenn du zu"
	line "ihrem TANZTHEATER"
	cont "gehst."
	done






EcruteakCityLass1Text:
	text "Ich möchte im"
	line "TANZ-"
	line "THEATER üben."

	para "Kommst du mit?"
	done






EcruteakCityHexManiacText:
	text "Geister von #mon"
	line "spuken hier…"
	done

EcruteakCitySightseerMText:
	text "Ecruteak hat eine"
	line "unheimliche"
	cont "Geschichte."

	para "Smeargle und ich"
	line "sind hergekommen,"
	cont "um sie zu"
	cont "zeichnen."
	done

EcruteakCitySmeargleText:
	text "Smeargle: Smeer!"
	done


EcruteakCityLass2Text_ReleasedBeasts:
	text "Drei große #mon"
	line "sind in verschie-"
	cont "dene Richtungen"
	cont "davongelaufen!"
	cont "Was"
	cont "waren das für"
	cont "welche?"
	done






EcruteakCityFisherText_JasmineReturned:
	text "Das #mon im"
	line "LEUCHTTURM von"
	cont "OLIVIANA CITY"
	cont "wur-"
	cont "de geheilt."

	para "Jetzt können die"
	line "Schiffe wieder"
	cont "ge-"
	cont "fahrlos nachts in"
	cont "See stechen."
	done






EcruteakCityYoungsterText:
	text "Ich hörte, dass"
	line "#mon am SEE DES"

	para "ZORNS Unruhe"
	line "stif-"
	line "ten. Das würde"
	cont "ich"
	cont "gerne sehen."
	done






EcruteakCityGramps3Text:
	text "Vor langer Zeit…"

	para "Dieser Turm ist"
	line "abgebrannt. Drei"

	para "namenlose #mon"
	line "sind dabei"
	cont "umgekommen."

	para "Ein regenbogen-"
	line "farbenes #mon"

	para "kam herab und"
	line "hauchte ihnen"
	cont "wie-"
	cont "der Leben ein…"

	para "Diese Legende"
	line "wird"
	line "von jedem LEITER"

	para "der #mon-ARENA"
	line "von"
	line "TEAK CITY an den"

	para "nächsten"
	line "weitergegeben."

	para "Ich?"

	para "Damals war ich"
	line "ein Trainer."
	cont "Hohoho!"
	done






EcruteakCitySign:
	text "TEAK CITY"
	line "Eine historische"

	para "Stadt, wo Vergan-"
	line "genheit und"
	cont "Gegen-"
	cont "wart aufeinander-"
	cont "treffen"
	done
EcruteakGymSign:
	text "PKMN-ARENA von"
	line "TEAK CITY"
	cont "LEITUNG: JENS"

	para "Der mystische Se-"
	line "her der Zukunft"
	done
EcruteakCityAdvancedTips:
	text "Profi-Tipps!"

	para "Manche #mon, die"
	line "du triffst, haben"

	para "eine seltene"
	line "Fähigkeit, auch"

	para "versteckte Fähig-"
	line "keit genannt!"

	para "Ein geschlüpftes"
	line "#mon hat auch"

	para "eine geringe"
	line "Chance auf eine"
	cont "versteckte Fähig-"
	cont "keit."
	done

EcruteakDanceTheaterSign:
	text "TANZTHEATER VON"
	line "TEAK CITY"
	done
BurnedTowerSign:
	text "TURMRUINE"

	para "Er wurde durch"
	line "ein"
	line "mysteriöses Feuer"
	cont "zerstört."

	para "Bitte nicht"
	line "betre-"
	line "ten!"
	done
EcruteakShrineSign:
	text "Ecruteak-Schrein"

	para "“Das Leben ist"
	line "eine Lampe vor"
	cont "dem Wind.”"
	done

EcruteakBarrierStationSign:
	text "Barrierenstation"
	line "zum Glockenturm"

	para "Unwürdigen ist"
	line "der Zutritt"
	cont "verboten!"
	done
