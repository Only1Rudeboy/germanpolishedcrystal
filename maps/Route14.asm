Route14_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event 15, 12, BGEVENT_JUMPTEXT, Route14SignText

	def_object_events
	object_event 13,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerPokefanmTrevor, -1
	object_event 11, 22, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPokefanmCarter, -1
	object_event 11, 29, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBird_keeperRoy, -1
	object_event 15, 15, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerBird_keeperJosh, -1
	object_event  4, 19, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSchoolboyConnor, -1
	object_event  4, 17, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSchoolboyTorin, -1
	object_event  4, 15, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSchoolboyTravis, -1
	object_event  9, 17, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerTeacherClarice, -1
	object_event  7,  7, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, trade, NPC_TRADE_KIM, -1
	cuttree_event  4,  9, EVENT_ROUTE_14_CUT_TREE_1
	cuttree_event 10, 18, EVENT_ROUTE_14_CUT_TREE_2
	cuttree_event  3, 25, EVENT_ROUTE_14_CUT_TREE_3
	fruittree_event  5, 12, FRUITTREE_ROUTE_14, CUSTAP_BERRY, PAL_NPC_RED

GenericTrainerPokefanmTrevor:
	generictrainer POKEFANM, TREVOR, EVENT_BEAT_POKEFANM_TREVOR, PokefanmTrevorSeenText, PokefanmTrevorBeatenText

	text "Wenn es nur eine"
	line "einfache Mög-"
	line "lichkeit gäbe,"

	para "herauszufinden,"
	line "wo ich mein"
	line "#mon gefangen"
	cont "habe…"

	para "Ach! Ich kann"
	line "ja seine Werte"
	line "nachschauen!"
	done

PokefanmTrevorSeenText:
	text "Hallo. Wusstest"
	line "du…,"

	para "dass #mon dich"
	line "mehr mögen, wenn"

	para "du sie an einem"
	line "ihnen bekannten"
	cont "Platz trainierst?"
	done






PokefanmTrevorBeatenText:
	text "Wo traf ich"
	line "dieses"
	line "ENTON?"
	done






GenericTrainerPokefanmCarter:
	generictrainer POKEFANM, CARTER, EVENT_BEAT_POKEFANM_CARTER, PokefanmCarterSeenText, PokefanmCarterBeatenText

	text "SCHIGGY, GLUMANDA"
	line "und BISASAM…"

	para "Ich denke, das"
	line "ist"
	line "ein"
	cont "ausgeglichenes"
	cont "Team."
	done
PokefanmCarterSeenText:
	text "Eines kann ich"
	line "dir"
	line "sagen! Es war"

	para "harte Arbeit,"
	line "mei-"
	line "ne prämierten"
	cont "#mon zu fangen."
	done






PokefanmCarterBeatenText:
	text "Uaaaah!"
	done






GenericTrainerBird_keeperRoy:
	generictrainer BIRD_KEEPER, ROY, EVENT_BEAT_BIRD_KEEPER_ROY, Bird_keeperRoySeenText, Bird_keeperRoyBeatenText

	text "Du hast #mon,"
	line "welche die VM"

	para "FLIEGEN kennen?"
	line "Ich beneide dich."
	done
Bird_keeperRoySeenText:
	text "Ich träume davon,"
	line "mit meinen ge-"
	cont "liebten Vogel-"
	cont "#mon zu"
	cont "fliegen."
	done
Bird_keeperRoyBeatenText:
	text "Ich kann träumen,"
	line "aber ich kann"
	cont "nicht fliegen…"
	done
GenericTrainerBird_keeperJosh:
	generictrainer BIRD_KEEPER, BIRD_KEEPER_JOSH, EVENT_BEAT_BIRD_KEEPER_JOSH, .SeenText, .BeatenText

	text "Vielleicht sollt"
	line "ich lügen und"
	line "sagen, ich bin"
	cont "im"
	cont "Schwergewicht…"
	done

.SeenText:
	text "Mein Gewicht"
	line "bringt mich in"
	cont "die Federge-"
	cont "wicht-Klasse!"

	para "…Was? Du meinst,"
	line "das klingt"
	line "nicht sehr"
	cont "stark?"
	done

.BeatenText:
	text "Leicht wie eine"
	line "Feder hab ich"
	cont "verloren!"
	done

GenericTrainerSchoolboyConnor:
	generictrainer SCHOOLBOY, SCHOOLBOY_CONNOR, EVENT_BEAT_SCHOOLBOY_CONNOR, .SeenText, .BeatenText

	text "Eile mit Weile!"
	line "Geh den Weg"
	cont "Schritt für"
	cont "Schritt."

	para "Guter Rat!"
	done

.SeenText:
	text "Ich kann es"
	line "kaum erwarten,"
	line "nach Hause zu"
	cont "kommen und mein"
	cont "ITEM abzulegen!"
	done

.BeatenText:
	text "Ich war zu"
	line "ungeduldig."
	done

GenericTrainerSchoolboyTorin:
	generictrainer SCHOOLBOY, TORIN, EVENT_BEAT_SCHOOLBOY_TORIN, .SeenText, .BeatenText

	text "Alles klar! Näch-"
	line "stes Mal mache"
	cont "ich keine"
	cont "Fehler mehr!"
	done

.SeenText:
	text "Es ist gut, das"
	line "Gelernte sofort"
	cont "anzuwenden!"
	done

.BeatenText:
	text "Verstehe."
	line "Verstehe."
	done

GenericTrainerSchoolboyTravis:
	generictrainer SCHOOLBOY, TRAVIS, EVENT_BEAT_SCHOOLBOY_TRAVIS, .SeenText, .BeatenText

	text "Vielleicht sollt"
	line "ich zu deinen"
	cont "Lerngruppen"
	cont "kommen!"
	done

.SeenText:
	text "Hast du auch"
	line "Nachhilfe nach"
	line "der Schule?"
	done

.BeatenText:
	text "So stark…"
	done

GenericTrainerTeacherClarice:
	generictrainer TEACHER_F, CLARICE, EVENT_BEAT_TEACHER_CLARICE, .SeenText, .BeatenText

	text "Entspann dich"
	line "nicht nur, weil"
	line "du gewonnen hast."

	para "Wenn du zu Hause"
	line "bist, solltest"
	line "du alles noch"
	cont "einmal durch-"
	cont "gehen!"
	done

.SeenText:
	text "Gut, fangen wir"
	line "mit dem #mon-"
	cont "kampf an!"
	done

.BeatenText:
	text "Gut! Damit ist"
	line "der heutige"
	cont "Kampf beendet."
	done

Route14SignText:
	text "ROUTE 14"

	para "FUCHSANIA CITY -"
	line "LAVANDIA"
	done
