GoldenrodFlowerShop_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 6
	warp_event  3,  7, GOLDENROD_CITY, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FlowerShopTeacherScript, -1
	object_event  5,  6, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FlowerShopFloriaScript, EVENT_FLORIA_AT_FLOWER_SHOP
	object_event  6,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, FlowerShopGentlemanText, EVENT_FLORIA_AT_SUDOWOODO

	object_const_def
	const GOLDENRODFLOWERSHOP_TEACHER

FlowerShopTeacherScript:
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftruefwd .SellMulch
	checkevent EVENT_FLORIA_AT_SUDOWOODO
	iftruefwd .MetFloria
	checkflag ENGINE_PLAINBADGE
	iffalse_jumptextfaceplayer GoldenrodFlowerShopTeacherMySisterWentToSeeWigglyTreeRoute36Text
	checkevent EVENT_GOT_SQUIRTBOTTLE
	iftrue_jumptextfaceplayer GoldenrodFlowerShopTeacherStopMySisterText
	faceplayer
	opentext
	writetext GoldenrodFlowerShopTeacherBetterThanWhitneyText
	promptbutton
	verbosegivekeyitem SQUIRTBOTTLE
	setevent EVENT_GOT_SQUIRTBOTTLE
	closetext
	end

.MetFloria:
	checkflag ENGINE_PLAINBADGE
	iffalse_jumptextfaceplayer GoldenrodFlowerShopTeacherAskWantToBorrowWaterBottleText
	checkevent EVENT_GOT_SQUIRTBOTTLE
	iftrue_jumptextfaceplayer GoldenrodFlowerShopTeacherDontDoAnythingDangerousText
	faceplayer
	opentext
	writetext GoldenrodFlowerShopTeacherHeresTheSquirtbottleText
	promptbutton
	verbosegivekeyitem SQUIRTBOTTLE
	setevent EVENT_GOT_SQUIRTBOTTLE
	closetext
	end

.SellMulch:
	faceplayer
	opentext
	writetext WoukdYouLikeMulchText
	special PlaceMoneyTopRight
	loadmenu .MenuDataHeader
	verticalmenu
	closewindow
	ifequalfwd $1, .Buy1
	ifequalfwd $2, .Buy10
	jumpthisopenedtext

	text "Komm bald wieder!"
	done

.Buy1:
	checkmoney YOUR_MONEY, 200
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	giveitem MULCH
	iffalse_jumpopenedtext NoRoomForMulchText
	takemoney YOUR_MONEY, 200
	sjumpfwd .Done

.Buy10:
	checkmoney YOUR_MONEY, 2000
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	giveitem MULCH, 10
	iffalse_jumpopenedtext NoRoomForMulchText
	takemoney YOUR_MONEY, 2000

.Done:
	special PlaceMoneyTopRight
	waitsfx
	playsound SFX_TRANSACTION
	itemnotify
	jumpthisopenedtext

	text "Danke! Komm bald"
	line "wieder!"
	done

.NotEnoughMoney:
	jumpthisopenedtext

	text "Ähm …"
	line "Entschuldige, aber"
	cont "du hast nicht"
	cont "genug Geld."
	done

.MenuDataHeader:
	db MENU_BACKUP_TILES
	menu_coords 0, 4, 14, 11
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 3 ; items
	db "× 1    ¥200@"
	db "×10   ¥2000@"
	db "Cancel@"

FlowerShopFloriaScript:
	checkflag ENGINE_PLAINBADGE
	iffalse_jumptextfaceplayer GoldenrodFlowerShopFloriaWonderIfSisWillLendWaterBottleText
	checkevent EVENT_FOUGHT_SUDOWOODO
	iffalse_jumptextfaceplayer GoldenrodFlowerShopFloriaYouBeatWhitneyText
	checkitem MULCH
	iftrue_jumptextfaceplayer DescribeMulchText
	jumpthistextfaceplayer

	text "Der wackelige Baum"
	line "war also wirklich"
	cont "ein #mon!"
	done


GoldenrodFlowerShopTeacherMySisterWentToSeeWigglyTreeRoute36Text:
	text "Hast du den"
	line "wacke-ligen Baum"
	cont "auf ROUTE 36"
	cont "gesehen?"
	para "Meine kleine"
	line "Schwester war"
	cont "aufgeregt und"
	cont "wollte ihn sich"
	cont "ansehen …"
	para "Ich bin besorgt …"
	line "Ist das riskant?"
	done





GoldenrodFlowerShopTeacherStopMySisterText:
	text "Meine kleine"
	line "Schwester war auf-"
	para "geregt und wollte"
	line "den wackeligen"
	cont "Baum sehen …"
	para "Ich bin besorgt …"
	line "Kannst du sie"
	para "bitte davor"
	line "bewahren, verletzt"
	cont "zu werden?"
	done

GoldenrodFlowerShopTeacherAskWantToBorrowWaterBottleText:
	text "Möchtest du auch"
	line "die Gießkanne"
	cont "ausleihen? Ich"
	cont "werde nicht"
	cont "zulassen,"
	para "dass du etwas"
	line "Gefährliches damit"
	cont "anstellst."
	done





GoldenrodFlowerShopTeacherBetterThanWhitneyText:
	text "Ach, du bist"
	line "besser als BIANKA."
	para "Kennst du den"
	line "wackeligen Baum?"
	para "Wenn du ihn mit"
	line "einer Gießkanne"
	cont "nässest, greift er"
	cont "an."
	para "Aber mit ein paar"
	line "ORDEN solltest du"
	cont "in Ordnung sein."
	done

GoldenrodFlowerShopTeacherHeresTheSquirtbottleText:
	text "Oh, du bist besser"
	line "als BIANKA …"
	para "Dann bist du in"
	line "Ordnung. Hier, die"
	cont "SCHIGGYKANNE!"
	done





GoldenrodFlowerShopTeacherDontDoAnythingDangerousText:
	text "Unternimm nichts"
	line "Gefährliches!"
	done





GoldenrodFlowerShopFloriaWonderIfSisWillLendWaterBottleText:
	text "Als ich meiner"
	line "Schwester von dem"
	para "wackeligen Baum"
	line "erzählte, sagte"
	para "sie mir, dass er"
	line "gefährlich sei."
	para "Ich frage mich, ob"
	line "sie mir ihre"
	cont "Gießkanne leiht,"
	cont "wenn ich BIANKA"
	cont "besiege …"
	done





GoldenrodFlowerShopFloriaYouBeatWhitneyText:
	text "Wow, du hast gegen"
	line "BIANKA gewonnen?"
	done





WoukdYouLikeMulchText:
	text "Möchtest du Dünger"
	line "kaufen?"
	para "Er lässt Beeren"
	line "schneller wachsen!"
	done




NoRoomForMulchText:
	text "Ach nein, dein"
	line "BEUTEL ist voll!"
	done

DescribeMulchText:
	text "Unser Dünger ist"
	line "eine Mischung aus"
	para "hochwertiger Erde"
	line "und #mon-… äh …"
	para "du weißt schon."
	line "Voller Nährstoffe!"
	done

FlowerShopGentlemanText:
	text "Ich arbeite in"
	line "letzter Zeit oft"
	cont "über, also kaufe"

	para "ich Blumen für"
	line "meine Frau."
	done
