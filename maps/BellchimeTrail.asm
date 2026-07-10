BellchimeTrail_MapScriptHeader:
	def_scene_scripts
	scene_script BellchimeTrailStepDownScene, SCENE_BELLCHIMETRAIL_STEP_DOWN
	scene_const SCENE_BELLCHIMETRAIL_NOOP

	def_callbacks
	callback MAPCALLBACK_OBJECTS, SetupValerieMorningWalkCallback

	def_warp_events
	warp_event  4,  4, WISE_TRIOS_ROOM, 1
	warp_event  4,  5, WISE_TRIOS_ROOM, 2
	warp_event 21,  9, TIN_TOWER_1F, 1 ; hole
	warp_event 12,  4, HIDDEN_TREE_GROTTO, 1

	def_coord_events
	coord_event 21,  9, SCENE_BELLCHIMETRAIL_NOOP, BellchimeTrailPanUpTrigger

	def_bg_events
	bg_event 22, 12, BGEVENT_JUMPTEXT, TinTowerSignText
	bg_event 12,  3, BGEVENT_JUMPSTD, treegrotto, HIDDENGROTTO_BELLCHIME_TRAIL
	bg_event 13,  3, BGEVENT_JUMPSTD, treegrotto, HIDDENGROTTO_BELLCHIME_TRAIL

	def_object_events
	object_event 16,  6, SPRITE_VALERIE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BellchimeTrailValerieScript, EVENT_VALERIE_BELLCHIME_TRAIL

	object_const_def
	const BELLCHIMETRAIL_VALERIE

BellchimeTrailStepDownScene:
	sdefer .Script
	end

.Script:
	readvar VAR_XCOORD
	ifnotequal 21, .Done
	readvar VAR_YCOORD
	ifnotequal 9, .Done
	applyonemovement PLAYER, step_down
.Done
	setscene SCENE_BELLCHIMETRAIL_NOOP
	end

SetupValerieMorningWalkCallback:
	checkevent EVENT_FOUGHT_SUICUNE
	iffalsefwd .Disappear
	checkevent EVENT_BEAT_VALERIE
	iffalsefwd .Appear
	checkflag ENGINE_VALERIE_MORNING_WALK
	iftruefwd .Disappear
	checktime 1 << MORN
	iffalsefwd .Disappear
.Appear:
	appear BELLCHIMETRAIL_VALERIE
	endcallback

.Disappear:
	disappear BELLCHIMETRAIL_VALERIE
	endcallback

BellchimeTrailPanUpTrigger:
	playsound SFX_EXIT_BUILDING
	applyonemovement PLAYER, hide_object
	waitsfx
	applymovement PLAYER, .PanUpMovement
	disappear PLAYER
	pause 10
	special Special_FadeOutMusic
	special FadeOutPalettes
	pause 15
	setscene SCENE_BELLCHIMETRAIL_STEP_DOWN
	warpfacing UP, TIN_TOWER_1F, 7, 15
	end

.PanUpMovement:
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end

TinTowerSignText:
	text "Glockenturm"

	para "Ein legendäres"
	line "#mon soll hier"
	cont "nisten."
	done

BellchimeTrailValerieScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_VALERIE
	iftruefwd .Rematch
	checkevent EVENT_LISTENED_TO_VALERIE
	iftruefwd .Listened
	writetext .IntroText
	waitbutton
	setevent EVENT_LISTENED_TO_VALERIE
.Listened:
	writetext .BattleText
	yesorno
	iffalse_jumpopenedtext .RefusedText
	writetext .AcceptedText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked BELLCHIMETRAIL_VALERIE
	loadtrainer VALERIE, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_VALERIE
	opentext
	writetext .RewardText
	promptbutton
	verbosegivetmhm TM_DAZZLINGLEAM
	setevent EVENT_GOT_TM49_DAZZLINGLEAM_FROM_VALERIE
	writetext .FarewellText
.Depart
	waitbutton
	closetext
	readvar VAR_FACING
	ifnotequal RIGHT, .SkipGoAround
	applymovement BELLCHIMETRAIL_VALERIE, .ValerieGoesAroundMovement
.SkipGoAround
	applymovement BELLCHIMETRAIL_VALERIE, .ValerieDepartsMovement
	disappear BELLCHIMETRAIL_VALERIE
	clearevent EVENT_VALERIE_ECRUTEAK_CITY
	setflag ENGINE_VALERIE_MORNING_WALK
	end

.Rematch:
	writetext .RematchText
	waitbutton
	closetext
	winlosstext .RematchBeatenText, 0
	setlasttalked BELLCHIMETRAIL_VALERIE
	readvar VAR_BADGES
	ifequalfwd 16, .Battle3
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd .Battle2
	loadtrainer VALERIE, 1
	startbattle
	reloadmapafterbattle
	sjumpfwd .AfterRematch

.Battle2:
	loadtrainer VALERIE, 2
	startbattle
	reloadmapafterbattle
	sjumpfwd .AfterRematch

.Battle3:
	loadtrainer VALERIE, 3
	startbattle
	reloadmapafterbattle
	; fallthrough

.AfterRematch:
	opentext
	writetext .RematchFarewellText
	sjump .Depart

.IntroText:
	text "Sieh an, der"
	line "Trainer, der"
	cont "Suicune gegen-"

	para "überstand…"

	para "Ich bin Valerie."
	line "Ich komme hierher,"

	para "um mich von seiner"
	line "Schönheit"
	cont "verzaubern zu"

	para "lassen."

	para "Heute hatte ich"
	line "das Glück, deinen"
	cont "Kampf mit einer"

	para "Legende zu"
	line "erleben…"

	para "Ich würde gern"
	line "gegen jemanden"
	cont "antreten, der das"

	para "Auge eines"
	line "legendären #mon"
	cont "auf sich zog."
	done

.BattleText:
	text "Valerie: Ich"
	line "trainiere den"
	cont "schwer fassbaren"

	para "Feen-Typ."

	para "Sie wirken"
	line "zerbrechlich und"
	cont "zart, doch sie"

	para "sind stark."

	para "Kämpfst du mit"
	line "mir?"
	done

.RefusedText:
	text "Valerie: Ach…"
	done

.AcceptedText:
	text "Valerie: Ich"
	line "hoffe, unser"

	para "Kampf wird dir"
	line "gefallen."
	done

.BeatenText:
	text "Ich hoffe, morgen"
	line "scheint die Sonne…"

	para "Das wäre Grund"
	line "genug zu lächeln."
	done

.RewardText:
	text "Valerie: Ja… das"
	line "war ein feiner"
	cont "Kampf."

	para "Ich belohne dich"
	line "für diesen großen"
	cont "Sieg."

	para "Betrachte dies"
	line "bitte als"
	cont "persönliches"

	para "Geschenk von mir."
	done

.FarewellText:
	text "Valerie: Oh? Was"
	line "für ein seltsames"
	cont "Gefühl…"

	para "Ich kann mich"
	line "nicht erinnern,"
	cont "welche Attacke"

	para "in dieser VM ist."

	para "Ich hoffe, du"
	line "verzeihst mir."

	para "Das war wirklich"
	line "ein fesselnder"
	cont "Kampf."

	para "Vielleicht bin ich"
	line "von dir gefesselt."

	para "Bis wir uns"
	line "wiedersehen, leb"
	cont "wohl."
	done

.RematchText:
	text "Valerie: Oh, sieh"
	line "an, mein junger"
	cont "Trainer…"

	para "Wie schön, dich so"
	line "wiederzusehen."

	para "Dann hast du dir"
	line "wohl das Recht auf"
	cont "einen Kampf"

	para "verdient."

	para "Der schwer"
	line "fassbare Feen-Typ"
	cont "mag zart wie die"

	para "Brise und die"
	line "Blüte wirken,"

	para "doch er ist stark."
	done

.RematchBeatenText:
	text "Ich hoffe, du"
	line "findest morgen"

	para "etwas, das dich"
	line "lächeln lässt…"
	done

.RematchFarewellText:
	text "Das war wirklich"
	line "ein fesselnder"
	cont "Kampf."

	para "Vielleicht bin ich"
	line "von dir gefesselt."

	para "Bis wir uns"
	line "wiedersehen, leb"
	cont "wohl."
	done

.ValerieGoesAroundMovement:
	step_down
	step_left
	step_end

.ValerieDepartsMovement:
	step_left
	step_left
	step_left
	step_up
	step_up
	step_left
	step_left
	step_end
