CeladonHomeDecorStore1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  7, CELADON_CITY, 12
	warp_event  4,  7, CELADON_CITY, 12
	warp_event  9,  0, CELADON_HOME_DECOR_STORE_2F, 1

	def_coord_events

	def_bg_events
	bg_event  8,  0, BGEVENT_JUMPTEXT, CeladonHomeDecorStore1FDirectoryText

	def_object_events
	object_event  4,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonHomeDecorStore1FReceptionistText, -1
	object_event  5,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonHomeDecorStore1FClerkScript, -1
	object_event  7,  5, SPRITE_MON_ICON, SPRITEMOVEDATA_STILL, 0, BULBASAUR, -1, PAL_MON_TEAL, OBJECTTYPE_SCRIPT, NO_FORM, CeladonHomeDecorStore1FBulbasaurDollScript, -1
	object_event  8,  5, SPRITE_MON_ICON, SPRITEMOVEDATA_STILL, 0, CHARMANDER, -1, PAL_MON_ORANGE, OBJECTTYPE_SCRIPT, NO_FORM, CeladonHomeDecorStore1FCharmanderDollScript, -1
	object_event  9,  5, SPRITE_MON_ICON, SPRITEMOVEDATA_STILL, 0, SQUIRTLE, -1, PAL_MON_BLUE, OBJECTTYPE_SCRIPT, NO_FORM, CeladonHomeDecorStore1FSquirtleDollScript, -1
	object_event  0,  4, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonHomeDecorStore1FCooltrainerfText, -1

CeladonHomeDecorStore1FBulbasaurDollScript:
	jumpthistext

	text "Eine niedliche"
	line "Bisasam-Puppe!"
	done

CeladonHomeDecorStore1FCharmanderDollScript:
	jumpthistext

	text "Eine robuste"
	line "Glumanda-Puppe!"
	done

CeladonHomeDecorStore1FSquirtleDollScript:
	jumpthistext

	text "Eine coole"
	line "Schiggy-Puppe!"
	done

CeladonHomeDecorStore1FClerkScript:
	faceplayer
	opentext
	writetext CeladonHomeDecorStore1FClerkText
	special PlaceMoneyTopRight
.Start:
	loadmenu .MenuData
	verticalmenu
	closewindow
	ifequalfwd $1, .BulbasaurDoll
	ifequalfwd $2, .CharmanderDoll
	ifequalfwd $3, .SquirtleDoll
	endtext

.BulbasaurDoll:
	checkmoney YOUR_MONEY, 16000
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_BULBASAUR_DOLL
	iftruefwd .AlreadyBought
	takemoney YOUR_MONEY, 16000
	setevent EVENT_DECO_BULBASAUR_DOLL
	writetext BoughtBulbasaurDollText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext BulbasaurDollSentText
	waitbutton
	sjump .Start

.CharmanderDoll:
	checkmoney YOUR_MONEY, 16000
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_CHARMANDER_DOLL
	iftruefwd .AlreadyBought
	takemoney YOUR_MONEY, 16000
	setevent EVENT_DECO_CHARMANDER_DOLL
	writetext BoughtCharmanderDollText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext CharmanderDollSentText
	waitbutton
	sjump .Start

.SquirtleDoll:
	checkmoney YOUR_MONEY, 16000
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_SQUIRTLE_DOLL
	iftruefwd .AlreadyBought
	takemoney YOUR_MONEY, 16000
	setevent EVENT_DECO_SQUIRTLE_DOLL
	writetext BoughtSquirtleDollText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext SquirtleDollSentText
	waitbutton
	sjump .Start

.NotEnoughMoney:
	writetext CeladonHomeDecorStore1FNoMoneyText
	waitbutton
	sjump .Start

.AlreadyBought:
	writetext CeladonHomeDecorStore1FAlreadyBoughtText
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
	db "Bisasam    ¥16000@"
	db "Glumanda   ¥16000@"
	db "Schiggy    ¥16000@"
	db "Abbrechen@"

CeladonHomeDecorStore1FReceptionistText:
	text "Hallo! Willkommen"
	line "im Wohndeko-"
	cont "Bereich des"

	para "Prismania-"
	line "Kaufhauses!"

	para "Die Übersicht"
	line "hängt an der Wand."
	done

CeladonHomeDecorStore1FClerkText:
	text "Willkommen!"
	line "Möchtest du eine"
	cont "Puppe als"

	para "Prismania-"
	line "Andenken?"
	done

BoughtBulbasaurDollText:
	text "<PLAYER> kaufte"
	line "Bisasam-Puppe."
	done

BulbasaurDollSentText:
	text "Bisasam-Puppe kam"
	line "nach Hause."
	done

BoughtCharmanderDollText:
	text "<PLAYER> kaufte"
	line "Glumanda-Puppe."
	done

CharmanderDollSentText:
	text "Glumanda-Puppe kam"
	line "nach Hause."
	done

BoughtSquirtleDollText:
	text "<PLAYER> kaufte"
	line "Schiggy-Puppe."
	done

SquirtleDollSentText:
	text "Schiggy-Puppe kam"
	line "nach Hause."
	done

CeladonHomeDecorStore1FNoMoneyText:
	text "Das kannst du dir"
	line "nicht leisten!"
	done

CeladonHomeDecorStore1FAlreadyBoughtText:
	text "Das hast du schon!"
	done

CeladonHomeDecorStore1FCooltrainerfText:
	text "Dieser neue Flügel"
	line "wirkt edler als"

	para "das Haupt-"
	line "Kaufhaus."
	done

CeladonHomeDecorStore1FDirectoryText:
	text "1F: Lobby"

	para "2F: Betten"

	para "3F: Teppiche"

	para "4F: Riesenpuppen"
	done
