OlivineCity_MapScriptHeader:
	def_scene_scripts
	scene_script DoNothingScript, SCENE_OLIVINECITY_RIVAL_ENCOUNTER
	scene_script OlivineCityStepDownScene, SCENE_OLIVINECITY_STEP_DOWN
	scene_const SCENE_OLIVINECITY_NOOP

	def_callbacks
	callback MAPCALLBACK_NEWMAP, OlivineCityFlyPoint
	callback MAPCALLBACK_TILES, OlivineCityLighthouseCallback

	def_warp_events
	warp_event 13, 17, OLIVINE_POKECENTER_1F, 1
	warp_event 10,  7, OLIVINE_GYM, 1
	warp_event 25,  7, OLIVINE_TIMS_HOUSE, 1
	warp_event 29,  7, OLIVINE_PUNISHMENT_SPEECH_HOUSE, 1
	warp_event 15, 11, OLIVINE_GOOD_ROD_HOUSE, 1
	warp_event  7, 17, OLIVINE_CAFE, 1
	warp_event 21, 17, OLIVINE_MART, 2
	warp_event 33, 21, OLIVINE_LIGHTHOUSE_1F, 1 ; hole
	warp_event 18, 28, OLIVINE_PORT, 1
	warp_event 19, 28, OLIVINE_PORT, 2

	def_coord_events
	coord_event 10,  8, SCENE_OLIVINECITY_RIVAL_ENCOUNTER, OlivineCityRivalGymScript
	coord_event 33, 22, SCENE_OLIVINECITY_RIVAL_ENCOUNTER, OlivineCityRivalLighthouseScript
	coord_event 33, 21, SCENE_OLIVINECITY_NOOP, OlivineCityPanUpScript

	def_bg_events
	bg_event 17,  7, BGEVENT_JUMPTEXT, OlivineCitySignText
	bg_event 20, 25, BGEVENT_JUMPTEXT, OlivineCityPortSignText
	bg_event  7,  7, BGEVENT_JUMPTEXT, OlivineGymSignText
	bg_event 35, 23, BGEVENT_JUMPTEXT, OlivineLighthouseSignText
	bg_event  1, 21, BGEVENT_JUMPTEXT, OlivineCityBattleTowerSignText
	bg_event 10, 17, BGEVENT_JUMPTEXT, OlivineCityCafeSignText
	bg_event 35, 18, BGEVENT_ITEM + RARE_CANDY, EVENT_OLIVINE_CITY_HIDDEN_RARE_CANDY

	def_object_events
	object_event 10,  7, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_OLIVINE_CITY
	object_event 20,  8, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OlivineCityYoungster1Script, -1
	object_event 21, 23, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, (1 << MORN) | (1 << NITE), PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, OlivineCityPokefanMScript, -1
	object_event 26, 20, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivineCitySailor1Text, -1
	object_event 15, 21, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, 1 << EVE, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivineCitySailor2Text, -1
	object_event 31, 19, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, (1 << MORN) | (1 << DAY), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivineCityFisherText, -1
	object_event 31, 19, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, (1 << EVE) | (1 << NITE), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivineCitySailor3Text, -1
	object_event 22, 23, SPRITE_MATRON, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, (1 << DAY), PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivineCityPokefanFText, -1
	object_event 25, 16, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_DARK_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivineCitySailor4Text, -1
	object_event 25, 17, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivineCitySailor5Text, -1
	object_event 26, 11, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, (1 << MORN) | (1 << EVE), PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivineCityLass1Text, -1
	object_event 28, 11, SPRITE_CAMPER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, (1 << DAY) | (1 << NITE), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivineCityYoungster2Text, -1
	object_event  8, 21, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, (1 << MORN) | (1 << DAY) | (1 << EVE), PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivineCityLass2Text, -1
	smashrock_event 52, 23
	smashrock_event 55, 26

	object_const_def
	const OLIVINECITY_OLIVINE_RIVAL

OlivineCityFlyPoint:
	setflag ENGINE_FLYPOINT_OLIVINE
	endcallback

OlivineCityLighthouseCallback:
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iffalsefwd .done
	checktime 1 << NITE
	iffalsefwd .done
	changeblock 32, 14, $9a
	changeblock 34, 14, $9b
.done
	endcallback

OlivineCityStepDownScene:
	sdefer .Script
	end

.Script:
	readvar VAR_XCOORD
	ifnotequal 33, .Done
	readvar VAR_YCOORD
	ifnotequal 21, .Done
	applyonemovement PLAYER, step_down
.Done
	setscene SCENE_OLIVINECITY_NOOP
	end

OlivineCityPanUpScript:
	playsound SFX_EXIT_BUILDING
	applyonemovement PLAYER, hide_object
	waitsfx
	applymovement PLAYER, OlivineCityPanUpMovementData
	disappear PLAYER
	pause 10
	special Special_FadeOutMusic
	special FadeOutPalettes
	pause 15
	setscene SCENE_OLIVINECITY_STEP_DOWN
	warpfacing UP, OLIVINE_LIGHTHOUSE_1F, 10, 17
	end

OlivineCityRivalGymScript:
	turnobject PLAYER, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	playsound SFX_ENTER_DOOR
	appear OLIVINECITY_OLIVINE_RIVAL
	waitsfx
	playsound SFX_TACKLE
	applymovement PLAYER, OlivineCityMovementData_ShovePlayerDown
	applyonemovement OLIVINECITY_OLIVINE_RIVAL, step_down
	playmusic MUSIC_RIVAL_ENCOUNTER
	showtext OlivineCityRivalGymText
	turnobject PLAYER, RIGHT
	applymovement OLIVINECITY_OLIVINE_RIVAL, OlivineCityMovementData_RivalLeavesGym
	setscene SCENE_OLIVINECITY_NOOP
	disappear OLIVINECITY_OLIVINE_RIVAL
	special RestartMapMusic
	end

OlivineCityRivalLighthouseScript:
	turnobject PLAYER, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	moveobject OLIVINECITY_OLIVINE_RIVAL, 33, 21
	playsound SFX_ENTER_DOOR
	appear OLIVINECITY_OLIVINE_RIVAL
	waitsfx
	playsound SFX_TACKLE
	applymovement PLAYER, OlivineCityMovementData_ShovePlayerDown
	applyonemovement OLIVINECITY_OLIVINE_RIVAL, step_down
	playmusic MUSIC_RIVAL_ENCOUNTER
	showtext OlivineCityRivalLighthouseText
	turnobject PLAYER, LEFT
	applymovement OLIVINECITY_OLIVINE_RIVAL, OlivineCityMovementData_RivalLeavesLighthouse
	setscene SCENE_OLIVINECITY_NOOP
	disappear OLIVINECITY_OLIVINE_RIVAL
	special RestartMapMusic
	end

OlivineCityYoungster1Script:
	random 2
	iffalse_jumptextfaceplayer OlivineCityStandingYoungsterPokedexText
	jumpthistextfaceplayer

	text "Dieses Ding da ist"
	line "doch ein #Com."
	cont "Wow, das ist cool!"
	done
OlivineCityPokefanMScript:
	checkevent EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	iffalse_jumptextfaceplayer OlivineCityPokefanMText
	jumpthistextfaceplayer

	text "Die M.S. AQUA"
	line "fährt immer"

	para "montags und"
	line "freitags nach"

	para "KANTO."
	done
OlivineCityPanUpMovementData:
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end

OlivineCityMovementData_ShovePlayerDown:
	turn_head_up
	fix_facing
	step_down
	remove_fixed_facing
	step_end

OlivineCityMovementData_RivalLeavesGym:
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end

OlivineCityMovementData_RivalLeavesLighthouse:
	step_left
	step_left
	step_left
	fix_facing
	step_down
	remove_fixed_facing
	step_left
	step_left
	step_end

OlivineCityRivalGymText:
	text "…"

	para "Du schon wieder?"

	para "Kein Grund zur"
	line "Panik. Mit"
	cont "Verlierern wie dir"
	cont "gebe ich mich"
	cont "nicht ab."

	para "Apropos Verlierer:"
	line "die ARENALEITERIN"

	para "dieser Stadt ist"
	line "nicht hier."

	para "Sie kümmert sich"
	line "wohl gerade um ein"

	para "krankes #mon im"
	line "LEUCHTTURM."

	para "Hmpf! Bu-Huu! Wozu"
	line "soll das nur gut"
	cont "sein?"

	para "Ein #mon, das"
	line "nicht kämpfen"
	cont "kann, ist wertlos!"

	para "Warum trainierst"
	line "du nicht im"
	cont "LEUCHTTURM?"

	para "Wer weiß,"
	line "vielleicht wirst"
	cont "du dadurch ein"
	cont "wenig stärker!"
	done
OlivineCityRivalLighthouseText:
	text "…"

	para "Du schon wieder?"

	para "Kein Grund zur"
	line "Panik. Mit"
	cont "Verlierern wie dir"
	cont "gebe ich mich"
	cont "nicht ab."

	para "Apropos Verlierer:"
	line "die ARENALEITERIN"

	para "dieser Stadt ist"
	line "nicht hier."

	para "Sie kümmert sich"
	line "wohl gerade um ein"

	para "krankes #mon im"
	line "LEUCHTTURM."

	para "Hmpf! Bu-Huu! Wozu"
	line "soll das nur gut"
	cont "sein?"

	para "Ein #mon, das"
	line "nicht kämpfen"
	cont "kann, ist wertlos!"

	para "Warum trainierst"
	line "du nicht im"
	cont "LEUCHTTURM?"

	para "Wer weiß,"
	line "vielleicht wirst"
	cont "du dadurch ein"
	cont "wenig stärker!"
	done

OlivineCityStandingYoungsterPokedexText:
	text "Wow, du hast einen"
	line "#dex!"

	para "Das ist so toll!"
	done





OlivineCitySailor1Text:
	text "Nachts sind dunkle"
	line "Straßen"
	cont "gefährlich."

	para "Auch das Meer"
	line "wirkt viel"
	cont "bedrohlicher in"
	cont "der"

	para "pechschwarzen"
	line "Finsternis!"

	para "Ohne das Licht des"
	line "LEUCHTTURMs könnte"

	para "kein Schiff das"
	line "Meer bereisen."
	done





OlivineCitySailor2Text:
	text "Die See ist schön!"

	para "Sonnenuntergänge"
	line "über dem Meer sind"
	cont "wundervoll!"

	para "Sing mit mir!"
	line "Yo-ho! Seebären"
	cont "sind so cool!…"
	done





OlivineCityFisherText:
	text "Du erinnerst mich"
	line "an ein Kind, das"
	cont "hier wohnte."

	para "Die Familie zog"
	line "weg, als ihr"

	para "Vater in einer"
	line "anderen Region"
	cont "Arenaleiter wurde."
	done

OlivineCitySailor3Text:
	text "Nachts, wenn der"
	line "LEUCHTTURM das"
	cont "Meer erhellt -"

	para "das ist"
	line "wunderschön!"
	done

OlivineCityPokefanFText:
	text "Warst du schon im"
	line "OLIVIANA CITY-"
	cont "CAFE?"

	para "Das Essen ist"
	line "köstlich."
	done

OlivineCityPokefanMText:
	text "Die meisten"
	line "Trainer in"
	cont "OLIVIANA gehen"

	para "direkt zum"
	line "DUELLTURM."

	para "Nur die Besten"
	line "kämpfen dort."
	done

OlivineCitySailor4Text:
	text "♪ OLIVIANA CITY,"

	para "so schön bist du,"
	line "am blauen Meer,"
	cont "ganz ohne Streit,"

	para "du strahlst so"
	line "hell, OLIVIANA"
	cont "CITY!… ♪"
	done

OlivineCitySailor5Text:
	text "Wir Matrosen"
	line "lieben ein"
	cont "Schifferlied. Sing"
	cont "mit!"

	para "♪ Von der Planke"
	line "sprang er dann,"

	para "und sang dabei"
	line "sein Lied,"

	para "la la la la la la"
	line "la… ♪"
	done

OlivineCityLass1Text:
	text "Die Seeleute hier"
	line "wirken vielleicht"

	para "wild, aber sie"
	line "sind harmlos."
	done

OlivineCityYoungster2Text:
	text "Matrosen und"
	line "Camper haben etwas"
	cont "gemein:"

	para "Wir singen gern!"
	line "Aber die Lieder"
	cont "der Matrosen sind"
	cont "echt… anders."
	done

OlivineCityLass2Text:
	text "Jasmin, unsere"
	line "ARENALEITERIN, ist"
	cont "ein schüchternes"
	cont "Mädchen."

	para "Aber sie ist kein"
	line "Leichtgewicht!"
	done

OlivineCitySignText:
	text "OLIVIANA CITY"

	para "Das Tor zu einer"
	line "neuen Welt"
	done





OlivineCityPortSignText:
	text "HAFEN von OLIVIANA"
	line "CITY"
	cont "SCHNELLBOOT-PIER"
	done





OlivineGymSignText:
	text "#mon-ARENA von"
	line "OLIVIANA CITY"
	cont "LEITUNG: JASMIN"

	para "Ein stahlhartes"
	line "Mädchen!"
	done





OlivineLighthouseSignText:
	text "LEUCHTTURM von"
	line "OLIVIANA CITY,"
	cont "auch bekannt als"
	cont "GLITZER-LEUCHTTU-"
	cont "RM"
	done
	
	
	
	
	
OlivineCityBattleTowerSignText:
	text "DUELLTURM"
	line "Geradeaus Jetzt"
	cont "geöffnet!"
	done

OlivineCityCafeSignText:
	text "OLIVIANA CITY-"
	line "CAFE"
	done
