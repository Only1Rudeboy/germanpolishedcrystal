PowerPlant_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_POWERPLANT_NOOP
	scene_const SCENE_POWERPLANT_GUARD_GETS_PHONE_CALL

	def_callbacks
	callback MAPCALLBACK_TILES, PowerPlantTurbinesCallback

	def_warp_events
	warp_event  2, 17, ROUTE_10_NORTH, 2
	warp_event  3, 17, ROUTE_10_NORTH, 2

	def_coord_events
	coord_event  5, 12, SCENE_POWERPLANT_GUARD_GETS_PHONE_CALL, PowerPlantGuardPhoneScript

	def_bg_events
	bg_event  0,  1, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  1,  1, BGEVENT_JUMPSTD, difficultbookshelf

	def_object_events
	object_event  4, 14, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PowerPlantOfficerScript, -1
	object_event  2,  9, SPRITE_GYM_GUY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PowerPlantGymGuide1Script, -1
	object_event  6, 11, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PowerPlantGymGuide2Script, -1
	object_event  9,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PowerPlantOfficer2Script, -1
	object_event  7,  2, SPRITE_GYM_GUY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PowerPlantGymGuide4Script, -1
	object_event 14, 10, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PowerPlantManager, -1
	object_event  5,  5, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, PowerPlantForestText, -1

	object_const_def
	const POWERPLANT_OFFICER1
	const POWERPLANT_GYM_GUY1
	const POWERPLANT_GYM_GUY2

PowerPlantTurbinesCallback:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iffalsefwd .Done
	changeblock 12, 6, $12
	changeblock 14, 6, $47
	changeblock 12, 12, $16
	changeblock 12, 14, $16
.Done:
	endcallback

PowerPlantGuardPhoneScript:
	playsound SFX_CALL
	showemote EMOTE_SHOCK, POWERPLANT_OFFICER1, 15
	waitsfx
	pause 30
	applymovement POWERPLANT_OFFICER1, PowerPlantOfficer1ApproachGymGuide2Movement
	turnobject POWERPLANT_GYM_GUY1, DOWN
	turnobject POWERPLANT_GYM_GUY2, DOWN
	showtext PowerPlantOfficer1CeruleanShadyCharacterText
	turnobject POWERPLANT_OFFICER1, LEFT
	turnobject PLAYER, RIGHT
	showtext PowerPlantOfficer1CouldIAskForYourCooperationText
	turnobject PLAYER, DOWN
	applymovement POWERPLANT_OFFICER1, PowerPlantOfficer1ReturnToPostMovement
	setscene SCENE_POWERPLANT_NOOP
	end






PowerPlantOfficerScript:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer PowerPlantOfficer1HaveToBeefUpSecurityText
	checkevent EVENT_MET_MANAGER_AT_POWER_PLANT
	iftrue_jumptextfaceplayer PowerPlantOfficer1CouldIAskForYourCooperationText
	jumpthistextfaceplayer

	text "Ein Dieb brach ins"
	line "Kraftwerk ein…"

	para "Wohin soll das nur"
	line "noch führen?"
	done





PowerPlantGymGuide1Script:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer PowerPlantGymGuide1GeneratorUpAndRunningText
	jumpthistextfaceplayer

	text "Jemand hat ein"
	line "wichtiges Teil für"
	cont "den Generator"
	cont "gestohlen."

	para "Ohne dieses Teil"
	line "ist der neue"
	cont "Generator nutzlos!"
	done





PowerPlantGymGuide2Script:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer PowerPlantGymGuide2GeneratorIsRunningAgainText
	jumpthistextfaceplayer

	text "Dieses Kraftwerk"
	line "war früher außer"
	cont "Betrieb."

	para "Wir haben es"
	line "wieder in Gang"

	para "gebracht, um den"
	line "MAGNETZUG mit"
	cont "Strom zu"
	cont "versorgen."
	done





PowerPlantOfficer2Script:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer PowerPlantOfficer2ManagerHasBeenCheerfulText
	jumpthistextfaceplayer

	text "Der DIREKTOR des"
	line "Kraftwerks ist"
	cont "weiter vorne."

	para "Aber seit jemand"
	line "den Generator"
	cont "demoliert hat,"

	para "ist er sowohl"
	line "traurig als auch"
	cont "wütend…"
	done





PowerPlantGymGuide4Script:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer PowerPlantGymGuide4WeCanGetMagnetTrainRunningText
	jumpthistextfaceplayer

	text "Der MAGNETZUG"
	line "verbraucht viel"
	cont "Strom."

	para "Er kann nicht"
	line "fahren, wenn der"

	para "neue Generator"
	line "nicht läuft."
	done





PowerPlantManager:
	faceplayer
	opentext
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd PowerPlantTutorZapCannonScript
	checkkeyitem MACHINE_PART
	iftruefwd .FoundMachinePart
	checkevent EVENT_MET_MANAGER_AT_POWER_PLANT
	iftrue_jumpopenedtext PowerPlantManagerIWontForgiveCulpritText
	writetext PowerPlantManagerWhoWouldRuinMyGeneratorText
	waitbutton
	closetext
	setevent EVENT_MET_MANAGER_AT_POWER_PLANT
	clearevent EVENT_CERULEAN_GYM_ROCKET
	setmapscene CERULEAN_GYM, SCENE_CERULEANGYM_GRUNT_RUNS_OUT
	setscene SCENE_POWERPLANT_GUARD_GETS_PHONE_CALL
	end

.FoundMachinePart:
	writetext PowerPlantManagerThatsThePartText
	waitbutton
	closetext
	takekeyitem MACHINE_PART
	clearevent EVENT_SAFFRON_TRAIN_STATION_POPULATION
	setevent EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	setevent EVENT_ROUTE_24_ROCKET
	setevent EVENT_RESTORED_POWER_TO_KANTO
	clearevent EVENT_GOLDENROD_TRAIN_STATION_GENTLEMAN
	setmapscene ROUTE_10_NORTH, SCENE_ROUTE10NORTH_LAWRENCE
	clearevent EVENT_LAWRENCE_ROUTE_10
	playsound SFX_SLOT_MACHINE_START
	special FadeOutPalettes
	special LoadMapPalettes
	pause 10
	special FadeInPalettes_EnableDynNoApply
	changeblock 12, 6, $12
	changeblock 14, 6, $47
	changeblock 12, 12, $16
	changeblock 12, 14, $16
	refreshmap
	pause 30
	opentext
	writetext PowerPlantManagerYouDeserveARewardText
	waitbutton
PowerPlantTutorZapCannonScript:
	writetext Text_PowerPlantTutorZapCannon
	waitbutton
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	writetext Text_PowerPlantTutorQuestion
	yesorno
	iffalsefwd .TutorRefused
	setval ZAP_CANNON
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpthisopenedtext

	text "Wie du meinst."
	done

.NoSilverLeaf
	jumpthisopenedtext

	text "Ohne das Blatt"
	line "kann ich Zap"
	cont "Cannon nicht"
	cont "beibringen!"
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "Jetzt kennt dein"
	line "#mon Zap"
	cont "Cannon!"

	para "Wahahah!"
	done

PowerPlantOfficer1ApproachGymGuide2Movement:
	step_right
	step_right
	step_up
	step_up
	step_end

PowerPlantOfficer1ReturnToPostMovement:
	step_down
	step_down
	step_left
	step_left
	turn_head_down
	step_end


PowerPlantOfficer1CeruleanShadyCharacterText:
	text "Ich habe Nachricht"
	line "aus AZURIA CITY."

	para "Eine zwielichtige"
	line "Figur treibt sich"

	para "dort in der"
	line "Umgebung herum."
	done





PowerPlantOfficer1CouldIAskForYourCooperationText:
	text "Kann ich mit"
	line "deiner Unter-"
	cont "stützung rechnen?"
	done





PowerPlantOfficer1HaveToBeefUpSecurityText:
	text "Wir müssen mehr"
	line "Wachpersonal"
	cont "einstellen."
	done





PowerPlantGymGuide1GeneratorUpAndRunningText:
	text "Der Generator"
	line "funktioniert"
	cont "wieder. Jetzt"
	cont "erzeugen wir"
	cont "genügend Energie."
	done





PowerPlantGymGuide2GeneratorIsRunningAgainText:
	text "Der Generator"
	line "läuft wieder!"
	done





PowerPlantOfficer2ManagerHasBeenCheerfulText:
	text "Seit der Generator"
	line "wieder läuft, ist"

	para "der DIREKTOR"
	line "wieder fröhlich."
	done





PowerPlantGymGuide4WeCanGetMagnetTrainRunningText:
	text "O.K. Der MAGNET-"
	line "ZUG fährt"

	para "wieder."
	done





PowerPlantManagerWhoWouldRuinMyGeneratorText:
	text "DIREKTOR: Ich, ich"
	line "werde ihm nie"
	cont "verzeihen!"

	para "Wer wagt es,"
	line "meinen Generator"
	cont "zu demolieren?"

	para "Ich habe so lange"
	line "daran gearbeitet!"

	para "Wenn ich den"
	line "erwische, dann"

	para "lernt er meine"
	line "BLITZKANONE"
	cont "kennen!"
	done





PowerPlantManagerIWontForgiveCulpritText:
	text "DIREKTOR: Das kann"
	line "ich ihm nicht"
	cont "verzeihen!"

	para "Der Schurke kann"
	line "weinen und sich"

	para "entschuldigen, ich"
	line "werde ihn trotzdem"
	cont "bestrafen!"

	para "Uahahaha!"
	done





PowerPlantManagerThatsThePartText:
	text "DIREKTOR: Ah! Oh"
	line "ja!"

	para "Das ist die"
	line "fehlende SPULE"
	cont "meines geliebten"
	cont "Generators! Du"
	cont "hast sie gefunden?"
	done





PowerPlantManagerYouDeserveARewardText:
	text "Du hast eine"
	line "Belohnung"
	cont "verdient!"
	done

Text_PowerPlantTutorZapCannon:
	text "Manager: Ich kann"
	line "deinem #mon"

	para "meine Zap Cannon"
	line "beibringen!"

	para "Sie ist nicht"
	line "gerade präzise,"

	para "aber sie hat"
	line "ordentlich Wucht!"

	para "Ich brauche nur"
	line "ein Silberblatt."
	done


Text_PowerPlantTutorQuestion:
	text "Soll ich deinem"
	line "#mon Zap Cannon"
	cont "beibringen?"
	done



PowerPlantForestText:
	text "Magneton verhält"
	line "sich im Felstunnel"
	cont "seltsam."

	para "Haben die Turbinen"
	line "des Kraftwerks"

	para "damit etwas zu"
	line "tun?"
	done
