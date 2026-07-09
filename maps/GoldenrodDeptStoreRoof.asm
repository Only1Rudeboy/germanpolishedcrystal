GoldenrodDeptStoreRoof_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, GoldenrodDeptStoreRoofCheckSaleChangeBlock
	callback MAPCALLBACK_OBJECTS, GoldenrodDeptStoreRoofCheckSaleChangeClerk

	def_warp_events
	warp_event 13,  1, GOLDENROD_DEPT_STORE_6F, 3

	def_coord_events

	def_bg_events
	bg_event 15,  3, BGEVENT_RIGHT, Binoculars1
	bg_event 15,  5, BGEVENT_RIGHT, Binoculars2
	bg_event 15,  6, BGEVENT_RIGHT, Binoculars3
	bg_event  3,  0, BGEVENT_UP, PokeDollVendingMachine

	def_object_events
	object_event  2,  1, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreRoofFisherScript, -1
	object_event 10,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodDeptStoreRoofPokefanFText, -1
	object_event 14,  6, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreRoofSuperNerdScript, EVENT_GOLDENROD_SALE_ON
	object_event  3,  4, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodDeptStoreRoofTwinText, EVENT_GOLDENROD_SALE_ON
	object_event  1,  4, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, pokemart, MARTTYPE_ROOFTOP, 0, EVENT_GOLDENROD_SALE_OFF
	object_event  7,  0, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodDeptStoreRoofPokefanMText, EVENT_GOLDENROD_SALE_OFF
	object_event  5,  3, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodDeptStoreRoofTeacherText, EVENT_GOLDENROD_SALE_OFF
	object_event  1,  6, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodDeptStoreRoofBugCatcherText, EVENT_GOLDENROD_SALE_OFF

GoldenrodDeptStoreRoofCheckSaleChangeBlock:
	checkflag ENGINE_GOLDENROD_DEPT_STORE_SALE_IS_ON
	iftruefwd .ChangeBlock
	endcallback

.ChangeBlock:
	changeblock 0, 2, $3f
	changeblock 0, 4, $f
	endcallback

GoldenrodDeptStoreRoofCheckSaleChangeClerk:
	checkflag ENGINE_GOLDENROD_DEPT_STORE_SALE_IS_ON
	iftruefwd .ChangeClerk
	setevent EVENT_GOLDENROD_SALE_OFF
	clearevent EVENT_GOLDENROD_SALE_ON
	endcallback

.ChangeClerk:
	clearevent EVENT_GOLDENROD_SALE_OFF
	setevent EVENT_GOLDENROD_SALE_ON
	endcallback

GoldenrodDeptStoreRoofFisherScript:
	faceplayer
	opentext
	checkevent EVENT_DECO_VOLTORB_DOLL
	iftruefwd .AlreadyGotVoltorbDoll
	writetext GoldenrodDeptStoreRoofFisherText
	waitbutton
	writetext GoldenrodDeptStoreRoofFisherDuplicateText
	waitbutton
	setevent EVENT_DECO_VOLTORB_DOLL
	writetext GotVoltorbDollText
	playsound SFX_ITEM
	pause 60
	promptbutton
	writetext VoltorbDollSentText
	waitbutton
.AlreadyGotVoltorbDoll
	writetext GoldenrodDeptStoreRoofFisherCatchEmAllText
	waitbutton
	closetext
	turnobject LAST_TALKED, UP
	end

GoldenrodDeptStoreRoofSuperNerdScript:
	showtext GoldenrodDeptStoreRoofSuperNerdOhWowText
	faceplayer
	showtext GoldenrodDeptStoreRoofSuperNerdQuitBotheringMeText
	turnobject LAST_TALKED, RIGHT
	end

Binoculars1:
	jumpthistext

	text "Mit diesem Fern-"
	line "glas kann ich"
	cont "weit"

	para "sehen. Vielleicht"
	line "sogar mein Haus."

	para "Ist es das mit"
	line "dem"
	line "grünen Dach?"
	done
Binoculars2:
	jumpthistext

	text "Heh! Einige"
	line "Trainer kämpfen"
	cont "auf dem Weg!"

	para "Ein #mon schoss"
	line "mit Blättern!"

	para "Wenn ich das"
	line "sehe,"
	line "will ich sofort"
	cont "kämpfen!"
	done
Binoculars3:
	jumpthistext

	text "Ein ANGLER fing"
	line "viele KARPADOR…"

	para "Sie setzen alle"
	line "gleichzeitig"
	cont "PLATSCHER ein!"

	para "Sieh nur wie das"
	line "Wasser überall"
	cont "hinspritzt!"
	done
PokeDollVendingMachine:
	opentext
	writetext PokeDollVendingMachineText
	special PlaceMoneyTopRight
.Start:
	loadmenu .MenuData
	verticalmenu
	closewindow
	ifequalfwd $1, .JigglypuffDoll
	ifequalfwd $2, .DittoDoll
	ifequalfwd $3, .MeowthDoll
	endtext

.JigglypuffDoll:
	checkmoney YOUR_MONEY, 2400
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_JIGGLYPUFF_DOLL
	iftruefwd .AlreadyBought
	takemoney YOUR_MONEY, 2400
	setevent EVENT_DECO_JIGGLYPUFF_DOLL
	writetext BoughtJigglypuffDollText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext JigglypuffDollSentText
	waitbutton
	sjump .Start

.DittoDoll:
	checkmoney YOUR_MONEY, 2400
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_DITTO_DOLL
	iftruefwd .AlreadyBought
	takemoney YOUR_MONEY, 2400
	setevent EVENT_DECO_DITTO_DOLL
	writetext BoughtDittoDollText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext DittoDollSentText
	waitbutton
	sjump .Start

.MeowthDoll:
	checkmoney YOUR_MONEY, 2400
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_MEOWTH_DOLL
	iftruefwd .AlreadyBought
	takemoney YOUR_MONEY, 2400
	setevent EVENT_DECO_MEOWTH_DOLL
	writetext BoughtMeowthDollText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext MeowthDollSentText
	waitbutton
	sjump .Start

.NotEnoughMoney:
	writetext PokeDollVendingMachineNoMoneyText
	waitbutton
	sjump .Start

.AlreadyBought:
	writetext PokeDollVendingMachineAlreadyBoughtText
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
	db "Jigglypuff  ¥2400@"
	db "Ditto       ¥2400@"
	db "Meowth      ¥2400@"
	db "Cancel@"

GoldenrodDeptStoreRoofPokefanFText:
	text "Puh, bin ich"
	line "müde."

	para "Manchmal gehe ich"
	line "auf die Dach-"
	cont "terrasse, um eine"

	para "Einkaufspause"
	line "einzulegen."
	done





GoldenrodDeptStoreRoofFisherText:
	text "Bitte? Wer sagt,"
	line "dass das nichts"
	cont "für Erwachsene"
	cont "ist?"

	para "Ich komme jeden"
	line "Tag, um wirklich"

	para "alle Puppen zu"
	line "bekommen!"
	done





GoldenrodDeptStoreRoofFisherDuplicateText:
	text "Das ist ein"
	line "Duplikat. Hier,"
	cont "du kannst es"
	cont "haben."
	done

GotVoltorbDollText:
	text "<PLAYER> received"
	line "Voltorb Doll."
	done

VoltorbDollSentText:
	text "Voltorb Doll"
	line "was sent home."
	done

GoldenrodDeptStoreRoofFisherCatchEmAllText:
	text "I heard there are"
	line "30 kinds of"
	cont "dolls."
	done

GoldenrodDeptStoreRoofTwinText:
	text "Oft gibt es hier"
	line "Sonderangebote."
	done





GoldenrodDeptStoreRoofSuperNerdOhWowText:
	text "Ach, wow!"
	done





GoldenrodDeptStoreRoofSuperNerdQuitBotheringMeText:
	text "Hörst du auf,"
	line "mich"
	line "zu belästigen?"
	done





GoldenrodDeptStoreRoofPokefanMText:
	text "Es gibt etwas,"
	line "das"
	line "ich unbedingt"

	para "möchte, aber mir"
	line "fehlt das nötige"
	cont "Kleingeld…"

	para "Soll ich meine"
	line "gesammelten"
	cont "BEEREN"
	cont "verkaufen…"
	done





GoldenrodDeptStoreRoofTeacherText:
	text "Ach, alles ist so"
	line "billig!"

	para "Ich habe soviel"
	line "gekauft, dass"
	cont "mein"
	cont "BEUTEL voll ist!"
	done





GoldenrodDeptStoreRoofBugCatcherText:
	text "Meine #mon"
	line "sind immer para-"
	cont "lysiert oder ver-"
	cont "giftet, wenn es"
	cont "darauf ankommt…"

	para "Daher möchte ich"
	line "HYPERHEILER"
	cont "kaufen."

	para "Hoffentlich gibt"
	line "es noch welche?"
	done





PokeDollVendingMachineText:
	text "Ein Automat, an"
	line "dem man #mon-"
	cont "Puppen kaufen"
	cont "kann."

	para "Wirf Geld ein und"
	line "dreh die Kurbel…"

	para "Er ist fast leer…"
	done





PokeDollVendingMachineNoMoneyText:
	text "It costs too"
	line "much!"
	done

PokeDollVendingMachineAlreadyBoughtText:
	text "Das ist ein"
	line "Duplikat!"
	done

BoughtJigglypuffDollText:
	text "<PLAYER> bought"
	line "Jigglypuff Doll."
	done

JigglypuffDollSentText:
	text "Jigglypuff Doll"
	line "was sent home."
	done

BoughtDittoDollText:
	text "<PLAYER> bought"
	line "Ditto Doll."
	done

DittoDollSentText:
	text "Ditto Doll"
	line "was sent home."
	done

BoughtMeowthDollText:
	text "<PLAYER> bought"
	line "Meowth Doll."
	done

MeowthDollSentText:
	text "Meowth Doll"
	line "was sent home."
	done
