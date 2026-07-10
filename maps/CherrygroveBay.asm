CherrygroveBay_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 21, 22, HIDDEN_TREE_GROTTO, 1

	def_coord_events

	def_bg_events
	bg_event 21, 21, BGEVENT_JUMPSTD, treegrotto, HIDDENGROTTO_CHERRYGROVE_BAY
	bg_event 22, 21, BGEVENT_JUMPSTD, treegrotto, HIDDENGROTTO_CHERRYGROVE_BAY
	bg_event 11, 12, BGEVENT_READ, CherrygroveBayGalarianBirdsScript

	def_object_events
	object_event  9, 32, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygroveBayHikerScript, -1
	object_event 23, 25, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerHikerTony, -1
	object_event 15, 43, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CherrygroveBayFisherText, -1
	object_event  7, 39, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSwimmermThomas, -1
	object_event  7, 22, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSwimmerfSally, -1
	object_event 22, 39, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_DARK_GREEN, OBJECTTYPE_TRAINER, 4, TrainerSwimmerfTara, -1
	itemball_event 22, 23, SHINY_STONE, 1, EVENT_CHERRYGROVE_BAY_SHINY_STONE
	cuttree_event -1,  8, EVENT_CHERRYGROVE_BAY_CUT_TREE
	fruittree_event  8,  9, FRUITTREE_CHERRYGROVE_BAY_1, POMEG_BERRY, PAL_NPC_RED
	fruittree_event  7, 11, FRUITTREE_CHERRYGROVE_BAY_2, KELPSY_BERRY, PAL_NPC_BLUE
	fruittree_event  8, 13, FRUITTREE_CHERRYGROVE_BAY_3, QUALOT_BERRY, PAL_NPC_PINK
	fruittree_event 14,  9, FRUITTREE_CHERRYGROVE_BAY_4, HONDEW_BERRY, PAL_NPC_GREEN
	fruittree_event 15, 11, FRUITTREE_CHERRYGROVE_BAY_5, GREPA_BERRY, PAL_NPC_ENV_YELLOW
	fruittree_event 14, 13, FRUITTREE_CHERRYGROVE_BAY_6, TAMATO_BERRY, PAL_NPC_RED

CherrygroveBayGalarianBirdsScript:
	opentext
	writetext .GreatTreeText
	waitbutton
	callasm CheckForLures
	iffalse_endtext ; User has no lures, do nothing
	writetext .LikeToUseItemText
	yesorno
	iffalse_endtext
	writetext .WhichLureText
	callasm CheckForLures
	callasm SetUpLureMenu
	iffalse_endtext ; User canceled the menu
	writetext .YouSprayedTheLureText
	waitbutton
	ifequalfwd POTENT_LURE_MENU_OPT, .Galarian_Articuno
	ifequalfwd MALIGN_LURE_MENU_OPT, .Galarian_Zapdos
; HARSH_LURE_MENU_OPT, .Galarian_Moltres
	checkevent EVENT_CHERRYGROVE_BAY_FOUGHT_GALARIAN_MOLTRES
	iftruefwd .NothingHappens
	closetext
	callasm GalarianMoltresEvent
	opentext
	farwritetext MoltresText
	cry MOLTRES
	pause 15
	closetext
	loadwildmon MOLTRES, GALARIAN_FORM, 65
	loadvar VAR_BATTLETYPE, BATTLETYPE_LEGENDARY
	startbattle
	setevent EVENT_CHERRYGROVE_BAY_FOUGHT_GALARIAN_MOLTRES
	reloadmapafterbattle
	special CheckBattleCaughtResult
	iffalsefwd .NoCatchGalarianMoltres
	setflag ENGINE_PLAYER_CAUGHT_GALARIAN_MOLTRES
.NoCatchGalarianMoltres
	end

.Galarian_Articuno
	checkevent EVENT_CHERRYGROVE_BAY_FOUGHT_GALARIAN_ARTICUNO
	iftruefwd .NothingHappens
	closetext
	callasm GalarianArticunoEvent
	opentext
	farwritetext ArticunoText
	cry ARTICUNO
	pause 15
	closetext
	loadwildmon ARTICUNO, GALARIAN_FORM, 65
	loadvar VAR_BATTLETYPE, BATTLETYPE_LEGENDARY
	startbattle
	setevent EVENT_CHERRYGROVE_BAY_FOUGHT_GALARIAN_ARTICUNO
	reloadmapafterbattle
	special CheckBattleCaughtResult
	iffalsefwd .NoCatchGalarianArticuno
	setflag ENGINE_PLAYER_CAUGHT_GALARIAN_ARTICUNO
.NoCatchGalarianArticuno
	end

.Galarian_Zapdos
	checkevent EVENT_CHERRYGROVE_BAY_FOUGHT_GALARIAN_ZAPDOS
	iftruefwd .NothingHappens
	closetext
	callasm GalarianZapdosEvent
	opentext
	farwritetext ZapdosText
	cry ZAPDOS
	pause 15
	closetext
	loadwildmon ZAPDOS, GALARIAN_FORM, 65
	loadvar VAR_BATTLETYPE, BATTLETYPE_LEGENDARY
	startbattle
	setevent EVENT_CHERRYGROVE_BAY_FOUGHT_GALARIAN_ZAPDOS
	reloadmapafterbattle
	special CheckBattleCaughtResult
	iffalsefwd .NoCatchGalarianZapdos
	setflag ENGINE_PLAYER_CAUGHT_GALARIAN_ZAPDOS
.NoCatchGalarianZapdos
	end

.NothingHappens
	writetext .NothingHappensText
	waitbutton
	endtext

.GreatTreeText
	text "Das ist der große"
	line "Baum von Rosalia!"
	done

.LikeToUseItemText
	text "Möchtest du einen"
	line "Köder am großen"
	cont "Baum verwenden?"
	done

.WhichLureText
	text "Welchen Köder"
	line "möchtest du"
	cont "verwenden?"
	done

.YouSprayedTheLureText
	text "Du hast den Köder"
	line "auf den Baum"
	cont "gesprüht."
	done

.NothingHappensText
	text "Nichts passierte…"
	done

CherrygroveBayHikerScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_EARTH_POWER_INTRO
	iftruefwd CherrygroveBayTutorEarthPowerScript
	writetext CherrygroveBayHikerText
	waitbutton
	setevent EVENT_LISTENED_TO_EARTH_POWER_INTRO
CherrygroveBayTutorEarthPowerScript:
	writetext Text_CherrygroveBayTutorEarthPower
	waitbutton
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	writetext Text_CherrygroveBayTutorQuestion
	yesorno
	iffalsefwd .TutorRefused
	setval EARTH_POWER
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpthisopenedtext

	text "Na gut."
	done

.NoSilverLeaf
	jumpthisopenedtext

	text "Du hast kein"
	line "Silberblatt…"
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "So! Dein #mon"
	line "kennt jetzt"
	cont "Earth Power!"
	done

GenericTrainerSwimmermThomas:
	generictrainer SWIMMERM, THOMAS, EVENT_BEAT_SWIMMERM_THOMAS, .SeenText, .BeatenText

	text "Mein #mon kann"
	line "Surfen, aber ich"
	cont "schwimme lieber."
	done

.SeenText:
	text "Kannst du"
	line "schwimmen?"
	line "Ich bringe es dir"
	cont "bei, wenn du"
	cont "willst."
	done

.BeatenText:
	text "Glub, glub, glub…"
	done

GenericTrainerSwimmerfSally:
	generictrainer SWIMMERF, SALLY, EVENT_BEAT_SWIMMERF_SALLY, .SeenText, .BeatenText

	text "Ich treibe gern"
	line "mit"
	line "meinen #mon auf"
	cont "den Wellen!"
	done

.SeenText:
	text "Diese Bucht mag"
	line "ich."
	line "Das Wasser ist"

	para "viel ruhiger als"
	line "auf offener See."
	done

.BeatenText:
	text "Verlieren mag ich"
	line "aber nicht…"
	done

TrainerSwimmerfTara:
	trainer SWIMMERF, TARA, EVENT_BEAT_SWIMMERF_TARA, .SeenText, .BeatenText, 0, .Script, TRAINERPAL_DARK_SWIMMERF

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "Nördlich liegt"
	line "der"
	line "große Baum von"
	cont "Rosalia."

	para "Man sagt, seltene"
	line "Vogel-#mon"
	cont "kommen"

	para "von weit her, um"
	line "dort zu nisten."
	done

.SeenText:
	text "Ah, zwischen"
	line "Kirsch-"
	line "blüten zu"
	cont "schwimmen"
	cont "ist so"
	cont "entspannend!"
	done

.BeatenText:
	text "Selbst verlieren"
	line "stört mich nicht…"
	done

GenericTrainerHikerTony:
	generictrainer HIKER, TONY, EVENT_BEAT_HIKER_TONY, .SeenText, .BeatenText

	text "Nach einer langen"
	line "Wanderung sah ich"

	para "einen großen"
	line "Vogel"
	line "in diese Richtung"
	cont "fliegen!"

	para "Wohin und warum?"
	done

.SeenText:
	text "Ich bin meilen-"
	line "weit durch den"
	cont "Wald"

	para "gewandert, nur um"
	line "das legendäre"
	cont "Vogel-#mon zu"
	cont "sehen!"
	done

.BeatenText:
	text "Ich bin"
	line "erschöpft…"
	done

CherrygroveBayFisherText:
	text "Beim Angeln kann"
	line "ich Rosalia City"

	para "in der Ferne"
	line "betrachten."

	para "Oh! Und neulich"
	line "sah ich riesige"

	para "Vögel."

	para "Ich glaube, sie"
	line "flogen zu dem"
	cont "großen"
	cont "Baum dort drüben?"
	done

CherrygroveBayHikerText:
	text "Ich glaube nicht"
	line "an Schöpfungs-"
	cont "mythen mit"
	cont "#mon."

	para "Johto entstand"
	line "über"
	line "Millionen Jahre"

	para "durch die Kraft"
	line "der Erde!"
	done

Text_CherrygroveBayTutorEarthPower:
	text "Ich bringe deinem"
	line "#mon Earth"
	cont "Power"

	para "bei — für ein"
	line "Silberblatt."
	done


Text_CherrygroveBayTutorQuestion:
	text "Soll ich deinem"
	line "#mon Earth"
	cont "Power"
	cont "beibringen?"
	done
