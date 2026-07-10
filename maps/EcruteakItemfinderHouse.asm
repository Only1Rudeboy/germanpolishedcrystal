EcruteakItemfinderHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  7, ECRUTEAK_CITY, 11
	warp_event  4,  7, ECRUTEAK_CITY, 11

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_JUMPSTD, radio2

	def_object_events
	object_event  2,  3, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakItemfinderGuy, -1
	object_event  3,  3, SPRITE_BOOK_PAPER_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakHistoryBook, -1

EcruteakItemfinderGuy:
	checkevent EVENT_GOT_ITEMFINDER
	iftrue_jumptextfaceplayer ItemfinderExplanationText
	faceplayer
	opentext
	writetext EcruteakItemfinderAdventureText
	yesorno
	iffalse_jumpopenedtext EcruteakItemfinderToEachHisOwnText
	writetext EcruteakItemfinderTrueSpiritText
	promptbutton
	verbosegivekeyitem ITEMFINDER
	setevent EVENT_GOT_ITEMFINDER
	jumpthisopenedtext

ItemfinderExplanationText:
	text "Manchmal liegen"
	line "Items herum, die"

	para "man leicht"
	line "übersieht."

	para "Setze den DETEKTOR"
	line "ein, um Items"
	cont "aufzuspüren, die"
	cont "sich"

	para "in der Nähe"
	line "befinden."

	para "Den exakten Fund-"
	line "ort musst du aber"

	para "selbst"
	line "herausfinden."

	para "Ich hörte auch,"
	line "dass in der TURM-"
	cont "RUINE von TEAK"

	para "CITY Items zu"
	line "finden wären."
	done


EcruteakHistoryBook:
	opentext
	writetext EcruteakHistoryBookText
	yesorno
	iffalse_endtext
	writetext EcruteakTwoTowersText
	yesorno
	iffalse_endtext
	jumpthisopenedtext

	text "TEAK CITY war auch"
	line "die Heimat"

	para "dreier #mon,"
	line "die durch die"
	cont "Stadt rasten."

	para "Man sagt, sie"
	line "wurden aus"

	para "Wasser, Blitz und"
	line "Feuer geboren."

	para "Doch sie konnten"
	line "ihre gewaltige"
	cont "Kraft nicht"
	cont "bändigen."

	para "So rannten die"
	line "drei, heißt es,"

	para "wie der Wind"
	line "hinaus ins"
	cont "Grasland."
	done


EcruteakItemfinderAdventureText:
	text "Ah, suchst du mit"
	line "deinen #mon"
	cont "nach Abenteuern?"

	para "Was wäre ein"
	line "Abenteuer ohne"
	cont "eine Schatzsuche?"

	para "Hab ich Recht oder"
	line "hab ich Recht?"
	done


EcruteakItemfinderTrueSpiritText:
	text "Gut! Du trägst den"
	line "wahren"
	cont "Abenteurergeist in"
	cont "dir."

	para "Das mag ich! Nimm"
	line "dies mit dir."
	done


EcruteakItemfinderToEachHisOwnText:
	text "Oh… Jedem das"
	line "Seine…"
	done


EcruteakHistoryBookText:
	text "GESCHICHTE VON"
	line "TEAK CITY"

	para "Lesen?"
	done


EcruteakTwoTowersText:
	text "In TEAK CITY gab"
	line "es zwei Türme."

	para "Jeder Turm war das"
	line "Zuhause mächtiger"
	cont "fliegender"
	cont "#mon."

	para "Doch einer der"
	line "Türme brannte ab."

	para "Die beiden #mon"
	line "wurden seitdem"
	cont "nicht mehr"
	cont "gesehen…"

	para "Weiterlesen?"
	done


