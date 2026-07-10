CeruleanCape_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_CERULEANCAPE_NOOP
	scene_const SCENE_CERULEANCAPE_MISTYS_DATE

	def_callbacks
	callback MAPCALLBACK_NEWMAP, CeruleanCapeFlyPoint

	def_warp_events
	warp_event  9,  5, BILLS_HOUSE, 1
	warp_event 38, 29, DIM_CAVE_2F, 1

	def_coord_events
	coord_event  4,  6, SCENE_CERULEANCAPE_MISTYS_DATE, CeruleanCapeDateInterruptedTrigger1
	coord_event  4,  7, SCENE_CERULEANCAPE_MISTYS_DATE, CeruleanCapeDateInterruptedTrigger2
	coord_event  9, 12, SCENE_CERULEANCAPE_MISTYS_DATE, CeruleanCapeDateInterruptedTrigger3

	def_bg_events
	bg_event  7,  5, BGEVENT_JUMPTEXT, BillsHouseSignText
	bg_event 27, 20, BGEVENT_ITEM + PEARL_STRING, EVENT_CERULEAN_CAPE_HIDDEN_PEARL_STRING
	bg_event 18,  3, BGEVENT_ITEM + BOTTLE_CAP, EVENT_CERULEAN_CAPE_HIDDEN_BOTTLE_CAP

	def_object_events
	object_event  8,  9, SPRITE_MISTY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_CERULEAN_CAPE_BOYFRIEND
	object_event  8, 10, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_CERULEAN_CAPE_BOYFRIEND
	object_event 25,  8, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSwimmermRomeo, -1
	object_event 41, 16, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, PAL_NPC_DARK_RED, OBJECTTYPE_TRAINER, 4, TrainerSwimmermMalcolm, -1
	object_event 25, 27, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSwimmermArmand, -1
	object_event 19, 12, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerBeautyBridget, -1
	object_event  1, 21, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBeautyVeronica, -1
	object_event  0, 27, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerGentlemanCamus, -1
	object_event 41, 26, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerGentlemanGeoffrey, -1
	object_event 16, 32, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerGuitaristfMorgan, -1
	object_event  7, 26, SPRITE_LADY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerLadyJessica, -1
	object_event 32, 11, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFisherLeroy, -1
	object_event -4, 8, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_25_COOLTRAINER_M_BEFORE
	object_event -2, 8, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CooltrainermKevinAfterBattleText, EVENT_ROUTE_25_COOLTRAINER_M_AFTER
	object_event 21, 19, SPRITE_SAILBOAT, SPRITEMOVEDATA_SAILBOAT_TOP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptext, CeruleanCapeSailboatText, -1
	object_event 21, 19, SPRITE_SAILBOAT, SPRITEMOVEDATA_SAILBOAT_BOTTOM, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptext, CeruleanCapeSailboatText, -1
	object_event 29, 11, SPRITE_FLOATING_BALL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, 0, OBJECTTYPE_ITEMBALL, PLAYEREVENT_ITEMBALL, SHELL_BELL, 1, EVENT_CERULEAN_CAPE_SHELL_BELL

	object_const_def
	const CERULEANCAPE_MISTY
	const CERULEANCAPE_BOYFRIEND

CeruleanCapeFlyPoint:
	setflag ENGINE_FLYPOINT_CERULEAN_CAPE
	endcallback

CeruleanCapeDateInterruptedTrigger1:
	showemote EMOTE_HEART, CERULEANCAPE_MISTY, 15
	pause 30
	showemote EMOTE_SHOCK, CERULEANCAPE_BOYFRIEND, 10
	turnobject CERULEANCAPE_MISTY, DOWN
	applyonemovement CERULEANCAPE_BOYFRIEND, big_step_down
	disappear CERULEANCAPE_BOYFRIEND
	pause 15
	playmusic MUSIC_BEAUTY_ENCOUNTER
	turnobject CERULEANCAPE_MISTY, UP
	pause 5
	applymovement CERULEANCAPE_MISTY, Route25MistyApproachesPlayerMovement1
	showtext Route25MistyDateText
	applymovement CERULEANCAPE_MISTY, Route25MistyLeavesPlayerMovement1
	sjumpfwd CeruleanCapeDateFinishScript

CeruleanCapeDateInterruptedTrigger2:
	showemote EMOTE_HEART, CERULEANCAPE_MISTY, 15
	pause 30
	showemote EMOTE_SHOCK, CERULEANCAPE_BOYFRIEND, 10
	turnobject CERULEANCAPE_MISTY, DOWN
	applymovement CERULEANCAPE_BOYFRIEND, Route25MistysDateLeavesMovement2
	disappear CERULEANCAPE_BOYFRIEND
	pause 15
	playmusic MUSIC_BEAUTY_ENCOUNTER
	turnobject CERULEANCAPE_MISTY, UP
	pause 5
	applymovement CERULEANCAPE_MISTY, Route25MistyApproachesPlayerMovement2
	showtext Route25MistyDateText
	applymovement CERULEANCAPE_MISTY, Route25MistyLeavesPlayerMovement2
CeruleanCapeDateFinishScript:
	turnobject PLAYER, LEFT
	applymovement CERULEANCAPE_MISTY, Route25MistyLeavesMovement
	disappear CERULEANCAPE_MISTY
	clearevent EVENT_TRAINERS_IN_CERULEAN_GYM
	setscene SCENE_CERULEANCAPE_NOOP
	special RestartMapMusic
	end

CeruleanCapeDateInterruptedTrigger3:
	showemote EMOTE_HEART, CERULEANCAPE_MISTY, 15
	pause 30
	turnobject CERULEANCAPE_BOYFRIEND, DOWN
	showemote EMOTE_SHOCK, CERULEANCAPE_BOYFRIEND, 10
	turnobject CERULEANCAPE_MISTY, DOWN
	applymovement CERULEANCAPE_BOYFRIEND, .RunAwayMovement1
	turnobject CERULEANCAPE_MISTY, UP
	applymovement CERULEANCAPE_BOYFRIEND, .RunAwayMovement2
	disappear CERULEANCAPE_BOYFRIEND
	pause 15
	playmusic MUSIC_BEAUTY_ENCOUNTER
	turnobject CERULEANCAPE_MISTY, DOWN
	pause 5
	applymovement CERULEANCAPE_MISTY, .ApproachMovement
	showtext Route25MistyDateText
	applymovement CERULEANCAPE_MISTY, .LeaveMovement
	disappear CERULEANCAPE_MISTY
	clearevent EVENT_TRAINERS_IN_CERULEAN_GYM
	setscene SCENE_CERULEANCAPE_NOOP
	special RestartMapMusic
	end

.RunAwayMovement1:
	big_step_right
	big_step_up
	step_end

.RunAwayMovement2:
	big_step_up
	big_step_up
	step_end

.ApproachMovement:
	step_right
	step_down
	step_down
	step_end

.LeaveMovement:
	step_up
	step_up
	step_up
	step_up
	step_end

GenericTrainerSwimmermRomeo:
	generictrainer SWIMMERM, ROMEO, EVENT_BEAT_SWIMMERM_ROMEO, .SeenText, .BeatenText

	text "Ein guter"
	line "Schwimmer macht"
	cont "mich noch keinen"
	cont "guten Trainer…"
	done

.SeenText:
	text "Bewundere meine"
	line "Fitness! Mein Sieg"
	cont "ist sicher!"
	done

.BeatenText:
	text "Ach! War das schon"
	line "alles?"
	done

TrainerSwimmermMalcolm:
	trainer SWIMMERM, MALCOLM, EVENT_BEAT_SWIMMERM_MALCOLM, .SeenText, .BeatenText, 0, .Script, TRAINERPAL_DARK_SWIMMERM

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "Du besuchst wohl"
	line "viele #mon-"

	para "ARENen, oder?"
	done

.SeenText:
	text "Meine #mon und"
	line "ich schwimmen"

	para "zusammen, aber wir"
	line "kämpfen auch!"
	done

.BeatenText:
	text "Ich wünschte, ich"
	line "wäre so stark wie"
	cont "du."
	done

GenericTrainerSwimmermArmand:
	generictrainer SWIMMERM, ARMAND, EVENT_BEAT_SWIMMERM_ARMAND, .SeenText, .BeatenText

	text "Das Mädchen am"
	line "Ufer… Ihre Musik"
	cont "ist gut, aber sie"

	para "lenkt die #mon"
	line "ab!"
	done

.SeenText:
	text "Ach. Könnte die"
	line "Gitarristin am"

	para "Ufer nicht etwas"
	line "leiser sein?"
	done

.BeatenText:
	text "Die Gitarre"
	line "brachte mich aus"
	cont "dem Takt!"
	done

GenericTrainerBeautyBridget:
	generictrainer BEAUTY, BRIDGET, EVENT_BEAT_BEAUTY_BRIDGET, .SeenText, .BeatenText

	text "Ich finde die"
	line "Aussicht hier"
	cont "wunderschön."

	para "Findest du das"
	line "nicht auch?"
	done

.SeenText:
	text "Hey! Du verdeckst"
	line "meine Aussicht!"
	done

.BeatenText:
	text "Ich wollte nur die"
	line "Aussicht genießen…"
	done

GenericTrainerBeautyVeronica:
	generictrainer BEAUTY, VERONICA, EVENT_BEAT_BEAUTY_VERONICA, .SeenText, .BeatenText

	text "Sei kalt zu mir"
	line "und ich sage dir,"
	cont "wo du hin kannst!"

	para "Vielleicht bin ich"
	line "deshalb Single."
	cont "…Haha!"
	done

.SeenText:
	text "Ich habe selten"
	line "Dates, aber wenn,"

	para "dann ist das KAP"
	line "bei AZURIA der"
	cont "perfekte Ort."
	done

.BeatenText:
	text "Kalt bleiben, dann"
	line "bleibt das"
	cont "Interesse, oder?"
	done

GenericTrainerGentlemanCamus:
	generictrainer GENTLEMAN, CAMUS, EVENT_BEAT_GENTLEMAN_CAMUS, .SeenText, .BeatenText

	text "Ich war einmal ein"
	line "talentierter"

	para "Trainer, aber"
	line "jetzt bin ich nur"
	cont "noch ein alter"

	para "Has-Been. Genieße"
	line "es, solange du"
	cont "jung bist."
	done

.SeenText:
	text "Der Anblick von"
	line "dir erinnert mich"
	cont "an meine wilde"
	cont "Jugend."
	done

.BeatenText:
	text "Was für ein wilder"
	line "Kampf!"
	done

GenericTrainerGentlemanGeoffrey:
	generictrainer GENTLEMAN, GEOFFREY, EVENT_BEAT_GENTLEMAN_GEOFFREY, .SeenText, .BeatenText

	text "Manchmal tut eine"
	line "Veränderung wie"
	cont "Erholung."

	para "Ich fühle mich so"
	line "erfrischt!"
	done

.SeenText:
	text "Ich wollte eine"
	line "Veränderung und"
	cont "wurde Trainer!"
	done

.BeatenText:
	text "Trotz meines"
	line "Alters bin ich"
	cont "noch ein Anfänger."
	done

GenericTrainerGuitaristfMorgan:
	generictrainer GUITARISTF, MORGAN, EVENT_BEAT_GUITARISTF_MORGAN, .SeenText, .BeatenText

	text "Die Felsen am KAP"
	line "machen es zum"
	cont "perfekten"
	cont "Resonanzkörper!"
	done

.SeenText:
	text "Hör dir diesen"
	line "Hall an!"
	done

.BeatenText:
	text "Was für ein"
	line "rockiger Kampf!"
	done

TrainerLadyJessica:
	trainer LADY, JESSICA, EVENT_BEAT_LADY_JESSICA, .SeenText, .BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	checkevent EVENT_SPOKE_TO_LADY_JESSICA
	iftruefwd .SpokeAgain
	writetext .AfterText1
	setevent EVENT_SPOKE_TO_LADY_JESSICA
	waitendtext

.SpokeAgain:
	writetext .AfterText2
	clearevent EVENT_SPOKE_TO_LADY_JESSICA
	waitendtext

.SeenText:
	text "Ah! Du dort! Magst"
	line "du mit mir"
	cont "kämpfen?"
	done

.BeatenText:
	text "Ach nein! Mein"
	line "Kleid ist ganz"
	cont "nass!"
	done

.AfterText1:
	text "Ich muss mir ein"
	line "stärkeres #mon"
	cont "kaufen… ……………… Und"
	cont "ein neues Kleid…"
	done

.AfterText2:
	text "Warum bist du noch"
	line "hier?"

	para "Hör auf, mich"
	line "anzustarren!"
	cont "……………… Gruselig!"
	done

GenericTrainerFisherLeroy:
	generictrainer FISHER, LEROY, EVENT_BEAT_FISHER_LEROY, .SeenText, .BeatenText

	text "Ich fange nur"
	line "Karpador…"

	para "Wenigstens sehen"
	line "sie alle anders"
	cont "aus."
	done

.SeenText:
	text "Ich fange immer"
	line "dieselben #mon…"

	para "Vielleicht bringt"
	line "ein Kampf eine"
	cont "Wende!"
	done

.BeatenText:
	text "Nichts klappt mehr"
	line "für mich…"
	done

Route25MistysDateLeavesMovement2:
	run_step_down
	run_step_down
	step_end

Route25MistyApproachesPlayerMovement1:
	step_up
Route25MistyApproachesPlayerMovement2:
	step_up
	step_up
	step_left
	step_left
	step_left
	step_end

Route25MistyLeavesPlayerMovement1:
	step_down
	step_left
	step_end

Route25MistyLeavesPlayerMovement2:
	step_up
	step_left
	step_end

Route25MistyLeavesMovement:
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

Route25MistyDateText:
	text "MISTY: Aww! Warum"
	line "musst du jetzt"

	para "auftauchen und uns"
	line "stören?"

	para "Weißt du, wie man"
	line "Menschen wie dich"
	cont "nennt?"

	para "Plage! Du hast"
	line "richtig gehört,"
	cont "Plage!"

	para "…"

	para "…Oh? Die ORDEN,"
	line "die du hast… Sind"
	cont "das ARENA-ORDEN"
	cont "aus JOHTO?"

	para "Wenn du acht hast,"
	line "musst du gut sein."

	para "O.K. Komm in die"
	line "PKMN-ARENA von"
	cont "AZURIA CITY."

	para "Ich freue mich,"
	line "gegen dich zu"
	cont "kämpfen."

	para "Ich bin MISTY, die"
	line "ARENALEITERIN von"
	cont "AZURIA CITY."
	done
BillsHouseSignText:
	text "Meereshaus Bills"
	line "Haus"
	done

CeruleanCapeSailboatText:
	text "Ein Segelboot mit"
	line "dem Namen Friend-"
	cont "Ship."
	done
