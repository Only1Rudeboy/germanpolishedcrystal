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

	text "In einer Höhle,"
	line "aber wir waschen"
	cont "immer die Wäsche."
	done

GenericTrainerScientistDennett:
	generictrainer SCIENTIST, DENNETT, EVENT_BEAT_SCIENTIST_DENNETT, ScientistDennettSeenText, ScientistDennettBeatenText

	text "Mit Blaine bauen"
	line "wir unsere ARENA"
	cont "wieder auf!"
	done

GenericTrainerSupernerdCary:
	generictrainer SUPER_NERD, CARY, EVENT_BEAT_SUPER_NERD_CARY, SupernerdCarySeenText, SupernerdCaryBeatenText

	text "Bitterkeit führt"
	line "zu Verbesserung."
	done

TrainerScientistLinden:
	trainer SCIENTIST, LINDEN, EVENT_BEAT_SCIENTIST_LINDEN, ScientistLindenSeenText, ScientistLindenBeatenText, 0, .Script, TRAINERPAL_DARK_SCIENTIST

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "Nicht alle"
	line "Forscher helfen"
	line "den Bösen."
	done

GenericTrainerSupernerdWaldo:
	generictrainer SUPER_NERD, WALDO, EVENT_BEAT_SUPER_NERD_WALDO, SupernerdWaldoSeenText, SupernerdWaldoBeatenText

	text "Wer zum Teufel"
	line "bist du?"
	done

GenericTrainerSupernerdMerle:
	generictrainer SUPER_NERD, MERLE, EVENT_BEAT_SUPER_NERD_MERLE, SupernerdMerleSeenText, SupernerdMerleBeatenText

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

	text "Die Attacke heißt"
	line "Will-O-Wisp!"

	para "Sie schwächt den"
	line "Gegner mit einer"
	cont "Verbrennung."

	para "Diesmal hab ich"
	line "verloren, aber"
	cont "beim nächsten Mal"
	cont "gewinne ich!"

	para "Wenn ich meine"
	line "ARENA auf der"
	cont "ZINNOBERINSEL"

	para "wieder aufbaue,"
	line "müssen wir"
	line "nochmal kämpfen."
	done

SeafoamGymGuyScript:
	checkevent EVENT_TALKED_TO_SEAFOAM_GYM_GUY_ONCE
	iftrue_jumptextfaceplayer SeafoamGymGuyWinText2
	setevent EVENT_TALKED_TO_SEAFOAM_GYM_GUY_ONCE
	jumpthistextfaceplayer

	text "Yo!"

	para "…Hä? Schon"
	line "vorbei?"

	para "Entschuldigung!"

	para "Die ARENA auf der"
	line "ZINNOBERINSEL war"
	cont "weg, also wusste"

	para "ich nicht, wo ich"
	line "dich finde."

	para "Aber hey, du bist"
	line "auch ohne meinen"
	cont "Tipp stark."

	para "Ich wusste, du"
	line "gewinnst!"
	done

ScientistLowellSeenText:
	text "Dieser"
	line "Laborkittel"
	line "macht mich"
	cont "irgend-"
	cont "wie schlauer."
	done

ScientistLowellBeatenText:
	text "Ein weißer Kittel"
	line "ist das Leben"
	cont "eines Forschers."
	done

ScientistDennettSeenText:
	text "Blaine hat seine"
	line "ARENA verloren,"
	cont "aber er gibt nie"
	cont "auf!"
	done

ScientistDennettBeatenText:
	text "Blaines Ausdauer"
	line "motiviert mich!"
	done

SupernerdCarySeenText:
	text "Wow, eine ARENA"
	line "in so einer"
	cont "Höhle?"

	para "Die würde ich"
	line "gern erkunden."
	done

SupernerdCaryBeatenText:
	text "Eine bittere"
	line "Niederlage…"
	done

ScientistLindenSeenText:
	text "Wir verloren die"
	line "ARENA auf der"
	line "ZINNOBERINSEL,"
	cont "kamten aber hier."
	done

ScientistLindenBeatenText:
	text "Wir akzeptieren"
	line "die Niederlage…"
	done

SupernerdWaldoSeenText:
	text "Ich sammle"
	line "Kampfberichte."

	para "Hilfst du mir?"
	done

SupernerdWaldoBeatenText:
	text "Ich hätte nicht"
	line "gedacht, dass du"
	cont "so gut bist!"
	done

SupernerdMerleSeenText:
	text "Ooh!"
	line "Du siehst leicht"
	cont "zu besiegen aus!"
	done

SupernerdMerleBeatenText:
	text "Entschuldigung!"
	done

BlaineIntroText:
	text "PYRO: Wuah!"

	para "Meine #mon-ARENA"
	line "auf der ZINNOBER-"
	cont "INSEL ist abge-"
	cont "brannt. Meine"

	para "Feuer-#mon und"
	line "ich sind wegen"
	cont "des"

	para "Vulkanausbruchs"
	line "obdachlos."

	para "Buah!"

	para "Aber ich führe"
	line "meine Tätigkeit"

	para "als ARENALEITER"
	line "in"
	line "dieser Höhle"
	cont "weiter aus."

	para "Wenn du mich"
	line "besiegst,"
	cont "bekommst"
	cont "du einen ORDEN."

	para "Es wäre besser,"
	line "du hast"
	cont "FEUERHEILER!"
	done








BlaineWinLossText:
	text "PYRO: Gut"
	line "gemacht."
	line "Ich bin"
	cont "ausgebrannt…"

	para "Hier nimm den"
	line "VULKANORDEN!"
	done








BlaineAfterBattleText:
	text "PYRO: Diesmal"
	line "habe"
	line "ich verloren,"
	cont "aber"

	para "beim nächsten Mal"
	line "werde ich"
	cont "gewinnen."

	para "Ich werde meine"
	line "#mon-ARENA auf"
	cont "der"

	para "ZINNOBERINSEL"
	line "wieder aufbauen"
	cont "und dann wirst du"
	cont "erneut gegen mich"
	cont "antreten."
	done








BlaineFightDoneText:
	text "PYRO: Meine"
	line "Feuer-"
	line "#mon werden"

	para "noch stärker"
	line "sein."
	line "Du wirst schon"
	cont "sehen!"
	done








SeafoamGymGuyWinText2:
	text "Eine PKMN-ARENA"
	line "kann überall"
	cont "sein,"

	para "solange der"
	line "ARENA-"
	line "LEITER dort ist."

	para "Man braucht dafür"
	line "kein Gebäude."
	done
