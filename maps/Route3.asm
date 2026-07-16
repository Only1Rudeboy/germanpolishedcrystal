Route3_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route3FlyPoint

	def_warp_events
	warp_event 68,  1, MOUNT_MOON_1F, 1
	warp_event 61,  3, ROUTE_3_POKECENTER_1F, 1

	def_coord_events

	def_bg_events
	bg_event 63, 15, BGEVENT_JUMPTEXT, Route3MtMoonSquareSignText
	bg_event 11, 17, BGEVENT_ITEM + MOON_STONE, EVENT_ROUTE_3_HIDDEN_MOON_STONE
	bg_event  8, 15, BGEVENT_JUMPTEXT, Route3MeteoriteText
	bg_event  8, 17, BGEVENT_JUMPTEXT, Route3MeteoriteText
	bg_event  9, 17, BGEVENT_JUMPTEXT, Route3MeteoriteText
	bg_event 12, 15, BGEVENT_JUMPTEXT, Route3MeteoriteText
	bg_event 14, 17, BGEVENT_JUMPTEXT, Route3MeteoriteText
	bg_event 15, 17, BGEVENT_JUMPTEXT, Route3MeteoriteText

	def_object_events
	object_event 12,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerYoungsterRegis, -1
	object_event 17,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerYoungsterJimmy, -1
	object_event 25,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerYoungsterWarren, -1
	object_event 30, 12, SPRITE_FIREBREATHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerFirebreatherOtis, -1
	object_event 60, 10, SPRITE_FIREBREATHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerFirebreatherBurt, -1
	object_event 44,  8, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerBlackbeltManford, -1
	object_event 52, 18, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerBlackbeltAnder, -1
	object_event 38,  6, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerHikerBruce, -1
	object_event 61, 19, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerHikerDwight, -1
	object_event 14, 12, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerAceDuoZacandjen1, -1
	object_event 15, 12, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerAceDuoZacandjen2, -1
	itemball_event 36, 14, BIG_ROOT, 1, EVENT_ROUTE_3_BIG_ROOT

Route3FlyPoint:
	setflag ENGINE_FLYPOINT_MT_MOON
	endcallback

GenericTrainerYoungsterRegis:
	generictrainer YOUNGSTER, REGIS, EVENT_BEAT_YOUNGSTER_REGIS, .SeenText, .BeatenText

	text "Sieht aus, als"
	line "bräuchte ich mehr"
	cont "Training!"
	done

.SeenText:
	text "Knirps? Wie"
	line "unhöflich!"

	para "Nenn mich"
	line "Shorts-Junge!"
	done

.BeatenText:
	text "Das heißt…"
	line "Flop-Junge…"
	done

GenericTrainerYoungsterJimmy:
	generictrainer YOUNGSTER, JIMMY, EVENT_BEAT_YOUNGSTER_JIMMY, .SeenText, .BeatenText

	text "Ich trage das"
	line "ganze Jahr Shorts."
	para "Das ist meine"
	line "Auffassung von"
	cont "Mode."
	done
.SeenText:

	text "Ich bin schnell"
	line "wie der Wind!"
	done

.BeatenText:

	text "Hinfortgeweht!"
	done

GenericTrainerYoungsterWarren:
	generictrainer YOUNGSTER, WARREN, EVENT_BEAT_YOUNGSTER_WARREN, .SeenText, .BeatenText

	text "Du hast gleich"
	line "einen starken"
	cont "Eindruck gemacht."

	para "Ich hatte Angst,"
	line "gegen dich zu"
	cont "kämpfen…"
	done
.SeenText:

	text "Hmmm … Ich weiß"
	line "nicht, was ich tun"
	cont "soll …"
	done

.BeatenText:

	text "Ich wusste, ich"
	line "würde verlieren…"
	done

GenericTrainerFirebreatherOtis:
	generictrainer FIREBREATHER, OTIS, EVENT_BEAT_FIREBREATHER_OTIS, .SeenText, .BeatenText

	text "Bei Regen ist eine"
	line "Zündung sehr"
	cont "schwierig …"
	done
.SeenText:

	text "Ah! Das Wetter ist"
	line "so schön wie"
	cont "immer."
	done

.BeatenText:

	text "Die Sonne scheint,"
	line "dennoch bin ich"
	cont "nass …"
	done

GenericTrainerFirebreatherBurt:
	generictrainer FIREBREATHER, BURT, EVENT_BEAT_FIREBREATHER_BURT, .SeenText, .BeatenText

	text "Ich bin der beste"
	line "Feuerspucker in"
	cont "KANTO."

	para "Aber nicht der"
	line "beste Trainer…"
	done
.SeenText:

	text "Komm schnell her"
	line "und schau!"
	done

.BeatenText:

	text "Toll! Das ist"
	line "heiß!"
	done

GenericTrainerBlackbeltManford:
	generictrainer BLACKBELT_T, MANFORD, EVENT_BEAT_BLACKBELT_MANFORD, .SeenText, .BeatenText

	text "Du musst bei einem"
	line "bekannten Meister"
	cont "trainiert haben!"
	done

.SeenText:
	text "Langsamer! Gib mir"
	line "eine Chance, dich"
	cont "zu besiegen!"
	done

.BeatenText:
	text "Ich wurde bei"
	line "meinem eigenen"
	cont "Spiel geschlagen…"
	done

GenericTrainerBlackbeltAnder:
	generictrainer BLACKBELT_T, ANDER, EVENT_BEAT_BLACKBELT_ANDER, .SeenText, .BeatenText

	text "Du bist den ganzen"
	line "Weg aus JOHTO"
	cont "gekommen?"
	para "Du musst sehr"
	line "hartnäckig sein!"
	done

.SeenText:
	text "Moment! Kämpf"
	line "gegen mich!"
	done

.BeatenText:
	text "Du hast es"
	line "geschafft…"
	done

GenericTrainerHikerBruce:
	generictrainer HIKER, BRUCE, EVENT_BEAT_HIKER_BRUCE, .SeenText, .BeatenText

	text "Na gut, ich sollte"
	line "meine Tasche"
	cont "wieder tragen!"
	done

.SeenText:
	text "Meine Tasche gräbt"
	line "sich in meine"
	cont "Schultern!"
	para "Ich mache Pause"
	line "und kämpfe!"
	done

.BeatenText:
	text "Feh."
	done

GenericTrainerHikerDwight:
	generictrainer HIKER, DWIGHT, EVENT_BEAT_HIKER_DWIGHT, .SeenText, .BeatenText

	text "Jemanden zu"
	line "grüßen, den du"
	cont "nicht kennst…"

	para "Das ist das"
	line "Schönste an"
	cont "Bergen!"
	done

.SeenText:
	text "Frieden!"

	para "Triffst du auf"
	line "einen Fremden am"
	cont "Bergpfad, willst"
	cont "du doch nur"

	para "Frieden, oder?"
	done

.BeatenText:
	text "Frieden - auch"
	line "wenn ich verloren"
	cont "hab!"
	done

GenericTrainerAceDuoZacandjen1:
	generictrainer ACE_DUO, ZACANDJEN1, EVENT_BEAT_ACE_DUO_ZAC_AND_JEN, .SeenText, .BeatenText

	text "ZAC: Deine Zukunft"
	line "sieht gut aus."
	done

.SeenText:
	text "ZAC: Willst du"
	line "wirklich gegen uns"
	cont "kämpfen?"
	para "Du hast viel Mut"
	line "für jemanden, der"
	cont "so jung ist."
	done

.BeatenText:
	text "ZAC: Du hast nicht"
	line "geblufft …"
	done

GenericTrainerAceDuoZacandjen2:
	generictrainer ACE_DUO, ZACANDJEN2, EVENT_BEAT_ACE_DUO_ZAC_AND_JEN, .SeenText, .BeatenText

	text "JEN: Ich freue"
	line "mich darauf,"

	para "zu sehen, was für"
	line "ein Trainer du"
	cont "wirst."
	done

.SeenText:
	text "JEN: Hä? Du willst"
	line "gegen uns"
	cont "antreten? Super!"
	done

.BeatenText:
	text "JEN: Du bist viel"
	line "stärker, als ich"
	cont "dachte."
	done

Route3MeteoriteText:
	text "So einen Stein hab"
	line "ich noch nie"
	cont "gesehen!"
	para "Könnte das ein"
	line "Meteorit aus dem"
	cont "Weltraum sein?"
	done

Route3MtMoonSquareSignText:
	; GSC-DE Dump
	text "MONDBERGPLATZ"
	line "Schutt abladen"
	cont "verboten"
	done



