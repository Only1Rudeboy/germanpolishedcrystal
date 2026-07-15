Route38EcruteakGate_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  0,  4, ROUTE_38, 1
	warp_event  0,  5, ROUTE_38, 2
	warp_event  9,  4, ECRUTEAK_CITY, 14
	warp_event  9,  5, ECRUTEAK_CITY, 15

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route38EcruteakGateOfficerText, -1
	object_event  8,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ProfOaksAide2Script, -1

ProfOaksAide2Script:
	faceplayer
	opentext
	checkevent EVENT_GOT_LINKING_CORD_FROM_PROF_OAKS_AIDE
	iftruefwd .Explain
	writetext ProfOaksAide2HiText
	waitbutton
	setval16 30
	special CountCaught
	iftruefwd .HereYouGo
.UhOh
	jumpopenedtext ProfOaksAide2UhOhText

.HereYouGo
	writetext ProfOaksAide2HereYouGoText
	waitbutton
	verbosegiveitem LINKING_CORD
	iffalsefwd .NoRoom
	setevent EVENT_GOT_LINKING_CORD_FROM_PROF_OAKS_AIDE
.Explain
	jumpthisopenedtext

	text "Das Linking Cord"
	line "gibt manchen"
	para "#mon ein Gefühl"
	line "der Verbundenheit,"
	para "das bei der"
	line "Entwicklung hilft."
	para "Nutze es, um den"
	line "#dex zu füllen!"
	done

.NoRoom
	jumpthisopenedtext

	text "Ach! Du hast"
	line "keinen Platz"
	cont "dafür."
	done

Route38EcruteakGateOfficerText:
	text "Wo sagtest du,"
	line "kommst du her?"
	para "NEUBORKIA?"
	para "PROF. LIND wohnt"
	line "dort, nicht wahr?"
	para "Du hast einen"
	line "langen Weg auf"
	cont "dich genommen, um"
	cont "hierher zu"
	cont "gelangen."
	done







ProfOaksAide2HiText:
	text "Hallo! Ich bin"
	line "PROF. LINDs"
	cont "Gehilfe."
	para "Wenn du 30"
	line "#mon-Arten"
	cont "gefangen hast,"
	para "soll ich dir ein"
	line "Item geben."
	para "Also, <PLAYER>,"
	line "hast du mindestens"
	para "30 #mon-Arten"
	line "gefangen?"
	done

ProfOaksAide2UhOhText:
	text "Mal sehen… Oh! Du"
	line "hast nur"
	done
	text_decimal wTempDexOwn, 2, 3
	text "Arten"
	para "gefangen."
	para "Komm wieder, wenn"
	line "du 30 Arten hast."
	done

ProfOaksAide2HereYouGoText:
	text "Mal sehen… Super!"
	line "Du hast"
	done
	text_decimal wTempDexOwn, 2, 3
	text "Arten"
	para "gefangen."
	para "Glückwunsch! Hier,"
	line "bitte!"
	done
