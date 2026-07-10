TeamRocketBaseB3F_MapScriptHeader:
	def_scene_scripts
	scene_script TeamRocketBaseB3FLanceGetsPasswordScene, SCENE_TEAMROCKETBASEB3F_LANCE_GETS_PASSWORD
	scene_const SCENE_TEAMROCKETBASEB3F_RIVAL_ENCOUNTER
	scene_const SCENE_TEAMROCKETBASEB3F_ROCKET_BOSS
	scene_const SCENE_TEAMROCKETBASEB3F_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, TeamRocketBaseB3FCheckGiovanniDoor

	def_warp_events
	warp_event  3,  2, TEAM_ROCKET_BASE_B2F, 2
	warp_event 27,  2, TEAM_ROCKET_BASE_B2F, 3
	warp_event  3,  6, TEAM_ROCKET_BASE_B2F, 4
	warp_event 27, 14, TEAM_ROCKET_BASE_B2F, 5

	def_coord_events
	coord_event 10,  8, SCENE_TEAMROCKETBASEB3F_ROCKET_BOSS, RocketBaseBossLeft
	coord_event 11,  8, SCENE_TEAMROCKETBASEB3F_ROCKET_BOSS, RocketBaseBossRight
	coord_event  8, 10, SCENE_TEAMROCKETBASEB3F_RIVAL_ENCOUNTER, RocketBaseRival

	def_bg_events
	bg_event 10,  9, BGEVENT_IFNOTSET, BossDoor
	bg_event 11,  9, BGEVENT_IFNOTSET, BossDoor
	bg_event 10,  1, BGEVENT_JUMPSTD, teamrocketoath
	bg_event 11,  1, BGEVENT_JUMPSTD, teamrocketoath
	bg_event 12,  1, BGEVENT_JUMPSTD, teamrocketoath
	bg_event 13,  1, BGEVENT_JUMPSTD, teamrocketoath
	bg_event  4, 13, BGEVENT_JUMPSTD, teamrocketoath
	bg_event  5, 13, BGEVENT_JUMPSTD, teamrocketoath
	bg_event  6, 13, BGEVENT_JUMPSTD, teamrocketoath
	bg_event  7, 13, BGEVENT_JUMPSTD, teamrocketoath

	def_object_events
	object_event 25, 14, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, LanceGetPasswordScript, EVENT_TEAM_ROCKET_BASE_B3F_LANCE_PASSWORDS
	object_event  8,  3, SPRITE_PETREL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B3F_PETREL
	object_event  7,  2, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, MURKROW, -1, PAL_MON_BLUE, OBJECTTYPE_SCRIPT, NO_FORM, RocketBaseMurkrow, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event  4,  5, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_TEAM_ROCKET_BASE
	object_event 21,  7, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 0, SlowpokeTailGrunt, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event  5, 14, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 3, RaticateTailGrunt, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event 23, 11, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 0, GenericTrainerRocketScientistRoss, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event 11, 15, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerRocketScientistMitch, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event 24, 14, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, TeamRocketBaseB3FRocketText, EVENT_TEAM_ROCKET_BASE_POPULATION
	itemball_event  1, 12, PROTEIN, 1, EVENT_TEAM_ROCKET_BASE_B3F_PROTEIN
	itemball_event  3, 12, X_SP_DEF, 1, EVENT_TEAM_ROCKET_BASE_B3F_X_SP_DEF
	itemball_event 28,  9, FULL_HEAL, 1, EVENT_TEAM_ROCKET_BASE_B3F_FULL_HEAL
	itemball_event 17,  2, ICE_HEAL, 1, EVENT_TEAM_ROCKET_BASE_B3F_ICE_HEAL
	itemball_event 14, 10, ULTRA_BALL, 1, EVENT_TEAM_ROCKET_BASE_B3F_ULTRA_BALL

	object_const_def
	const TEAMROCKETBASEB3F_LANCE
	const TEAMROCKETBASEB3F_PETREL
	const TEAMROCKETBASEB3F_MURKROW
	const TEAMROCKETBASEB3F_RIVAL

TeamRocketBaseB3FLanceGetsPasswordScene:
	end



TeamRocketBaseB3FCheckGiovanniDoor:
	checkevent EVENT_OPENED_DOOR_TO_GIOVANNIS_OFFICE
	iftruefwd .OpenSesame
	endcallback

.OpenSesame:
	changeblock 10, 8, $0d
	endcallback

LanceGetPasswordScript:
	turnobject PLAYER, LEFT
	pause 5
	turnobject TEAMROCKETBASEB3F_MURKROW, RIGHT
	pause 20
	applyonemovement TEAMROCKETBASEB3F_LANCE, step_right
	showtext LanceGetPasswordText
	applymovement TEAMROCKETBASEB3F_LANCE, RocketBaseLanceLeavesMovement
	disappear TEAMROCKETBASEB3F_LANCE
	setscene SCENE_TEAMROCKETBASEB3F_RIVAL_ENCOUNTER
	end

RocketBaseRival:
	turnobject PLAYER, LEFT
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	appear TEAMROCKETBASEB3F_RIVAL
	applymovement TEAMROCKETBASEB3F_RIVAL, RocketBaseRivalEnterMovement
	turnobject PLAYER, LEFT
	playmusic MUSIC_RIVAL_ENCOUNTER
	showtext RocketBaseRivalText
	playsound SFX_TACKLE
	applymovement PLAYER, RocketBaseRivalShovesPlayerMovement
	applymovement TEAMROCKETBASEB3F_RIVAL, RocketBaseRivalLeaveMovement
	disappear TEAMROCKETBASEB3F_RIVAL
	setscene SCENE_TEAMROCKETBASEB3F_ROCKET_BOSS
	special RestartMapMusic
	end

RocketBaseBossLeft:
	applymovement PLAYER, RocketBasePlayerApproachesBossLeftMovement
	sjumpfwd RocketBaseBoss

RocketBaseBossRight:
	applymovement PLAYER, RocketBasePlayerApproachesBossRightMovement
RocketBaseBoss:
	pause 30
	showemote EMOTE_SHOCK, TEAMROCKETBASEB3F_PETREL, 15
	special SaveMusic
	playmusic MUSIC_ROCKET_ENCOUNTER
	turnobject TEAMROCKETBASEB3F_PETREL, DOWN
	showtext ExecutiveM4BeforeText
	applyonemovement TEAMROCKETBASEB3F_PETREL, step_down
	winlosstext ExecutiveM4BeatenText, 0
	setlasttalked TEAMROCKETBASEB3F_PETREL
	loadtrainer PETREL, PETREL2
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_PETREL_2
	showtext ExecutiveM4AfterText
	applymovement TEAMROCKETBASEB3F_PETREL, RocketBaseBossHitsTableMovement
	playsound SFX_TACKLE
	applymovement TEAMROCKETBASEB3F_PETREL, RocketBaseBossLeavesMovement
	disappear TEAMROCKETBASEB3F_PETREL
	setscene SCENE_TEAMROCKETBASEB3F_NOOP
	end

RocketBaseMurkrow:
	showtext RocketBaseMurkrowText
	setevent EVENT_LEARNED_HAIL_GIOVANNI
	end

SlowpokeTailGrunt:
	trainer GRUNTF, 5, EVENT_BEAT_ROCKET_GRUNTF_5, GruntF5SeenText, GruntF5BeatenText, 0, GruntF5Script

GruntF5Script:
	endifjustbattled
	showtext GruntF5AfterBattleText
	setevent EVENT_LEARNED_SLOWPOKETAIL
	end

RaticateTailGrunt:
	trainer GRUNTM, 28, EVENT_BEAT_ROCKET_GRUNTM_28, GruntM28SeenText, GruntM28BeatenText, 0, GruntM28Script

GruntM28Script:
	endifjustbattled
	showtext GruntM28AfterBattleText
	setevent EVENT_LEARNED_RATICATE_TAIL
	end

GenericTrainerRocketScientistRoss:
	generictrainer ROCKET_SCIENTIST, ROSS, EVENT_BEAT_ROCKET_SCIENTIST_ROSS, RocketScientistRossSeenText, RocketScientistRossBeatenText

	text "Ein Radiosignal,"
	line "das #mon um den"
	cont "Verstand bringt…"

	para "Mein Experiment"
	line "war ein voller"
	cont "Erfolg."

	para "Meine Beförderung"
	line "ist gewiss. Dieser"

	para "Verlust bedeutet"
	line "nichts."
	done
GenericTrainerRocketScientistMitch:
	generictrainer ROCKET_SCIENTIST, MITCH, EVENT_BEAT_ROCKET_SCIENTIST_MITCH, RocketScientistMitchSeenText, RocketScientistMitchBeatenText

	text "Wenn wir das"
	line "Radiosignal"
	cont "verstärken, könnte"

	para "man es im ganzen"
	line "Land empfangen…"

	para "Allein der Gedanke"
	line "entzückt mich!"
	done
BossDoor:
	dw EVENT_OPENED_DOOR_TO_GIOVANNIS_OFFICE
	opentext
	checkevent EVENT_LEARNED_SLOWPOKETAIL
	iffalsefwd .NeedsPassword
	checkevent EVENT_LEARNED_RATICATE_TAIL
	iffalsefwd .NeedsPassword
	sjumpfwd .OpenSesame

.NeedsPassword:
	jumpthisopenedtext

	text "Die Tür ist"
	line "verschlossen…"

	para "Zum Oeffnen werden"
	line "zwei Passwörter"
	cont "benötigt."
	done

.OpenSesame:
	writetext TeamRocketBaseB3FLockedDoorOpenSesameText
	waitbutton
	playsound SFX_ENTER_DOOR
	changeblock 10, 8, $0d
	refreshmap
	closetext
	setevent EVENT_OPENED_DOOR_TO_GIOVANNIS_OFFICE
	waitsfx
	end

RocketBaseLanceLeavesMovement:
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

RocketBasePlayerApproachesBossLeftMovement:
	step_up
	step_up
	step_up
	step_left
	step_left
	turn_head_up
	step_end

RocketBasePlayerApproachesBossRightMovement:
	step_up
	step_up
	step_left
	step_up
	step_left
	step_left
	turn_head_up
	step_end

RocketBaseBossHitsTableMovement:
	run_step_right
	run_step_right
	step_end

RocketBaseBossLeavesMovement:
	fix_facing
	fast_jump_step_left
	remove_fixed_facing
	step_sleep_8
	step_sleep_8
	slow_step_right
	run_step_down
	run_step_down
	run_step_down
	run_step_right
	run_step_down
	run_step_down
	run_step_down
	run_step_left
	run_step_left
	run_step_left
	run_step_left
	run_step_left
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	run_step_left
	run_step_left
	step_end

RocketBaseRivalEnterMovement:
	step_down
	step_down
	step_down
	step_down
	step_down
	step_right
	step_right
	step_right
	step_end

RocketBaseRivalLeaveMovement:
	step_left
	step_left
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end

RocketBaseRivalShovesPlayerMovement:
	fix_facing
	run_step_right
	remove_fixed_facing
	step_end

LanceGetPasswordText:
	text "SIEGFRIED: Man"
	line "benötigt zwei"

	para "Passwörter, um"
	line "Zutritt zum"
	cont "Quartier des"
	cont "Bosses zu"
	cont "bekommen."

	para "Nur ein paar"
	line "Mitglieder von"
	cont "TEAM ROCKET kennen"
	cont "sie."

	para "Diese Auskunft hat"
	line "mir dieser ROCKET"
	cont "gegeben."

	para "<PLAYER>, los!"
	line "Holen wir uns die"
	cont "Passwörter."
	done


TeamRocketBaseB3FRocketText:
	text "Urrggh… Der Typ"
	line "mit dem Umhang ist"
	cont "furchtbar stark…"
	done


RocketBaseRivalText:
	text "…"

	para "Habe ich dir nicht"
	line "gesagt, dass ich"

	para "TEAM ROCKET"
	line "zerschlage?"

	para "…Sag mir, wer war"
	line "der Typ mit dem"

	para "Umhang, der die"
	line "Drachen-#mon"
	cont "einsetzte?"

	para "Meine #mon"
	line "waren keine Gegner"
	cont "für ihn."

	para "Die Niederlage"
	line "macht mir nichts"

	para "aus. Mit stärkeren"
	line "#mon kann ich"
	cont "ihn besiegen."

	para "Was mich wurmt"
	line "ist, was er zu mir"
	cont "gesagt hat…"

	para "Er sagte, dass ich"
	line "meine #mon"

	para "nicht ausreichend"
	line "liebe und ihnen"
	cont "nicht vertraue."

	para "Ich bin wütend,"
	line "dass ich gegen so"
	cont "ein Großmaul"
	cont "verloren habe."

	para "…Humpf! Für Typen"
	line "wie dich habe ich"
	cont "keine Zeit!"
	done


ExecutiveM4BeforeText:
	text "Was? Wer bist du?"
	line "Dies ist das Büro"

	para "unseres Anführers"
	line "GIOVANNI."

	para "Er trainiert, seit"
	line "das TEAM ROCKET"

	para "vor drei Jahren"
	line "zerschlagen wurde."

	para "Wir sind sicher,"
	line "dass er eines"

	para "Tages zurückkehren"
	line "wird, um das"
	cont "Kommando wieder zu"
	cont "übernehmen."

	para "Darum halten wir"
	line "Wache."

	para "Ich lasse nicht"
	line "zu, dass es hier"
	cont "laut wird!"
	done


ExecutiveM4BeatenText:
	text "Ich… ich konnte"
	line "nichts machen…"

	para "Bitte vergib mir,"
	line "GIOVANNI…"
	done


ExecutiveM4AfterText:
	text "Das darf mich"
	line "nicht belasten."

	para "Ich muss es den"
	line "anderen sagen…"
	done


RocketBaseMurkrowText:
	text "KRAMURX: Das"
	line "Passwort lautet…"

	para "PREISET GIOVANNI."
	done


GruntF5SeenText:
	text "Ob ich das"
	line "Passwort weiß?"

	para "Vielleicht."

	para "Schwächlinge"
	line "werden es nie"
	cont "erfahren!"
	done


GruntF5BeatenText:
	text "O.K. Genug. Ich"
	line "verrate es dir."
	done


GruntF5AfterBattleText:
	text "Das Passwort zum"
	line "Büro vom Boss"
	cont "lautet"

	para "FLEGMONRUTE."

	para "Es ist aber"
	line "nutzlos, denn du"
	cont "benötigst zwei"
	cont "Passwörter."
	done


GruntM28SeenText:
	text "Hiuck-hiuck-hiuck!"

	para "Du forderst mich"
	line "zu einem Kampf"

	para "heraus? Pah! Du"
	line "bist dumm, aber du"
	cont "hast Mumm!"

	para "Das mag ich!"

	para "Falls du mich"
	line "besiegst, verrate"

	para "ich dir ein"
	line "Passwort für das"
	cont "Büro vom Boss!"
	done


GruntM28BeatenText:
	text "Hiuck-hiuck-hiuck!"
	line "Du bist gut!"
	done


GruntM28AfterBattleText:
	text "Hiuck-hiuck-hiuck!"

	para "Das Passwort für"
	line "das Büro vom Boss…"

	para "Uh… ich glaube, es"
	line "lautet"
	cont "RATTIKARLRUTE."
	done


RocketScientistRossSeenText:
	text "Früher arbeitete"
	line "ich für SILPH,"

	para "aber jetzt leite"
	line "ich TEAM ROCKETs"
	cont "Forschungen."

	para "Ein Kind wie du,"
	line "das sich überall"
	cont "einmischt, muss"
	cont "bestraft werden."
	done
RocketScientistRossBeatenText:
	text "Nur wegen eines"
	line "kleinen taktischen"
	cont "Fehlers…"
	done
RocketScientistMitchSeenText:
	text "Es ist mir egal,"
	line "dass #mon bei"
	cont "unserem Experiment"
	cont "Schmerzen zugefügt"
	cont "werden."
	done
RocketScientistMitchBeatenText:
	text "Meine Stärke ist"
	line "das Denken, nicht"
	cont "das Kämpfen."
	done
TeamRocketBaseB3FLockedDoorOpenSesameText:
	text "Die Tür ist"
	line "verschlossen…"

	para "<PLAYER> gibt"
	line "beide Passwörter"
	cont "ein."

	para "Die Tür wird"
	line "entriegelt!"
	done


