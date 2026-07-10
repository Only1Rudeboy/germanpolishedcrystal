GoldenrodHoneyHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 21
	warp_event  3,  7, GOLDENROD_CITY, 21

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodHoneyHousePokefanFScript, -1
	pokemon_event  6,  3, BUTTERFREE, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BLUE, GoldenrodHoneyHouseButterfreeText, -1

GoldenrodHoneyHousePokefanFScript:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue_jumptextfaceplayer .AfterText
	checkevent EVENT_GOT_HONEY_FROM_GOLDENROD
	iftruefwd .SellHoney
	faceplayer
	opentext
	writetext .IntroText
	promptbutton
	verbosegiveitem SWEET_HONEY
	iffalse_endtext
	setevent EVENT_GOT_HONEY_FROM_GOLDENROD
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	jumpthisopenedtext

.AfterText:
	text "Mein kleiner"
	line "Bruder"
if DEF(FAITHFUL)
	line "nimmt Honig und"

	para "streut ihn in"
else
	line "nimmt Süßen Honig"

	para "und streut ihn in"
endc
	line "hohes Gras."

	para "#mon werden"
	line "dadurch"
	cont "angelockt."

	para "Meist kommen #-"
	line "mon auf deinem"
	cont "Level!"
	done

.IntroText:
	text "Mein #mon ist"
	line "ein Experte beim"

	para "Sammeln von"
if DEF(FAITHFUL)
	line "Honig."
else
	line "Süßem Honig."
endc

	para "Ich teile etwas"
	line "mit dir."
	done

.SellHoney:
	faceplayer
	opentext
	writetext .SellText
	special PlaceMoneyTopRight
	loadmenu .MenuDataHeader
	verticalmenu
	closewindow
	ifequalfwd $1, .Buy1
	ifequalfwd $2, .Buy10
	jumpthisopenedtext ; cancel

	text "Na dann, komm"
	line "wieder vorbei!"
	done

.Buy1:
	checkmoney YOUR_MONEY, 1000
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	giveitem SWEET_HONEY
	iffalse_jumpopenedtext .BagFullText
	takemoney YOUR_MONEY, 1000
	sjumpfwd .Done

.Buy10:
	checkmoney YOUR_MONEY, 10000
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	giveitem SWEET_HONEY, 10
	iffalse_jumpopenedtext .BagFullText
	takemoney YOUR_MONEY, 10000

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
	line "genug Geld,"
	cont "Süßer!"
	done

.SellText:
	text "Möchtest du"
if DEF(FAITHFUL)
	line "Honig kaufen,"

	para "um #mon"
	line "anzulocken?"
else
	line "Süßen Honig"

	para "kaufen, um #-"
	line "mon anzulocken?"
endc
	cont "Nur ¥1000 pro"
	cont "Stück!"
	done

.GoodbyeText:
	text "Bitte sehr!"
	done

.BagFullText:
	text "Hoppla! Du hast"
	line "keinen Platz"
	cont "dafür."
	done

.MenuDataHeader:
	db $40 ; flags
	db 04, 00 ; start coords
	db 11, 14 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 3 ; items
	db "× 1   ¥1000@"
	db "×10  ¥10000@"
	db "Cancel@"

GoldenrodHoneyHouseButterfreeText:
	text "SMETTBO: Boh!"
	done
