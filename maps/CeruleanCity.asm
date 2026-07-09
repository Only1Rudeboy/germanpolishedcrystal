CeruleanCity_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_CERULEANCITY_BRIDGE_UNDERFOOT
	scene_const SCENE_CERULEANCITY_BRIDGE_OVERHEAD

	def_callbacks
	callback MAPCALLBACK_NEWMAP, CeruleanCityFlyPoint

	def_warp_events
	warp_event  8, 11, CERULEAN_GYM_BADGE_SPEECH_HOUSE, 1
	warp_event 24, 11, CERULEAN_POLICE_STATION, 1
	warp_event 13, 15, CERULEAN_TRADE_SPEECH_HOUSE, 1
	warp_event 19, 17, CERULEAN_POKECENTER_1F, 1
	warp_event 28, 19, CERULEAN_GYM, 1
	warp_event 25, 25, CERULEAN_MART, 2
	warp_event  2,  9, CERULEAN_CAVE_1F, 1
	warp_event 14, 25, CERULEAN_BIKE_SHOP, 1
	warp_event 14, 11, CERULEAN_BERRY_POWDER_HOUSE, 1
	warp_event 19, 25, CERULEAN_COUPLE_HOUSE, 1
	warp_event 31, 11, CERULEAN_WATER_SHOW_SPEECH_HOUSE, 1

	def_coord_events
	coord_event 20,  4, SCENE_CERULEANCITY_BRIDGE_UNDERFOOT, Route24BridgeUnderfootTrigger
	coord_event 21,  4, SCENE_CERULEANCITY_BRIDGE_UNDERFOOT, Route24BridgeUnderfootTrigger
	coord_event 20,  5, SCENE_CERULEANCITY_BRIDGE_OVERHEAD, Route24BridgeOverheadTrigger
	coord_event 21,  5, SCENE_CERULEANCITY_BRIDGE_OVERHEAD, Route24BridgeOverheadTrigger

	def_bg_events
	bg_event 17, 20, BGEVENT_JUMPTEXT, CeruleanCitySignText
	bg_event 23, 19, BGEVENT_JUMPTEXT, CeruleanGymSignText
	bg_event 11, 25, BGEVENT_JUMPTEXT, CeruleanBikeShopSignText
	bg_event 29, 11, BGEVENT_JUMPTEXT, CeruleanPoliceSignText
	bg_event 19,  5, BGEVENT_JUMPTEXT, CeruleanCapeSignText
	bg_event 13, 19, BGEVENT_JUMPTEXT, CeruleanBubblerText
	bg_event 21, 27, BGEVENT_JUMPTEXT, CeruleanTrainerTipsText
	bg_event  4,  9, BGEVENT_ITEM + BERSERK_GENE, EVENT_FOUND_BERSERK_GENE_IN_CERULEAN_CITY
	bg_event 31, 17, BGEVENT_ITEM + RARE_CANDY, EVENT_CERULEAN_CITY_HIDDEN_RARE_CANDY

	def_object_events
	object_event 21, 20, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeruleanCityCooltrainerFScript, -1
	object_event  7,  8, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeruleanCityYoungsterScript, -1
	object_event 30, 22, SPRITE_COOL_DUDE, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanCityCooltrainerMScript, -1
	object_event 28, 14, SPRITE_POKEMANIAC, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeruleanCitySuperNerdText, -1
	pokemon_event 20, 20, SLOWBRO, SPRITEMOVEDATA_STILL, -1, PAL_MON_PINK, CeruleanCitySlowbroText, -1
	object_event 11, 19, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeruleanCityFisherScript, -1
	object_event  2, 10, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeruleanCaveGuardText, EVENT_BEAT_BLUE
	cuttree_event 44, 16, EVENT_ROUTE_9_CUT_TREE

	object_const_def
	const CERULEANCITY_COOLTRAINER_F
	const CERULEANCITY_YOUNGSTER

CeruleanCityFlyPoint:
	setflag ENGINE_FLYPOINT_CERULEAN
	endcallback

CeruleanCityCooltrainerMScript:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer CeruleanCityCooltrainerMText2
	jumpthistextfaceplayer

	text "Kantos Kraft-"
	line "werk?"

	para "Es liegt am Ende"
	line "der Route 9, der"

	para "Straße, die hier"
	line "nach Osten führt."

	para "Ich glaube, dort"
	line "gab es einen"
	cont "Unfall."
	done

CeruleanCityCooltrainerFScript:
	faceplayer
	opentext
	writetext CeruleanCityCooltrainerFText1
	waitbutton
	turnobject CERULEANCITY_COOLTRAINER_F, LEFT
	writetext CeruleanCityCooltrainerFText2
	waitbutton
	writetext CeruleanCitySlowbroText
	cry SLOWBRO
	waitbutton
	writetext CeruleanCityCooltrainerFText3
	waitendtext
	end

CeruleanCityFisherScript:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer CeruleanCityFisherText
	checkevent EVENT_MET_ROCKET_GRUNT_AT_CERULEAN_GYM
	iftrue_jumptextfaceplayer CeruleanCityFisherRocketTipText
	jumptextfaceplayer CeruleanCityFisherText

CeruleanCityYoungsterScript:
	checkevent EVENT_FOUND_BERSERK_GENE_IN_CERULEAN_CITY
	iftrue_jumptextfaceplayer CeruleanCityYoungsterText
	faceplayer
	showtext CeruleanCityYoungsterText1
	waitsfx
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	showemote EMOTE_SHOCK, CERULEANCITY_YOUNGSTER, 15
	turnobject CERULEANCITY_YOUNGSTER, LEFT
	jumpthistext

	text "Ha?"

	para "Mein Detektor"
	line "reagiert…"
	done


CeruleanCityCooltrainerMText2:
	text "Sammelst du jede"
	line "Art von #mon?"

	para "Das ist bestimmt"
	line "sehr schwer. Aber"
	cont "Spaß macht es"
	cont "sicher auch."
	done

CeruleanCitySuperNerdText:
	text "Am KAP im Norden"
	line "treffen sich"
	cont "viele"

	para "Pärchen. Gerade"
	line "Mädchen gehen"
	cont "dort"
	cont "gerne hin!"
	done

CeruleanCitySlowbroText:
	text "LAHMUS: Jarah?"
	done

CeruleanCityCooltrainerFText1:
	text "Mein LAHMUS und"
	line "ich sind ein un-"
	cont "schlagbares Team!"
	done

CeruleanCityCooltrainerFText2:
	text "LAHMUS, mach"
	line "deine"
	line "KONFUSION vor!"
	done

CeruleanCityCooltrainerFText3: ; text > text
	text "…"
	done

CeruleanCityFisherText:
	text "Ich bin ein"
	line "großer"
	line "Fan von der"
	cont "ARENA-"
	cont "LEITERIN in"
	cont "AZURIA"
	cont "CITY. Ihr Name"
	cont "ist"
	cont "MISTY."
	done

CeruleanCityFisherRocketTipText:
	text "Ich habe so einen"
	line "zwielichtigen Typ"
	cont "zum KAP bei"
	cont "AZURIA"
	cont "CITY gehen sehen."
	done

CeruleanCityYoungsterText1:
	text "Hier soll es mal"
	line "eine Höhle"
	cont "gegeben"

	para "haben, in der"
	line "mächtige und"
	cont "grässliche #mon"
	cont "gehaust haben."
	done


CeruleanCityYoungsterText:
	text "Mein DETEKTOR"
	line "reagiert nicht"

	para "mehr… Jemand war"
	line "wohl schneller!"
	done

CeruleanCaveGuardText:
	text "Das ist…"

	para "Die berüchtigte"
	line "AZURIA-HOEHLE!"

	para "Furchtbar starke"
	line "#mon leben hier."

	para "Nur wer alle acht"
	line "Kanto-Arenen"

	para "besiegt hat, darf"
	line "eintreten."
	done

CeruleanCitySignText:
	text "AZURIA CITY"

	para "Umgeben Von Einer"
	line "Mystischen Blauen"
	cont "Aura"
	done

CeruleanGymSignText:
	text "#mon-ARENA von"
	line "AZURIA CITY"
	cont "LEITUNG: MISTY"

	para "Die Jungenhafte"
	line "Meerjungfrau"
	done

CeruleanBikeShopSignText:
	text "Hier ist eine"
	line "Nachricht…"

	para "Der FAHRRADLADEN"
	line "ist jetzt in"
	cont "JOHTO, in"
	cont "DUKATIA CITY…"
	done

CeruleanPoliceSignText:
	text "Hier ist eine"
	line "Nachricht…"

	para "Stoppt die Krimi-"
	line "nalität und macht"

	para "aus dieser Stadt"
	line "einen Ort, an dem"
	cont "man sicher ist"
	cont "und"
	cont "gerne lebt!"

	para "ORDNUNGSAMT VON"
	line "AZURIA CITY"
	done

CeruleanCapeSignText:
	text "KAP bei AZURIA"
	line "CITY voraus"
	done

CeruleanBubblerText:
	text "Das Wasser"
	line "schmeckt gut!"
	done

CeruleanTrainerTipsText:
	text "Profi-Tipps!"

	para "Ohne DETEKTOR"
	line "findest du Items"

	para "in Bäumen, unter"
	line "Steinen oder im"
	cont "Wasser."
	done
