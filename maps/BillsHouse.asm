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

	; PC-only Journal
	text "#MON-Journal"
	para "Spezialthema:"
	line "#-MANIAC BILL!"
	para "BILL erfand das"
	line "#MON-"
	cont "Lagersystem für"
	cont "seine"
	para "riesige"
	line "#MON-Sammlung."
	para "Sein erstes"
	line "gefangenes"
	cont "#MON war wohl"
	cont "ein ABRA."
	done

BillsHousePCText:
	; PC-only
	text "Hier dreht sich"
	line "ein 3D-Modell von"
	cont "einem PORYGON."
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
	; PC-only (C)
	text "Das war ein geiler"
	line "Kampf!"
	para "Jeder #-MANIAC"
	line "wäre begeistert zu"
	cont "sehen, was du"
	para "gefangen hast."
	done

.IntroText:
	; PC-only (C) – GSC hat hier Opa
	text "BILL: EVOLI ist so"
	line "ein faszinierendes"
	cont "#MON."
	para "Manche sagen, die"
	line "drei legendären"
	para "Bestien JOHTO"
	line "waren einst drei"
	para "#MON, die sich"
	line "aus EVOLI"
	cont "entwickeln."
	para "Aber das könnte"
	line "nur ein Gerücht"
	cont "sein."
	para "Trotzdem würd ich"
	line "sie gern sehen…"
	done

.SeenText:
	; PC-only (C)
	text "Du hast alle drei"
	line "legendären Bestien"
	cont "gefangen?"
	para "Das ist so cool,"
	line "<PLAYER>!"
	para "Denkst du, sie"
	line "waren mal mit"
	cont "EVOLI verwandt?"
	para "Mann, jetzt muss"
	line "ich dir mein Team"
	cont "zeigen!"
	para "Du kannst die drei"
	line "Legenden, gegen"
	cont "die du kämpftest,"
	para "mit meinen eigenen"
	line "#MON"
	cont "vergleichen!"
	done

.BeatenText:
	text "Juhu!"
	done
