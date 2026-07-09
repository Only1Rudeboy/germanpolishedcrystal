FarawayIsland_MapScriptHeader:
	def_scene_scripts
	scene_script DoNothingScript, SCENE_FARAWAYISLAND_NOOP
	scene_script FarawayIslandArrivalScene, SCENE_FARAWAYISLAND_ARRIVAL

	def_callbacks
	callback MAPCALLBACK_NEWMAP, FarawayIslandVisited
	callback MAPCALLBACK_OBJECTS, FarawayIslandSetupLawrence

	def_warp_events
	warp_event 22,  8, FARAWAY_JUNGLE, 1
	warp_event 23,  8, FARAWAY_JUNGLE, 2

	def_coord_events

	def_bg_events
	bg_event  4, 34, BGEVENT_JUMPTEXT, FarawayIslandSignText

	def_object_events
	object_event 12, 42, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, FarawayIslandSailorScript, EVENT_OLIVINE_PORT_SAILOR_AT_GANGWAY
	object_event  3, 37, SPRITE_LAWRENCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, FarawayIslandLawrenceScript, EVENT_LAWRENCE_FARAWAY_ISLAND

	object_const_def
	const FARAWAYISLAND_SAILOR
	const FARAWAYISLAND_LAWRENCE

FarawayIslandVisited:
	setevent EVENT_VISITED_FARAWAY_ISLAND
	endcallback

FarawayIslandSetupLawrence:
	disappear FARAWAYISLAND_LAWRENCE
	checkevent EVENT_BEAT_LAWRENCE
	iffalsefwd .Done
	checkevent EVENT_BEAT_LAWRENCE_AGAIN
	iftruefwd .Done
	appear FARAWAYISLAND_LAWRENCE
.Done
	endcallback

FarawayIslandArrivalScene:
	sdefer .Script
	end

.Script:
	applymovement FARAWAYISLAND_SAILOR, FarawayIslandSailorArrive1MovementData
	applymovement PLAYER, FarawayIslandPlayerArriveMovementData
	showtext SeagallopFerryFarawayIslandRefusedText
	applymovement FARAWAYISLAND_SAILOR, FarawayIslandSailorArrive2MovementData
	setscene SCENE_FARAWAYISLAND_NOOP
	end

FarawayIslandSailorScript:
	faceplayer
	opentext
	writetext SeagallopFerryFarawayToVermilionQuestionText
	yesorno
	iffalsefwd .RefuseFerry
	writetext SeagallopFerryFarawayToVermilionText
	waitbutton
	closetext
	turnobject FARAWAYISLAND_SAILOR, DOWN
	pause 10
	applyonemovement FARAWAYISLAND_SAILOR, turn_head_down
	playsound SFX_EXIT_BUILDING
	disappear FARAWAYISLAND_SAILOR
	waitsfx
	applyonemovement PLAYER, step_down
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	waitsfx
	appear FARAWAYISLAND_SAILOR
	setmapscene SEAGALLOP_FERRY_VERMILION_GATE, SCENE_SEAGALLOPFERRYVERMILIONGATE_LEAVE
	warp SEAGALLOP_FERRY_VERMILION_GATE, 6, 5
	end

.RefuseFerry
	jumpopenedtext SeagallopFerryFarawayIslandRefusedText

FarawayIslandLawrenceScript:
	special Special_FadeOutMusic
	pause 15
	playmusic MUSIC_ZINNIA_ENCOUNTER_ORAS
	faceplayer
	opentext
	writetext FarawayIslandLawrenceText1
	yesorno
	iffalsefwd .no_battle
	writetext FarawayIslandLawrenceYesText
	waitbutton
	closetext
	winlosstext FarawayIslandLawrenceBeatenText, 0
	setlasttalked FARAWAYISLAND_LAWRENCE
	loadtrainer LAWRENCE, 2
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	faceplayer
	special DeleteSavedMusic
	playmusic MUSIC_ZINNIA_ENCOUNTER_ORAS
	showtext FarawayIslandLawrenceText2
	pause 15
	playsound SFX_WARP_TO
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear FARAWAYISLAND_LAWRENCE
	waitsfx
	special Special_FadeInQuickly
	setevent EVENT_BEAT_LAWRENCE_AGAIN
	setevent EVENT_LAWRENCE_FARAWAY_ISLAND
	playmapmusic
	end

.no_battle:
	writetext FarawayIslandLawrenceNoText
	waitbutton
	closetext
	turnobject FARAWAYISLAND_LAWRENCE, DOWN
	playmapmusic
	end

FarawayIslandPlayerArriveMovementData:
	step_up
	step_up
	turn_head_down
	step_end

FarawayIslandSailorArrive1MovementData:
	step_up
	step_left
	turn_head_right
	step_end

FarawayIslandSailorArrive2MovementData:
	step_right
	step_down
	turn_head_up
	step_end

SeagallopFerryFarawayToVermilionQuestionText:
	text "Zurück nach"
	line "ORANIA CITY?"
	done

SeagallopFerryFarawayToVermilionText:
	text "Alles klar!"

	para "Alle an Bord"
	line "der Seegallop-"
	cont "Fähre!"
	done

SeagallopFerryFarawayIslandRefusedText:
	text "Ich warte hier."
	done

FarawayIslandLawrenceText1:
	text "Lawrence: Nun,"
	line "das ist wirklich"

	para "eine Freude,"
	line "wenn auch eine"
	cont "unerwartete."

	para "Ich kam her, um"
	line "mich zu erinnern,"

	para "wie meine"
	line "Sammlung begann…"

	para "mit einer Mew-"
	line "Schnitzerei, die"
	cont "auf dieser"
	cont "Insel gefunden"
	cont "wurde."

	para "…Ich hab über"
	line "unseren letzten"
	cont "Kampf"
	cont "nachgedacht."

	para "Ich möchte die"
	line "Bindung verste-"
	cont "hen, die du zu"

	para "deiner Sammlung"
	line "hast."

	para "Willst du noch"
	line "mal gegen mich"
	cont "kämpfen?"
	done

FarawayIslandLawrenceYesText:
	text "Ausgezeichnet!"
	done

FarawayIslandLawrenceNoText:
	text "…Na gut."
	done

FarawayIslandLawrenceBeatenText:
	text "Du hast mich"
	line "wieder besiegt…"
	done

FarawayIslandLawrenceText2:
	text "Lawrence: …Ich"
	line "sehe. Ich hab"
	cont "noch weit zu"
	cont "gehen,"

	para "ehe ich eine noch"
	line "bessere"
	cont "Sammlung aufbauen"
	cont "kann."

	para "Lebewohl."
	done

FarawayIslandSignText:
	text "Die Schrift ver-"
	line "blasst, als wäre"
	cont "sie"

	para "vor langer Zeit"
	line "geschrieben…"

	para "“…ber, 6. Tag"

	para "Sollte je ein"
	line "Mensch"
	line "wieder hierher"
	cont "kommen… möge es"
	cont "ein"
	cont "gutherziger"
	cont "Mensch"

	para "…mit dieser"
	line "Hoffnung"
	line "gehe ich…"

	para "…ji"
	done
