SilphCo2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 13,  0, SILPH_CO_1F, 3
	warp_event 11,  0, SILPH_CO_3F, 1

	def_coord_events

	def_bg_events
	bg_event  8,  0, BGEVENT_JUMPTEXT, SilphCoElevatorText
	bg_event  2,  3, BGEVENT_JUMPTEXT, SilphCo2FDeptSignText
	bg_event  9,  3, BGEVENT_JUMPTEXT, SilphCo2FDeptSignText
	bg_event  1,  1, BGEVENT_JUMPTEXT, SilphCo2FPrinterText
	bg_event 14,  5, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event 15,  5, BGEVENT_JUMPSTD, difficultbookshelf

	def_object_events
	object_event  6,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SilphCo2FScientist1Text, -1
	object_event 12,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SilphCo2FScientist2Text, -1
	object_event  3,  6, SPRITE_SILPH_EMPLOYEE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo2FEmployee1Script, -1
	object_event 12,  9, SPRITE_SILPH_EMPLOYEE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SilphCo2FSilphEmployee2Text, -1

SilphCo2FEmployee1Script:
	faceplayer
	opentext
	checkevent EVENT_GOT_UPGRADE
	iftruefwd .GaveUpgrade
	writetext .Text1
	promptbutton
	verbosegiveitem UPGRADE
	iffalsefwd .NoRoomForUpgrade
	setevent EVENT_GOT_UPGRADE
.GaveUpgrade:
	writetext .Text2
	waitbutton
.NoRoomForUpgrade:
	endtext

.Text1:
	text "Du bist aus Johto"
	line "hierher gereist?"

	para "Weil du so weit"
	line "gekommen bist,"

	para "nimm dieses"
	line "kleine Andenken."
	done

.Text2:
	text "Das ist das"
	line "neueste Produkt"

	para "der SILPH CO. Das"
	line "gibt es noch nir-"
	cont "gends zu kaufen."
	done
SilphCo2FSilphEmployee2Text:
	text "Früher nutzten"
	line "wir Teleporter"

	para "Hin- und Herkom-"
	line "men, aber sie"

	para "wurden abge-"
	line "schaltet."

	para "Gut, dass ich im"
	line "zweiten Stock"
	cont "bin!"
	done

SilphCo2FScientist1Text:
	text "Wir arbeiten"
	line "ständig"
	line "an neuen TMs."

	para "Manche wurden"
	line "eingestellt, aber"

	para "andere sind so"
	line "beliebt, dass sie"

	para "seit über 30"
	line "Jahren"
	line "unverändert sind!"
	done

SilphCo2FScientist2Text:
	text "Ich programmiere!"
	line "Stör mich nicht!"
	done

SilphCo2FDeptSignText:
	text "Silph Co. 2F"
	line "Software-Entw."
	done

SilphCo2FPrinterText:
	text "Das ist ein"
	line "Drucker."
	done
