Route48_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_ROUTE48_JESSIE_AND_JAMES
	scene_const SCENE_ROUTE48_NOOP

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route48JessieJamesCallback

	def_warp_events
	warp_event 11,  5, YELLOW_FOREST_GATE, 3

	def_coord_events
	coord_event 20, 12, SCENE_ROUTE48_JESSIE_AND_JAMES, Route48JessieJamesScript1
	coord_event 20, 13, SCENE_ROUTE48_JESSIE_AND_JAMES, Route48JessieJamesScript2

	def_bg_events
	bg_event 27, 11, BGEVENT_JUMPTEXT, Route48YellowForestSignText

	def_object_events
	object_event 11,  6, SPRITE_ARCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerArcher2, EVENT_CLEARED_YELLOW_FOREST
	object_event 15, 12, SPRITE_JESSIE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_48_JESSIE
	object_event 26, 12, SPRITE_JAMES, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_48_JAMES
	object_event 11,  5, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_48_NURSE
	itemball_event  4, 13, NUGGET, 1, EVENT_ROUTE_48_NUGGET

	object_const_def
	const ROUTE48_ARCHER
	const ROUTE48_JESSIE
	const ROUTE48_JAMES
	const ROUTE48_NURSE

Route48JessieJamesCallback:
	setflag ENGINE_FLYPOINT_YELLOW_FOREST
	disappear ROUTE48_JESSIE
	disappear ROUTE48_JAMES
	endcallback

Route48JessieJamesScript2:
	moveobject ROUTE48_JESSIE, 15, 13
	moveobject ROUTE48_JAMES, 26, 13
Route48JessieJamesScript1:
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	pause 15
	appear ROUTE48_JESSIE
	appear ROUTE48_JAMES
	playmusic MUSIC_JESSIE_JAMES_ENCOUNTER
	applyonemovement ROUTE48_JAMES, step_left
	follow ROUTE48_JESSIE, ROUTE48_JAMES
	applymovement ROUTE48_JESSIE, JessieEnterMovementData
	stopfollow
	showtext Route48JessieJamesSeenText
	setevent EVENT_ROUTE_48_JESSIE
	setevent EVENT_ROUTE_48_JAMES
	winlosstext Route48JessieJamesBeatenText, 0
	setlasttalked ROUTE48_JESSIE
	loadtrainer JESSIE_JAMES, 1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	setscene SCENE_ROUTE48_NOOP
	special DeleteSavedMusic
	playmusic MUSIC_JESSIE_JAMES_ENCOUNTER
	showtext Route48JessieJamesAfterText
	follow ROUTE48_JESSIE, ROUTE48_JAMES
	loadmem wFollowMovementQueue, movement_teleport_from
	applyonemovement ROUTE48_JESSIE, teleport_from
	stopfollow
	disappear ROUTE48_JESSIE
	disappear ROUTE48_JAMES
	playmapmusic
	end

JessieEnterMovementData:
	paired_step_right
	paired_step_right
	paired_step_right
	paired_step_right
	step_end

TrainerArcher2:
	trainer ARCHER, ARCHER2, EVENT_BEAT_ARCHER_2, Archer2SeenText, Archer2BeatenText, 0, Archer2Script

Archer2Script:
	showtext Archer2AfterText
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear ROUTE48_ARCHER
	pause 15
	special Special_FadeInQuickly
	setevent EVENT_CLEARED_YELLOW_FOREST
	clearevent EVENT_YELLOW_FOREST_ROCKET_TAKEOVER
	playsound SFX_ENTER_DOOR
	appear ROUTE48_NURSE
	waitsfx
	applyonemovement ROUTE48_NURSE, step_down
	setlasttalked ROUTE48_NURSE
	faceplayer
	showtext Route48NurseText1
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	playmusic MUSIC_HEAL
	special HealParty
	pause 60
	special Special_FadeInQuickly
	special RestartMapMusic
	showtext Route48NurseText2
	applyonemovement ROUTE48_NURSE, step_up
	playsound SFX_EXIT_BUILDING
	disappear ROUTE48_NURSE
	end

Route48JessieJamesSeenText:
	text "Bleib stehen,"
	line "Balg!"

	para "Weißt du, welches"
	line "#mon in dem"
	cont "Wald lebt?"
	cont "PIKACHU!"

	para "Der Boss wird sich"
	line "freuen, wenn"

	para "wir ein starkes"
	line "fangen!"

	para "Gib auf, oder mach"
	line "dich kampfbereit!"
	done

Route48JessieJamesBeatenText:
	text "Ein Balg hat uns"
	line "besiegt?"
	done

Route48JessieJamesAfterText:
	text "TEAM ROCKET ist"
	line "wieder abgehauen!"
	done

Archer2SeenText:
	text "Du willst dich"
	line "also wieder in"

	para "Team Rockets Pläne"
	line "einmischen."

	para "Du mischst dich"
	line "immer wieder ein,"

	para "wo du nichts zu"
	line "suchen hast."

	para "Wir verkaufen"
	line "diese #mon,"

	para "und du kannst"
	line "nichts dagegen"
	cont "tun!"
	done

Archer2BeatenText:
	text "Das ist so"
	line "frustrierend…"
	done

Archer2AfterText:
	text "…Na gut."

	para "Team Rocket zieht"
	line "sich vorerst"
	cont "zurück."

	para "Unser anderer Plan"
	line "läuft sowieso gut…"
	done

Route48NurseText1:
	text "Ich hab deinen"
	line "Kampf vom Fenster"
	cont "aus gesehen!"

	para "Du hast Team"
	line "Rocket vertrieben"
	cont "und das PIKACHU"
	cont "gerettet!"

	para "Vielen Dank!"

	para "Deine #mon"
	line "verdienen nach all"
	cont "dem eine Pause."
	done

Route48NurseText2:
	text "Ich entspanne mich"
	line "gern hier am Wald"

	para "und schaue den"
	line "#mon beim"
	cont "Spielen zu."

	para "Ich heile deine"
	line "#mon jederzeit!"

	para "Nochmals danke!"
	done

Route48YellowForestSignText:
	text "ROUTE 48"

	para "Norden: Gelber"
	line "Wald"
	done
