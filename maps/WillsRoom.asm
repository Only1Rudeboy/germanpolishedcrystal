WillsRoom_MapScriptHeader:
	def_scene_scripts
	scene_script WillsRoomLockDoorScene, SCENE_WILLSROOM_LOCK_DOOR
	scene_const SCENE_WILLSROOM_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, WillsRoomDoorCallback

	def_warp_events
	warp_event  5, 17, INDIGO_PLATEAU_POKECENTER_1F, 4
	warp_event  4,  2, KOGAS_ROOM, 1
	warp_event  5,  2, KOGAS_ROOM, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  7, SPRITE_WILL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, WillScript, -1

WillsRoomLockDoorScene:
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
	setscene SCENE_WILLSROOM_NOOP
	setevent EVENT_WILLS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

WillsRoomDoorCallback:
	checkevent EVENT_WILLS_ROOM_ENTRANCE_CLOSED
	iffalsefwd .KeepDoorClosed
	changeblock 4, 14, $2a
.KeepDoorClosed:
	checkevent EVENT_WILLS_ROOM_EXIT_OPEN
	iffalsefwd .OpenDoor
	changeblock 4, 2, $16
.OpenDoor:
	endcallback

WillScript:
	readvar VAR_BADGES
	ifequalfwd 16, .Rematch
	checkevent EVENT_BEAT_ELITE_4_WILL
	iftrue_jumptextfaceplayer .AfterText
	showtextfaceplayer .SeenText
	winlosstext .BeatenText, 0
	loadtrainer WILL, 1
	startbattle
	reloadmapafterbattle
	showtext .AfterText
	sjumpfwd .EndBattle

.Rematch:
	checkevent EVENT_BEAT_ELITE_4_WILL
	iftrue_jumptextfaceplayer .AfterRematchText
	showtextfaceplayer .SeenRematchText
	winlosstext .BeatenText, 0
	loadtrainer WILL, 2
	startbattle
	reloadmapafterbattle
	showtext .AfterRematchText
.EndBattle:
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $16
	refreshmap
	setevent EVENT_WILLS_ROOM_EXIT_OPEN
	setevent EVENT_BEAT_ELITE_4_WILL
	waitsfx
	end

.SeenText:
	; GSC-DE Dump 5505
	text "Willkommen in der"
	line "#MON LIGA,"
	cont "<PLAYER>."
	para "Erlaube mir, mich"
	line "vorzustellen. Ich"
	cont "bin WILLI."
	para "Ich habe die ganze"
	line "Welt bereist, um"
	para "meine Psycho-#-"
	line "MON zu verbessern."
	para "Und schließlich"
	line "habe ich es"
	cont "in die TOP VIER"
	cont "geschafft."
	para "Ich werde ständig"
	line "besser!"
	para "Verlieren ist"
	line "keine Alternative!"
	done
.BeatenText:
	; GSC-DE Dump 5506
	text "Ich… ich kann…"
	line "es nicht glauben…"
	done
.AfterText:
	; GSC-DE Dump 5507
	text "Auch wenn ich"
	line "besiegt wurde,"
	cont "werde ich an"
	cont "meiner Überzeugung"
	cont "festhalten."
	para "Ich werde weiter"
	line "kämpfen, bis ich"
	para "besser bin, als"
	line "alle anderen"
	cont "Trainer!"
	para "<PLAYER>, schreite"
	line "voran und lerne"
	para "die Grausamkeit"
	line "der TOP VIER"
	cont "kennen."
	done
.SeenRematchText:
	; PC-only DE
	text "So, du bist"
	line "endlich"
	cont "erschienen."
	para "Ich habe deine"
	line "Kampftechnik"
	cont "beobachtet. Ich"
	cont "bin bereit!"
	para "In Ordnung. Mach"
	line "dich bereit zum"
	cont "Kampf!"
	done
.AfterRematchText:
	; PC-only DE
	text "Ich habe all meine"
	line "Kraft verbraucht."
	para "Ich bereue nicht,"
	line "so zu verlieren."
	done
