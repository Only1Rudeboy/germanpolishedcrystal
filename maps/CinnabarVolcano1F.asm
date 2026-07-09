CinnabarVolcano1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_STONETABLE, CinnabarVolcano1FBouldersFall

	def_warp_events
	warp_event 13, 25, CINNABAR_ISLAND, 2
	warp_event  5, 13, CINNABAR_VOLCANO_B1F, 1
	warp_event 14, 20, CINNABAR_VOLCANO_B1F, 2
	warp_event 25, 19, CINNABAR_VOLCANO_B1F, 3
	warp_event 22,  8, CINNABAR_VOLCANO_B1F, 4
	warp_event  8, 21, CINNABAR_VOLCANO_B1F, 8
	warp_event 20, 19, CINNABAR_VOLCANO_B1F, 9
	warp_event 18,  9, CINNABAR_VOLCANO_B1F, 10
	warp_event 10,  7, CINNABAR_VOLCANO_B1F, 11
	warp_event 15,  3, CINNABAR_VOLCANO_B1F, 12

	def_coord_events

	def_bg_events
	bg_event 13,  1, BGEVENT_ITEM + FULL_RESTORE, EVENT_CINNABAR_VOLCANO_1F_HIDDEN_FULL_RESTORE

	def_object_events
	object_event  4,  9, SPRITE_BUCK, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, 0, OBJECTTYPE_SCRIPT, 0, CinnabarVolcano1FBuckScript, EVENT_CINNABAR_VOLCANO_BUCK
	strengthboulder_event  6, 16, EVENT_BOULDER_IN_CINNABAR_VOLCANO_1F_1
	strengthboulder_event 15, 22, EVENT_BOULDER_IN_CINNABAR_VOLCANO_1F_2
	strengthboulder_event 19,  4, EVENT_BOULDER_IN_CINNABAR_VOLCANO_1F_3
	strengthboulder_event  5,  4, EVENT_BOULDER_IN_CINNABAR_VOLCANO_1F_4
	object_event  2, 19, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerScientistOskar, -1
	object_event 17, 24, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSuperNerdLuis, -1
	smashrock_event  5, 18
	smashrock_event 11, 21
	smashrock_event 35, 23
	smashrock_event 19, 11
	smashrock_event 25, 12
	smashrock_event 13, 2
	smashrock_event  8, 4

	object_const_def
	const CINNABARVOLCANO1F_BUCK
	const CINNABARVOLCANO1F_BOULDER1
	const CINNABARVOLCANO1F_BOULDER2
	const CINNABARVOLCANO1F_BOULDER3
	const CINNABARVOLCANO1F_BOULDER4

CinnabarVolcano1FBouldersFall:
	usestonetable .BoulderTable
	endcallback

.BoulderTable:
	stonetable 6, CINNABARVOLCANO1F_BOULDER1, .Disappear1
	stonetable 7, CINNABARVOLCANO1F_BOULDER2, .Disappear2
	stonetable 8, CINNABARVOLCANO1F_BOULDER3, .Disappear3
	stonetable 9, CINNABARVOLCANO1F_BOULDER4, .Disappear4
	db -1 ; end

.Disappear1:
	disappear CINNABARVOLCANO1F_BOULDER1
	sjumpfwd .Fall

.Disappear2:
	disappear CINNABARVOLCANO1F_BOULDER2
	sjumpfwd .Fall

.Disappear3:
	disappear CINNABARVOLCANO1F_BOULDER3
	sjumpfwd .Fall

.Disappear4:
	disappear CINNABARVOLCANO1F_BOULDER4
	; fallthrough

.Fall:
	pause 30
	playsound SFX_STRENGTH
	earthquake 80
	jumpthistext

	text "Der Felsen fiel"
	line "hindurch!"
	done
CinnabarVolcano1FBuckScript:
	faceplayer
	checkevent EVENT_BEAT_BUCK
	iftruefwd .Beaten
	opentext
	writetext .ChallengeText
	yesorno
	iffalse_jumpopenedtext .NoText
	writetext .YesText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked CINNABARVOLCANO1F_BUCK
	loadtrainer BUCK, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BUCK
.Beaten
	opentext
	writetext .ItemText
	promptbutton
	verbosegiveitem POWER_BELT
	iffalse_endtext
	writetext .GoodbyeText
	waitbutton
	closetext
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear CINNABARVOLCANO1F_BUCK
	pause 15
	special Special_FadeInQuickly
	clearevent EVENT_BATTLE_TOWER_BUCK
	end

.ChallengeText:
	text "Hallo! Ich bin"
	line "Buck."
	cont "Und du bist…"
	cont "<PLAYER>?"

	para "Sag nicht, du"
	line "suchst auch nach"
	cont "Schatz!"

	para "Der STARKBERG"
	line "bei mir zu Hause"

	para "hat tief innen"
	line "einen Schatz,"
	cont "also"
	cont "glaube ich, dass"
	cont "dieser Vulkan das"
	cont "auch tut!"

	para "Deshalb bin"
	line "ich hier."

	para "Also, <PLAYER>,"
	line "wie wäre es,"
	line "wenn wir um den"
	cont "Schatz"
	cont "kämp-"
	cont "fen?"
	done

.YesText:
	text "OK! Ich sag dir"
	line "schon jetzt:"
	line "Ich bin echt"
	cont "stark!"
	done

.NoText:
	text "Ich frage so"
	line "lange, bis du"
	cont "“Ja!” sagst!"
	done

.BeatenText:
	text "Heeheehee!"
	line "Du bist heiß!"
	done

.ItemText:
	text "Fweh! Zu heiß!"

	para "Der Schatz dieses"
	line "Vulkans ist"
	cont "nichts"
	cont "für mich…"

	para "Aber hey,"
	line "<PLAYER>!"
	line "Du bist ein"
	cont "toller"
	cont "Trainer!"

	para "Das hier"
	line "gefällt dir!"
	done

.GoodbyeText:
	text "Ich verbessere"
	line "wohl mein Team"
	line "in der Battle"
	cont "Tower."

	para "Bis bald,"
	line "<PLAYER>!"
	cont "Tschüss!"
	done

GenericTrainerScientistOskar:
	generictrainer SCIENTIST, OSKAR, EVENT_BEAT_SCIENTIST_OSKAR, ScientistOskarSeenText, ScientistOskarBeatenText

	text "Es ist wichtig,"
	line "Naturkatastrophen"
	cont "zu erforschen,"

	para "damit wir uns auf"
	line "die nächste"
	cont "vorbereiten."
	done

GenericTrainerSuperNerdLuis:
	generictrainer SUPER_NERD, LUIS, EVENT_BEAT_SUPER_NERD_LUIS, SuperNerdLuisSeenText, SuperNerdLuisBeatenText

	text "Es ist so auf-"
	line "regend, in einem"
	cont "Vulkan zu sein!"

	para "Aber gleichzeitig"
	line "auch gruselig."
	done

ScientistOskarSeenText:
	text "Ich erforsche den"
	line "Vulkan, um zu"
	cont "erfahren, warum"
	cont "er"
	cont "ausbrach."
	done

ScientistOskarBeatenText:
	text "Viel Glück beim"
	line "nächsten Mal!"
	done

SuperNerdLuisSeenText:
	text "Wusstest du, dass"
	line "Magma erst dann"

	para "Lava heißt, wenn"
	line "es durch einen"

	para "Vulkan die Ober-"
	line "fläche erreicht?"
	done

SuperNerdLuisBeatenText:
	text "Du hast mir"
	line "gerade"
	line "was beigebracht…"
	done
