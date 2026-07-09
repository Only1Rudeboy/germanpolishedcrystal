GoldenrodHarbor_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 31, 16, GOLDENROD_HARBOR_GATE, 1
	warp_event 31, 17, GOLDENROD_HARBOR_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 29, 19, BGEVENT_JUMPTEXT, GoldenrodHarborSignText
	bg_event 20, 19, BGEVENT_JUMPTEXT, GoldenrodHarborAdvancedTipsSignText
	bg_event 28, 15, BGEVENT_JUMPTEXT, GoldenrodHarborCrateSignText
	bg_event 22, 21, BGEVENT_ITEM + REVIVE, EVENT_GOLDENROD_HARBOR_HIDDEN_REVIVE

	def_object_events
	object_event 17,  3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodHarborFisherScript, -1
	object_event 13,  5, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFisherPaton, -1
	itemball_event 13,  3, STAR_PIECE, 1, EVENT_GOLDENROD_HARBOR_STAR_PIECE
	object_event 27, 15, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, pokemart, MARTTYPE_ADVENTURER, MART_GOLDENROD_HARBOR, -1
	object_event 22, 15, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodHarborPokefanmScript, -1
	object_event 21, 15, SPRITE_MON_ICON, SPRITEMOVEDATA_STILL, 0, MAGIKARP, -1, PAL_MON_ORANGE, OBJECTTYPE_SCRIPT, PLAIN_FORM, GoldenrodHarborMagikarpScript, -1
	object_event 16, 15, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodHarborYoungsterScript, -1
	object_event 16, 20, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, trade, NPC_TRADE_JACQUES, -1
	object_event 40, 16, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_GOLDENROD_CITY_ROCKET_SCOUT
	object_event  6, 14, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_DARK_GREEN, OBJECTTYPE_TRAINER, 5, TrainerSwimmerfKatie, -1
	object_event 23, 28, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmermJames, -1
	object_event 23, 19, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodHarborLass2Text, -1
	object_event  6, 26, SPRITE_SAILBOAT, SPRITEMOVEDATA_SAILBOAT_TOP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT_SILENT, 0, GoldenrodHarborSailboatScript, -1
	object_event  6, 26, SPRITE_SAILBOAT, SPRITEMOVEDATA_SAILBOAT_BOTTOM, 0, 0, -1, 0, OBJECTTYPE_SCRIPT_SILENT, 0, GoldenrodHarborSailboatScript, -1

GoldenrodHarborFisherScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_HYPER_VOICE_INTRO
	iftruefwd GoldenrodHarborTutorHyperVoiceScript
	writetext GoldenrodHarborFisherText
	waitbutton
	setevent EVENT_LISTENED_TO_HYPER_VOICE_INTRO
GoldenrodHarborTutorHyperVoiceScript:
	writetext Text_GoldenrodHarborTutorHyperVoice
	waitbutton
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	writetext Text_GoldenrodHarborTutorQuestion
	yesorno
	iffalsefwd .TutorRefused
	setval HYPER_VOICE
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpthisopenedtext

	text "Na gut."
	done

.NoSilverLeaf
	jumpthisopenedtext

	text "Du hast kein"
	line "Silberblatt!"
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "So! Dein #mon"
	line "kennt jetzt"
	cont "Hyper Voice!"
	done

GenericTrainerFisherPaton:
	generictrainer FISHER, PATON, EVENT_BEAT_FISHER_PATON, FisherPatonSeenText, FisherPatonBeatenText

	text "Du arbeitest an"
	line "einem #dex?"
	cont "Cool!"
	done

TrainerSwimmerfKatie:
	trainer SWIMMERF, KATIE, EVENT_BEAT_SWIMMERF_KATIE, SwimmerfKatieSeenText, SwimmerfKatieBeatenText, 0, .Script, TRAINERPAL_DARK_SWIMMERF

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "Warum ist das"
	line "Meer"
	line "blau?"

	para "Man sagt, es"
	line "spie-"
	line "gelt den Himmel…"

	para "Aber warum ist"
	line "der"
	line "Himmel blau?"
	done

GenericTrainerSwimmermJames:
	generictrainer SWIMMERM, JAMES, EVENT_BEAT_SWIMMERM_JAMES, SwimmermJamesSeenText, SwimmermJamesBeatenText

	text "Kann ein"
	line "Schwimmer"
	line "nicht auch mal"
	cont "ein"
	cont "Ruderboot nehmen?"
	done


GoldenrodHarborMagikarpScript:
	jumpthistext

	text "Das ist ein"
	line "Fisch-"
	line "#mon! Huh?"

	para "Es ist nur eine"
	line "Puppe…"
	done

GoldenrodHarborPokefanmScript:
	faceplayer
	opentext
	writetext GoldenrodHarborDollVendorText
	special PlaceMoneyTopRight
.Start:
	loadmenu .MenuData
	verticalmenu
	closewindow
	ifequalfwd $1, .MagikarpDoll
	ifequalfwd $2, .MarillDoll
	ifequalfwd $3, .OctilleryDoll
	endtext

.MagikarpDoll:
	checkmoney YOUR_MONEY, 1400
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_MAGIKARP_DOLL
	iftruefwd .AlreadyBought
	takemoney YOUR_MONEY, 1400
	setevent EVENT_DECO_MAGIKARP_DOLL
	writetext GoldenrodHarborMagikarpDollText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext GoldenrodHarborMagikarpDollSentText
	waitbutton
	sjump .Start

.MarillDoll:
	checkmoney YOUR_MONEY, 5600
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_MARILL_DOLL
	iftruefwd .AlreadyBought
	takemoney YOUR_MONEY, 5600
	setevent EVENT_DECO_MARILL_DOLL
	writetext GoldenrodHarborMarillDollText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext GoldenrodHarborMarillDollSentText
	waitbutton
	sjump .Start

.OctilleryDoll:
	checkmoney YOUR_MONEY, 11200
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_OCTILLERY_DOLL
	iftruefwd .AlreadyBought
	takemoney YOUR_MONEY, 11200
	setevent EVENT_DECO_OCTILLERY_DOLL
	writetext GoldenrodHarborOctilleryDollText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext GoldenrodHarborOctilleryDollSentText
	waitbutton
	sjump .Start

.NotEnoughMoney:
	writetext GoldenrodHarborNoMoneyText
	waitbutton
	sjump .Start

.AlreadyBought:
	writetext GoldenrodHarborAlreadyBoughtText
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
	db "Magikarp    ¥1400@"
	db "Marill      ¥5600@"
	db "Octillery  ¥11200@"
	db "Cancel@"

GoldenrodHarborYoungsterScript:
	faceplayer
	opentext
	writetext GoldenrodHarborPlantVendorText
	special PlaceMoneyTopRight
.Start:
	loadmenu .MenuData
	verticalmenu
	closewindow
	ifequalfwd $1, .MagnaPlant
	ifequalfwd $2, .TropicPlant
	ifequalfwd $3, .JumboPlant
	endtext

.MagnaPlant:
	checkmoney YOUR_MONEY, 6400
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_PLANT_1
	iftruefwd .AlreadyBought
	takemoney YOUR_MONEY, 6400
	setevent EVENT_DECO_PLANT_1
	writetext GoldenrodHarborMagnaPlantText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext GoldenrodHarborMagnaPlantSentText
	waitbutton
	sjump .Start

.TropicPlant:
	checkmoney YOUR_MONEY, 9600
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_PLANT_2
	iftruefwd .AlreadyBought
	takemoney YOUR_MONEY, 9600
	setevent EVENT_DECO_PLANT_2
	writetext GoldenrodHarborTropicPlantText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext GoldenrodHarborTropicPlantSentText
	waitbutton
	sjump .Start

.JumboPlant:
	checkmoney YOUR_MONEY, 12800
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_PLANT_3
	iftruefwd .AlreadyBought
	takemoney YOUR_MONEY, 12800
	setevent EVENT_DECO_PLANT_3
	writetext GoldenrodHarborJumboPlantText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext GoldenrodHarborJumboPlantSentText
	waitbutton
	sjump .Start

.NotEnoughMoney:
	writetext GoldenrodHarborNoMoneyText
	waitbutton
	sjump .Start

.AlreadyBought:
	writetext GoldenrodHarborAlreadyBoughtText
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
	db "Magna P.    ¥6400@"
	db "Tropic P.   ¥9600@"
	db "Jumbo P.   ¥12800@"
	db "Cancel@"

GoldenrodHarborSailboatScript:
	readvar VAR_FACING
	ifnotequal DOWN, .show_text
	end
.show_text
	playsound SFX_READ_TEXT_2
	waitsfx
	jumpthistext

	text "Es ist ein Segel-"
	line "boot namens"
	cont "SeaKing."
	done

GoldenrodHarborFisherText:
	text "Beim Angeln muss"
	line "man leise sein,"

	para "damit man die"
	line "#mon nicht"
	cont "verscheucht."

	para "Aber über die"
	line "Wellen"
	line "hinweg muss man"

	para "schon laut sein,"
	line "wenn man gehört"
	cont "werden will!"
	done

Text_GoldenrodHarborTutorHyperVoice:
	text "Ich bringe deinem"
	line "#mon Hyper"

	para "Voice bei — für"
	line "ein Silberblatt."
	done


Text_GoldenrodHarborTutorQuestion:
	text "Soll ich deinem"
	line "#mon Hyper"
	cont "Voice beibringen?"
	done



FisherPatonSeenText:
	text "Der Fisch, den"
	line "ich"
	line "gefangen habe,"
	cont "hing"

	para "an einem anderen"
	line "#mon!"
	done

FisherPatonBeatenText:
	text "Sind #mon nicht"
	line "faszinierend?"
	done

SwimmerfKatieSeenText:
	text "Im tiefblauen"
	line "Meer"
	line "zu schwimmen"
	cont "fühlt"
	cont "sich wunderbar"
	cont "an!"
	done

SwimmerfKatieBeatenText:
	text "Ich hab verloren…"
	line "Jetzt bin ich"
	cont "blau…"
	done

SwimmermJamesSeenText:
	text "Ich kann"
	line "schwimmen,"
	line "aber auch rudern!"
	done

SwimmermJamesBeatenText:
	text "Vielleicht kann"
	line "ich"
	line "nicht kämpfen…"
	done

GoldenrodHarborDollVendorText:
	text "Willkommen! Ich"
	line "hab"
	line "niedliche Wasser-"

	para "puppen zum"
	line "Verkauf."
	done

GoldenrodHarborMagikarpDollText:
	text "<PLAYER> kaufte"
	line "Magikarp-Puppe."
	done

GoldenrodHarborMagikarpDollSentText:
	text "Magikarp-Puppe"
	line "wurde nach Hause"
	cont "geschickt."
	done

GoldenrodHarborMarillDollText:
	text "<PLAYER> kaufte"
	line "Marill-Puppe."
	done

GoldenrodHarborMarillDollSentText:
	text "Marill-Puppe"
	line "wurde nach Hause"
	cont "geschickt."
	done

GoldenrodHarborOctilleryDollText:
	text "<PLAYER> kaufte"
	line "Octillery-Puppe."
	done

GoldenrodHarborOctilleryDollSentText:
	text "Octillery-Puppe"
	line "wurde nach Hause"
	cont "geschickt."
	done

GoldenrodHarborNoMoneyText:
	text "Das kannst du dir"
	line "nicht leisten!"
	done

GoldenrodHarborAlreadyBoughtText:
	text "Das hast du"
	line "schon!"
	done

GoldenrodHarborPlantVendorText:
	text "Willkommen! Ich"
	line "hab"
	line "eine Auswahl"

	para "exotischer"
	line "Pflanzen"
	line "für dein Zuhause."
	done

GoldenrodHarborMagnaPlantText:
	text "<PLAYER> kaufte"
	line "Magna-Pflanze."
	done

GoldenrodHarborMagnaPlantSentText:
	text "Magna-Pflanze"
	line "wurde nach Hause"
	cont "geschickt."
	done

GoldenrodHarborTropicPlantText:
	text "<PLAYER> kaufte"
	line "Tropen-Pflanze."
	done

GoldenrodHarborTropicPlantSentText:
	text "Tropen-Pflanze"
	line "wurde nach Hause"
	cont "geschickt."
	done

GoldenrodHarborJumboPlantText:
	text "<PLAYER> kaufte"
	line "Riesen-Pflanze."
	done

GoldenrodHarborJumboPlantSentText:
	text "Riesen-Pflanze"
	line "wurde nach Hause"
	cont "geschickt."
	done

GoldenrodHarborLass2Text:
	text "So viel Wasser,"
	line "das ist total…"

	para "blub-blub,"
	line "platsch-platsch."

	para "Findest du nicht?"
	done

GoldenrodHarborSignText:
	text "Dukatia-Hafen"
	done

GoldenrodHarborAdvancedTipsSignText:
	text "Profi-Tipps!"

	para "Manchmal hast du"
	line "Glück an einem"

	para "Automaten und"
	line "bekommst zwei"

	para "Getränke zum"
	line "Preis von einem!"
	done

GoldenrodHarborCrateSignText:
	text "Eine Kiste voller"
	line "seltener Items!"
	done
