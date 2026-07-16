MahoganyTown_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_MAHOGANYTOWN_TRY_RAGECANDYBAR
	scene_const SCENE_MAHOGANYTOWN_NOOP

	def_callbacks
	callback MAPCALLBACK_NEWMAP, MahoganyTownFlyPoint

	def_warp_events
	warp_event 11,  7, MAHOGANY_MART_1F, 1
	warp_event 17,  7, MAHOGANY_RED_GYARADOS_SPEECH_HOUSE, 1
	warp_event  6, 13, MAHOGANY_GYM, 1
	warp_event 15, 13, MAHOGANY_POKECENTER_1F, 1
	warp_event  9,  1, ROUTE_43_MAHOGANY_GATE, 3

	def_coord_events
	coord_event 19,  8, SCENE_MAHOGANYTOWN_TRY_RAGECANDYBAR, MahoganyTownTryARageCandyBarScript
	coord_event 19,  9, SCENE_MAHOGANYTOWN_TRY_RAGECANDYBAR, MahoganyTownTryARageCandyBarScript

	def_bg_events
	bg_event  1,  5, BGEVENT_JUMPTEXT, MahoganyTownSignText
	bg_event  9,  7, BGEVENT_READ, MahoganyTownSouvenirShopSign
	bg_event  3, 13, BGEVENT_JUMPTEXT, MahoganyGymSignText

	def_object_events
	object_event 19,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MahoganyTownPokefanMScript, EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_EAST
	object_event  6,  9, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyTownGrampsScript, -1
	object_event  6, 14, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, MahoganyTownFisherText, EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_GYM
	object_event 12,  8, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, MahoganyTownLassText, EVENT_MAHOGANY_MART_OWNERS

	object_const_def
	const MAHOGANYTOWN_POKEFAN_M

MahoganyTownFlyPoint:
	setflag ENGINE_FLYPOINT_MAHOGANY
	endcallback

MahoganyTownTryARageCandyBarScript:
	showemote EMOTE_SHOCK, MAHOGANYTOWN_POKEFAN_M, 15
	applymovement MAHOGANYTOWN_POKEFAN_M, MahoganyTownRageCandyBarMerchantBlocksYouMovement
	follow PLAYER, MAHOGANYTOWN_POKEFAN_M
	applyonemovement PLAYER, step_left
	stopfollow
	turnobject PLAYER, RIGHT
	scall RageCandyBarMerchantScript
	applymovement MAHOGANYTOWN_POKEFAN_M, MahoganyTownRageCandyBarMerchantReturnsMovement
	end

MahoganyTownPokefanMScript:
	faceplayer
RageCandyBarMerchantScript:
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue_jumptext RageCandyBarMerchantSoldOutText
	opentext
	writetext RageCandyBarMerchantTryOneText
	special PlaceMoneyTopRight
	yesorno
	iffalse_jumpopenedtext RageCandyBarMerchantRefusedText
	checkmoney YOUR_MONEY, 300
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	giveitem RAGECANDYBAR
	iffalse_jumpopenedtext RageCandyBarMerchantNoRoomText
	waitsfx
	playsound SFX_TRANSACTION
	takemoney YOUR_MONEY, 300
	special PlaceMoneyTopRight
	; GSC-DE Dump
	jumpthisopenedtext

	text "Gut! Genieße ihn!"
	done

.NotEnoughMoney:
	; GSC-DE Dump
	jumpthisopenedtext

	text "Du hast nicht ge-"
	line "nug Geld."
	done

MahoganyTownGrampsScript:
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue_jumptextfaceplayer MahoganyTownGrampsText_ClearedRocketHideout
	; GSC-DE Dump
	jumpthistextfaceplayer

	text "Hast du vor, die"
	line "GARADOS am SEE an-"
	cont "zusehen?"
	done

MahoganyTownSouvenirShopSign:
	checkevent EVENT_MAHOGANY_MART_OWNERS
	iftrue_jumptext MahoganyTownSouvenirShopSignText1
	; GSC-DE Dump
	jumpthistext

	text "Versuchen Sie den"
	line "leckeren WUTKEKS!"
	done

MahoganyTownRageCandyBarMerchantBlocksYouMovement:
	step_right
	step_down
	turn_head_left
	step_end

MahoganyTownRageCandyBarMerchantReturnsMovement:
	step_up
	turn_head_down
	step_end

RageCandyBarMerchantTryOneText:
	; GSC-DE Dump
	text "Hi, Zwerg!"
	para "Ich sehe, du bist"
	line "neu in MAHAGONIA."
	para "Du musst unbedingt"
	line "einen WUTKEKS"
	cont "probieren!"
	para "Ich habe einen da-"
	line "bei. Für nur ¥300"
	cont "gehört er dir."
	done

RageCandyBarMerchantRefusedText:
	; GSC-DE Dump
	text "Dann eben nicht…"
	done

RageCandyBarMerchantNoRoomText:
	; GSC-DE Dump
	text "Du hast keinen"
	line "Platz mehr."
	done

RageCandyBarMerchantSoldOutText:
	; GSC-DE Dump
	text "Die WUTKEKSE sind"
	line "ausverkauft."
	para "Ich verschwinde."
	line "Stör mich nicht,"
	cont "Kind."
	done

MahoganyTownGrampsText_ClearedRocketHideout:
	; GSC-DE Dump
	text "Die KARPADOR sind"
	line "zum SEE DES ZORNS"
	cont "zurückgekehrt."
	para "Das sind gute Neu-"
	line "igkeiten für die"
	cont "Angler."
	done

MahoganyTownFisherText:
	; GSC-DE Dump
	text "Wenn du schon so"
	line "weit gekommen"
	para "bist, solltest du"
	line "dir die Zeit neh-"
	cont "men, um etwas"
	para "Sightseeing zu un-"
	line "ternehmen."
	para "Geh nach Norden"
	line "und sieh dir den"
	para "SEE DES ZORNS an."
	done

MahoganyTownLassText:
	; GSC-DE Dump
	text "Besuche Großmut-"
	line "ters Laden. Sie"
	para "verkauft Artikel,"
	line "die du sonst nir-"
	cont "gends bekommen"
	cont "kannst."
	done

MahoganyTownSignText:
	; GSC-DE Dump
	text "MAHAGONIA CITY"
	para "Willkommen in der"
	line "Stadt der Ninja"
	done

MahoganyTownSouvenirShopSignText1:
	; PC: Rocket-Cover-Schild
	text "Nur ein"
	line "Souvenirladen"
	para "Hier ist nichts"
	line "Verdächtiges"
	para "Kein Grund zur"
	line "Sorge"
	done

MahoganyGymSignText:
	; GSC-DE Dump
	text "PKMN-ARENA von"
	line "MAHAGONIA CITY"
	para "LEITUNG: NORBERT"
	line "Der Lehrer der"
	para "Härte des Winters"
	done
