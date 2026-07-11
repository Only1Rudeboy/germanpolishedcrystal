Route13_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event 35, 13, BGEVENT_JUMPTEXT, Route13TrainerTips1Text
	bg_event 53,  5, BGEVENT_JUMPTEXT, Route13TrainerTips2Text
	bg_event 51, 11, BGEVENT_JUMPTEXT, Route13SignText
	bg_event 17, 13, BGEVENT_JUMPTEXT, Route13DirectionsSignText
	bg_event 36, 13, BGEVENT_ITEM + CALCIUM, EVENT_ROUTE_13_HIDDEN_CALCIUM
	bg_event  5, 15, BGEVENT_ITEM + OVAL_STONE, EVENT_ROUTE_13_HIDDEN_OVAL_STONE

	def_object_events
	object_event  5,  5, SPRITE_CAMPER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCamperClark, -1
	object_event 16,  6, SPRITE_PICNICKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerPicnickerGinger, -1
	object_event 60, 11, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerBird_keeperPerry, -1
	object_event 64,  1, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBird_keeperBret, -1
	object_event 34,  5, SPRITE_CAMPER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCamperTanner, -1
	object_event 65,  9, SPRITE_PICNICKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPicnickerPiper, -1
	object_event 52,  6, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCoupleTimandsue1, -1
	object_event 53,  6, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCoupleTimandsue2, -1
	object_event 38,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPokefanmJoshua, -1
	object_event 14, 10, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerHikerKenny, -1
	object_event 25,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerPokefanmAlex, -1
	object_event 21, 13, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, Route13GrampsScript, -1
	cuttree_event 54,  4, EVENT_ROUTE_13_CUT_TREE

Route13GrampsScript:
	special CheckIfTrendyPhraseIsLucky
	iftruefwd .lucky
	jumpthistextfaceplayer

	text "Heute kann ich die"
	line "Glücks-Insel nicht"
	cont "sehen…"

	para "Aber ich weiß, sie"
	line "war schon mal da!"
	done

.lucky
	jumpthistextfaceplayer

	text "Heute kann ich die"
	line "Glücks-Insel"
	cont "sehen!"

	para "Was für ein"
	line "Anblick!"
	done

GenericTrainerCamperClark:
	generictrainer CAMPER, CLARK, EVENT_BEAT_CAMPER_CLARK, .SeenText, .BeatenText

	text "Es ist egal, wie"
	line "gut du dich"
	cont "vorbereitet hast."

	para "Wenn du verlierst,"
	line "verlierst du."
	done

.SeenText:
	text "Wasser sammeln!"
	line "Lass das Feuer"
	cont "nicht ausgehen!"

	para "Achtung vor wilden"
	line "#mon!"

	para "Los geht's,"
	line "Campfire!"
	done

.BeatenText:
	text "Pfuuuuhh…"
	done

GenericTrainerPicnickerGinger:
	generictrainer PICNICKER, GINGER, EVENT_BEAT_PICNICKER_GINGER, .SeenText, .BeatenText

	text "Du kannst mit"
	line "#mon"
	cont "kommunizieren"

	para "durch Pfeifen"
	line "statt mit Worten!"
	done

.SeenText:
	text "Warum bekomme ich"
	line "draußen immer Lust"
	cont "zu pfeifen?"
	done

.BeatenText:
	text "Tweeee!"
	done

GenericTrainerBird_keeperPerry:
	generictrainer BIRD_KEEPER, PERRY, EVENT_BEAT_BIRD_KEEPER_PERRY, Bird_keeperPerrySeenText, Bird_keeperPerryBeatenText

	text "Deine #mon sind"
	line "in der Tat sehr"
	cont "gut trainiert."
	done
Bird_keeperPerrySeenText:
	text "Agilität ist die"
	line "wichtigste"
	cont "Eigenschaft von"
	cont "Vogel- #mon."
	done
Bird_keeperPerryBeatenText:
	text "Du hast mich"
	line "aufgrund deiner"
	cont "Schnelligkeit"
	cont "besiegt…"
	done
GenericTrainerBird_keeperBret:
	generictrainer BIRD_KEEPER, BRET, EVENT_BEAT_BIRD_KEEPER_BRET, Bird_keeperBretSeenText, Bird_keeperBretBeatenText

	text "Wenn du deine"
	line "#mon pflegst,"
	cont "sind sie fröhlich."
	done
Bird_keeperBretSeenText:
	text "Schau dir meine"
	line "#mon an. Sieh"

	para "ihre Farben und"
	line "ihr Gefieder."
	done
Bird_keeperBretBeatenText:
	text "Verflixt! Nicht"
	line "gut genug!"
	done
GenericTrainerCamperTanner:
	generictrainer CAMPER, TANNER, EVENT_BEAT_CAMPER_TANNER, .SeenText, .BeatenText

	text "Ich dachte, dich"
	line "kalt zu machen"
	cont "wäre leicht…"
	done

.SeenText:
	text "Ich schaffe einen"
	line "schnellen Kampf"
	cont "beim Kochen!"
	done

.BeatenText:
	text "Ach, ich habe"
	line "Hunger…"
	done

GenericTrainerPicnickerPiper:
	generictrainer PICNICKER, PIPER, EVENT_BEAT_PICNICKER_PIPER, .SeenText, .BeatenText

	text "Deine Art zu gehen"
	line "ließ mich denken,"
	cont "ich könnte"
	cont "gewinnen."
	done

.SeenText:
	text "Wie wäre es, deine"
	line "#mon und meine"

	para "für einen Kampf"
	line "herauszuholen?"
	done

.BeatenText:
	text "Ach, das ist"
	line "schade…"
	done

GenericTrainerCoupleTimandsue1:
	generictrainer COUPLE, TIMANDSUE1, EVENT_BEAT_COUPLE_TIM_AND_SUE, .SeenText, .BeatenText

	text "Tim: Wenn du sie"
	line "besiegt hast,"
	cont "musst du stark"
	cont "sein!"
	done

.SeenText:
	text "Tim: Ich geb dir"
	line "einen kleinen"
	cont "Tipp."

	para "Meine Freundin ist"
	line "stärker als ich!"
	done

.BeatenText:
	text "Tim: Du bist der"
	line "Stärkste!"
	done

GenericTrainerCoupleTimandsue2:
	generictrainer COUPLE, TIMANDSUE2, EVENT_BEAT_COUPLE_TIM_AND_SUE, .SeenText, .BeatenText

	text "Sue: Diese Stärke"
	line "von dir… Ich"
	cont "hab's!"

	para "Bist du verliebt?"
	done

.SeenText:
	text "Sue: Frauen, die"
	line "die Liebe nicht"

	para "ernst nehmen,"
	line "könnten verletzt"
	cont "werden."
	done

.BeatenText:
	text "Sue: Ha ha…"
	done

GenericTrainerPokefanmAlex:
	generictrainer POKEFANM, ALEX, EVENT_BEAT_POKEFANM_ALEX, PokefanmAlexSeenText, PokefanmAlexBeatenText

	text "Möchte nicht jeder"
	line "eines Tages einmal"
	cont "König sein?"
	done
PokefanmAlexSeenText:
	text "Verbeuge dich vor"
	line "meinen königlichen"
	cont "#mon!"
	done





PokefanmAlexBeatenText:
	text "Wie… wie kannst du"
	line "es wagen, die"
	cont "Monarchie zu"
	cont "verspotten?"
	done





GenericTrainerPokefanmJoshua:
	generictrainer POKEFANM, JOSHUA, EVENT_BEAT_POKEFANM_JOSHUA, PokefanmJoshuaSeenText, PokefanmJoshuaBeatenText

	text "Es scheint, dass"
	line "du viele #mon"

	para "hast, aber PIKACHU"
	line "ist immer noch das"
	cont "Beste."
	done
PokefanmJoshuaSeenText:
	text "Hihi! Möchtest du"
	line "gegen mein"
	cont "PIKACHU-Team"
	cont "antreten?"
	done





PokefanmJoshuaBeatenText:
	text "PI-PIKACHU!"
	done





GenericTrainerHikerKenny:
	generictrainer HIKER, KENNY, EVENT_BEAT_HIKER_KENNY, HikerKennySeenText, HikerKennyBeatenText

	text "Es scheint, als"
	line "würden sich"
	cont "geologische"
	cont "Gegebenheiten"
	cont "nicht ändern."

	para "Aber sie ändern"
	line "sich, langsam,"
	cont "ganz langsam."
	done
HikerKennySeenText:
	text "Ich sollte zum"
	line "FELSTUNNEL gehen"
	cont "und mir ein ONIX"
	cont "fangen."
	done





HikerKennyBeatenText:
	text "Ich habe verloren…"
	done





Route13TrainerTips1Text:
	text "TIPPS für TRAINER"

	para "Schau! Hier, an"
	line "der linken Seite"
	cont "des Pfostens."
	done
Route13TrainerTips2Text:
	text "TIPPS für TRAINER"

	para "Manche #mon"
	line "brauchen Items, um"
	cont "sich zu"
	cont "entwickeln."

	para "Mit etwas Glück"
	line "trägt ein wildes"

	para "#mon sein"
	line "eigenes Evoluti-"
	cont "onsitem bei sich!"
	done

Route13SignText:
	text "ROUTE 13"

	para "NÖRDLICH ZUR"
	line "SCHWEIGEBRÜCKE"
	done





Route13DirectionsSignText:
	text "Nördlich nach"
	line "LAVANDIA"

	para "Westlich nach"
	line "FUCHSANIA CITY"
	done





