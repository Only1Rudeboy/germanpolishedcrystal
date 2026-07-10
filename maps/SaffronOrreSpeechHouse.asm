SaffronOrreSpeechHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, SAFFRON_CITY, 17
	warp_event  3,  7, SAFFRON_CITY, 17

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_SILPH_EMPLOYEE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SaffronOrreSpeechHouseSilphEmployeeText, -1
	object_event  5,  4, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SaffronOrreSpeechHouseCooltrainerMText, -1

SaffronOrreSpeechHouseSilphEmployeeText:
	text "Ich hörte von"
	line "einer Methode,"
	cont "das Herz eines"
	cont "#mon"

	para "zu versiegeln und"
	line "es zum Angriff"
	cont "auf Menschen zu"
	cont "zwingen."

	para "Wie kann man"
	line "#mon so etwas"
	cont "Schreckliches"
	cont "antun?!"
	done

SaffronOrreSpeechHouseCooltrainerMText:
	text "Wir kamen gerade"
	line "von einem Freund"

	para "aus einer anderen"
	line "Region zurück."

	para "Zwei Verbrecher-"
	line "banden machten"

	para "viel Ärger, aber"
	line "ein talentierter"
	cont "Trainer rettete"
	cont "sie alle."
	done
