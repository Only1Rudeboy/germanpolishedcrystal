CeladonDeptStore4F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 12,  0, CELADON_DEPT_STORE_5F, 1
	warp_event 15,  0, CELADON_DEPT_STORE_3F, 2
	warp_event  2,  0, CELADON_DEPT_STORE_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event 14,  0, BGEVENT_JUMPTEXT, CeladonDeptStore4FDirectoryText

	def_object_events
	object_event 13,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, pokemart, MARTTYPE_STANDARD, MART_CELADON_4F, -1
	object_event  7,  6, SPRITE_POKEMANIAC, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonDeptStore4FSuperNerdText, -1
	object_event  8,  2, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonDeptStore4FYoungsterText, -1
	object_event 15,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PosterClerkScript, -1

PosterClerkScript:
	faceplayer
	opentext
	writetext PosterClerkText
	special PlaceMoneyTopRight
.Start:
	loadmenu .MenuData
	verticalmenu
	closewindow
	ifequalfwd $1, .MarillPoster
	ifequalfwd $2, .ClefairyPoster
	ifequalfwd $3, .PikachuPoster
	endtext

.MarillPoster:
	checkmoney YOUR_MONEY, 3200
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_POSTER_3
	iftruefwd .AlreadyBought
	takemoney YOUR_MONEY, 3200
	setevent EVENT_DECO_POSTER_3
	writetext BoughtMarillPosterText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext MarillPosterSentText
	waitbutton
	sjump .Start

.ClefairyPoster:
	checkmoney YOUR_MONEY, 4800
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_POSTER_2
	iftruefwd .AlreadyBought
	takemoney YOUR_MONEY, 4800
	setevent EVENT_DECO_POSTER_2
	writetext BoughtClefairyPosterText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext ClefairyPosterSentText
	waitbutton
	sjump .Start

.PikachuPoster:
	checkmoney YOUR_MONEY, 6400
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_POSTER_1
	iftruefwd .AlreadyBought
	takemoney YOUR_MONEY, 6400
	setevent EVENT_DECO_POSTER_1
	writetext BoughtPikachuPosterText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext PikachuPosterSentText
	waitbutton
	sjump .Start

.NotEnoughMoney:
	writetext PosterClerkNoMoneyText
	waitbutton
	sjump .Start

.AlreadyBought:
	writetext PosterClerkAlreadyBoughtText
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
	db "Marill      ¥3200@"
	db "Pixi        ¥4800@"
	db "Pikachu     ¥6400@"
	db "Abbrechen@"

PosterClerkText:
	text "Willkommen!"
	line "Möchtest du ein"
	cont "Poster?"
	done

PosterClerkNoMoneyText:
	text "Du hast nicht"
	line "genug Geld."
	done

PosterClerkAlreadyBoughtText:
	text "Das hast du"
	line "schon gekauft."
	done

BoughtMarillPosterText:
	text "<PLAYER> kaufte"
	line "ein Marill-"
	cont "Poster."
	done

MarillPosterSentText:
	text "Das Marill-"
	line "Poster wurde nach"
	cont "Hause geschickt."
	done

BoughtClefairyPosterText:
	text "<PLAYER> kaufte"
	line "ein Pixi-Poster."
	done

ClefairyPosterSentText:
	text "Das Pixi-Poster"
	line "wurde nach Hause"
	cont "geschickt."
	done

BoughtPikachuPosterText:
	text "<PLAYER> kaufte"
	line "ein Pikachu-"
	cont "Poster."
	done

PikachuPosterSentText:
	text "Das Pikachu-"
	line "Poster wurde nach"
	cont "Hause geschickt."
	done

CeladonDeptStore4FSuperNerdText:
	text "Ich bin hier, um"
	line "Herzbrief für"
	cont "meine Freundin"

	para "zu kaufen."
	done

CeladonDeptStore4FYoungsterText:
	text "Das ist der"
	line "einzige Ort, wo"
	cont "man Poster kauft."

	para "Ich sammle sie!"
	done

CeladonDeptStore4FDirectoryText:
	text "Drück dich mit"
	line "Geschenken aus!"

	para "4F: Weisen-"
	line "    Geschenke"
	done
