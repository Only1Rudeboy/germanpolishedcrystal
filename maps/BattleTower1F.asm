BattleTower1F_MapScriptHeader:
	def_scene_scripts
	scene_script BattleTower1FContinueChallenge, SCENE_BATTLETOWER1F_CHECKSTATE
	scene_const SCENE_BATTLETOWER1F_NOOP

	def_callbacks

	def_warp_events
	warp_event 10, 15, BATTLE_TOWER_OUTSIDE, 3
	warp_event 11, 15, BATTLE_TOWER_OUTSIDE, 4
	warp_event 10,  0, BATTLE_TOWER_ELEVATOR, 1
	warp_event  0,  7, BATTLE_TOWER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 11,  7, BGEVENT_READ, BattleTower1FRulesScript
	bg_event  9,  7, BGEVENT_JUMPTEXT, BattleTower1FStreakText
	bg_event 21,  8, BGEVENT_READ, PokemonJournalPalmerScript

	def_object_events
	object_event 10,  7, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BattleTower1FReceptionistScript, -1
	pc_nurse_event  6,  8
	object_event 14,  8, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, pokemart, MARTTYPE_BP, MART_BATTLETOWER_1, -1
	object_event 16,  8, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, pokemart, MARTTYPE_BP, MART_BATTLETOWER_2, -1
	object_event 18,  8, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, pokemart, MARTTYPE_BP, MART_BATTLETOWER_3, -1
	object_event  6, 14, SPRITE_BURGLAR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTowerPharmacistScript, -1
	object_event 16, 13, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Text_BattleTowerCooltrainerF, -1
	object_event  2, 12, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Text_BattleTowerBugCatcher, -1
	object_event 20, 11, SPRITE_GRANNY, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Text_BattleTowerGranny, -1

	object_const_def
	const BATTLETOWER1F_RECEPTIONIST

BattleTower1FContinueChallenge:
; Triggers (usefully) if we're in an ongoing Battle Tower run.
	; Only trigger this once.
	setscene SCENE_BATTLETOWER1F_NOOP

	; Check current battle status to see if we need to resume or reset winstreak
	special Special_BattleTower_GetChallengeState
	ifequalfwd BATTLETOWER_CHALLENGE_IN_PROGRESS, .LeftWithoutSaving
	ifequalfwd BATTLETOWER_SAVED_AND_LEFT, .ResumeChallenge
	ifequalfwd BATTLETOWER_LOST_CHALLENGE, .LostChallenge
	ifequalfwd BATTLETOWER_WON_CHALLENGE, .WonChallenge
	end

.ResumeChallenge:
	; We saved in-between rounds. Resume Battle Tower challenge.
	opentext
	writethistext
		text "Wir haben auf dich"
		line "gewartet."
		prompt

	sdefer Script_ReturnToBattleTowerChallenge
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
	sjumpfwd Script_CommitBattleTowerResult

.LostChallenge:
	opentext
	sdefer Script_CommitBattleTowerResult
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
	verbosegiveitem ABILITYPATCH
	; fallthrough
Script_CommitBattleTowerResult:
	special Special_BattleTower_CommitChallengeResult
	iffalsefwd .WeHopeToServeYouAgain
	setevent EVENT_BEAT_PALMER
.WeHopeToServeYouAgain:
	writethistext
		text "Wir hoffen, dich"
		line "bald wiederzusehen"
		done
	waitbutton
	endtext

BattleTower1FRulesScript:
	opentext
	writethistext
		text "Die Regeln des"
		line "Kampfturms stehen"
		cont "hier geschrieben."

		para "Regeln lesen?"
		done
	yesorno
	iffalse_endtext
	jumpthisopenedtext
		text "Drei #mon"
		line "dürfen kämpfen."

		para "Alle drei müssen"
		line "verschieden sein."

		para "Auch ihre Items"
		line "müssen sich"
		cont "unterscheiden."

		para "Eier oder manche"
		line "Legendäre #mon"
		cont "dürfen nicht"
		cont "kämpfen."
		done

BattleTower1FStreakText:
	text "Serie: "
	text_decimal wBattleTowerCurStreak, 2, 5
	text " Siege"
	line "Rekord: "
	text_decimal wBattleTowerTopStreak, 2, 5
	text " Siege"
	done

BattleTower1FReceptionistScript:
	opentext
	writethistext
		text "Willkommen im"
		line "Kampfturm!"

		para "Ich zeige dir gern"
		line "einen Kampfraum."
		done
	promptbutton
	checkevent EVENT_BATTLE_TOWER_INTRO
	iftruefwd .BattleTowerMenu

	; only ask once, so set the flag regardless
	setevent EVENT_BATTLE_TOWER_INTRO
	writethistext
		text "Möchtest du mehr"
		line "über den"
		cont "Kampfturm hören?"
		done
	yesorno
	iffalsefwd .BattleTowerMenu

.Explanation:
	writethistext
		text "Der Kampfturm ist"
		line "eine Stätte für"
		cont "#mon-Kämpfe."

		para "Zahllose #mon-"
		line "Trainer versammeln"

		para "sich von überall"
		line "zum Kämpfen in"

		para "eigens gestalteten"
		line "Kampfräumen."

		para "Es gibt viele"
		line "Kampfräume im"
		cont "Kampfturm."

		para "Jeder Raum hat"
		line "sieben Trainer."

		para "Besiege alle für"
		line "Kampfpunkte."

		para "Um eine Sitzung zu"
		line "unterbrechen,"

		para "musst du speichern"
		line "Sonst kannst du"

		para "deinen Raum-"
		line "Durchgang nicht"
		cont "fortsetzen."
		prompt
	; fallthrough
.BattleTowerMenu:
	; Setscene here in case the player aborted a quicksave prompted by challenge
	setscene SCENE_BATTLETOWER1F_NOOP
	writethistext
		text "Willst du in"
		line "einen Kampfraum?"
		done
	loadmenu MenuDataHeader_BattleInfoCancel
	verticalmenu
	closewindow
	ifequalfwd $1, .Challenge
	ifequal $2, .Explanation
	writethistext
		text "Wir hoffen, dich"
		line "bald wiederzusehen"
		prompt
	endtext

.Challenge:
	writethistext
		text "Wähle #mon zum"
		line "Kämpfen."
		prompt
	special Special_BattleTower_SelectParticipants
	iffalse .BattleTowerMenu
	writethistext
		text "Bevor du"
		line "den Kampfraum"
		cont "betrittst,"

		para "wird dein"
		line "Fortschritt"
		cont "gespeichert."
		done
	yesorno
	iffalse .BattleTowerMenu
	; Done here to ensure it's saved in case the player resets later.
	; The scene script running after the player saves but before the
	; challenge starts is harmless since there's no challenge prepared.
	setscene SCENE_BATTLETOWER1F_CHECKSTATE
	special Special_TryQuickSave
	iffalse .BattleTowerMenu

	; Initializes opponent trainers and stores player mon choices in SRAM
	special Special_BattleTower_BeginChallenge
	; fallthrough
Script_ReturnToBattleTowerChallenge:
	; From this point onwards, resetting the game should count as a streak loss
	setscene SCENE_BATTLETOWER1F_CHECKSTATE
	setval BATTLETOWER_CHALLENGE_IN_PROGRESS
	special Special_BattleTower_SetChallengeState

	; Everything ready to go for challenge start
	writethistext
		text "Hier entlang zu"
		line "deinem Kampfraum."
		done
	waitbutton
	closetext

	musicfadeout MUSIC_NONE, 8
	follow BATTLETOWER1F_RECEPTIONIST, PLAYER
	applymovement BATTLETOWER1F_RECEPTIONIST, .WalkToElevator
	stopfollow
	special Special_BattleTower_MaxVolume
	warpsound
	disappear BATTLETOWER1F_RECEPTIONIST
	applyonemovement PLAYER, step_up
	warpcheck
	end

.WalkToElevator:
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end

MenuDataHeader_BattleInfoCancel:
	db MENU_BACKUP_TILES
	menu_coords 11, 4, 19, 11
	dw MenuData2_BattleInfoCancel
	db 1 ; default option

MenuData2_BattleInfoCancel:
	db $a0 ; flags
	db 3
	db "Kampf@"
	db "Info@"
	db "Abbr.@"

BattleTowerPharmacistScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_TRICK_INTRO
	iftruefwd BattleTowerTutorTrickScript
	writethistext
		text "Die Trainer hier"
		line "setzen gezielt"
		cont "Items ein."

		para "Aber ich hab auch"
		line "einen Trick auf"
		cont "Lager--ich tausche"

		para "ihre Items mit"
		line "Täuscher gegen"
		cont "meine!"
		done
	waitbutton
	setevent EVENT_LISTENED_TO_TRICK_INTRO
BattleTowerTutorTrickScript:
	writethistext
		text "Ich bringe"
		line "deinem #mon"
		cont "Täuscher bei…"

		para "für ein"
		line "Silberblatt."
		done
	waitbutton
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	writethistext
		text "Soll ich deinem"
		line "#mon Täuscher"
		cont "beibringen?"
		done
	yesorno
	iffalsefwd .TutorRefused
	setval TRICK
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpthisopenedtext
		text "Sprich mit mir,"
		line "falls du's dir"
		cont "anders überlegst."
		done

.NoSilverLeaf
	jumpthisopenedtext
		text "Tss. Du hast kein"
		line "Silberblatt…"
		done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext
		text "Jetzt kann dein"
		line "#mon auch"
		cont "Täuscher!"

		para "Ist das nicht"
		line "fies?"
		done

Text_BattleTowerCooltrainerF:
	text "Es gibt viele"
	line "Kampfräume, aber"

	para "ich gewinne sie"
	line "alle!"
	done

Text_BattleTowerGranny:
	text "Es ist mühsam, im"
	line "Kampf keine Items"
	cont "nutzen zu dürfen."

	para "Items an deine"
	line "#mon zu hängen,"

	para "ist der Schlüssel"
	line "zum Sieg."
	done

Text_BattleTowerBugCatcher:
	text "Ich will sehen,"
	line "wie weit ich nur"
	cont "mit Käfer-#mon"

	para "komme."

	para "Hoffentlich sind"
	line "keine Feuer-"
	cont "#mon dabei…"
	done

PokemonJournalPalmerScript:
	setflag ENGINE_READ_PALMER_JOURNAL
	jumpthistext

	text "#mon-Journal"

	para "Spezialthema:"
	line "Turm-Ass"
	cont "Palmer!"

	para "Palmer soll einen"
	line "Sohn in der"
	cont "Sinnoh-Region"

	para "haben, der auch"
	line "Trainer werden"
	cont "will."
	done
