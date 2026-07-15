PokeCenter2F_MapScriptHeader:
	def_scene_scripts
	scene_script DoNothingScript, SCENE_POKECENTER2F_NOOP
	scene_script PokeCenter2FLeaveTradeCenterScene, SCENE_POKECENTER2F_LEAVE_TRADE_CENTER
	scene_script PokeCenter2FLeaveColosseumScene, SCENE_POKECENTER2F_LEAVE_COLOSSEUM

	def_callbacks
	callback MAPCALLBACK_TILES, PokeCenter2FTileCallback

	def_warp_events
	warp_event  0,  7, POKECENTER_2F, -1
	warp_event  5,  0, TRADE_CENTER, 1
	warp_event  9,  0, COLOSSEUM, 1

	def_coord_events

	def_bg_events
	bg_event  7,  3, BGEVENT_READ, PokeCenter2FLinkRecordSign

	def_object_events
	object_event  5,  2, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, LinkReceptionistScript_Trade, -1
	object_event  9,  2, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, LinkReceptionistScript_Battle, -1
	object_event 13,  3, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Text_TimeCapsuleClosed, -1

	object_const_def
	const POKECENTER2F_TRADE_RECEPTIONIST
	const POKECENTER2F_BATTLE_RECEPTIONIST

PokeCenter2FTileCallback:
	callasm .CheckKanto
	iffalsefwd .done
	changemapblocks KantoPokeCenter2F_BlockData
.done
	endcallback

.CheckKanto:
	call RegionCheck
	dec e ; KANTO_REGION?
	ld a, TRUE
	jr z, .ok
	dec a ; FALSE
.ok
	ldh [hScriptVar], a
	ret

PokeCenter2FLeaveTradeCenterScene:
	sdefer .Script
	end

.Script:
	special WaitForOtherPlayerToExit
	applymovement POKECENTER2F_TRADE_RECEPTIONIST, PokeCenter2FMovementData_ReceptionistWalksUpAndLeft_LookRight
	applymovement PLAYER, PokeCenter2FMovementData_PlayerTakesThreeStepsDown
	applymovement POKECENTER2F_TRADE_RECEPTIONIST, PokeCenter2FMovementData_ReceptionistStepsRightAndDown
	setscene SCENE_POKECENTER2F_NOOP
	setmapscene TRADE_CENTER, SCENE_TRADECENTER_INITIALIZE
	end

PokeCenter2FLeaveColosseumScene:
	sdefer .Script
	end

.Script:
	special WaitForOtherPlayerToExit
	applymovement POKECENTER2F_BATTLE_RECEPTIONIST, PokeCenter2FMovementData_ReceptionistWalksUpAndLeft_LookRight
	applymovement PLAYER, PokeCenter2FMovementData_PlayerTakesThreeStepsDown
	applymovement POKECENTER2F_BATTLE_RECEPTIONIST, PokeCenter2FMovementData_ReceptionistStepsRightAndDown
	setscene SCENE_POKECENTER2F_NOOP
	setmapscene COLOSSEUM, SCENE_COLOSSEUM_INITIALIZE
	end

PokeCenter2FLinkRecordSign:
	reanchormap
	special Special_DisplayLinkRecord
	endtext

LinkReceptionistScript_Trade:
if !DEF(DEBUG)
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iffalsefwd Script_TradeCenterClosed
endc
	special FixPlayerEVsAndStats ; no (trivial) cheating
	opentext
	writetext Text_TradeReceptionistIntro
	yesorno
	iffalse_endtext
	callasm CheckPartyForMail
	iftruefwd LinkReceptionistScript_HasMail
	special Special_SetBitsForLinkTradeRequest
	; fallthrough
LinkReceptionistScript_DoTradeOrBattle:
	writetext Text_PleaseWait
	special Special_WaitForLinkedFriend
	iffalsefwd .FriendNotReady
	writetext Text_MustSaveGame
	yesorno
	iffalsefwd .DidNotSave
	special Special_TryQuickSave
	iffalsefwd .DidNotSave
	writetext Text_PleaseWait
	special Special_CheckLinkTimeout
	iffalsefwd .LinkTimedOut
	readmem wOtherPlayerLinkMode
	iffalsefwd .LinkedToFirstGen
	special PerformLinkChecks
	iffalsefwd .OldVersionDetected ; LINK_ERR_OLD_PC_DETECT
	ifequalfwd LINK_ERR_MISMATCH_GAME_ID, .WrongGameID
	ifequalfwd LINK_ERR_MISMATCH_VERSION, .WrongVersion
	ifequalfwd LINK_ERR_VERSION_TOO_LOW, .WrongMinVersion
	ifequalfwd LINK_ERR_OTHER_VERSION_TOO_LOW, .OtherPlayerWrongMinVersion
	ifequalfwd LINK_ERR_MISMATCH_GAME_OPTIONS, .WrongOptions
	ifequalfwd LINK_ERR_INCOMPATIBLE_ROOMS, .IncompatibleRooms
	writetext Text_PleaseComeIn
	waitbutton
	closetext
	scall PokeCenter2F_EnterRoom
	warpcheck
	end

.FriendNotReady:
	special WaitForOtherPlayerToExit
	writetext Text_FriendNotReady
	endtext

.LinkedToFirstGen:
	special Special_FailedLinkToPast
	writetext Text_CantLinkToThePast
	sjumpfwd .CloseLink

.OldVersionDetected:
	writetext Text_OldVersionDetected
	sjumpfwd .CloseLink

.WrongGameID
	writetext Text_WrongGameID
	sjumpfwd .CloseLink

.WrongVersion
	writetext Text_WrongVersion
	sjumpfwd .CloseLink

.WrongMinVersion
	writetext Text_WrongMinVersion
	sjumpfwd .CloseLink

.OtherPlayerWrongMinVersion
	writetext Text_OtherPlayerWrongMinVersion
	sjumpfwd .CloseLink

.WrongOptions
	writetext Text_WrongOptions
	sjumpfwd .CloseLink

.IncompatibleRooms:
	writetext Text_IncompatibleRooms
.CloseLink:
	special Special_CloseLink
	endtext

.LinkTimedOut:
	writetext Text_LinkTimedOut
	sjumpfwd .AbortLink

.DidNotSave:
	writetext Text_PleaseComeAgain
.AbortLink:
	special WaitForOtherPlayerToExit
	endtext

LinkReceptionistScript_HasMail:
	writethistext
		text "Es tut mir leid,"
		line "aber wir können"

		para "keine #mon mit"
		line "Brief tauschen."
		done
	waitbutton
	endtext

Script_TradeCenterClosed:
	jumpthistextfaceplayer

	text "Leider wird der"
	line "TAUSCHAUTOMAT"
	cont "gerade repariert."
	done

LinkReceptionistScript_Battle:
if !DEF(DEBUG)
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iffalsefwd .BattleRoomClosed
endc
	special FixPlayerEVsAndStats ; no (trivial) cheating
	opentext
	writetext Text_BattleReceptionistIntro
	yesorno
	iffalse_endtext
	special Special_SetBitsForBattleRequest
	sjump LinkReceptionistScript_DoTradeOrBattle

.BattleRoomClosed:
	jumpthistextfaceplayer

	text "Leider wird der"
	line "KAMPFAUTOMAT"
	cont "gerade repariert."
	done
PokeCenter2F_EnterRoom:
	applymovementlasttalked PokeCenter2FMovementData_ReceptionistWalksUpAndLeft_LookRight
	applymovement PLAYER, PokeCenter2FMovementData_PlayerTakesThreeStepsUp
	readmem wLinkOtherPlayerGender
	scalltable .LinkTrainerTable
	end

.LinkTrainerTable:
	table_width 2
	dw .Male
	dw .Female
	dw .Enby
	dw .Beta
	assert_table_length NUM_PLAYER_GENDERS
.Male:
	variablesprite SPRITE_LINK_TRAINER, SPRITE_CHRIS
	end
.Female:
	variablesprite SPRITE_LINK_TRAINER, SPRITE_KRIS
	end
.Enby:
	variablesprite SPRITE_LINK_TRAINER, SPRITE_CRYS
	end
.Beta:
	variablesprite SPRITE_LINK_TRAINER, SPRITE_BETA
	end

PokeCenter2FMovementData_ReceptionistWalksUpAndLeft_LookRight:
	slow_step_up
	slow_step_left
	turn_head_right
	step_end

PokeCenter2FMovementData_PlayerTakesThreeStepsUp:
	step_up
	step_up
	step_up
	step_end

PokeCenter2FMovementData_PlayerTakesThreeStepsDown:
	step_down
	step_down
	step_down
	step_end

PokeCenter2FMovementData_ReceptionistStepsRightAndDown:
	slow_step_right
	slow_step_down
	step_end

Text_BattleReceptionistIntro:
	text "Willkommen im"
	line "#KOM-CLUB-"
	cont "KOLOSSEUM."
	para "Du kannst hier"
	line "gegen einen Freund"
	cont "antreten."
	para "Möchtest du gerne"
	line "kämpfen?"
	done


Text_TradeReceptionistIntro:
	text "Willkommen im"
	line "#KOM-CLUB-"
	cont "HANDELSCENTER."

	para "Du kannst hier"
	line "#mon mit einem"
	cont "Freund tauschen."

	para "Möchtest du gerne"
	line "tauschen?"
	done


Text_FriendNotReady:
	text "Dein Freund ist"
	line "noch nicht fertig."
	done

Text_MustSaveGame:
	text "Bevor du die"
	line "Verbindung"
	cont "herstellst, musst"
	cont "du deinen"
	cont "Spielstand"
	cont "speichern."
	done


Text_PleaseWait:
	text "Bitte warten!"
	done


Text_LinkTimedOut:
	text "Die Verbindung"
	line "wurde aufgrund"
	cont "fehlender Aktionen"
	cont "abgebrochen."
	para "Nimm bitte Kontakt"
	line "mit deinem Freund"
	cont "auf und komm dann"
	cont "wieder."
	done



Text_PleaseComeAgain:
	text "Komm später"
	line "wieder!"
	prompt



Text_PleaseComeIn:
	text "Komm doch herein."
	done



Text_CantLinkToThePast:
	text "Du kannst hier"
	line "keine Verbindung"
	cont "zur Vergangenheit"
	cont "herstellen."
	prompt



Text_OldVersionDetected:
	text "Du bist mit einer"
	line "alten Version von"

	para "Polished Crystal"
	line "verbunden."
	prompt

Text_WrongGameID:
	text "Dein Spiel ist"
	line "nicht kompatibel"
	cont "mit dem anderen"
	cont "Spiel."
	prompt

Text_WrongVersion:
	text "Eure"
	line "Spielversionen"
	cont "stimmen nicht"
	cont "überein."
	para "Um im"
	line "Link-Kolosseum zu"
	para "spielen, müssen"
	line "eure Versionen"
	cont "übereinstimmen."
	prompt

Text_WrongMinVersion:
	text "Dein Spiel erfüllt"
	line "nicht die"
	cont "Mindestversion des"
	cont "anderen Spiels."
	done

Text_OtherPlayerWrongMinVersion:
	text "Das andere System"
	line "erfüllt nicht die"
	cont "Mindestversion."
	prompt

Text_WrongOptions:
	text "Deine"
	line "Spieleinstellungen"
	cont "sind"
	para "nicht kompatibel"
	line "mit dem anderen"
	cont "Spieler."
	done

Text_IncompatibleRooms:
	text "Dein Freund hat"
	line "einen anderen Raum"
	cont "gewählt."
	done



Text_TimeCapsuleClosed:
	text "Leider wird die"
	line "ZEITKAPSEL gerade"
	cont "repariert."
	done

