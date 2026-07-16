CianwoodGym_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, CianwoodGymBouldersCallback
	callback MAPCALLBACK_STONETABLE, CianwoodGymSetUpStoneTable

	def_warp_events
	warp_event 12, 17, CIANWOOD_CITY, 2
	warp_event 13, 17, CIANWOOD_CITY, 2
	warp_event 12,  4, CIANWOOD_GYM, 1 ; for stonetable
	warp_event 13,  4, CIANWOOD_GYM, 2 ; for stonetable

	def_coord_events

	def_bg_events
	bg_event 11, 15, BGEVENT_READ, CianwoodGymStatue
	bg_event 14, 15, BGEVENT_READ, CianwoodGymStatue

	def_object_events
	object_event 12, 11, SPRITE_CHUCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodGymChuckScript, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	object_event 12, 11, SPRITE_BIG_HO_OH, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptext, CianwoodGymChuckTrainingText, EVENT_BOULDERS_IN_CIANWOOD_GYM
	object_event 13, 11, SPRITE_BOULDER_ROCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptext, CianwoodGymChucksBoulderText, -1
	strengthboulder_event  9,  4, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	strengthboulder_event 16,  4, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	object_event 12,  4, SPRITE_BOULDER_ROCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptext, CianwoodGymBoulderText, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	object_event 13,  4, SPRITE_BOULDER_ROCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptext, CianwoodGymBoulderText, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	object_event  5, 10, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerBlackbeltYoshi, -1
	object_event 21, 10, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerBlackbeltLao, -1
	object_event  9,  6, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerBlackbeltNob, -1
	object_event 20,  6, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerBlackbeltLung, -1
	object_event 15, 15, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CianwoodGymBlackBeltText, -1

	object_const_def
	const CIANWOODGYM_CHUCK1
	const CIANWOODGYM_CHUCK2
	const CIANWOODGYM_BOULDER1
	const CIANWOODGYM_BOULDER2
	const CIANWOODGYM_BOULDER3
	const CIANWOODGYM_BOULDER4
	const CIANWOODGYM_BOULDER5

CianwoodGymBouldersCallback:
	checkevent EVENT_BOULDERS_IN_CIANWOOD_GYM
	iftruefwd .WaterfallBlocked
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	endcallback

.WaterfallBlocked:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	changeblock 12,  4, $83
	changeblock 12,  6, $7d
	changeblock 12,  8, $7d
	changeblock 12, 10, $8f
	endcallback

CianwoodGymSetUpStoneTable:
	usestonetable .StoneTable
	endcallback

.StoneTable:
	stonetable 3, CIANWOODGYM_BOULDER2, .Boulder2
	stonetable 4, CIANWOODGYM_BOULDER3, .Boulder3
	db -1

.Boulder2:
	appear CIANWOODGYM_BOULDER4
	disappear CIANWOODGYM_BOULDER2
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	iffalsefwd .Done
	sjumpfwd .BlockWaterfall

.Boulder3:
	appear CIANWOODGYM_BOULDER5
	disappear CIANWOODGYM_BOULDER3
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftruefwd .BlockWaterfall
.Done:
	end

.BlockWaterfall:
	appear CIANWOODGYM_CHUCK1
	disappear CIANWOODGYM_CHUCK2
	applyonemovement PLAYER, step_end
	reanchormap
	pause 10
	playsound SFX_STRENGTH
	changeblock 12,  4, $98
	refreshmap
	pause 7
	changeblock 12,  4, $83
	changeblock 12,  6, $94
	refreshmap
	pause 7
	changeblock 12,  6, $95
	refreshmap
	pause 7
	changeblock 12,  6, $96
	refreshmap
	pause 7
	changeblock 12,  6, $97
	refreshmap
	pause 7
	changeblock 12,  6, $7d
	changeblock 12,  8, $94
	refreshmap
	pause 7
	changeblock 12,  8, $95
	refreshmap
	pause 7
	changeblock 12,  8, $96
	refreshmap
	pause 7
	changeblock 12,  8, $97
	refreshmap
	pause 7
	changeblock 12,  8, $7d
	changeblock 12, 10, $8f
	refreshmap
	jumpthistext

	text "Die Felsen"
	line "blockierten den"
	cont "Wasserfall!"
	done

CianwoodGymChuckScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CHUCK
	iftruefwd .FightDone
	writetext ChuckIntroText1
	waitbutton
	closetext
	turnobject CIANWOODGYM_CHUCK1, RIGHT
	showtext ChuckIntroText2
	applymovement CIANWOODGYM_BOULDER1, CianwoodGymMovement_ChuckChucksBoulder
	playsound SFX_STRENGTH
	earthquake 80
	disappear CIANWOODGYM_BOULDER1
	pause 30
	showtextfaceplayer ChuckIntroText3
	winlosstext ChuckLossText, 0
	loadtrainer CHUCK, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CHUCK
	opentext
	givebadge STORMBADGE, JOHTO_REGION
	specialphonecall SPECIALCALL_YELLOWFOREST
.FightDone:
	checkevent EVENT_GOT_TM01_DYNAMICPUNCH
	iftrue_jumpopenedtext ChuckAfterText
	setevent EVENT_BEAT_BLACKBELT_YOSHI
	setevent EVENT_BEAT_BLACKBELT_LAO
	setevent EVENT_BEAT_BLACKBELT_NOB
	setevent EVENT_BEAT_BLACKBELT_LUNG
	writetext ChuckExplainBadgeText
	promptbutton
	verbosegivetmhm TM_DYNAMICPUNCH
	setevent EVENT_GOT_TM01_DYNAMICPUNCH
	jumpthisopenedtext

	; GSC-DE Dump 3703
	text "Das ist WUCHT-"
	line "SCHLAG."
	para "Er trifft zwar"
	line "nicht immer, aber"
	para "wenn er es tut,"
	line "verwirrt er den"
	cont "Gegner!"
	done

GenericTrainerBlackbeltYoshi:
	generictrainer BLACKBELT_T, YOSHI, EVENT_BEAT_BLACKBELT_YOSHI, BlackbeltYoshiSeenText, BlackbeltYoshiBeatenText

	; GSC-DE Dump 3707
	text "Es scheint, als"
	line "stündest auch du"
	cont "deinen #MON"
	cont "sehr nahe!"
	done

GenericTrainerBlackbeltLao:
	generictrainer BLACKBELT_T, LAO, EVENT_BEAT_BLACKBELT_LAO, BlackbeltLaoSeenText, BlackbeltLaoBeatenText

	; GSC-DE Dump 3710
	text "Kampf-#MON"
	line "fürchten sich vor"
	cont "Psycho-Attacken…"
	done

GenericTrainerBlackbeltNob:
	generictrainer BLACKBELT_T, NOB, EVENT_BEAT_BLACKBELT_NOB, BlackbeltNobSeenText, BlackbeltNobBeatenText

	; GSC-DE Dump 3713
	text "Ich habe verloren!"
	line "Ich bin sprachlos!"
	done

GenericTrainerBlackbeltLung:
	generictrainer BLACKBELT_T, LUNG, EVENT_BEAT_BLACKBELT_LUNG, BlackbeltLungSeenText, BlackbeltLungBeatenText

	; GSC-DE Dump 3716
	text "Meine #MON ha-"
	line "ben verloren…"
	cont "Mein Stolz ist"
	cont "zerstört…"
	done

CianwoodGymStatue:
	gettrainername CHUCK, 1, STRING_BUFFER_4
	checkflag ENGINE_STORMBADGE
	iftruefwd .Beaten
	jumpstd gymstatue1
.Beaten:
	readvar VAR_BADGES
	ifgreater 12, .LyraToo
	jumpstd gymstatue2
.LyraToo
	jumpstd gymstatue3

CianwoodGymMovement_ChuckChucksBoulder:
	fix_facing
	set_sliding
	run_step_left
	run_step_up
	fast_jump_step_right
	remove_sliding
	remove_fixed_facing
	step_end

ChuckIntroText1:
	; GSC-DE Dump 3697
	text "WAHAHAH!"
	para "Du hast es also"
	line "bis hierher ge-"
	cont "schafft!"
	para "Lass dir gesagt"
	line "sein, dass ich ein"
	cont "harter Brocken"
	cont "bin."
	para "Meine #MON"
	line "werden dich in"
	cont "Grund und Boden"
	cont "rammen!"
	para "Pass auf!"
	done

ChuckIntroText2:
	; GSC-DE Dump 3698
	text "HARTWIG: Urggh!"
	line "…"
	para "Oooarrgh!"
	done

ChuckIntroText3:
	; GSC-DE Dump 3699
	text "Da! Jetzt hast du"
	line "dich erschreckt!"
	para "Wie?"
	line "Es hat nichts mit"
	para "#MON zu tun?"
	line "Das ist wahr!"
	para "Komm her. Lass uns"
	line "kämpfen!"
	done

ChuckLossText:
	; GSC-DE Dump 3700: FAUSTORDEN (Engine: STORMBADGE)
	text "Wa…? Huch?"
	line "Ich habe verloren?"
	para "Wie wär's damit?"
	line "Du bist des FAUST-"
	cont "ORDENs würdig!"
	done

ChuckExplainBadgeText:
	; GSC-DE Dump 3702: FAUSTORDEN (Engine: STORMBADGE)
	text "Durch den FAUSTOR-"
	line "DEN gehorchen dir"
	para "alle #MON"
	line "bis LV 70. Dies"
	para "gilt auch für Ge-"
	line "tauschte."
	para "Außerdem können"
	line "deine #MON"
	para "FLIEGEN auch"
	line "außerhalb eines"
	cont "Kampfes einsetzen."
	para "Hier, nimm auch"
	line "dies!"
	done

ChuckAfterText:
	; GSC-DE Dump 3704
	text "WAHAHAH! Es hat"
	line "Spaß gemacht, ge-"
	cont "gen dich zu kämp-"
	cont "fen."
	para "Aber eine Nieder-"
	line "lage bleibt eine"
	cont "Niederlage!"
	para "Von jetzt an werde"
	line "ich 24 Stunden am"
	cont "Tag trainieren!"
	done

BlackbeltYoshiSeenText:
	; GSC-DE Dump 3705
	text "Meine #MON und"
	line "mich verbindet un-"
	cont "sere Freundschaft."
	para "Dieses Band wird"
	line "nie zerreißen!"
	done

BlackbeltYoshiBeatenText:
	; GSC-DE Dump 3706
	text "Das ist unmöglich!"
	done

BlackbeltLaoSeenText:
	; GSC-DE Dump 3708
	text "Wir Meister der"
	line "Kampfkunst haben"
	cont "vor nichts Angst!"
	done

BlackbeltLaoBeatenText:
	; GSC-DE Dump 3709
	text "Schockierend!"
	done

BlackbeltNobSeenText:
	; GSC-DE Dump 3711
	text "Worte sind nutz-"
	line "los. Lass deine"
	cont "Fäuste sprechen!"
	done

BlackbeltNobBeatenText:
	; GSC-DE Dump 3712
	text "…"
	done

BlackbeltLungSeenText:
	; GSC-DE Dump 3714
	text "Gegen die Wut mei-"
	line "ner Fäuste können"
	cont "deine #MON"
	cont "nichts ausrichten!"
	done

BlackbeltLungBeatenText:
	; GSC-DE Dump 3715
	text "Ich wurde zer-"
	line "schmettert!"
	done

; PC-only (Gym-Guy sitzt im Center; Dump 3718 dort)
CianwoodGymBlackBeltText:
	text "Der ARENA-Guide"
	line "hat zu viel Angst"
	cont "vor uns, um zu"
	cont "bleiben."
	para "Was für ein"
	line "Weichling!"
	done

; PC-only boulder/training
CianwoodGymChuckTrainingText:
	text "Er ist so in sein"
	line "Training vertieft,"
	para "dass er dich nicht"
	line "bemerkt."
	done

CianwoodGymBoulderText:
	text "Der Felsen"
	line "blockiert den"
	cont "Wasserfall."
	done

CianwoodGymChucksBoulderText:
	text "Der Felsen ist zu"
	line "schwer zum"
	cont "Bewegen."
	done
