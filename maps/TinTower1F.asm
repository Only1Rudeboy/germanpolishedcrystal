TinTower1F_MapScriptHeader:
	def_scene_scripts
	scene_script TinTower1FSuicuneBattleScene, SCENE_TINTOWER1F_SUICUNE_BATTLE
	scene_const SCENE_TINTOWER1F_NOOP

	def_callbacks
	callback MAPCALLBACK_OBJECTS, TinTower1FNPCsCallback
	callback MAPCALLBACK_TILES, TinTower1FStairsCallback

	def_warp_events
	warp_event  7, 15, BELLCHIME_TRAIL, 3
	warp_event  8, 15, BELLCHIME_TRAIL, 3
	warp_event  8,  2, TIN_TOWER_2F, 2

	def_coord_events

	def_bg_events

	def_object_events
	pokemon_event  7,  9, SUICUNE, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BLUE, ClearText, EVENT_TIN_TOWER_1F_SUICUNE
	pokemon_event  5,  9, RAIKOU, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BROWN, ClearText, EVENT_TIN_TOWER_1F_RAIKOU
	pokemon_event 10,  9, ENTEI, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_RED, ClearText, EVENT_TIN_TOWER_1F_ENTEI
	object_event  6,  3, SPRITE_EUSINE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FEusineAfterHoOhScript, EVENT_TIN_TOWER_1F_EUSINE
	object_event  3,  9, SPRITE_ELDER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, TinTower1FSage1Text, EVENT_TIN_TOWER_1F_WISE_TRIO_1
	object_event  9, 11, SPRITE_ELDER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, TinTower1FSage2Text, EVENT_TIN_TOWER_1F_WISE_TRIO_1
	object_event 12,  6, SPRITE_ELDER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, TinTower1FSage3Text, EVENT_TIN_TOWER_1F_WISE_TRIO_1
	object_event  2,  2, SPRITE_ELDER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TinTower1FSage4Script, EVENT_TIN_TOWER_1F_WISE_TRIO_2
	object_event  7,  1, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TinTower1FSage5Script, EVENT_TIN_TOWER_1F_WISE_TRIO_2
	object_event 12,  2, SPRITE_ELDER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, TinTower1FSage6Script, EVENT_TIN_TOWER_1F_WISE_TRIO_2

	object_const_def
	const TINTOWER1F_SUICUNE
	const TINTOWER1F_RAIKOU
	const TINTOWER1F_ENTEI
	const TINTOWER1F_EUSINE
	const TINTOWER1F_SAGE1
	const TINTOWER1F_SAGE2
	const TINTOWER1F_SAGE3

TinTower1FSuicuneBattleScene:
	sdefer TinTower1FSuicuneBattleScript
	end



TinTower1FNPCsCallback:
	checkevent EVENT_GOT_RAINBOW_WING
	iftruefwd .GotRainbowWing
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalsefwd .FaceBeasts
	special SpecialBeastsCheck
	iffalsefwd .FaceBeasts
	clearevent EVENT_TIN_TOWER_1F_WISE_TRIO_2
	setevent EVENT_TIN_TOWER_1F_WISE_TRIO_1
.GotRainbowWing:
	checkevent EVENT_FOUGHT_HO_OH
	iffalsefwd .Done
	appear TINTOWER1F_EUSINE
.Done:
	endcallback

.FaceBeasts:
	checkevent EVENT_FOUGHT_SUICUNE
	iftruefwd .FoughtSuicune
	appear TINTOWER1F_SUICUNE
	checkflag ENGINE_PLAYER_CAUGHT_RAIKOU
	iftruefwd .NoRaikou
	appear TINTOWER1F_RAIKOU
	sjumpfwd .CheckEntei

.NoRaikou:
	disappear TINTOWER1F_RAIKOU
.CheckEntei:
	checkflag ENGINE_PLAYER_CAUGHT_ENTEI
	iftruefwd .NoEntei
	appear TINTOWER1F_ENTEI
	sjumpfwd .BeastsDone

.NoEntei:
	disappear TINTOWER1F_ENTEI
.BeastsDone:
	endcallback

.FoughtSuicune:
	disappear TINTOWER1F_SUICUNE
	disappear TINTOWER1F_RAIKOU
	disappear TINTOWER1F_ENTEI
	clearevent EVENT_TIN_TOWER_1F_WISE_TRIO_1
	setevent EVENT_TIN_TOWER_1F_WISE_TRIO_2
	endcallback

TinTower1FStairsCallback:
	checkevent EVENT_GOT_RAINBOW_WING
	iftruefwd .DontHideStairs
	changeblock 8, 2, $9
.DontHideStairs:
	endcallback

TinTower1FSuicuneBattleScript:
	applymovement PLAYER, TinTowerPlayerMovement1
	pause 15
	checkflag ENGINE_PLAYER_CAUGHT_RAIKOU
	iftruefwd .Next1 ; if player caught Raikou, he doesn't appear in Tin Tower
	applymovement TINTOWER1F_RAIKOU, TinTower1FRaikouApproachesMovement
	turnobject PLAYER, LEFT
	cry RAIKOU
	pause 10
	playsound SFX_WARP_FROM
	applymovement TINTOWER1F_RAIKOU, TinTower1FRaikouLeavesMovement
	disappear TINTOWER1F_RAIKOU
	playsound SFX_EXIT_BUILDING
	waitsfx
.Next1:
	checkflag ENGINE_PLAYER_CAUGHT_ENTEI
	iftruefwd .Next2 ; if player caught Entei, he doesn't appear in Tin Tower
	applymovement TINTOWER1F_ENTEI, TinTower1FEnteiApproachesMovement
	turnobject PLAYER, RIGHT
	cry ENTEI
	pause 10
	playsound SFX_WARP_FROM
	applymovement TINTOWER1F_ENTEI, TinTower1FEnteiLeavesMovement
	disappear TINTOWER1F_ENTEI
	playsound SFX_EXIT_BUILDING
	waitsfx
.Next2:
	turnobject PLAYER, UP
	pause 10
	applymovement PLAYER, TinTower1FPlayerBacksUpMovement
	applymovement TINTOWER1F_SUICUNE, TinTower1FSuicuneApproachesMovement
	cry SUICUNE
	pause 20
	loadwildmon SUICUNE, 40
	loadvar VAR_BATTLETYPE, BATTLETYPE_LEGENDARY
	startbattle
	dontrestartmapmusic
	disappear TINTOWER1F_SUICUNE
	setevent EVENT_FOUGHT_SUICUNE
	setevent EVENT_SAW_SUICUNE_ON_ROUTE_42
	setmapscene ROUTE_42, SCENE_ROUTE42_NOOP
	setevent EVENT_SAW_SUICUNE_ON_ROUTE_36
	setmapscene ROUTE_36, SCENE_ROUTE36_NOOP
	setevent EVENT_SAW_SUICUNE_AT_CIANWOOD_CITY
	setmapscene CIANWOOD_CITY, SCENE_CIANWOODCITY_NOOP
	setscene SCENE_TINTOWER1F_NOOP
	clearevent EVENT_EUSINES_HOUSE_EUSINE
	reloadmapafterbattle
	special CheckBattleCaughtResult
	iffalsefwd .nocatch
	setflag ENGINE_PLAYER_CAUGHT_SUICUNE
.nocatch
	turnobject PLAYER, DOWN
	pause 20
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
	playsound SFX_ENTER_DOOR
	moveobject TINTOWER1F_EUSINE, 8, 15
	appear TINTOWER1F_EUSINE
	applymovement TINTOWER1F_EUSINE, TinTower1FEusineEntersMovement
	playsound SFX_ENTER_DOOR
	moveobject TINTOWER1F_SAGE1, 7, 15
	appear TINTOWER1F_SAGE1
	applymovement TINTOWER1F_SAGE1, TinTower1FSage1EntersMovement
	playsound SFX_ENTER_DOOR
	moveobject TINTOWER1F_SAGE2, 7, 15
	appear TINTOWER1F_SAGE2
	applymovement TINTOWER1F_SAGE2, TinTower1FSage2EntersMovement
	playsound SFX_ENTER_DOOR
	moveobject TINTOWER1F_SAGE3, 7, 15
	appear TINTOWER1F_SAGE3
	applymovement TINTOWER1F_SAGE3, TinTower1FSage3EntersMovement
	moveobject TINTOWER1F_SAGE1, 5, 13
	moveobject TINTOWER1F_SAGE2, 7, 13
	moveobject TINTOWER1F_SAGE3, 9, 13
	turnobject PLAYER, RIGHT
	showtext TinTowerEusineSuicuneText
	applymovement TINTOWER1F_EUSINE, TinTower1FEusineLeavesMovement
	playsound SFX_EXIT_BUILDING
	disappear TINTOWER1F_EUSINE
	waitsfx
	special Special_FadeOutMusic
	pause 20
	playmapmusic
	end

TinTower1FSage4Script:
	checkevent EVENT_FOUGHT_HO_OH
	iftruefwd .FoughtHoOh
	jumpthistextfaceplayer

	text "Es scheint, als ob"
	line "HO-OH vom ZINNTURM"
	para "heruntergekommen"
	line "ist!"
	done

.FoughtHoOh:
	jumpthistextfaceplayer

	text "Die legendären"
	line "#mon sollen"
	para "die drei Mächte"
	line "verkörpern …"
	para "Die Blitze, die im"
	line "TURM einschlugen."
	para "Das Feuer, das den"
	line "TURM zerstörte."
	para "Und den Regen, der"
	line "das Feuer löschte"
	cont "…"
	done

TinTower1FSage5Script:
	faceplayer
	opentext
	checkevent EVENT_FOUGHT_HO_OH
	iftruefwd .FoughtHoOh
	checkevent EVENT_GOT_RAINBOW_WING
	iftruefwd .GotRainbowWing
	writetext TinTower1FSage5Text1
	promptbutton
	verbosegivekeyitem RAINBOW_WING
	closetext
	reanchormap
	earthquake 72
	waitsfx
	playsound SFX_STRENGTH
	changeblock 8, 2, $20
	refreshmap
	setevent EVENT_GOT_RAINBOW_WING
	closetext
	opentext
.GotRainbowWing:
	jumpthisopenedtext

	text "Geh nun!"
	done
.FoughtHoOh:
	jumpthisopenedtext

	text "Als das legendäre"
	line "#mon erschien …"
	para "Diejenigen, die"
	line "ihrem Aufstieg"
	para "beiwohnten, wurden"
	line "Zeugen ihres"
	cont "Terrors."
	para "Und …"
	para "Einige griffen zu"
	line "sinnlosen"
	cont "Attacken."
	para "Die legendären"
	line "#mon,"
	cont "wohlwissend ob"
	cont "ihrer"
	para "Kraft, flohen und"
	line "ignorierten die"
	cont "geängstigten"
	cont "Menschen."
	done

TinTower1FSage6Script:
	checkevent EVENT_FOUGHT_HO_OH
	iftruefwd .FoughtHoOh
	jumpthistextfaceplayer

	text "Ich glaube, du"
	line "wirst geprüft."
	para "Sprenge die Ketten"
	line "der Unsicherheit"
	cont "von deinem"
	cont "Verstand und"
	cont "schreite voran."
	done
.FoughtHoOh:
	jumpthistextfaceplayer

	text "Von den legendären"
	line "#mon soll"
	para "SUICUNE die"
	line "stärkste Bindung"
	cont "zu HO-OH haben."
	para "Ich habe gehört,"
	line "dass es auch eine"
	para "Verbindung zu"
	line "einem #mon"
	cont "namens ICOGNITO"
	cont "gibt."
	para "ICOGNITO muss"
	line "einen kooperativen"
	para "Bund mit SUICUNE"
	line "haben."
	done
TinTower1FEusineAfterHoOhScript:
	faceplayer
	showtext TinTowerEusineHoOhText
	readvar VAR_FACING
	ifnotequal RIGHT, .PathClear
	applymovement PLAYER, .PlayerStepsAsideMovement
.PathClear:
	applymovement TINTOWER1F_EUSINE, .EusineLeavesAfterHoOhMovement
	disappear TINTOWER1F_EUSINE
	end

.PlayerStepsAsideMovement:
	step_up
	turn_head_left
	step_end

.EusineLeavesAfterHoOhMovement:
	step_left
	step_left
	step_left
	step_down
	step_down
	step_down
	step_down
	step_end

TinTowerPlayerMovement1:
	slow_step_up
	slow_step_up
	slow_step_up
	slow_step_up
	step_end

TinTower1FRaikouApproachesMovement:
	fix_facing
	fast_jump_step_down
	step_end

TinTower1FRaikouLeavesMovement:
	fix_facing
	fast_jump_step_down
	fast_jump_step_right
	fast_jump_step_down
	step_end

TinTower1FEnteiApproachesMovement:
	fix_facing
	fast_jump_step_down
	step_end

TinTower1FEnteiLeavesMovement:
	fix_facing
	fast_jump_step_down
	fast_jump_step_left
	fast_jump_step_down
	step_end

TinTower1FSuicuneApproachesMovement:
	fix_facing
	fast_jump_step_down
	step_end

TinTower1FPlayerBacksUpMovement:
	fix_facing
	run_step_down
	remove_fixed_facing
	step_end

TinTower1FEusineEntersMovement:
	step_up
	step_up
	step_up
	turn_head_left
	step_end

TinTower1FEusineLeavesMovement:
	step_down
	step_down
	step_down
	step_end

TinTower1FSage1EntersMovement:
	step_up
	step_up
	step_left
	step_left
	turn_head_up
	step_end

TinTower1FSage2EntersMovement:
	step_up
	step_up
	step_end

TinTower1FSage3EntersMovement:
	step_up
	step_right
	step_right
	step_up
	step_end

TinTowerEusineSuicuneText:
	text "EUSIN: Wahnsinn!"
	line "Einfach Wahnsinn!"
	para "Einen derartigen"
	line "Kampf habe ich"
	cont "noch nie gesehen."
	para "Das hat mich sehr"
	line "beeindruckt."
	para "SUICUNE war stark,"
	line "aber du warst noch"
	para "unglaublicher,"
	line "<PLAYER>."
	para "Ich hörte, dass"
	line "SUICUNEs mystische"
	para "Kraft ein"
	line "regenbogenfarbenes"
	cont "#mon"
	para "Vielleicht zeigt"
	line "sich #mon, nach"
	cont "dem, was"
	para "sich heute"
	line "ereignete."
	para "Ich werde diese"
	line "Legende noch"
	cont "einmal nachlesen."
	para "Danke, dass ich"
	line "diesem Spitzen-"
	para "kampf beiwohnen"
	line "durfte."
	para "Bis dann,"
	done
TinTower1FSage1Text:
	text "Die Legende besagt"
	line "…"
	para "Kommunizieren die"
	line "Seelen von #mon"
	para "und Menschen,"
	line "kommt ein"
	cont "regenbogenfarbenes"
	para "#mon vom Himmel"
	line "herab …"
	para "Könnte das"
	line "bedeuten, dass die"
	para "legendären #mon"
	line "uns Menschen auf"
	cont "die Probe stellen?"
	done



TinTower1FSage2Text:
	text "Als der BRONZETURM"
	line "abbrannte, sollen"
	para "drei namenlose"
	line "#mon im Feuer"
	para "umgekommen sein."
	line "Eine Tragödie."
	para "Jedoch …"
	para "Ein"
	line "regenbogenfarbenes"
	cont "#mon …"
	para "Genauer gesagt …"
	para "HO-OH kam vom"
	line "Himmel herab und"
	para "erweckte die drei"
	line "#mon wieder zum"
	cont "Leben."
	para "Es sind …"
	para "SUICUNE, ENTEI und"
	line "RAIKOU."
	para "So lautet die"
	line "Legende."
	done



if DEF(FAITHFUL)
	text "Als der BRONZE-"
	done
else
	text "Als der GONG-"
	done
endc
	line "TURM abbrannte,"
	cont "sollen"

	para "drei namenlose"
	line "#mon im Feuer"

	para "umgekommen sein."
	line "Eine Tragödie."

	para "Jedoch…"

	para "Ein regenbogen-"
	line "farbenes #mon…"

	para "Genauer gesagt…"

	para "HO-OH kam vom"
	line "Himmel herab und"

	para "erweckte die drei"
	line "#mon wieder zum"
	cont "Leben."

	para "Es sind…"

	para "SUICUNE, ENTEI"
	line "RAIKOU."

	para "So lautet die"
	line "Legende."
	done
TinTower1FSage3Text:
	text "Die beiden TÜRME"
	line "wurden errichtet,"
	para "um Freundschaft"
	line "und Hoffnung"
	para "zwischen #mon"
	line "und den Menschen"
	cont "zu festigen."
	para "Das war vor 700"
	line "Jahren, aber diese"
	cont "Maxime ist noch"
	cont "heute gültig."
	done



TinTower1FSage5Text1:
	text "Dies wird dich"
	line "schützen. Nimm es!"
	done



TinTowerEusineHoOhText:
	text "EUSIN: Ich wusste"
	line "es."
	para "Ich wusste, du"
	line "würdest das"
	para "regenbogenfarbene"
	line "#mon sehen,"
	cont "<PLAYER>."
	para "Es geschah genau"
	line "so, wie ich es mir"
	cont "vorgestellt habe."
	para "Meine Forschung"
	line "ist gar nicht"
	cont "schlecht, würde"
	cont "ich sagen."
	para "Ich werde #mon"
	line "weiter studieren"
	para "und ein berühmter"
	line "#Maniac werden!"
	para "Wenn du mal in"
	line "PRISMANIA CITY"
	para "bist, sagst du"
	line "hallo zu meinem"
	cont "Opa?"
	para "Ihm würde die"
	line "Gesellschaft gut"
	cont "tun, während ich"
	cont "weg bin."
	para "Bis dann,"
	done
