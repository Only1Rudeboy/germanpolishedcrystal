SeagallopFerryVermilionGate_MapScriptHeader:
	def_scene_scripts
	scene_script SeagallopFerryVermilionGateAskEnterScene, SCENE_SEAGALLOPFERRYVERMILIONGATE_ASK_ENTER
	scene_script SeagallopFerryVermilionGateLeaveScene, SCENE_SEAGALLOPFERRYVERMILIONGATE_LEAVE

	def_callbacks

	def_warp_events
	warp_event  6,  0, VERMILION_CITY, 11

	def_coord_events

	def_bg_events

	def_object_events
	object_event  6,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, SeagallopFerryVermilionGateSailorScript, EVENT_OLIVINE_PORT_SAILOR_AT_GANGWAY

	object_const_def
	const SEAGALLOPFERRYVERMILIONGATE_SAILOR

SeagallopFerryVermilionGateLeaveScene:
	sdefer SeagallopFerryVermilionGate_PlayerArrives
SeagallopFerryVermilionGateAskEnterScene:
	end

SeagallopFerryVermilionGate_PlayerArrives:
	applymovement SEAGALLOPFERRYVERMILIONGATE_SAILOR, SeagallopFerryVermilionGateSailorArrive1MovementData
	applymovement PLAYER, SeagallopFerryVermilionGatePlayerArriveMovementData
	showtext SeagallopFerryVermilionCityRefusedText
	applymovement SEAGALLOPFERRYVERMILIONGATE_SAILOR, SeagallopFerryVermilionGateSailorArrive2MovementData
	setscene SCENE_SEAGALLOPFERRYVERMILIONGATE_ASK_ENTER
	end

SeagallopFerryVermilionGateSailorScript:
	faceplayer
	opentext
	writetext SeagallopFerryWelcomeText
	waitbutton
	checkevent EVENT_GOT_ORANGE_TICKET
	iftruefwd .got_orangeticket
	writetext SeagallopFerryGiveOrangeTicketText
	waitbutton
	verbosegivekeyitem ORANGETICKET
	setevent EVENT_GOT_ORANGE_TICKET
.got_orangeticket
	checkkeyitem ORANGETICKET
	iftruefwd .have_orangeticket
	checkkeyitem MYSTICTICKET
	iftruefwd .have_mysticticket_no_orangeticket
	checkkeyitem OLD_SEA_MAP
	iftruefwd .use_old_sea_map
	jumpthisopenedtext

	text "Tut mir leid, du"
	line "hast kein Ticket."
	done

.have_orangeticket
	checkkeyitem MYSTICTICKET
	iftruefwd .have_orangeticket_and_mysticticket
	checkkeyitem OLD_SEA_MAP
	iftruefwd .use_orangeticket_or_old_sea_map
.use_orangeticket
	writetext SeagallopFerryOrangeTicketQuestionText
	yesorno
	iffalsefwd .no_ferry
	scall SeagallopFerryDepartureScript
	setmapscene SEAGALLOP_FERRY_SHAMOUTI_GATE, SCENE_SEAGALLOPFERRYSHAMOUTIGATE_LEAVE
	warp SEAGALLOP_FERRY_SHAMOUTI_GATE, 6, 5
	end

.have_mysticticket_no_orangeticket
	checkkeyitem OLD_SEA_MAP
	iftruefwd .use_mysticticket_or_old_sea_map
.use_mysticticket
	writetext SeagallopFerryMysticTicketQuestionText
	yesorno
	iffalsefwd .no_ferry
	scall SeagallopFerryDepartureScript
	setmapscene SEAGALLOP_FERRY_NAVEL_GATE, SCENE_SEAGALLOPFERRYNAVELGATE_LEAVE
	warp SEAGALLOP_FERRY_NAVEL_GATE, 6, 5
	end

.have_orangeticket_and_mysticticket
	checkkeyitem OLD_SEA_MAP
	iftruefwd .have_three_tickets
	writetext SeagallopFerryWhichTicketText
	loadmenu OrangeMysticMenuDataHeader
	verticalmenu
	closewindow
	ifequal $1, .use_orangeticket
	ifequal $2, .use_mysticticket
	sjumpfwd .no_ferry

.use_old_sea_map
	writetext SeagallopFerryOldSeaMapQuestionText
	yesorno
	iffalsefwd .no_ferry
	scall SeagallopFerryDepartureScript
	setmapscene FARAWAY_ISLAND, SCENE_FARAWAYISLAND_ARRIVAL
	warp FARAWAY_ISLAND, 12, 42
	end

.use_mysticticket_or_old_sea_map
	writetext SeagallopFerryWhichTicketText
	loadmenu MysticOldSeaMapMenuDataHeader
	verticalmenu
	closewindow
	ifequal $1, .use_mysticticket
	ifequal $2, .use_old_sea_map
	sjumpfwd .no_ferry

.use_orangeticket_or_old_sea_map
	writetext SeagallopFerryWhichTicketText
	loadmenu OrangeOldSeaMapMenuDataHeader
	verticalmenu
	closewindow
	ifequal $1, .use_orangeticket
	ifequal $2, .use_old_sea_map
	sjumpfwd .no_ferry

.have_three_tickets
	writetext SeagallopFerryWhichTicketText
	loadmenu ThreeTicketsMenuDataHeader
	verticalmenu
	closewindow
	ifequal $1, .use_orangeticket
	ifequal $2, .use_mysticticket
	ifequal $3, .use_old_sea_map
.no_ferry:
	jumpopenedtext SeagallopFerryVermilionCityRefusedText

OrangeMysticMenuDataHeader:
	db MENU_BACKUP_TILES
	menu_coords 0, 4, 15, 11
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 3 ; items
	db "OrangeTicket@"
	db "MysticTicket@"
	db "Cancel@"

MysticOldSeaMapMenuDataHeader:
	db MENU_BACKUP_TILES
	menu_coords 0, 4, 15, 11
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 3 ; items
	db "MysticTicket@"
	db "Old Sea Map@"
	db "Cancel@"

OrangeOldSeaMapMenuDataHeader:
	db MENU_BACKUP_TILES
	menu_coords 0, 4, 15, 11
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 3 ; items
	db "OrangeTicket@"
	db "Old Sea Map@"
	db "Cancel@"

ThreeTicketsMenuDataHeader:
	db MENU_BACKUP_TILES
	menu_coords 0, 2, 15, 11
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 4 ; items
	db "OrangeTicket@"
	db "MysticTicket@"
	db "Old Sea Map@"
	db "Cancel@"

SeagallopFerryDepartureScript:
	writetext SeagallopFerryDepartureText
	waitbutton
	closetext
	turnobject SEAGALLOPFERRYVERMILIONGATE_SAILOR, DOWN
	pause 10
	applyonemovement SEAGALLOPFERRYVERMILIONGATE_SAILOR, step_down
	playsound SFX_EXIT_BUILDING
	disappear SEAGALLOPFERRYVERMILIONGATE_SAILOR
	waitsfx
	applymovement PLAYER, SeagallopFerryVermilionGatePlayerDepartMovementData
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	waitsfx
	appear SEAGALLOPFERRYVERMILIONGATE_SAILOR
	end

SeagallopFerryVermilionGatePlayerDepartMovementData:
	step_down
	step_down
	step_end

SeagallopFerryVermilionGatePlayerArriveMovementData:
	step_up
	step_up
	step_up
	turn_head_down
	step_end

SeagallopFerryVermilionGateSailorArrive1MovementData:
	step_up
	step_left
	turn_head_right
	step_end

SeagallopFerryVermilionGateSailorArrive2MovementData:
	step_right
	step_down
	turn_head_up
	step_end

SeagallopFerryWelcomeText:
	text "Willkommen an Bord"
	line "der"
	cont "Seagallop-Fähre!"
	done

SeagallopFerryGiveOrangeTicketText:
	text "Der Mann, der"
	line "gerade ging,"
	cont "sagte, er"

	para "braucht dieses"
	line "Ticket nicht. Du"
	cont "kannst es haben."
	done


SeagallopFerryOrangeTicketQuestionText:
	text "Das OrangeTicket"
	line "ist für die Fahrt"
	cont "zur"
	cont "Shamouti-Insel."

	para "Wir bringen dich"
	line "jederzeit gern"
	cont "dorthin."
	done

SeagallopFerryMysticTicketQuestionText:
	text "Ach! Das ist ein"
	line "MysticTicket! Das"
	cont "ist selten."

	para "Wir bringen dich"
	line "jederzeit gern zum"
	cont "Navel Rock."
	done

SeagallopFerryOldSeaMapQuestionText:
	text "Ach! Diese Old Sea"
	line "Map, die du hast…"

	para "Sie zeigt eine"
	line "ferne Insel."

	para "Wir bringen dich"
	line "jederzeit gern"
	cont "dorthin."
	done

SeagallopFerryWhichTicketText:
	text "Hast du ein"
	line "Ticket?"
	done

SeagallopFerryDepartureText:
	text "Alles klar!"

	para "Alle an Bord der"
	line "Seagallop-Fähre!"
	done

SeagallopFerryVermilionCityRefusedText:
	text "Komm wieder!"
	done
