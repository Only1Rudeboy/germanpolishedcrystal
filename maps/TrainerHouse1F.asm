TrainerHouse1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4, 11, VIRIDIAN_CITY, 3
	warp_event  5, 11, VIRIDIAN_CITY, 3
	warp_event  8,  2, TRAINER_HOUSE_B1F, 1

	def_coord_events

	def_bg_events
	bg_event  7,  0, BGEVENT_JUMPTEXT, TrainerHouseSign1Text
	bg_event  9,  0, BGEVENT_JUMPTEXT, TrainerHouseSign2Text
	bg_event  4,  6, BGEVENT_JUMPTEXT, TrainerHouseIllegibleText

	def_object_events
	object_event  1, 10, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, TrainerHouse1FReceptionistText, -1
	object_event  8, 10, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, TrainerHouse1FCooltrainerMText, -1
	object_event  6,  2, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, TrainerHouse1FCooltrainerFText, -1
	object_event  7,  7, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, TrainerHouse1FYoungsterText, -1
	object_event  2,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, TrainerHouse1FGentlemanText, -1

TrainerHouse1FReceptionistText:
	text "Willkommen im"
	line "TRAINER-HAUS, dem"

	para "neuesten und"
	line "erlebnisreichsten"
	cont "Ort von VERTANIA"
	cont "CITY."

	para "Nur Trainer haben"
	line "hier Zutritt."

	para "Du kannst gegen"
	line "die Besten der"

	para "Besten antreten!"
	line "Geh nur die"
	cont "Treppe"
	cont "hinunter."
	done


TrainerHouse1FCooltrainerMText:
	text "VERTANIA CITY ist"
	line "dem INDIGO"
	cont "PLATEAU"
	cont "am nächsten."

	para "Man hat diesen"
	line "Ort"
	line "erbaut, weil ihn"

	para "so viele Trainer"
	line "auf ihrem Weg zum"

	para "INDIGO PLATEAU "
	line "passieren."
	done


TrainerHouse1FCooltrainerFText:
	text "Hier unten werden"
	line "Übungskämpfe"
	cont "abgehalten."

	para "Ich würde liebend"
	line "gerne sehen, wie"

	para "Trainer aus JOHTO"
	line "kämpfen."
	done


TrainerHouse1FYoungsterText:
	text "Ich nehme an, du"
	line "kannst nur dann"

	para "CHAMP werden,"
	line "wenn"
	line "du viel herum-"
	cont "kommst und so"

	para "viele Kämpfe wie"
	line "möglich"
	cont "austrägst."

	para "Der CHAMP von"
	line "ALABASTIA"
	cont "bereiste"

	para "alle großen und"
	line "kleinen Städte"
	cont "in KANTO."
	done


TrainerHouse1FGentlemanText:
	text "Puh… Ich höre"
	line "eine Zeit lang"
	cont "auf"
	cont "mit Kämpfen."
	done


TrainerHouseSign1Text:
	text "Übungskämpfe"
	line "werden unten in"

	para "der ÜBUNGSHALLE"
	line "abgehalten."

	para "Auch erfahrene"
	line "Trainer können"
	cont "gerne teilnehmen."
	done


TrainerHouseSign2Text:
	text "Bei den"
	line "Trainings-"
	line "kämpfen gelten"

	para "keine Regeln oder"
	line "Vorgaben. Wie bei"

	para "den Feldkämpfen"
	line "ist alles"
	cont "erlaubt!"
	done


TrainerHouseIllegibleText:
	text "…Was ist das?"
	line "Eine strategische"
	cont "Notiz?"

	para "Dieses Schrift-"
	line "stück sieht aus"

	para "wie die Spur"
	line "eines"
	line "ONIX…"
	cont "Völlig unlesbar…"
	done


