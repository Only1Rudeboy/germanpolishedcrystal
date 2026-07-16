DEF ROUTE39FARMHOUSE_MILK_PRICE EQU 500
DEF ROUTE39FARMHOUSE_DOZEN_MILK_PRICE EQU 6000

Route39Farmhouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, ROUTE_39, 2
	warp_event  3,  7, ROUTE_39, 2

	def_coord_events

	def_bg_events
	bg_event  6,  1, BGEVENT_JUMPSTD, picturebookshelf
	bg_event  7,  1, BGEVENT_JUMPSTD, picturebookshelf

	def_object_events
	object_event  3,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PokefanM_DairyFarmer, -1
	object_event  5,  4, SPRITE_MATRON, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PokefanF_AcrobaticsFarmer, -1

PokefanM_DairyFarmer:
	faceplayer
	opentext
	checkevent EVENT_HEALED_MOOMOO
	iftruefwd FarmerMScript_SellMilk
	writetext FarmerMText_SickCow
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_FARMER_ABOUT_MOOMOO
	end

FarmerMScript_SellMilk:
	checkflag ENGINE_BOUGHT_MOOMOO_MILK
	iftruefwd .Milking
	writetext FarmerMText_BuyMilk
	special PlaceMoneyTopRight
	loadmenu .MenuDataHeader
	verticalmenu
	closewindow
	ifequalfwd $1, .Buy1
	ifequalfwd $2, .Buy12
	sjumpfwd .Cancel

.Buy1:
	checkmoney YOUR_MONEY, ROUTE39FARMHOUSE_MILK_PRICE
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	giveitem MOOMOO_MILK
	iffalsefwd .BagFull
	takemoney YOUR_MONEY, ROUTE39FARMHOUSE_MILK_PRICE
	sjumpfwd .Done

.Buy12:
	checkmoney YOUR_MONEY, ROUTE39FARMHOUSE_DOZEN_MILK_PRICE
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	giveitem MOOMOO_MILK, 12
	iffalsefwd .BagFull
	takemoney YOUR_MONEY, ROUTE39FARMHOUSE_DOZEN_MILK_PRICE

.Done:
	setflag ENGINE_BOUGHT_MOOMOO_MILK
	special PlaceMoneyTopRight
	waitsfx
	playsound SFX_TRANSACTION
	writetext FarmerMText_GotMilk
	promptbutton
	itemnotify
	endtext

.Cancel:
	jumpthisopenedtext

	; GSC-DE Dump
	text "Du hast kein"
	line "Interesse? Komm"
	cont "aber wieder, hörst"
	cont "du?"
	done

.NotEnoughMoney:
	jumpthisopenedtext

	; GSC-DE Dump
	text "Tut mir Leid, mein"
	line "Kind. Wenn du kein"
	cont "Geld hast, kann"
	cont "ich dir nichts"
	cont "verkaufen!"
	done

.BagFull:
	jumpthisopenedtext

	; GSC-DE Dump
	text "Ich schätze,"
	line "dein BEUTEL ist"
	cont "voll."
	done

.MenuDataHeader:
	db MENU_BACKUP_TILES
	menu_coords 0, 4, 14, 11
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 3 ; items
	db "× 1    ¥{d:ROUTE39FARMHOUSE_MILK_PRICE}@"
	db "×12   ¥{d:ROUTE39FARMHOUSE_DOZEN_MILK_PRICE}@"
	db "Abbrechen@"

.Milking:
	jumpthisopenedtext

	; GSC-DE Dump
	text "Dann melke ich"
	line "mal weiter."
	done

PokefanF_AcrobaticsFarmer:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM62_ACROBATICS_FROM_MOOMOO_FARM
	iftruefwd .GotAcrobatics
	checkevent EVENT_HEALED_MOOMOO
	iftruefwd .GiveAcrobatics
	jumpthisopenedtext

	; GSC-DE Dump
	text "Unsere Milch wird"
	line "sogar nach KANTO"
	cont "geliefert."

	para "Wenn uns unser"
	line "MILTANK keine"

	para "Milch mehr gibt,"
	line "haben wir echte"
	cont "Probleme."
	done

.GiveAcrobatics:
	writetext FarmerFText_HealedMiltank
	promptbutton
	verbosegivetmhm TM_ACROBATICS
	setevent EVENT_GOT_TM62_ACROBATICS_FROM_MOOMOO_FARM
.GotAcrobatics:
	jumpthisopenedtext

	; GSC-DE Dump-Wording (PC: Akrobatik / TM62)
	text "Das hier ist"
	line "Akrobatik."

	para "Eine Attacke, die"
	line "mehr schadet,"

	para "wenn dein #MON"
	line "kein Item hält."

	para "Überlege dir gut,"
	line "wie du sie"
	cont "anwendest."
	done

FarmerMText_SickCow:
	; GSC-DE Dump
	text "Mein MILTANK gibt"
	line "keine Milch"
	cont "mehr."

	para "Diese FARM ist"
	line "berühmt für die"
	cont "Milch, die hier"
	cont "produziert wird."

	para "Fast jeder trinkt"
	line "sie gern."

	para "Es würde mir viel"
	line "Milch geben, wenn"

	para "ich es mit vielen"
	line "BEEREN füttern"
	cont "würde. Glaube ich"
	cont "zumindest."
	done






FarmerMText_BuyMilk:
	; GSC-DE Dump (+ PC Preis-Var)
	text "Wie findest du"
	line "die MILCH von"
	cont "meinem MILTANK?"

	para "Sie ist mein gan-"
	line "zer Stolz."

	para "Gib sie einem"
	line "#MON, um dessen"
	cont "KP aufzufrischen!"

	para "Ich gebe sie dir"
	line "für nur ¥{d:ROUTE39FARMHOUSE_MILK_PRICE}."
	done





FarmerMText_GotMilk:
	; GSC-DE Dump
	text "Bitte sehr!"
	line "Trink aus und"
	cont "genieße es!"
	done






FarmerFText_HealedMiltank:
	; GSC-DE Dump
	text "Du hast unserem"
	line "MILTANK geholfen!"

	para "Jetzt gibt es"
	line "wieder Milch!"

	para "Hier, für deine"
	line "Mühe."
	done






Text_ReceivedTM13: ; unreferenced
	; GSC-DE Dump (TM13 / unreferenced)
	text "<PLAYER> erhält"
	line "TM13."
	done



