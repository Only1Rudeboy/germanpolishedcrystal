DEF GOLDENRODGAMECORNER_TM35_COINS EQU 4000
DEF GOLDENRODGAMECORNER_TM24_COINS EQU 4000
DEF GOLDENRODGAMECORNER_TM13_COINS EQU 4000
DEF GOLDENRODGAMECORNER_ABRA_COINS     EQU 200
DEF GOLDENRODGAMECORNER_CUBONE_COINS   EQU 800
DEF GOLDENRODGAMECORNER_CLEFAIRY_COINS EQU 1500

GoldenrodGameCorner_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2, 13, GOLDENROD_CITY, 10
	warp_event  3, 13, GOLDENROD_CITY, 23

	def_coord_events

	def_bg_events
	bg_event  6,  6, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  6,  7, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  6,  8, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  6,  9, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  6, 10, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  6, 11, BGEVENT_RIGHT, GoldenrodGameCornerSlotsMachineScript
	bg_event  7,  6, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  7,  7, BGEVENT_READ, GoldenrodGameCornerLuckySlotsMachineScript
	bg_event  7,  8, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  7,  9, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  7, 10, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  7, 11, BGEVENT_LEFT, GoldenrodGameCornerSlotsMachineScript
	bg_event 12,  6, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event 12,  7, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event 12,  8, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event 12,  9, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event 12, 10, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event 12, 11, BGEVENT_RIGHT, GoldenrodGameCornerSlotsMachineScript
	bg_event 13,  6, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 13,  7, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 13,  8, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 13,  9, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 13, 10, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 13, 11, BGEVENT_LEFT, GoldenrodGameCornerCardFlipMachineScript
	bg_event 18,  6, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 18,  7, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 18,  8, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 18,  9, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 18, 10, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 18, 11, BGEVENT_RIGHT, GoldenrodGameCornerCardFlipMachineScript
	bg_event 12,  1, BGEVENT_LEFT, GoldenrodGameCornerLeftTheirDrinkScript

	def_object_events
	object_event  3,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumpstd, gamecornercoinvendor, -1
	object_event 16,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerTMVendorScript, -1
	object_event 18,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerPrizeMonVendorScript, -1
	object_event 10,  1, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerFisherScript, -1
	object_event 10,  3, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_WANDER, 1, 2, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodGameCornerCooltrainerFText, -1
	object_event 17,  6, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerPokefanFScript, -1
	object_event  8,  7, SPRITE_BURGLAR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, (1 << DAY) | (1 << NITE), 0, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerPharmacistScript, -1
	object_event 14,  8, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerCooltrainerMScript, -1
	object_event  5, 10, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerGentlemanScript, -1
	object_event 11, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerPokefanM1Script, -1
	object_event 17, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerPokefanM3Script, -1
	object_event  2,  9, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodGameCornerPokefanM2Text, EVENT_BEAT_WHITNEY

GoldenrodGameCornerPokefanM3Script:
	showtextfaceplayer GoldenrodGameCornerPokefanM3Text
	turnobject LAST_TALKED, RIGHT
	end

GoldenrodGameCornerFisherScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_PAY_DAY_INTRO
	iftruefwd GoldenrodGameCornerTutorPayDayScript
	writetext GoldenrodGameCornerFisherText
	waitbutton
	setevent EVENT_LISTENED_TO_PAY_DAY_INTRO
GoldenrodGameCornerTutorPayDayScript:
	writetext Text_GoldenrodGameCornerTutorPayDayQuestion
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	yesorno
	iffalsefwd .TutorRefused
	setval PAY_DAY
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpthisopenedtext

	text "Schon gut."
	done

.NoSilverLeaf
	waitbutton
	jumpthisopenedtext

	text "Du hast kein"
	line "Silberblatt?"
	cont "Schade."
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "Pay Day bringt dir"
	line "nach einem Kampf"
	cont "mehr Geld!"
	para "Nutze es oft und"
	line "wirst reich!"
	done

GoldenrodGameCornerTMVendorScript:
	faceplayer
	opentext
	writetext GoldenrodGameCornerPrizeVendorIntroText
	waitbutton
	checkkeyitem COIN_CASE
	iffalse_jumpopenedtext GoldenrodGameCornerPrizeVendorNoCoinCaseText
	writetext GoldenrodGameCornerPrizeVendorWhichPrizeText
GoldenrodGameCornerTMVendor_LoopScript: ; 056c36
	special Special_DisplayCoinCaseBalance
	loadmenu GoldenrodGameCornerTMVendorMenuData
	verticalmenu
	closewindow
	ifequalfwd $1, .flamethrower
	ifequalfwd $2, .thunderbolt
	ifequalfwd $3, .ice_beam
	jumpopenedtext GoldenrodGameCornerPrizeVendorQuitText

.flamethrower:
	checktmhm TM_FLAMETHROWER
	iftruefwd GoldenrodGameCornerPrizeVendor_AlreadyHaveTMScript
	checkcoins GOLDENRODGAMECORNER_TM35_COINS
	ifequalfwd HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	gettmhmname TM_FLAMETHROWER, STRING_BUFFER_3
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse_jumpopenedtext GoldenrodGameCornerPrizeVendorQuitText
	givetmhm TM_FLAMETHROWER
	takecoins GOLDENRODGAMECORNER_TM35_COINS
	sjumpfwd GoldenrodGameCornerTMVendor_FinishScript

.thunderbolt:
	checktmhm TM_THUNDERBOLT
	iftruefwd GoldenrodGameCornerPrizeVendor_AlreadyHaveTMScript
	checkcoins GOLDENRODGAMECORNER_TM24_COINS
	ifequalfwd HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	gettmhmname TM_THUNDERBOLT, STRING_BUFFER_3
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse_jumpopenedtext GoldenrodGameCornerPrizeVendorQuitText
	givetmhm TM_THUNDERBOLT
	takecoins GOLDENRODGAMECORNER_TM24_COINS
	sjumpfwd GoldenrodGameCornerTMVendor_FinishScript

.ice_beam:
	checktmhm TM_ICE_BEAM
	iftruefwd GoldenrodGameCornerPrizeVendor_AlreadyHaveTMScript
	checkcoins GOLDENRODGAMECORNER_TM13_COINS
	ifequalfwd HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	gettmhmname TM_ICE_BEAM, STRING_BUFFER_3
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse_jumpopenedtext GoldenrodGameCornerPrizeVendorQuitText
	givetmhm TM_ICE_BEAM
	takecoins GOLDENRODGAMECORNER_TM13_COINS
	sjumpfwd GoldenrodGameCornerTMVendor_FinishScript

GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript:
	writetext GoldenrodGameCornerPrizeVendorConfirmPrizeText
	yesorno
	end

GoldenrodGameCornerTMVendor_FinishScript:
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodGameCornerPrizeVendorHereYouGoText
	waitbutton
	sjump GoldenrodGameCornerTMVendor_LoopScript

GoldenrodGameCornerPrizeVendor_AlreadyHaveTMScript:
	writetext GoldenrodGameCornerPrizeVendorAlreadyHaveTMText
	waitbutton
	sjump GoldenrodGameCornerTMVendor_LoopScript

GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript:
	jumpthisopenedtext

	text "Tut mir leid! Du"
	line "brauchst mehr"
	cont "Münzen."
	done



GoldenrodGameCornerTMVendorMenuData:
	db MENU_BACKUP_TILES
	menu_coords 0, 2, 15, 11
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 4 ; items
	db "TM35    {d:GOLDENRODGAMECORNER_TM35_COINS}@"
	db "TM24    {d:GOLDENRODGAMECORNER_TM24_COINS}@"
	db "TM13    {d:GOLDENRODGAMECORNER_TM13_COINS}@"
	db "Cancel@"

GoldenrodGameCornerPrizeMonVendorScript:
	faceplayer
	opentext
	writetext GoldenrodGameCornerPrizeVendorIntroText
	waitbutton
	checkkeyitem COIN_CASE
	iffalse_jumpopenedtext GoldenrodGameCornerPrizeVendorNoCoinCaseText
.loop
	writetext GoldenrodGameCornerPrizeVendorWhichPrizeText
	special Special_DisplayCoinCaseBalance
	loadmenu .MenuDataHeader
	verticalmenu
	closewindow
	ifequalfwd $1, .abra
	ifequalfwd $2, .cubone
	ifequalfwd $3, .clefairy
	jumpopenedtext GoldenrodGameCornerPrizeVendorQuitText

.abra
	checkcoins GOLDENRODGAMECORNER_ABRA_COINS
	ifequal HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	getmonname ABRA, STRING_BUFFER_3
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse_jumpopenedtext GoldenrodGameCornerPrizeVendorQuitText
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodGameCornerPrizeVendorHereYouGoText
	waitbutton
	givepoke ABRA, 5
	iffalse_jumpopenedtext GoldenrodGameCornerPrizeVendorNoMoreRoomText
	setmonval ABRA
	special Special_GameCornerPrizeMonCheckDex
	takecoins GOLDENRODGAMECORNER_ABRA_COINS
	sjump .loop

.cubone
	checkcoins GOLDENRODGAMECORNER_CUBONE_COINS
	ifequal HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	getmonname CUBONE, STRING_BUFFER_3
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse_jumpopenedtext GoldenrodGameCornerPrizeVendorQuitText
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodGameCornerPrizeVendorHereYouGoText
	waitbutton
	givepoke CUBONE, 10
	iffalse_jumpopenedtext GoldenrodGameCornerPrizeVendorNoMoreRoomText
	setmonval CUBONE
	special Special_GameCornerPrizeMonCheckDex
	takecoins GOLDENRODGAMECORNER_CUBONE_COINS
	sjump .loop

.clefairy
	checkcoins GOLDENRODGAMECORNER_CLEFAIRY_COINS
	ifequal HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	getmonname CLEFAIRY, STRING_BUFFER_3
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse_jumpopenedtext GoldenrodGameCornerPrizeVendorQuitText
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodGameCornerPrizeVendorHereYouGoText
	waitbutton
	givepoke CLEFAIRY, 15
	iffalse_jumpopenedtext GoldenrodGameCornerPrizeVendorNoMoreRoomText
	setmonval CLEFAIRY
	special Special_GameCornerPrizeMonCheckDex
	takecoins GOLDENRODGAMECORNER_CLEFAIRY_COINS
	sjump .loop

.MenuDataHeader:
	db MENU_BACKUP_TILES
	menu_coords 0, 2, 17, 11
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 4 ; items
	db "Abra        {d:GOLDENRODGAMECORNER_ABRA_COINS}@"
	db "Cubone      {d:GOLDENRODGAMECORNER_CUBONE_COINS}@"
	db "Clefairy   {d:GOLDENRODGAMECORNER_CLEFAIRY_COINS}@"
	db "Cancel@"

GoldenrodGameCornerPharmacistScript:
	showtextfaceplayer GoldenrodGameCornerPharmacistText
	turnobject LAST_TALKED, LEFT
	end

GoldenrodGameCornerPokefanM1Script:
	showtextfaceplayer GoldenrodGameCornerPokefanM1Text
	turnobject LAST_TALKED, RIGHT
	end

GoldenrodGameCornerCooltrainerMScript:
	showtextfaceplayer GoldenrodGameCornerCooltrainerMText
	turnobject LAST_TALKED, LEFT
	end

GoldenrodGameCornerPokefanFScript:
	showtextfaceplayer GoldenrodGameCornerPokefanFText
	turnobject LAST_TALKED, RIGHT
	end

GoldenrodGameCornerGentlemanScript:
	showtextfaceplayer GoldenrodGameCornerGentlemanText
	turnobject LAST_TALKED, RIGHT
	end

GoldenrodGameCornerLeftTheirDrinkScript:
	jumpthistext

	text "Jemand hat sein"
	line "Getränk stehen"

	para "lassen. Es riecht"
	line "süß!"
	done
GoldenrodGameCornerSlotsMachineScript:
	end




GoldenrodGameCornerLuckySlotsMachineScript:
	end




GoldenrodGameCornerCardFlipMachineScript:
	end




GoldenrodGameCornerPrizeVendorIntroText:
	text "Willkommen!"
	para "Wir tauschen deine"
	line "Spielmünzen gegen"
	cont "tolle Preise!"
	done




GoldenrodGameCornerPrizeVendorWhichPrizeText:
	text "Welchen Preis"
	line "möchtest du?"
	done




GoldenrodGameCornerPrizeVendorConfirmPrizeText:
	text_ram wStringBuffer3
	text "."
	line "Ist das O.K.?"
	done



GoldenrodGameCornerPrizeVendorHereYouGoText:
	text "Hier, bitte!"
	done




GoldenrodGameCornerPrizeVendorAlreadyHaveTMText:
	text "Aber du hast diese"
	line "VM schon!"
	done


GoldenrodGameCornerPrizeVendorNoMoreRoomText:
	text "Du kannst nichts"
	line "mehr tragen."
	done




GoldenrodGameCornerPrizeVendorQuitText:
	text "Sammle ein paar"
	line "Münzen und komm"
	cont "dann wieder!"
	done




GoldenrodGameCornerPrizeVendorNoCoinCaseText:
	text "Oh? Du hast keinen"
	line "MÜNZKORB."
	done




GoldenrodGameCornerFisherText:
	text "Heute ist Zahltag!"
	line "Zeit zu feiern an"
	cont "den Automaten!"
	para "… Weißt du,"
	line "#mon bekommen"
	cont "auch Pay Day."
	done

Text_GoldenrodGameCornerTutorPayDayQuestion:
	text "Gibst du mir ein"
	line "Silberblatt,"

	para "bring ich deinem"
	line "#mon Pay Day"
	cont "bei."
	done




GoldenrodGameCornerPharmacistText:
	text "Ich spiele nur an"
	line "diesem Automaten."

	para "Ich glaube, er"
	line "spuckt mehr aus"

	para "als die anderen."
	done




GoldenrodGameCornerPokefanM1Text:
	text "Ich liebe diesen"
	line "neuen Automaten."
	para "Er stellt eine"
	line "größere"
	cont "Herausfor-derung"
	cont "dar als jene in"
	cont "PRISMANIA CITY."
	done




GoldenrodGameCornerCooltrainerMText:
	text "Das Leben ist ein"
	line "Spiel. Ich werde"
	cont "Karten spielen,"
	cont "bis ich umfalle!"
	done




GoldenrodGameCornerPokefanFText:
	text "Karten …"
	para "Ich ziehe sie den"
	line "Automaten vor,"
	para "weil man seine"
	line "Chancen besser"
	cont "abschätzen kann."
	para "Aber der Gewinn"
	line "ist viel geringer."
	done




GoldenrodGameCornerCooltrainerFText:
	text "Ich höre erst auf,"
	line "wenn ich gewinne!"
	done




GoldenrodGameCornerGentlemanText:
	text "Ich habe meinen"
	line "#mon BLIZZARD"
	cont "beigebracht."
	para "Es hat zwar"
	line "gedauert, bis ich"
	cont "genug"
	para "Münzen hatte, aber"
	line "es hat sich"
	cont "gelohnt."
	done




GoldenrodGameCornerPokefanM2Text:
	text "Ich hatte an den"
	line "Automaten kein"
	para "Glück. Bei den"
	line "Karten sieht es"
	para "auch nicht anders"
	line "aus …"
	para "Ich war so zornig,"
	line "dass ich meinen"
	para "MÜNZKORB in den"
	line "UNTERGRUND"
	cont "geworfen habe."
	done




GoldenrodGameCornerPokefanM3Text:
	text "Wahaha! Die Münzen"
	line "fallen weiter!"
	done
