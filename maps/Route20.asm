Route20_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 70,  9, SEAFOAM_ISLANDS_1F, 1
	warp_event 62,  5, SEAFOAM_ISLANDS_1F, 4

	def_coord_events

	def_bg_events
	bg_event 69, 11, BGEVENT_JUMPTEXT, CinnabarGymSignText
	bg_event 65,  7, BGEVENT_JUMPTEXT, SeafoamIslandsSignText
	bg_event 23, 10, BGEVENT_ITEM + STARDUST, EVENT_ROUTE_20_HIDDEN_STARDUST

	def_object_events
	object_event 99, 10, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmerfNicole, -1
	object_event 78, 13, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmerfLori, -1
	object_event 32,  4, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmerfMayu, -1
	object_event 62, 14, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSwimmerfLeona, -1
	object_event  8,  6, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmermCameron, -1
	object_event 77,  3, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmermLuis, -1
	object_event 88,  8, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmermElmo, -1
	object_event 18, 12, SPRITE_PICNICKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerPicnickerCheyenne, -1
	object_event 26, 14, SPRITE_PICNICKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerPicnickerAdrian, -1
	object_event 14, 14, SPRITE_CAMPER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerCamperPedro, -1
	object_event 46,  9, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBird_keeperBert, -1
	object_event 69,  5, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBird_keeperErnie, -1
	itemball_event 72,  3, BIG_PEARL, 1, EVENT_ROUTE_20_BIG_PEARL

GenericTrainerSwimmerfNicole:
	generictrainer SWIMMERF, NICOLE, EVENT_BEAT_SWIMMERF_NICOLE, SwimmerfNicoleSeenText, SwimmerfNicoleBeatenText

	text "Beim Schwimmen"
	line "wird der gesamte"

	para "Körper trainiert."
	line "Schwimmen ist"
	cont "gesund."
	done
SwimmerfNicoleSeenText:
	text "Im Wasser fühle"
	line "ich mich so"
	cont "leicht."
	done





SwimmerfNicoleBeatenText:
	text "Ach, nein!"
	done





GenericTrainerSwimmerfLori:
	generictrainer SWIMMERF, LORI, EVENT_BEAT_SWIMMERF_LORI, SwimmerfLoriSeenText, SwimmerfLoriBeatenText

	text "SURFER ist nicht"
	line "mehr die einzige"
	cont "VM, die du im"
	cont "Wasser einsetzen"
	cont "kannst."
	done
SwimmerfLoriSeenText:
	text "Du besitzt eine"
	line "umwerfende Anzahl"

	para "ARENA-ORDEN. Lass"
	line "uns kämpfen!"
	done





SwimmerfLoriBeatenText:
	text "Nein!"
	done





GenericTrainerSwimmerfMayu:
	generictrainer SWIMMERF, MAYU, EVENT_BEAT_SWIMMERF_MAYU, .SeenText, .BeatenText

	text "Ich wollte sehen,"
	line "wie lang ich die"

	para "Luft anhalten"
	line "kann!"
	done

.SeenText:
	text "Mmph? Mmmph"
	line "mmmmphh?"
	para "Mmmmph mmmmmppphh!"
	done

.BeatenText:
	text "Pwah!"
	done

GenericTrainerSwimmerfLeona:
	generictrainer SWIMMERF, LEONA, EVENT_BEAT_SWIMMERF_LEONA, .SeenText, .BeatenText

	text "Deine"
	line "#mon--folgst du"
	cont "dem"
	para "neuesten"
	line "Team-Trend?"
	done

.SeenText:
	text "Schau! Mein bester"
	line "Badeanzug und mein"
	cont "bestes"
	para "#mon!"
	done

.BeatenText:
	text "Achhh!"
	done
GenericTrainerSwimmermCameron:
	generictrainer SWIMMERM, CAMERON, EVENT_BEAT_SWIMMERM_CAMERON, SwimmermCameronSeenText, SwimmermCameronBeatenText

	text "Ich schwimme auch"
	line "in Teichen und"
	cont "Flüssen."
	done
; GSC-DE Dump 7125
SwimmermCameronSeenText:
	text "Ich denke es ist"
	line "unmöglich, den"

	para "ganzen Weg nach"
	line "JOHTO zu"
	cont "schwimmen."
	done





SwimmermCameronBeatenText:
	text "Yippie!"
	done





GenericTrainerSwimmermLuis:
	generictrainer SWIMMERM, SWIMMERM_LUIS, EVENT_BEAT_SWIMMERM_LUIS, .SeenText, .BeatenText

	text "Alles klar!"
	line "Nächstes Mal trag"
	cont "ich"
	cont "Party-Badeshorts!"
	done

.SeenText:
	text "Heute trage ich"
	line "meine besten"
	cont "Badeshorts!"
	done

.BeatenText:
	text "Selbst in meiner"
	line "besten Hose hab"
	cont "ich verloren."
	done

GenericTrainerSwimmermElmo:
	generictrainer SWIMMERM, ELMO, EVENT_BEAT_SWIMMERM_ELMO, .SeenText, .BeatenText

	text "Vielleicht sollte"
	line "ich wieder angeln"
	cont "…"
	done

.SeenText:
	text "Früher war ich"
	line "Angler."

	para "Schwimmen liebe"
	line "ich so sehr,"

	para "ich trage immer"
	line "Badeshorts!"
	done

.BeatenText: ; text > text
	text "Ulp…"
	done

GenericTrainerPicnickerCheyenne:
	generictrainer PICNICKER, CHEYENNE, EVENT_BEAT_PICNICKER_CHEYENNE, .SeenText, .BeatenText

	text "Mit #mon"
	line "verliere ich nicht"
	cont "so schlimm!"
	done

.SeenText:
	text "Als Kind hab ich"
	line "nur drinnen"
	cont "gespielt."

	para "Jetzt spiel ich"
	line "gern draußen mit"
	cont "#mon!"
	done

.BeatenText:
	text "Argh!"
	done

GenericTrainerPicnickerAdrian:
	generictrainer PICNICKER, ADRIAN, EVENT_BEAT_PICNICKER_ADRIAN, .SeenText, .BeatenText

	text "Obwohl ich verlor,"
	line "hatte ich Spaß!"
	done

.SeenText:
	text "Hast du es eilig?"
	para "Wie wärs mit einer"
	line "kurzen Kampfpause?"
	done

.BeatenText:
	text "Aaahh… das wars."
	done

GenericTrainerCamperPedro:
	generictrainer CAMPER, PEDRO, EVENT_BEAT_CAMPER_PEDRO, .SeenText, .BeatenText

	text "Vergisst du deine"
	line "Decke, kannst du"
	cont "dich an ein"

	para "warmes #mon"
	line "kuscheln!"
	done

.SeenText:
	text "Warst du schon mal"
	line "mit #mon"
	cont "campen?"
	done

.BeatenText:

	text "Du bist stark!"
	done

GenericTrainerBird_keeperBert:
	generictrainer BIRD_KEEPER, BERT, EVENT_BEAT_BIRD_KEEPER_BERT, .SeenText, .BeatenText

	text "Das war ein"
	line "unglaublicher"
	cont "Kampf!"

	para "Ich habe"
	line "Gänsehaut!"
	done

.SeenText:
	text "Gefunden! Ein"
	line "Trainer, mit dem"
	cont "ich gern kämpfe!"
	done

.BeatenText:
	text "Ich verlor mit"
	line "aller Kraft!"
	done

GenericTrainerBird_keeperErnie:
	generictrainer BIRD_KEEPER, ERNIE, EVENT_BEAT_BIRD_KEEPER_ERNIE, .SeenText, .BeatenText

	text "Du bist etwas"
	line "Besonderes!"
	done

.SeenText:
	text "Hallo, hallo."
	line "Kämpfst du mit"
	cont "mir?"
	done

.BeatenText:
	text "Das war ziemlich"
	line "unglaublich."
	done

; GSC-DE Dump 7128
CinnabarGymSignText:
	text "Was steht auf"
	line "diesem Schild?"

	para "PKMN-ARENA der"
	line "ZINNOBERINSEL"

	para "LEITUNG: PYRO"
	done





SeafoamIslandsSignText:
	text "SEESCHAUMINSELN"
	done
