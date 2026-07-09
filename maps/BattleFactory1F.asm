BattleFactory1F_MapScriptHeader:
	def_scene_scripts
	scene_script BattleFactory1FContinueChallenge, SCENE_BATTLEFACTORY1F_CHECKSTATE
	scene_const SCENE_BATTLEFACTORY1F_NOOP

	def_callbacks

	def_warp_events
	warp_event 12, 11, VERMILION_CITY, 15
	warp_event 13, 11, VERMILION_CITY, 16
	warp_event 12,  1, BATTLE_FACTORY_HALLWAY, 1

	def_coord_events

	def_bg_events
	bg_event 14,  5, BGEVENT_READ, BattleFactory1FRulesScript
	bg_event 10,  5, BGEVENT_JUMPTEXT, BattleFactory1FStreakText
	bg_event 25,  6, BGEVENT_READ, PokemonJournalThortonScript

	def_object_events
	object_event 12,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleFactory1FReceptionistScript, -1
	pc_nurse_event  6,  6
	object_event 18,  6, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, pokemart, MARTTYPE_BP, MART_BATTLEFACTORY_1, -1
	object_event 20,  6, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, pokemart, MARTTYPE_BP, MART_BATTLEFACTORY_2, -1
	object_event 22,  6, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, pokemart, MARTTYPE_BP, MART_BATTLEFACTORY_3, -1

	object_const_def
	const BATTLEFACTORY1F_RECEPTIONIST

BattleFactory1FContinueChallenge:
; Triggers (usefully) if we're in an ongoing Battle Factory run.
	; Only trigger this once.
	setscene SCENE_BATTLEFACTORY1F_NOOP

	; Check current battle status to see if we need to resume or reset winstreak
	special Special_BattleTower_GetChallengeState
	ifequalfwd BATTLETOWER_CHALLENGE_IN_PROGRESS, .LeftWithoutSaving
	ifequalfwd BATTLETOWER_SAVED_AND_LEFT, .ResumeChallenge
	ifequalfwd BATTLETOWER_LOST_CHALLENGE, .LostChallenge
	ifequalfwd BATTLETOWER_WON_CHALLENGE, .WonChallenge
	end

.ResumeChallenge:
	; We saved in-between rounds. Resume Battle Factory challenge.
	opentext
	writethistext
		text "Wir haben auf dich"
		line "gewartet."
		prompt

	sdefer Script_ReturnToRentalChallenge
	end

.LeftWithoutSaving:
	; The player reset the game in the middle of a battle.
	; This counts as a battle loss, and will reset the winstreak.
	sdefer .LeftWithoutSaving2
	end
.LeftWithoutSaving2:
	opentext
	writethistext
		text "Entschuldige!"
		line "Du hast nicht vor"
		cont "dem Verlassen des"

		para "Kampfraums"
		line "gespeichert."

		para "Es tut mir leid,"
		line "aber dein Versuch"

		para "wird für ungültig"
		line "erklärt."
		done
	waitbutton
	sjumpfwd Script_CommitBattleFactoryResult

.LostChallenge:
	opentext
	sdefer Script_CommitBattleFactoryResult
	end

.WonChallenge:
	sdefer .WonChallenge2
	end
.WonChallenge2:
	opentext
	writethistext
		text "Glückwunsch!"

		para "Du hast alle"
		line "Trainer besiegt!"

		para "Dafür bekommst du"
		line "diesen tollen"
		cont "Preis!"
		prompt
	verbosegiveitem MINT_LEAF
	; fallthrough
Script_CommitBattleFactoryResult:
	special Special_BattleTower_CommitChallengeResult
	iffalsefwd .WeHopeToServeYouAgain
	setevent EVENT_BEAT_THORTON
.WeHopeToServeYouAgain:
	writethistext
		text "Wir hoffen, dich"
		line "bald wiederzusehen."
		done
	waitbutton
	endtext

BattleFactory1FRulesScript:
	opentext
	writethistext
		text "Die Regeln der"
		line "Kampffabrik stehen"
		cont "hier geschrieben."

		para "Regeln lesen?"
		done
	yesorno
	iffalse_endtext
	jumpthisopenedtext
		text "Du bekommst sechs"
		line "Leih-#mon."

		para "Drei #mon dürfen"
		line "kämpfen."

		para "Alle drei müssen"
		line "verschieden sein."

		para "Auch ihre Items"
		line "müssen sich"
		cont "unterscheiden."

		para "Nach einem Sieg"
		line "darfst du ein"
		cont "#mon mit dem"
		cont "Gegner tauschen."
		done

BattleFactory1FStreakText:
	text "Serie: "
	text_decimal wBattleFactoryCurStreak, 2, 5
	text " Siege"
	line "Rekord: "
	text_decimal wBattleFactoryTopStreak, 2, 5
	text " Siege"
	cont "Tausche: "
	text_decimal wBattleFactorySwapCount, 1, 2
	done

BattleFactory1FReceptionistScript:
	opentext
	writethistext
		text "Willkommen in der"
		line "Kampffabrik!"

		para "Ich zeige dir gern"
		line "das Kampffeld."
		done
	promptbutton
	checkevent EVENT_BATTLE_FACTORY_INTRO
	iftruefwd .BattleFactoryMenu

	; only ask once, so set the flag regardless
	setevent EVENT_BATTLE_FACTORY_INTRO
	writethistext
		text "Möchtest du mehr"
		line "über diese"
		cont "Einrichtung hören?"
		done
	yesorno
	iffalsefwd .BattleFactoryMenu

.Explanation:
	writethistext
		text "Die Kampffabrik"
		line "ist eine Stätte,"
		cont "wo du mit Leih-"
		cont "#mon kämpfst."

		para "Zahllose #mon-"
		line "Trainer versammeln"

		para "sich von überall,"
		line "um auf dem"
		cont "Kampffeld zu"
		cont "kämpfen."

		para "Jeder Durchgang"
		line "hat 7 Trainer."

		para "Besiege alle für"
		line "Kampfpunkte."

		para "Um eine Sitzung zu"
		line "unterbrechen,"

		para "musst du speichern."
		line "Sonst kannst du"

		para "deinen Durchgang"
		line "nicht fortsetzen."
		prompt
	; fallthrough
.BattleFactoryMenu:
	; Setscene here in case the player aborted a quicksave prompted by challenge
	setscene SCENE_BATTLEFACTORY1F_NOOP
	writethistext
		text "Willst du zum"
		line "Kampffeld gehen?"
		done
	loadmenu MenuDataHeader_BattleInfoCancel
	verticalmenu
	closewindow
	ifequalfwd $1, .Challenge
	ifequal $2, .Explanation
	writethistext
		text "Wir hoffen, dich"
		line "bald wiederzusehen."
		prompt
	endtext

.Challenge:
	writethistext
		text "Bevor du"
		line "das Kampffeld"
		cont "betrittst,"

		para "wird dein"
		line "Fortschritt"
		cont "gespeichert."
		done
	yesorno
	iffalse .BattleFactoryMenu
	; Done here to ensure it's saved in case the player resets later.
	; The scene script running after the player saves but before the
	; challenge starts is harmless since there's no challenge prepared.
	setscene SCENE_BATTLEFACTORY1F_CHECKSTATE
	special Special_TryQuickSave
	iffalse .BattleFactoryMenu

	; Set this early in case the player leaves before picking their team.
	; This prevents them from re-rolling without forfeiting a streak.
	setval BATTLETOWER_CHALLENGE_IN_PROGRESS
	special Special_BattleTower_SetChallengeState
	special Special_BattleTower_SetupRentalMode

	; Initializes opponent trainers
	special Special_BattleTower_BeginChallenge
	; fallthrough
Script_ReturnToRentalChallenge:
	; From this point onwards, resetting the game should count as a streak loss
	setscene SCENE_BATTLEFACTORY1F_CHECKSTATE
	setval BATTLETOWER_CHALLENGE_IN_PROGRESS
	special Special_BattleTower_SetChallengeState

	; Everything ready to go for challenge start
	writethistext
		text "Hier entlang zum"
		line "Kampffeld."
		done
	waitbutton
	closetext

	follow BATTLEFACTORY1F_RECEPTIONIST, PLAYER
	applymovement BATTLEFACTORY1F_RECEPTIONIST, .WalkToHallway
	stopfollow
	special Special_BattleTower_MaxVolume
	warpsound
	disappear BATTLEFACTORY1F_RECEPTIONIST
	applyonemovement PLAYER, step_up
	warpcheck
	end

.WalkToHallway:
	step_up
	step_up
	step_up
	step_up
	step_end

PokemonJournalThortonScript:
	setflag ENGINE_READ_THORTON_JOURNAL
	jumpthistext

	text "#mon-Journal"

	para "Spezialthema:"
	line "Fabrikleiter"
	cont "Thorton!"

	para "Thorton soll nur"
	line "an das glauben,"
	cont "was er mit seinen"
	cont "Erfindungen"
	cont "zahlenmäßig"
	cont "beweisen kann."
	done
