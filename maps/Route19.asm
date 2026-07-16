Route19_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route19ClearSmashRocks
	callback MAPCALLBACK_TILES, Route19ClearRocks

	def_warp_events
	warp_event  7,  1, ROUTE_19_FUCHSIA_GATE, 3
	warp_event  5, 13, ROUTE_19_BEACH_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 11, 15, BGEVENT_JUMPTEXT, Route19SignText
	bg_event 11, -1, BGEVENT_JUMPTEXT, CarefulSwimmingSignText
	bg_event  5,  3, BGEVENT_ITEM + REVIVE, EVENT_ROUTE_19_HIDDEN_REVIVE
	bg_event  3, 11, BGEVENT_ITEM + MAX_REVIVE, EVENT_ROUTE_19_HIDDEN_MAX_REVIVE
	bg_event  5, 15, BGEVENT_ITEM + PEARL, EVENT_ROUTE_19_HIDDEN_PEARL
	bg_event 13, 13, BGEVENT_ITEM + BIG_PEARL, EVENT_ROUTE_19_HIDDEN_BIG_PEARL

	def_object_events
	smashrock_event 11,  4, EVENT_ROUTE_19_ROCK
	smashrock_event  6, 3
	smashrock_event  4, 11
	smashrock_event 12, 13
	smashrock_event 13, 14
	object_event  8, 34, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSwimmerfDawn, -1
	object_event  9, 34, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSwimmermTucker, -1
	object_event 11, 20, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmermJerome, -1
	object_event 13, 43, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmermHarold, -1
	object_event 13, 51, SPRITE_COSPLAYER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCosplayerBrooke, -1
	object_event  9,  3, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route19Fisher1Script, -1
	object_event 11,  3, SPRITE_ENGINEER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route19Fisher2Script, -1
	tmhmball_event 14, 52, TM_SCALD, EVENT_ROUTE_19_TM_SCALD

	object_const_def
	const ROUTE19_ROCK1

Route19ClearSmashRocks:
	disappear ROUTE19_ROCK1
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iffalsefwd .Done
	appear ROUTE19_ROCK1
.Done:
	endcallback

Route19ClearRocks:
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftruefwd .Done
	changeblock 6, 4, $7a
	changeblock 8, 4, $7a
	changeblock 10, 4, $7a
	changeblock 6, 6, $7a
	changeblock 12, 6, $7a
	changeblock 8, 8, $7a
.Done:
	endcallback

; GSC-DE Dump 6569–6586
GenericTrainerSwimmerfDawn:
	generictrainer SWIMMERF, DAWN, EVENT_BEAT_SWIMMERF_DAWN, SwimmerfDawnSeenText, SwimmerfDawnBeatenText

	text "Es ist nur eine"
	line "kurze Distanz"

	para "zwischen FUCHSANIA"
	line "CITY und den"
	cont "SEESCHAUMINSELN…"

	para "Uah, mein Freund"
	line "ist so groß und"

	para "dennoch ein"
	line "Schwächling!"
	done

GenericTrainerSwimmermTucker:
	generictrainer SWIMMERM, TUCKER, EVENT_BEAT_SWIMMERM_TUCKER, SwimmermTuckerSeenText, SwimmermTuckerBeatenText

	text "Ich… bat meine"
	line "Freundin nach"
	cont "FUCHSANIA CITY…"
	cont "zu schwimmen…"
	done

GenericTrainerSwimmermJerome:
	generictrainer SWIMMERM, JEROME, EVENT_BEAT_SWIMMERM_JEROME, SwimmermJeromeSeenText, SwimmermJeromeBeatenText

	text "Schwimmen mag"
	line "nicht meine Stärke"
	cont "sein, dennoch"
	cont "liebe ich das"
	cont "Meer."
	done

GenericTrainerSwimmermHarold:
	generictrainer SWIMMERM, HAROLD, EVENT_BEAT_SWIMMERM_HAROLD, SwimmermHaroldSeenText, SwimmermHaroldBeatenText

	text "Nachts wird das"
	line "Meer schwarz. Es"

	para "scheint, als"
	line "wollte es dich"
	cont "verschlingen."
	done

GenericTrainerCosplayerBrooke:
	generictrainer COSPLAYER, BROOKE, EVENT_BEAT_COSPLAYER_BROOKE, CosplayerBrookeSeenText, CosplayerBrookeBeatenText

	text "Ich habe dieses"
	line "Kostüm für eine"
	cont "Maskerade gemacht,"
	cont "aber ich"

	para "liebe es so sehr,"
	line "dass ich es auch"
	cont "sonst trage."
	done

Route19Fisher1Script:
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iffalse_jumptextfaceplayer Route19Fisher1Text
	jumpthistextfaceplayer

	text "Ich bin total"
	line "verschwitzt. Es"
	cont "ist Zeit zum"
	cont "Schwimmen."
	done

Route19Fisher2Script:
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iffalse_jumptextfaceplayer Route19EngineerText1
	jumpthistextfaceplayer

	text "Die Bauarbeiten"
	line "sind beendet."

	para "Jetzt kann ich"
	line "wieder angeln."
	done

SwimmerfDawnSeenText:
	text "Schwächlinge"
	line "widern mich an!"
	done

SwimmerfDawnBeatenText:
	text "Ich schlage dich"
	line "beim Schwimmen…"
	done

SwimmermTuckerSeenText:
	text "Uff, uff…"
	line "Nur… noch… ein"

	para "kleines Stück… bis"
	line "…FUCHSANIA CITY…"
	done

SwimmermTuckerBeatenText:
	text "Ich ertrinke!"
	done

SwimmermJeromeSeenText:
	text "Schwimmen? Ich bin"
	line "ein miserabler"
	cont "Schwimmer."

	para "Ich plansche"
	line "lieber in dieser"
	cont "Riesenpfütze."
	done

SwimmermJeromeBeatenText:
	text "Ich dachte, ich"
	line "könnte gewinnen."
	done

SwimmermHaroldSeenText:
	text "Warst du schon"
	line "einmal nachts im"
	cont "Meer?"
	done

SwimmermHaroldBeatenText:
	text "Gulp…"
	done

CosplayerBrookeSeenText:
	text "Verkleiden macht"
	line "Spaß!"
	done

CosplayerBrookeBeatenText:
	text "Hoffentlich hast"
	line "du mein Kostüm"
	cont "nicht beschädigt!"
	done

Route19Fisher1Text:
	text "Tut mir Leid."
	line "Die Straße ist"
	cont "aufgrund von Bau-"
	cont "arbeiten gesperrt."

	para "Wenn du zu der"
	line "ZINNOBERINSEL"

	para "möchtest, gehst"
	line "du von ALABASTIA"
	cont "gen Süden."
	done

Route19EngineerText1:
	text "Es würde zu lange"
	line "dauern, diesen"
	cont "Felsen zu bewegen…"
	done

Route19SignText:
	text "ROUTE 19"

	para "FUCHSANIA CITY -"
	line "SEESCHAUMINSELN"
	done

CarefulSwimmingSignText:
	text "Sei auf der Hut,"
	line "wenn du zu den"
	cont "SEESCHAUMINSELN"
	cont "schwimmst."

	para "ORDNUNGSAMT VON"
	line "FUCHSANIA CITY"
	done
