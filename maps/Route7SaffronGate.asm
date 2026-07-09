Route7SaffronGate_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  0,  4, ROUTE_7, 1
	warp_event  0,  5, ROUTE_7, 2
	warp_event  9,  4, SAFFRON_CITY, 10
	warp_event  9,  5, SAFFRON_CITY, 11

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route7SaffronGuardScript, -1
	object_event  3,  3, SPRITE_SILPH_EMPLOYEE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route7SaffronGateSilphEmployeeText, -1

Route7SaffronGuardScript:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer Route7SaffronGuardSeriousText
	jumpthistextfaceplayer

	text "Hast du von dem"
	line "Unfall im KRAFT-"
	cont "WERK gehört?"

	para "Es liegt im"
	line "Osten, in der"
	cont "Nähe von"
	cont "AMARANT CITY."
	done

Route7SaffronGuardSeriousText:
	text "Ich nehme meinen"
	line "Posten als"
	cont "Wache ernst."

	para "Hey! Du hast"
	line "einen #DEX."

	para "O.K. Du darfst"
	line "passieren."
	done








Route7SaffronGateSilphEmployeeText:
	text "Bruno von der Top"
	line "Vier hat früher"

	para "in Saffronia"
	line "trainiert."

	para "Er trainierte mit"
	line "einem Typ namens"
	cont "Brawly"

	para "schon in den"
	line "frühen Tagen."
	done
