LavenderTown_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_LAVENDERTOWN_EXPOSITION
	scene_const SCENE_LAVENDERTOWN_NOOP

	def_callbacks
	callback MAPCALLBACK_NEWMAP, LavenderTownFlyPoint

	def_warp_events
	warp_event  5,  7, LAVENDER_POKECENTER_1F, 1
	warp_event  5, 11, MR_FUJIS_HOUSE, 1
	warp_event  3, 15, LAVENDER_TOWN_SPEECH_HOUSE, 1
	warp_event  7, 15, LAVENDER_NAME_RATER, 1
	warp_event  1,  7, LAVENDER_MART, 2
	warp_event 13, 13, SOUL_HOUSE, 1
	warp_event 14,  7, LAV_RADIO_TOWER_1F, 1

	def_coord_events
; TODO:
;	coord_event  8,  5, SCENE_LAVENDERTOWN_EXPOSITION, LavenderTownExpositionTrigger1
;	coord_event  9,  5, SCENE_LAVENDERTOWN_EXPOSITION, LavenderTownExpositionTrigger2
;	coord_event 10,  5, SCENE_LAVENDERTOWN_EXPOSITION, LavenderTownExpositionTrigger3

	def_bg_events
	bg_event 11,  5, BGEVENT_JUMPTEXT, LavenderTownSignText
	bg_event 15,  9, BGEVENT_JUMPTEXT, KantoRadioStationSignText
	bg_event  3, 11, BGEVENT_JUMPTEXT, VolunteerPokemonHouseSignText
	bg_event 15, 15, BGEVENT_JUMPTEXT, SoulHouseSignText

	def_object_events
	object_event 14,  7, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LAVENDER_TOWN_FLEEING_YOUNGSTER
	object_event 12,  9, SPRITE_HIKER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, LavenderTownPokefanMText, -1
	object_event  2, 17, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, LavenderTownTeacherText, -1
	object_event 14, 14, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, LavenderTownGrampsText, -1
	object_event  6, 13, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, LavenderTownYoungsterText, -1
	object_event  8, 18, SPRITE_POKEMANIAC, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, LavenderTownSuperNerdText, EVENT_LAVENDER_TOWN_FLEEING_YOUNGSTER ; TODO: EVENT_EXORCISED_LAV_RADIO_TOWER
	object_event  9, 19, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, LavenderTownCooltrainerFText, EVENT_LAVENDER_TOWN_FLEEING_YOUNGSTER ; TODO: EVENT_EXORCISED_LAV_RADIO_TOWER
	object_event 11, 17, SPRITE_ROCKER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, LavenderTownRockerText, EVENT_LAVENDER_TOWN_FLEEING_YOUNGSTER ; TODO: EVENT_EXORCISED_LAV_RADIO_TOWER

	object_const_def
	const LAVENDERTOWN_YOUNGSTER1

LavenderTownFlyPoint:
; TODO: don't set these once the coord_events are done
	setevent EVENT_ROUTE_8_PROTESTORS
	clearevent EVENT_ROUTE_8_KANTO_POKEMON_FEDERATION
	setflag ENGINE_FLYPOINT_LAVENDER
	endcallback

LavenderTownExpositionTrigger1:
	moveobject LAVENDERTOWN_YOUNGSTER1, 14, 8
	showemote EMOTE_SHOCK, PLAYER, 15
	appear LAVENDERTOWN_YOUNGSTER1
	applymovement LAVENDERTOWN_YOUNGSTER1, .ApproachPlayerMovement
	scall LavenderTownSharedExpositionScript
	applymovement LAVENDERTOWN_YOUNGSTER1, .GoAroundPlayerMovement
	sjumpfwd LavenderTownFinishExpositionScript

.ApproachPlayerMovement:
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_up
	big_step_up
	step_end

.GoAroundPlayerMovement:
	step_right
	big_step_up
	step_end

LavenderTownExpositionTrigger2:
	showemote EMOTE_SHOCK, PLAYER, 15
	playsound SFX_ENTER_DOOR
	appear LAVENDERTOWN_YOUNGSTER1
	waitsfx
	applymovement LAVENDERTOWN_YOUNGSTER1, .ApproachPlayerMovement
	scall LavenderTownSharedExpositionScript
	applymovement LAVENDERTOWN_YOUNGSTER1, .GoAroundPlayerMovement
	sjumpfwd LavenderTownFinishExpositionScript

.ApproachPlayerMovement:
	step_down
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_up
	big_step_up
	step_end

.GoAroundPlayerMovement:
	step_right
	big_step_up
	step_end

LavenderTownExpositionTrigger3:
	showemote EMOTE_SHOCK, PLAYER, 15
	playsound SFX_ENTER_DOOR
	appear LAVENDERTOWN_YOUNGSTER1
	waitsfx
	applymovement LAVENDERTOWN_YOUNGSTER1, .ApproachPlayerMovement
	scall LavenderTownSharedExpositionScript
	applymovement LAVENDERTOWN_YOUNGSTER1, .GoAroundPlayerMovement
	sjumpfwd LavenderTownFinishExpositionScript

.ApproachPlayerMovement:
	step_down
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_up
	big_step_up
	step_end

.GoAroundPlayerMovement:
	step_left
	big_step_up
	step_end

LavenderTownSharedExpositionScript:
	playsound SFX_TACKLE
	applymovement LAVENDERTOWN_YOUNGSTER1, .BumpMovement
	jumpthistext

	; PC-only (CAPS RADIOTURM)
	text "Aah! G-g-Geist!"

	para "Im RADIOTURM"
	line "wimmelt es nur so"
	cont "von Monstern!"

	para "Rennt weg!"
	done

.BumpMovement:
	fix_facing
	set_sliding
	jump_step_down
	remove_sliding
	remove_fixed_facing
	step_sleep_8
	step_sleep_8
	step_up
	step_up
	step_end

LavenderTownFinishExpositionScript:
	turnobject PLAYER, UP
	applymovement LAVENDERTOWN_YOUNGSTER1, .LeaveMovement
	disappear LAVENDERTOWN_YOUNGSTER1
	setevent EVENT_ROUTE_8_PROTESTORS
	clearevent EVENT_ROUTE_8_KANTO_POKEMON_FEDERATION
	setflag ENGINE_FLYPOINT_LAVENDER
	setscene SCENE_LAVENDERTOWN_NOOP
	end

.LeaveMovement:
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	step_end

LavenderTownSignText:
	; GSC-DE Dump 7164
	text "LAVANDIA"

	para "Die Liebliche"
	line "Lilafarbene Stadt"
	done
KantoRadioStationSignText:
	; GSC-DE Dump 7165
	text "KANTO RADIO-"
	line "STATION"

	para "Deine Lieblings-"
	line "programme zu jeder"
	cont "Tages- und Nacht-"
	cont "zeit!"
	done





VolunteerPokemonHouseSignText:
	; GSC-DE Dump 7166
	text "WAISENHAUS für"
	line "#mon"
	cont "von LAVANDIA"
	done





SoulHouseSignText:
	; GSC-DE Dump 7167
	text "RUHESTÄTTE"

	para "Mögen die Seelen"
	line "der #mon hier"
	cont "in Frieden Ruhen"
	done





LavenderTownPokefanMText:
	; GSC-DE Dump 7160
	text "Ein recht beein-"
	line "druckendes"
	cont "Gebäude, nicht?"

	para "Das ist der RADIO-"
	line "TURM von KANTO."
	done





LavenderTownTeacherText:
	; GSC-DE Dump 7161
	text "In KANTO werden"
	line "viele, gute Radio-"
	cont "programme"
	cont "gesendet."
	done





LavenderTownGrampsText:
	; GSC-DE Dump 7162
	text "Die Leute kommen"
	line "von überall her,"

	para "um den Seelen"
	line "dahingegangener"
	cont "#mon Respekt"
	cont "zu erweisen."
	done





LavenderTownYoungsterText:
	; GSC-DE Dump 7163
	text "Mit einer #"
	line "floete weckst du"
	cont "schlafende"
	cont "#mon."

	para "Jeder Trainer muss"
	line "das wissen!"
	done





LavenderTownSuperNerdText:
	; PC-only (CAPS)
	text "Noch mal in den"
	line "RADIOTURM?"

	para "Bist du verrückt?"
	done

LavenderTownCooltrainerFText:
	; PC-only
	text "Der Turm ist"
	line "verflucht, ich"
	cont "weiß es einfach!"

	para "Ich habe solche"
	line "Angst!"
	done

LavenderTownRockerText:
	; PC-only (CAPS)
	text "Ich dachte, ein"
	line "Job im RADIOTURM"

	para "wäre mein großer"
	line "Durchbruch, aber"

	para "ich gehe nicht"
	line "zurück, bis es"
	cont "sicher ist."
	done
