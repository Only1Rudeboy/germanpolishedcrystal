BrunosRoom_MapScriptHeader:
	def_scene_scripts
	scene_script BrunosRoomLockDoorScene, SCENE_BRUNOSROOM_LOCK_DOOR
	scene_const SCENE_BRUNOSROOM_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, BrunosRoomDoorCallback

	def_warp_events
	warp_event  4, 17, KOGAS_ROOM, 3
	warp_event  5, 17, KOGAS_ROOM, 4
	warp_event  4,  2, KARENS_ROOM, 1
	warp_event  5,  2, KARENS_ROOM, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  7, SPRITE_BRUNO, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BrunoScript, -1

BrunosRoomLockDoorScene:
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
	setscene SCENE_BRUNOSROOM_NOOP
	setevent EVENT_BRUNOS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

BrunosRoomDoorCallback:
	checkevent EVENT_BRUNOS_ROOM_ENTRANCE_CLOSED
	iffalsefwd .KeepDoorClosed
	changeblock 4, 14, $2a
.KeepDoorClosed:
	checkevent EVENT_BRUNOS_ROOM_EXIT_OPEN
	iffalsefwd .OpenDoor
	changeblock 4, 2, $16
.OpenDoor:
	endcallback

BrunoScript:
	readvar VAR_BADGES
	ifequalfwd 16, .Rematch
	checkevent EVENT_BEAT_ELITE_4_BRUNO
	iftrue_jumptextfaceplayer .AfterText
	showtextfaceplayer .SeenText
	winlosstext .BeatenText, 0
	loadtrainer BRUNO, 1
	startbattle
	reloadmapafterbattle
	showtext .AfterText
	sjumpfwd .EndBattle

.Rematch:
	checkevent EVENT_BEAT_ELITE_4_BRUNO
	iftrue_jumptextfaceplayer .AfterRematchText
	showtextfaceplayer .SeenRematchText
	winlosstext .BeatenText, 0
	loadtrainer BRUNO, 2
	startbattle
	reloadmapafterbattle
	showtext .AfterRematchText
.EndBattle:
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $16
	refreshmap
	setevent EVENT_BRUNOS_ROOM_EXIT_OPEN
	setevent EVENT_BEAT_ELITE_4_BRUNO
	waitsfx
	end

.SeenText:
	text "Ich bin Bruno von"
	line "der Top Vier."

	para "Ich trainiere"
	line "immer bis zum"
	cont "Äußersten, weil"

	para "ich an unser"
	line "Potenzial glaube."

	para "So sind wir stark"
	line "geworden."

	para "Kannst du unserer"
	line "Kraft standhalten?"

	para "Hm? Ich seh keine"
	line "Angst in dir. Du"
	cont "wirkst"

	para "entschlossen."
	line "Perfekt für einen"
	cont "Kampf!"

	para "Bereit, <PLAYER>?"
	line "Du wirst dich"
	cont "unserer"

	para "überwältigenden"
	line "Kraft beugen!"

	para "Hoo hah!"
	done

.BeatenText:
	text "Warum? Wie"
	line "konnten wir"
	cont "verlieren?"
	done

.AfterText:
	text "Nach dieser"
	line "Niederlage steht"
	cont "mir kein Wort"

	para "mehr zu…"

	para "Stell dich deiner"
	line "nächsten"
	cont "Herausforderung!"
	done

.SeenRematchText:
	text "Hallo, wieder da."

	para "Als Mitglied der"
	line "Top Vier stelle"
	cont "ich mich deiner"

	para "Herausforderung!"

	para "Es würde mich"
	line "stören, wenn du"
	cont "meine Kampf-#mon"

	para "unterschätzt."

	para "Mach dich bereit!"
	done

.AfterRematchText:
	text "Wir haben's"
	line "versucht."

	para "Mach weiter!"
	done
