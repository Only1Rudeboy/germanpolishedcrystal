UnionCaveB2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, UnionCaveB2FLapras

	def_warp_events
	warp_event  5,  3, UNION_CAVE_B1F_SOUTH, 2

	def_coord_events

	def_bg_events
	bg_event  9,  4, BGEVENT_ITEM + CALCIUM, EVENT_UNION_CAVE_B2F_HIDDEN_CALCIUM
	bg_event  2, 25, BGEVENT_ITEM + ULTRA_BALL, EVENT_UNION_CAVE_B2F_HIDDEN_ULTRA_BALL

	def_object_events
	object_event 11, 31, SPRITE_LAPRAS, SPRITEMOVEDATA_SWIM_AROUND, 1, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, UnionCaveLapras, EVENT_UNION_CAVE_B2F_LAPRAS
	object_event 15, 19, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCooltrainermNick, -1
	object_event  5, 13, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCooltrainerfGwen, -1
	object_event  3, 30, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerCooltrainerfEmma, -1
	itemball_event  4, 11, ELIXIR, 1, EVENT_UNION_CAVE_B2F_ELIXIR
	itemball_event 12, 19, HYPER_POTION, 1, EVENT_UNION_CAVE_B2F_HYPER_POTION
	itemball_event 16,  2, LINKING_CORD, 1, EVENT_UNION_CAVE_B2F_LINKING_CORD

	object_const_def
	const UNIONCAVEB2F_LAPRAS

UnionCaveB2FLapras:
	checkflag ENGINE_UNION_CAVE_LAPRAS
	iftruefwd .NoAppear
	readvar VAR_WEEKDAY
	ifequalfwd FRIDAY, .Appear
.NoAppear:
	disappear UNIONCAVEB2F_LAPRAS
	endcallback

.Appear:
	appear UNIONCAVEB2F_LAPRAS
	endcallback

UnionCaveLapras:
	faceplayer
	cry LAPRAS
	loadwildmon LAPRAS, 25
	startbattle
	disappear UNIONCAVEB2F_LAPRAS
	setflag ENGINE_UNION_CAVE_LAPRAS
	reloadmapafterbattle
	end

GenericTrainerCooltrainermNick:
	generictrainer COOLTRAINERM, NICK, EVENT_BEAT_COOLTRAINERM_NICK, CooltrainermNickSeenText, CooltrainermNickBeatenText

	text "Dein #mon-Stil"
	line "ist imposant und"
	cont "abwechslungsreich,"
	cont "das gebe ich zu."
	para "Du wirst immer"
	line "besser!"
	done
GenericTrainerCooltrainerfGwen:
	generictrainer COOLTRAINERF, GWEN, EVENT_BEAT_COOLTRAINERF_GWEN, CooltrainerfGwenSeenText, CooltrainerfGwenBeatenText

	text "Ich werde solange"
	line "trainieren, bis"
	cont "ich besser bin."
	done
GenericTrainerCooltrainerfEmma:
	generictrainer COOLTRAINERF, EMMA, EVENT_BEAT_COOLTRAINERF_EMMA, CooltrainerfEmmaSeenText, CooltrainerfEmmaBeatenText

	text "Nur einmal in der"
	line "Woche kommt ein"
	cont "#mon ans"
	cont "Wasser."

	para "Dieses #mon"
	line "hätte ich gerne"
	cont "gesehen…"
	done
CooltrainermNickSeenText:
	text "Es gibt zwei"
	line "verschiedene Arten"
	cont "von Menschen."
	para "Jene mit Stil und"
	line "jene ohne."
	para "Zu welcher zählst"
	line "du dich?"
	done





CooltrainermNickBeatenText:
	text "Dein Stil ist"
	line "beeindruckend!"
	done





CooltrainerfGwenSeenText:
	text "Ich trainiere"
	line "momentan. Möchtest"
	cont "du kämpfen?"
	done





CooltrainerfGwenBeatenText:
	text "Ach, nein! Du bist"
	line "zu gut für mich."
	done





CooltrainerfEmmaSeenText:
	text "Für meine"
	line "Lieblings-#mon"
	cont "würde ich überall"
	cont "hingehen."
	para "Das würde jeder"
	line "wahre Trainer tun."
	done





CooltrainerfEmmaBeatenText:
	text "Ich kümmere mich"
	line "lieber um meine"
	cont "Babys, aber…!"
	done





