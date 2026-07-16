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

; PC-erweitert (Verkauf); Dump-Wurzeln wo passend

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
	; GSC-DE Dump
	text "Mein kleiner Bru-"
	line "der nimmt den HO-"
	cont "NIG und bringt ihn"
	cont "irgendwo hin."

	para "Ich frage mich,"
	line "was er vorhat?"
	done

.IntroText:
	; GSC-DE Dump (PC: ggf. Süßer Honig)
	text "Mein #MON ist"
	line "Meister im Sammeln"
if DEF(FAITHFUL)
	cont "von HONIG."
else
	cont "von Süßem Honig."
endc

	para "Ich gebe dir gerne"
	line "etwas ab."
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
	line "genug Geld, Süßer!"
	done

.SellText:
	; PC-only Verkauf
	text "Möchtest du"
if DEF(FAITHFUL)
	line "HONIG kaufen,"

	para "um #MON"
	line "anzulocken?"
else
	line "Süßen Honig"

	para "kaufen, um #MON"
	line "anzulocken?"
endc
	cont "Nur ¥1000 pro"
	cont "Stück!"
	done

.GoodbyeText:
	; GSC-DE Dump-Ton
	text "Bitte schön! Nimm"
	line "etwas HONIG!"
	done

.BagFullText:
	; GSC-DE Dump-Ton
	text "Ich würde dir ger-"
	line "ne etwas HONIG ge-"
	cont "ben, aber du hast"
	cont "nicht genug Platz."
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
	; GSC-DE Dump
	text "SMETTBO: Booh!"
	done
