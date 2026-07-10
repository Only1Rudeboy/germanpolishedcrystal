Route35_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 13, 33, ROUTE_35_GOLDENROD_GATE, 1
	warp_event 14, 33, ROUTE_35_GOLDENROD_GATE, 2
	warp_event  7,  5, ROUTE_35_NATIONAL_PARK_GATE, 3
	warp_event 14, 16, HIDDEN_TREE_GROTTO, 1

	def_coord_events

	def_bg_events
	bg_event  5,  7, BGEVENT_JUMPTEXT, Route35SignText
	bg_event 15, 31, BGEVENT_JUMPTEXT, Route35SignText
	bg_event 12, 23, BGEVENT_JUMPTEXT, Route35AdvancedTipsSignText
	bg_event  4, 11, BGEVENT_ITEM + NUGGET, EVENT_ROUTE_35_HIDDEN_NUGGET
	bg_event 14, 15, BGEVENT_JUMPSTD, treegrotto, HIDDENGROTTO_ROUTE_35
	bg_event 15, 15, BGEVENT_JUMPSTD, treegrotto, HIDDENGROTTO_ROUTE_35

	def_object_events
	object_event  8, 19, SPRITE_CAMPER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerCamperIvan, -1
	object_event 12, 20, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCoupleGailandeli1, -1
	object_event 11, 20, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCoupleGailandeli2, -1
	object_event 14, 26, SPRITE_PICNICKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerPicnickerKim, -1
	object_event 18, 29, SPRITE_BREEDER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBreederTheresa, -1
	object_event  6, 10, SPRITE_FIREBREATHER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerFirebreatherWalt, -1
	object_event 20,  7, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerBug_catcherArnie1, -1
	object_event  9, 10, SPRITE_JUGGLER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerJugglerIrwin, -1
	object_event  9,  6, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, TrainerOfficerDirk, -1
	object_event 24, -5, SPRITE_PSYCHIC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPsychicMark, -1
	cuttree_event 21,  6, EVENT_ROUTE_35_CUT_TREE
	fruittree_event  6, 25, FRUITTREE_ROUTE_35, LEPPA_BERRY, PAL_NPC_RED
	tmhmball_event 17, 16, TM_HONE_CLAWS, EVENT_ROUTE_35_TM_HONE_CLAWS

GenericTrainerBreederTheresa:
	generictrainer BREEDER, THERESA, EVENT_BEAT_BREEDER_THERESA, BreederTheresaSeenText, BreederTheresaBeatenText

	text "Ich bringe meine"
	line "#mon zum"

	para "Haarschnitt nach"
	line "Dukatia City und"

	para "zur Segnung nach"
	line "Teak City."

	para "Sie sind so"
	line "glücklich!"
	done

TrainerJugglerIrwin:
	trainer JUGGLER, IRWIN1, EVENT_BEAT_JUGGLER_IRWIN, JugglerIrwin1SeenText, JugglerIrwin1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_JUGGLER_IRWIN
	opentext
	checkcellnum PHONE_JUGGLER_IRWIN
	iftruefwd Route35NumberAcceptedM
	checkevent EVENT_IRWIN_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskedAlready
	writetext JugglerIrwinAfterBattleText
	promptbutton
	setevent EVENT_IRWIN_ASKED_FOR_PHONE_NUMBER
	scall Route35AskNumber1M
	sjumpfwd .AskForNumber

.AskedAlready:
	scall Route35AskNumber2M
.AskForNumber:
	askforphonenumber PHONE_JUGGLER_IRWIN
	ifequalfwd $1, Route35PhoneFullM
	ifequalfwd $2, Route35NumberDeclinedM
	gettrainername JUGGLER, IRWIN1, STRING_BUFFER_3
	scall Route35RegisteredNumberM
	sjumpfwd Route35NumberAcceptedM

Route35AskNumber1M:
	end







Route35AskNumber2M:
	end







Route35RegisteredNumberM:
	end







Route35NumberAcceptedM:
	end







Route35NumberDeclinedM:
	end







Route35PhoneFullM:
	end







Route35RematchM:
	end







GenericTrainerCamperIvan:
	generictrainer CAMPER, IVAN, EVENT_BEAT_CAMPER_IVAN, CamperIvanSeenText, CamperIvanBeatenText

	text "Die Musik aus dem"
	line "Radio beeinflusst"
	cont "die Stimmung von"
	cont "wilden #mon."
	done
GenericTrainerCoupleGailandeli1:
	generictrainer COUPLE, GAILANDELI1, EVENT_BEAT_COUPLE_GAIL_AND_ELI, CoupleGailandeli1SeenText, CoupleGailandeli1BeatenText

	text "Eli: Ich wurde vor"
	line "meiner Freundin"
	cont "blamiert…"
	done

GenericTrainerCoupleGailandeli2:
	generictrainer COUPLE, GAILANDELI2, EVENT_BEAT_COUPLE_GAIL_AND_ELI, CoupleGailandeli2SeenText, CoupleGailandeli2BeatenText

	text "Gail: Auf meine"
	line "#mon kann ich"
	cont "mehr zählen als"
	cont "auf meinen Freund."
	done

GenericTrainerPicnickerKim:
	generictrainer PICNICKER, KIM, EVENT_BEAT_PICNICKER_KIM, PicnickerKimSeenText, PicnickerKimBeatenText

	text "Die ORDEN sind"
	line "hübsch. Deshalb"
	cont "sammle ich sie."
	done
TrainerBug_catcherArnie1:
	trainer BUG_CATCHER, ARNIE1, EVENT_BEAT_BUG_CATCHER_ARNIE, Bug_catcherArnie1SeenText, Bug_catcherArnie1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_BUG_CATCHER_ARNIE
	endifjustbattled
	opentext
	checkflag ENGINE_ARNIE_READY_FOR_REMATCH
	iftruefwd .WantsBattle
	checkflag ENGINE_YANMA_SWARM
	iftruefwd .YanmaSwarming
	checkcellnum PHONE_BUG_CATCHER_ARNIE
	iftrue Route35NumberAcceptedM
	checkevent EVENT_ARNIE_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskedAlready
	writetext BugCatcherArnieAfterBattleText
	promptbutton
	setevent EVENT_ARNIE_ASKED_FOR_PHONE_NUMBER
	scall Route35AskNumber1M
	sjumpfwd .AskForNumber

.AskedAlready:
	scall Route35AskNumber2M
.AskForNumber:
	askforphonenumber PHONE_BUG_CATCHER_ARNIE
	ifequal $1, Route35PhoneFullM
	ifequal $2, Route35NumberDeclinedM
	gettrainername BUG_CATCHER, ARNIE1, STRING_BUFFER_3
	scall Route35RegisteredNumberM
	sjump Route35NumberAcceptedM

.WantsBattle:
	scall Route35RematchM
	winlosstext Bug_catcherArnie1BeatenText, 0
	readmem wArnieFightCount
	ifequalfwd 4, .Fight4
	ifequalfwd 3, .Fight3
	ifequalfwd 2, .Fight2
	ifequalfwd 1, .Fight1
	ifequalfwd 0, .LoadFight0
.Fight4:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .LoadFight4
.Fight3:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd .LoadFight3
.Fight2:
	checkflag ENGINE_FLYPOINT_BLACKTHORN
	iftruefwd .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_LAKE_OF_RAGE
	iftruefwd .LoadFight1
.LoadFight0:
	loadtrainer BUG_CATCHER, ARNIE1
	startbattle
	reloadmapafterbattle
	loadmem wArnieFightCount, 1
	clearflag ENGINE_ARNIE_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer BUG_CATCHER, ARNIE2
	startbattle
	reloadmapafterbattle
	loadmem wArnieFightCount, 2
	clearflag ENGINE_ARNIE_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer BUG_CATCHER, ARNIE3
	startbattle
	reloadmapafterbattle
	loadmem wArnieFightCount, 3
	clearflag ENGINE_ARNIE_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer BUG_CATCHER, ARNIE4
	startbattle
	reloadmapafterbattle
	loadmem wArnieFightCount, 4
	clearflag ENGINE_ARNIE_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer BUG_CATCHER, ARNIE5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ARNIE_READY_FOR_REMATCH
	end

.YanmaSwarming:
	jumpthisopenedtext

	text "Wow… Sieh, all die"
	line "YANMA!"

	para "Ich bin"
	line "überwältigt und"
	cont "kann mich nicht"
	cont "rühren."
	done
GenericTrainerFirebreatherWalt:
	generictrainer FIREBREATHER, WALT, EVENT_BEAT_FIREBREATHER_WALT, FirebreatherWaltSeenText, FirebreatherWaltBeatenText

	text "Der #mon-"
	line "Marsch im Radio"
	cont "lockt wilde"
	cont "#mon an."
	done
TrainerOfficerDirk:
	faceplayer
	opentext
	checktime 1 << NITE
	iffalsefwd .NotNight
	checkevent EVENT_BEAT_OFFICERM_DIRK
	iftruefwd .AfterBattle
	special SaveMusic
	playmusic MUSIC_OFFICER_ENCOUNTER
	writetext OfficerDirkSeenText
	waitbutton
	closetext
	winlosstext OfficerDirkBeatenText, 0
	loadtrainer OFFICERM, DIRK
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_OFFICERM_DIRK
	endtext

.AfterBattle:
	jumpthisopenedtext

	text "Du weißt, dass die"
	line "Nacht auf ihre"
	cont "Weise schön sein"
	cont "kann."

	para "Aber übertreibe es"
	line "nicht, O.K.?"
	done
.NotNight:
	jumpthisopenedtext

	text "Deine #mon"
	line "sehen ziemlich"
	cont "stark aus."

	para "Du wärst überall"
	line "sicher."
	done
CamperIvanSeenText:
	text "Ich habe aus dem"
	line "Radio #mon-"
	cont "Daten erhalten."

	para "Ich glaube, ich"
	line "bin gut."
	done






CamperIvanBeatenText:
	text "Ich teile aus!"
	done






CoupleGailandeli1SeenText:
	text "Eli: Ich zeige"
	line "meiner Freundin,"
	cont "was ich drauf"
	cont "habe!"
	done

CoupleGailandeli1BeatenText:
	text "Eli: Ich wünschte,"
	line "du hättest für"
	cont "mich verloren…"
	done

CoupleGailandeli2SeenText:
	text "Gail: Mein Freund"
	line "ist schwach, also"
	cont "kann ich mich"
	cont "nicht auf ihn"
	cont "verlassen."
	done

CoupleGailandeli2BeatenText:
	text "Gail: Ach, du"
	line "meine Güte! Du"
	cont "bist so stark!"
	done

PicnickerKimSeenText:
	text "Gehst du auch zur"
	line "#mon-ARENA?"
	done






PicnickerKimBeatenText:
	text "Ach, ich habe"
	line "verloren…"
	done






BreederTheresaSeenText:
	text "Wie versorgst du"
	line "deine #mon?"
	done

BreederTheresaBeatenText:
	text "Ah! Du kümmerst"
	line "dich gut um sie!"
	done

JugglerIrwin1SeenText:
	text "Siehe meine"
	line "Virtuosität, mit"
	cont "der ich die BÄLLE"
	cont "jongliere!"
	done






JugglerIrwin1BeatenText:
	text "Puh, das war ein"
	line "Ruck!"
	done






JugglerIrwinAfterBattleText:
	text "Ich wollte dich"
	line "mit meinen"

	para "prämierten #mon"
	line "fritzeln."

	para "Aber dein Können"
	line "elektrisierte"
	cont "mich!"
	done






Bug_catcherArnie1SeenText:
	text "Ich gehe überall-"
	line "hin, wo es Käfer-"
	cont "#mon gibt."
	done
Bug_catcherArnie1BeatenText:
	text "Ich hätte nicht"
	line "verlieren dürfen…"
	done
BugCatcherArnieAfterBattleText:
	text "Mit meinem BLUZUK"
	line "habe ich das"

	para "Käferturnier im"
	line "NATIONALPARK"
	cont "gewonnen."
	done






FirebreatherWaltSeenText:
	text "Ich übe mich im"
	line "Feuerspucken."
	done






FirebreatherWaltBeatenText:
	text "Aua! Ich habe mir"
	line "die Nasenspitze"
	cont "verbrannt!"
	done






OfficerDirkSeenText:
	text "Bei Nacht lauern"
	line "Gefahren!"
	done






OfficerDirkBeatenText:
	text "Schwupps!"
	done






Route35SignText:
	text "ROUTE 35"
	done






Route35AdvancedTipsSignText:
	text "Prof-Tipps!"

	para "Registriere bis zu"
	line "vier Schlüssel-"
	cont "Items!"

	para "Über Select kannst"
	line "du sie schnell"
	cont "nutzen!"
	done
