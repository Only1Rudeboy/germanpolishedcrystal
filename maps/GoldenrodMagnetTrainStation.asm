GoldenrodMagnetTrainStation_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_GOLDENRODMAGNETTRAINSTATION_ARRIVE_FROM_SAFFRON

	def_callbacks

	def_warp_events
	warp_event  8, 17, GOLDENROD_CITY, 5
	warp_event  9, 17, GOLDENROD_CITY, 5
	warp_event  6,  5, SAFFRON_TRAIN_STATION, 4
	warp_event 11,  5, SAFFRON_TRAIN_STATION, 3

	def_coord_events
	coord_event 11,  6, SCENE_GOLDENRODMAGNETTRAINSTATION_ARRIVE_FROM_SAFFRON, Script_ArriveFromSaffron

	def_bg_events

	def_object_events
	object_event  9,  9, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodMagnetTrainStationOfficerScript, -1
	object_event 11, 14, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 2, 2, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodMagnetTrainStationGentlemanText, EVENT_GOLDENROD_TRAIN_STATION_GENTLEMAN
	object_event  6, 12, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodMagnetTrainStationCooltrainerfScript, -1

	object_const_def
	const GOLDENRODMAGNETTRAINSTATION_OFFICER

GoldenrodMagnetTrainStationOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .MagnetTrainToSaffron
	jumpthisopenedtext

	; GSC-DE Dump
	text "Der Zug ist nicht"
	line "gekommen…"

	para "Ich hab's! Ich"
	line "werde die Passa-"
	cont "giere auf dem"
	cont "Rücken tragen!"

	para "Das wird nicht"
	line "funktionieren."
	done

.MagnetTrainToSaffron:
	writetext GoldenrodMagnetTrainStationOfficerAreYouComingAboardText
	yesorno
	iffalse_jumpopenedtext GoldenrodMagnetTrainStationOfficerHopeToSeeYouAgainText
	checkkeyitem PASS
	iffalse_jumpopenedtext GoldenrodMagnetTrainStationOfficerYouDontHaveARailPassText
	writetext GoldenrodMagnetTrainStationOfficerRightThisWayText
	waitbutton
	closetext
	applymovement GOLDENRODMAGNETTRAINSTATION_OFFICER, GoldenrodMagnetTrainStationOfficerApproachTrainDoorMovement
	applymovement PLAYER, GoldenrodMagnetTrainStationPlayerApproachAndEnterTrainMovement
	setval $0
	special Special_MagnetTrain
	warpcheck
	newloadmap MAPSETUP_TRAIN
	applyonemovement PLAYER, turn_head_down
	wait 2
	end

Script_ArriveFromSaffron:
	applymovement GOLDENRODMAGNETTRAINSTATION_OFFICER, GoldenrodMagnetTrainStationOfficerApproachTrainDoorMovement
	applymovement PLAYER, GoldenrodMagnetTrainStationPlayerLeaveTrainAndEnterStationMovement
	applymovement GOLDENRODMAGNETTRAINSTATION_OFFICER, GoldenrodMagnetTrainStationOfficerReturnToBoardingGateMovement
	showtext GoldenrodMagnetTrainStationOfficerArrivedInGoldenrodText
	turnobject PLAYER, DOWN
	end

GoldenrodMagnetTrainStationCooltrainerfScript:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .PowerRestored
	jumpthistextfaceplayer

	; PC-only flavor
	text "Der MAGNETZUG:"
	line "zoooom, byun!"
	cont "Shuuu!"

	para "Zumindest wenn er"
	line "fährt…"
	done

.PowerRestored
	jumpthistextfaceplayer

	; PC-only flavor
	text "Der MAGNETZUG:"
	line "zoooom, byun!"
	cont "Shuuu!"

	para "Total cool!"
	done

GoldenrodMagnetTrainStationOfficerApproachTrainDoorMovement:
	step_up
	step_up
	step_right
	turn_head_left
	step_end

GoldenrodMagnetTrainStationOfficerReturnToBoardingGateMovement:
	step_left
	step_down
	step_down
	step_end

GoldenrodMagnetTrainStationPlayerApproachAndEnterTrainMovement:
	step_up
	step_up
	step_up
	step_left
	step_left
	step_left
	step_up
	step_up
	step_end

GoldenrodMagnetTrainStationPlayerLeaveTrainAndEnterStationMovement:
	step_left
	step_left
	step_down
	step_down
	step_down
	step_down
	turn_head_up
	step_end

GoldenrodMagnetTrainStationOfficerAreYouComingAboardText:
	; GSC-DE Dump
	text "Wir werden in Kür-"
	line "ze nach SAFFRONIA"
	cont "CITY abreisen."

	para "Kommst du mit?"
	done

GoldenrodMagnetTrainStationOfficerRightThisWayText:
	; GSC-DE Dump
	text "Darf ich deinen"
	line "FAHRSCHEIN sehen?"

	para "O.K. Bitte hier"
	line "entlang."
	done

GoldenrodMagnetTrainStationOfficerYouDontHaveARailPassText:
	; GSC-DE Dump
	text "Verzeihung, aber"
	line "du hast keinen"
	cont "FAHRSCHEIN."
	done

GoldenrodMagnetTrainStationOfficerHopeToSeeYouAgainText:
	; GSC-DE Dump
	text "Besuche uns"
	line "wieder!"
	done

GoldenrodMagnetTrainStationOfficerArrivedInGoldenrodText:
	; GSC-DE Dump
	text "Wir sind in DUKA-"
	line "TIA CITY angekom-"
	cont "men."

	para "Beehre uns bald"
	line "wieder!"
	done

GoldenrodMagnetTrainStationGentlemanText:
	; GSC-DE Dump
	text "Ich bin der PRÄSI-"
	line "DENT."

	para "Mein Traum war es,"
	line "einen Zug zu bau-"
	cont "en, der schneller"

	para "ist als jedes"
	line "#MON."

	para "Dadurch würden"
	line "JOHTO und KANTO"
	cont "näher rücken."
	done
