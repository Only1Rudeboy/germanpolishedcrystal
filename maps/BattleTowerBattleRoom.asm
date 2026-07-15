BattleTowerBattleRoom_MapScriptHeader:
	def_scene_scripts
	scene_script BattleTowerBattleRoomEnterScene, SCENE_BATTLETOWERBATTLEROOM_ENTER
	scene_const SCENE_BATTLETOWERBATTLEROOM_NOOP

	def_callbacks

	def_warp_events
	warp_event  3,  7, BATTLE_TOWER_HALLWAY, 4
	warp_event  4,  7, BATTLE_TOWER_HALLWAY, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  0, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BATTLE_TOWER_BATTLE_ROOM_YOUNGSTER
	object_event  2,  6, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1

	object_const_def
	const BATTLETOWERBATTLEROOM_OPPONENT
	const BATTLETOWERBATTLEROOM_RECEPTIONIST

BattleTowerBattleRoomEnterScene:
	disappear BATTLETOWERBATTLEROOM_OPPONENT
	sdefer Script_BattleRoom
	end

Script_BattleRoom:
	applymovement PLAYER, MovementData_BattleTowerBattleRoomPlayerWalksIn
; beat all 7 opponents in a row
Script_BattleRoomLoop:
	special Special_BattleTower_LoadOpponentTrainerAndPokemonsWithOTSprite
	appear BATTLETOWERBATTLEROOM_OPPONENT
	warpsound
	waitsfx
	applymovement BATTLETOWERBATTLEROOM_OPPONENT, MovementData_BattleTowerBattleRoomOpponentWalksIn
	opentext
	battletowertext 1
	promptbutton
	closetext
	special Special_BattleTower_Battle ; calls StartBattle
	special FadeOutPalettes
	ifequal BTCHALLENGE_LOST, Script_LostBattleTower
	reloadmap
	applymovement BATTLETOWERBATTLEROOM_OPPONENT, MovementData_BattleTowerBattleRoomOpponentWalksOut
	warpsound
	disappear BATTLETOWERBATTLEROOM_OPPONENT
	applymovement BATTLETOWERBATTLEROOM_RECEPTIONIST, MovementData_BattleTowerBattleRoomReceptionistWalksToPlayer
	applyonemovement PLAYER, turn_head_down
	opentext
	writethistext
		text "<PLAYER> erhält"
		done
		text_ram wStringBuffer1
		text "KP!"
		done
	waitsfx
	specialsound
	waitbutton
	ifequalfwd BTCHALLENGE_WON, Script_BeatenAllTowerTrainers
	ifequalfwd BTCHALLENGE_FACILITYBRAIN, .WarnAboutTycoon
.AskNextBattle:
	writethistext
		text "Nächster Gegner"
		line "Nr."
		done
		text_decimal wStringBuffer3, 2, 5
		text ". Bereit?"
		done
	sjumpfwd .ShownText
.WarnAboutTycoon
	writethistext
		text "Glückwunsch zu"
		line "deiner"
		cont "Siegesserie,"
		cont "Trainer!"
		para "Das Turm-Ass lässt"
		line "ausrichten, dass"
		para "es von deinem"
		line "Können beeindruckt"
		cont "ist."
		para "Bist du bereit,"
		line "gegen das Turm-Ass"
		cont "zu kämpfen?"
		done
.ShownText
	yesorno
	iffalsefwd .DontBattleNextOpponent
	closetext
	applyonemovement PLAYER, turn_head_right
	applymovement BATTLETOWERBATTLEROOM_RECEPTIONIST, MovementData_BattleTowerBattleRoomReceptionistWalksAway
	sjump Script_BattleRoomLoop

.DontBattleNextOpponent:
	writethistext
		text "Speichern und"
		line "Sitzung beenden?"
		done
	yesorno
	iffalsefwd .DontSaveAndEndTheSession
	special SaveOptions
	setval BATTLETOWER_SAVED_AND_LEFT
	special Special_BattleTower_SetChallengeState
	playsound SFX_SAVE
	waitsfx
	special FadeOutPalettes
	special SoftReset
.DontSaveAndEndTheSession:
	writethistext
		text "Kampfraum-"
		line "Durchgang"
		cont "abbrechen?"
		para "Achtung, das zählt"
		line "als Niederlage."
		done
	yesorno
	iffalse .AskNextBattle
	special FadeOutPalettes

Script_LostBattleTower:
	setval BATTLETOWER_LOST_CHALLENGE
	special Special_BattleTower_SetChallengeState
	sjumpfwd Script_ReturnToBattleTowerLobby

Script_BeatenAllTowerTrainers:
	special FadeOutPalettes
	setval BATTLETOWER_WON_CHALLENGE
	special Special_BattleTower_SetChallengeState
	; fallthrough
Script_ReturnToBattleTowerLobby:
	warpfacing UP, BATTLE_TOWER_1F, 10, 8
	end

MovementData_BattleTowerBattleRoomPlayerWalksIn:
	step_up
	step_up
	step_up
	step_up
	turn_head_right
	step_end

MovementData_BattleTowerBattleRoomOpponentWalksIn:
	slow_step_down
	slow_step_down
	slow_step_down
	turn_head_left
	step_end

MovementData_BattleTowerBattleRoomOpponentWalksOut:
	turn_head_up
	slow_step_up
	slow_step_up
	slow_step_up
	step_end

MovementData_BattleTowerBattleRoomReceptionistWalksToPlayer:
	slow_step_right
	slow_step_up
	slow_step_up
	step_end

MovementData_BattleTowerBattleRoomReceptionistWalksAway:
	slow_step_down
	slow_step_down
	slow_step_left
	turn_head_right
	step_end
