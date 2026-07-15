KogasRoom_MapScriptHeader:
	def_scene_scripts
	scene_script KogasRoomLockDoorScene, SCENE_KOGASROOM_LOCK_DOOR
	scene_const SCENE_KOGASROOM_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, KogasRoomDoorCallback

	def_warp_events
	warp_event  4, 17, WILLS_ROOM, 2
	warp_event  5, 17, WILLS_ROOM, 3
	warp_event  4,  2, BRUNOS_ROOM, 1
	warp_event  5,  2, BRUNOS_ROOM, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  7, SPRITE_KOGA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, KogaScript, -1

KogasRoomLockDoorScene:
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
	setscene SCENE_KOGASROOM_NOOP
	setevent EVENT_KOGAS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

KogasRoomDoorCallback:
	checkevent EVENT_KOGAS_ROOM_ENTRANCE_CLOSED
	iffalsefwd .KeepDoorClosed
	changeblock 4, 14, $2a
.KeepDoorClosed:
	checkevent EVENT_KOGAS_ROOM_EXIT_OPEN
	iffalsefwd .OpenDoor
	changeblock 4, 2, $16
.OpenDoor:
	endcallback

KogaScript:
	readvar VAR_BADGES
	ifequalfwd 16, .Rematch
	checkevent EVENT_BEAT_ELITE_4_KOGA
	iftrue_jumptextfaceplayer .AfterText
	showtextfaceplayer .SeenText
	winlosstext .BeatenText, 0
	loadtrainer KOGA, 1
	startbattle
	reloadmapafterbattle
	showtext .AfterText
	sjumpfwd .EndBattle

.Rematch:
	checkevent EVENT_BEAT_ELITE_4_KOGA
	iftrue_jumptextfaceplayer .AfterRematchText
	showtextfaceplayer .SeenRematchText
	winlosstext .BeatenText, 0
	loadtrainer KOGA, 2
	startbattle
	reloadmapafterbattle
	showtext .AfterRematchText
.EndBattle:
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $16
	refreshmap
	setevent EVENT_KOGAS_ROOM_EXIT_OPEN
	setevent EVENT_BEAT_ELITE_4_KOGA
	waitsfx
	end

.SeenText:
	text "Fwahahahaha!"
	para "Ich bin KOGA."
	line "Einer der TOP"
	cont "VIER."
	para "Als Ninja lebe ich"
	line "in der Dunkelheit."
	para "Mein Stil wird"
	line "dich verwirren und"
	cont "vernichten!"
	para "Verwirrung,"
	line "Schlaf, Gift…"
	para "Auch du wirst"
	line "Opfer meiner"
	cont "hinterhältigen"
	cont "Strategie!"
	para "Fwahahahaha!"
	para "Bei #mon geht"
	line "es nicht nur um"
	cont "Kraft allein. Das"
	cont "wirst du noch"
	cont "merken!"
	done
.BeatenText:
	text "Ah! Du hast dich"
	line "als würdig"
	cont "erwiesen!"
	done
.AfterText:
	text "Ich habe alle"
	line "Register gezogen."
	cont "Alles umsonst."
	para "Ich muss meine"
	line "Fertigkeiten"
	cont "verbessern."
	para "Betritt den"
	line "nächsten Raum und"
	cont "beweise dein"
	cont "Können!"
	done
.SeenRematchText:
	text "Deine Ankunft ist"
	line "beeindruckend"
	cont "-genauso wie dein"
	cont "entschlossener"
	cont "Blick."
	para "Fwahahahaha!"
	para "Meine Fertigkeit"
	line "wird schwer zu"
	cont "überwinden sein!"
	para "Ich zeige dir, was"
	line "ich meine!"
	done
.AfterRematchText:
	text "Noch nie habe ich"
	line "jemanden wie dich"
	cont "getroffen."
	para "Ich muss mich ganz"
	line "dem Training"
	cont "widmen."
	done
