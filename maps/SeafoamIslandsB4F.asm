SeafoamIslandsB4F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  3, SEAFOAM_ISLANDS_B3F, 5
	warp_event  7, 11, SEAFOAM_ISLANDS_B3F, 6
	warp_event 25,  7, SEAFOAM_ISLANDS_B3F, 7
	warp_event 27,  2, SEAFOAM_ISLANDS_B3F, 8
	warp_event 31, 13, SEAFOAM_ISLANDS_B3F, 9
	warp_event 37, 13, SEAFOAM_ISLANDS_B3F, 10

	def_coord_events

	def_bg_events

	def_object_events
	object_event 22, 13, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, ARTICUNO, -1, PAL_MON_BLUE, OBJECTTYPE_SCRIPT, PLAIN_FORM, SeafoamIslandsArticuno, EVENT_SEAFOAM_ISLANDS_ARTICUNO
	object_event 16, 16, SPRITE_LAPRAS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LAWRENCE_FINAL_BIRD_SURF
	object_event 21, 16, SPRITE_LAWRENCE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LAWRENCE_FINAL_BIRD
	itemball_event 33,  7, NEVERMELTICE, 1, EVENT_SEAFOAM_ISLANDS_B4F_NEVERMELTICE
	itemball_event 23,  2, ULTRA_BALL, 1, EVENT_SEAFOAM_ISLANDS_B4F_ULTRA_BALL

	object_const_def
	const SEAFOAMISLANDSB4F_ARTICUNO
	const SEAFOAMISLANDSB4F_LAWRENCE_SURF
	const SEAFOAMISLANDSB4F_LAWRENCE

SeafoamIslandsB4FLawrenceEncounterScript:
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	pause 15
	readvar VAR_FACING
	ifequalfwd UP, .up
	ifequalfwd DOWN, .down
	ifequalfwd LEFT, .left
.right
	appear SEAFOAMISLANDSB4F_LAWRENCE_SURF
	applymovement SEAFOAMISLANDSB4F_LAWRENCE_SURF, SeafoamIslandsB4FMovementData_LawrenceSurfApproach1
	turnobject SEAFOAMISLANDSB4F_LAWRENCE_SURF, UP
	disappear SEAFOAMISLANDSB4F_LAWRENCE_SURF
	appear SEAFOAMISLANDSB4F_LAWRENCE
	applymovement SEAFOAMISLANDSB4F_LAWRENCE, SeafoamIslandsB4FMovementData_LawrenceApproach
	turnobject PLAYER, DOWN
	sjumpfwd .continue
.up
	moveobject SEAFOAMISLANDSB4F_LAWRENCE_SURF, 17, 16
	appear SEAFOAMISLANDSB4F_LAWRENCE_SURF
	applymovement SEAFOAMISLANDSB4F_LAWRENCE_SURF, SeafoamIslandsB4FMovementData_LawrenceSurfApproach2
	turnobject SEAFOAMISLANDSB4F_LAWRENCE_SURF, UP
	disappear SEAFOAMISLANDSB4F_LAWRENCE_SURF
	appear SEAFOAMISLANDSB4F_LAWRENCE
	applymovement SEAFOAMISLANDSB4F_LAWRENCE, SeafoamIslandsB4FMovementData_LawrenceApproach
	turnobject SEAFOAMISLANDSB4F_LAWRENCE, RIGHT
	turnobject PLAYER, LEFT
	sjumpfwd .continue
.down
	moveobject SEAFOAMISLANDSB4F_LAWRENCE_SURF, 17, 16
	appear SEAFOAMISLANDSB4F_LAWRENCE_SURF
	applymovement SEAFOAMISLANDSB4F_LAWRENCE_SURF, SeafoamIslandsB4FMovementData_LawrenceSurfApproach2
	turnobject SEAFOAMISLANDSB4F_LAWRENCE_SURF, UP
	disappear SEAFOAMISLANDSB4F_LAWRENCE_SURF
	appear SEAFOAMISLANDSB4F_LAWRENCE
	applymovement SEAFOAMISLANDSB4F_LAWRENCE, SeafoamIslandsB4FMovementData_LawrenceApproach
	applymovement SEAFOAMISLANDSB4F_LAWRENCE, SeafoamIslandsB4FMovementData_LawrenceContinueDown
	turnobject SEAFOAMISLANDSB4F_LAWRENCE, RIGHT
	turnobject PLAYER, LEFT
	sjumpfwd .continue
.left
	moveobject SEAFOAMISLANDSB4F_LAWRENCE_SURF, 18, 16
	appear SEAFOAMISLANDSB4F_LAWRENCE_SURF
	applymovement SEAFOAMISLANDSB4F_LAWRENCE_SURF, SeafoamIslandsB4FMovementData_LawrenceSurfApproach3
	turnobject SEAFOAMISLANDSB4F_LAWRENCE_SURF, UP
	disappear SEAFOAMISLANDSB4F_LAWRENCE_SURF
	appear SEAFOAMISLANDSB4F_LAWRENCE
	applymovement SEAFOAMISLANDSB4F_LAWRENCE, SeafoamIslandsB4FMovementData_LawrenceApproach
	applymovement SEAFOAMISLANDSB4F_LAWRENCE, SeafoamIslandsB4FMovementData_LawrenceContinueLeft
.continue
	playmusic MUSIC_ZINNIA_ENCOUNTER_ORAS
	showtext SeafoamIslandsB4FLawrenceSpeechText
	turnobject SEAFOAMISLANDSB4F_LAWRENCE, UP
	opentext
	writetext SeafoamIslandsB4FLawrenceEscapeRopeText
	pause 15
	closetext
	playsound SFX_WARP_TO
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear SEAFOAMISLANDSB4F_LAWRENCE
	waitsfx
	special Special_FadeInQuickly
	setevent EVENT_HEARD_LAWRENCES_FINAL_SPEECH
	clearevent EVENT_LAWRENCE_SHAMOUTI_SHRINE_RUINS
	special RestartMapMusic
	end

SeafoamIslandsArticuno:
	faceplayer
	opentext
	writetext ArticunoText
	cry ARTICUNO
	pause 15
	closetext
	loadwildmon ARTICUNO, 65
	loadvar VAR_BATTLETYPE, BATTLETYPE_LEGENDARY
	startbattle
	disappear SEAFOAMISLANDSB4F_ARTICUNO
	setevent EVENT_SEAFOAM_ISLANDS_ARTICUNO
	reloadmapafterbattle
	special CheckBattleCaughtResult
	iffalsefwd .NoCatch
	setflag ENGINE_PLAYER_CAUGHT_ARTICUNO
.NoCatch
	checkevent EVENT_ROUTE_10_ZAPDOS
	iffalsefwd .end
	checkevent EVENT_CINNABAR_VOLCANO_MOLTRES
	iffalsefwd .end
	special SpecialBirdsCheck
	iffalsefwd .end
	sjump SeafoamIslandsB4FLawrenceEncounterScript
.end
	end

ArticunoText:
	text "Gyaoo!"
	done

SeafoamIslandsB4FLawrenceSpeechText:
	; PC (class C)
	text "Lawrence: Hallo"
	line "wieder, <PLAYER>."
	para "Also sammelst du"
	line "auch Legenden?"
	cont "Habe ich dich"
	cont "inspiriert?"
	para "…Was?! Du hast"
	line "alle drei Vögel"
	cont "gefangen?"
	cont "Unmöglich."
	para "Selbst ich mit"
	line "meinem Wissen und"
	para "meinen Mitteln"
	line "habe LAVADOS nicht"
	cont "gefunden…"
	para "Warum hast du"
	line "Erfolg, wo ich"
	cont "scheiterte?"
	para "Kannst du die"
	line "Majestät der"
	cont "geflügelten"
	cont "Trugbilder"
	cont "würdigen?"
	para "Hast du je vom"
	line "Wächter des"
	para "Meeres gehört?"
	para "Das ist"
	line "inakzeptabel."
	para "Triff mich am"
	line "zerstörten Schrein"
	cont "auf der"
	cont "SHAMOUTI-INSEL."
	para "Ich zeige dir,"
	line "dass ich diese"
	cont "#MON verdient"
	cont "habe."
	done

SeafoamIslandsB4FLawrenceEscapeRopeText:
	; PC (class C)
	text "Lawrence benutzt"
	line "FLUCHTSEIL!"
	done

SeafoamIslandsB4FMovementData_LawrenceSurfApproach1:
	step_right
SeafoamIslandsB4FMovementData_LawrenceSurfApproach2:
	step_right
SeafoamIslandsB4FMovementData_LawrenceSurfApproach3:
	step_right
	step_right
	step_right
	step_end

SeafoamIslandsB4FMovementData_LawrenceApproach:
	step_up
	slow_step_up
	step_end

SeafoamIslandsB4FMovementData_LawrenceContinueDown:
	slow_step_up
	slow_step_up
	step_end

SeafoamIslandsB4FMovementData_LawrenceContinueLeft:
	slow_step_up
	slow_step_right
	step_end
