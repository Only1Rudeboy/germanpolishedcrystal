VermilionCity_MapScriptHeader:
	def_scene_scripts
	scene_script LawrenceIntroScript, SCENE_VERMILIONCITY_LAWRENCE_INTRO
	scene_const SCENE_VERMILIONCITY_NOOP

	def_callbacks
	callback MAPCALLBACK_OBJECTS, VermilionCitySetupLawrenceCallback
	callback MAPCALLBACK_TILES, VermilionCitySetupBattleFactoryCallback

	def_warp_events
	warp_event  5,  5, VERMILION_HOUSE_FISHING_SPEECH_HOUSE, 1
	warp_event  9,  5, VERMILION_POKECENTER_1F, 1
	warp_event  7, 17, POKEMON_FAN_CLUB, 1
	warp_event 13, 17, VERMILION_MAGNET_TRAIN_SPEECH_HOUSE, 1
	warp_event 21, 17, VERMILION_MART, 2
	warp_event 21, 21, VERMILION_HOUSE_DIGLETTS_CAVE_SPEECH_HOUSE, 1
	warp_event 10, 23, VERMILION_GYM, 1
	warp_event 18, 35, VERMILION_PORT, 1
	warp_event 19, 35, VERMILION_PORT, 3
	warp_event 36, 17, DIGLETTS_CAVE, 1
	warp_event 28, 35, SEAGALLOP_FERRY_VERMILION_GATE, 1
	warp_event 29, 35, SEAGALLOP_FERRY_VERMILION_GATE, 1
	warp_event 13,  5, VERMILION_POLLUTION_SPEECH_HOUSE, 1
	warp_event 19,  5, VERMILION_S_S_ANNE_SPEECH_HOUSE, 1
	warp_event 29,  9, BATTLE_FACTORY_1F, 1
	warp_event 30,  9, BATTLE_FACTORY_1F, 2

	def_coord_events

	def_bg_events
	bg_event 19,  9, BGEVENT_JUMPTEXT, VermilionCitySignText
	bg_event  5, 23, BGEVENT_JUMPTEXT, VermilionGymSignText
	bg_event  5, 17, BGEVENT_JUMPTEXT, PokemonFanClubSignText
	bg_event 33, 17, BGEVENT_JUMPTEXT, VermilionCityDiglettsCaveSignText
	bg_event 27, 19, BGEVENT_JUMPTEXT, VermilionCityPortSignText
	bg_event 23, 13, BGEVENT_JUMPTEXT, VermilionCityBattleFactorySignText
	bg_event 11, 27, BGEVENT_JUMPTEXT, VermilionCityAdvancedTipsSignText
	bg_event 12, 23, BGEVENT_ITEM + FULL_HEAL, EVENT_VERMILION_CITY_HIDDEN_FULL_HEAL

	def_object_events
	object_event 35, 18, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_SNORLAX, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionSnorlax, EVENT_VERMILION_CITY_SNORLAX
	object_event 18, 31, SPRITE_LAWRENCE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LAWRENCE_VERMILION_CITY
	object_event 18, 13, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, VermilionCityTeacherText, -1
	object_event 21,  9, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionMachokeOwnerScript, -1
	pokemon_event 22,  9, MACHOKE, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_GRAY, VermilionMachokeText, -1
	object_event 16, 20, SPRITE_ROCKER, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, VermilionCitySuperNerdText, -1
	object_event 32, 12, SPRITE_POKEMANIAC, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VermilionCitySuperNerd2Script, -1
	object_event 11,  8, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 3, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VermilionCitySailorText, -1
	object_event 19, 17, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, VermilionGymBadgeGuy, -1
	object_event 29, 10, SPRITE_OFFICER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VermilionCityOfficerFText, EVENT_RESTORED_POWER_TO_KANTO
	object_event 30, 10, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VermilionCityOfficerText, EVENT_RESTORED_POWER_TO_KANTO
	cuttree_event 13, 23, EVENT_VERMILION_CITY_CUT_TREE

	object_const_def
	const VERMILIONCITY_BIG_SNORLAX
	const VERMILIONCITY_LAWRENCE

VermilionCitySetupLawrenceCallback:
	checkscene
	iftruefwd .done
	readvar VAR_XCOORD
	ifequalfwd 18, .done
	disappear VERMILIONCITY_LAWRENCE
	moveobject VERMILIONCITY_LAWRENCE, 19, 31
	appear VERMILIONCITY_LAWRENCE
.done
	endcallback

VermilionCitySetupBattleFactoryCallback:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .done
	changeblock 26,  6, $a8
	changeblock 28,  6, $a9
	changeblock 30,  6, $a9
	changeblock 32,  6, $aa
	changeblock 26,  8, $fa
	changeblock 28,  8, $8b
	changeblock 30,  8, $8f
	changeblock 32,  8, $fb
.done
	endcallback

LawrenceIntroScript:
	turnobject PLAYER, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	pause 15
	showtext LawrenceOverheardText
	applymovement VERMILIONCITY_LAWRENCE, LawrenceApproachMovementData
	playsound SFX_TACKLE
	applymovement VERMILIONCITY_LAWRENCE, LawrenceBumpMovementData
	showemote EMOTE_SHOCK, VERMILIONCITY_LAWRENCE, 15
	pause 15
	readvar VAR_XCOORD
	ifequalfwd 18, .left
	applymovement VERMILIONCITY_LAWRENCE, LawrenceWalkAroundRightMovementData
	turnobject PLAYER, LEFT
	sjumpfwd .continue

.left
	applymovement VERMILIONCITY_LAWRENCE, LawrenceWalkAroundLeftMovementData
	turnobject PLAYER, RIGHT
.continue
	playmusic MUSIC_ZINNIA_ENCOUNTER_ORAS
	showtext LawrenceIntroText
	applymovement VERMILIONCITY_LAWRENCE, LawrenceWalkAwayMovementData
	disappear VERMILIONCITY_LAWRENCE
	setscene SCENE_VERMILIONCITY_NOOP
	setevent EVENT_TELEPORT_GUY
	setflag ENGINE_FLYPOINT_VERMILION
	special RestartMapMusic
	end

LawrenceWalkAwayMovementData:
	step_down
	step_down
LawrenceApproachMovementData:
	step_down
	step_down
	step_down
	step_end

LawrenceBumpMovementData:
	fix_facing
	run_step_up
	remove_fixed_facing
	step_sleep_8
	step_sleep_8
	step_end

LawrenceWalkAroundLeftMovementData:
	step_right
	step_down
	step_down
	turn_head_left
	step_end

LawrenceWalkAroundRightMovementData:
	step_left
	step_down
	step_down
	turn_head_right
	step_end

VermilionSnorlax:
	opentext
	special SpecialSnorlaxAwake
	iftruefwd .Awake
	jumpthisopenedtext

	; GSC-DE Dump 7035
	text "RELAXO schläft"
	line "friedlich…"
	done


.Awake:
	writetext VermilionCityRadioNearSnorlaxText
	pause 15
	cry SNORLAX
	closetext
	loadvar VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon SNORLAX, 60
	startbattle
	disappear VERMILIONCITY_BIG_SNORLAX
	setevent EVENT_FOUGHT_SNORLAX
	reloadmapafterbattle
	end

VermilionGymBadgeGuy:
	checkevent EVENT_GOT_BOTTLE_CAP_FROM_VERMILION_GUY
	iftrue_jumptextfaceplayer VermilionCityBadgeGuyBattleEdgeText
	readvar VAR_BADGES
	ifequalfwd 16, .AllBadges
	ifgreater 13, .MostBadges
	ifgreater 9, .SomeBadges
	jumpthistextfaceplayer

	; GSC-DE Dump 7037
	text "In KANTO treffen"
	line "sich talentierte"
	cont "Trainer."

	para "ARENALEITER sind"
	line "besonders stark."

	para "Es ist nicht"
	line "leicht, sie zu"
	cont "besiegen."
	done






.SomeBadges:
	jumpthistextfaceplayer

	; GSC-DE Dump 7038
	text "Du sammelst ORDEN"
	line "der ARENEN in"
	cont "KANTO?"

	para "Findest du nicht"
	line "auch, dass die"
	cont "Trainer hier stark"
	cont "sind?"
	done
.MostBadges:
	jumpthistextfaceplayer

	; GSC-DE Dump 7039
	text "Ich schätze, du"
	line "hast diesen Wett-"
	cont "kampf der ARENEN"
	cont "in KANTO bald"
	cont "beendet."

	para "Lass mich wissen,"
	line "wenn du alle acht"
	cont "ORDEN hast."
	done
.AllBadges:
	faceplayer
	opentext
	writetext VermilionCityBadgeGuyAllBadgesText
	promptbutton
	verbosegiveitem BOTTLE_CAP
	iffalse_endtext
	setevent EVENT_GOT_BOTTLE_CAP_FROM_VERMILION_GUY
	writetext VermilionCityBadgeGuyBattleEdgeText
	waitendtext

VermilionMachokeOwnerScript:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer VermilionMachokeOwnerText
	jumpthistextfaceplayer

	text "Meine #MON"
	line "bereiteten das"
	cont "Land"
	para "für dieses riesige"
	line "Gebäude vor!"
	para "Schade, dass die"
	line "Öffentlichkeit"
	cont "noch nicht rein"
	cont "darf …"
	done

VermilionCitySuperNerd2Script:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer VermilionCitySuperNerd2Text
	jumpthistextfaceplayer

	text "Die Kampffabrik"
	line "ist brandneu!"
	para "Aber sie braucht"
	line "enorm viel Strom …"
	para "Solange das"
	line "KRAFT-WERK offline"
	cont "ist, ist sie"
	cont "nutzlos!"
	done

VermilionCityBadgeGuyBattleEdgeText:
	; GSC-DE Dump 7041
	text "Es ist vorteil-"
	line "haft, wenn du"

	para "#MON verschie-"
	line "dener Elemente"
	cont "kämpfen lässt."

	para "Ich bin sicher,"
	line "dass die ORDEN der"
	cont "ARENEN in KANTO"
	cont "dir helfen werden."
	done






LawrenceOverheardText:
	text "…Das legendäre"
	line "#MON war nicht"
	cont "auf jener Insel…"

	para "Ich muss meine"
	line "Suche anderswo"
	cont "fortsetzen…"
	done

LawrenceIntroText:
	text "Lawrence: Bitte"
	line "entschuldige, dass"
	cont "ich dich"
	cont "angerempelt habe."
	para "Ich eile, meine"
	line "Sammlung zu"
	cont "vervollständigen."
	para "Ich bin Lawrence"
	line "III."
	para "Und du bist der"
	line "Liga-Champion?"
	para "… Nun, der Schein"
	line "trügt manchmal."
	para "Legendäre #MON"
	line "sind schon immer"
	cont "meine"
	cont "Leidenschaft."
	para "Ich fuhr mit der"
	line "SEAGALLOP-Fähre"
	cont "zur"
	para "Shamouti-Insel,"
	line "fand aber nicht,"
	cont "was ich suchte."
	para "Ach, du hast"
	line "#MON aus JOHTOs"
	cont "Legenden"
	cont "getroffen?"
	para "Dann kreuzen sich"
	line "unsere Wege"
	cont "vielleicht wieder"
	cont "als Sammler."
	para "Doch ich muss"
	line "weiter. Auf"
	cont "Wiedersehen!"
	done

VermilionCityTeacherText:
	; GSC-DE Dump 7030
	text "Der HAFEN von"
	line "ORANIA CITY ist"
	cont "das Tor KANTOs"
	cont "zum Meer."

	para "Hier legen Luxus-"
	line "dampfer aus aller"
	cont "Welt an."
	done






VermilionMachokeOwnerText:
	text "Meine #MON"
	line "bereiteten das"
	cont "Land"
	para "für dieses riesige"
	line "Gebäude vor!"
	para "Vor drei Jahren"
	line "war es noch ein"
	cont "MACHOLLO,"
	para "aber die"
	line "Anstrengung ließ"
	cont "es sich"
	cont "entwickeln!"
	done

VermilionMachokeText:
	; GSC-DE Dump 7032
	text "MACHOLLO: Guooh"
	line "gogogoh!"
	done

VermilionCitySuperNerdText:
	; GSC-DE Dump 7034
	text "Es gibt acht"
	line "ARENEN in KANTO."

	para "Das große Gebäude"
	line "ist die PKMN-ARENA"
	cont "von ORANIA CITY."
	done






VermilionCitySuperNerd2Text:
	text "Die Kampffabrik"
	line "ist brandneu, aber"
	para "Trainer aus fernen"
	line "Regionen"
	para "kommen schon, um"
	line "sich ihrer"
	cont "Herausforderung zu"
	cont "stellen!"
	done

VermilionCityOfficerFText:
	text "Der Generator des"
	line "KRAFTWERKS ist"
	para "abgeschaltet, also"
	line "ist es nicht"
	cont "sicher,"
	para "die Kampffabrik zu"
	line "öffnen."
	done

VermilionCityOfficerText:
	text "Tut mir leid, die"
	line "Kampffabrik ist"

	para "geschlossen, bis"
	line "das KRAFTWERK"
	cont "wieder läuft."
	done

VermilionCitySailorText:
	text "Nichts geht über"
	line "frische"
	cont "Meeresluft!"
	done


VermilionCityRadioNearSnorlaxText:
	; GSC-DE Dump 7036
	text "Der #COM wird"
	line "in der Nähe des"
	cont "schlafenden"
	cont "RELAXOs platziert…"

	para "…"

	para "RELAXO ist"
	line "aufgewacht!"
	done






VermilionCityBadgeGuyAllBadgesText:
	; GSC-DE Dump 7040
	text "Gratuliere!"

	para "Du hast alle ORDEN"
	line "der ARENEN in"
	cont "KANTO."

	para "Ich habe hier eine"
	line "Belohnung für"
	cont "deine"
	cont "Anstrengungen."
	done






VermilionCitySignText:
	; GSC-DE Dump 7042
	text "ORANIA CITY"

	para "Der Hafen Der"
	line "Stimmungsvollen"
	cont "Sonnenuntergänge"
	done
VermilionGymSignText:
	; GSC-DE Dump 7043
	text "PKMN-ARENA von"
	line "ORANIA CITY"

	para "LEITUNG: MAJOR BOB"
	line "Der Blitzschnelle"

	para "Amerikaner"
	done






PokemonFanClubSignText:
	text "#MON-FANCLUB"

	para "Alle #MON-Fans"
	line "sind willkommen!"
	done






VermilionCityDiglettsCaveSignText:
	text "DIGDAs HÖHLE"
	done






VermilionCityPortSignText:
	text "EINGANG zum HAFEN"
	line "von ORANIA CITY"
	done






VermilionCityAdvancedTipsSignText:
	text "Profi-Tipps!"
	para "Deine Trainerkarte"
	line "hat Platz für"
	cont "sechzehn ORDEN!"
	done

VermilionCityBattleFactorySignText:
	text "KAMPF-FABRIK"

	para "Gewinne alles mit"
	line "Leih-#MON!"
	done
