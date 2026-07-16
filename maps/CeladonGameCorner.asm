CeladonGameCorner_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, CeladonGameCornerStairsScript

	def_warp_events
	warp_event 14, 13, CELADON_CITY, 6
	warp_event 15, 13, CELADON_CITY, 18
	warp_event 17,  0, ROCKET_HIDEOUT_B1F, 2

	def_coord_events

	def_bg_events
	bg_event  1,  6, BGEVENT_READ, MapCeladonGameCornerSignpost11Script
	bg_event  1,  7, BGEVENT_READ, MapCeladonGameCornerSignpost11Script
	bg_event  1,  8, BGEVENT_READ, MapCeladonGameCornerSignpost11Script
	bg_event  1,  9, BGEVENT_READ, MapCeladonGameCornerSignpost11Script
	bg_event  1, 10, BGEVENT_READ, MapCeladonGameCornerSignpost11Script
	bg_event  1, 11, BGEVENT_LEFT, MapCeladonGameCornerSignpost11Script
	bg_event  6,  6, BGEVENT_READ, MapCeladonGameCornerSignpost11Script
	bg_event  6,  7, BGEVENT_READ, MapCeladonGameCornerSignpost11Script
	bg_event  6,  8, BGEVENT_READ, MapCeladonGameCornerSignpost11Script
	bg_event  6,  9, BGEVENT_READ, MapCeladonGameCornerSignpost9Script
	bg_event  6, 10, BGEVENT_READ, MapCeladonGameCornerSignpost11Script
	bg_event  6, 11, BGEVENT_RIGHT, MapCeladonGameCornerSignpost11Script
	bg_event  7,  6, BGEVENT_READ, MapCeladonGameCornerSignpost35Script
	bg_event  7,  7, BGEVENT_READ, MapCeladonGameCornerSignpost35Script
	bg_event  7,  8, BGEVENT_READ, MapCeladonGameCornerSignpost35Script
	bg_event  7,  9, BGEVENT_READ, MapCeladonGameCornerSignpost35Script
	bg_event  7, 10, BGEVENT_READ, MapCeladonGameCornerSignpost16Script
	bg_event  7, 11, BGEVENT_LEFT, MapCeladonGameCornerSignpost35Script
	bg_event 12,  6, BGEVENT_READ, MapCeladonGameCornerSignpost35Script
	bg_event 12,  7, BGEVENT_READ, MapCeladonGameCornerSignpost35Script
	bg_event 12,  8, BGEVENT_READ, MapCeladonGameCornerSignpost35Script
	bg_event 12,  9, BGEVENT_READ, MapCeladonGameCornerSignpost35Script
	bg_event 12, 10, BGEVENT_READ, MapCeladonGameCornerSignpost35Script
	bg_event 12, 11, BGEVENT_RIGHT, MapCeladonGameCornerSignpost35Script
	bg_event 13,  6, BGEVENT_READ, MapCeladonGameCornerSignpost35Script
	bg_event 13,  7, BGEVENT_READ, MapCeladonGameCornerSignpost35Script
	bg_event 13,  8, BGEVENT_READ, MapCeladonGameCornerSignpost35Script
	bg_event 13,  9, BGEVENT_READ, MapCeladonGameCornerSignpost35Script
	bg_event 13, 10, BGEVENT_READ, MapCeladonGameCornerSignpost35Script
	bg_event 13, 11, BGEVENT_LEFT, MapCeladonGameCornerSignpost35Script
	bg_event 18,  6, BGEVENT_READ, MapCeladonGameCornerSignpost35Script
	bg_event 18,  7, BGEVENT_READ, MapCeladonGameCornerSignpost35Script
	bg_event 18,  8, BGEVENT_JUMPTEXT, CeladonGameCornerLighterText
	bg_event 18,  9, BGEVENT_READ, MapCeladonGameCornerSignpost35Script
	bg_event 18, 10, BGEVENT_READ, MapCeladonGameCornerSignpost35Script
	bg_event 18, 11, BGEVENT_RIGHT, MapCeladonGameCornerSignpost35Script
	bg_event  9,  0, BGEVENT_READ, CeladonGameCornerPosterScript

	def_object_events
	object_event  5,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumpstd, gamecornercoinvendor, -1
	object_event  3,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonGameCornerReceptionistText, -1
	object_event 14, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerPokefanMScript, -1
	object_event 17,  7, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerTeacherScript, -1
	object_event 11,  7, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerFishingGuruScript, -1
	object_event  8, 10, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, (1 << DAY) | (1 << NITE), PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerFisherScript, -1
	object_event 11,  3, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonGymGuyText, -1
	object_event  2,  8, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerGrampsScript, -1
	object_event  9,  1, SPRITE_RICH_BOY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_DARK_RED, OBJECTTYPE_TRAINER, 1, CeladonGameCornerRichBoyTobin, EVENT_CELADON_GAME_CORNER_RICH_BOY_TOBIN

	object_const_def
	const CELADONGAMECORNER_CLERK
	const CELADONGAMECORNER_RECEPTIONIST
	const CELADONGAMECORNER_POKEFAN_M
	const CELADONGAMECORNER_POKEFAN_F
	const CELADONGAMECORNER_FISHING_GURU
	const CELADONGAMECORNER_FAT_GUY
	const CELADONGAMECORNER_GYM_GUY
	const CELADONGAMECORNER_GRAMPS
	const CELADONGAMECORNER_TOBIN

CeladonGameCornerStairsScript:
	checkevent EVENT_PUSHED_GAME_CORNER_SWITCH
	iftruefwd .StairsOpen
	changeblock 16, 0, $03
.StairsOpen
	endcallback

CeladonGameCornerPokefanMScript:
	showtextfaceplayer CeladonGameCornerPokefanMText
	turnobject LAST_TALKED, LEFT
	end

CeladonGameCornerTeacherScript:
	showtextfaceplayer CeladonGameCornerTeacherText
	turnobject LAST_TALKED, RIGHT
	end

CeladonGameCornerFishingGuruScript:
	showtextfaceplayer CeladonGameCornerFishingGuruText
	turnobject LAST_TALKED, RIGHT
	end

CeladonGameCornerFisherScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_COINS_FROM_GAMBLER_AT_CELADON
	iftruefwd .FisherOffer
	writetext CeladonGameCornerFisherText1
	promptbutton
	checkkeyitem COIN_CASE
	iffalsefwd .NoCoinCase
	checkcoins MAX_COINS - 18
	ifequalfwd HAVE_MORE, .FullCoinCase
	writetext CeladonGameCornerReceived18CoinsText ; TODO load coins icon
	playsound SFX_ITEM
	waitsfx
	givecoins 18
	setevent EVENT_GOT_COINS_FROM_GAMBLER_AT_CELADON
.FisherOffer:
	writetext FisherOfferText
	yesorno
	iffalsefwd .GotCoins
	checkcoins 50
	ifequalfwd HAVE_LESS, .FisherNotEnough
	takecoins 50
	playsound SFX_TRANSACTION
	scall MapCeladonGameCornerSignpost16Script
	opentext
.GotCoins:
	writetext CeladonGameCornerFisherText2
	sjumpfwd .FisherEnd
.FisherNotEnough:
	writetext FisherNotEnoughText
.FisherEnd:
	waitbutton
	closetext
	turnobject LAST_TALKED, LEFT
	end

.NoCoinCase:
	writetext CeladonGameCornerFisherNoCoinCaseText
	waitbutton
	closetext
	turnobject LAST_TALKED, LEFT
	end

.FullCoinCase:
	writetext CeladonGameCornerFisherFullCoinCaseText
	waitbutton
	closetext
	turnobject LAST_TALKED, LEFT
	end

CeladonGameCornerGrampsScript:
	showtextfaceplayer CeladonGameCornerGrampsText
	turnobject LAST_TALKED, LEFT
	end

MapCeladonGameCornerSignpost35Script:
	random $6
	ifequalfwd $0, MapCeladonGameCornerSignpost16Script
	reanchormap
	setval $0
	special Special_SlotMachine
	endtext

MapCeladonGameCornerSignpost16Script:
	reanchormap
	setval $1
	special Special_SlotMachine
	endtext

MapCeladonGameCornerSignpost11Script:
	reanchormap
	special Special_CardFlip
	endtext

MapCeladonGameCornerSignpost9Script:
	opentext
	writetext CeladonGameCornerSodaCanText
	waitbutton
	special Special_CardFlip
	endtext

CeladonGameCornerRichBoyTobin:
	trainer RICH_BOY, TOBIN, EVENT_BEAT_RICH_BOY_TOBIN, .SeenText, .BeatenText, 0, .AfterScript, TRAINERPAL_DARK_RICH_BOY

.Script:
	checkevent EVENT_BEAT_RICH_BOY_TOBIN
	iftruefwd .AfterScript
	jumpthistextfaceplayer

.SeenText:
	text "Was schnüffelst du"
	line "hier rum?"
	para "Leg dich bloß"
	line "nicht mit Team"
	cont "Valor an!"
	done

.BeatenText:
	text "Damit hab ich"
	line "nicht gerechnet…"
	done

.AfterScript
	showtext .AfterText
	readvar VAR_FACING
	ifequalfwd RIGHT, .player_facing_right
	ifequalfwd LEFT, .player_facing_left
; .player_facing_up
	applymovement CELADONGAMECORNER_TOBIN, .LeaveMovementPlayerUp
	sjumpfwd .done
.player_facing_left
	applymovement CELADONGAMECORNER_TOBIN, .LeaveMovementPlayerRight
	sjumpfwd .done
.player_facing_right
	applymovement CELADONGAMECORNER_TOBIN, .LeaveMovementPlayerLeft
.done
	playsound SFX_EXIT_BUILDING
	disappear CELADONGAMECORNER_TOBIN
	end

.AfterText
	text "Na gut! Hier ist"
	line "eh nichts los!"

	para "Das Poster? Ha!"
	line "Nur Dekoration!"
	done

.LeaveMovementPlayerUp
	step_right
.LeaveMovementPlayerLeft
rept 5
	step_right
endr
	step_end

.LeaveMovementPlayerRight
	step_down
	step_right
	step_right
	step_up
rept 5
	step_right
endr
	step_end


CeladonGameCornerReceptionistText:
	; GSC-DE Dump
	text "Willkommen!"
	para "Du kannst deine"
	line "Münzen nebenan"
	para "gegen fabelhafte"
	line "Preise ein-"
	cont "tauschen."
	done

CeladonGameCornerPokefanMText:
	; GSC-DE Dump
	text "Die Spielautomaten"
	line "sind alle"
	cont "hochmodern."
	done

CeladonGameCornerTeacherText:
	; GSC-DE Dump
	text "An diesem Automa-"
	line "ten will ich"
	cont "spielen."
	para "An dem habe ich"
	line "gestern haushoch"
	para "verloren. Das will"
	line "ich heute wieder-"
	cont "haben."
	done

CeladonGameCornerFishingGuruText:
	; GSC-DE Dump
	text "Ich glaube, an"
	line "diesem Automaten"
	cont "werde ich"
	cont "gewinnen…"
	para "Die Gewinnchancen"
	line "sind bei jedem"
	cont "Automaten anders."
	done

CeladonGameCornerFisherText1:
	; GSC-DE Dump
	text "Guahahaha!"
	para "Die Münzen kommen"
	line "mir entgegen!"
	para "Hm? Was, Zwerg?"
	line "Du willst spielen?"
	para "Ich teile mein"
	line "Glück mit dir!"
	done

CeladonGameCornerFisherText2:
	; GSC-DE Dump
	text "Hahahaha!"
	para "Ich fühle mich"
	line "wohl, wenn ich"
	para "anderen etwas"
	line "Gutes tue!"
	done

CeladonGameCornerFisherNoCoinCaseText:
	; GSC-DE Dump
	text "Eh, du hast keinen"
	line "MÜNZKORB."
	para "Wie soll ich dir"
	line "denn so Münzen"
	cont "geben, Zwerg?"
	done

CeladonGameCornerFisherFullCoinCaseText:
	; GSC-DE Dump
	text "Heh, dein MÜNZKORB"
	line "ist voll, Wicht."
	para "Du hast wohl auch"
	line "eine Glücks-"
	cont "strähne."
	done

CeladonGameCornerReceived18CoinsText:
	text "<PLAYER> erhält"
	line "18 Münzen!"
	done

FisherOfferText:
	text "Hm? Was, Zwerg?"
	line "Willst du immer"
	cont "noch spielen?"
	para "Ich weiß! Du"
	line "kannst für 50"
	cont "Münzen spielen."
	para "Wie wär's?"
	done

FisherNotEnoughText:
	text "Heh, dein MÜNZKORB"
	line "ist fast leer,"
	cont "Wicht."
	para "Dein Glück scheint"
	line "zu versiegen."
	done

CeladonGymGuyText:
	; GSC-DE Dump
	text "He! Ein CHAMP"
	line "in spe!"
	para "Spielst du auch an"
	line "den Automaten?"
	para "Ich möchte genug"
	line "Münzen sammeln für"
	cont "ein prämiertes"
	cont "#mon."
	para "Aber ich habe noch"
	line "nicht genug"
	cont "Münzen…"
	done

CeladonGameCornerGrampsText:
	; GSC-DE Dump
	text "Hm… Die Chancen,"
	line "eine PIKACHU-Reihe"
	para "zu bekommen,"
	line "stehen gut, aber…"
	cont "Was nun?"
	done

CeladonGameCornerPosterScript:
	checkevent EVENT_PUSHED_GAME_CORNER_SWITCH
	iftruefwd .AlreadyPushed
	showtext .PushSwitchText
	playsound SFX_PUSH_BUTTON
	playsound SFX_ENTER_DOOR
	setevent EVENT_PUSHED_GAME_CORNER_SWITCH
	changeblock 16, 0, $30
	end

.AlreadyPushed
	showtext .AlreadyPushedText
	end

.AlreadyPushedText
	text "Der Schalter wurde"
	line "schon gedrückt."
	done

.PushSwitchText
	text "Hey!"

	para "Ein Schalter"
	line "hinter dem"
	cont "Poster!? Drücken"

	para "wir ihn!"
	done

CeladonGameCornerLighterText:
	; GSC-DE Dump
	text "Da ist ein"
	line "Feuerzeug."
	done

CeladonGameCornerSodaCanText:
	; GSC-DE Dump
	text "Eine Wasser-"
	line "flasche…"
	para "Die muss jemandem"
	line "gehören, der sie"
	cont "holen wird…"
	para "Was? Sie ist leer!"
	done
