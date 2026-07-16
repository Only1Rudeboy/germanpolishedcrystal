Route26_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  8,  5, POKEMON_LEAGUE_GATE, 3
	warp_event 15, 57, ROUTE_26_HEAL_SPEECH_HOUSE, 1
	warp_event  5, 71, ROUTE_26_DAY_OF_WEEK_SIBLINGS_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 10,  6, BGEVENT_JUMPTEXT, Route26SignText

	def_object_events
	object_event  9, 38, SPRITE_DRAGON_TAMER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerDragonTamerKazu, -1
	object_event 14, 24, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerCooltrainermGaven1, -1
	object_event 10, 56, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerCooltrainerfJoyce, -1
	object_event  5,  8, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerCooltrainerfBeth1, -1
	object_event 13, 79, SPRITE_PSYCHIC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerPsychicRichard, -1
	object_event  2, 82, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerBattleGirlRonda, -1
	object_event  6, 100, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFisherScott, -1
	object_event 10, 92, SPRITE_DRAGON_TAMER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerDragonTamerErick, -1
	fruittree_event 14, 54, FRUITTREE_ROUTE_26, SITRUS_BERRY, PAL_NPC_BROWN
	itemball_event  9, 15, MAX_ELIXIR, 1, EVENT_ROUTE_26_MAX_ELIXIR
	tmhmball_event 13, 34, TM_DRAGON_CLAW, EVENT_ROUTE_26_TM_DRAGON_CLAW

GenericTrainerDragonTamerKazu:
	generictrainer DRAGON_TAMER, KAZU, EVENT_BEAT_DRAGON_TAMER_KAZU, DragonTamerKazuSeenText, DragonTamerKazuBeatenText

	; GSC-DE Dump 6783
	text "Es ist sehr"
	line "schwer, in der"
	cont "LIGA zu gewinnen."

	para "Ich muss mehr"
	line "trainieren."

	para "Ich habe gehört,"
	line "dass die TOP VIER"

	para "aus der LIGA noch"
	line "stärker sind als"
	cont "die ARENALEITER."
	done

TrainerCooltrainermGaven1:
	trainer COOLTRAINERM, GAVEN1, EVENT_BEAT_COOLTRAINERM_GAVEN, CooltrainermGaven1SeenText, CooltrainermGaven1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_COOLTRAINERM_GAVEN
	opentext
	checkflag ENGINE_GAVEN_READY_FOR_REMATCH
	iftruefwd .WantsBattle
	checkcellnum PHONE_COOLTRAINERM_GAVEN
	iftruefwd .NumberAccepted
	checkevent EVENT_GAVEN_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskedAlready
	writetext CooltrainermGavenAfterText
	promptbutton
	setevent EVENT_GAVEN_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjumpfwd .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_COOLTRAINERM_GAVEN
	ifequalfwd $1, .PhoneFull
	ifequalfwd $2, .NumberDeclined
	gettrainername COOLTRAINERM, GAVEN1, STRING_BUFFER_3
	scall .RegisteredNumber
	sjumpfwd .NumberAccepted

.WantsBattle:
	scall .Rematch
	winlosstext CooltrainermGaven1BeatenText, 0
	readmem wGavenFightCount
	ifequalfwd 2, .Fight2
	ifequalfwd 1, .Fight1
	ifequalfwd 0, .LoadFight0
.Fight2:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .LoadFight2
.Fight1:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd .LoadFight1
.LoadFight0:
	loadtrainer COOLTRAINERM, GAVEN1
	startbattle
	reloadmapafterbattle
	loadmem wGavenFightCount, 1
	clearflag ENGINE_GAVEN_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer COOLTRAINERM, GAVEN2
	startbattle
	reloadmapafterbattle
	loadmem wGavenFightCount, 2
	clearflag ENGINE_GAVEN_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer COOLTRAINERM, GAVEN3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_GAVEN_READY_FOR_REMATCH
	end

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

GenericTrainerCooltrainerfJoyce:
	generictrainer COOLTRAINERF, JOYCE, EVENT_BEAT_COOLTRAINERF_JOYCE, CooltrainerfJoyceSeenText, CooltrainerfJoyceBeatenText

	; GSC-DE Dump 6789
	text "Ich bezwang acht"
	line "ARENALEITER, also"

	para "hatte ich genug"
	line "Selbstbewusstsein."

	para "Das nächste Mal"
	line "muss ich mich mehr"
	cont "anstrengen."
	done

TrainerCooltrainerfBeth1:
	trainer COOLTRAINERF, BETH1, EVENT_BEAT_COOLTRAINERF_BETH, CooltrainerfBeth1SeenText, CooltrainerfBeth1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_COOLTRAINERF_BETH
	opentext
	checkflag ENGINE_BETH_READY_FOR_REMATCH
	iftruefwd .WantsBattle
	checkcellnum PHONE_COOLTRAINERF_BETH
	iftruefwd .NumberAccepted
	checkevent EVENT_BETH_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskedAlready
	writetext CooltrainerfBethAfterText
	promptbutton
	setevent EVENT_BETH_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjumpfwd .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_COOLTRAINERF_BETH
	ifequalfwd $1, .PhoneFull
	ifequalfwd $2, .NumberDeclined
	gettrainername COOLTRAINERF, BETH1, STRING_BUFFER_3
	scall .RegisteredNumber
	sjumpfwd .NumberAccepted

.WantsBattle:
	scall .Rematch
	winlosstext CooltrainerfBeth1BeatenText, 0
	readmem wBethFightCount
	ifequalfwd 2, .Fight2
	ifequalfwd 1, .Fight1
	ifequalfwd 0, .LoadFight0
.Fight2:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .LoadFight2
.Fight1:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd .LoadFight1
.LoadFight0:
	loadtrainer COOLTRAINERF, BETH1
	startbattle
	reloadmapafterbattle
	loadmem wBethFightCount, 1
	clearflag ENGINE_BETH_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer COOLTRAINERF, BETH2
	startbattle
	reloadmapafterbattle
	loadmem wBethFightCount, 2
	clearflag ENGINE_BETH_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer COOLTRAINERF, BETH3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_BETH_READY_FOR_REMATCH
	end

.AskNumber1:
	jumpstd asknumber1f

.AskNumber2:
	jumpstd asknumber2f

.RegisteredNumber:
	jumpstd registerednumberf

.NumberAccepted:
	jumpstd numberacceptedf

.NumberDeclined:
	jumpstd numberdeclinedf

.PhoneFull:
	jumpstd phonefullf

.Rematch:
	jumpstd rematchf

GenericTrainerPsychicRichard:
	generictrainer PSYCHIC_T, RICHARD, EVENT_BEAT_PSYCHIC_RICHARD, PsychicRichardSeenText, PsychicRichardBeatenText

	; GSC-DE Dump 6795
	text "Menschen und #-"
	line "MON wachsen mit"
	cont "ihren Erfahrungen."

	para "Du darfst nicht"
	line "faul und selbstge-"
	cont "fällig werden."
	done

GenericTrainerBattleGirlRonda:
	generictrainer BATTLE_GIRL, RONDA, EVENT_BEAT_BATTLE_GIRL_RONDA, BattleGirlRondaSeenText, BattleGirlRondaBeatenText

	; PC-only (B)
	text "Hier kommen einige"
	line "der stärksten"

	para "Trainer der Welt"
	line "vorbei."

	para "Und ich darf gegen"
	line "alle kämpfen!"
	done

GenericTrainerFisherScott:
	generictrainer FISHER, SCOTT, EVENT_BEAT_FISHER_SCOTT, FisherScottSeenText, FisherScottBeatenText

	; GSC-DE Dump 6798
	text "Das Angeln und"
	line "#MON sind sehr"

	para "ähnlich. Wenn du"
	line "aufgibst, ist es"
	cont "vorüber."
	done

GenericTrainerDragonTamerErick:
	generictrainer DRAGON_TAMER, ERICK, EVENT_BEAT_DRAGON_TAMER_ERICK, DragonTamerErickSeenText, DragonTamerErickBeatenText

	; PC-only (B) CAPS
	text "Die SIEGESSTRASSE"
	line "ist hart."

	para "Jeder Trainer muss"
	line "seinen eigenen Weg"
	cont "durch sie finden."
	done

DragonTamerKazuSeenText:
	; GSC-DE Dump 6781
	text "Ich treffe die"
	line "letzten Vorberei-"
	cont "tungen für die"
	cont "#MON LIGA."
	done

DragonTamerKazuBeatenText:
	; GSC-DE Dump 6782
	text "Ich habe es"
	line "vermasselt!"
	done

CooltrainermGaven1SeenText:
	; GSC-DE Dump 6784
	text "Wenn du harte"
	line "Kämpfe bestrei-"
	cont "test, wirst du"
	cont "stärker."
	done

CooltrainermGaven1BeatenText:
	; GSC-DE Dump 6785
	text "Gah! Das Leben ist"
	line "noch härter!"
	done

CooltrainermGavenAfterText:
	; GSC-DE Dump 6786
	text "Um zur #MON"
	line "LIGA zu gelangen,"

	para "musst du die"
	line "SIEGESSTRASSE"
	cont "passieren."

	para "Die SIEGESSTRASSE"
	line "ist schwierig."

	para "Eigentlich geht"
	line "niemand dorthin!"
	done

CooltrainerfJoyceSeenText:
	; GSC-DE Dump 6787
	text "Da du es bis"
	line "hierher geschafft"
	cont "hast, musst du"
	cont "gut sein."

	para "Ich werde in"
	line "diesem Kampf"
	cont "alles geben!"
	done

CooltrainerfJoyceBeatenText:
	; GSC-DE Dump 6788
	text "Nein! Ich kann"
	line "das nicht glauben!"
	done

CooltrainerfBeth1SeenText:
	; GSC-DE Dump 6790
	text "Ich habe gegen"
	line "einen Trainer"
	cont "namens <RIVAL>"
	cont "verloren."

	para "Er war sehr"
	line "stark, aber…"

	para "Es schien, als"
	line "sei er vom Siegen"
	cont "besessen."

	para "Seine #MON"
	line "taten mir Leid."
	done

CooltrainerfBeth1BeatenText:
	; GSC-DE Dump 6791
	text "#MON sind keine"
	line "Kriegswerkzeuge."
	done

CooltrainerfBethAfterText:
	; GSC-DE Dump 6792
	text "#MON sind"
	line "unschätzbare,"
	cont "lebenslange"
	cont "Partner."
	done

PsychicRichardSeenText:
	; GSC-DE Dump 6793
	text "Wow, sieh dir all"
	line "die ORDEN an! Ich"
	cont "bin beeindruckt."

	para "Aber es reicht dir"
	line "nicht, sie nur zu"

	para "sammeln, oder?"
	done

PsychicRichardBeatenText:
	; GSC-DE Dump 6794
	text "Guter Kampf!"
	done

BattleGirlRondaSeenText:
	; PC-only (B)
	text "Halt! Ich fordere"
	line "dich zum Duell"
	cont "heraus!"
	done

BattleGirlRondaBeatenText:
	; PC-only (B)
	text "Der Sieg ist dein!"
	done

FisherScottSeenText:
	; GSC-DE Dump 6796
	text "Heute fühle ich"
	line "mich grossartig!"

	para "Ich fühle mich so"
	line "stark, dass ich"
	cont "den LIGA-CHAMP"
	cont "besiegen könnte!"
	done

FisherScottBeatenText:
	; GSC-DE Dump 6797
	text "Nein! Nicht in"
	line "diesem Kampf!"
	done

DragonTamerErickSeenText:
	; PC-only (B)
	text "Hier leben"
	line "Drachen!"
	done

DragonTamerErickBeatenText:
	; PC-only (B)
	text "Meine Drachen"
	line "wurden besiegt…"
	done

Route26SignText:
	; GSC-DE Dump 6799
	text "ROUTE 26"

	para "#MON LIGA"
	line "EMPFANG"
	done
