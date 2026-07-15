IlexForestAzaleaGate_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  0,  4, ILEX_FOREST, 2
	warp_event  0,  5, ILEX_FOREST, 3
	warp_event  9,  4, AZALEA_TOWN, 7
	warp_event  9,  5, AZALEA_TOWN, 8

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, IlexForestAzaleaGateOfficerText, -1
	object_event  1,  6, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, IlexForestAzaleaGateGrannyText, -1
	object_event  8,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ProfOaksAide1Script, -1

ProfOaksAide1Script:
	faceplayer
	opentext
	checkevent EVENT_GOT_EXP_SHARE_FROM_PROF_OAKS_AIDE
	iftruefwd .Explain
	writetext ProfOaksAide1HiText
	waitbutton
	setval16 15
	special CountCaught
	iftruefwd .HereYouGo
.UhOh
	jumpopenedtext ProfOaksAide1UhOhText

.HereYouGo
	writetext ProfOaksAide1HereYouGoText
	waitbutton
	verbosegiveitem EXP_SHARE
	iffalsefwd .NoRoom
	setevent EVENT_GOT_EXP_SHARE_FROM_PROF_OAKS_AIDE
.Explain
	jumpthisopenedtext

	text "Der EP-Teiler"
	line "hilft einem"
	cont "#mon,"

	para "EP zu sammeln,"
	line "ohne zu kämpfen."

	para "Nutze ihn, um den"
	line "#dex zu füllen!"
	done

.NoRoom
	jumpthisopenedtext

	text "Ach! Du hast"
	line "keinen Platz"
	cont "dafür."
	done

IlexForestAzaleaGateOfficerText:
	text "Vorsicht! Verlaufe"
	line "dich nicht! Der"
	cont "STEINEICHENWALD"
	cont "ist groß."
	done







IlexForestAzaleaGateGrannyText:
	text "Der WALD wird von"
	line "seinem"
	cont "Schutzpatron"
	cont "bewacht."

	para "Mach keine"
	line "Dummheiten!"
	done







ProfOaksAide1HiText:
	text "Hallo! Ich bin"
	line "PROF. LINDs"
	cont "Gehilfe."
	para "Wenn du 15"
	line "#mon-Arten"
	cont "gefangen hast,"
	para "soll ich dir ein"
	line "Item geben."
	para "Also, <PLAYER>,"
	line "hast du mindestens"
	para "15 #mon-Arten"
	line "gefangen?"
	done

ProfOaksAide1UhOhText:
	text "Mal sehen … Oh! Du"
	line "hast nur"
	done
	text_decimal wTempDexOwn, 2, 3
	text "Arten"
	para "gefangen."
	para "Komm wieder, wenn"
	line "du 15 Arten hast."
	done

ProfOaksAide1HereYouGoText:
	text "Mal sehen … Super!"
	line "Du hast"
	done
	text_decimal wTempDexOwn, 2, 3
	text "Arten"
	para "gefangen."
	para "Glückwunsch! Hier,"
	line "bitte!"
	done
