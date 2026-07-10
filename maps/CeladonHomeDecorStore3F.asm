CeladonHomeDecorStore3F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  6,  0, CELADON_HOME_DECOR_STORE_2F, 2
	warp_event  9,  0, CELADON_HOME_DECOR_STORE_4F, 1

	def_coord_events

	def_bg_events
	bg_event  8,  0, BGEVENT_JUMPTEXT, CeladonHomeDecorStore3FDirectoryText

	def_object_events
	object_event  7,  7, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonHomeDecorStore3FClerk1Script, -1
	object_event  8,  7, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonHomeDecorStore3FClerk2Script, -1
	object_event  3,  5, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonHomeDecorStore3FYoungsterText, -1
	object_event  9,  3, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonHomeDecorStore3FBeautyText, -1

CeladonHomeDecorStore3FClerk1Script:
	faceplayer
	opentext
	writetext CeladonHomeDecorStore3FClerk1Text
	special PlaceMoneyTopRight
.Start:
	loadmenu .MenuData
	verticalmenu
	closewindow
	ifequalfwd $1, .RedCarpet
	ifequalfwd $2, .YellowCarpet
	ifequalfwd $3, .GreenCarpet
	endtext

.RedCarpet:
	checkmoney YOUR_MONEY, 45000
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_CARPET_1
	iftruefwd .AlreadyBought
	takemoney YOUR_MONEY, 45000
	setevent EVENT_DECO_CARPET_1
	writetext BoughtRedCarpetText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext RedCarpetSentText
	waitbutton
	sjump .Start

.YellowCarpet:
	checkmoney YOUR_MONEY, 45000
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_CARPET_3
	iftruefwd .AlreadyBought
	takemoney YOUR_MONEY, 45000
	setevent EVENT_DECO_CARPET_3
	writetext BoughtYellowCarpetText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext YellowCarpetSentText
	waitbutton
	sjump .Start

.GreenCarpet:
	checkmoney YOUR_MONEY, 45000
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_CARPET_4
	iftruefwd .AlreadyBought
	takemoney YOUR_MONEY, 45000
	setevent EVENT_DECO_CARPET_4
	writetext BoughtGreenCarpetText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext GreenCarpetSentText
	waitbutton
	sjump .Start

.NotEnoughMoney:
	writetext CeladonHomeDecorStore3FNoMoneyText
	waitbutton
	sjump .Start

.AlreadyBought:
	writetext CeladonHomeDecorStore3FAlreadyBoughtText
	waitbutton
	sjump .Start

.MenuData:
	db MENU_BACKUP_TILES
	menu_coords 0, 2, 19, 11
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 4 ; items
	db "Rot       ¥45000@"
	db "Gelb      ¥45000@"
	db "Grün      ¥45000@"
	db "Abbrechen@"

CeladonHomeDecorStore3FClerk2Script:
	checkevent EVENT_DECO_CARPET_2
	iftrue_jumptextfaceplayer CeladonHomeDecorStore3FClerk2Text
	faceplayer
	opentext
	special PlaceMoneyTopRight
	writetext CeladonHomeDecorStore3FClerk2SaleText
	yesorno
	iffalse_jumpopenedtext CeladonHomeDecorStore3FClerk2NoText
	checkmoney YOUR_MONEY, 35000
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	takemoney YOUR_MONEY, 35000
	setevent EVENT_DECO_CARPET_2
	writetext BoughtBlueCarpetText
	special PlaceMoneyTopRight
	playsound SFX_TRANSACTION
	waitbutton
	writetext BlueCarpetSentText
	waitbutton
	jumpthisopenedtext

	text "Danke!"
	line "Schönen Tag noch!"
	done

.NotEnoughMoney:
	jumpopenedtext CeladonHomeDecorStore3FNoMoneyText

CeladonHomeDecorStore3FClerk1Text:
	text "Willkommen!"
	line "Möchtest du einen"
	cont "Teppich?"
	done

CeladonHomeDecorStore3FClerk2Text:
	text "Rundet ein"
	line "Teppich nicht dein"
	cont "Zimmer ab?"
	done

CeladonHomeDecorStore3FClerk2SaleText:
	text "Unser importierter"
	line "Königsblauer"
	cont "Teppich"

	para "ist gerade für"
	line "¥35.000 im"
	cont "Angebot."

	para "Möchtest du"
	line "einen kaufen?"
	done


CeladonHomeDecorStore3FClerk2NoText:
	text "Schönen Tag noch!"
	done

BoughtRedCarpetText:
	text "<PLAYER> kaufte"
	line "den roten Teppich."
	done

RedCarpetSentText:
	text "Der rote Teppich"
	line "kam nach Hause."
	done

BoughtBlueCarpetText:
	text "<PLAYER> kaufte"
	line "den blauen Teppich"
	done

BlueCarpetSentText:
	text "Der blaue Teppich"
	line "kam nach Hause."
	done

BoughtYellowCarpetText:
	text "<PLAYER> kaufte"
	line "den gelben Teppich"
	done

YellowCarpetSentText:
	text "Der gelbe Teppich"
	line "kam nach Hause."
	done

BoughtGreenCarpetText:
	text "<PLAYER> kaufte"
	line "den grünen Teppich"
	done

GreenCarpetSentText:
	text "Der grüne Teppich"
	line "kam nach Hause."
	done

CeladonHomeDecorStore3FNoMoneyText:
	text "Das kannst du"
	line "dir nicht leisten!"
	done

CeladonHomeDecorStore3FAlreadyBoughtText:
	text "Das hast du"
	line "schon!"
	done

CeladonHomeDecorStore3FYoungsterText:
	text "Dieser Teppich"
	line "ist so flauschig!"
	done

CeladonHomeDecorStore3FBeautyText:
	text "Manche Teppiche"
	line "kommen aus"
	cont "Kalos!"
	done

CeladonHomeDecorStore3FDirectoryText:
	text "Farbenfrohe"
	line "Eleganz"

	para "3F: Teppiche"
	done
