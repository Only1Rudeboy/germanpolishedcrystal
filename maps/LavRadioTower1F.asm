LavRadioTower1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, LavRadioTower1FUpstairsScript

	def_warp_events
	warp_event  2,  7, LAVENDER_TOWN, 7
	warp_event  3,  7, LAVENDER_TOWN, 7
	warp_event 15,  0, LAV_RADIO_TOWER_2F, 255

	def_coord_events

	def_bg_events
	bg_event 11,  0, BGEVENT_JUMPTEXT, LavRadioTower1FDirectoryText
	bg_event  5,  0, BGEVENT_JUMPTEXT, LavRadioTower1FPokeFluteSignText

	def_object_events
	object_event  6,  6, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, LavRadioTower1FReceptionistText, -1
	object_event 15,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, LavRadioTower1FOfficerText, -1
	object_event  1,  3, SPRITE_POKEMANIAC, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, LavRadioTower1FSuperNerd1Text, -1
	object_event  9,  1, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FGentlemanScript, -1
	object_event 14,  6, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FSuperNerd2Script, -1

LavRadioTower1FUpstairsScript:
	checkevent EVENT_EXORCISED_LAV_RADIO_TOWER
	iftruefwd .Exorcised
	warpmod 1, HAUNTED_RADIO_TOWER_2F
	endcallback

.Exorcised:
	warpmod 1, LAV_RADIO_TOWER_2F
	endcallback

LavRadioTower1FGentlemanScript:
	faceplayer
	opentext
	checkflag ENGINE_EXPN_CARD
	iftrue_jumpopenedtext .GotExpnCardText
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iffalse_jumpopenedtext .OffTheAirText
	writetext .ReturnedMachinePartText
	promptbutton
	givespecialitem EXPN_CARD
	setflag ENGINE_EXPN_CARD
	jumpthisopenedtext

.GotExpnCardText:
	text "Damit kannst du"
	line "die Radioprogramme"

	para "in KANTO"
	line "empfangen."

	para "Hahahahaha!"
	done
.OffTheAirText:
	text "Nein, nein, nein!"

	para "Wir sind nicht"
	line "mehr auf Sendung,"

	para "seit das KRAFTWERK"
	line "nicht mehr läuft."

	para "Alle Bemühungen,"
	line "diese Station zum"

	para "Laufen zu bringen,"
	line "sind vergebens,"
	cont "wenn ich nichts"
	cont "senden kann."

	para "Ich bin ruiniert!"
	done
.ReturnedMachinePartText:
	text "Ah! Dann bist du"
	line "<PLAYER>. Du hast"

	para "das Problem mit"
	line "dem KRAFTWERK"
	cont "gelöst?"

	para "Dir habe ich es zu"
	line "verdanken, dass"

	para "ich nicht"
	line "arbeitslos wurde!"
	cont "Du bist mein"
	cont "Lebensretter!"

	para "Zum Dank gebe ich"
	line "dir das hier."
	done
LavRadioTower1FSuperNerd2Script:
	checkflag ENGINE_EXPN_CARD
	iftrue_jumptextfaceplayer LavRadioTower1FSuperNerd2Text_GotExpnCard
	jumpthistextfaceplayer

	text "Hallo, mein"
	line "Freund!"

	para "Ich bin der tolle"
	line "MUSIK-REDAKTEUR!"

	para "Häh? Dein #Com"
	line "kann meine"

	para "Sendungen nicht"
	line "empfangen. Wie"
	cont "unglücklich!"

	para "Mit einem"
	line "ERWEITERUNGS-"
	cont "MODUL könntest du"
	cont "empfangen."

	para "Besorg dir am"
	line "besten eins!"
	done




LavRadioTower1FReceptionistText:
	text "Willkommen! Schau"
	line "dich auf"

	para "dieser Etage ruhig"
	line "um."
	done





LavRadioTower1FOfficerText:
	text "Du darfst leider"
	line "nur das"
	cont "Erdgeschoss"
	cont "erkunden."

	para "Seit der RADIOTURM"
	line "in JOHTO von einer"

	para "Verbrechergang"
	line "besetzt wurde,"

	para "mussten wir"
	line "unsere"
	cont "Sicherheitsmaß-"
	cont "nahmen erhöhen."
	done





LavRadioTower1FSuperNerd1Text:
	text "Viele Menschen"
	line "arbeiten sehr hart"
	cont "im RADIOTURM."

	para "Sie müssen ihr"
	line "Bestes geben für"
	cont "eine gute Sendung."
	done





LavRadioTower1FSuperNerd2Text_GotExpnCard:
	text "Hallo, mein"
	line "Freund!"

	para "Ich bin der tolle"
	line "MUSIK-REDAKTEUR!"

	para "Ich bin derjenige,"
	line "der diese"
	cont "wundervollen"
	cont "Melodien"

	para "auf Sendung"
	line "bringt."

	para "Sei so frei und"
	line "lausche der"
	cont "schönen Melodei!"
	done





LavRadioTower1FDirectoryText:
	text "EG REZEPTION 1S"
	line "VERKAUF 2S"
	cont "PERSONAL 3S"
	cont "PRODUKTION 4S BÜRO"
	cont "DES    INTENDANTEN"
	done





LavRadioTower1FPokeFluteSignText:
	text "Mach deine #mon"
	line "mit den Fröhlichen"

	para "Melodien der"
	line "#floete auf"
	cont "PROGRAMM 20 wieder"
	cont "munter."
	done






; TODO: use this text
LavRadioTower1FReferenceLibraryText:
	text "Wow! Ein ganzes"
	line "Regal voller"
	cont "#mon CDs und"
	cont "Videos."

	para "Das muss die"
	line "Bibliothek sein."
	done





