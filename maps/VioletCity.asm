VioletCity_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, VioletCityFlyPoint

	def_warp_events
	warp_event  9, 17, VIOLET_MART, 2
	warp_event 18, 17, VIOLET_GYM, 1
	warp_event 30, 17, EARLS_POKEMON_ACADEMY, 1
	warp_event  3, 15, VIOLET_NICKNAME_SPEECH_HOUSE, 1
	warp_event 31, 25, VIOLET_POKECENTER_1F, 1
	warp_event 21, 29, VIOLET_ONIX_TRADE_HOUSE, 1
	warp_event 23,  1, SPROUT_TOWER_1F, 1
	warp_event 39, 24, ROUTE_31_VIOLET_GATE, 1
	warp_event 39, 25, ROUTE_31_VIOLET_GATE, 2
	warp_event  2,  8, ROUTE_36_VIOLET_GATE, 3
	warp_event  2,  9, ROUTE_36_VIOLET_GATE, 4

	def_coord_events

	def_bg_events
	bg_event 24, 20, BGEVENT_JUMPTEXT, VioletCitySignText
	bg_event 15, 17, BGEVENT_JUMPTEXT, VioletGymSignText
	bg_event 25,  3, BGEVENT_JUMPTEXT, SproutTowerSignText
	bg_event 27, 17, BGEVENT_JUMPTEXT, EarlsPokemonAcademySignText
	bg_event 37, 14, BGEVENT_ITEM + HYPER_POTION, EVENT_VIOLET_CITY_HIDDEN_HYPER_POTION
	bg_event 21,  9, BGEVENT_ITEM + POKE_BALL, EVENT_VIOLET_CITY_HIDDEN_POKE_BALL

	def_object_events
	object_event 13, 16, SPRITE_FAT_GUY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VioletCityEarlScript, EVENT_VIOLET_CITY_EARL
	object_event 28, 28, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_WANDER, 2, 2, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletCityLassText, -1
	object_event 26, 14, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_WANDER, 2, 1, (1 << MORN) | (1 << DAY), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletCityCooltrainerM1Text, -1
	object_event 26, 14, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_WANDER, 2, 1, (1 << EVE) | (1 << NITE), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletCityCooltrainerFText, -1
	object_event 17, 20, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletCityGrampsText, -1
	object_event  5, 18, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletCityYoungsterText, -1
	object_event 26,  9, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletCityFisherText, -1
	object_event 35, 25, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletCityCooltrainerM2Text, -1
	cuttree_event 36, 19, EVENT_VIOLET_CITY_CUT_TREE
	fruittree_event 14, 29, FRUITTREE_VIOLET_CITY, CHERI_BERRY, PAL_NPC_RED
	itemball_event 14,  4, PP_UP, 1, EVENT_VIOLET_CITY_PP_UP
	itemball_event 35,  8, RARE_CANDY, 1, EVENT_VIOLET_CITY_RARE_CANDY

	object_const_def
	const VIOLETCITY_EARL

VioletCityFlyPoint:
	setflag ENGINE_FLYPOINT_VIOLET
	endcallback

VioletCityEarlScript:
	applymovement VIOLETCITY_EARL, VioletCitySpinningEarl_MovementData
	faceplayer
	opentext
	writetext Text_EarlAsksIfYouBeatFalkner
	yesorno
	iffalsefwd .FollowEarl
	jumpthisopenedtext

	text "Ohh, la la!"
	line "Wirklich sehr"
	cont "schön!"
	done





.FollowEarl:
	writetext Text_FollowEarl
	waitbutton
	closetext
	playmusic MUSIC_SHOW_ME_AROUND
	follow VIOLETCITY_EARL, PLAYER
	applymovement VIOLETCITY_EARL, VioletCityFollowEarl_MovementData
	turnobject PLAYER, UP
	applymovement VIOLETCITY_EARL, VioletCitySpinningEarl_MovementData
	stopfollow
	special RestartMapMusic
	opentext
	writetext Text_HereTeacherIAm
	promptbutton
	verbosegivekeyitem TYPE_CHART
	writetext Text_EarlsTypeChart
	waitbutton
	closetext
	applymovement VIOLETCITY_EARL, VioletCitySpinningEarl_MovementData
	applyonemovement VIOLETCITY_EARL, step_up
	playsound SFX_ENTER_DOOR
	disappear VIOLETCITY_EARL
	clearevent EVENT_EARLS_ACADEMY_EARL
	waitsfx
	end

VioletCityFollowEarl_MovementData:
	run_step_down
	run_step_down
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	run_step_down
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	run_step_up
	turn_head_down
	step_end

VioletCitySpinningEarl_MovementData:
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	step_end

Text_EarlAsksIfYouBeatFalkner:
	text "Allo!"
	line "Bist du ein"

	para "Trainer? Hast du"
	line "den ARENALEITER"
	cont "besiegt?"
	done






Text_FollowEarl:
	text "Aja? Dann lernen"
	line "sollst du!"
	cont "Folge mir!"
	done






Text_HereTeacherIAm:
	text "Isch bin eine"
	line "Lehrer. Es ist"
	cont "gut"
	cont "für disch, bei"
	cont "mir"
	cont "zu lernen!"
	done






Text_EarlsTypeChart:
	text "Im Kampf musst"
	line "du"
	cont "Typen-Vorteile"
	cont "kennen!"

	para "Schau jederzeit"
	line "auf diese"
	cont "Tabelle!"
	done

VioletCityLassText:
	text "Man sagt, dass"
	line "im"
	line "KNOFENSA-TURM"
	cont "Geister umgehen."

	para "#mon-Atta-"
	line "cken des Typs"
	cont "Nor-"
	cont "mal zeigen bei"

	para "Geistern keine"
	line "Wirkung."
	done






VioletCityCooltrainerM1Text:
	text "Hey, bist du ein"
	line "#mon-Trainer?"

	para "Schlägst du den"
	line "hiesigen ARENA-"
	cont "LEITER, dann"
	cont "darfst du dich"

	para "bald zur Elite"
	line "zählen!"
	done
VioletCityCooltrainerFText:
	text "Knofensa ist ein"
	line "beliebtes #mon"
	cont "in dieser Stadt."

	para "Gegen unseren"
	line "Arenaleiter"

	para "kommt er aber"
	line "nicht gut an…"
	done

VioletCityGrampsText:
	text "FALK von der"
	line "#mon-ARENA in"

	para "VIOLA CITY ist"
	line "ein großartiger"
	cont "Trainer!"

	para "Er hat die #mon-"
	line "ARENA seines Va-"
	cont "ters geerbt und"

	para "hat dort sehr"
	line "gute"
	line "Arbeit"
	cont "geleistet."
	done






VioletCityYoungsterText:
	text "Ich habe einen"
	line "wackeligen Baum"
	cont "gesehen!"

	para "Wenn du ihn be-"
	line "rührst, windet"
	cont "er"
	cont "sich und tanzt!"
	cont "Cool!"
	done






VioletCityFisherText:
	text "Wie kann so ein"
	line "wackeliges"
	cont "Gebäude"

	para "ein Erdbeben"
	line "überstehen? Ich"
	cont "muss was"
	cont "übersehen."
	done

VioletCityCooltrainerM2Text:
	text "Uns liegt viel"
	line "an den alten"
	cont "Gebäuden hier."

	para "Selbst der #-"
	line "MARKT und das"
	cont "#MON-CENTER"

	para "sind gedämpft"
	line "angemalt, damit"
	cont "sie sich"
	cont "einfügen."
	done

VioletCitySignText:
	text "VIOLA CITY"

	para "Die Stadt der"
	line "Nostalgie"
	done






VioletGymSignText:
	text "#mon-ARENA von"
	line "VIOLA CITY"

	para "LEITUNG: FALK"
	line "Der elegante"

	para "Meister der"
	line "Flug-"
	line "#mon"
	done






SproutTowerSignText:
	text "KNOFENSA-TURM"

	para "Erfahre die Art"
	line "der #mon"
	done






EarlsPokemonAcademySignText:
	text "EARLs #-"
	line "MON-AKADEMIE"
	done






