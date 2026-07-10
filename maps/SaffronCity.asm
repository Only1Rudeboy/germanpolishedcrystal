SaffronCity_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, SaffronCityFlyPoint

	def_warp_events
	warp_event 28,  3, FIGHTING_DOJO, 1
	warp_event 34,  3, SAFFRON_GYM, 1
	warp_event 27, 11, SAFFRON_MART, 2
	warp_event  9, 29, SAFFRON_POKECENTER_1F, 1
	warp_event 29, 29, MR_PSYCHICS_HOUSE, 1
	warp_event  6,  3, SAFFRON_TRAIN_STATION, 2
	warp_event 19, 21, SILPH_CO_1F, 1
	warp_event  9, 11, COPYCATS_HOUSE_1F, 1
	warp_event 18,  1, ROUTE_5_SAFFRON_CITY_GATE, 3
	warp_event  0, 18, ROUTE_7_SAFFRON_GATE, 3
	warp_event  0, 19, ROUTE_7_SAFFRON_GATE, 4
	warp_event 16, 35, ROUTE_6_SAFFRON_GATE, 1
	warp_event 17, 35, ROUTE_6_SAFFRON_GATE, 2
	warp_event 39, 18, ROUTE_8_SAFFRON_GATE, 1
	warp_event 39, 19, ROUTE_8_SAFFRON_GATE, 2
	warp_event 34, 11, POKEMON_TRAINER_FAN_CLUB, 1
	warp_event  5, 29, SAFFRON_ORRE_SPEECH_HOUSE, 1
	warp_event 13, 29, SAFFRON_BOOK_SPEECH_HOUSE, 1
	warp_event 23, 29, SAFFRON_HITMONTOP_KID_HOUSE, 1
	warp_event 13, 11, SAFFRON_RICH_SPEECH_HOUSE, 1
	warp_event 20, 21, SILPH_CO_1F, 2

	def_coord_events

	def_bg_events
	bg_event 21,  5, BGEVENT_JUMPTEXT, SaffronCitySignText
	bg_event 33,  5, BGEVENT_JUMPTEXT, SaffronGymSignText
	bg_event 27,  5, BGEVENT_JUMPTEXT, FightingDojoSignText
	bg_event 15, 21, BGEVENT_JUMPTEXT, SilphCoSignText
	bg_event 27, 29, BGEVENT_JUMPTEXT, MrPsychicsHouseSignText
	bg_event  9,  5, BGEVENT_JUMPTEXT, SaffronCityMagnetTrainStationSignText
	bg_event 31, 11, BGEVENT_JUMPTEXT, PokemonTrainerFanClubSignText
	bg_event  5, 21, BGEVENT_JUMPTEXT, SaffronTrainerTips1Text
	bg_event 35, 25, BGEVENT_JUMPTEXT, SaffronTrainerTips2Text

	def_object_events
	object_event  7, 14, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronCityLass1Script, -1
	object_event 18, 30, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SaffronCityPokefanMScript, -1
	object_event 32,  7, SPRITE_COOL_DUDE, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, SaffronCityCooltrainerMText, -1
	object_event 19, 25, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_WANDER, 1, 2, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SaffronCityCooltrainerFText, -1
	object_event 35, 14, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronCityFisherScript, -1
	object_event 15, 19, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SaffronCityYoungster1Text, -1
	object_event 32, 23, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, SaffronCityYoungster2Text, -1
	object_event 14,  6, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, SaffronCityLass2Text, -1
	object_event  3, 24, SPRITE_BLACK_BELT, SPRITEMOVEDATA_WALK_UP_DOWN, 4, 0, (1 << MORN) | (1 << EVE), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SaffronCityBlackBelt1Text, -1
	object_event  4, 25, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, (1 << DAY) | (1 << NITE), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SaffronCityBlackBelt2Text, -1
	object_event 22,  8, SPRITE_PSYCHIC, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 4, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SaffronCitySuperNerdText, -1
	object_event 22, 22, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 4, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SaffronCityScientistText, -1
	object_event 11, 22, SPRITE_SILPH_EMPLOYEE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 4, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SaffronCitySilphEmployeeText, -1

SaffronCityFlyPoint:
	setflag ENGINE_FLYPOINT_SAFFRON
	endcallback

SaffronCityLass1Script:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer SaffronCityLass1Text_ReturnedMachinePart
	jumpthistextfaceplayer

	text "Hier lebt ein"
	line "kleines Mädchen,"

	para "das darin"
	line "exzelliert, andere"
	cont "nachzuahmen."

	para "Sie ahmt sogar die"
	line "Person nach,"

	para "mit der sie gerade"
	line "spricht. Das ist"
	cont "verwirrend."
	done

SaffronCityPokefanMScript:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer SaffronCityPokefanMText_ReturnedMachinePart
	jumpthistextfaceplayer

	text "Du kommst aus"
	line "JOHTO?"

	para "Du kannst schnell"
	line "nach Hause"
	cont "zurückkehren, wenn"
	cont "der MAGNET- ZUG"
	cont "fährt."
	done


SaffronCityFisherScript:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer SaffronCityFisherText_ReturnedMachinePart
	jumpthistextfaceplayer

	text "Mampf… Mampf…"

	para "Wie ich höre,"
	line "braut sich da"
	cont "etwas im KRAFTWERK"
	cont "zusammen."

	para "Mampf… Mampf…"
	done


SaffronCityLass1Text_ReturnedMachinePart:
	text "Die NACHAHMERIN"
	line "sieht unglücklich"

	para "aus. Sie hat ihre"
	line "Lieblings-#-"
	cont "PUPPE - PIEPI -"
	cont "verloren."
	done






SaffronCityPokefanMText_ReturnedMachinePart:
	text "Du kommst aus"
	line "JOHTO?"

	para "Mit dem MAGNETZUG"
	line "bist du ganz"
	cont "schnell wieder zu"
	cont "Hause."
	done






SaffronCityCooltrainerMText:
	text "Ich ging zur"
	line "#mon- ARENA,"
	cont "weil ich unbedingt"
	cont "kämpfen wollte…"

	para "Wie sich heraus-"
	line "stellte, bin ich"

	para "ausgerechnet in"
	line "der verlassenen"

	para "#mon-ARENA"
	line "gelandet."

	para "War mir das"
	line "peinlich!"
	done






SaffronCityCooltrainerFText:
	text "Das ist die SILPH"
	line "CO., berühmt für"
	cont "ihre #mon-"
	cont "Artikel."

	para "TEAM ROCKET wollte"
	line "sie wegen dieser"

	para "Waren für sich"
	line "nutzen."
	done






SaffronCityFisherText_ReturnedMachinePart:
	text "Mampf… Mampf…"

	para "Wie ich höre,"
	line "braute sich da"
	cont "etwas im KRAFTWERK"
	cont "zusammen."

	para "Mampf… Mampf… Aah,"
	line "ich bin satt!"
	done






SaffronCityYoungster1Text:
	text "Ich finde es"
	line "unheimlich, wenn"

	para "ich zum ersten Mal"
	line "einen engen Gang"
	cont "betrete."
	done






SaffronCityYoungster2Text:
	text "In VERTANIA CITY"
	line "gibt es ein HAUS"

	para "für TRAINER. Dort"
	line "treffen sich"

	para "Trainer der ganzen"
	line "Welt."
	done






SaffronCityLass2Text:
	text "Über unsere Stadt"
	line "wurde mal im Radio"
	cont "berichtet."

	para "Es ist schön, dass"
	line "für deine Stadt"

	para "geworben wird,"
	line "aber es ist auch"
	cont "ein bisschen"
	cont "peinlich."
	done






SaffronCityBlackBelt1Text:
	text "Jeden Morgen, wenn"
	line "ich aufwache,"
	cont "laufe"

	para "ich zwei Runden um"
	line "die Stadt."

	para "So starte ich"
	line "perfekt in den"
	cont "Tag!"
	done

SaffronCityBlackBelt2Text:
	text "Wär ich ein Item,"
	line "wär ich X-Angriff."

	para "Ich strotze nur so"
	line "vor Kraft,"

	para "das X klingt"
	line "einfach cool."
	done

SaffronCitySuperNerdText:
	text "Es gab eine Zeit,"
	line "in der Psycho-"

	para "#mon für die"
	line "stärksten galten"

	para "und Käfer die"
	line "schwächsten."

	para "Ironisch ist:"
	line "Käfer sind super"
	cont "effektiv gegen"
	cont "Psycho!"
	done

SaffronCityScientistText:
	text "Das ursprüngliche"
	line "SILPH-SCOPE hatte"
	cont "Fehler, deshalb"

	para "arbeiten wir"
	line "unermüdlich an"
	cont "seinem"
	cont "Nachfolger-dem"
	cont "SILPH-SCOPE2!"
	done

SaffronCitySilphEmployeeText:
	text "SILPH ist nach"
	line "einem mythischen"
	cont "Luftgeist benannt."

	para "Was das mit dem"
	line "Geschäft der Firma"

	para "zu tun hat, weiß"
	line "ich nicht."
	done

SaffronCitySignText:
	text "SAFFRONIA CITY"

	para "Golden Schimmernde"
	line "Stadt des Handels"
	done






SaffronGymSignText:
	text "#mon-ARENA von"
	line "SAFFRONIA CITY"
	cont "LEITUNG: SABRINA"

	para "Die Meisterin der"
	line "Psycho-#mon!"
	done






FightingDojoSignText:
	text "Willkommen! KARATE"
	line "DOJO"
	done






SilphCoSignText:
	text "SILPH CO."
	line "BÜROGEBÄUDE"
	done






MrPsychicsHouseSignText:
	text "HAUS von MR."
	line "PSYCHO"
	done






SaffronCityMagnetTrainStationSignText:
	text "SAFFRONIA CITY"
	line "MAGNETZUG- BAHNHOF"
	done






PokemonTrainerFanClubSignText:
	text "#mon-Trainer"
	line "Fan-Club"

	para "Viele Trainer"
	line "haben hier ihre"
	cont "Namen"
	cont "hinterlassen…"
	done

SaffronTrainerTips1Text:
	text "TIPPS für TRAINER"

	para "Das neue SILPH-"
	line "SCOPE2 erkennt"

	para "selbst perfekt"
	line "getarnte #mon!"
	done

SaffronTrainerTips2Text:
	text "TIPPS für TRAINER"

	para "Nutze Flottbälle"
	line "früh im Kampf."
	cont "Später Timerbälle."

	para "Sie kosten mehr"
	line "als #BÄLLE,"

	para "sind aber"
	line "praktischer."
	done
