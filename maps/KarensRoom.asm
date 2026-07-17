KarensRoom_MapScriptHeader:
	def_scene_scripts
	scene_script KarensRoomLockDoorScene, SCENE_KARENSROOM_LOCK_DOOR
	scene_const SCENE_KARENSROOM_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, KarensRoomDoorCallback

	def_warp_events
	warp_event  4, 17, BRUNOS_ROOM, 3
	warp_event  5, 17, BRUNOS_ROOM, 4
	warp_event  4,  2, LANCES_ROOM, 1
	warp_event  5,  2, LANCES_ROOM, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  7, SPRITE_KAREN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, KarenScript, -1

KarensRoomLockDoorScene:
	sdefer .Script
	end

.Script:
	applymovement PLAYER, WalkIntoEliteFourRoomMovement
	reanchormap
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a
	refreshmap
	closetext
	setscene SCENE_KARENSROOM_NOOP
	setevent EVENT_KARENS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

KarensRoomDoorCallback:
	checkevent EVENT_KARENS_ROOM_ENTRANCE_CLOSED
	iffalsefwd .KeepDoorClosed
	changeblock 4, 14, $2a
.KeepDoorClosed:
	checkevent EVENT_KARENS_ROOM_EXIT_OPEN
	iffalsefwd .OpenDoor
	changeblock 4, 2, $16
.OpenDoor:
	endcallback

KarenScript:
	readvar VAR_BADGES
	ifequalfwd 16, .Rematch
	checkevent EVENT_BEAT_ELITE_4_KAREN
	iftrue_jumptextfaceplayer .AfterText
	showtextfaceplayer .SeenText
	winlosstext .BeatenText, 0
	loadtrainer KAREN, 1
	startbattle
	reloadmapafterbattle
	showtext .AfterText
	sjumpfwd .EndBattle

.Rematch:
	checkevent EVENT_BEAT_ELITE_4_KAREN
	iftrue_jumptextfaceplayer .AfterRematchText
	showtextfaceplayer .SeenRematchText
	winlosstext .BeatenText, 0
	loadtrainer KAREN, 2
	startbattle
	reloadmapafterbattle
	showtext .AfterRematchText
.EndBattle:
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $16
	refreshmap
	setevent EVENT_KARENS_ROOM_EXIT_OPEN
	setevent EVENT_BEAT_ELITE_4_KAREN
	waitsfx
	end

.SeenText:
	; GSC-DE Dump 5514
	text "Ich bin MELANIE."
	line "Nummer 4 der"
	cont "TOP VIER."
	para "Du heißt <PLAYER>?"
	line "Sehr amüsant."
	para "Ich liebe #MON"
	line "des Typs Unlicht."
	para "Ihr wilder, harter"
	line "Ruf gefällt mir."
	para "Und sie sind"
	line "wirklich stark."
	para "Glaubst du, du"
	line "kannst es mit uns"
	cont "aufnehmen? Los,"
	cont "ich will mich"
	cont "amüsieren."
	para "Auf geht's."
	done
.BeatenText:
	; GSC-DE Dump 5515
	text "Nun, du bist"
	line "gut. Das gefällt"
	cont "mir an einem"
	cont "Trainer."
	done
.AfterText:
	; GSC-DE Dump 5516
	text "Starke #MON."
	para "Schwache #MON."
	para "Das ist nur eine"
	line "subjektive Ein-"
	cont "schätzung anderer"
	cont "Menschen."
	para "Wirklich begabte"
	line "Trainer gewinnen"
	para "mit ihren Lieb-"
	line "lings-#MON."
	para "Ich mag deinen"
	line "Stil. Du weißt,"
	cont "was wichtig ist."
	para "Schreite voran!"
	line "Der CHAMP"
	cont "wartet."
	done
.SeenRematchText:
	; PC-only DE
	text "Du hast dich durch"
	line "die Reihen"
	cont "gekämpft, um mich"
	cont "zu erreichen."
	para "Ich bin"
	line "beeindruckt. Du"
	cont "hast ein"
	cont "charmantes Team."
	para "Unser Kampf wird"
	line "gut. Los geht's!"
	done
.AfterRematchText:
	; PC-only DE
	text "Ich werde nicht"
	line "von meinem Weg"
	cont "abweichen."
	para "Der CHAMP freut"
	line "sich schon auf ein"
	cont "Wiedersehen mit"
	cont "dir."
	done
