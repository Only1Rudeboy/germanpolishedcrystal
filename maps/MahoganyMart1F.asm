MahoganyMart1F_MapScriptHeader:
	def_scene_scripts
	scene_script DoNothingScript, SCENE_MAHOGANYMART1F_NOOP
	scene_script MahoganyMart1FLanceUncoversStairsScene, SCENE_MAHOGANYMART1F_LANCE_UNCOVERS_STAIRS

	def_callbacks
	callback MAPCALLBACK_TILES, MahoganyMart1FStaircaseCallback

	def_warp_events
	warp_event  3,  7, MAHOGANY_TOWN, 1
	warp_event  4,  7, MAHOGANY_TOWN, 1
	warp_event  7,  3, TEAM_ROCKET_BASE_B1F, 1

	def_coord_events

	def_bg_events
	bg_event  7,  1, BGEVENT_READ, PokemonJournalWillScript

	def_object_events
	object_event  4,  3, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, MahoganyMart1FPharmacistScript, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event  1,  6, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyMart1FBlackBeltScript, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event  4,  6, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MAHOGANY_MART_LANCE_AND_DRAGONITE
	object_event  3,  6, SPRITE_DRAGONITE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MAHOGANY_MART_LANCE_AND_DRAGONITE
	object_event  1,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, pokemart, MARTTYPE_STANDARD, MART_MAHOGANY_2, EVENT_MAHOGANY_MART_OWNERS
	object_event  6,  6, SPRITE_VETERAN_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyMart1FVeteranFScript, EVENT_MAHOGANY_MART_OWNERS

	object_const_def
	const MAHOGANYMART1F_PHARMACIST
	const MAHOGANYMART1F_BLACK_BELT
	const MAHOGANYMART1F_LANCE
	const MAHOGANYMART1F_DRAGONITE

MahoganyMart1FStaircaseCallback:
	checkevent EVENT_UNCOVERED_STAIRCASE_IN_MAHOGANY_MART
	iffalsefwd .DontShowStairs
	changeblock 6, 2, $1e
.DontShowStairs
	endcallback

MahoganyMart1FLanceUncoversStairsScene:
	end






.Script:
	turnobject MAHOGANYMART1F_BLACK_BELT, RIGHT
	pause 15
	opentext
	writetext MahoganyMart1FLanceDragoniteHyperBeamText
	pause 30
	closetext
	playsound SFX_TACKLE
	applymovement MAHOGANYMART1F_DRAGONITE, MahoganyMart1FDragoniteTackleMovement
	applymovement MAHOGANYMART1F_BLACK_BELT, MahoganyMart1FBlackBeltKnockedBackMovement
	pause 30
	disappear MAHOGANYMART1F_DRAGONITE
	pause 15
	applymovement MAHOGANYMART1F_LANCE, MahoganyMart1FLanceApproachPlayerMovement
	showtext MahoganyMart1FLanceRadioText
	follow MAHOGANYMART1F_LANCE, PLAYER
	applymovement MAHOGANYMART1F_LANCE, MahoganyMart1FLanceApproachPharmacistMovement
	applymovement MAHOGANYMART1F_PHARMACIST, MahoganyMart1FPharmacistShovedAsideMovement
	applymovement MAHOGANYMART1F_LANCE, MahoganyMart1FLanceApproachHiddenStairsMovement
	stopfollow
	opentext
	writetext MahoganyMart1FLanceStairsText
	waitbutton
	showemote EMOTE_SHOCK, MAHOGANYMART1F_PHARMACIST, 10
	playsound SFX_FAINT
	changeblock 6, 2, $1e
	refreshmap
	closetext
	setevent EVENT_UNCOVERED_STAIRCASE_IN_MAHOGANY_MART
	turnobject MAHOGANYMART1F_LANCE, LEFT
	showtext MahoganyMart1FLanceSplitUpText
	applyonemovement MAHOGANYMART1F_LANCE, slow_step_right
	playsound SFX_EXIT_BUILDING
	disappear MAHOGANYMART1F_LANCE
	setscene SCENE_MAHOGANYMART1F_NOOP
	waitsfx
	end

MahoganyMart1FPharmacistScript:
	checkevent EVENT_DECIDED_TO_HELP_LANCE
	iftrue_jumptextfaceplayer MahoganyMart1FPharmacistText_LanceEntered
	pokemart MARTTYPE_STANDARD, MART_MAHOGANY_1

MahoganyMart1FBlackBeltScript:
	checkevent EVENT_DECIDED_TO_HELP_LANCE
	iftrue_jumptextfaceplayer MahoganyMart1FBlackBeltText_LanceEntered
	jumpthistextfaceplayer

	text "Heheh! Das Expe-"
	line "riment hat wie"
	cont "am Schnürchen"
	cont "geklappt."

	para "KARPADOR sind"
	line "wertlos, aber"

	para "GARADOS bringen"
	line "das große Geld."
	done




MahoganyMart1FVeteranFScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_AGILITY_INTRO
	iftruefwd MahoganyMart1FTutorAgilityScript
	writetext MahoganyMart1FVeteranFText
	waitbutton
	setevent EVENT_LISTENED_TO_AGILITY_INTRO
MahoganyMart1FTutorAgilityScript:
	writetext Text_MahoganyMart1FTutorAgility
	waitbutton
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	writetext Text_MahoganyMart1FTutorQuestion
	yesorno
	iffalsefwd .TutorRefused
	setval AGILITY
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpthisopenedtext

	text "Na gut. Komm"
	line "wieder, wenn du"
	cont "es dir anders"
	cont "überlegst."
	done

.NoSilverLeaf
	jumpthisopenedtext

	text "Besorg mir ein"
	line "Silberblatt, wenn"
	cont "ich es lehren"
	cont "soll."
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "Deine Gegner"
	line "werden nicht"
	cont "wissen, was sie"
	cont "trifft."
	done

MahoganyMart1FDragoniteTackleMovement:
	fix_facing
	run_step_left
	run_step_right
	remove_fixed_facing
	step_end

MahoganyMart1FBlackBeltKnockedBackMovement:
	turn_head_right
	fix_facing
	run_step_left
	remove_fixed_facing
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	step_end

MahoganyMart1FPharmacistShovedAsideMovement:
	turn_head_right
	fix_facing
	run_step_left
	remove_fixed_facing
	step_end

MahoganyMart1FLanceApproachPlayerMovement:
	slow_step_left
	turn_head_down
	step_end

MahoganyMart1FLanceApproachPharmacistMovement:
	slow_step_right
	slow_step_up
	slow_step_up
	step_end

MahoganyMart1FLanceApproachHiddenStairsMovement:
	slow_step_up
	slow_step_right
	slow_step_right
	step_end

MahoganyMart1FPharmacistText_LanceEntered:
	text "Arrgh… Du hast"
	line "die Geheimtreppe"
	cont "gefunden…"
	done





MahoganyMart1FBlackBeltText_LanceEntered:
	text "Urrgh…"

	para "Seine Drachen-"
	line "#mon sind"
	cont "stark…"
	done





MahoganyMart1FLanceDragoniteHyperBeamText:
	text "SIEGFRIED:"
	line "DRAGORAN,"

	para "HYPERSTRAHL!"
	done





MahoganyMart1FLanceRadioText:
	text "Wo bleibst du,"
	line "<PLAYER>?"

	para "Das habe ich mir"
	line "gleich gedacht."

	para "Die merkwürdigen"
	line "Radiowellen"
	cont "kommen"
	cont "von hier."
	done





MahoganyMart1FLanceStairsText:
	text "Die Treppe"
	line "ist hier."
	done





MahoganyMart1FLanceSplitUpText:
	text "SIEGFRIED:"
	line "<PLAYER>,"

	para "wir sollten uns"
	line "trennen, um"
	cont "diesen"

	para "Ort zu"
	line "erforschen."
	line "Ich gehe zuerst."
	done





MahoganyMart1FVeteranFText:
	text "Unser Keller war"
	line "früher ein Ninja-"
	cont "versteck."

	para "Einige ihrer"
	line "Künste haben bis"

	para "heute überlebt."

	para "Eine Kunst"
	line "steigert ihr"
	cont "Schritttempo"
	cont "enorm."
	done

Text_MahoganyMart1FTutorAgility:
	text "Wenn du willst,"
	line "bringe ich deinem"

	para "#mon die Attacke"
	line "Agility bei."
	done

Text_MahoganyMart1FTutorQuestion:
	text "Ich brauche nur"
	line "ein Silberblatt."
	done

PokemonJournalWillScript:
	setflag ENGINE_READ_WILL_JOURNAL
	jumpthistext

	text "#mon Journal"

	para "Spezial: Top Vier"
	line "Will!"

	para "Will redet nicht"
	line "über seine"

	para "Vergangenheit,"
	line "bevor er zu den"
	cont "TOP VIER kam."

	para "Manche sagen, er"
	line "arbeitete für"
	cont "Team Rocket."

	para "Das #mon Journal"
	line "spekuliert nicht"
	cont "darüber."
	done
