Route12South_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 11, 57, ROUTE_12_SUPER_ROD_HOUSE, 1
	warp_event  0, 42, ROUTE_11_GATE, 3
	warp_event  0, 43, ROUTE_11_GATE, 4
	warp_event 10,  1, ROUTE_12_GATE, 3

	def_coord_events

	def_bg_events
	bg_event 11, 43, BGEVENT_JUMPTEXT, Route12SignText
	bg_event 14, 15, BGEVENT_ITEM + ELIXIR, EVENT_ROUTE_12_HIDDEN_ELIXIR

	def_object_events
	object_event  7,  7, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFisherMartin, -1
	object_event 14, 33, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFisherStephen, -1
	object_event 12, 63, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerFisherBarney, -1
	object_event 10, 74, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFisherKyler, -1
	object_event 10, 24, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBird_keeperJustin, -1
	object_event  7, 57, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerBird_keeperGail, -1
	object_event 10, 39, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCoupleVicandtara1, -1
	object_event 10, 38, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCoupleVicandtara2, -1
	object_event 14, 89, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	itemball_event  5, 68, CALCIUM, 1, EVENT_ROUTE_12_CALCIUM
	itemball_event  5, 82, NUGGET, 1, EVENT_ROUTE_12_NUGGET
	cuttree_event  6, 71, EVENT_ROUTE_12_CUT_TREE_1
	cuttree_event  9, 79, EVENT_ROUTE_12_CUT_TREE_2

GenericTrainerFisherMartin:
	generictrainer FISHER, MARTIN, EVENT_BEAT_FISHER_MARTIN, FisherMartinSeenText, FisherMartinBeatenText

	text "Ich bin zu"
	line "ungeduldig für das"
	cont "Angeln …"
	done
FisherMartinSeenText:
	text "Geduld ist das"
	line "Zauberwort. Das"
	cont "gilt fürs Angeln"
	cont "und für #MON."
	done
FisherMartinBeatenText:
	text "Guaah!"
	done
GenericTrainerFisherStephen:
	generictrainer FISHER, STEPHEN, EVENT_BEAT_FISHER_STEPHEN, FisherStephenSeenText, FisherStephenBeatenText

	; GSC-DE Dump 6897
	text "Kennst du schon"
	line "die Radiosender"

	para "aus KANTO? Es gibt"
	line "viele hier."
	done
FisherStephenSeenText:
	; GSC-DE Dump 6895
	text "Wenn ich beim"
	line "Angeln Radio hören"
	cont "kann, bin ich"
	cont "glücklich."
	done
FisherStephenBeatenText:
	; GSC-DE Dump 6896
	text "Das blöde Radio"
	line "beunruhigt mich!"
	done
GenericTrainerFisherBarney:
	generictrainer FISHER, BARNEY, EVENT_BEAT_FISHER_BARNEY, FisherBarneySeenText, FisherBarneyBeatenText

	; GSC-DE Dump 6900
	text "Meiner Meinung"
	line "nach ist Strom"

	para "das Wichtigste"
	line "in unserem Leben."

	para "Wenn dem nicht so"
	line "wäre, hätten die"

	para "Leute nicht so"
	line "einen Aufstand"

	para "fabriziert, als"
	line "das KRAFTWERK"
	cont "außer Betrieb war."
	done
FisherBarneySeenText:
	; GSC-DE Dump 6898
	text "Was ist in unserem"
	line "alltäglichen Leben"
	cont "am wichtigsten?"
	done
FisherBarneyBeatenText:
	; GSC-DE Dump 6899
	text "Die Antwort gibt"
	line "es demnächst!"
	done
GenericTrainerFisherKyler:
	generictrainer FISHER, KYLER, EVENT_BEAT_FISHER_KYLER, .SeenText, .BeatenText

	text "Wirklich? Es ist"
	line "besser, #MON zu"

	para "trainieren, statt"
	line "immer neue zu"
	cont "fangen?"
	done

.SeenText:
	text "#MON-Kämpfe"
	line "locken Leute an!"
	done

.BeatenText:
	text "Mein #MON-Eimer"
	line "ist leer!"
	done

GenericTrainerBird_keeperJustin:
	generictrainer BIRD_KEEPER, BIRD_KEEPER_JUSTIN, EVENT_BEAT_BIRD_KEEPER_JUSTIN, .SeenText, .BeatenText

	text "Seit der Wind"
	line "gedreht hat,"

	para "halte ich mich"
	line "zurück…"
	done

.SeenText:
	text "Häh? Der Wind hat"
	line "die Richtung"
	cont "gewechselt!"
	done

.BeatenText:
	text "Phew…"
	done

GenericTrainerBird_keeperGail:
	generictrainer BIRD_KEEPER, GAIL, EVENT_BEAT_BIRD_KEEPER_GAIL, .SeenText, .BeatenText

	text "Chuun-Chuun?"
	line "Chunchun!"
	done

.SeenText:
	text "BASABASABASA-"
	line "BASABASA!"
	done

.BeatenText:
	text "Pyopyopyopyo…"
	done

GenericTrainerCoupleVicandtara1:
	generictrainer COUPLE, VICANDTARA1, EVENT_BEAT_COUPLE_VIC_AND_TARA, .SeenText, .BeatenText

	text "VIC: Tara hat mich"
	line "schon mal blamiert"
	cont "gesehen …"
	done

.SeenText:
	text "VIC: Alles klar!"
	line "Jetzt kann ich"

	para "mich vor Tara"
	line "beweisen!"
	done

.BeatenText:
	text "VIC: Oh nein, mein"
	line "Plan!"
	done

GenericTrainerCoupleVicandtara2:
	generictrainer COUPLE, VICANDTARA2, EVENT_BEAT_COUPLE_VIC_AND_TARA, .SeenText, .BeatenText

	text "TARA: Obwohl mein"
	line "Freund verlor,"

	para "ist er immer noch"
	line "wunderbar."
	done

.SeenText:
	text "TARA: Ich liebe"
	line "es, das Gesicht"

	para "meines Freundes"
	line "beim Kämpfen zu"
	cont "beobachten!"
	done

.BeatenText:
	text "TARA: Oh nein, oh"
	line "nein…"
	done

Route12SignText:
	; GSC-DE Dump 6904
	text "ROUTE 12"
	line "NORDEN: LAVANDIA"
	done
