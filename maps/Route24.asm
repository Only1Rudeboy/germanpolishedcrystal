Route24_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_ROUTE24_BRIDGE_UNDERFOOT
	scene_const SCENE_ROUTE24_BRIDGE_OVERHEAD

	def_callbacks
	callback MAPCALLBACK_TILES, Route24TileScript

	def_warp_events

	def_coord_events
	coord_event 19, 15, SCENE_ROUTE24_BRIDGE_OVERHEAD, Route24BridgeOverheadTrigger
	coord_event 20, 14, SCENE_ROUTE24_BRIDGE_OVERHEAD, Route24BridgeOverheadTrigger
	coord_event 21, 14, SCENE_ROUTE24_BRIDGE_OVERHEAD, Route24BridgeOverheadTrigger
	coord_event 22, 15, SCENE_ROUTE24_BRIDGE_OVERHEAD, Route24BridgeOverheadTrigger
	coord_event 20, 15, SCENE_ROUTE24_BRIDGE_UNDERFOOT, Route24BridgeUnderfootTrigger
	coord_event 21, 15, SCENE_ROUTE24_BRIDGE_UNDERFOOT, Route24BridgeUnderfootTrigger
	coord_event 20, 39, SCENE_ROUTE24_BRIDGE_UNDERFOOT, Route24BridgeUnderfootTrigger
	coord_event 21, 39, SCENE_ROUTE24_BRIDGE_UNDERFOOT, Route24BridgeUnderfootTrigger
	coord_event 25, 13, SCENE_ROUTE24_BRIDGE_OVERHEAD, Route24BridgeOverheadTrigger
	coord_event 25, 15, SCENE_ROUTE24_BRIDGE_OVERHEAD, Route24BridgeOverheadTrigger
	coord_event 25, 16, SCENE_ROUTE24_BRIDGE_OVERHEAD, Route24BridgeOverheadTrigger
	coord_event 25, 17, SCENE_ROUTE24_BRIDGE_OVERHEAD, Route24BridgeOverheadTrigger
	coord_event 25, 18, SCENE_ROUTE24_BRIDGE_OVERHEAD, Route24BridgeOverheadTrigger
	coord_event 25, 19, SCENE_ROUTE24_BRIDGE_OVERHEAD, Route24BridgeOverheadTrigger
	coord_event 25, 20, SCENE_ROUTE24_BRIDGE_OVERHEAD, Route24BridgeOverheadTrigger
	coord_event 25, 21, SCENE_ROUTE24_BRIDGE_OVERHEAD, Route24BridgeOverheadTrigger
	coord_event 25, 22, SCENE_ROUTE24_BRIDGE_OVERHEAD, Route24BridgeOverheadTrigger
	coord_event 25, 23, SCENE_ROUTE24_BRIDGE_OVERHEAD, Route24BridgeOverheadTrigger

	def_bg_events
	bg_event 15, 19, BGEVENT_ITEM + MAX_POTION, EVENT_ROUTE_24_HIDDEN_MAX_POTION
	bg_event 23, 11, BGEVENT_JUMPTEXT, Route24AdvancedTipsSignText

	def_object_events
	object_event 21, 25, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerGruntM31, EVENT_ROUTE_24_ROCKET
	fruittree_event 16,  5, FRUITTREE_ROUTE_24, LANSAT_BERRY, PAL_NPC_PINK

	object_const_def
	const ROUTE24_ROCKET

Route24TileScript:
	checkscene
	iftruefwd .underfoot
	callasm Route24_OverheadBridgeAsm
	endcallback

.underfoot:
	callasm Route24_UnderfootBridgeAsm
	endcallback

Route24_OverheadBridgeAsm:
	changebridgeblock 20, 16, $39, ROUTE_24
	changebridgeblock 20, 18, $38, ROUTE_24
	changebridgeblock 20, 20, $38, ROUTE_24
	changebridgeblock 20, 22, $38, ROUTE_24
	changebridgeblock 20, 24, $38, ROUTE_24
	changebridgeblock 20, 26, $38, ROUTE_24
	changebridgeblock 20, 28, $38, ROUTE_24
	changebridgeblock 20, 30, $38, ROUTE_24
	changebridgeblock 20, 32, $38, ROUTE_24
	changebridgeblock 20, 34, $38, ROUTE_24
	changebridgeblock 20, 36, $38, ROUTE_24
	changebridgeblock 20, 38, $49, ROUTE_24
	jmp BufferScreen

Route24_UnderfootBridgeAsm:
	changebridgeblock 20, 16, $34, ROUTE_24
	changebridgeblock 20, 18, $34, ROUTE_24
	changebridgeblock 20, 20, $34, ROUTE_24
	changebridgeblock 20, 22, $34, ROUTE_24
	changebridgeblock 20, 24, $34, ROUTE_24
	changebridgeblock 20, 26, $34, ROUTE_24
	changebridgeblock 20, 28, $34, ROUTE_24
	changebridgeblock 20, 30, $34, ROUTE_24
	changebridgeblock 20, 32, $34, ROUTE_24
	changebridgeblock 20, 34, $34, ROUTE_24
	changebridgeblock 20, 36, $34, ROUTE_24
	changebridgeblock 20, 38, $4a, ROUTE_24
	jmp BufferScreen

Route24BridgeOverheadTrigger:
	callasm Route24_OverheadBridgeAsm
	callthisasm
	xor a
	jr Route24_FinishBridge

Route24BridgeUnderfootTrigger:
	callasm Route24_UnderfootBridgeAsm
	callthisasm
	ld a, $1
Route24_FinishBridge:
	ld [wWalkingOnBridge], a
	ld [wRoute24SceneID], a ; setscene a
	jmp GenericFinishBridge

TrainerGruntM31:
	trainer GRUNTM, 31, EVENT_BEAT_ROCKET_GRUNTM_31, Route24RocketSeenText, Route24RocketBeatenText, 0, Route24RocketScript

Route24RocketScript:
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext Route24RocketAfterBattleText
	promptbutton
	special Special_FadeOutMusic
	writetext Route24RocketDisappearsText
	waitbutton
	closetext
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear ROUTE24_ROCKET
	setevent EVENT_LEARNED_ABOUT_MACHINE_PART
	clearevent EVENT_CERULEAN_CAPE_BOYFRIEND
	setmapscene CERULEAN_CAPE, SCENE_CERULEANCAPE_MISTYS_DATE
	pause 25
	special Special_FadeInQuickly
	playmusic MUSIC_NUGGET_BRIDGE_HGSS
	end

Route24RocketSeenText:
	text "Hey, Minimensch!"
	line "Ich sein von TEAM"
	cont "ROCKET."

	para "Sein aus fremde"
	line "Land, Trainer eins"
	cont "ich sein!"

	para "Geglaubt, wenn nix"
	line "Energie mehr,"

	para "mache viel Panik"
	line "bei Leute!"

	para "Geheim mein"
	line "Auftrag sein, ich"
	cont "dir nix verraten!"

	para "Doch! Wenn mich"
	line "besiegen, ich sein"

	para "lieb und dir"
	line "verrate Geheimnis."

	para "Du, Kind! Kämpfen"
	line "lass uns!"
	done


Route24RocketBeatenText:
	text "Uff! Nein, glauben"
	line "nicht ich kann!"

	para "Stark sehr du"
	line "sein! Ich nix"
	cont "Gegner für dich!"
	done


Route24RocketAfterBattleText:
	text "O.K. Verraten dir"
	line "meine Geheimnis."

	para "SPULE, gestohlen"
	line "von mir, versteckt"

	para "in #mon-ARENA"
	line "der AZURIA CITY."

	para "Wasser sein gute"
	line "Versteck. In"

	para "Mitte von #mon-"
	line "ARENA Wasser sein."

	para "Kind, du mich"
	line "vergessen nicht!"

	para "Besiege dir wird"
	line "TEAM ROCKET tun."

	para "Werden kommen aus"
	line "JOHTO, mein"

	para "Freunde. Rächen"
	line "sie werden tun."
	done


Route24RocketDisappearsText:
	text "…"

	para "Was du sagen? TEAM"
	line "ROCKET nix mehr"

	para "gibt? Kaputt"
	line "gemacht, du sagen?"

	para "Oh, nein! Was soll"
	line "ich jetzt machen?"
	done


Route24AdvancedTipsSignText:
	text "Profi-Tipps!"

	para "Die Fähigkeit Rohe"
	line "Gewalt"

	para "hebt Nebeneffekte"
	line "von Attacken auf,"

	para "aber auch andere"
	line "Effekte!"

	para "Besonders der"
	line "Schaden durch"

	para "einen getragenen"
	line "Leben-Orb wird"
	cont "ignoriert!"
	done
