CeruleanGym_MapScriptHeader:
	def_scene_scripts
	scene_script DoNothingScript, SCENE_CERULEANGYM_NOOP
	scene_script CeruleanGymGruntRunsOutScene, SCENE_CERULEANGYM_GRUNT_RUNS_OUT

	def_callbacks

	def_warp_events
	warp_event  4, 15, CERULEAN_CITY, 5
	warp_event  5, 15, CERULEAN_CITY, 5

	def_coord_events

	def_bg_events
	bg_event  3,  8, BGEVENT_IFNOTSET, CeruleanGymHiddenMachinePart
	bg_event  2, 13, BGEVENT_READ, CeruleanGymStatue1
	bg_event  6, 13, BGEVENT_READ, CeruleanGymStatue2

	def_object_events
	object_event  4, 10, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_CERULEAN_GYM_ROCKET
	object_event  5,  3, SPRITE_MISTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeruleanGymMistyScript, EVENT_TRAINERS_IN_CERULEAN_GYM
	object_event  4,  6, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmerfDiana, EVENT_TRAINERS_IN_CERULEAN_GYM
	object_event  1,  9, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSwimmerfBriana, EVENT_TRAINERS_IN_CERULEAN_GYM
	object_event  8,  9, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmerfViola, EVENT_TRAINERS_IN_CERULEAN_GYM
	object_event  0,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSailorParker, EVENT_TRAINERS_IN_CERULEAN_GYM
	object_event  9,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSailorEddie, EVENT_TRAINERS_IN_CERULEAN_GYM
	object_event  3, 13, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanGymGuyScript, EVENT_TRAINERS_IN_CERULEAN_GYM

	object_const_def
	const CERULEANGYM_ROCKET

CeruleanGymGruntRunsOutScene:
	sdefer .Script
	end

.Script:
	applymovement CERULEANGYM_ROCKET, CeruleanGymGruntRunsDownMovement
	playsound SFX_TACKLE
	applymovement CERULEANGYM_ROCKET, CeruleanGymGruntRunsIntoYouMovement
	playmusic MUSIC_ROCKET_ENCOUNTER
	showtext CeruleanGymGruntIntroText
	showemote EMOTE_SHOCK, CERULEANGYM_ROCKET, 15
	applymovement CERULEANGYM_ROCKET, CeruleanGymGruntBacksAwayMovement
	showtext CeruleanGymGruntBigMistakeText
	applyonemovement CERULEANGYM_ROCKET, big_step_down
	showtext CeruleanGymGruntByeText
	applymovement CERULEANGYM_ROCKET, CeruleanGymGruntRunsOutMovement
	playsound SFX_EXIT_BUILDING
	disappear CERULEANGYM_ROCKET
	setevent EVENT_MET_ROCKET_GRUNT_AT_CERULEAN_GYM
	clearevent EVENT_FOUND_MACHINE_PART_IN_CERULEAN_GYM
	clearevent EVENT_ROUTE_24_ROCKET
	setscene SCENE_CERULEANGYM_NOOP
	setmapscene POWER_PLANT, SCENE_POWERPLANT_NOOP
	waitsfx
	special RestartMapMusic
	pause 15
	turnobject PLAYER, DOWN
	pause 15
	end

CeruleanGymMistyScript:
	faceplayer
	opentext
	checkflag ENGINE_CASCADEBADGE
	iftruefwd .FightDone
	writetext MistyIntroText
	waitbutton
	closetext
	winlosstext MistyWinLossText, 0
	loadtrainer MISTY, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_MISTY
	setevent EVENT_BEAT_SWIMMERF_DIANA
	setevent EVENT_BEAT_SWIMMERF_VIOLA
	setevent EVENT_BEAT_SWIMMERF_BRIANA
	setevent EVENT_BEAT_SAILOR_PARKER
	setevent EVENT_BEAT_SAILOR_EDDIE
	opentext
	givebadge CASCADEBADGE, KANTO_REGION
	callstd kantopostgymevents
.FightDone:
	checkevent EVENT_GOT_TM63_WATER_PULSE
	iftrue_jumpopenedtext MistyFightDoneText
	writetext MistyGiveTMText
	promptbutton
	verbosegivetmhm TM_WATER_PULSE
	setevent EVENT_GOT_TM63_WATER_PULSE
	jumpthisopenedtext

	text "Sie enthält die"
	line "Attacke Water"
	cont "Pulse."

	para "Sie kann den"
	line "Gegner manchmal"
	cont "verwirren."
	done

GenericTrainerSwimmerfDiana:
	generictrainer SWIMMERF, DIANA, EVENT_BEAT_SWIMMERF_DIANA, SwimmerfDianaSeenText, SwimmerfDianaBeatenText

	text "Ich werde in Ruhe"
	line "vor mich hin-"
	cont "schwimmen."
	done
GenericTrainerSwimmerfViola:
	generictrainer SWIMMERF, VIOLA, EVENT_BEAT_SWIMMERF_VIOLA, SwimmerfViolaSeenText, SwimmerfViolaBeatenText

	text "Schwimmen ist gut"
	line "für Schönheit und"
	cont "Gesundheit!"

	para "Schau dir MISTY"
	line "an, dann siehst"
	cont "du es."
	done

GenericTrainerSwimmerfBriana:
	generictrainer SWIMMERF, BRIANA, EVENT_BEAT_SWIMMERF_BRIANA, SwimmerfBrianaSeenText, SwimmerfBrianaBeatenText

	text "Freue dich nicht"
	line "zu sehr über"
	cont "deinen Sieg."

	para "MISTY wird dich"
	line "fertig machen,"

	para "wenn du selbst-"
	line "gefällig wirst."
	done
GenericTrainerSailorParker:
	generictrainer SAILOR, PARKER, EVENT_BEAT_SAILOR_PARKER, SailorParkerSeenText, SailorParkerBeatenText

	text "MISTY ist in den"
	line "letzten Jahren"
	cont "immer besser"
	cont "geworden."

	para "Sei auf der Hut,"
	line "sonst wirst du"
	cont "platt gemacht!"
	done
GenericTrainerSailorEddie:
	generictrainer SAILOR, EDDIE, EVENT_BEAT_SAILOR_EDDIE, SailorEddieSeenText, SailorEddieBeatenText

	text "Hey, lass uns"
	line "schwimmen gehen!"

	para "Matrosen müssen"
	line "schwimmen können!"
	done

CeruleanGymGuyScript:
	checkevent EVENT_BEAT_MISTY
	iftrue_jumptextfaceplayer CeruleanGymGuyWinText
	jumpthistextfaceplayer

	text "He! Du CHAMP"
	line "in spe!"

	para "Nachdem MISTY weg"
	line "war, bin ich auch"

	para "los, um Spaß zu"
	line "haben. Hi-hi-hi."
	done
CeruleanGymHiddenMachinePart:
	dw EVENT_FOUND_MACHINE_PART_IN_CERULEAN_GYM
	checkevent EVENT_LEARNED_ABOUT_MACHINE_PART
	iffalse_jumptext CeruleanGymSomethingUnderwaterText
	givekeyitem MACHINE_PART
	opentext
	writetext CeruleanGymFoundMachinePartText
	special ShowKeyItemIcon
	playsound SFX_ITEM
	waitsfx
	keyitemnotify
	closetext
	setevent EVENT_FOUND_MACHINE_PART_IN_CERULEAN_GYM
	end

CeruleanGymStatue1:
	checkevent EVENT_TRAINERS_IN_CERULEAN_GYM
	iffalsefwd CeruleanGymStatue
	jumpthistext

	text "Tut mir leid, ich"
	line "bin eine Weile"
	cont "weg."
	cont "MISTY,"
	cont "Arenaleiterin"
	done

CeruleanGymStatue2:
	checkevent EVENT_TRAINERS_IN_CERULEAN_GYM
	iffalsefwd CeruleanGymStatue
	jumpthistext

	text "Da MISTY weg"
	line "ist, sind wir"
	cont "auch weg."
	cont "Arenatrainer"
	done

CeruleanGymStatue:
	gettrainername MISTY, 1, STRING_BUFFER_4
	checkflag ENGINE_CASCADEBADGE
	iftruefwd .Beaten
	jumpstd gymstatue1
.Beaten:
	jumpstd gymstatue2

CeruleanGymGruntRunsDownMovement:
	run_step_down
	run_step_down
	run_step_down
	run_step_down
	step_end

CeruleanGymGruntRunsOutMovement:
	run_step_right
	run_step_down
	step_end

CeruleanGymGruntRunsIntoYouMovement:
	fix_facing
	set_sliding
	jump_step_up
	remove_sliding
	remove_fixed_facing
	step_sleep_8
	step_sleep_8
	step_down
	step_down
	step_end

CeruleanGymGruntBacksAwayMovement:
	fix_facing
	slow_step_up
	remove_fixed_facing
	step_end

CeruleanGymGruntIntroText:
	text "Ups! Tut ja so"
	line "Leid mir! Du"
	cont "nicht"
	cont "verletzt, du"
	cont "O.K.?"

	para "Ich schwer"
	line "beschäftigt."
	cont "Nicht"
	cont "Zeit für Reden."
	cont "Nicht gut, wenn"
	cont "ich gesehen"
	cont "werden."
	done

CeruleanGymGruntBigMistakeText:
	text "Ach nein! Du mich"
	line "schon hast gese-"
	cont "hen! Ich großes"
	cont "Fehler gemacht!"
	done

CeruleanGymGruntByeText:
	text "He, du! Du ver-"
	line "gessen, dass du"

	para "mich gesehen, ja?"
	line "Du nichts sehen,"

	para "hören und wissen!"
	line "Tschüss!"

	para "Und Tschüss!"
	done

MistyIntroText:
	text "MISTY: Ich habe"
	line "dich erwartet, du"
	cont "Nervensäge!"

	para "Du hast zwar"
	line "viele ORDEN von"

	para "JOHTO, aber"
	line "unter-"
	line "schätze mich"
	cont "lieber nicht!"

	para "Meine Wasser-"
	line "#mon sind hart!"
	done

MistyWinLossText:
	text "MISTY: Du bist"
	line "wirklich gut…"

	para "Ich gebe zu, dass"
	line "du sehr geschickt"
	cont "bist…"

	para "Hier hast du den"
	line "QUELLORDEN."
	done

MistyGiveTMText:
	text "MISTY: Hier ist"
	line "noch eine"
	cont "Erinnerung an"

	para "diesen Kampf."
	line "Nimm sie!"
	done

MistyFightDoneText:
	text "MISTY: Gibt es"
	line "viele starke"
	cont "Trainer wie dich"
	cont "in JOHTO?"

	para "Eines Tages werde"
	line "ich mich"
	cont "aufmachen"

	para "und gegen einige"
	line "ausgebildete"
	cont "Trainer kämpfen."
	done

SwimmerfDianaSeenText:
	text "Es tut mir Leid,"
	line "dass ich so lange"
	cont "weg war. Lass uns"
	cont "anfangen!"
	done

SwimmerfDianaBeatenText:
	text "Ich gebe auf! Du"
	line "hast gewonnen!"
	done

SwimmerfViolaSeenText:
	text "Schwimmen geht"
	line "nicht nur ums"
	cont "Tempo!"

	para "Es geht auch um"
	line "Anmut und Schön-"
	cont "heit!"
	done

SwimmerfViolaBeatenText:
	text "Ich hab"
	line "wunderbar"
	cont "verloren…"
	done

SwimmerfBrianaSeenText:
	text "Ich hoffe, meine"
	line "elegante Art zu"
	cont "schwimmen"
	cont "zermürbt"
	cont "dich nicht."
	done

SwimmerfBrianaBeatenText:
	text "Ach, du hast mich"
	line "ohne viel Auf-"
	cont "hebens erledigt…"
	done

SailorParkerSeenText:
	text "Na los! Komm her!"
	done

SailorParkerBeatenText:
	text "Das darf nicht"
	line "wahr sein…"
	done
SailorEddieSeenText:
	text "Ich habe am Pool"
	line "entspannt, also"
	cont "habe ich genug"
	cont "Kraft!"
	done

SailorEddieBeatenText:
	text "Mit Kraft allein"
	line "kann man nicht"
	cont "gewinnen."
	done


CeruleanGymGuyWinText:
	text "Oje, du bist"
	line "ganz schön hart."

	para "Das war wie immer"
	line "ein super Kampf!"
	done
CeruleanGymFoundMachinePartText:
	text "<PLAYER> fand"
	line "Maschinenteil!"
	done

CeruleanGymSomethingUnderwaterText:
	text "Unter dem Wasser"
	line "ist etwas…"

	para "Vielleicht redet"
	line "der Rocket-Rüpel?"

	para "Wohin ist er"
	line "gelaufen?"
	done
