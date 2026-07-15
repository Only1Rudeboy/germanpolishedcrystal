VictoryRoad2F_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_VICTORYROAD2F_RIVAL_BATTLE
	scene_const SCENE_VICTORYROAD2F_NOOP

	def_callbacks

	def_warp_events
	warp_event 25,  9, ROUTE_23_NORTH, 2
	warp_event  3, 11, VICTORY_ROAD_1F, 2
	warp_event  3,  4, VICTORY_ROAD_3F, 1
	warp_event 15,  7, VICTORY_ROAD_3F, 2
	warp_event 19,  9, VICTORY_ROAD_3F, 3

	def_coord_events
	coord_event 25,  9, SCENE_VICTORYROAD2F_RIVAL_BATTLE, VictoryRoadRivalLeft

	def_bg_events
	bg_event  5,  5, BGEVENT_ITEM + MAX_POTION, EVENT_VICTORY_ROAD_2F_HIDDEN_MAX_POTION

	def_object_events
	object_event 20,  9, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_VICTORY_ROAD
	object_event 11, 11, SPRITE_VETERAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerVeteranfJoanne, -1
	object_event  5,  3, SPRITE_VETERAN_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerVeteranfJonet, -1
	tmhmball_event  8,  4, TM_EARTHQUAKE, EVENT_VICTORY_ROAD_2F_TM_EARTHQUAKE
	itemball_event 20,  5, FULL_RESTORE, 1, EVENT_VICTORY_ROAD_2F_FULL_RESTORE
	itemball_event  9, 14, HP_UP, 1, EVENT_VICTORY_ROAD_2F_HP_UP

	object_const_def
	const VICTORYROAD2F_RIVAL

VictoryRoadRivalLeft:
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, LEFT
	special Special_FadeOutMusic
	pause 15
	appear VICTORYROAD2F_RIVAL
	applymovement VICTORYROAD2F_RIVAL, VictoryRoadRivalBattleApproachMovement1
	playmusic MUSIC_RIVAL_ENCOUNTER
	showtext VictoryRoadRivalBeforeText
	setevent EVENT_RIVAL_VICTORY_ROAD
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftruefwd .GotTotodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftruefwd .GotChikorita
	winlosstext VictoryRoadRivalDefeatText, VictoryRoadRivalVictoryText
	setlasttalked VICTORYROAD2F_RIVAL
	loadtrainer RIVAL1, RIVAL1_15
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjumpfwd .AfterBattle

.GotTotodile:
	winlosstext VictoryRoadRivalDefeatText, VictoryRoadRivalVictoryText
	setlasttalked VICTORYROAD2F_RIVAL
	loadtrainer RIVAL1, RIVAL1_13
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjumpfwd .AfterBattle

.GotChikorita:
	winlosstext VictoryRoadRivalDefeatText, VictoryRoadRivalVictoryText
	setlasttalked VICTORYROAD2F_RIVAL
	loadtrainer RIVAL1, RIVAL1_14
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	; fallthrough

.AfterBattle:
	special DeleteSavedMusic
	playmusic MUSIC_RIVAL_AFTER
	showtext VictoryRoadRivalAfterText
	applymovement VICTORYROAD2F_RIVAL, VictoryRoadRivalBattleExitMovement1
	disappear VICTORYROAD2F_RIVAL
	setscene SCENE_VICTORYROAD2F_NOOP
	playmapmusic
	end

GenericTrainerVeteranfJoanne:
	generictrainer VETERANF, JOANNE, EVENT_BEAT_VETERANF_JOANNE, VeteranfJoanneSeenText, VeteranfJoanneBeatenText

	text "Du hast dir das"
	line "Recht auf die"
	cont "Siegesstraße"
	cont "verdient!"
	done

GenericTrainerVeteranfJonet:
	generictrainer VETERANF, JONET, EVENT_BEAT_VETERANF_JONET, VeteranfJonetSeenText, VeteranfJonetBeatenText

	text "Hat jemand Lavados"
	line "schon gefangen?"
	done

VictoryRoadRivalBattleApproachMovement1:
	step_right
	step_right
	step_right
	step_right
	step_end

VictoryRoadRivalBattleExitMovement1:
	step_left
	step_left
	step_left
	step_left
	step_end

VictoryRoadRivalBeforeText:
	text "Moment."
	para "… Wirst du das"
	line "#mon"
	cont "LIGA-Abenteuer"
	cont "bestreiten?"
	para "… Bring mich nicht"
	line "zum Lachen."
	para "Du bist viel"
	line "schwächer als ich."
	para "Ich bin nicht mehr"
	line "so wie früher."
	para "Nun habe ich die"
	line "besten und"
	para "stärksten #mon."
	line "Ich bin"
	cont "unschlagbar!"
	para "<PLAYER>! Ich"
	line "fordere dich"
	cont "heraus!"
	done
VictoryRoadRivalDefeatText:
	text "… Ich konnte nicht"
	line "gewinnen …"
	para "Ich habe alles"
	line "gegeben …"
	para "Was du besitzt und"
	line "was mir fehlt …"
	para "Langsam begreife"
	line "ich, was der"
	para "Drachenmeister zu"
	line "mir sagte …"
	done
VictoryRoadRivalAfterText:
	text "… Ich habe nicht"
	line "aufgegeben, der"
	cont "weltbeste Trainer"
	cont "zu werden …"
	para "Ich werde"
	line "herausfinden,"
	para "warum ich nicht"
	line "gewinnen kann und"
	cont "dann werde ich"
	cont "stärker …"
	para "Wenn ich soweit"
	line "bin, fordere ich"
	cont "dich heraus."
	para "Dann werde ich dir"
	line "die Leviten lesen."
	para "… Humpf! Bleib bis"
	line "dahin dabei."
	done
VictoryRoadRivalVictoryText:
	text "… Humpf!"
	para "Wenn es darauf"
	line "ankommt, gibt es"
	cont "nichts, was Stärke"
	cont "Paroli bieten"
	cont "kann."
	para "Mehr brauche ich"
	line "nicht."
	done
VeteranfJoanneSeenText:
	text "Die Siegesstraße"
	line "ist die letzte"
	cont "Prüfung für"
	cont "Trainer!"
	done

VeteranfJoanneBeatenText:
	text "Jippie!"
	done
VeteranfJonetSeenText:
	text "Hier soll"
	line "angeblich ein"
	cont "Moltres haust."

	para "Ich werde es"
	line "fangen!"
	done

VeteranfJonetBeatenText:
	text "Ich hätte gewonnen"
	line "mit einem"
	cont "Legendär-#mon …"
	done
