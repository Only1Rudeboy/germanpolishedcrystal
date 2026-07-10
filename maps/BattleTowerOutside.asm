BattleTowerOutside_MapScriptHeader:
	def_scene_scripts
	scene_script BattleTowerOutsideStepDownScene, SCENE_BATTLETOWEROUTSIDE_STEP_DOWN
	scene_const SCENE_BATTLETOWEROUTSIDE_NOOP

	def_callbacks

	def_warp_events
	warp_event  8, 21, ROUTE_40_BATTLE_TOWER_GATE, 3
	warp_event  9, 21, ROUTE_40_BATTLE_TOWER_GATE, 4
	warp_event  8,  9, BATTLE_TOWER_1F, 1 ; hole
	warp_event  9,  9, BATTLE_TOWER_1F, 2 ; hole

	def_coord_events
	coord_event  8,  9, SCENE_BATTLETOWEROUTSIDE_NOOP, BattleTowerOutsidePanUpTrigger1
	coord_event  9,  9, SCENE_BATTLETOWEROUTSIDE_NOOP, BattleTowerOutsidePanUpTrigger2

	def_bg_events
	bg_event 10, 10, BGEVENT_JUMPTEXT, BattleTowerOutsideSignText

	def_object_events
	object_event 15,  7, SPRITE_ANABEL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTowerOutsideAnabelScript, EVENT_BATTLE_TOWER_OUTSIDE_ANABEL
	object_event  6, 12, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleTowerOutsideYoungsterScript, -1
	object_event 13, 11, SPRITE_BEAUTY, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTowerOutsideBeautyScript, -1
	object_event 12, 18, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, BattleTowerOutsideSailorText, EVENT_BATTLE_TOWER_CLOSED
	object_event 12, 24, SPRITE_PICNICKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  8,  9, SPRITE_BLANK_FRUIT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptext, BattleTowerOutsideDoorsClosedText, EVENT_BATTLE_TOWER_OPEN
	object_event  9,  9, SPRITE_BLANK_FRUIT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptext, BattleTowerOutsideDoorsClosedText, EVENT_BATTLE_TOWER_OPEN

	object_const_def
	const BATTLETOWEROUTSIDE_ANABEL

BattleTowerOutsideStepDownScene:
	sdefer .Script
	end

.Script:
	readvar VAR_YCOORD
	ifnotequal 9, .Done
	readvar VAR_XCOORD
	ifequalfwd 8, .Down
	ifnotequal 9, .Done
.Down
	applyonemovement PLAYER, step_down
.Done
	setscene SCENE_BATTLETOWEROUTSIDE_NOOP
	end

BattleTowerOutsidePanUpTrigger1:
	scall BattleTowerOutsidePanUpHelperScript
	warpfacing UP, BATTLE_TOWER_1F, 10, 15
	end

BattleTowerOutsidePanUpTrigger2:
	scall BattleTowerOutsidePanUpHelperScript
	warpfacing UP, BATTLE_TOWER_1F, 11, 15
	end

BattleTowerOutsidePanUpHelperScript:
	playsound SFX_EXIT_BUILDING
	applyonemovement PLAYER, hide_object
	waitsfx
	applymovement PLAYER, .PanUpMovement
	disappear PLAYER
	pause 10
	special Special_FadeOutMusic
	special FadeOutPalettes
	pause 15
	setscene SCENE_BATTLETOWEROUTSIDE_STEP_DOWN
	end

.PanUpMovement:
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end

BattleTowerOutsideSignText:
	text "Kampfturm"

	para "Die ultimative"
	line "Trainer-Heraus-"
	cont "forderung!"
	done

BattleTowerOutsideAnabelScript:
	faceplayer
	checkevent EVENT_BEAT_ANABEL
	iftruefwd .Beaten
	opentext
	writetext .ChallengeText
	yesorno
	iffalse_jumpopenedtext .NoText
	writetext .YesText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked BATTLETOWEROUTSIDE_ANABEL
	loadtrainer ANABEL, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ANABEL
.Beaten
	opentext
	writetext .ItemText
	promptbutton
	verbosegiveitem POWER_BAND
	iffalse_endtext
	writetext .GoodbyeText
	waitbutton
	closetext
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear BATTLETOWEROUTSIDE_ANABEL
	pause 15
	special Special_FadeInQuickly
	clearevent EVENT_BATTLE_TOWER_ANABEL
	end

.ChallengeText:
	text "Sei gegrüßt… Mein"
	line "Name ist Anabel."

	para "…Du bist <PLAYER>?"
	line "Ich hörte einige"
	cont "Gerüchte über"
	cont "dich…"

	para "Zeig mir dein"
	line "volles Talent…"
	done

.YesText:
	text "Fangen wir an,"
	line "ja?"
	done

.NoText:
	text "Das ist sehr"
	line "enttäuschend…"
	done

.BeatenText:
	text "Okay, ich"
	line "verstehe…"
	done

.ItemText:
	text "Fufufu, gut"
	line "gemacht…"

	para "Nimm das bitte…"
	done

.GoodbyeText:
	text "Ich bitte dich,"
	line "weiter zu kämpfen"
	cont "und zu siegen."

	para "Ich werde hier im"
	line "Kampfturm auf dich"
	cont "warten."

	para "Bis wir uns das"
	line "nächste Mal"
	cont "treffen…"
	done

BattleTowerOutsideYoungsterScript:
	checkevent EVENT_BATTLE_TOWER_OPEN
	iftrue_jumptextfaceplayer .OpenText
	jumpthistextfaceplayer

	text "Wow, der"
	line "Kampfturm ist"
	cont "riesig! Mein"

	para "Nacken tut vom"
	line "Hochschauen weh."
	done

.OpenText:
	text "Wow, der"
	line "Kampfturm ist"
	cont "riesig!"

	para "Da drin müssen"
	line "viele Arten von"
	cont "#mon sein!"
	done

BattleTowerOutsideBeautyScript:
	checkevent EVENT_BATTLE_TOWER_OPEN
	iftrue_jumptextfaceplayer .OpenText
	jumpthistextfaceplayer

	text "Was macht man"
	line "hier bloß?"

	para "Nach dem Namen zu"
	line "urteilen, sind es"
	cont "wohl #mon-"
	cont "Kämpfe."
	done

.OpenText:
	text "Du darfst nur"
	line "drei #mon"
	cont "nutzen."

	para "Es ist so schwer,"
	line "die drei"
	cont "auszuwählen, die"

	para "kämpfen sollen…"
	done

BattleTowerOutsideSailorText:
	text "Hehehe, ich hab"
	line "mich von der"
	cont "Arbeit"
	cont "geschlichen."

	para "Ich kann nicht"
	line "aufgeben, bis ich"
	cont "gewonnen hab!"

	para "Ich muss einfach"
	line "alles gewinnen!"
	done

BattleTowerOutsideDoorsClosedText:
	text "Die Türen des"
	line "Kampfturms sind"
	cont "geschlossen…"
	done
