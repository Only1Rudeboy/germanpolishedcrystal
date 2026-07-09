EcruteakHouse_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_ECRUTEAKHOUSE_SAGE_BLOCKS
	scene_const SCENE_ECRUTEAKHOUSE_NOOP

	def_callbacks
	callback MAPCALLBACK_OBJECTS, EcruteakHouseInitializeSages

	def_warp_events
	warp_event  4, 17, ECRUTEAK_CITY, 3
	warp_event  5, 17, ECRUTEAK_CITY, 3
	warp_event  5,  3, ECRUTEAK_HOUSE, 4
	warp_event 17, 15, ECRUTEAK_HOUSE, 3
	warp_event 17,  3, WISE_TRIOS_ROOM, 3

	def_coord_events
	coord_event  4,  7, SCENE_ECRUTEAKHOUSE_SAGE_BLOCKS, EcruteakHouse_XYTrigger1
	coord_event  5,  7, SCENE_ECRUTEAKHOUSE_SAGE_BLOCKS, EcruteakHouse_XYTrigger2

	def_bg_events

	def_object_events
	object_event  4,  6, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakTinTowerEntranceSageScript, EVENT_RANG_CLEAR_BELL_1
	object_event  5,  6, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakTinTowerEntranceSageScript, EVENT_RANG_CLEAR_BELL_2
	object_event  6,  9, SPRITE_SAGE, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakTinTowerEntranceWanderingSageScript, EVENT_ECRUTEAK_HOUSE_WANDERING_SAGE
	object_event  3, 11, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakTinTowerEntranceGrampsText, EVENT_ECRUTEAK_HOUSE_WANDERING_SAGE

	object_const_def
	const ECRUTEAKHOUSE_SAGE1
	const ECRUTEAKHOUSE_SAGE2

EcruteakHouseInitializeSages:
	checkevent EVENT_FOUGHT_SUICUNE
	iftruefwd .DontBlockTower
	checkevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	iftruefwd .DontBlockTower
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftruefwd .BlockTower
	endcallback

.BlockTower:
	clearevent EVENT_RANG_CLEAR_BELL_1
	setevent EVENT_RANG_CLEAR_BELL_2
	setevent EVENT_ECRUTEAK_HOUSE_WANDERING_SAGE
	checkkeyitem CLEAR_BELL
	iftruefwd .NoClearBell
	setscene SCENE_ECRUTEAKHOUSE_SAGE_BLOCKS
.NoClearBell:
	endcallback

.DontBlockTower:
	clearevent EVENT_ECRUTEAK_HOUSE_WANDERING_SAGE
	endcallback

EcruteakHouse_XYTrigger1:
	checkevent EVENT_RANG_CLEAR_BELL_2
	iftruefwd EcruteakHouse_XYTrigger_DontMove
	applymovement ECRUTEAKHOUSE_SAGE2, EcruteakTinTowerEntranceSageBlocksLeftMovement
	moveobject ECRUTEAKHOUSE_SAGE1, 4, 6
	appear ECRUTEAKHOUSE_SAGE1
	pause 5
	callasm UpdateSprites
	disappear ECRUTEAKHOUSE_SAGE2
	end

EcruteakHouse_XYTrigger2:
	checkevent EVENT_RANG_CLEAR_BELL_1
	iftruefwd EcruteakHouse_XYTrigger_DontMove
	applymovement ECRUTEAKHOUSE_SAGE1, EcruteakTinTowerEntranceSageBlocksRightMovement
	moveobject ECRUTEAKHOUSE_SAGE2, 5, 6
	appear ECRUTEAKHOUSE_SAGE2
	pause 5
	callasm UpdateSprites
	disappear ECRUTEAKHOUSE_SAGE1
	end

EcruteakHouse_XYTrigger_DontMove:
	end

EcruteakTinTowerEntranceSageScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftruefwd .CheckForClearBell
	checkflag ENGINE_FOGBADGE
	iftrue_jumpopenedtext EcruteakTinTowerEntranceSageText_GotFogBadge
	jumpthisopenedtext

	text "Der Glockenturm"
	line "ist für alle ohne"

	para "den Orden der"
	line "ARENA von TEAK"
	cont "CITY tabu."

	para "Tut mir leid, du"
	line "musst gehen."
	done

.CheckForClearBell:
	checkevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	iftrue_jumpopenedtext EcruteakTinTowerEntranceSageText_PleaseDoGoOn
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue_jumpopenedtext EcruteakTinTowerEntranceSageText_HeardClearBell
	checkkeyitem CLEAR_BELL
	iftruefwd .RingClearBell
	jumpthisopenedtext

	text "Ein denkwürdiger"
	line "Augenblick."

	para "Entschuldigung,"
	line "aber ich muss"
	cont "dich"
	cont "bitten zu gehen."

	para "…Was lindert"
	line "Seelenschmerzen…"

	para "Das TRIO der"
	line "WEISEN sagt stets"

	para "Dinge, die sehr"
	line "schwierig zu ver-"
	cont "stehen sind…"
	done
.RingClearBell:
	writetext EcruteakTinTowerEntranceSageText_HearsClearBell
	waitbutton
	closetext
	setscene SCENE_ECRUTEAKHOUSE_NOOP
	setevent EVENT_RANG_CLEAR_BELL_2
	clearevent EVENT_RANG_CLEAR_BELL_1
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	end

EcruteakTinTowerEntranceWanderingSageScript:
	checkevent EVENT_GOT_CLEAR_BELL
	iftrue_jumptextfaceplayer EcruteakTinTowerEntranceWanderingSageText_GotClearBell
	jumpthistextfaceplayer

	text "Der Glockenturm"
	line "dort ist ein"
	cont "neun-"
	cont "stöckiger Turm"

	para "von göttlicher"
	line "Schönheit."

	para "Er beruhigt die"
	line "Seele aller, die"
	cont "ihn sehen."
	done

EcruteakTinTowerEntranceSageBlocksLeftMovement:
	fix_facing
	run_step_left
	remove_fixed_facing
	turn_head_down
	step_end

EcruteakTinTowerEntranceSageBlocksRightMovement:
	fix_facing
	run_step_right
	remove_fixed_facing
	turn_head_down
	step_end


EcruteakTinTowerEntranceSageText_GotFogBadge:
	text "Der Glockenturm"
	line "ist für alle ohne"

	para "den Orden der"
	line "ARENA von TEAK"
	cont "CITY tabu."

	para "Ah!"

	para "Der Orden von"
	line "TEAK CITY! Bitte,"
	cont "geh"
	cont "einfach durch."
	done


EcruteakTinTowerEntranceSageText_HearsClearBell:
	text "Ein denkwürdiger"
	line "Moment ist"

	para "eingetroffen."

	para "Verzeihung, aber"
	line "ich muss dich"

	para "bitten zu gehen."

	para "………………"

	para "Ah!"

	para "Der Klang der"
	line "Klarglocke!"

	para "Er… er ist"
	line "erhaben!"

	para "So einen wunder-"
	line "schönen Klang hab"

	para "ich noch nie"
	line "gehört!"

	para "Der Klang dieser"
	line "Glocke spiegelt"
	cont "die Seele des"
	cont "Trägers wider."

	para "Du…"

	para "Du schaffst es"
	line "vielleicht durch"
	cont "den Glockenturm."

	para "Bitte, geh"
	line "weiter."
	done

EcruteakTinTowerEntranceSageText_PleaseDoGoOn:
	text "Schreite voran."
	done
EcruteakTinTowerEntranceSageText_HeardClearBell:
	text "Der Klang dieser"
	line "Glocke spiegelt"
	cont "die Seele des"
	cont "Trägers wider."

	para "Du…"

	para "Du schaffst es"
	line "vielleicht durch"
	cont "den Glockenturm."

	para "Bitte, geh"
	line "weiter."
	done


EcruteakTinTowerEntranceWanderingSageText_GotClearBell:
	text "Der Glockenturm"
	line "hat gebebt! Ein"

	para "#mon muss oben"
	line "zurückgekehrt"
	cont "sein!"
	done

EcruteakTinTowerEntranceGrampsText:
	text "Zwei Türme…"
	line "Zwei #mon…"

	para "Aber als einer"
	line "niederbrannte,"

	para "flogen beide #-"
	line "MON fort und"
	cont "kamen"
	cont "nie wieder"
	cont "zurück."
	done
