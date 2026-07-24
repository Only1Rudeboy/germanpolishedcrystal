DiglettsCave_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 37, 15, VERMILION_CITY, 10
	warp_event 39, 13, DIGLETTS_CAVE, 5
	warp_event 37,  5, ROUTE_2_NORTH, 4
	warp_event 39,  3, DIGLETTS_CAVE, 6
	warp_event 37, 31, DIGLETTS_CAVE, 2
	warp_event  5,  5, DIGLETTS_CAVE, 4

	def_coord_events

	def_bg_events
	bg_event  8, 15, BGEVENT_ITEM + MAX_REVIVE, EVENT_DIGLETTS_CAVE_HIDDEN_MAX_REVIVE
	bg_event 34, 33, BGEVENT_ITEM + MAX_REPEL, EVENT_DIGLETTS_CAVE_HIDDEN_MAX_REPEL

	def_object_events
	object_event 11, 15, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DiglettsCaveFossilManiacScript, -1
	object_event  5, 13, SPRITE_HIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerHikerGerard, -1
	object_event 25, 31, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerHikerDent, -1
	object_event 16, 21, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBlackbeltInigo, -1
	object_event  9, 20, SPRITE_ENGINEER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerEngineerSmith, -1
	object_event 37, 13, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, DiglettsCavePokefanMText, -1
	object_event 20, 27, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, DiglettsCaveCooltrainerfText, -1
	itemball_event 13, 28, RARE_BONE, 1, EVENT_DIGLETTS_CAVE_RARE_BONE

DiglettsCaveFossilManiacScript:
	faceplayer
	opentext
	writetext .GreetingText
	promptbutton
	special Special_ChooseItem
	iffalse_jumpopenedtext .NoItemText
	special GetFossilManiacPrice
	iffalse_jumpopenedtext .WrongItemText
	special ItemManiac_SelectQuantity
	iffalse_jumpopenedtext .NoItemText
	special MultiplyMoneyByQuantity
	writetext .OfferText
	special PlaceMoneyTopRight
	yesorno
	iffalse_jumpopenedtext .NoItemText
	special TakeItemFromMemWithQuantity
	waitsfx
	playsound SFX_TRANSACTION
	special Give_hMoneyTemp
	special PlaceMoneyTopRight
	jumpthisopenedtext

	text "Hey, danke!"

	para "Ich wette, ich"
	line "kann das viel"
	cont "teurer verkaufen"
	cont "als ich dir"
	cont "gezahlt habe. Ha!"

	para "So ist das"
	line "Geschäft!"
	done

.GreetingText:
	text "Hey, schau mal."
	line "Ich hab ein super"
	cont "Angebot für dich!"

	para "Weißt du, wie"
	line "#MON-Fossilien"
	cont "in Felsen"
	cont "vorkommen?"

	para "Wenn du eines"
	line "findest, bring es"
	cont "mir."

	para "Es lohnt sich für"
	line "dich."
	done

.OfferText:
	text "Hey, super! Mal"
	line "sehen."
	para "Ich geb dir ¥"
	text_decimal hMoneyTemp, 3, 7
	text " dafür."
	line "Einverstanden?"
	done

.WrongItemText:
	text "Nein, das taugt"
	line "nichts. Lohnt sich"
	cont "nicht."
	done

.NoItemText:
	text "…Nein, nichts"
	line "Gutes in deinem"
	cont "RUCKSACK."

	para "Ach nun."
	line "Vielleicht"
	cont "nächstes Mal!"
	done

GenericTrainerHikerGerard:
	generictrainer HIKER, GERARD, EVENT_BEAT_HIKER_GERARD, .SeenText, .BeatenText

	; PC-only (CAPS)
	text "Dieser Ort macht"
	line "mich so nervös."

	para "Was, wenn ein"
	line "DIGDA mich aus dem"
	cont "Nichts angreift?"
	done

.SeenText:
	text "Aah! Ich glaub,"
	line "der Fels hat sich"
	cont "bewegt!"
	done

.BeatenText:
	text "War wohl meine"
	line "Einbildung."
	done

GenericTrainerHikerDent:
	generictrainer HIKER, DENT, EVENT_BEAT_HIKER_DENT, .SeenText, .BeatenText

	text "Ich passe perfekt"
	line "zur Muskel-Truppe"
	cont "der"
	cont "MARMORIA-ARENA."
	cont "Hohoh!"
	done

.SeenText:
	; PC-only (CAPS)
	text "Ich gehe nach"
	line "MARMORIA."

	para "Die Gesteins-ARENA"
	line "ist perfekt für"
	cont "einen Kerl wie"
	cont "mich!"
	done

.BeatenText:
	text "Hohoh! Jemand ist"
	line "stärker als ich!"
	done

GenericTrainerBlackbeltInigo:
	generictrainer BLACKBELT_T, INIGO, EVENT_BEAT_BLACKBELT_INIGO, .SeenText, .BeatenText

	text "Laute helfen dir"
	line "nicht beim"
	cont "Kämpfen, aber"

	para "sie können deine"
	line "Gegner"
	cont "einschüchtern."
	done

.SeenText:
	text "Mach dich bereit"
	line "zum Kampf!"
	cont "HOO-HAH!"
	done

.BeatenText:
	text "HIIYAAAH!"
	done

GenericTrainerEngineerSmith:
	generictrainer ENGINEER, SMITH, EVENT_BEAT_ENGINEER_SMITH, .SeenText, .BeatenText

	; PC-only (CAPS)
	text "Diese DIGDA sind"
	line "geborene"
	cont "Ingenieure."
	done

.SeenText:
	; PC-only (CAPS)
	text "Wie hat DIGDA so"
	line "einen langen"
	cont "Tunnel gegraben?"
	done

.BeatenText:
	text "Erstaunlich!"
	done

DiglettsCaveCooltrainerfText:
	; PC-only (CAPS)
	text "Schau dir all die"
	line "süßen DIGDA an!"

	para "Ich schwör, ich"
	line "hab eins mit"
	cont "blauer Nase"
	cont "gesehen!"
	done

DiglettsCavePokefanMText:
	; PC-only (CAPS)
	text "Einige DIGDA sind"
	line "plötzlich vor mir"

	para "aufgetaucht! Ich"
	line "habe mich"
	cont "erschreckt."
	done


