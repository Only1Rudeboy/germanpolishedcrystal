BlackthornGym2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_STONETABLE, BlackthornGym2FBoulders

	def_warp_events
	warp_event  1,  7, BLACKTHORN_GYM_1F, 3
	warp_event  7,  9, BLACKTHORN_GYM_1F, 4
	warp_event  2,  5, BLACKTHORN_GYM_1F, 5 ; hole
	warp_event  8,  7, BLACKTHORN_GYM_1F, 6 ; hole
	warp_event  8,  3, BLACKTHORN_GYM_1F, 7 ; hole

	def_coord_events

	def_bg_events

	def_object_events
	strengthboulder_event  8,  2, EVENT_BOULDER_IN_BLACKTHORN_GYM_1
	strengthboulder_event  2,  3, EVENT_BOULDER_IN_BLACKTHORN_GYM_2
	strengthboulder_event  6, 16, EVENT_BOULDER_IN_BLACKTHORN_GYM_3
	strengthboulder_event  3, 3
	strengthboulder_event  6, 1
	strengthboulder_event  8, 14
	object_event  4,  1, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCooltrainermCody, -1
	object_event  4, 11, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCooltrainerfFran, -1

	object_const_def
	const BLACKTHORNGYM2F_BOULDER1
	const BLACKTHORNGYM2F_BOULDER2
	const BLACKTHORNGYM2F_BOULDER3

BlackthornGym2FBoulders:
	usestonetable .BoulderTable
	endcallback

.BoulderTable:
	stonetable 5, BLACKTHORNGYM2F_BOULDER1, .Disappear4
	stonetable 3, BLACKTHORNGYM2F_BOULDER2, .Disappear5
	stonetable 4, BLACKTHORNGYM2F_BOULDER3, .Disappear6
	db -1 ; end

.Disappear4:
	disappear BLACKTHORNGYM2F_BOULDER1
	sjumpfwd .Fall

.Disappear5:
	disappear BLACKTHORNGYM2F_BOULDER2
	sjumpfwd .Fall

.Disappear6:
	disappear BLACKTHORNGYM2F_BOULDER3
	; fallthrough

.Fall:
	pause 30
	playsound SFX_STRENGTH
	earthquake 80
	jumpthistext

	text "Der Felsbrocken"
	line "ist durchgefallen!"
	done

GenericTrainerCooltrainermCody:
	generictrainer COOLTRAINERM, CODY, EVENT_BEAT_COOLTRAINERM_CODY, .SeenText, .BeatenText

	text "Mitglieder unseres"
	line "Drachenklans"
	para "dürfen"
	line "Drachen-#mon"
	cont "erst"
	para "einsetzen, wenn es"
	line "unser MEISTER"
	cont "erlaubt."
	done


.SeenText:
	text "Es ist nicht so,"
	line "als würden wir"
	cont "alle"
	cont "Drachen-#mon"
	cont "einsetzen."
	done


.BeatenText:
	text "Mist! Wenn ich"
	line "doch nur einen"
	cont "Drachen hätte!"
	done


GenericTrainerCooltrainerfFran:
	generictrainer COOLTRAINERF, FRAN, EVENT_BEAT_COOLTRAINERF_FRAN, .SeenText, .BeatenText

	text "Oh-oh… SANDRA wird"
	line "durchdrehen…"
	done


.SeenText:
	text "Ich kann es nicht"
	line "zulassen, dass ein"
	para "unwichtiger"
	line "Trainer an mir"
	cont "vorbei-kommt!"
	para "SANDRA wäre außer"
	line "sich, wenn ich"
	cont "dies zulasse!"
	done


.BeatenText:
	text "Awww… verloren…"
	done

