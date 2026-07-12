Route42_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_ROUTE42_NOOP
	scene_const SCENE_ROUTE42_LYRA
	scene_const SCENE_ROUTE42_SUICUNE

	def_callbacks

	def_warp_events
	warp_event  0,  8, ROUTE_42_ECRUTEAK_GATE, 3
	warp_event  0,  9, ROUTE_42_ECRUTEAK_GATE, 4
	warp_event 10,  5, MOUNT_MORTAR_1F_OUTSIDE, 1
	warp_event 28,  9, MOUNT_MORTAR_1F_OUTSIDE, 2
	warp_event 46,  7, MOUNT_MORTAR_1F_OUTSIDE, 3
	warp_event 22, 10, HIDDEN_CAVE_GROTTO, 1

	def_coord_events
	coord_event 12,  6, SCENE_ROUTE42_LYRA, Route42LyraScript1
	coord_event 12,  7, SCENE_ROUTE42_LYRA, Route42LyraScript2
	coord_event 12,  8, SCENE_ROUTE42_LYRA, Route42LyraScript3
	coord_event 12,  9, SCENE_ROUTE42_LYRA, Route42LyraScript4
	coord_event 10,  6, SCENE_ROUTE42_LYRA, Route42LyraScript5
	coord_event 24, 14, SCENE_ROUTE42_SUICUNE, Route42SuicuneScript

	def_bg_events
	bg_event  4, 10, BGEVENT_JUMPTEXT, Route42Sign1Text
	bg_event  7,  5, BGEVENT_JUMPTEXT, MtMortarSign1Text
	bg_event 45,  9, BGEVENT_JUMPTEXT, MtMortarSign2Text
	bg_event 54,  8, BGEVENT_JUMPTEXT, Route42Sign2Text
	bg_event 16, 11, BGEVENT_ITEM + MAX_POTION, EVENT_ROUTE_42_HIDDEN_MAX_POTION
	bg_event 22,  9, BGEVENT_JUMPSTD, cavegrotto, HIDDENGROTTO_ROUTE_42

	def_object_events
	pokemon_event 26, 16, SUICUNE, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BLUE, ClearText, EVENT_SAW_SUICUNE_ON_ROUTE_42
	object_event 10,  5, SPRITE_LYRA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LYRA_ROUTE_42
	object_event 40, 10, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerFisherTully1, -1
	object_event 51,  9, SPRITE_HIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerHikerBenjamin, -1
	object_event 47,  8, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPokemaniacShane, -1
	object_event  2,  8, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route42OfficerText, EVENT_BEAT_JASMINE
	object_event  2,  9, SPRITE_OFFICER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route42OfficerText, EVENT_BEAT_JASMINE
	cuttree_event 24, 13, EVENT_ROUTE_42_CUT_TREE
	fruittree_event 27, 16, FRUITTREE_ROUTE_42_1, PNK_APRICORN, PAL_NPC_PINK
	fruittree_event 28, 16, FRUITTREE_ROUTE_42_2, GRN_APRICORN, PAL_NPC_GREEN
	fruittree_event 29, 16, FRUITTREE_ROUTE_42_3, YLW_APRICORN, PAL_NPC_ENV_YELLOW
	itemball_event  6,  4, ULTRA_BALL, 1, EVENT_ROUTE_42_ULTRA_BALL
	itemball_event 33,  8, SUPER_POTION, 1, EVENT_ROUTE_42_SUPER_POTION

	object_const_def
	const ROUTE42_SUICUNE
	const ROUTE42_LYRA

Route42LyraScript1:
	turnobject PLAYER, LEFT
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	pause 15
	playsound SFX_ENTER_DOOR
	appear ROUTE42_LYRA
	waitsfx
	applymovement ROUTE42_LYRA, MovementData_Route42LyraApproach1
	sjumpfwd Route42LyraScript

Route42LyraScript2:
	turnobject PLAYER, LEFT
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	pause 15
	playsound SFX_ENTER_DOOR
	appear ROUTE42_LYRA
	waitsfx
	applymovement ROUTE42_LYRA, MovementData_Route42LyraApproach2
	sjumpfwd Route42LyraScript

Route42LyraScript3:
	turnobject PLAYER, LEFT
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	pause 15
	playsound SFX_ENTER_DOOR
	appear ROUTE42_LYRA
	waitsfx
	applymovement ROUTE42_LYRA, MovementData_Route42LyraApproach3
	sjumpfwd Route42LyraScript

Route42LyraScript4:
	turnobject PLAYER, LEFT
	showemote EMOTE_SHOCK, PLAYER, 15
	playsound SFX_ENTER_DOOR
	appear ROUTE42_LYRA
	waitsfx
	applymovement ROUTE42_LYRA, MovementData_Route42LyraApproach4
	sjumpfwd Route42LyraScript

Route42LyraScript5:
	turnobject PLAYER, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	playsound SFX_ENTER_DOOR
	appear ROUTE42_LYRA
	waitsfx
	applymovement PLAYER, MovementData_Route42PlayerStepsBack
	applyonemovement ROUTE42_LYRA, step_down

Route42LyraScript:
	playmusic MUSIC_LYRA_ENCOUNTER_HGSS
	showtext Route42LyraGreetingText
	setevent EVENT_LYRA_ROUTE_42
	winlosstext Route42LyraWinText, Route42LyraLossText
	setlasttalked ROUTE42_LYRA
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftruefwd .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftruefwd .Chikorita
	loadtrainer LYRA1, LYRA1_7
	sjumpfwd .AfterBattle

.Totodile:
	loadtrainer LYRA1, LYRA1_8
	sjumpfwd .AfterBattle

.Chikorita:
	loadtrainer LYRA1, LYRA1_9
.AfterBattle
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	special DeleteSavedMusic
	playmusic MUSIC_LYRA_DEPARTURE_HGSS
	opentext
	writetext Route42LyraPresentText
	promptbutton
	verbosegivetmhm HM_WHIRLPOOL
	setevent EVENT_GOT_HM05_WHIRLPOOL
	writetext Route42LyraWhirlpoolText
	waitbutton
	closetext
	applymovement ROUTE42_LYRA, MovementData_Route42LyraLeave
	disappear ROUTE42_LYRA
	checkevent EVENT_SAW_SUICUNE_ON_ROUTE_42
	iftruefwd .NoSuicune
	setscene SCENE_ROUTE42_SUICUNE
	sjumpfwd .Finish
.NoSuicune
	setscene SCENE_ROUTE42_NOOP
.Finish
	playmapmusic
	end

Route42SuicuneScript:
	showemote EMOTE_SHOCK, PLAYER, 15
	pause 15
	playsound SFX_WARP_FROM
	applymovement ROUTE42_SUICUNE, Route42SuicuneMovement
	disappear ROUTE42_SUICUNE
	pause 10
	setscene SCENE_ROUTE42_NOOP
	clearevent EVENT_SAW_SUICUNE_ON_ROUTE_36
	setmapscene ROUTE_36, SCENE_ROUTE36_SUICUNE
	end

TrainerFisherTully1:
	trainer FISHER, TULLY1, EVENT_BEAT_FISHER_TULLY, FisherTully1SeenText, FisherTully1BeatenText, 0, FisherTully1Script

FisherTully1Script:
	loadvar VAR_CALLERID, PHONE_FISHER_TULLY
	opentext
	checkflag ENGINE_TULLY_READY_FOR_REMATCH
	iftruefwd .WantsBattle
	checkflag ENGINE_TULLY_HAS_WATER_STONE
	iftruefwd .HasWaterStone
	checkcellnum PHONE_FISHER_TULLY
	iftruefwd .NumberAccepted
	checkevent EVENT_TULLY_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskedAlready
	writetext FisherTullyAfterBattleText
	promptbutton
	setevent EVENT_TULLY_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjumpfwd .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_FISHER_TULLY
	ifequalfwd $1, .PhoneFull
	ifequalfwd $2, .NumberDeclined
	gettrainername FISHER, TULLY1, STRING_BUFFER_3
	scall .RegisteredNumber
	sjumpfwd .NumberAccepted

.WantsBattle:
	scall .Rematch
	winlosstext FisherTully1BeatenText, 0
	readmem wTullyFightCount
	ifequalfwd 3, .Fight3
	ifequalfwd 2, .Fight2
	ifequalfwd 1, .Fight1
	ifequalfwd 0, .LoadFight0
.Fight3:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .LoadFight3
.Fight2:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd .LoadFight2
.Fight1:
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftruefwd .LoadFight1
.LoadFight0:
	loadtrainer FISHER, TULLY1
	startbattle
	reloadmapafterbattle
	loadmem wTullyFightCount, 1
	clearflag ENGINE_TULLY_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer FISHER, TULLY2
	startbattle
	reloadmapafterbattle
	loadmem wTullyFightCount, 2
	clearflag ENGINE_TULLY_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer FISHER, TULLY3
	startbattle
	reloadmapafterbattle
	loadmem wTullyFightCount, 3
	clearflag ENGINE_TULLY_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer FISHER, TULLY4
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_TULLY_READY_FOR_REMATCH
	end

.HasWaterStone:
	scall .Gift
	verbosegiveitem WATER_STONE
	iffalsefwd .NoRoom
	clearflag ENGINE_TULLY_HAS_WATER_STONE
	setevent EVENT_TULLY_GAVE_WATER_STONE
	sjumpfwd .NumberAccepted

.NoRoom:
	sjumpfwd .PackFull

.AskNumber1:
	jumpstd asknumber1m

.AskNumber2:
	jumpstd asknumber2m

.RegisteredNumber:
	jumpstd registerednumberm

.NumberAccepted:
	jumpstd numberacceptedm

.NumberDeclined:
	jumpstd numberdeclinedm

.PhoneFull:
	jumpstd phonefullm

.Rematch:
	jumpstd rematchm

.Gift:
	jumpstd giftm

.PackFull:
	jumpstd packfullm

GenericTrainerHikerBenjamin:
	generictrainer HIKER, BENJAMIN, EVENT_BEAT_HIKER_BENJAMIN, HikerBenjaminSeenText, HikerBenjaminBeatenText

	text "Schaut man auf, in"
	line "dieses"
	cont "überwältigend"
	cont "schöne Blau"

	para "des Himmels, dann"
	line "verliert eine"
	cont "Niederlage völlig"
	cont "an Bedeutung!"
	done
GenericTrainerPokemaniacShane:
	generictrainer POKEMANIAC, SHANE, EVENT_BEAT_POKEMANIAC_SHANE, PokemaniacShaneSeenText, PokemaniacShaneBeatenText

	text "Du erstellst einen"
	line "#dex?"

	para "Wow, du kennst"
	line "bestimmt einige"
	cont "sehr seltene"
	cont "#mon!"

	para "Darf ich bitte mal"
	line "eines sehen?"
	done
MovementData_Route42LyraApproach4:
	step_down
MovementData_Route42LyraApproach3:
	step_down
MovementData_Route42LyraApproach2:
	step_down
MovementData_Route42LyraApproach1:
	step_down
	step_right
	step_end

MovementData_Route42PlayerStepsBack:
	fix_facing
	step_down
	remove_fixed_facing
	step_end

MovementData_Route42LyraLeave:
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

Route42SuicuneMovement:
	fix_facing
	fast_jump_step_up
	fast_jump_step_up
	fast_jump_step_up
	fast_jump_step_right
	fast_jump_step_right
	fast_jump_step_right
	step_end

Route42LyraGreetingText:
	text "Lyra: Hallo,"
	line "<PLAYER>!"

	para "Was für ein"
	line "Zufall. Ich hab"

	para "gerade die"
	line "Auswirkungen der"

	para "letzten Lawine auf"
	line "wilde #mon"
	cont "untersucht."

	para "Du gehst nach"
	line "MAHAGONIA CITY"

	para "für einen neuen"
	line "ORDEN?"

	para "Dann hab ich ein"
	line "Geschenk für dich!"

	para "Aber du musst mich"
	line "erst besiegen!"
	done

Route42LyraWinText:
	text "Du hast dir das"
	line "Geschenk verdient!"
	done

Route42LyraLossText:
	text "Viel Glück beim"
	line "nächsten Mal…"
	done

Route42LyraPresentText:
	text "Lyra: Wow, du"
	line "wirst echt stark,"
	cont "<PLAYER>!"

	para "Ich bin sicher, du"
	line "schaffst die"
	cont "MAHAGONIA-ARENA."

	para "Und dann kannst du"
	line "das hier"
	cont "einsetzen!"
	done

Route42LyraWhirlpoolText:
	text "Lyra: Das ist"
	line "Strudel."

	para "Bring es einem"
	line "#mon bei, um"
	cont "wildes Wasser zu"
	cont "überqueren."

	para "Ich muss los. War"
	line "schön, dich zu"
	cont "sehen, <PLAYER>!"

	para "Tschüss!"
	done

FisherTully1SeenText:
	text "Jetzt demonstriere"
	line "ich dir die Kraft"
	cont "des #mon, das"
	cont "ich gefangen habe!"
	done
FisherTully1BeatenText:
	text "Was? Das kann"
	line "nicht sein."
	done
FisherTullyAfterBattleText:
	text "Mit dem #mon,"
	line "das ich gefangen"

	para "habe, möchte ich"
	line "der CHAMP der"
	cont "Trainer werden."

	para "Das ist das Beste"
	line "am Angeln!"
	done



HikerBenjaminSeenText:
	text "Ach, ist das"
	line "schön, im Freien"
	cont "zu sein! Ich fühle"
	cont "mich so frei!"
	done



HikerBenjaminBeatenText:
	text "Hahaha!"
	done



PokemaniacShaneSeenText:
	text "HEH!"

	para "Das ist mein"
	line "Geheimversteck!"
	cont "Verschwinde, du"
	cont "Außenseiter!"
	done



PokemaniacShaneBeatenText:
	text "Ich hätte meinen"
	line "MONDSTEIN benutzen"
	cont "sollen…"
	done



Route42OfficerText:
	text "Tut mir leid, du"
	line "kannst hier nicht"
	cont "durch."

	para "Auf dem KESSEL-"
	line "BERG gab es eine"
	cont "Lawine."

	para "Wir räumen noch"
	line "den Schutt auf."
	done

Route42Sign1Text:
	text "ROUTE 42"

	para "TEAK CITY -"
	line "MAHAGONIA CITY"
	done



MtMortarSign1Text:
	text "KESSELBERG"

	para "WASSERFALL-HÖHLE"
	line "Geradeaus"
	done



MtMortarSign2Text:
	text "KESSELBERG"

	para "WASSERFALL-HÖHLE"
	line "Voraus"
	done



Route42Sign2Text:
	text "ROUTE 42"

	para "TEAK CITY -"
	line "MAHAGONIA CITY"
	done



