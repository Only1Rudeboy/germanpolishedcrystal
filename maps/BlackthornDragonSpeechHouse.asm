BlackthornDragonSpeechHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, BLACKTHORN_CITY, 2
	warp_event  3,  7, BLACKTHORN_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  7,  1, BGEVENT_JUMPSTD, difficultbookshelf

	def_object_events
	object_event  2,  3, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, BlackthornDragonSpeechHouseGrannyText, -1
	pokemon_event  5,  5, DRATINI, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BLUE, BlackthornDragonSpeechHouseDratiniText, -1

BlackthornDragonSpeechHouseGrannyText:
	; GSC-DE Dump 6211
	text "Es gibt hier in"
	line "EBENHOLZ CITY"

	para "einen Trainerklan,"
	line "der Drachen nach"

	para "freien Stücken"
	line "Befehle erteilt."

	para "Daher gibt es in"
	line "dieser Stadt so"

	para "viele Legenden"
	line "über Drachen."
	done

BlackthornDragonSpeechHouseDratiniText:
	; GSC-DE Dump 6212
	text "DRATINI: Draa!"
	done

