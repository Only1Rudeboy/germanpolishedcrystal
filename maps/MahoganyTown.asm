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
	jumpthisopenedtext

	text "Gut! Genieße es!"
	done






.NotEnoughMoney:
	jumpthisopenedtext

	text "Du hast nicht"
	line "genug Geld."
	done
MahoganyTownGrampsScript:
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue_jumptextfaceplayer MahoganyTownGrampsText_ClearedRocketHideout
	jumpthistextfaceplayer

	text "Willst du dir das"
	line "wütende GARADOS am"
	cont "See ansehen?"
	done



MahoganyTownSouvenirShopSign:
	checkevent EVENT_MAHOGANY_MART_OWNERS
	iftrue_jumptext MahoganyTownSouvenirShopSignText1
	jumpthistext

	text "Omas Souvenirladen"
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
	text "Hi, Zwerg!"
	para "Ich sehe, du bist"
	line "neu in MAHAGONIA."
	para "Du musst unbedingt"
	line "einen WUTKEKS"
	cont "probieren!"
	para "Ich habe einen"
	line "dabei. Für nur"
	cont "¥300 gehört er"
	cont "dir."
	done







RageCandyBarMerchantRefusedText:
	text "Dann eben nicht…"
	done







RageCandyBarMerchantNoRoomText:
	text "Du hast keinen"
	line "Platz mehr."
	done







RageCandyBarMerchantSoldOutText:
	text "Die WUTKEKSE sind"
	line "ausverkauft."

	para "Ich verschwinde."
	line "Stör mich nicht,"
	cont "Kind."
	done







if DEF(FAITHFUL)
	text "Die WUTKEKSE sind"
	done
else
	text "Die WUTKEKSE sind"
	done
endc
	line "ausverkauft."

	para "Ich verschwinde."
	line "Stör mich nicht,"
	cont "Kind."
	done
MahoganyTownGrampsText_ClearedRocketHideout:
	text "Die verdächtigen"
	line "Männer sind"
	cont "verschwunden…"
	para "Vielleicht war es"
	line "doch besser, dass"
	cont "du dich"
	cont "eingemischt hast."
	done
MahoganyTownFisherText:
	text "Bist du auf dem"
	line "Weg zum SEE DES"
	cont "ZORNS?"
	para "Die Leute sagen,"
	line "dort wütet ein"
	cont "rotes GARADOS."
	done
MahoganyTownLassText:
	text "Pass auf die"
	line "Touristen auf, die"
	cont "die"
	cont "RAGECANDY-RIEGEL"
	cont "verkaufen."
	done
MahoganyTownSignText:
	text "MAHAGONIA CITY"
	para "Willkommen in der"
	line "Stadt der Ninja"
	done
MahoganyTownSouvenirShopSignText1:
	text "Nur ein"
	line "Souvenirladen"

	para "Hier ist nichts"
	line "Verdächtiges"

	para "Kein Grund zur"
	line "Sorge"
	done

MahoganyGymSignText:
	text "PKMN-ARENA von"
	line "MAHAGONIA CITY"
	cont "LEITUNG: NORBERT"
	para "Der Lehrer der"
	line "Härte des Winters"
	done
