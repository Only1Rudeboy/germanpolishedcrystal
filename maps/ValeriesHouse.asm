ValeriesHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, SetupValerieAfterMorningWalkScript

	def_warp_events
	warp_event  3,  7, ECRUTEAK_CITY, 12
	warp_event  4,  7, ECRUTEAK_CITY, 12

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_JUMPSTD, radio2

	def_object_events
	object_event  2,  3, SPRITE_VALERIE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, ValeriesHouseValerieText, EVENT_VALERIE_ECRUTEAK_CITY
	object_event  3,  3, SPRITE_BOOK_PAPER_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ValeriesHouseFairyBookScript, -1

	object_const_def
	const VALERIESHOUSE_VALERIE
	const VALERIESHOUSE_FAIRY_BOOK

SetupValerieAfterMorningWalkScript:
	checkevent EVENT_FOUGHT_SUICUNE
	iffalsefwd .Disappear
	checkevent EVENT_BEAT_VALERIE
	iffalsefwd .Disappear
	checkflag ENGINE_VALERIE_MORNING_WALK
	iftruefwd .Appear
	checktime 1 << MORN
	iffalsefwd .Appear
.Disappear:
	disappear VALERIESHOUSE_VALERIE
	sjumpfwd SetupFairyBookScript

.Appear
	appear VALERIESHOUSE_VALERIE
	; fallthrough

SetupFairyBookScript:
	readvar VAR_WEEKDAY
	ifequalfwd SUNDAY, .Sunday
	ifequalfwd MONDAY, .Monday
	ifequalfwd TUESDAY, .Tuesday
	ifequalfwd WEDNESDAY, .Wednesday
	ifequalfwd THURSDAY, .Thursday
	ifequalfwd FRIDAY, .Friday
	ifequalfwd SATURDAY, .Saturday
.Sunday
	setmapobjectpal VALERIESHOUSE_FAIRY_BOOK, PAL_NPC_PINK
	endcallback
.Monday
	setmapobjectpal VALERIESHOUSE_FAIRY_BOOK, PAL_NPC_BROWN
	endcallback
.Tuesday
	setmapobjectpal VALERIESHOUSE_FAIRY_BOOK, PAL_NPC_RED
	endcallback
.Wednesday
	setmapobjectpal VALERIESHOUSE_FAIRY_BOOK, PAL_NPC_BLUE
	endcallback
.Thursday
	setmapobjectpal VALERIESHOUSE_FAIRY_BOOK, PAL_NPC_GREEN
	endcallback
.Friday
	setmapobjectpal VALERIESHOUSE_FAIRY_BOOK, PAL_NPC_ENV_YELLOW
	endcallback
.Saturday
	setmapobjectpal VALERIESHOUSE_FAIRY_BOOK, PAL_NPC_PURPLE
	endcallback

ValeriesHouseValerieText:
	text "Valerie: Meine"
	line "Modendesigns"

	para "gelten als"
	line "ziemlich"
	cont "rätselhaft."
	cont "Findest du das"
	cont "auch?"

	para "Ich wollte schon"
	line "immer ein #mon"
	cont "sein, weißt du."

	para "Dieser Wunsch ist"
	line "meine Inspiration"

	para "und das, was ich"
	line "mit Designen"
	cont "erreichen will."

	para "Und doch… nur im"
	line "verzweifelten"

	para "Kampf mit #mon"
	line "fühle ich mich"

	para "wirklich eins mit"
	line "ihnen."

	para "Ich frage mich,"
	line "warum das so ist…"
	done

ValeriesHouseFairyBookScript:
	opentext
	writetext ValeriesHouseFairyBookText
	waitbutton
	readvar VAR_WEEKDAY
	ifequalfwd SUNDAY, .Sunday
	ifequalfwd MONDAY, .Monday
	ifequalfwd TUESDAY, .Tuesday
	ifequalfwd WEDNESDAY, .Wednesday
	ifequalfwd THURSDAY, .Thursday
	ifequalfwd FRIDAY, .Friday
	ifequalfwd SATURDAY, .Saturday
.Sunday
	jumpthisopenedtext

	text "Ein Mann wird von"
	line "einer Schildkröte"
	cont "unter dem Meer"
	cont "geführt…"
	done

.Monday
	jumpthisopenedtext

	text "Ein Bauernhaus"
	line "wird über Nacht"
	cont "zum Palast…"
	done

.Tuesday
	jumpthisopenedtext

	text "Ein Mädchen mit"
	line "sehr langem Haar"
	cont "ist in einem Turm"
	cont "eingesperrt…"
	done

.Wednesday
	jumpthisopenedtext

	text "Ein schönes"
	line "Mädchen spricht"
	cont "mit einem"
	cont "Pferdekopf…"
	done

.Thursday
	jumpthisopenedtext

	text "Ein sprechender"
	line "Fisch behauptet,"
	cont "Wünsche erfüllen"
	cont "zu können…"
	done

.Friday
	jumpthisopenedtext

	text "Ein goldener"
	line "Apfelbaum steht"
	cont "auf einem"
	cont "Glasberg…"
	done

.Saturday
	jumpthisopenedtext

	text "Ein Hund gräbt im"
	line "Garten und findet"
	cont "goldenen Schatz…"
	done

ValeriesHouseFairyBookText:
	text "Ein Buch mit"
	line "Märchen."
	done
