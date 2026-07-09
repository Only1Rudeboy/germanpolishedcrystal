Route10North_MapScriptHeader:
	def_scene_scripts
	scene_script DoNothingScript, SCENE_ROUTE10NORTH_NOOP
	scene_script Route10NorthLawrenceScene, SCENE_ROUTE10NORTH_LAWRENCE

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route10NorthFlyPoint
	callback MAPCALLBACK_OBJECTS, Route10NorthZapdosCallback

	def_warp_events
	warp_event 11, 35, ROUTE_10_POKECENTER_1F, 1
	warp_event  3, 51, POWER_PLANT, 1
	warp_event  4, 43, ROCK_TUNNEL_2F, 1
	warp_event  8, 33, ROCK_TUNNEL_1F, 1
	warp_event 10,  1, DIM_CAVE_5F, 1

	def_coord_events

	def_bg_events
	bg_event  5, 53, BGEVENT_JUMPTEXT, PowerPlantSignText
	bg_event  7, 35, BGEVENT_JUMPTEXT, RockTunnelSignText

	def_object_events
	object_event 13, 44, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, ZAPDOS, -1, PAL_MON_YELLOW_BROWN, OBJECTTYPE_SCRIPT, PLAIN_FORM, Route10Zapdos, EVENT_ROUTE_10_ZAPDOS
	object_event  6, 52, SPRITE_LAWRENCE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LAWRENCE_ROUTE_10
	object_event 14, 52, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, ZAPDOS, -1, PAL_MON_YELLOW_BROWN, OBJECTTYPE_SCRIPT, PLAIN_FORM, ObjectEvent, EVENT_LAWRENCES_ZAPDOS_ROUTE_10
	object_event 12, 52, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_CHRIS_IN_NAVEL_ROCK
	object_event 12, 52, SPRITE_KRIS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_KRIS_IN_NAVEL_ROCK
	object_event 12, 52, SPRITE_CRYS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_CRYS_IN_NAVEL_ROCK
	object_event 12, 52, SPRITE_BETA, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BETA_IN_NAVEL_ROCK
	itemball_event 11,  3, FULL_RESTORE, 1, EVENT_ROUTE_10_FULL_RESTORE
	cuttree_event 11, 21, EVENT_ROUTE_10_CUT_TREE_1
	cuttree_event 14, 21, EVENT_ROUTE_10_CUT_TREE_2
	object_event  5, 10, SPRITE_FLOATING_BALL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Route10NorthElectrode, EVENT_ROUTE_10_NORTH_ELECTRODE

	object_const_def
	const ROUTE10_ZAPDOS
	const ROUTE10_LAWRENCE
	const ROUTE10_LAWRENCES_ZAPDOS
	const ROUTE10_CHRIS
	const ROUTE10_KRIS
	const ROUTE10_CRYS
	const ROUTE10_BETA

Route10NorthFlyPoint:
	setflag ENGINE_FLYPOINT_ROCK_TUNNEL
	endcallback

Route10NorthZapdosCallback:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iffalsefwd .NoAppear
	checkevent EVENT_ZAPDOS_GONE
	iffalsefwd .Appear
.NoAppear
	disappear ROUTE10_ZAPDOS
	endcallback
.Appear:
	appear ROUTE10_ZAPDOS
	endcallback

Route10NorthLawrenceScene:
	sdefer .Script
	end

.Script:
	applyonemovement PLAYER, step_down
	showemote EMOTE_SHOCK, ROUTE10_LAWRENCE, 15
	special Special_FadeOutMusic
	pause 15
	applymovement ROUTE10_LAWRENCE, Route10NorthMovementData_LawrenceApproach1
	turnobject PLAYER, RIGHT
	playmusic MUSIC_ZINNIA_ENCOUNTER_ORAS
	showtext Route10NorthLawrenceGreetingText
	follow ROUTE10_LAWRENCE, PLAYER
	applymovement ROUTE10_LAWRENCE, Route10NorthMovementData_LawrenceShowZapdos
	stopfollow
	turnobject ROUTE10_LAWRENCE, UP
	turnobject PLAYER, UP
	readvar VAR_PLAYERGENDER
	scalltable Route10NorthPanTable
	turnobject ROUTE10_LAWRENCE, LEFT
	turnobject PLAYER, RIGHT
	showtext Route10NorthLawrenceZapdosText
	appear ROUTE10_LAWRENCES_ZAPDOS
	playsound SFX_BALL_POOF
	turnobject ROUTE10_LAWRENCE, RIGHT
	waitsfx
	pause 15
	cry ZAPDOS
	waitsfx
	turnobject ROUTE10_LAWRENCE, DOWN
	showtext Route10NorthLawrenceFlyText
	playsound SFX_FLY
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear ROUTE10_LAWRENCE
	disappear ROUTE10_LAWRENCES_ZAPDOS
	waitsfx
	pause 15
	special Special_FadeInQuickly
	setscene SCENE_ROUTE10NORTH_NOOP
	special RestartMapMusic
	end

Route10NorthPanTable:
	table_width 2
	dw .Male
	dw .Female
	dw .Enby
	dw .Beta
	assert_table_length NUM_PLAYER_GENDERS

.Male:
	appear ROUTE10_CHRIS
	scall .PanUpAndDown
	disappear ROUTE10_CHRIS
	end

.Female:
	appear ROUTE10_KRIS
	scall .PanUpAndDown
	disappear ROUTE10_KRIS
	end

.Enby:
	appear ROUTE10_CRYS
	scall .PanUpAndDown
	disappear ROUTE10_CRYS
	end

.Beta:
	appear ROUTE10_BETA
	scall .PanUpAndDown
	disappear ROUTE10_BETA
	end

.PanUpAndDown:
	applyonemovement PLAYER, hide_object
	applymovement PLAYER, Route10NorthMovementData_PanUp
	pause 40
	disappear ROUTE10_LAWRENCE
	moveobject ROUTE10_LAWRENCE, 13, 52
	appear ROUTE10_LAWRENCE
	applymovement PLAYER, Route10NorthMovementData_PanDown
	applyonemovement PLAYER, show_object
	end

Route10NorthLawrenceEncounter2Script:
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	pause 15
	readvar VAR_FACING
	ifequalfwd UP, .up
	ifequalfwd DOWN, .down
	ifequalfwd LEFT, .left
.right
	moveobject ROUTE10_LAWRENCE, 7, 44
	moveobject ROUTE10_LAWRENCES_ZAPDOS, 10, 44
	appear ROUTE10_LAWRENCE
	applymovement ROUTE10_LAWRENCE, Route10NorthMovementData_LawrenceApproach2LeftRight
	turnobject PLAYER, LEFT
	sjumpfwd .continue
.up
	moveobject ROUTE10_LAWRENCE, 8, 44
	moveobject ROUTE10_LAWRENCES_ZAPDOS, 12, 44
	appear ROUTE10_LAWRENCE
	applymovement ROUTE10_LAWRENCE, Route10NorthMovementData_LawrenceApproach2UpDown
	turnobject ROUTE10_LAWRENCE, DOWN
	sjumpfwd .continue
.down
	moveobject ROUTE10_LAWRENCE, 8, 44
	moveobject ROUTE10_LAWRENCES_ZAPDOS, 12, 44
	appear ROUTE10_LAWRENCE
	applymovement ROUTE10_LAWRENCE, Route10NorthMovementData_LawrenceApproach2UpDown
	turnobject ROUTE10_LAWRENCE, UP
	sjumpfwd .continue
.left
	moveobject ROUTE10_LAWRENCE, 9, 44
	moveobject ROUTE10_LAWRENCES_ZAPDOS, 12, 44
	appear ROUTE10_LAWRENCE
	applymovement ROUTE10_LAWRENCE, Route10NorthMovementData_LawrenceApproach2LeftRight
.continue
	playmusic MUSIC_ZINNIA_ENCOUNTER_ORAS
	showtext Route10NorthLawrenceSpeechText
	pause 15
	appear ROUTE10_LAWRENCES_ZAPDOS
	playsound SFX_BALL_POOF
	turnobject ROUTE10_LAWRENCE, LEFT
	waitsfx
	pause 15
	cry ZAPDOS
	waitsfx
	turnobject ROUTE10_LAWRENCE, DOWN
	showtext Route10NorthLawrenceFlyText
	playsound SFX_FLY
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear ROUTE10_LAWRENCE
	disappear ROUTE10_LAWRENCES_ZAPDOS
	waitsfx
	pause 15
	special Special_FadeInQuickly
	setevent EVENT_HEARD_LAWRENCES_FINAL_SPEECH
	clearevent EVENT_LAWRENCE_SHAMOUTI_SHRINE_RUINS
	special RestartMapMusic
	end

Route10Zapdos:
	faceplayer
	opentext
	writetext ZapdosText
	cry ZAPDOS
	pause 15
	closetext
	loadwildmon ZAPDOS, 65
	loadvar VAR_BATTLETYPE, BATTLETYPE_LEGENDARY
	startbattle
	disappear ROUTE10_ZAPDOS
	setevent EVENT_ZAPDOS_GONE
	setevent EVENT_ROUTE_10_ZAPDOS
	reloadmapafterbattle
	special CheckBattleCaughtResult
	iffalsefwd .NoCatch
	setflag ENGINE_PLAYER_CAUGHT_ZAPDOS
.NoCatch
	checkevent EVENT_SEAFOAM_ISLANDS_ARTICUNO
	iffalsefwd .end
	checkevent EVENT_CINNABAR_VOLCANO_MOLTRES
	iffalsefwd .end
	special SpecialBirdsCheck
	iffalsefwd .end
	sjump Route10NorthLawrenceEncounter2Script
.end
	end

ZapdosText:
	text "Gyaoo!"
	done

Route10NorthElectrode:
	cry ELECTRODE
	loadwildmon ELECTRODE, 50
	startbattle
	disappear LAST_TALKED
	reloadmapafterbattle
	end

Route10NorthLawrenceGreetingText:
	text "Lawrence: Wir"
	line "treffen uns"
	line "wieder,"

	para "<PLAYER>. Ich"
	line "kam hierher auf"
	line "der Suche nach"

	para "dem legendären"
	line "Vogel des Feuers,"
	cont "fand aber den"
	cont "falschen."

	para "Siehst du dort"
	line "oben?"
	done

Route10NorthLawrenceZapdosText:
	text "Lawrence: Das ist"
	line "ein Zapdos."

	para "Es muss vom"
	line "Generator"
	cont "angezogen"
	cont "worden sein."

	para "…War das dein"
	line "Werk?"

	para "In dem Fall lasse"
	line "ich dir dieses"
	line "legen-"

	para "däre #mon zum"
	line "Fangen."

	para "Ich habe kein"
	line "Interesse an"
	cont "Duplikaten."
	done

Route10NorthLawrenceFlyText:
	text "Lawrence: Zapdos,"
	line "flieg!"
	done

Route10NorthLawrenceSpeechText:
	text "Lawrence: Hallo"
	line "wieder,"
	line "<PLAYER>."

	para "Du wolltest"
	line "Zapdos also"
	line "doch?"

	para "Ich dachte"
	line "schon, die"

	para "Legenden wären"
	line "dir egal."

	para "…Was?! Du hast"
	line "alle drei Vögel"
	line "gefangen?"
	cont "Unmöglich."

	para "Selbst ich mit"
	line "meinem Wissen und"

	para "meinen Mitteln"
	line "habe LAVADOS"
	cont "nicht gefunden…"

	para "Warum hast du"
	line "Erfolg, wo ich"
	cont "scheiterte?"

	para "Kannst du die"
	line "Majestät der"
	line "geflügelten"
	cont "Trugbilder"
	cont "würdigen?"

	para "Hast du je vom"
	line "Wächter des"

	para "Meeres gehört?"

	para "Das ist"
	line "inakzeptabel."

	para "Triff mich am"
	line "zerstörten"
	cont "Schrein"
	cont "auf"
	cont "Shamouti-Insel."

	para "Ich zeige dir,"
	line "dass ich diese"
	line "#mon verdient"
	cont "habe."
	done

RockTunnelSignText:
	text "FELSTUNNEL"
	done

PowerPlantSignText:
	text "KRAFTWERK KANTO"
	done


Route10NorthMovementData_LawrenceApproach1:
	step_left
	step_left
	step_end

Route10NorthMovementData_LawrenceShowZapdos:
	step_right
	step_right
	step_right
	step_right
Route10NorthMovementData_LawrenceApproach2UpDown:
	step_right
Route10NorthMovementData_LawrenceApproach2LeftRight:
	step_right
	step_right
	step_right
	step_right
	step_end

Route10NorthMovementData_PanUp:
	fix_facing
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	remove_fixed_facing
	step_end

Route10NorthMovementData_PanDown:
	fix_facing
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	remove_fixed_facing
	step_end
