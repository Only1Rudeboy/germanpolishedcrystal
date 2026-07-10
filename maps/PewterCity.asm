PewterCity_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, PewterCityFlyPoint

	def_warp_events
	warp_event 29, 15, PEWTER_NIDORAN_SPEECH_HOUSE, 1
	warp_event 16, 19, PEWTER_GYM, 1
	warp_event 23, 19, PEWTER_MART, 2
	warp_event 13, 27, PEWTER_POKECENTER_1F, 1
	warp_event  7, 31, PEWTER_SNOOZE_SPEECH_HOUSE, 1
	warp_event 14,  9, PEWTER_MUSEUM_OF_SCIENCE_1F, 1
	warp_event 19,  7, PEWTER_MUSEUM_OF_SCIENCE_1F, 3
	warp_event 15,  9, PEWTER_MUSEUM_OF_SCIENCE_1F, 2

	def_coord_events

	def_bg_events
	bg_event 25, 25, BGEVENT_JUMPTEXT, PewterCitySignText
	bg_event 11, 19, BGEVENT_JUMPTEXT, PewterGymSignText
	bg_event 13, 11, BGEVENT_JUMPTEXT, PewterMuseumOfScienceSignText
	bg_event 33, 21, BGEVENT_JUMPTEXT, PewterCityMtMoonGiftShopSignText
	bg_event 19, 31, BGEVENT_JUMPTEXT, PewterCityTrainerTipsText

	def_object_events
	object_event 22, 13, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, PewterCityCooltrainerFText, -1
	object_event 19, 12, SPRITE_COOL_DUDE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 2, 2, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, PewterCityCooltrainermText, -1
	object_event 14, 31, SPRITE_CHILD, SPRITEMOVEDATA_WANDER, 2, 2, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, PewterCityBugCatcherText, -1
	object_event 29, 19, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PewterCityGrampsScript, -1
	object_event  7, 19, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WANDER, 2, 2, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PewterCityYoungsterScript, -1
	object_event 25, 28, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 2, 2, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, PewterCityPokefanMScript, -1
	fruittree_event 32,  5, FRUITTREE_PEWTER_CITY_1, PETAYA_BERRY, PAL_NPC_PINK
	fruittree_event 30,  5, FRUITTREE_PEWTER_CITY_2, APICOT_BERRY, PAL_NPC_BLUE

PewterCityFlyPoint:
	setflag ENGINE_FLYPOINT_PEWTER
	endcallback

PewterCityGrampsScript:
	checkevent EVENT_GOT_OLD_AMBER
	iftrue_jumptextfaceplayer PewterCityGrampsText_GotSilverWing
	faceplayer
	opentext
	writetext PewterCityGrampsText
	promptbutton
	verbosegiveitem OLD_AMBER
	iffalse_endtext
	setevent EVENT_GOT_OLD_AMBER
	endtext

PewterCityYoungsterScript:
	faceplayer
	opentext
	writetext PewterCityYoungsterText1
	waitbutton
	checkflag ENGINE_BOULDERBADGE
	iffalse_endtext
	jumpthisopenedtext

	text "Du hast die Arena"
	line "besiegt? Dann bist"
	cont "du auch hart wie"
	cont "Stein!"
	done

PewterCityPokefanMScript:
	faceplayer
	opentext
	writetext .Text1
	special PlaceMoneyTopRight
	yesorno
	iffalse_jumpopenedtext .Text3
	checkmoney YOUR_MONEY, 300
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	giveitem PEWTERCRUNCH
	iffalse_jumpopenedtext .Text4
	waitsfx
	takemoney YOUR_MONEY, 300
	special PlaceMoneyTopRight
	waitsfx
	playsound SFX_TRANSACTION
	writetext .Text2
	promptbutton
	itemnotify
	endtext

.Text1:
	text "MARMORIAS"
	line "Spezialität--"
	cont "Marmoria-Knusper!"

	para "Ich verkaufe dir"
	line "eine Packung für"
	cont "¥300!"
	done

.Text2:
	text "Danke! Sie sind"
	line "sehr hart, also"
	cont "pass auf!"
	done

.Text3:
	text "Sind sie dir zu"
	line "knusprig?"
	done

.Text4:
	text "Du hast keinen"
	line "Platz dafür!"
	done

.NotEnoughMoney:
	jumpthisopenedtext

	text "Du hast nicht"
	line "genug Geld dafür!"
	done

PewterCityCooltrainerFText:
	text "Warst du schon in"
	line "der #mon-ARENA"
	cont "von MARMORIA CITY?"

	para "Der LEITER dort"
	line "verwendet Gestein-"
	cont "#mon."
	done







PewterCityCooltrainermText:
	text "Die denkt,"
	line "Gesteins- #mon"
	cont "sind alles,"

	para "aber sie hat die"
	line "meisten Schwächen"
	cont "aller Typen."

	para "Ich habe aber"
	line "nicht das Herz, es"
	cont "ihr zu sagen."
	done

PewterCityBugCatcherText:
	text "NACHTs spielen"
	line "PIEPI beim"
	cont "MONDBERG."

	para "Aber nicht in"
	line "jeder Nacht."
	done







PewterCityGrampsText:
	text "Ach, du bist den"
	line "ganzen Weg von"
	cont "JOHTO bis hierher"
	cont "gekommen?"

	para "Das weckt"
	line "Erinnerungen. Als"

	para "ich noch jung war,"
	line "habe ich in JOHTO"
	cont "oft trainiert."

	para "Du erinnerst mich"
	line "an mich"

	para "selbst als junger"
	line "Mann."

	para "Hier. Ich möchte,"
	line "dass du dieses"
	cont "Item, das ich in"
	cont "JOHTO fand,"
	cont "behältst."
	done







PewterCityGrampsText_GotSilverWing:
	text "Neue und"
	line "unbekannte Orte zu"
	cont "erforschen und"
	cont "fremde Menschen"
	cont "kennen zu lernen…"

	para "Das ist das Schöne"
	line "am Reisen."
	done







PewterCityYoungsterText1:
	text "Die MARMORIA-Arena"
	line "ist so rau und"
	cont "hart wie Stein."

	para "Sei dort"
	line "vorsichtig."
	done


PewterCitySignText:
	text "MARMORIA CITY Eine"
	line "Steingraue Stadt"
	done







PewterGymSignText:
	text "#mon-ARENA von"
	line "MARMORIA CITY"
	cont "LEITUNG: ROCKO"

	para "Der Felsenharte"
	line "#mon-Trainer"
	done







PewterMuseumOfScienceSignText:
	text "Pewter Museum of"
	line "Science"
	done

PewterCityMtMoonGiftShopSignText:
	text "Hier ist eine"
	line "Nachricht…"

	para "SOUVENIRLADEN AM"
	line "MONDBERG Jetzt"
	cont "geöffnet!"
	done







PewterCityTrainerTipsText:
	text "Profi-Tipps!"

	para "Ein #mon mit"
	line "Fähigkeitskappe"

	para "hat eher Nachwuchs"
	line "mit einer seltenen"
	cont "Fähigkeit."
	done
