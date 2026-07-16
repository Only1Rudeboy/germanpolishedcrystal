Route46_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  7, 33, ROUTE_29_46_GATE, 1
	warp_event  8, 33, ROUTE_29_46_GATE, 2
	warp_event 14,  5, DARK_CAVE_VIOLET_ENTRANCE, 3
	warp_event  8,  4, HIDDEN_CAVE_GROTTO, 1

	def_coord_events

	def_bg_events
	bg_event  9, 27, BGEVENT_JUMPTEXT, Route46SignText
	bg_event  8,  3, BGEVENT_JUMPSTD, cavegrotto, HIDDENGROTTO_ROUTE_46

	def_object_events
	object_event 15, 13, SPRITE_HIKER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Route46HikerScript, -1
	object_event 12, 19, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerHikerBailey, -1
	object_event  4, 14, SPRITE_CAMPER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerCamperTed, -1
	object_event  2, 13, SPRITE_PICNICKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerPicnickerErin1, -1
	object_event  7, 26, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route46LassText, -1
	fruittree_event  7,  5, FRUITTREE_ROUTE_46_1, CHERI_BERRY, PAL_NPC_RED
	fruittree_event  8,  6, FRUITTREE_ROUTE_46_2, CHESTO_BERRY, PAL_NPC_PURPLE
	itemball_event  1, 15, X_SPEED, 1, EVENT_ROUTE_46_X_SPEED

Route46HikerScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_ROLLOUT_INTRO
	iftruefwd Route46TutorRoute46Script
	writetext Route46HikerText
	waitbutton
	setevent EVENT_LISTENED_TO_ROLLOUT_INTRO
Route46TutorRoute46Script:
	writetext Text_Route46TutorRollout
	waitbutton
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	writetext Text_Route46TutorQuestion
	yesorno
	iffalsefwd .TutorRefused
	setval ROLLOUT
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpthisopenedtext

	text "Wie du meinst."
	done

.NoSilverLeaf
	jumpthisopenedtext

	text "Ach, du hast kein"
	line "Silberblatt."
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "Fertig! Dein"
	line "#MON hat"
	cont "Rollout gelernt!"
	done

GenericTrainerCamperTed:
	generictrainer CAMPER, TED, EVENT_BEAT_CAMPER_TED, CamperTedSeenText, CamperTedBeatenText

	text "Ich habe mein"
	line "Bestes gegeben und"
	cont "das reichte leider"
	cont "nicht."
	para "Ich gebe ganz"
	line "offen zu - ich"
	cont "habe verloren."
	done

TrainerPicnickerErin1:
	trainer PICNICKER, ERIN1, EVENT_BEAT_PICNICKER_ERIN, PicnickerErin1SeenText, PicnickerErin1BeatenText, 0, PicnickerErin1Script

PicnickerErin1Script:
	loadvar VAR_CALLERID, PHONE_PICNICKER_ERIN
	opentext
	checkflag ENGINE_ERIN_READY_FOR_REMATCH
	iftruefwd .WantsBattle
	checkcellnum PHONE_PICNICKER_ERIN
	iftruefwd Route46NumberAcceptedF
	checkevent EVENT_ERIN_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskedAlready
	writetext PicnickerErinAfterBattleText
	promptbutton
	setevent EVENT_ERIN_ASKED_FOR_PHONE_NUMBER
	scall Route46AskNumber1F
	sjumpfwd .AskForNumber

.AskedAlready:
	scall Route46AskNumber2F
.AskForNumber:
	askforphonenumber PHONE_PICNICKER_ERIN
	ifequalfwd $1, Route46PhoneFullF
	ifequalfwd $2, Route46NumberDeclinedF
	gettrainername PICNICKER, ERIN1, STRING_BUFFER_3
	scall Route46RegisteredNumberF
	sjumpfwd Route46NumberAcceptedF

.WantsBattle:
	scall Route46RematchF
	winlosstext PicnickerErin1BeatenText, 0
	readmem wErinFightCount
	ifequalfwd 2, .Fight2
	ifequalfwd 1, .Fight1
	ifequalfwd 0, .LoadFight0
.Fight2:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .LoadFight2
.Fight1:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd .LoadFight1
.LoadFight0:
	loadtrainer PICNICKER, ERIN1
	startbattle
	reloadmapafterbattle
	loadmem wErinFightCount, 1
	clearflag ENGINE_ERIN_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer PICNICKER, ERIN2
	startbattle
	reloadmapafterbattle
	loadmem wErinFightCount, 2
	clearflag ENGINE_ERIN_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer PICNICKER, ERIN3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ERIN_READY_FOR_REMATCH
	checkevent EVENT_ERIN_CALCIUM
	iftruefwd .HasCalcium
	checkevent EVENT_GOT_CALCIUM_FROM_ERIN
	iftruefwd .GotCalciumAlready
	scall Route46RematchGiftF
	verbosegiveitem CALCIUM
	iffalsefwd ErinNoRoomForCalcium
	setevent EVENT_GOT_CALCIUM_FROM_ERIN
	sjumpfwd Route46NumberAcceptedF

.GotCalciumAlready:
	end

.HasCalcium:
	opentext
	writetext PicnickerErin2BeatenText
	waitbutton
	verbosegiveitem CALCIUM
	iffalsefwd ErinNoRoomForCalcium
	clearevent EVENT_ERIN_CALCIUM
	setevent EVENT_GOT_CALCIUM_FROM_ERIN
	sjumpfwd Route46NumberAcceptedF

Route46AskNumber1F:
	end







Route46AskNumber2F:
	end







Route46RegisteredNumberF:
	end







Route46NumberAcceptedF:
	end







Route46NumberDeclinedF:
	end







Route46PhoneFullF:
	end







Route46RematchF:
	end







ErinNoRoomForCalcium:
	setevent EVENT_ERIN_CALCIUM
	jumpstd packfullf
	end

Route46RematchGiftF:
	end







GenericTrainerHikerBailey:
	generictrainer HIKER, BAILEY, EVENT_BEAT_HIKER_BAILEY, HikerBaileySeenText, HikerBaileyBeatenText

	text "Es ist vorbei."
	line "Auch gut. Wir"
	cont "WANDERER sind eben"
	cont "so."
	done

Route46HikerText:
	text "Ein DONPHAN"
	line "stürmte auf mich"
	cont "zu und ich"
	para "rollte den ganzen"
	line "Weg hier runter!"
	para "Trotzdem lernte"
	line "ich etwas …"
	para "Sei vorsichtig bei"
	line "wütenden #MON!"
	done

Text_Route46TutorRollout:
	text "Ich bringe deinem"
	line "#MON Rollout"
	cont "bei"

	para "für ein"
	line "Silberblatt."
	done


Text_Route46TutorQuestion:
	text "Soll ich deinem"
	line "#MON Rollout"
	cont "beibringen?"
	done



HikerBaileySeenText:
	text "Also gut! Ich"
	line "zeige dir die"
	cont "Kraft von Berg-"
	cont "#MON!"
	done







HikerBaileyBeatenText:
	text "Gnade! Ich kenne"
	line "jetzt deine Kraft!"
	done







CamperTedSeenText:
	text "Ich trainiere auch"
	line "#MON!"
	para "Möchtest du gegen"
	line "mich kämpfen?"
	done







CamperTedBeatenText:
	text "Wah…?"
	done







PicnickerErin1SeenText:
	text "Ich trainiere auch"
	line "#MON!"
	para "Trittst du gegen"
	line "mich an?"
	done







PicnickerErin1BeatenText:
	text "Oh, Mistkerle!"
	done







PicnickerErinAfterBattleText:
	text "Ich war in vielen"
	line "PKMN-ARENEN, aber"
	para "die PKMN-ARENA in"
	line "DUKATIA CITY"
	cont "ist am schönsten."
	para "Dort sind wunder-"
	line "schöne Blumen!"
	done







PicnickerErin2BeatenText:
	text "Arg… Ständig"
	line "verliere ich! Ich"
	para "muss es noch"
	line "härter probieren!"
	para "Egal, danke, dass"
	line "du immer wieder"
	para "gegen mich"
	line "kämpfst. Hier ist"
	cont "das Geschenk vom"
	cont "letzen Mal."
	done







Route46SignText:
	text "ROUTE 46"
	line "BERGWEG VORAUS"
	done







Route46LassText:
	text "Sackgasse…?"

	para "Bin ich falsch"
	line "abgebogen?"

	para "Ich wusste nicht,"
	line "dass es hier nur"
	cont "einen Weg gibt."
	done
