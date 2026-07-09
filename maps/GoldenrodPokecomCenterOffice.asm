GoldenrodPokecomCenterOffice_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  0,  8, GOLDENROD_POKECOM_CENTER_1F, 3
	warp_event  1,  8, GOLDENROD_POKECOM_CENTER_1F, 3

	def_coord_events

	def_bg_events
	bg_event  3,  2, BGEVENT_UP, RangiComputerScript
	bg_event  6,  2, BGEVENT_UP, LunaComputerScript
	bg_event  9,  2, BGEVENT_UP, FredrikComputerScript
	bg_event 12,  2, BGEVENT_UP, EmiComputerScript
	bg_event  6,  5, BGEVENT_UP, AizawaComputerScript
	bg_event  9,  5, BGEVENT_UP, VulcanComputerScript
	bg_event 12,  5, BGEVENT_UP, SourComputerScript

	def_object_events
	object_event  4,  4, SPRITE_SCIENTIST_F, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, PAL_NPC_RANGI, OBJECTTYPE_COMMAND, jumptextfaceplayer, AdminRangiText, -1
	object_event  7,  3, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, AdminLunaText, -1
	object_event 10,  3, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, AdminFredrikText, -1
	object_event 13,  3, SPRITE_DAISY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_EMI, OBJECTTYPE_COMMAND, jumptextfaceplayer, AdminEmiText, -1
	object_event  7,  6, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, AdminAizawaText, -1
	object_event 10,  6, SPRITE_PI, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_AZURE, OBJECTTYPE_COMMAND, jumptextfaceplayer, AdminVulcanText, -1
	object_event 13,  6, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_COMMAND, jumptextfaceplayer, AdminSourText, -1
	object_event  4,  1, SPRITE_MON_ICON, SPRITEMOVEDATA_ADMIN_MEOWTH, 0, MEOWTH, -1, PAL_MON_BROWN, OBJECTTYPE_SCRIPT, NO_FORM, AdminEldredScript, -1

AdminRangiText:
	text "Rangi: Ich hoffe,"
	line "du hast Spaß"

	para "auf deiner Reise"
	line "durch dieses"
	cont "Spiel!"

	para "Wir hatten Mühe,"
	line "alle Daten für"
	cont "es"
	cont "unterzubringen."

	para "Es gab kaum noch"
	line "Platz für mein"
	cont "Sprite!"
	done

RangiComputerScript:
	jumpthistext

	text "Optimieren…"
	line "blinkt auf dem"
	cont "Bildschirm."

	para "Es scheint eine"
	line "Weile zu dauern."
	done

AdminLunaText:
	text "Luna: Warst du"
	line "beim"
	line "ersten Mal per"
	cont "Wunder-Tausch"

	para "mit jemand aus"
	line "einer anderen"
	cont "Region nicht"
	cont "beeindruckt?"

	para "Ich habe das"
	line "ursprüngliche"
	cont "System direkt"
	cont "hier in Dukatia"
	cont "gebaut!"
	done

LunaComputerScript:
	jumpthistext

	text "Ein Bildschirm"
	line "voller"
	line "dichter Notizen"
	cont "und"
	cont "Karten"

	para "unbekannter Orte"
	line "und ein"

	para "Bild von Johto,"
	line "bedeckt mit"
	cont "Schnee."
	done

AdminFredrikText:
	text "Fredrik: Bills"
	line "PC-"
	line "#mon-Lagerungs-"
	cont "System ist"
	cont "quelloffen,"

	para "also konnte ich"
	line "seine Datenbank"
	cont "komplett neu"
	cont "schreiben und"
	cont "verbessern!"
	done

FredrikComputerScript:
	jumpthistext

	text "Ein Dutzend"
	line "Fenster"
	line "sind gleichzeitig"
	cont "offen,"

	para "jedes zu einer"
	line "eigenen Funktion."
	done

AdminEmiText:
	text "Emi: Hast du"
	line "schon"
	line "die Daten deines"
	cont "#mon gesehen?"

	para "Ich komme aus der"
	line "Beria-Region"

	para "und bringe solche"
	line "Oberflächen nach"
	cont "Johto!"

	para "Sag Hallo, wenn"
	line "du"
	line "mal in Amethyst"
	cont "Town bist!"
	done

EmiComputerScript:
	jumpthistext

	text "Viel Code wird"
	line "von"
	line "einem Solitär-"
	cont "Spiel verdeckt."
	done

AdminAizawaText:
	text "Aizawa: Dialoge,"
	line "Karten-Designs,"
	cont "Charakter-"
	cont "Sprites,"
	cont "Trainer-Teams…"

	para "Game Freak in"
	line "Kanto hat Glück,"

	para "eine ganze Firma"
	line "dafür zu haben!"
	done

AizawaComputerScript:
	jumpthistext

	text "Ein Programm"
	line "namens"
	line "Polished Map++"
	cont "zeigt eine"

	para "halb gezeichnete"
	line "tropische Insel."
	done

AdminVulcanText:
	text "Vulcan: Wie ist"
	line "das"
	line "Wetter?"

	para "Das ist kein"
	line "leeres"
	line "Geschwätz… Ich"
	cont "hab's umgesetzt!"

	para "Wir dachten, es"
	line "ging nicht…"

	para "Ich habe mich"
	line "selbst widerlegt!"
	done

VulcanComputerScript:
	jumpthistext

	text "Eine Wetterkarte"
	line "wird auf dem"
	cont "Bildschirm"
	cont "angezeigt."

	para "Es regnet in"
	line "Johto."
	done

AdminSourText:
	text "Sour: Wie"
	line "gefallen"
	line "dir die Attack-"
	cont "Animationen im"
	cont "Kampf?"

	para "Ich will jede"
	line "Attacke zum"
	cont "Vergnügen machen!"
	done

SourComputerScript:
	jumpthistext

	text "Ein albernes Bild"
	line "eines eiförmigen"
	cont "Mannes mit"
	cont "Schnurrbart."
	done

AdminEldredScript:
	opentext
	writetext AdminMeowthText
	cry MEOWTH
	promptbutton
	jumpthisopenedtext

	text "Ein freches Mauzi"
	line "tappt mit den"
	cont "Pfoten auf die"
	cont "Tastatur."
	done

AdminMeowthText:
	text "Eldred: Mauz!"
	done
