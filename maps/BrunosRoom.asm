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
	; GSC-DE Dump 5511
	text "Ich bin BRUNO."
	line "Ein weiteres"
	cont "Mitglied der"
	cont "TOP VIER."
	para "Ich trainiere, bis"
	line "ich erschöpft bin,"
	cont "da ich an mein"
	cont "Potential glaube."
	para "Auf diese Art bin"
	line "ich so stark"
	cont "geworden."
	para "Kannst du unserer"
	line "Kraft widerstehen?"
	para "Hm? Ich sehe, du"
	line "fürchtest dich"
	para "nicht und siehst"
	line "entschlossen aus."
	cont "Genau richtig für"
	cont "einen Kampf!"
	para "Bereit, <PLAYER>?"
	line "Du wirst dich"
	para "unserer unbändigen"
	line "Kraft beugen"
	cont "müssen!"
	para "Uh Ah!"
	done
.BeatenText:
	; GSC-DE Dump 5512
	text "Warum? Wie konnte"
	line "ich nur verlieren?"
	done
.AfterText:
	; GSC-DE Dump 5513
	text "Da ich verloren"
	line "habe, muss ich"
	cont "jetzt still sein…"
	para "Bereite dich auf"
	line "die nächste"
	cont "Herausforderung"
	cont "vor!"
	done
.SeenRematchText:
	; PC-only DE
	text "Hallo, wieder da."
	para "Als Mitglied der"
	line "TOP VIER stelle"
	cont "ich mich deiner"
	cont "Herausforderung!"
	para "Unterschätze meine"
	line "Kampf-#MON"
	cont "nicht."
	para "Mach dich bereit!"
	done
.AfterRematchText:
	; PC-only DE
	text "Wir haben's"
	line "versucht."
	para "Mach weiter!"
	done
