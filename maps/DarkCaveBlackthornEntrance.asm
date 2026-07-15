DarkCaveBlackthornEntrance_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 23,  3, ROUTE_45, 1
	warp_event  3, 25, DARK_CAVE_VIOLET_ENTRANCE, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  7,  3, SPRITE_PHARMACIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DarkCaveBlackthornEntrancePharmacistScript, -1
	itemball_event 21, 24, REVIVE, 1, EVENT_DARK_CAVE_BLACKTHORN_ENTRANCE_REVIVE
	tmhmball_event  7, 22, TM_DARK_PULSE, EVENT_DARK_CAVE_BLACKTHORN_ENTRANCE_TM_DARK_PULSE

DarkCaveBlackthornEntrancePharmacistScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BLACKGLASSES_IN_DARK_CAVE
	iftrue_jumpopenedtext .PharmacistText2
	writetext .PharmacistText1
	promptbutton
	verbosegiveitem BLACKGLASSES
	iffalse_endtext
	setevent EVENT_GOT_BLACKGLASSES_IN_DARK_CAVE
	jumpthisopenedtext

.PharmacistText2:
	text "Schattenglas"
	line "verstärkt"
	cont "Unlicht-Attacken."
	done

.PharmacistText1:
	text "Huch! Du hast mich"
	line "erschreckt!"
	para "Ich hatte mein"
	line "Schattenglas auf,"
	cont "drum hab ich dich"
	para "gar nicht bemerkt."
	para "Was mach ich"
	line "eigentlich hier?"
	para "Hey, mach dir"
	line "keine Sorgen"
	cont "deswegen."
	para "Ich geb dir ein"
	line "Schattenglas, also"
	cont "vergiss,"
	para "dass du mich"
	line "gesehen hast,"
	cont "okay?"
	done
