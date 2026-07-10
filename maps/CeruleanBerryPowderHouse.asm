CeruleanBerryPowderHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, CERULEAN_CITY, 9
	warp_event  3,  7, CERULEAN_CITY, 9

	def_coord_events

	def_bg_events
	bg_event  7,  1, BGEVENT_JUMPSTD, difficultbookshelf

	def_object_events
	object_event  5,  4, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanBerryPowderHouseGrampsScript, -1

CeruleanBerryPowderHouseGrampsScript:
	checkevent EVENT_GOT_HP_UP_FROM_CERULEAN
	iftrue_jumptextfaceplayer .Text2
	faceplayer
	opentext
	writetext .Text1
	promptbutton
	verbosegiveitem HP_UP
	iffalse_endtext
	setevent EVENT_GOT_HP_UP_FROM_CERULEAN
	jumpthisopenedtext

.Text2:
	text "Medizin zu mischen"
	line "war ein schöner"

	para "Job, aber ich"
	line "verdiene eine"
	cont "Pause."
	done

.Text1:
	text "Beerenpulver? Tut"
	line "mir leid, ich"

	para "bin im Ruhestand."
	line "Aber ich hab noch"

	para "etwas übrig…"
	done
