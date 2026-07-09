VermilionGym_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, VermilionGymDoorsScript

	def_warp_events
	warp_event  4, 17, VERMILION_CITY, 7
	warp_event  5, 17, VERMILION_CITY, 7

	def_coord_events

	def_bg_events
	bg_event  1,  7, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  3,  7, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  5,  7, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  7,  7, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  9,  7, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  1,  9, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  3,  9, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  5,  9, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  7,  9, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  9,  9, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  1, 11, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  3, 11, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  5, 11, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  7, 11, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  9, 11, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  3, 15, BGEVENT_READ, VermilionGymStatue
	bg_event  6, 15, BGEVENT_READ, VermilionGymStatue

	def_object_events
	object_event  4,  5, SPRITE_ELECTRIC_FENCE_LEFT, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptext, VermilionGymElectricFenceText, EVENT_VERMILION_GYM_SWITCH_1
	object_event  5,  5, SPRITE_ELECTRIC_FENCE_RIGHT, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptext, VermilionGymElectricFenceText, EVENT_VERMILION_GYM_SWITCH_1
	object_event  4,  4, SPRITE_ELECTRIC_FENCE_LEFT, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptext, VermilionGymElectricFenceText, EVENT_VERMILION_GYM_SWITCH_2
	object_event  5,  4, SPRITE_ELECTRIC_FENCE_RIGHT, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptext, VermilionGymElectricFenceText, EVENT_VERMILION_GYM_SWITCH_2
	object_event  5,  2, SPRITE_SURGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionGymSurgeScript, -1
	object_event  8,  8, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerGentlemanGregory, -1
	object_event  4,  7, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 3, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerGuitaristmVincent, -1
	object_event  0, 10, SPRITE_JUGGLER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerJugglerHorton, -1
	object_event  7, 10, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerGuitaristfJanet, -1
	object_event  7, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, VermilionGymGuyScript, -1

	object_const_def
	const VERMILIONGYM_FENCE_1_LEFT
	const VERMILIONGYM_FENCE_1_RIGHT
	const VERMILIONGYM_FENCE_2_LEFT
	const VERMILIONGYM_FENCE_2_RIGHT

VermilionGymDoorsScript:
	checkevent EVENT_VERMILION_GYM_SWITCH_2
	iftruefwd .done
	checkevent EVENT_VERMILION_GYM_SWITCH_1
	iffalsefwd .resample
	appear VERMILIONGYM_FENCE_1_LEFT
	appear VERMILIONGYM_FENCE_1_RIGHT
.resample
	callasm SampleVermilionGymTrashCans
.done
	endcallback

VermilionGymSurgeScript:
	faceplayer
	opentext
	checkflag ENGINE_THUNDERBADGE
	iftruefwd .FightDone
	writetext LtSurgeIntroText
	waitbutton
	closetext
	winlosstext LtSurgeWinLossText, 0
	loadtrainer LT_SURGE, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_LTSURGE
	setevent EVENT_BEAT_GENTLEMAN_GREGORY
	setevent EVENT_BEAT_GUITARISTM_VINCENT
	setevent EVENT_BEAT_JUGGLER_HORTON
	setevent EVENT_BEAT_GUITARISTF_JANET
	opentext
	givebadge THUNDERBADGE, KANTO_REGION
	callstd kantopostgymevents
.FightDone:
	checkevent EVENT_GOT_TM57_WILD_CHARGE
	iftrue_jumpopenedtext LtSurgeFightDoneText
	writetext LtSurgeThunderBadgeText
	promptbutton
	verbosegivetmhm TM_WILD_CHARGE
	setevent EVENT_GOT_TM57_WILD_CHARGE
	jumpthisopenedtext

	text "Diese TM enthält"
	line "Stromstoß. Nutze"

	para "sie, um wie ein"
	line "Blitz zu sein!"
	done

GenericTrainerGentlemanGregory:
	generictrainer GENTLEMAN, GREGORY, EVENT_BEAT_GENTLEMAN_GREGORY, GentlemanGregorySeenText, GentlemanGregoryBeatenText

	text "Als ich noch bei"
	line "der Armee war,"
	cont "hat"

	para "MAJOR BOB mein"
	line "Leben gerettet."
	done
GenericTrainerGuitaristmVincent:
	generictrainer GUITARISTM, VINCENT, EVENT_BEAT_GUITARISTM_VINCENT, GuitaristmVincentSeenText, GuitaristmVincentBeatenText

	text "MAJOR BOB ist"
	line "von Stromzäunen"
	cont "geschützt,"

	para "damit du seine"
	line "Stärke nicht"
	cont "unterschätzt!"
	done

GenericTrainerJugglerHorton:
	generictrainer JUGGLER, HORTON, EVENT_BEAT_JUGGLER_HORTON, JugglerHortonSeenText, JugglerHortonBeatenText

	text "Lass dir den Sieg"
	line "über mich nicht"
	cont "zu"

	para "Kopf steigen…"
	line "MAJOR BOB ist"
	cont "stark."
	done
GenericTrainerGuitaristfJanet:
	generictrainer GUITARISTF, JANET, EVENT_BEAT_GUITARISTF_JANET, GuitaristfJanetSeenText, GuitaristfJanetBeatenText

	text "MAJOR BOB hat"
	line "beide Schalter"

	para "für die Strom-"
	line "zäune im Müll"
	cont "versteckt."
	done

VermilionGymGuyScript:
	checkevent EVENT_BEAT_LTSURGE
	iftrue_jumptextfaceplayer VermilionGymGuyWinText
	jumpthistextfaceplayer

	text "Yo! Zukünftiger"
	line "Champ!"

	para "MAJOR BOB ist"
	line "sehr vorsichtig."

	para "Er hat"

	para "überall in der"
	line "ARENA Fallen"
	cont "aufgestellt."

	para "Aber Arenarätsel"
	line "sind dir doch"
	cont "vertraut!"

	para "Du kommst ohne"
	line "Probleme zu"
	cont "MAJOR BOB."
	done

VermilionGymTrashCanScript:
	checkevent EVENT_VERMILION_GYM_SWITCH_2
	iftruefwd .trash_can
	callasm CheckVermilionGymTrashCan
	iftruefwd .open_lock
	checkevent EVENT_VERMILION_GYM_SWITCH_1
	iftruefwd .reset_switches
.trash_can
	jumpstd trashcan

.open_lock
	opentext
	writetext VermilionGymFoundSwitchText
	playsound SFX_PUSH_BUTTON
	promptbutton
	checkevent EVENT_VERMILION_GYM_SWITCH_1
	iftruefwd .second_switch
	writetext VermilionGymFoundFirstSwitchText
	playsound SFX_ENTER_DOOR
	disappear VERMILIONGYM_FENCE_1_LEFT
	disappear VERMILIONGYM_FENCE_1_RIGHT
	waitendtext

.second_switch
	writetext VermilionGymFoundSecondSwitchText
	playsound SFX_ENTER_DOOR
	disappear VERMILIONGYM_FENCE_2_LEFT
	disappear VERMILIONGYM_FENCE_2_RIGHT
	waitendtext

.reset_switches
	opentext
	writetext VermilionGymTrashCanText
	promptbutton
	writetext VermilionGymResetSwitchesText
	playsound SFX_WRONG
	waitbutton
	closetext
	callasm SampleVermilionGymTrashCans
	appear VERMILIONGYM_FENCE_1_LEFT
	appear VERMILIONGYM_FENCE_1_RIGHT
	end

VermilionGymStatue:
	gettrainername LT_SURGE, 1, STRING_BUFFER_4
	checkflag ENGINE_THUNDERBADGE
	iftruefwd .Beaten
	jumpstd gymstatue1
.Beaten:
	jumpstd gymstatue2

LtSurgeIntroText:
	text "MAJOR BOB: Heh,"
	line "du"
	line "Windelpupser!"

	para "Das muss ich dir"
	line "lassen. Es ist"

	para "nicht sehr weise,"
	line "mich herauszufor-"
	cont "dern, aber es ist"
	cont "mutig!"

	para "Wenn es um"
	line "Elektro-#mon"
	cont "geht, bin ich die"
	cont "Nummer eins!"

	para "Ich habe das"
	line "Schlachtfeld nie"

	para "als Verlierer"
	line "verlassen."

	para "Ich grille dich,"
	line "wie ich es mit"

	para "meinen Feinden im"
	line "Krieg tat!"
	done





LtSurgeWinLossText:
	text "MAJOR BOB:"
	line "Arrrgh!"
	line "Du bist stark!"

	para "O.K., Wicht. Du"
	line "erhältst den"
	cont "DONNERORDEN!"
	done





LtSurgeThunderBadgeText:
	text "MAJOR BOB: Der"
	line "DONNERORDEN"
	cont "erhöht"

	para "den INIT-Wert"
	line "deiner #mon."

	para "Du darfst stolz"
	line "darauf sein, mich"

	para "besiegt zu haben,"
	line "hörst du?"
	done





LtSurgeFightDoneText:
	text "MAJOR BOB: Zwerg!"
	line "Immer noch bei"
	cont "der Sache?"

	para "Meine #mon und"
	line "ich sind noch"
	cont "dabei!"
	done





GentlemanGregorySeenText:
	text "Du willst MAJOR"
	line "BOB besiegen?"

	para "Da musst du erst"
	line "an mir vorbei!"
	done





GentlemanGregoryBeatenText:
	text "Ich habe versagt,"
	line "MAJOR BOB. Es tut"
	cont "mir Leid!"
	done





GuitaristmVincentSeenText:
	text "MAJOR BOB hat"
	line "mein"
	line "Talent für"

	para "Elektro-#mon"
	line "erkannt."

	para "Glaubst du, du"
	line "kannst mich"
	cont "besiegen?"
	done
GuitaristmVincentBeatenText:
	text "Ach, wie"
	line "schockierend!"
	done
JugglerHortonSeenText:
	text "Ich werde dich"
	line "fertig machen! Du"
	cont "wirst gleich"
	cont "einen"
	cont "Schlag bekommen!"
	done





JugglerHortonBeatenText:
	text "Ahh! Ich stand zu"
	line "sehr unter Strom…"
	done





GuitaristfJanetSeenText:
	text "Ich bin leicht,"
	line "aber gut mit"
	cont "Elektrizität!"
	done

GuitaristfJanetBeatenText:
	text "Fried!"
	done


VermilionGymGuyWinText:
	text "Puh! Das war ein"
	line "elektrisierendes"
	cont "Erlebnis!"

	para "Das hat meine"
	line "Nerven sehr"
	cont "strapaziert."
	done
VermilionGymFoundSwitchText:
	text "Ein geheimer"
	line "Schalter unter"
	cont "dem"
	cont "Müll?"

	para "Besser drücken."
	done

VermilionGymFoundFirstSwitchText:
	text "Der erste"
	line "Elektro-"
	line "zaun ist offen!"
	done

VermilionGymFoundSecondSwitchText:
	text "Der zweite"
	line "Elektrozaun"

	para "ist offen! Der"
	line "Weg"
	line "ist frei!"
	done

VermilionGymResetSwitchesText:
	text "Ach nein, der"
	line "Elek-"
	line "trozaun hat sich"
	cont "wieder"
	cont "geschlossen!"
	done

VermilionGymTrashCanText:
	text "Nein! Hier ist"
	line "nur Müll."
	done





VermilionGymElectricFenceText:
	text "Ein Elektro-"
	line "zaun!"

	para "Finger weg!"
	done

SampleVermilionGymTrashCans:
	ldh a, [rWBK]
	push af
	ld a, BANK(wVermilionGymTrashCan1)
	ldh [rWBK], a
.loop
	call Random
	ld e, a
	swap e
	and $f
	jr z, .loop
	dec a
	ld [wVermilionGymTrashCan1], a
	call .GetSecondTrashCan
	ld [wVermilionGymTrashCan2], a
	pop af
	ldh [rWBK], a
	ret

.GetSecondTrashCan:
	ld hl, .AdjacencyTable
	add a
	add a
	ld c, a
	ld a, e
	and %11
	add c
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	ret

.AdjacencyTable:
	; left, right, up, down
	db  1,  1,  5,  5 ;  0 ( 1, 7)
	db  0,  2,  6,  6 ;  1 ( 3, 7)
	db  1,  3,  7,  7 ;  2 ( 5, 7)
	db  2,  4,  8,  8 ;  3 ( 7, 7)
	db  3,  3,  9,  9 ;  4 ( 9, 7)
	db  6,  6,  0, 10 ;  5 ( 1, 9)
	db  5,  7,  1, 11 ;  6 ( 3, 9)
	db  6,  8,  2, 12 ;  7 ( 5, 9)
	db  7,  9,  3, 13 ;  8 ( 7, 9)
	db  8,  8,  4, 14 ;  9 ( 9, 9)
	db 11, 11,  5,  5 ; 10 ( 1,11)
	db 10, 12,  6,  6 ; 11 ( 3,11)
	db 11, 13,  7,  7 ; 12 ( 5,11)
	db 12, 14,  8,  8 ; 13 ( 7,11)
	db 13, 13,  9,  9 ; 14 ( 9,11)

CheckVermilionGymTrashCan:
	ldh a, [rWBK]
	push af
	ld a, BANK(wVermilionGymTrashCan1)
	ldh [rWBK], a
	eventflagcheck EVENT_VERMILION_GYM_SWITCH_1
	jr z, .first
	ld a, [wVermilionGymTrashCan2]
	call .CheckTrashCan
	ld a, TRUE
	jr z, .done
	dec a ; FALSE
.done
	ldh [hScriptVar], a
	pop af
	ldh [rWBK], a
	ret

.first:
	ld a, [wVermilionGymTrashCan1]
	call .CheckTrashCan
	jr z, .yes
	ld a, [wVermilionGymTrashCan2]
	call .CheckTrashCan
	ld a, FALSE ; no-optimize a = 0
	jr nz, .done
	ld a, [wVermilionGymTrashCan1]
	ld [wVermilionGymTrashCan2], a
.yes
	ld a, TRUE
	jr .done

.CheckTrashCan:
	ld c, a
	call GetFacingTileCoord
	call .ConvertCoordsToTrashCan
	cp c
	ret

.ConvertCoordsToTrashCan:
	ld a, d
	sub 5
	srl a
	ld d, a
	ld a, e
	sub 11
	srl a
	ld e, a
	add a
	add a
	add e
	add d
	ret
