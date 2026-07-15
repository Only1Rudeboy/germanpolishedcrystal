LancesRoom_MapScriptHeader:
	def_scene_scripts
	scene_script LancesRoomLockDoorScene, SCENE_LANCESROOM_LOCK_DOOR
	scene_const SCENE_LANCESROOM_APPROACH_LANCE

	def_callbacks
	callback MAPCALLBACK_TILES, LancesRoomDoorCallback

	def_warp_events
	warp_event  6, 23, KARENS_ROOM, 3
	warp_event  7, 23, KARENS_ROOM, 4
	warp_event  6,  1, HALL_OF_FAME, 1
	warp_event  7,  1, HALL_OF_FAME, 2

	def_coord_events
	coord_event  6,  5, SCENE_LANCESROOM_APPROACH_LANCE, ApproachLanceFromLeftTrigger
	coord_event  7,  5, SCENE_LANCESROOM_APPROACH_LANCE, ApproachLanceFromRightTrigger

	def_bg_events

	def_object_events
	object_event  7,  3, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, LanceScript, -1
	object_event  6,  7, SPRITE_MARY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LANCES_ROOM_OAK_AND_MARY
	object_event  6,  7, SPRITE_OAK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LANCES_ROOM_OAK_AND_MARY

	object_const_def
	const LANCESROOM_LANCE
	const LANCESROOM_MARY
	const LANCESROOM_OAK

LancesRoomLockDoorScene:
	sdefer .Script
	end

.Script:
	applymovement PLAYER, WalkIntoEliteFourRoomMovement
	reanchormap
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 6, 22, $26
	refreshmap
	closetext
	setscene SCENE_LANCESROOM_APPROACH_LANCE
	setevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	end

WalkIntoEliteFourRoomMovement:
	step_up
	step_up
	step_up
	step_up
	step_end

LancesRoomDoorCallback:
	checkevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	iffalsefwd .LanceEntranceOpen
	changeblock 6, 22, $26
.LanceEntranceOpen:
	checkevent EVENT_LANCES_ROOM_EXIT_OPEN
	iffalsefwd .LanceExitClosed
	changeblock 6, 0, $13
.LanceExitClosed:
	endcallback

ApproachLanceFromLeftTrigger:
	special Special_FadeOutMusic
	applymovement PLAYER, ApproachLanceFromLeftMovement
	sjumpfwd LanceScript

ApproachLanceFromRightTrigger:
	special Special_FadeOutMusic
	applymovement PLAYER, ApproachLanceFromRightMovement
LanceScript:
	turnobject LANCESROOM_LANCE, LEFT
	readvar VAR_BADGES
	ifequalfwd 16, .Rematch
	showtext .SeenText
	winlosstext .BeatenText, 0
	setlasttalked LANCESROOM_LANCE
	loadtrainer CHAMPION, LANCE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	showtext .AfterText
	sjumpfwd .EndBattle

.Rematch:
	showtext .SeenRematchText
	winlosstext .BeatenText, 0
	setlasttalked LANCESROOM_LANCE
	loadtrainer CHAMPION, LANCE2
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	showtext .AfterRematchText
.EndBattle:
	setevent EVENT_BEAT_CHAMPION_LANCE
	playsound SFX_ENTER_DOOR
	changeblock 6, 0, $13
	refreshmap
	closetext
	setevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	musicfadeout MUSIC_BEAUTY_ENCOUNTER, $10
	pause 30
	showemote EMOTE_SHOCK, LANCESROOM_LANCE, 15
	turnobject LANCESROOM_LANCE, DOWN
	pause 10
	turnobject PLAYER, DOWN
	appear LANCESROOM_MARY
	applymovement LANCESROOM_MARY, .RushInMovement
	showtext .MaryText1
	appear LANCESROOM_OAK
	applymovement LANCESROOM_OAK, .WalkInMovement
	follow LANCESROOM_MARY, LANCESROOM_OAK
	applymovement LANCESROOM_MARY, .StepAsideMovement
	stopfollow
	turnobject LANCESROOM_OAK, UP
	turnobject LANCESROOM_LANCE, LEFT
	readvar VAR_BADGES
	ifnotequal 16, .DefaultOakSpeech
	checkevent EVENT_OPENED_MT_SILVER
	iffalsefwd .DefaultOakSpeech
	showtext .OakRematchSpeechText
	sjumpfwd .OakSpeechDone
.DefaultOakSpeech
	showtext .OakSpeechText
.OakSpeechDone
	applymovement LANCESROOM_MARY, .ApproachPlayerMovement
	turnobject PLAYER, LEFT
	showtext .MaryText2
	applymovement LANCESROOM_LANCE, .WalkTowardExitMovement
	turnobject PLAYER, UP
	showtext .LanceLeavingText
	follow LANCESROOM_LANCE, PLAYER
	turnobject LANCESROOM_MARY, UP
	turnobject LANCESROOM_OAK, UP
	applyonemovement LANCESROOM_LANCE, step_up
	stopfollow
	playsound SFX_EXIT_BUILDING
	disappear LANCESROOM_LANCE
	applyonemovement PLAYER, step_up
	playsound SFX_EXIT_BUILDING
	disappear PLAYER
	applymovement LANCESROOM_MARY, .TryToFollowMovement
	showemote EMOTE_SHOCK, LANCESROOM_MARY, 15
	opentext
	writetext .MaryText3
	pause 30
	closetext
	applymovement LANCESROOM_MARY, .RunBackAndForthMovement
	special FadeOutPalettes
	pause 15
	warpfacing UP, HALL_OF_FAME, 4, 13
	end

.SeenText:
	text "SIEGFRIED: Ich"
	line "habe dich"
	cont "erwartet."
	para "<PLAYER>!"
	para "Ich wusste, dass"
	line "du mir aufgrund"
	cont "deiner Fähigkeiten"
	cont "eines Tages"
	cont "gegenüberstehen"
	cont "würdest."
	para "Worte sind hier"
	line "fehl am Platz."
	para "Ein Kampf zeigt,"
	line "wer der Stärkere"
	cont "von uns ist."
	para "Ich, der beste"
	line "aller Trainer und"
	cont "CHAMP der"
	cont "#mon-Liga…"
	para "Ich, SIEGFRIED der"
	line "Drachenmeister,"
	cont "nehme deine"
	cont "Herausforderung"
	cont "an!"
	done
.BeatenText:
	text "Das ist ein"
	line "seltsames Gefühl."
	para "Ich bin nicht"
	line "wütend, dass ich"
	cont "verloren habe. Ich"
	cont "bin glücklich."
	para "Glücklich, dass"
	line "ich den Aufstieg"
	cont "eines neuen CHAMPs"
	cont "miterleben durfte."
	done
.AfterText:
	text "…Woa."
	para "Du bist sehr stark"
	line "geworden, <PLAYER>."
	para "Deine #mon"
	line "haben deine starke"
	cont "und aufrechte"
	cont "Persönlichkeit"
	cont "akzeptiert."
	para "Auch du wirst"
	line "zusammen mit"
	cont "deinen #mon"
	cont "stärker werden."
	done
.SeenRematchText:
	text "SIEGFRIED: Worte"
	line "sind jetzt"
	cont "überflüssig."
	para "Wir kämpfen, um zu"
	line "sehen, wer der"
	cont "Stärkere ist."
	para "Ich, SIEGFRIED der"
	line "Drachenmeister,"
	cont "nehme deine"
	cont "Herausforderung"
	cont "an!"
	done
.AfterRematchText:
	text "Genau wie ich es"
	line "erwartet habe."
	para "Du und deine"
	line "#mon seid ein"
	cont "tolles Team."
	para "Als Trainer wirst"
	line "du mit deinen"
	cont "#mon noch"
	cont "stärker werden."
	done
.MaryText1:
	text "MARGIT: Ach nein!"
	line "Alles ist vorbei!"
	para "PROF. EICH, wenn"
	line "du nicht so"
	cont "langsam wärest…"
	done
.OakSpeechText:
	text "PROF. EICH: Ah,"
	line "<PLAYER>!"
	para "Es ist schon lange"
	line "her."
	para "Du siehst"
	line "erhabener aus."
	para "Dein Sieg in der"
	line "LIGA ist einfach"
	cont "fantastisch!"
	para "Deine Hingabe, das"
	line "Vertrauen und die"
	cont "Liebe zu deinen"
	cont "#mon haben dir"
	cont "dies ermöglicht."
	para "Auch deine #mon"
	line "waren super."
	para "Ihr Glaube an dich"
	line "hat sie all das"
	cont "durchstehen"
	cont "lassen."
	para "Glückwunsch,"
	line "<PLAYER>!"
	done
.OakRematchSpeechText:
	text "PROF. EICH: Ah,"
	line "<PLAYER>!"
	para "Dein Rückkampf in"
	line "der LIGA war"
	cont "einfach"
	cont "fantastisch!"
	para "Mir ist klar, dass"
	line "du #mon tief"
	cont "verstehst, ihnen"
	cont "vertraust und sie"
	cont "liebst."
	para "Die herausragenden"
	line "Fähigkeiten deines"
	cont "Teams zeigen das"
	cont "deutlich."
	para "Vielleicht bist du"
	line "bereit für den"
	cont "SILBERBERG - dort"
	cont "warten mächtige"
	cont "#mon."
	para "Aber sei"
	line "vorsichtig."
	cont "Glückwunsch"
	cont "nochmals!"
	done
.MaryText2:
	text "MARGIT: Wir sind"
	line "zu spät…"
	para "Aber was für ein"
	line "unglaublicher"
	cont "Kampf!"
	done
.LanceLeavingText:
	text "SIEGFRIED: Komm"
	line "mit. Die"
	cont "RUHMESHALLE"
	cont "wartet."
	done
.MaryText3:
	text "MARGIT: Wartet!"
	line "Ich will auch mit!"
	done
.RushInMovement:
	run_step_up
	run_step_up
	run_step_up
	turn_head_down
	step_end

.WalkInMovement:
	step_up
	step_up
	step_end

.StepAsideMovement:
	step_left
	turn_head_right
	step_end

.ApproachPlayerMovement:
	run_step_up
	turn_head_right
	step_end

.WalkTowardExitMovement:
	step_up
	step_left
	turn_head_down
	step_end

.TryToFollowMovement:
	step_up
	step_right
	turn_head_up
	step_end

.RunBackAndForthMovement:
	run_step_right
	run_step_right
	run_step_left
	run_step_left
	run_step_left
	run_step_right
	run_step_right
	run_step_right
	run_step_left
	run_step_left
	turn_head_up
	step_end

ApproachLanceFromLeftMovement:
	step_up
	step_up
	turn_head_right
	step_end

ApproachLanceFromRightMovement:
	step_up
	step_left
	step_up
	turn_head_right
	step_end
