BillsHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, CERULEAN_CAPE, 1
	warp_event  3,  7, CERULEAN_CAPE, 1

	def_coord_events

	def_bg_events
	bg_event  6,  1, BGEVENT_READ, PokemonJournalBillScript
	bg_event  7,  1, BGEVENT_READ, PokemonJournalBillScript
	bg_event  5,  1, BGEVENT_JUMPTEXT, BillsHousePCText

	def_object_events
	object_event  2,  3, SPRITE_BILL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BillsHouseBillScript, EVENT_NEVER_MET_BILL

PokemonJournalBillScript:
	setflag ENGINE_READ_BILL_JOURNAL
	jumpthistext

	text "#mon-Journal"

	para "Spezialthema:"
	line "#-Maniac Bill!"

	para "Bill erfand das"
	line "#mon-Lager-"
	cont "system für seine"

	para "riesige #mon-"
	line "Sammlung."

	para "Sein erstes"
	line "gefangenes #mon"

	para "war wohl ein"
	line "Abra."
	done

BillsHousePCText:
	text "Hier dreht sich"
	line "ein 3D-Modell"
	cont "von einem Porygon."
	done

BillsHouseBillScript:
	checkevent EVENT_BEAT_POKEMANIAC_BILL
	iftrue_jumptextfaceplayer .AfterText
	special SpecialBeastsCheck
	iffalse_jumptextfaceplayer .IntroText
	faceplayer
	opentext
	writetext .IntroText
	waitbutton
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	loadtrainer BILL_T, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_POKEMANIAC_BILL
	jumpthistext

.AfterText:
	text "Das war ein"
	line "geiler Kampf!"

	para "Jeder #-Maniac"
	line "wäre begeistert"
	cont "zu sehen, was du"

	para "gefangen hast."
	done

.IntroText:
	text "Bill: Evoli ist so"
	line "ein faszinierendes"
	cont "#mon."

	para "Manche sagen, die"
	line "drei legendären"

	para "Bestien Johtos"
	line "waren einst drei"

	para "#mon, die sich"
	line "aus Evoli"
	cont "entwickeln."

	para "Aber das könnte"
	line "nur ein Gerücht"
	cont "sein."

	para "Trotzdem würd ich"
	line "sie gern sehen…"
	done

.SeenText:
	text "Du hast alle drei"
	line "legendären"
	cont "Bestien gefangen?"

	para "Das ist so cool,"
	line "<PLAYER>!"

	para "Denkst du, sie"
	line "waren mal mit"
	cont "Evoli verwandt?"

	para "Mann, jetzt muss"
	line "ich dir mein Team"
	cont "zeigen!"

	para "Du kannst die drei"
	line "Legenden, gegen"
	cont "die du kämpftest,"

	para "mit meinen"
	line "eigenen #mon"
	cont "vergleichen!"
	done

.BeatenText:
	text "Juhu!"
	done
