Route32_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_ROUTE32_COOLTRAINER_M_BLOCKS
	scene_const SCENE_ROUTE32_LYRA_GROTTOES
	scene_const SCENE_ROUTE32_OFFER_SLOWPOKETAIL
	scene_const SCENE_ROUTE32_NOOP

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route32FlyPoint
	callback MAPCALLBACK_OBJECTS, Route32Frieda

	def_warp_events
	warp_event 11, 73, ROUTE_32_POKECENTER_1F, 1
	warp_event  4,  2, ROUTE_32_RUINS_OF_ALPH_GATE, 3
	warp_event  4,  3, ROUTE_32_RUINS_OF_ALPH_GATE, 4
	warp_event  6, 79, UNION_CAVE_1F, 4
	warp_event  4, 24, HIDDEN_TREE_GROTTO, 1

	def_coord_events
	coord_event 18,  8, SCENE_ROUTE32_COOLTRAINER_M_BLOCKS, Route32CooltrainerMStopsYou
	coord_event 10, 24, SCENE_ROUTE32_LYRA_GROTTOES, Route32LyraIntroducesHiddenGrottoes1
	coord_event 11, 24, SCENE_ROUTE32_LYRA_GROTTOES, Route32LyraIntroducesHiddenGrottoes2
	coord_event 12, 24, SCENE_ROUTE32_LYRA_GROTTOES, Route32LyraIntroducesHiddenGrottoes3
	coord_event 13, 24, SCENE_ROUTE32_LYRA_GROTTOES, Route32LyraIntroducesHiddenGrottoes4
	coord_event  7, 71, SCENE_ROUTE32_OFFER_SLOWPOKETAIL, Route32WannaBuyASlowpokeTailScript

	def_bg_events
	bg_event 13,  5, BGEVENT_JUMPTEXT, Route32SignText
	bg_event  7,  1, BGEVENT_JUMPTEXT, Route32RuinsSignText
	bg_event 10, 84, BGEVENT_JUMPTEXT, Route32UnionCaveSignText
	bg_event 14,  1, BGEVENT_JUMPTEXT, Route32AdvancedTips1Text
	bg_event  1, 59, BGEVENT_JUMPTEXT, Route32AdvancedTips2Text
	bg_event 12, 67, BGEVENT_ITEM + GREAT_BALL, EVENT_ROUTE_32_HIDDEN_GREAT_BALL_1
	bg_event 11, 40, BGEVENT_ITEM + SUPER_POTION, EVENT_ROUTE_32_HIDDEN_SUPER_POTION_1
	bg_event  8, 10, BGEVENT_ITEM + SUPER_POTION, EVENT_ROUTE_32_HIDDEN_SUPER_POTION_2
	bg_event 18, 49, BGEVENT_ITEM + GOLD_LEAF, EVENT_ROUTE_32_HIDDEN_GOLD_LEAF
	bg_event  8, 80, BGEVENT_ITEM + GREAT_BALL, EVENT_ROUTE_32_HIDDEN_GREAT_BALL_2
	bg_event  4, 23, BGEVENT_JUMPSTD, treegrotto, HIDDENGROTTO_ROUTE_32
	bg_event  5, 23, BGEVENT_JUMPSTD, treegrotto, HIDDENGROTTO_ROUTE_32

	def_object_events
	object_event 19,  8, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Route32CooltrainermPetrieScript, -1
	object_event  7, 70, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, SlowpokeTailSalesmanScript, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event 12, 67, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FriedaScript, EVENT_ROUTE_32_FRIEDA_OF_FRIDAY
	object_event 13, 29, SPRITE_LYRA, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LYRA_ROUTE_32
	object_event  8, 49, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFisherJustin, -1
	object_event 12, 56, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerFisherRalph1, -1
	object_event 12, 33, SPRITE_PICNICKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerPicnickerLiz1, -1
	object_event  6, 48, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFisherHenry, -1
	object_event 16, 18, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerYoungsterAlbert, -1
	object_event  4, 63, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerYoungsterGordon, -1
	object_event  3, 45, SPRITE_CAMPER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerCamperRoland, -1
	object_event 11, 82, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBird_keeperPeter, -1
	itemball_event  6, 53, GREAT_BALL, 1, EVENT_ROUTE_32_GREAT_BALL
	object_event 15, 13, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route32RoarTMGuyScript, -1
	itemball_event  6, 32, REPEL, 1, EVENT_ROUTE_32_REPEL
	cuttree_event 10, 19, EVENT_ROUTE_32_CUT_TREE
	cuttree_event -1, 29, EVENT_MAGNET_TUNNEL_EAST_CUT_TREE
	cuttree_event 19, 32, EVENT_CHERRYGROVE_BAY_CUT_TREE

	object_const_def
	const ROUTE32_COOLTRAINER_M
	const ROUTE32_FISHER4
	const ROUTE32_FRIEDA
	const ROUTE32_LYRA

Route32FlyPoint:
	setflag ENGINE_FLYPOINT_UNION_CAVE
	endcallback

Route32Frieda:
	readvar VAR_WEEKDAY
	ifequalfwd FRIDAY, .FriedaAppears
	disappear ROUTE32_FRIEDA
	endcallback

.FriedaAppears:
	appear ROUTE32_FRIEDA
	endcallback

Route32CooltrainermPetrieScript:
	faceplayer
Route32CooltrainerMTrigger:
	checkflag ENGINE_ZEPHYRBADGE
	iffalse_jumptext Route32CooltrainerMText_VioletGym
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	iffalse_jumptext Route32CooltrainerMText_AideIsWaiting
	checkevent EVENT_GOT_MIRACLE_SEED_FROM_ROUTE_32_LEADER
	iftrue_jumptext .AfterText2
	checkevent EVENT_BEAT_COOLTRAINERM_PETRIE
	iftruefwd .Beaten
	checkevent EVENT_BEAT_CAMPER_ROLAND
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_FISHER_JUSTIN
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_FISHER_RALPH
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_FISHER_HENRY
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_PICNICKER_LIZ
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_YOUNGSTER_ALBERT
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_YOUNGSTER_GORDON
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_BIRD_KEEPER_PETER
	iffalse_jumptext .IntroText
	opentext
	writetext .QuestionText
	yesorno
	iffalse_jumpopenedtext .RefusedText
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked ROUTE32_COOLTRAINER_M
	loadtrainer COOLTRAINERM, PETRIE
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_COOLTRAINERM_PETRIE
.Beaten:
	opentext
	writetext .AfterText1
	promptbutton
	verbosegiveitem MIRACLE_SEED
	iffalse_endtext
	setevent EVENT_GOT_MIRACLE_SEED_FROM_ROUTE_32_LEADER
.GotMiracleSeed:
	jumpthisopenedtext

.AfterText2:
	text "Die Erfahrungen"
	line "von VIOLA CITY"

	para "werden dir auf"
	line "deiner Reise von"
	cont "großem Nutzen"
	cont "sein."
	done
.IntroText:
	text "Du hast gute"
	line "#mon dabei."
	para "Das muss vom"
	line "Training in"
	para "VIOLA CITY kommen."
	para "Du solltest alle"
	line "Trainer auf dieser"
	para "Route problemlos"
	line "besiegen können."
	para "Wenn du das"
	line "schaffst, kämpfe"
	cont "ich selbst gegen"
	cont "dich."
	done

.QuestionText:
	text "Du hast"
	line "anscheinend alle"
	cont "anderen hier"
	cont "besiegt."
	para "Dein Training in"
	line "der Arena muss"
	para "besonders geholfen"
	line "haben."
	para "Ich habe auch den"
	line "Zephyr-Orden."
	para "Willst du gegen"
	line "mich kämpfen?"
	done

.RefusedText:
	text "Du möchtest also"
	line "lieber"
	cont "weiterreisen …"
	done

.SeenText:
	text "Mein Training im"
	line "KNOFENSA-TURM"

	para "übertraf sogar"
	line "FALK. Mal sehen,"

	para "wie du dagegen"
	line "ankommst!"
	done

.BeatenText:
	text "Mein Team wurde"
	line "entwurzelt!"
	done

.AfterText1:
	text "Dein Training war"
	line "besser als meins."
	para "Als Andenken an"
	line "unseren Kampf,"
	cont "nimm das."
	para "Es verstärkt"
	line "Pflanzen-Attacken."
	done

Route32CooltrainerMStopsYou:
	turnobject ROUTE32_COOLTRAINER_M, LEFT
	turnobject PLAYER, RIGHT
	showtext Route32CooltrainerMText_WhatsTheHurry
	follow PLAYER, ROUTE32_COOLTRAINER_M
	applymovement PLAYER, Movement_Route32CooltrainerMPushesYouBackToViolet
	stopfollow
	turnobject PLAYER, DOWN
	scall Route32CooltrainerMTrigger
	applymovement ROUTE32_COOLTRAINER_M, Movement_Route32CooltrainerMReset
	turnobject ROUTE32_COOLTRAINER_M, LEFT
	end

Route32LyraIntroducesHiddenGrottoes1:
	scall Route32LyraIntroducesHiddenGrottoesIntroScript
	applymovement ROUTE32_LYRA, Route32LyraIntroducesHiddenGrottoes_Left3
	scall Route32LyraIntroducesHiddenGrottoesMainScript
	applymovement ROUTE32_LYRA, Route32LyraIntroducesHiddenGrottoes_Left5
	sjump Route32LyraIntroducesHiddenGrottoesOutroScript

Route32LyraIntroducesHiddenGrottoes2:
	scall Route32LyraIntroducesHiddenGrottoesIntroScript
	applymovement ROUTE32_LYRA, Route32LyraIntroducesHiddenGrottoes_Left2
	scall Route32LyraIntroducesHiddenGrottoesMainScript
	applymovement ROUTE32_LYRA, Route32LyraIntroducesHiddenGrottoes_Left6
	sjump Route32LyraIntroducesHiddenGrottoesOutroScript

Route32LyraIntroducesHiddenGrottoes3:
	scall Route32LyraIntroducesHiddenGrottoesIntroScript
	applymovement ROUTE32_LYRA, Route32LyraIntroducesHiddenGrottoes_Left1
	scall Route32LyraIntroducesHiddenGrottoesMainScript
	applymovement ROUTE32_LYRA, Route32LyraIntroducesHiddenGrottoes_Left7
	sjump Route32LyraIntroducesHiddenGrottoesOutroScript

Route32LyraIntroducesHiddenGrottoes4:
	scall Route32LyraIntroducesHiddenGrottoesIntroScript
	scall Route32LyraIntroducesHiddenGrottoesMainScript
	applymovement ROUTE32_LYRA, Route32LyraIntroducesHiddenGrottoes_Left8
	sjump Route32LyraIntroducesHiddenGrottoesOutroScript

Route32LyraIntroducesHiddenGrottoes_Left8:
	step_left
Route32LyraIntroducesHiddenGrottoes_Left7:
	step_left
Route32LyraIntroducesHiddenGrottoes_Left6:
	step_left
Route32LyraIntroducesHiddenGrottoes_Left5:
	step_left
	step_left
Route32LyraIntroducesHiddenGrottoes_Left3:
	step_left
Route32LyraIntroducesHiddenGrottoes_Left2:
	step_left
Route32LyraIntroducesHiddenGrottoes_Left1:
	step_left
	step_end

Route32LyraIntroducesHiddenGrottoesIntroScript:
	applymovement ROUTE32_LYRA, .StepUpMovement
	showemote EMOTE_SHOCK, ROUTE32_LYRA, 15
	special Special_FadeOutMusic
	pause 15
	applymovement ROUTE32_LYRA, .StepUpMovement
	end

.StepUpMovement:
	step_up
	step_up
	step_end

Route32LyraIntroducesHiddenGrottoesMainScript:
	turnobject ROUTE32_LYRA, UP
	playmusic MUSIC_LYRA_ENCOUNTER_HGSS
	opentext
	writetext .GreetingText
	promptbutton
	checkegg
	iftruefwd .HaveEgg
	writetext .NoEggText
	sjumpfwd .Continue
.HaveEgg
	writetext .HaveEggText
.Continue
	waitbutton
	closetext
	playsound SFX_SANDSTORM
	waitsfx
	showemote EMOTE_SHOCK, ROUTE32_LYRA, 15
	applymovement ROUTE32_LYRA, .LookAroundMovement
	showtext .QuestionText
	follow ROUTE32_LYRA, PLAYER
	end

.GreetingText:
	text "<PLAYER>! Hallo!"
	done

.NoEggText:
	text "PROF. LIND sagte,"
	line "sein Gehilfe"
	cont "bringt dir ein EI."
	para "Trag es unbedingt"
	line "bei dir. Ich bin"
	para "so neugierig,"
	line "welches #mon es"
	cont "ist!"
	done

.HaveEggText:
	text "Ach gut! Du trägst"
	line "dieses EI"
	para "genau wie Prof."
	line "Lind es wollte."
	para "Ich bin so"
	line "neugierig, welches"
	cont "#mon es ist!"
	done

.QuestionText:
	text "<PLAYER>, hast du"
	line "das gehört?"
	para "Es kam von"
	line "irgendwo in der"
	cont "Nähe …"
	done

.LookAroundMovement:
	turn_head_right
	step_sleep_8
	step_sleep_8
	step_sleep_8
	turn_head_left
	step_sleep_8
	step_sleep_8
	step_sleep_8
	turn_head_up
	step_end

Route32LyraIntroducesHiddenGrottoesOutroScript:
	stopfollow
	turnobject ROUTE32_LYRA, UP
	showemote EMOTE_SHOCK, ROUTE32_LYRA, 15
	pause 7
	follow ROUTE32_LYRA, PLAYER
	applyonemovement ROUTE32_LYRA, slow_step_up
	stopfollow
	turnobject PLAYER, UP
	pause 15
	turnobject ROUTE32_LYRA, DOWN
	showtext .GrottoText
	applymovement ROUTE32_LYRA, .LeaveMovement1
	turnobject PLAYER, DOWN
	applymovement ROUTE32_LYRA, .LeaveMovement2
	disappear ROUTE32_LYRA
	setscene SCENE_ROUTE32_OFFER_SLOWPOKETAIL
	playmusic MUSIC_ROUTE_30
	end

.GrottoText:
	text "Hier ist es!"
	line "Zwischen den"
	cont "Bäumen ist eine"
	cont "Lücke!"
	para "Von solchen Orten"
	line "hab ich schon"
	cont "gehört."
	para "Das ist eine"
	line "Versteckte Grotte!"
	para "Versteckte Grotten"
	line "findet man"
	cont "zwischen Bäumen"
	cont "und an Klippen."
	para "Vielleicht"
	line "versteckt sich"
	cont "dort ein tolles"
	cont "#mon!"
	para "Ich wünschte, ich"
	line "hätte Zeit zum"
	cont "Stöbern,"
	para "aber ich muss"
	line "weiter."
	para "<PLAYER>, halte"
	line "Ausschau nach"
	cont "weiteren"
	cont "Versteckten"
	cont "Grotten!"
	done

.LeaveMovement1:
	step_left
	step_down
	step_end

.LeaveMovement2:
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end

Route32WannaBuyASlowpokeTailScript:
	turnobject ROUTE32_FISHER4, DOWN
	turnobject PLAYER, UP
	sjumpfwd _OfferToSellSlowpokeTail

SlowpokeTailSalesmanScript:
	faceplayer
_OfferToSellSlowpokeTail:
	setscene SCENE_ROUTE32_NOOP
	opentext
	writetext Text_MillionDollarSlowpokeTail
	yesorno
	iffalsefwd .refused
	jumpthisopenedtext

	text "Tss! Ich dachte,"
	line "die Jugend heute"
	cont "hätte mehr Geld …"
	done


.refused
	jumpthisopenedtext

	text "Du möchtest sie"
	line "nicht? Dann mach"
	cont "dich vom Acker!"
	done

Route32RoarTMGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM05_ROAR
	iftruefwd .AlreadyHaveRoar
	writetext Text_RoarIntro
	promptbutton
	verbosegivetmhm TM_ROAR
	setevent EVENT_GOT_TM05_ROAR
.AlreadyHaveRoar:
	jumpopenedtext Text_RoarOutro

GenericTrainerCamperRoland:
	generictrainer CAMPER, ROLAND, EVENT_BEAT_CAMPER_ROLAND, CamperRolandSeenText, CamperRolandBeatenText

	text "Wenn du nicht"
	line "kämpfen möchtest,"
	cont "vermeide"
	cont "Blickkontakt."
	done
GenericTrainerFisherJustin:
	generictrainer FISHER, JUSTIN, EVENT_BEAT_FISHER_JUSTIN, FisherJustinSeenText, FisherJustinBeatenText

	text "Geduld … Die"
	line "Voraussetzung"
	para "für das Angeln und"
	line "für #mon ist"
	cont "dieselbe."
	done
TrainerFisherRalph1:
	trainer FISHER, RALPH1, EVENT_BEAT_FISHER_RALPH, FisherRalph1SeenText, FisherRalph1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_FISHER_RALPH
	opentext
	checkflag ENGINE_RALPH_READY_FOR_REMATCH
	iftruefwd .Rematch
	checkflag ENGINE_FISH_SWARM
	iftruefwd .Swarm
	checkcellnum PHONE_FISHER_RALPH
	iftruefwd .NumberAccepted
	checkevent EVENT_RALPH_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskAgain
	writetext FisherRalphAfterText
	promptbutton
	setevent EVENT_RALPH_ASKED_FOR_PHONE_NUMBER
	callstd asknumber1m
	sjumpfwd .AskForNumber

.AskAgain:
	callstd asknumber2m
.AskForNumber:
	askforphonenumber PHONE_FISHER_RALPH
	ifequalfwd $1, .PhoneFull
	ifequalfwd $2, .NumberDeclined
	gettrainername FISHER, RALPH1, STRING_BUFFER_3
	callstd registerednumberm
	jumpstd numberacceptedm

.Rematch:
	callstd rematchm
	winlosstext FisherRalph1BeatenText, 0
	readmem wRalphFightCount
	ifequalfwd 4, .Fight4
	ifequalfwd 3, .Fight3
	ifequalfwd 2, .Fight2
	ifequalfwd 1, .Fight1
	ifequalfwd 0, .LoadFight0
.Fight4:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .LoadFight4
.Fight3:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd .LoadFight3
.Fight2:
	checkflag ENGINE_FLYPOINT_LAKE_OF_RAGE
	iftruefwd .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_ECRUTEAK
	iftruefwd .LoadFight1
.LoadFight0:
	loadtrainer FISHER, RALPH1
	startbattle
	reloadmapafterbattle
	loadmem wRalphFightCount, 1
	clearflag ENGINE_RALPH_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer FISHER, RALPH2
	startbattle
	reloadmapafterbattle
	loadmem wRalphFightCount, 2
	clearflag ENGINE_RALPH_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer FISHER, RALPH3
	startbattle
	reloadmapafterbattle
	loadmem wRalphFightCount, 3
	clearflag ENGINE_RALPH_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer FISHER, RALPH4
	startbattle
	reloadmapafterbattle
	loadmem wRalphFightCount, 4
	clearflag ENGINE_RALPH_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer FISHER, RALPH5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_RALPH_READY_FOR_REMATCH
	end

.Swarm:
	jumpthisopenedtext

	text "Eins, zwei, drei …"
	line "Muahaha, was für"
	para "ein Fang! Ich bin"
	line "fertig!"
	para "Fang so viele du"
	line "kannst, Kleiner!"
	done

.NumberAccepted:
	jumpstd numberacceptedm

.NumberDeclined:
	jumpstd numberdeclinedm

.PhoneFull:
	jumpstd phonefullm

GenericTrainerFisherHenry:
	generictrainer FISHER, HENRY, EVENT_BEAT_FISHER_HENRY, FisherHenrySeenText, FisherHenryBeatenText

	text "Frisch gefangene"
	line "#mon können"

	para "gut trainierten"
	line "nicht Paroli"
	cont "bieten."
	done
TrainerPicnickerLiz1:
	trainer PICNICKER, LIZ1, EVENT_BEAT_PICNICKER_LIZ, PicnickerLiz1SeenText, PicnickerLiz1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_PICNICKER_LIZ
	opentext
	checkflag ENGINE_LIZ_READY_FOR_REMATCH
	iftruefwd .Rematch
	checkcellnum PHONE_PICNICKER_LIZ
	iftruefwd .NumberAccepted
	checkevent EVENT_LIZ_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskAgain
	writetext PicnickerLiz1AfterText
	promptbutton
	setevent EVENT_LIZ_ASKED_FOR_PHONE_NUMBER
	callstd asknumber1f
	sjumpfwd .AskForNumber

.AskAgain:
	callstd asknumber2f
.AskForNumber:
	askforphonenumber PHONE_PICNICKER_LIZ
	ifequalfwd $1, .PhoneFull
	ifequalfwd $2, .NumberDeclined
	gettrainername PICNICKER, LIZ1, STRING_BUFFER_3
	callstd registerednumberf
	jumpstd numberacceptedf

.Rematch:
	callstd rematchf
	winlosstext PicnickerLiz1BeatenText, 0
	readmem wLizFightCount
	ifequalfwd 4, .Fight4
	ifequalfwd 3, .Fight3
	ifequalfwd 2, .Fight2
	ifequalfwd 1, .Fight1
	ifequalfwd 0, .LoadFight0
.Fight4:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd .LoadFight4
.Fight3:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftruefwd .LoadFight3
.Fight2:
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftruefwd .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_ECRUTEAK
	iftruefwd .LoadFight1
.LoadFight0:
	loadtrainer PICNICKER, LIZ1
	startbattle
	reloadmapafterbattle
	loadmem wLizFightCount, 1
	clearflag ENGINE_LIZ_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer PICNICKER, LIZ2
	startbattle
	reloadmapafterbattle
	loadmem wLizFightCount, 2
	clearflag ENGINE_LIZ_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer PICNICKER, LIZ3
	startbattle
	reloadmapafterbattle
	loadmem wLizFightCount, 3
	clearflag ENGINE_LIZ_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer PICNICKER, LIZ4
	startbattle
	reloadmapafterbattle
	loadmem wLizFightCount, 4
	clearflag ENGINE_LIZ_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer PICNICKER, LIZ5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_LIZ_READY_FOR_REMATCH
	end

.NumberAccepted:
	jumpstd numberacceptedf

.NumberDeclined:
	jumpstd numberdeclinedf

.PhoneFull:
	jumpstd phonefullf

GenericTrainerYoungsterAlbert:
	generictrainer YOUNGSTER, ALBERT, EVENT_BEAT_YOUNGSTER_ALBERT, YoungsterAlbertSeenText, YoungsterAlbertBeatenText

	text "Ich versuche, mit"
	line "meinen Lieblingen"
	cont "der Beste zu sein."
	para "Ich setze nicht"
	line "auf zähe #mon,"
	cont "wie die anderen."
	done
GenericTrainerYoungsterGordon:
	generictrainer YOUNGSTER, GORDON, EVENT_BEAT_YOUNGSTER_GORDON, YoungsterGordonSeenText, YoungsterGordonBeatenText

	text "Im Gras findest du"
	line "viele Dinge."
	done
GenericTrainerBird_keeperPeter:
	generictrainer BIRD_KEEPER, PETER, EVENT_BEAT_BIRD_KEEPER_PETER, Bird_keeperPeterSeenText, Bird_keeperPeterBeatenText

	text "Ich sollte wieder"
	line "in der Arena in"
	cont "VIOLA CITY"
	cont "trainieren."
	done

FriedaScript:
	checkevent EVENT_GOT_POISON_BARB_FROM_FRIEDA
	iftrue_jumptextfaceplayer FriedaFridayText
	readvar VAR_WEEKDAY
	ifnotequal FRIDAY, .NotFriday
	faceplayer
	opentext
	checkevent EVENT_MET_FRIEDA_OF_FRIDAY
	iftruefwd .MetFrieda
	writetext MeetFriedaText
	promptbutton
	setevent EVENT_MET_FRIEDA_OF_FRIDAY
.MetFrieda:
	writetext FriedaGivesGiftText
	promptbutton
	verbosegiveitem POISON_BARB
	iffalse_endtext
	setevent EVENT_GOT_POISON_BARB_FROM_FRIEDA
	jumpthisopenedtext

	text "FRIEDA: Gib es"
	line "einem #mon, das"
	cont "über Gift-Attacken"
	cont "verfügt."
	para "Oh!"
	para "Es ist gemein!"
	para "Du wirst dich"
	line "wundern, wie"
	cont "effektiv deine"
	cont "Gift-Attacken"
	cont "werden!"
	done
.NotFriday:
	jumpthistextfaceplayer

	text "FRIEDA: Ist heute"
	line "nicht Freitag?"
	para "Es wäre"
	line "langweilig, wenn"
	cont "nicht!"
	done
Movement_Route32CooltrainerMPushesYouBackToViolet:
	step_up
	step_up
	step_end

Movement_Route32CooltrainerMReset:
	step_down
	step_right
	step_end

Route32CooltrainerMText_WhatsTheHurry:
	text "Warte! Warum die"
	line "Eile?"
	done






Route32CooltrainerMText_AideIsWaiting:
	text "<PLAYER>, oder? Ein"
	line "Typ mit einer"
	para "Brille hat nach"
	line "dir gefragt."
	para "Kümmere dich um"
	line "ihn. Er erwartet"
	para "dich im"
	line "#mon-CENTER."
	done






Route32CooltrainerMText_VioletGym:
	text "Warst du schon in"
	line "der PKMN-ARENA?"
	para "Dort kannst du"
	line "deine #mon und"
	cont "dich auf die Probe"
	cont "stellen."
	para "Es ist eine Art"
	line "Ritus für alle"
	cont "Trainer!"
	done






Text_MillionDollarSlowpokeTail:
	text "Wie möchtest du"
	line "die schmackhafte,"
	para "gehaltvolle"
	line "FLEGMONRUTE"
	cont "zubereitet haben?"
	para "Für dich jetzt nur"
	line "¥1,000,000!"
	para "Möchtest du sie?"
	done






FisherJustinSeenText:
	text "Toll!"
	para "Wegen dir habe ich"
	line "den Fisch"
	cont "verloren!"
	done






FisherJustinBeatenText:
	text "Platsch!"
	done






FisherRalph1SeenText:
	text "Ich beherrsche"
	line "beides, Angeln und"
	cont "#mon."
	para "Darum werde ich"
	line "nicht verlieren!"
	done






FisherRalph1BeatenText:
	text "Ts! Ich wollte die"
	line "Sache"
	cont "beschleunigen …"
	done






FisherRalphAfterText:
	text "Angeln ist eine"
	line "Leidenschaft für"

	para "das ganze Leben."
	line "#mon sind"
	cont "Kameraden fürs"
	cont "Leben!"
	done






FisherHenrySeenText:
	text "Meine #mon?"
	line "Frisch gefangen!"
	done






FisherHenryBeatenText:
	text "PLATSCHER?"
	done






YoungsterAlbertSeenText:
	text "Ich habe dich hier"
	line "noch nie gesehen."
	para "Du denkst also, du"
	line "bist stark?"
	done






YoungsterAlbertBeatenText:
	text "Du bist stark!"
	done






YoungsterGordonSeenText:
	text "Ich habe gute"
	line "#mon im Gras"
	cont "gefunden!"
	para "Ich denke, sie"
	line "passen ganz gut zu"
	cont "mir!"
	done






YoungsterGordonBeatenText:
	text "Mist. Ich dachte,"
	line "ich könnte"
	cont "gewinnen."
	done






CamperRolandSeenText:
	text "Dieser Blick … Wie"
	line "faszinierend."
	done






CamperRolandBeatenText:
	text "Hm. Das ist"
	line "enttäuschend."
	done






PicnickerLiz1SeenText:
	text "A-ha. Ja, du weißt"
	line "…"
	para "Wie bitte? Kampf?"
	line "Ich telefoniere."
	para "Oh, O.K. Aber mach"
	line "schnell."
	done






PicnickerLiz1BeatenText:
	text "Ich muss meinem"
	line "Ärger Luft machen!"
	done






PicnickerLiz1AfterText:
	text "Ich hatte einen"
	line "netten Plausch."
	done






Bird_keeperPeterSeenText:
	text "Dieser ORDEN! Er"
	line "ist aus VIOLA"
	cont "CITY!"

	para "Du hast FALK"
	line "besiegt?"
	done
Bird_keeperPeterBeatenText:
	text "Ich kenne meine"
	line "Schwächen."
	done

Text_RoarIntro: ; text > text
	text "BRÜLL! DIE LEUTE"
	line "LAUFEN"
	para "DAVON, WENN ICH"
	line "BRÜLLE! DU ABER"
	cont "WOLLTEST MICH"
	cont "SEHEN!"
	para "DAS GEFÄLLT MIR!"
	line "HIER BITTE SCHÖN!"
	done







Text_RoarOutro: ; text > text
	text "BRÜLL! ES IST"
	line "BRÜLLER!"
	para "SOGAR #mon"
	line "LAUFEN DAVON, WENN"
	cont "DU IHN EINSETZT!"
	done







MeetFriedaText:
	text "FRIEDA: Juhu! Es"
	line "ist Freitag!"
	para "Ich bin FRIEDA von"
	line "Freitag!"
	para "Schön dich kennen"
	line "zu lernen!"
	done






FriedaGivesGiftText:
	text "Hier, GIFTSTICH"
	line "ist für dich!"
	done






FriedaFridayText:
	text "FRIEDA: Hossa!"
	line "Welchen Wochentag"
	cont "hast du am"
	cont "liebsten?"
	para "Ich liebe Freitag."
	line "Daran gibt es"
	cont "keinen Zweifel!"
	para "Denkst du nicht"
	line "auch, dass Freitag"
	cont "großartig ist?"
	done






Route32SignText:
	text "ROUTE 32"
	para "VIOLA CITY -AZALEA"
	line "CITY"
	done






Route32RuinsSignText:
	text "ALPH-RUINEN"
	line "OSTEINGANG"
	done






Route32UnionCaveSignText:
	text "EINHEITSTUNNEL"
	line "Geradeaus"
	done






Route32AdvancedTips1Text:
	text "Profi-Tipps!"

	para "Items findest du"
	line "beim Angeln oder"

	para "wenn du Felsen"
	line "zerschmetterst!"
	done

Route32AdvancedTips2Text:
	text "Profi-Tipps!"
	para "Verlierst du gegen"
	line "einen Trainer,"
	cont "zahlst du ihm Geld"
	cont "-"
	para "je nach Anzahl"
	line "deiner Orden!"
	done
