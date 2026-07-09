Route26DayofWeekSiblingsHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, ROUTE_26, 3
	warp_event  3,  7, ROUTE_26, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  3, SPRITE_BOOK_PAPER_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, DayOfWeekSiblingsHousePokedexScript, -1

DayOfWeekSiblingsHousePokedexScript:
	opentext
	writetext DayOfWeekSiblingsHousePokedexText1
	yesorno
	iffalsefwd .End
	writetext DayOfWeekSiblingsHousePokedexText2
	yesorno
	iffalsefwd .End
	writetext DayOfWeekSiblingsHousePokedexText3
	waitbutton
.End:
	endtext

DayOfWeekSiblingsHousePokedexText1:
	text "Hier steht etwas"
	line "geschrieben."

	para "Lesen?"
	done
DayOfWeekSiblingsHousePokedexText2:
	text "An meine Brüder"
	line "und Schwestern:"

	para "Wir sind stolz"
	line "darauf, #mon-"
	cont "Trainern zu"
	cont "dienen."

	para "Wenn ein Trainer"
	line "mit dir spricht,"
	cont "gib ihm etwas"
	cont "Nützliches."

	para "Eure"
	line "MONJA"

	para "Weiterlesen?"
	done
DayOfWeekSiblingsHousePokedexText3:
	text "Montag, MONJA"
	line "ROUTE 40"

	para "Dienstag,"
	line "DIETLINDE"
	cont "ROUTE 29"

	para "Mittwoch, MITKO"
	line "SEE DES ZORNS"

	para "Donnerstag,"
	line "DONATUS"
	cont "ROUTE 36"

	para "Freitag, FRIEDA"
	line "ROUTE 32"

	para "Samstag, SAMSON"
	line "EBENHOLZ CITY"

	para "Sonntag,"
	line "SONNFRIED"
	line "ROUTE 37"
	done
