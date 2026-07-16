CeladonDeptStore3F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 12,  0, CELADON_DEPT_STORE_2F, 1
	warp_event 15,  0, CELADON_DEPT_STORE_4F, 2
	warp_event  2,  0, CELADON_DEPT_STORE_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event 14,  0, BGEVENT_JUMPTEXT, CeladonDeptStore3FDirectoryText
	bg_event  2,  3, BGEVENT_JUMPTEXT, CeladonDeptStore3FRPGText
	bg_event  5,  3, BGEVENT_JUMPTEXT, CeladonDeptStore3FSportsGameText
	bg_event  2,  5, BGEVENT_JUMPTEXT, CeladonDeptStore3FPuzzleGameText
	bg_event  5,  5, BGEVENT_JUMPTEXT, CeladonDeptStore3FFightingGameText

	def_object_events
	object_event  9,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, pokemart, MARTTYPE_TM, MART_CELADON_3F_TM, -1
	object_event  8,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore3FClerk2Script, -1
	object_event  7,  5, SPRITE_CAMPER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonDeptStore3FYoungsterText, -1
	object_event 13,  4, SPRITE_POKEMANIAC, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonDeptStore3FSuperNerdText, -1
	object_event  0,  4, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, VideoGameClerkText, -1
	object_event  1,  3, SPRITE_SNES, SPRITEMOVEDATA_STILL, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore3FSnesScript, -1
	object_event  1,  5, SPRITE_N64, SPRITEMOVEDATA_STILL, 0, 0, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore3FN64Script, -1
	object_event  4,  3, SPRITE_GAMECUBE, SPRITEMOVEDATA_STILL, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore3FGameCubeScript, -1
	object_event  4,  5, SPRITE_WII, SPRITEMOVEDATA_STILL, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore3FWiiScript, -1

CeladonDeptStore3FClerk2Script:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_COUNTER_INTRO
	iftruefwd CeladonDeptStore3FTutorCounterScript
	writetext CeladonDeptStore3FClerk2Text
	waitbutton
	setevent EVENT_LISTENED_TO_COUNTER_INTRO
CeladonDeptStore3FTutorCounterScript:
	writetext Text_CeladonDeptStore3FTutorCounter
	waitbutton
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	writetext Text_CeladonDeptStore3FTutorQuestion
	yesorno
	iffalsefwd .TutorRefused
	setval COUNTER
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpthisopenedtext

	text "Schon gut."
	done

.NoSilverLeaf
	jumpthisopenedtext

	text "Du hast kein"
	line "Silberblatt…"
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "Jetzt kennt dein"
	line "#MON Konter."
	done

VideoGameClerkNoMoneyScript:
	jumpthisopenedtext

	text "VERKÄUFER: Das"
	line "kannst du dir"
	cont "nicht leisten!"
	done

CeladonDeptStore3FSnesScript:
	checkevent EVENT_DECO_SNES
	iftrue_jumptext CeladonDeptStore3FSnesText
	opentext
	writetext VideoGameClerkSellSnesText
	special PlaceMoneyTopRight
	yesorno
	iffalse_jumpopenedtext VideoGameClerkNoSaleText
	checkmoney YOUR_MONEY, 20000
	ifequal HAVE_LESS, VideoGameClerkNoMoneyScript
	takemoney YOUR_MONEY, 20000
	setevent EVENT_DECO_SNES
	writetext BoughtSnesText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	jumpthisopenedtext

	text "Das Super NES"
	line "wurde nach Hause"
	cont "geschickt."
	done

CeladonDeptStore3FN64Script:
	checkevent EVENT_DECO_N64
	iftrue_jumptext CeladonDeptStore3FN64Text
	opentext
	writetext VideoGameClerkSellN64Text
	special PlaceMoneyTopRight
	yesorno
	iffalse_jumpopenedtext VideoGameClerkNoSaleText
	checkmoney YOUR_MONEY, 25000
	ifequal HAVE_LESS, VideoGameClerkNoMoneyScript
	takemoney YOUR_MONEY, 25000
	setevent EVENT_DECO_N64
	writetext BoughtN64Text
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	jumpthisopenedtext

	text "Das Nintendo 64"
	line "wurde nach Hause"
	cont "geschickt."
	done

CeladonDeptStore3FGameCubeScript:
	checkevent EVENT_DECO_GAMECUBE
	iftrue_jumptext CeladonDeptStore3FGameCubeText
	opentext
	writetext VideoGameClerkSellGameCubeText
	special PlaceMoneyTopRight
	yesorno
	iffalse_jumpopenedtext VideoGameClerkNoSaleText
	checkmoney YOUR_MONEY, 30000
	ifequal HAVE_LESS, VideoGameClerkNoMoneyScript
	takemoney YOUR_MONEY, 30000
	setevent EVENT_DECO_GAMECUBE
	writetext BoughtGameCubeText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	jumpthisopenedtext

	text "Der GameCube wurde"
	line "nach Hause"
	cont "geschickt."
	done

CeladonDeptStore3FWiiScript:
	checkevent EVENT_DECO_WII
	iftrue_jumptext CeladonDeptStore3FWiiText
	opentext
	writetext VideoGameClerkSellWiiText
	special PlaceMoneyTopRight
	yesorno
	iffalse_jumpopenedtext VideoGameClerkNoSaleText
	checkmoney YOUR_MONEY, 40000
	ifequal HAVE_LESS, VideoGameClerkNoMoneyScript
	takemoney YOUR_MONEY, 40000
	setevent EVENT_DECO_WII
	writetext BoughtWiiText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	jumpthisopenedtext

	text "Die Wii wurde nach"
	line "Hause geschickt."
	done

CeladonDeptStore3FClerk2Text:
	text "Es gibt eine coole"
	line "Attacke namens"
	cont "Konter."
	para "Nicht die Art"
	line "Theke, an der ich"
	cont "hier lehne!"
	done

Text_CeladonDeptStore3FTutorCounter:
	text "Ich bringe deinem"
	line "#MON Konter"
	cont "bei,"
	para "wenn du mir ein"
	line "Silberblatt gibst."
	done


Text_CeladonDeptStore3FTutorQuestion:
	text "Soll ich deinem"
	line "#MON Konter"
	cont "beibringen?"
	done



VideoGameClerkText:
	text "Wir verkaufen neue"
	line "und alte"
	cont "Spielsysteme!"
	para "Probier sie doch"
	line "selbst aus!"
	done

VideoGameClerkNoSaleText:
	text "VERKÄUFER: Na gut,"
	line "wenn du meinst."
	done


VideoGameClerkSellSnesText:
	text "VERKÄUFER: Das"
	line "SNES gehört dir"
	cont "für nur ¥20.000!"

	para "Willst du eins?"
	done

VideoGameClerkSellN64Text:
	text "VERKÄUFER: Das N64"
	line "gehört dir für nur"
	cont "¥25.000!"
	para "Willst du eins?"
	done

VideoGameClerkSellGameCubeText:
	text "VERKÄUFER: Der"
	line "GameCube gehört"
	cont "dir für"

	para "nur ¥30.000!"
	line "Willst du eins?"
	done

VideoGameClerkSellWiiText:
	text "VERKÄUFER: Die Wii"
	line "gehört dir für nur"
	cont "¥40.000!"
	para "Willst du eins?"
	done

BoughtSnesText:
	text "<PLAYER> kaufte ein"
	line "Super NES."
	done


BoughtN64Text:
	text "<PLAYER> kaufte ein"
	line "Nintendo 64."
	done


BoughtGameCubeText:
	text "<PLAYER> kaufte"
	line "einen GameCube."
	done


BoughtWiiText:
	text "<PLAYER> kaufte"
	line "eine Wii."
	done


CeladonDeptStore3FYoungsterText:
	; GSC-DE Dump
	text "Ich kann mich"
	line "nicht entscheiden,"
	para "welches #MON"
	line "diese TM erhalten"
	cont "soll…"
	done

CeladonDeptStore3FSuperNerdText:
	; GSC-DE Dump
	text "Im TM-LADEN erhält"
	line "man seltene"
	cont "Attacken."
	done

CeladonDeptStore3FDirectoryText:
	; GSC-DE Dump (PC 3F)
	text "3F: TM-LADEN"
	para "Mach Deine #MON"
	line "Stärker!"
	done

CeladonDeptStore3FSnesText:
	text "Ein Super NES!"
	para "Ich hab so eins zu"
	line "Hause!"
	done

CeladonDeptStore3FN64Text:
	text "Ein N64!"
	para "Ich hab so eins zu"
	line "Hause!"
	done

CeladonDeptStore3FGameCubeText:
	text "Ein GameCube!"
	para "Ich hab so eins zu"
	line "Hause!"
	done

CeladonDeptStore3FWiiText:
	text "Eine Wii!"
	para "Ich hab so eine zu"
	line "Hause!"
	done

CeladonDeptStore3FRPGText:
	text "Ein RPG! Dafür hab"
	line "ich keine Zeit!"
	done

CeladonDeptStore3FSportsGameText:
	text "Ein Sportspiel!"
	line "Das wird Papa"
	cont "gefallen!"
	done

CeladonDeptStore3FPuzzleGameText:
	text "Ein Puzzlespiel!"
	line "Sieht süchtig"
	cont "machend aus!"
	done

CeladonDeptStore3FFightingGameText:
	text "Ein Prügelspiel!"
	line "Sieht hart aus!"
	done
