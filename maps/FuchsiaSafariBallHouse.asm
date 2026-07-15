FuchsiaSafariBallHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, FUCHSIA_CITY, 11
	warp_event  3,  7, FUCHSIA_CITY, 11

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FuchsiaSafariBallHouseOfficerScript, -1

FuchsiaSafariBallHouseOfficerScript:
	faceplayer
	opentext
	writetext .IntroText
	special PlaceMoneyTopRight
	loadmenu .MenuDataHeader
	verticalmenu
	closewindow
	ifequalfwd $1, .Buy1
	ifequalfwd $2, .Buy10
	jumpthisopenedtext ; cancel

	text "Was soll ich nur"
	line "mit allen machen?"
	done

.Buy1:
	checkmoney YOUR_MONEY, 2000
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	giveitem SAFARI_BALL
	iffalse_jumpopenedtext .BagFullText
	takemoney YOUR_MONEY, 2000
	sjumpfwd .Done

.Buy10:
	checkmoney YOUR_MONEY, 20000
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	giveitem SAFARI_BALL, 10
	iffalse_jumpopenedtext .BagFullText
	takemoney YOUR_MONEY, 20000

.Done:
	special PlaceMoneyTopRight
	waitsfx
	playsound SFX_TRANSACTION
	writetext .GoodbyeText
	promptbutton
	itemnotify
	endtext

.NotEnoughMoney:
	jumpthisopenedtext

	text "Du hast nicht"
	line "genug Geld."
	done
.IntroText:
	text "Früher leitete ich"
	line "das Safari-Spiel."
	para "Jetzt, wo es zu"
	line "ist, muss ich auf"
	para "andere Weise Geld"
	line "verdienen."
	para "Willst du übrig"
	line "gebliebene"
	cont "Safari-Bälle"
	cont "kaufen?"
	para "Sie sind"
	line "Sammlerstücke!"
	done

.GoodbyeText:
	text "Danke, Kumpel!"
	done

.BagFullText:
	text "Du kannst sie"
	line "nicht tragen!"
	done

.MenuDataHeader:
	db MENU_BACKUP_TILES
	menu_coords 0, 4, 14, 11
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 3 ; items
	db "× 1   ¥2000@"
	db "×10  ¥20000@"
	db "Cancel@"
