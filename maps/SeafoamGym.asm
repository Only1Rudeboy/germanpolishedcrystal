SeafoamGym_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 12, 20, SEAFOAM_ISLANDS_1F, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event 10, 20, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SeafoamGymGuyScript, EVENT_SEAFOAM_GYM_GYM_GUY
	object_event  7, 16, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerScientistLowell, -1
	object_event 14, 14, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerScientistDennett, -1
	object_event 19, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSupernerdCary, -1
	object_event 12,  7, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_DARK_BLUE, OBJECTTYPE_TRAINER, 1, TrainerScientistLinden, -1
	object_event 10,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSupernerdWaldo, -1
	object_event  6, 14, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSupernerdMerle, -1
	object_event 12, 11, SPRITE_BLAINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamGymBlaineScript, -1

	object_const_def
	const SEAFOAMGYM_GYM_GUY

GenericTrainerScientistLowell:
	generictrainer SCIENTIST, LOWELL, EVENT_BEAT_SCIENTIST_LOWELL, ScientistLowellSeenText, ScientistLowellBeatenText

	; PC (class C)
	text "In einer Höhle,"
	line "aber wir waschen"
	cont "immer die Wäsche."
	done

GenericTrainerScientistDennett:
	generictrainer SCIENTIST, DENNETT, EVENT_BEAT_SCIENTIST_DENNETT, ScientistDennettSeenText, ScientistDennettBeatenText

	; PC (class C)
	text "Mit PYRO bauen wir"
	line "unsere ARENA"
	cont "wieder auf!"
	done

GenericTrainerSupernerdCary:
	generictrainer SUPER_NERD, CARY, EVENT_BEAT_SUPER_NERD_CARY, SupernerdCarySeenText, SupernerdCaryBeatenText

	; PC (class C)
	text "Bitterkeit führt"
	line "zu Verbesserung."
	done

TrainerScientistLinden:
	trainer SCIENTIST, LINDEN, EVENT_BEAT_SCIENTIST_LINDEN, ScientistLindenSeenText, ScientistLindenBeatenText, 0, .Script, TRAINERPAL_DARK_SCIENTIST

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	; PC (class C)
	text "Nicht alle"
	line "Forscher helfen"
	cont "den Bösen."
	done

GenericTrainerSupernerdWaldo:
	generictrainer SUPER_NERD, WALDO, EVENT_BEAT_SUPER_NERD_WALDO, SupernerdWaldoSeenText, SupernerdWaldoBeatenText

	; PC (class C)
	text "Wer zum Teufel"
	line "bist du?"
	done

GenericTrainerSupernerdMerle:
	generictrainer SUPER_NERD, MERLE, EVENT_BEAT_SUPER_NERD_MERLE, SupernerdMerleSeenText, SupernerdMerleBeatenText

	; PC (class C)
	text "Ich hab deine"
	line "Stärke nicht"
	cont "gespürt."
	done

SeafoamGymBlaineScript:
	faceplayer
	opentext
	checkflag ENGINE_VOLCANOBADGE
	iftruefwd .FightDone
	writetext BlaineIntroText
	waitbutton
	closetext
	winlosstext BlaineWinLossText, 0
	loadtrainer BLAINE, 1
	startbattle
	reloadmapafterbattle
	iftruefwd .ReturnAfterBattle
	appear SEAFOAMGYM_GYM_GUY
.ReturnAfterBattle:
	setevent EVENT_BEAT_BLAINE
	setevent EVENT_BEAT_SCIENTIST_LOWELL
	setevent EVENT_BEAT_SCIENTIST_DENNETT
	setevent EVENT_BEAT_SUPER_NERD_CARY
	setevent EVENT_BEAT_SCIENTIST_LINDEN
	setevent EVENT_BEAT_SUPER_NERD_WALDO
	setevent EVENT_BEAT_SUPER_NERD_MERLE
	opentext
	givebadge VOLCANOBADGE, KANTO_REGION
	callstd kantopostgymevents
.FightDone:
	checkevent EVENT_GOT_TM61_WILL_O_WISP
	iftrue_jumpopenedtext BlaineFightDoneText
	writetext BlaineAfterBattleText
	promptbutton
	verbosegivetmhm TM_WILL_O_WISP
	setevent EVENT_GOT_TM61_WILL_O_WISP
	jumpthisopenedtext

	; PC TM + GSC-DE Dump rematch
	text "Die Attacke heißt"
	line "Irrlicht!"
	para "Sie schwächt den"
	line "Gegner mit einer"
	cont "Verbrennung."
	para "Diesmal habe ich"
	line "verloren, aber"
	para "beim nächsten Mal"
	line "werde ich"
	cont "gewinnen."
	para "Ich werde meine"
	line "PKMN-ARENA auf der"
	para "ZINNOBERINSEL"
	line "wieder aufbauen"
	cont "und dann wirst du"
	cont "erneut gegen mich"
	cont "antreten."
	done

SeafoamGymGuyScript:
	checkevent EVENT_TALKED_TO_SEAFOAM_GYM_GUY_ONCE
	iftrue_jumptextfaceplayer SeafoamGymGuyWinText2
	setevent EVENT_TALKED_TO_SEAFOAM_GYM_GUY_ONCE
	jumpthistextfaceplayer

	; GSC-DE Dump
	text "Jawohl!"
	para "…Huh? Es ist"
	line "schon vorüber?"
	para "Sorry, Kumpel!"
	para "Die PKMN-ARENA auf"
	line "der ZINNOBERINSEL"
	para "existiert nicht"
	line "mehr und ich"
	cont "wusste nicht, wo"
	cont "du steckst."
	para "Aber egal! Du"
	line "bist auch ohne"
	para "meinen Ratschlag"
	line "zurechtgekommen."
	cont "Ich wusste, du"
	cont "würdest gewinnen."
	done

ScientistLowellSeenText:
	; PC (class C)
	text "Dieser Laborkittel"
	line "macht mich"
	cont "irgendwie"
	cont "schlauer."
	done

ScientistLowellBeatenText:
	; PC (class C)
	text "Ein weißer Kittel"
	line "ist das Leben"
	cont "eines Forschers."
	done

ScientistDennettSeenText:
	; PC (class C)
	text "PYRO hat seine"
	line "ARENA verloren,"
	cont "aber er gibt nie"
	cont "auf!"
	done

ScientistDennettBeatenText:
	; PC (class C)
	text "PYROs Ausdauer"
	line "motiviert mich!"
	done

SupernerdCarySeenText:
	; PC (class C)
	text "Wow, eine ARENA in"
	line "so einer Höhle?"
	para "Die würde ich gern"
	line "erkunden."
	done

SupernerdCaryBeatenText:
	; PC (class C)
	text "Eine bittere"
	line "Niederlage…"
	done

ScientistLindenSeenText:
	; PC (class C)
	text "Wir verloren die"
	line "ARENA auf der"
	cont "ZINNOBERINSEL,"
	cont "kamen aber hier."
	done

ScientistLindenBeatenText:
	; PC (class C)
	text "Wir akzeptieren"
	line "die Niederlage…"
	done

SupernerdWaldoSeenText:
	; PC (class C)
	text "Ich sammle"
	line "Kampfberichte."
	para "Hilfst du mir?"
	done

SupernerdWaldoBeatenText:
	; PC (class C)
	text "Ich hätte nicht"
	line "gedacht, dass du"
	cont "so gut bist!"
	done

SupernerdMerleSeenText:
	; PC (class C)
	text "Ooh! Du siehst"
	line "leicht zu besiegen"
	cont "aus!"
	done

SupernerdMerleBeatenText:
	; PC (class C)
	text "Entschuldigung!"
	done

BlaineIntroText:
	; GSC-DE Dump
	text "PYRO: Wuah!"
	para "Meine PKMN-ARENA"
	line "auf der ZINNOBER-"
	cont "INSEL ist abge-"
	cont "brannt. Meine"
	para "Feuer-#MON und"
	line "ich sind wegen des"
	para "Vulkanausbruchs"
	line "obdachlos."
	para "Buah!"
	para "Aber ich führe"
	line "meine Tätigkeit"
	para "als ARENALEITER in"
	line "dieser Höhle"
	cont "weiter aus."
	para "Wenn du mich"
	line "besiegst, bekommst"
	cont "du einen ORDEN."
	para "Es wäre besser,"
	line "du hast"
	cont "FEUERHEILER!"
	done

BlaineWinLossText:
	; GSC-DE Dump
	text "PYRO: Gut gemacht."
	line "Ich bin"
	cont "ausgebrannt…"
	para "Hier nimm den"
	line "VULKANORDEN!"
	done

BlaineAfterBattleText:
	; PC TM lead-in (class C)
	text "Hier, nimm auch"
	line "das!"
	done

BlaineFightDoneText:
	; GSC-DE Dump
	text "PYRO: Meine Feuer-"
	line "#MON werden"
	para "noch stärker sein."
	line "Du wirst schon"
	cont "sehen!"
	done

SeafoamGymGuyWinText2:
	; GSC-DE Dump
	text "Eine PKMN-ARENA"
	line "kann überall sein,"
	para "solange der ARENA-"
	line "LEITER dort ist."
	para "Man braucht dafür"
	line "kein Gebäude."
	done
