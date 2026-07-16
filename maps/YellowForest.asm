YellowForest_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_YELLOWFOREST_BRIDGE_UNDERFOOT
	scene_const SCENE_YELLOWFOREST_BRIDGE_OVERHEAD

	def_callbacks
	callback MAPCALLBACK_NEWMAP, YellowForestFlyPoint
	callback MAPCALLBACK_TILES, YellowForestTileScript

	def_warp_events
	warp_event 28, 47, YELLOW_FOREST_GATE, 1
	warp_event 29, 47, YELLOW_FOREST_GATE, 2
	warp_event 19, 12, HIDDEN_TREE_GROTTO, 1

	def_coord_events
	coord_event 32, 16, SCENE_YELLOWFOREST_BRIDGE_OVERHEAD, YellowForestBridgeOverheadTrigger
	coord_event 32, 17, SCENE_YELLOWFOREST_BRIDGE_OVERHEAD, YellowForestBridgeOverheadTrigger
	coord_event 39, 16, SCENE_YELLOWFOREST_BRIDGE_OVERHEAD, YellowForestBridgeOverheadTrigger
	coord_event 39, 17, SCENE_YELLOWFOREST_BRIDGE_OVERHEAD, YellowForestBridgeOverheadTrigger
	coord_event 33, 16, SCENE_YELLOWFOREST_BRIDGE_UNDERFOOT, YellowForestBridgeUnderfootTrigger
	coord_event 33, 17, SCENE_YELLOWFOREST_BRIDGE_UNDERFOOT, YellowForestBridgeUnderfootTrigger
	coord_event 38, 16, SCENE_YELLOWFOREST_BRIDGE_UNDERFOOT, YellowForestBridgeUnderfootTrigger
	coord_event 38, 17, SCENE_YELLOWFOREST_BRIDGE_UNDERFOOT, YellowForestBridgeUnderfootTrigger

	def_bg_events
	bg_event 39, 14, BGEVENT_ITEM + BIG_MUSHROOM, EVENT_YELLOW_FOREST_HIDDEN_BIG_MUSHROOM
	bg_event 43, 36, BGEVENT_ITEM + BALMMUSHROOM, EVENT_YELLOW_FOREST_HIDDEN_BALM_MUSHROOM
	bg_event 32, 11, BGEVENT_ITEM + GOLD_LEAF, EVENT_YELLOW_FOREST_HIDDEN_GOLD_LEAF_1
	bg_event  9, 40, BGEVENT_ITEM + GOLD_LEAF, EVENT_YELLOW_FOREST_HIDDEN_GOLD_LEAF_2
	bg_event 19, 11, BGEVENT_JUMPSTD, treegrotto, HIDDENGROTTO_YELLOW_FOREST
	bg_event 20, 11, BGEVENT_JUMPSTD, treegrotto, HIDDENGROTTO_YELLOW_FOREST

	def_object_events
	object_event  7, 24, SPRITE_WALKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 1, YellowForestWalkerScript, EVENT_YELLOW_FOREST_WALKER
	pokemon_event  8, 24, SKARMORY, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_GRAY, ClearText, EVENT_YELLOW_FOREST_SKARMORY
	object_event 47,  6, SPRITE_YELLOW, SPRITEMOVEDATA_WANDER, 1, 2, -1, 0, OBJECTTYPE_SCRIPT, 0, YellowForestYellowScript, -1
	object_event 49, 26, SPRITE_BALL_CUT_TREE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_ENV_BLUE, OBJECTTYPE_SCRIPT, 0, YellowForestSurfPikachuDoll, EVENT_DECO_SURFING_PIKACHU_DOLL
	object_event 31,  8, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, YellowForestSuperNerdText, -1
	object_event 19, 41, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSchoolgirlSarah, -1
	object_event 13, 34, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSchoolgirlIsabel, -1
	object_event  4, 38, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerTeacherKathryn, -1
	object_event 43, 42, SPRITE_BREEDER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBreederSophie, -1
	object_event 15, 18, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, YellowForestCooltrainerMScript, -1
	tmhmball_event 25, 18, TM_LEECH_LIFE, EVENT_YELLOW_FOREST_TM_LEECH_LIFE
	itemball_event 32, 26, MIRACLE_SEED, 1, EVENT_YELLOW_FOREST_MIRACLE_SEED
	itemball_event 11, 23, BIG_ROOT, 1, EVENT_YELLOW_FOREST_BIG_ROOT
	itemball_event 50, 13, LEMONADE, 1, EVENT_YELLOW_FOREST_LEMONADE

	object_const_def
	const YELLOWFOREST_WALKER
	const YELLOWFOREST_SKARMORY
	const YELLOWFOREST_YELLOW
	const YELLOWFOREST_POKE_BALL5

YellowForestFlyPoint:
	setflag ENGINE_FLYPOINT_YELLOW_FOREST
	endcallback

YellowForestTileScript:
	checkscene
	iftruefwd .underfoot
	callasm YellowForest_OverheadBridgeAsm
	endcallback

.underfoot:
	callasm YellowForest_UnderfootBridgeAsm
	endcallback

YellowForest_OverheadBridgeAsm:
	changebridgeblock 32, 16, $9d, YELLOW_FOREST
	changebridgeblock 34, 16, $9e, YELLOW_FOREST
	changebridgeblock 36, 16, $9e, YELLOW_FOREST
	changebridgeblock 38, 16, $9f, YELLOW_FOREST
	jmp BufferScreen

YellowForest_UnderfootBridgeAsm:
	changebridgeblock 32, 16, $86, YELLOW_FOREST
	changebridgeblock 34, 16, $97, YELLOW_FOREST
	changebridgeblock 36, 16, $97, YELLOW_FOREST
	changebridgeblock 38, 16, $87, YELLOW_FOREST
	jmp BufferScreen

YellowForestBridgeOverheadTrigger:
	callasm YellowForest_OverheadBridgeAsm
	callthisasm
	xor a
	jr YellowForest_FinishBridge

YellowForestBridgeUnderfootTrigger:
	callasm YellowForest_UnderfootBridgeAsm
	callthisasm
	ld a, $1
YellowForest_FinishBridge:
	ld [wWalkingOnBridge], a
	ld [wYellowForestSceneID], a ; setscene a
	jmp GenericFinishBridge

GenericTrainerSchoolgirlSarah:
	generictrainer SCHOOLGIRL, SARAH, EVENT_BEAT_SCHOOLGIRL_SARAH, SchoolgirlSarahSeenText, SchoolgirlSarahBeatenText

	text "Wären wir in"
	line "meiner Schule,"
	cont "hätte ich"
	cont "gewonnen!"
	done

GenericTrainerSchoolgirlIsabel:
	generictrainer SCHOOLGIRL, ISABEL, EVENT_BEAT_SCHOOLGIRL_ISABEL, SchoolgirlIsabelSeenText, SchoolgirlIsabelBeatenText

	text "Wir lernen, wie"
	line "#MON in der"
	cont "Wildnis zusammen"
	para "überleben."
	done

GenericTrainerTeacherKathryn:
	generictrainer TEACHER_F, KATHRYN, EVENT_BEAT_TEACHER_KATHRYN, TeacherKathrynSeenText, TeacherKathrynBeatenText

	text "Bei einem Ausflug"
	line "alle im Blick zu"

	para "behalten ist"
	line "anstrengend."
	done

GenericTrainerBreederSophie:
	generictrainer BREEDER, SOPHIE, EVENT_BEAT_BREEDER_SOPHIE, BreederSophieSeenText, BreederSophieBeatenText

	text "Manchmal nutzen"
	line "PIKACHU ihre"
	para "Elektroschocks, um"
	line "ohnmächtige"
	para "Artgenossen zu"
	line "wecken. Wie süß!"
	done

YellowForestWalkerScript:
	showtextfaceplayer YellowForestWalkerSeenText
	winlosstext YellowForestWalkerBeatenText, 0
	setlasttalked YELLOWFOREST_WALKER
	loadtrainer WALKER, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_WALKER
	opentext
	writetext YellowForestWalkerAfterText
	promptbutton
	verbosegivetmhm HM_FLY
	setevent EVENT_GOT_HM02_FLY
	writetext YellowForestWalkerFinalText
	waitbutton
	closetext
	appear YELLOWFOREST_SKARMORY
	playsound SFX_BALL_POOF
	turnobject YELLOWFOREST_WALKER, RIGHT
	waitsfx
	pause 15
	cry SKARMORY
	waitsfx
	turnobject YELLOWFOREST_WALKER, DOWN
	showtext YellowForestWalkerFlyText
	playsound SFX_FLY
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear YELLOWFOREST_WALKER
	disappear YELLOWFOREST_SKARMORY
	waitsfx
	pause 15
	special Special_FadeInQuickly
	end

YellowForestYellowScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_YELLOW
	iffalsefwd YellowForestYellowBattleScript
	checkevent EVENT_GOT_LIGHT_BALL_FROM_YELLOW
	iffalsefwd YellowBattleAfterBallScript
	jumpopenedtext YellowForestYellowGoodbyeText

YellowForestYellowBattleScript:
	writetext YellowForestYellowGreetingText
	waitbutton
	closetext
	winlosstext YellowForestYellowWinLossText, 0
	setlasttalked YELLOWFOREST_YELLOW
	loadtrainer YELLOW, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_YELLOW
	checkevent EVENT_GOT_A_POKEMON_FROM_IVY
	iffalsefwd .skip
	clearevent EVENT_INDIGO_PLATEAU_POKECENTER_YELLOW
.skip
	opentext
	writetext YellowForestYellowAfterText
	scall YellowTryGiveLightBallScript
	end

YellowBattleAfterBallScript:
	faceplayer
	opentext
	writetext YellowForestYellowAfterText
YellowTryGiveLightBallScript:
	promptbutton
	verbosegiveitem LIGHT_BALL
	iffalsefwd NoRoomForLightBallScript
	setevent EVENT_GOT_LIGHT_BALL_FROM_YELLOW
	writetext YellowForestYellowGoodbyeText
	waitbutton
NoRoomForLightBallScript:
	endtext

YellowForestCooltrainerMScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_SEED_BOMB_INTRO
	iftruefwd YellowForestTutorSeedBombScript
	writetext YellowForestCooltrainerMText
	waitbutton
	setevent EVENT_LISTENED_TO_SEED_BOMB_INTRO
YellowForestTutorSeedBombScript:
	writetext Text_YellowForestTutorSeedBomb
	waitbutton
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	writetext Text_YellowForestTutorQuestion
	yesorno
	iffalsefwd .TutorRefused
	setval SEED_BOMB
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpthisopenedtext

	text "Sag Bescheid, wenn"
	line "du es dir anders"
	cont "überlegst!"
	done

.NoSilverLeaf
	jumpthisopenedtext

	text "Ach, du hast kein"
	line "Silberblatt."
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "So! Dein #MON"
	line "kennt jetzt"
	cont "Samenbomben!"
	done

YellowForestSurfPikachuDoll:
	disappear YELLOWFOREST_POKE_BALL5
	setevent EVENT_DECO_SURFING_PIKACHU_DOLL
	opentext
	writetext YellowForestSurfPikachuDollText
	playsound SFX_ITEM
	pause 60
	waitbutton
	jumpthisopenedtext

	text "SURFER-PIKACHU"
	line "wurde nach Hause"
	cont "geschickt."
	done

SchoolgirlSarahSeenText:
	text "Ooh, ein Trainer!"
	line "Ich will kämpfen!"
	done

SchoolgirlSarahBeatenText:
	text "Schnief… Du hast"
	line "mich besiegt!"
	done

SchoolgirlIsabelSeenText:
	text "Hast du niedliche"
	line "#MON wie die"
	cont "hier?"
	done

SchoolgirlIsabelBeatenText:
	text "Du hast wirklich"
	line "starke #MON!"
	done

TeacherKathrynSeenText:
	text "Du da! Du bist"
	line "Trainer?"

	para "Lass meine Schüler"
	line "bloß nicht weinen!"
	done

TeacherKathrynBeatenText:
	text "Das bringt mich"
	line "nicht zum Weinen…"
	done

BreederSophieSeenText:
	text "Wusstest du, dass"
	line "PIKACHU ein"
	cont "entwickeltes"
	cont "#MON ist?"
	done

BreederSophieBeatenText:
	text "Das dachte ich!"
	done

YellowForestWalkerSeenText:
	text "Hi! Ich bin"
	line "WALKER."

	para "Früher war ich"
	line "ARENALEITER von"

	para "VIOLA CITY, aber"
	line "das überließ ich"

	para "meinem Sohn."

	para "Jetzt wandere ich"
	line "durch JOHTO und"

	para "genieße die"
	line "Aussicht."

	para "WALKER: Du"
	line "sammelst ORDEN,"
	cont "oder?"

	para "Dann hat mein Sohn"
	line "gegen dich"
	cont "verloren!"

	para "Jetzt will ich"
	line "deine Stärke"
	cont "selbst testen."

	para "Ich hab keinen"
	line "ORDEN, aber wenn"

	para "du gewinnst,"
	line "bekommst du etwas"
	cont "Schönes!"
	done

YellowForestWalkerBeatenText:
	text "Meine"
	line "Vogel-#MON…"
	cont "Besiegt! Besiegt!"
	done

YellowForestWalkerAfterText:
	text "WALKER: Ich"
	line "verstehe, warum du"
	cont "gegen FALK"

	para "gewonnen hast."

	para "Du kennst deine"
	line "#MON in- und"
	cont "auswendig!"

	para "Du hast dir diese"
	line "VM verdient."
	done

YellowForestWalkerFinalText:
	text "WALKER:"
	line "Vogel-#MON"
	cont "fliegen durch den"

	para "Himmel, weil sie"
	line "das von ganzem"

	para "Herzen wollen."

	para "Wenn du etwas so"
	line "sehr willst,"

	para "schaffst du es."
	line "Ich will weiter"

	para "wandern."

	para "Auf Wiedersehen!"
	done

YellowForestWalkerFlyText:
	text "PANZAERON, auf,"
	line "FLIEGEN!"
	done

YellowForestYellowGreetingText:
	text "YELLOW: Hi! Ich"
	line "bin YELLOW!"

	para "Dieser Wald voller"
	line "PIKACHU…"

	para "Er erinnert mich"
	line "an meine Heimat in"
	cont "KANTO."

	para "Dort hab ich mein"
	line "erstes #MON"

	para "gefangen."

	para "Der Trainer, der"
	line "mir half, sagte:"

	para "Wenn du dich von"
	line "Herzen um #MON"

	para "kümmerst, bleiben"
	line "sie immer deine"
	cont "Freunde!"

	para "Ich spüre, dass du"
	line "deine #MON"

	para "liebst. Zeig mir,"
	line "was deine Freunde"
	cont "können!"
	done

YellowForestYellowWinLossText:
	text "Haha! Was für ein"
	line "Kampf!"
	done

YellowForestYellowAfterText:
	text "YELLOW: Toll! Du"
	line "bist wirklich"

	para "ein guter Trainer."
	line "Hier, etwas für"

	para "deine Freunde!"
	done

YellowForestYellowGoodbyeText:
	text "YELLOW: Gib den"
	line "Kugelblitz einem"

	para "PIKACHU - er"
	line "steigert seine"
	cont "Kraft."
	done

YellowForestCooltrainerMText:
	text "Samen sind"
	line "überraschend"
	cont "mächtig."

	para "Über viele Jahre"
	line "wird aus einem"

	para "kleinen Samen ein"
	line "riesiger Baum."

	para "Und ein großer"
	line "Samen kann dich"
	cont "einfach treffen!"
	done

Text_YellowForestTutorSeedBomb:
	text "Für ein Silber-"
	line "blatt bringe ich"

	para "deinem #MON"
	line "Samenbomben bei."
	done

Text_YellowForestTutorQuestion:
	text "Soll dein #MON"
	line "Samenbomben"
	cont "lernen?"
	done

YellowForestSuperNerdText:
	text "In deinem Körper"
	line "gibt es ein"
	cont "Protein namens"
	cont "Pikachurin."

	para "Was hat den Namen"
	line "inspiriert?"

	para "PIKACHU,"
	line "natürlich!"
	done

YellowForestSurfPikachuDollText:
	text "<PLAYER> findet"
	line "SURFER-PIKACHU."
	done
