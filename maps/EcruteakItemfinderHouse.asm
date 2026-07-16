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
	; GSC-DE Dump
	text "Manchmal liegen"
	line "Items herum, die"

	para "man leicht über-"
	line "sieht."

	para "Setze den DETEKTOR"
	line "ein, um Items auf-"
	cont "zuspüren, die sich"

	para "in der Nähe befin-"
	line "den."

	para "Den exakten Fund-"
	line "ort musst du aber"

	para "selbst herausfin-"
	line "den."

	para "Ich hörte auch,"
	line "dass in der TURM-"
	cont "RUINE von TEAK"

	para "CITY Items zu fin-"
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

	; GSC-DE Dump
	text "TEAK CITY war auch"
	line "die Heimat dreier"

	para "#MON, die"
	line "durch die Stadt"
	cont "rannten."

	para "Es heißt, sie ent-"
	line "standen durch Was-"
	cont "ser, Blitz und"
	cont "Feuer."

	para "Doch konnten sie"
	line "ihre Kräfte nicht"
	cont "beherrschen."

	para "Also sind sie wie"
	line "der Wind ins offe-"
	cont "ne Grasland ge-"
	cont "rannt."
	done

EcruteakItemfinderAdventureText:
	; GSC-DE Dump
	text "Ah, suchst du mit"
	line "deinen #MON"
	cont "nach Abenteuern?"

	para "Was wäre ein Aben-"
	line "teuer ohne eine"
	cont "Schatzsuche?"

	para "Hab ich Recht oder"
	line "hab ich Recht?"
	done

EcruteakItemfinderTrueSpiritText:
	; GSC-DE Dump
	text "Gut! Du trägst den"
	line "wahren Abenteurer-"
	cont "geist in dir."

	para "Das mag ich! Nimm"
	line "dies mit dir."
	done

EcruteakItemfinderToEachHisOwnText:
	; GSC-DE Dump
	text "Oh… Jedem das"
	line "Seine…"
	done

EcruteakHistoryBookText:
	; GSC-DE Dump
	text "GESCHICHTE VON"
	line "TEAK CITY"

	para "Lesen?"
	done

EcruteakTwoTowersText:
	; GSC-DE Dump
	text "In TEAK CITY gab"
	line "es zwei Türme."

	para "Jeder Turm war das"
	line "Zuhause mächtiger"
	cont "fliegender #-"
	cont "MON."

	para "Doch einer der"
	line "Türme brannte ab."

	para "Die beiden #MON"
	line "wurden seitdem"
	cont "nicht mehr gese-"
	cont "hen…"

	para "Weiterlesen?"
	done
