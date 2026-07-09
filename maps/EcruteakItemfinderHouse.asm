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

	para "man leicht über-"
	line "sieht."

	para "Setze den"
	line "DETEKTOR"
	line "ein, um Items"
	cont "auf-"
	cont "zuspüren, die"
	cont "sich"

	para "in der Nähe"
	line "befin-"
	line "den."

	para "Den exakten Fund-"
	line "ort musst du aber"

	para "selbst herausfin-"
	line "den."

	para "Ich hörte auch,"
	line "dass in der TURM-"
	cont "RUINE von TEAK"

	para "CITY Items zu"
	line "fin-"
	line "den wären."
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

	text "TEAK CITY war"
	line "auch die Heimat"

	para "dreier #mon,"
	line "die durch die"
	cont "Stadt rasten."

	para "Man sagt, sie"
	line "wurden aus"

	para "Wasser, Blitz"
	line "und Feuer"
	cont "geboren."

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
	line "Aben-"
	line "teuer ohne eine"
	cont "Schatzsuche?"

	para "Hab ich Recht"
	line "oder"
	line "hab ich Recht?"
	done


EcruteakItemfinderTrueSpiritText:
	text "Gut! Du trägst"
	line "den"
	line "wahren"
	cont "Abenteurer-"
	cont "geist in dir."

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

	para "Jeder Turm war"
	line "das"
	line "Zuhause mächtiger"
	cont "fliegender #-"
	cont "MON."

	para "Doch einer der"
	line "Türme brannte ab."

	para "Die beiden #mon"
	line "wurden seitdem"
	cont "nicht mehr gese-"
	cont "hen…"

	para "Weiterlesen?"
	done


