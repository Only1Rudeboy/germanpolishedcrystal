NewBarkTown_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_NEWBARKTOWN_TEACHER_STOPS_YOU
	scene_const SCENE_NEWBARKTOWN_LYRA_FINAL
	scene_const SCENE_NEWBARKTOWN_NOOP

	def_callbacks
	callback MAPCALLBACK_NEWMAP, NewBarkTownFlyPoint

	def_warp_events
	warp_event  6,  3, ELMS_LAB, 1
	warp_event 15,  5, PLAYERS_HOUSE_1F, 1
	warp_event  3, 11, PLAYERS_NEIGHBORS_HOUSE, 1
	warp_event 11, 13, LYRAS_HOUSE_1F, 1
	warp_event 10,  2, ELMS_HOUSE, 2

	def_coord_events
	coord_event  1,  8, SCENE_NEWBARKTOWN_TEACHER_STOPS_YOU, NewBarkTown_TeacherStopsYouTrigger1
	coord_event  1,  9, SCENE_NEWBARKTOWN_TEACHER_STOPS_YOU, NewBarkTown_TeacherStopsYouTrigger2
	coord_event  6,  4, SCENE_NEWBARKTOWN_TEACHER_STOPS_YOU, NewBarkTown_LyraIntroTrigger
	coord_event 17,  6, SCENE_NEWBARKTOWN_LYRA_FINAL, NewBarkTown_LyraFinalTrigger1
	coord_event 17,  7, SCENE_NEWBARKTOWN_LYRA_FINAL, NewBarkTown_LyraFinalTrigger2
	coord_event 17,  8, SCENE_NEWBARKTOWN_LYRA_FINAL, NewBarkTown_LyraFinalTrigger3
	coord_event 17,  9, SCENE_NEWBARKTOWN_LYRA_FINAL, NewBarkTown_LyraFinalTrigger4

	def_bg_events
	bg_event  8,  8, BGEVENT_JUMPTEXT, NewBarkTownSignText
	bg_event 13,  5, BGEVENT_JUMPTEXT, PlayersHouseSignText
	bg_event  3,  3, BGEVENT_JUMPTEXT, ElmsLabSignText
	bg_event  9, 13, BGEVENT_JUMPTEXT, LyrasHouseSignText
	bg_event  3,  2, BGEVENT_ITEM + POTION, EVENT_NEW_BARK_TOWN_HIDDEN_POTION

	def_object_events
	object_event  3,  2, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, NewBarkTownRivalScript, EVENT_RIVAL_NEW_BARK_TOWN
	object_event  1,  6, SPRITE_LYRA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LYRA_NEW_BARK_TOWN
	object_event  6,  8, SPRITE_POKEFAN_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NewBarkTownTeacherScript, -1
	object_event 13,  8, SPRITE_FAT_GUY, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, Text_ElmDiscoveredNewMon, -1
	object_event  7, 15, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, (1 << MORN) | (1 << DAY), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Text_GearIsImpressive, -1

	object_const_def
	const NEWBARKTOWN_RIVAL
	const NEWBARKTOWN_LYRA
	const NEWBARKTOWN_TEACHER

NewBarkTownFlyPoint:
	setflag ENGINE_FLYPOINT_NEW_BARK
	clearevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	endcallback

NewBarkTown_TeacherStopsYouTrigger1:
	playmusic MUSIC_MOM
	turnobject NEWBARKTOWN_TEACHER, LEFT
	showtext Text_WaitPlayer
	turnobject PLAYER, RIGHT
	applymovement NEWBARKTOWN_TEACHER, Movement_TeacherRunsToYou1_NBT
	showtext Text_WhatDoYouThinkYoureDoing
	follow NEWBARKTOWN_TEACHER, PLAYER
	applymovement NEWBARKTOWN_TEACHER, Movement_TeacherBringsYouBack1_NBT
	stopfollow
	showtext Text_ItsDangerousToGoAlone
	special RestartMapMusic
	end

NewBarkTown_TeacherStopsYouTrigger2:
	playmusic MUSIC_MOM
	turnobject NEWBARKTOWN_TEACHER, LEFT
	showtext Text_WaitPlayer
	turnobject PLAYER, RIGHT
	applymovement NEWBARKTOWN_TEACHER, Movement_TeacherRunsToYou2_NBT
	turnobject PLAYER, UP
	showtext Text_WhatDoYouThinkYoureDoing
	follow NEWBARKTOWN_TEACHER, PLAYER
	applymovement NEWBARKTOWN_TEACHER, Movement_TeacherBringsYouBack2_NBT
	stopfollow
	showtext Text_ItsDangerousToGoAlone
	special RestartMapMusic
	end

NewBarkTown_LyraIntroTrigger:
	appear NEWBARKTOWN_LYRA
	special Special_FadeOutMusic
	applymovement NEWBARKTOWN_LYRA, Movement_LyraEnters_NBT
	playmusic MUSIC_LYRA_ENCOUNTER_HGSS
	showemote EMOTE_SHOCK, NEWBARKTOWN_LYRA, 15
	applymovement NEWBARKTOWN_LYRA, Movement_LyraApproaches_NBT
	turnobject PLAYER, LEFT
	showtext Text_LyraIntro
	follow PLAYER, NEWBARKTOWN_LYRA
	applyonemovement PLAYER, step_up
	stopfollow
	playsound SFX_EXIT_BUILDING
	disappear PLAYER
	applyonemovement NEWBARKTOWN_LYRA, step_up
	playsound SFX_EXIT_BUILDING
	disappear NEWBARKTOWN_LYRA
	setscene SCENE_NEWBARKTOWN_NOOP
	special FadeOutPalettes
	pause 15
	warpfacing UP, ELMS_LAB, 4, 11
	end

NewBarkTown_LyraFinalTrigger1:
	moveobject NEWBARKTOWN_LYRA, 14, 11
	sjumpfwd NewBarkTown_LyraFinalTrigger

NewBarkTown_LyraFinalTrigger2:
	moveobject NEWBARKTOWN_LYRA, 14, 12
	sjumpfwd NewBarkTown_LyraFinalTrigger

NewBarkTown_LyraFinalTrigger3:
	moveobject NEWBARKTOWN_LYRA, 14, 13
	sjumpfwd NewBarkTown_LyraFinalTrigger

NewBarkTown_LyraFinalTrigger4:
	moveobject NEWBARKTOWN_LYRA, 14, 14
NewBarkTown_LyraFinalTrigger:
	appear NEWBARKTOWN_LYRA
	applymovement NEWBARKTOWN_LYRA, Movement_LyraSaysGoodbye1_NBT
	showemote EMOTE_SHOCK, NEWBARKTOWN_LYRA, 15
	special Special_FadeOutMusic
	pause 15
	applymovement NEWBARKTOWN_LYRA, Movement_LyraSaysGoodbye2_NBT
	turnobject PLAYER, LEFT
	showtext Text_LyraGoodbye1
	setevent EVENT_LYRA_NEW_BARK_TOWN
	winlosstext Text_LyraGoodbyeWin, Text_LyraGoodbyeLoss
	setlasttalked NEWBARKTOWN_LYRA
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftruefwd .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftruefwd .Chikorita
	loadtrainer LYRA1, LYRA1_10
	sjumpfwd .AfterBattle

.Totodile:
	loadtrainer LYRA1, LYRA1_11
	sjumpfwd .AfterBattle

.Chikorita:
	loadtrainer LYRA1, LYRA1_12
.AfterBattle
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	special DeleteSavedMusic
	playmusic MUSIC_LYRA_DEPARTURE_HGSS
	showtext Text_LyraGoodbye2
	applymovement NEWBARKTOWN_LYRA, Movement_LyraSaysGoodbye3_NBT
	disappear NEWBARKTOWN_LYRA
	setscene SCENE_NEWBARKTOWN_NOOP
	playmapmusic
	end

NewBarkTownTeacherScript:
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iftrue_jumptextfaceplayer Text_CallMomOnGear
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue_jumptextfaceplayer Text_TellMomIfLeaving
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue_jumptextfaceplayer Text_YourMonIsAdorable
	jumpthistextfaceplayer

	text "Hier weht immer so"
	line "eine erfrischende"
	cont "Brise."
	done

NewBarkTownRivalScript:
	showtext NewBarkTownRivalText1
	turnobject NEWBARKTOWN_RIVAL, LEFT
	showtext NewBarkTownRivalText2
	turnobject PLAYER, UP
	applyonemovement PLAYER, fix_facing
	follow PLAYER, NEWBARKTOWN_RIVAL
	applyonemovement PLAYER, step_down
	stopfollow
	pause 5
	turnobject NEWBARKTOWN_RIVAL, DOWN
	pause 5
	playsound SFX_TACKLE
	applyonemovement PLAYER, jump_step_down
	applyonemovement PLAYER, remove_fixed_facing
	applyonemovement NEWBARKTOWN_RIVAL, step_right
	end

Movement_TeacherRunsToYou1_NBT:
	step_left
	step_left
	step_left
	step_left
	step_end

Movement_TeacherRunsToYou2_NBT:
	step_left
	step_left
	step_left
	step_left
	step_left
	turn_head_down
	step_end

Movement_TeacherBringsYouBack2_NBT:
	step_right
Movement_TeacherBringsYouBack1_NBT:
	step_right
	step_right
	step_right
	step_right
	turn_head_left
	step_end

Movement_LyraEnters_NBT:
	step_right
	step_right
	step_end

Movement_LyraApproaches_NBT:
	step_right
	step_up
	step_up
	step_right
	step_end

Movement_LyraSaysGoodbye1_NBT:
	step_up
	step_up
	step_end

Movement_LyraSaysGoodbye2_NBT:
	step_right
	step_up
	step_up
	step_up
	step_right
	step_end

Movement_LyraSaysGoodbye3_NBT:
	step_left
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end

Text_GearIsImpressive:
	text "Wow, dein #COM"
	line "ist beeindruckend!"
	para "Hast du den von"
	line "Mama bekommen?"
	done







Text_WaitPlayer:
	text "Warte, <PLAYER>!"
	done







Text_WhatDoYouThinkYoureDoing:
	text "Was hast du vor?"
	done







Text_ItsDangerousToGoAlone:
	text "Es ist gefährlich,"
	line "ohne #mon das"
	cont "Haus zu verlassen!"
	para "Auf dem Weg zur"
	line "nächsten Stadt"
	para "können jederzeit"
	line "wilde #mon"
	cont "auftauchen."
	done







Text_YourMonIsAdorable:
	text "Oh! Dein #mon"
	line "ist bezaubernd!"

	para "Ich wünschte, ich"
	line "hätte auch eines."
	done







Text_TellMomIfLeaving:
	text "Hi, <PLAYER>! Du"
	line "gehst schon?"
	para "Gib deiner Mama"
	line "Bescheid, wenn du"
	cont "gehst."
	done







Text_CallMomOnGear:
	text "Ruf deine Mama mit"
	line "dem #Com"
	para "an, damit sie"
	line "weiß, was du"
	cont "machst."
	done







Text_ElmDiscoveredNewMon:
	text "Yo, <PLAYER>!"

	para "Ich habe gehört,"
	line "PROF. LIND hat"
	cont "neue #mon"
	cont "entdeckt."
	done







NewBarkTownRivalText1:
	text "…"
	para "Das ist also das"
	line "berühmte Labor von"
	cont "PROF. LIND …"
	done







NewBarkTownRivalText2:
	text "… Was starrst du"
	line "so?"
	done







Text_LyraIntro:
	text "LYRA: Oh, hallo"
	line "<PLAYER>!"
	para "Ich war vorhin bei"
	line "dir zu Hause,"
	para "aber du hast noch"
	line "geschlafen."
	para "Ich helfe PROF."
	line "LIND manchmal,"
	cont "weißt du noch?"
	para "Er startet neue"
	line "#mon-Forschung"
	para "und möchte, dass"
	line "wir beide helfen."
	para "Komm, wir schauen"
	line "mal nach!"
	done
Text_LyraGoodbye1:
	text "LYRA: <PLAYER>!"
	para "Ich habe gehört,"
	line "du hast alle Orden"
	cont "in Johto."
	para "… Du bist wirklich"
	line "etwas Besonderes,"
	cont "<PLAYER>."
	para "Dass wir beide"
	line "hier unsere Reise"
	cont "begonnen haben …"
	para "Ich helfe PROF."
	line "LIND so gut ich"
	cont "kann,"
	para "aber gegen den"
	line "Liga-Champion käme"
	cont "ich nie an."
	para "… Bevor du gehst …"
	para "Wie wäre es mit"
	line "noch einem Kampf?"
	para "Ich will sehen,"
	line "was für ein"
	cont "Trainer du"
	cont "geworden bist!"
	done
Text_LyraGoodbyeWin:
	text "Du bist so"
	line "talentiert wie ich"
	cont "erwartet habe!"
	done
Text_LyraGoodbyeLoss:
	text "Hoffentlich hast"
	line "du mich nicht"
	cont "gewähren lassen …"
	done
Text_LyraGoodbye2:
	text "… Danke, <PLAYER>."
	para "Man merkt, wie"
	line "viel Arbeit und"
	cont "Liebe du in deine"
	cont "#mon gesteckt"
	cont "hast."
	para "… Also, das ist"
	line "Abschied."
	para "Du schaffst die"
	line "#mon-Liga!"
	para "Du wirst ein"
	line "großartiger"
	cont "Champion!"
	done
NewBarkTownSignText:
	text "NEUBORKIA"
	para "Die Stadt, in der"
	line "der Wind der"
	cont "Erneuerung weht"
	done







PlayersHouseSignText:
	text "Haus von <PLAYER>"
	done
ElmsLabSignText:
	text "LIND-#mon-LABOR"
	done
LyrasHouseSignText:
	text "LYRAs Haus"
	done
