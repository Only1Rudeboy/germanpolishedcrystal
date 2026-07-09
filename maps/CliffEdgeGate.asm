CliffEdgeGate_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 17, 19, CIANWOOD_CITY, 8
	warp_event  3, 19, ROUTE_47, 1

	def_coord_events

	def_bg_events
	bg_event 17,  6, BGEVENT_ITEM + OVAL_STONE, EVENT_CLIFF_EDGE_GATE_HIDDEN_OVAL_STONE

	def_object_events
	object_event 11, 16, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CliffEdgeGateReceptionistText, EVENT_YELLOW_FOREST_ROCKET_TAKEOVER
	object_event  3,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ProfOaksAide3Script, EVENT_YELLOW_FOREST_ROCKET_TAKEOVER
	object_event 17, 16, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerGruntM12, EVENT_CLEARED_YELLOW_FOREST

ProfOaksAide3Script:
	faceplayer
	opentext
	checkevent EVENT_GOT_MACHO_BRACE_FROM_PROF_OAKS_AIDE
	iftruefwd .Explain
	writetext ProfOaksAide3HiText
	waitbutton
	setval16 45
	special CountCaught
	iftruefwd .HereYouGo
.UhOh
	jumpopenedtext ProfOaksAide3UhOhText

.HereYouGo
	writetext ProfOaksAide3HereYouGoText
	waitbutton
	verbosegiveitem MACHO_BRACE
	iffalsefwd .NoRoom
	setevent EVENT_GOT_MACHO_BRACE_FROM_PROF_OAKS_AIDE
.Explain
	jumpthisopenedtext

	text "Das Machoband"
	line "hilft"
	line "einem #mon beim"

	para "Kämpfen stärker"
	line "zu"
	line "werden,"
	cont "verlangsamt"
	cont "es aber."
	done

.NoRoom
	jumpthisopenedtext

	text "Ach! Du hast"
	line "keinen"
	line "Platz dafür."
	done

GenericTrainerGruntM12:
	generictrainer GRUNTM, 12, EVENT_BEAT_ROCKET_GRUNTM_12, GruntM12SeenText, GruntM12BeatenText

	text "Im Gelben Wald"
	line "gibt"
	line "es viele seltene"
	cont "#mon."

	para "Wir schnappen sie"
	line "uns alle!"
	done

CliffEdgeGateReceptionistText:
	text "Der Gelbe Wald"
	line "ist hier entlang!"

	para "Ein beliebtes"
	line "Ausflugsziel!"
	done

ProfOaksAide3HiText:
	text "Hallo! Ich bin"
	line "Prof.Linds"
	cont "Gehilfe."

	para "Wenn du 45 #mon-"
	line "Arten gefangen"
	cont "hast,"

	para "soll ich dir ein"
	line "Item geben."

	para "Also, <PLAYER>,"
	line "hast du"
	cont "mindestens"

	para "45 #mon-Arten"
	line "gefangen?"
	done

ProfOaksAide3UhOhText:
	text "Mal sehen…"
	line "Oh! Du hast nur"

	para ""
	text_decimal wTempDexOwn, 2, 3
	text " Arten"

	para "gefangen."

	para "Komm wieder, wenn"
	line "du 45 Arten hast."
	done

ProfOaksAide3HereYouGoText:
	text "Mal sehen…"
	line "Super! Du hast"

	para ""
	text_decimal wTempDexOwn, 2, 3
	text " Arten"

	para "gefangen."

	para "Glückwunsch!"
	line "Hier, bitte!"
	done



GruntM12SeenText:
	text "Neugierig auf"
	line "unsere Pläne?"

	para "Besieg mich und"
	line "ich verrate sie!"
	done

GruntM12BeatenText:
	text "Du solltest"
	line "verlieren!"
	done
