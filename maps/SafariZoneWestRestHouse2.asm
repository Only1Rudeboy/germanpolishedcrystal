SafariZoneWestRestHouse2_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, SAFARI_ZONE_WEST, 8
	warp_event  3,  7, SAFARI_ZONE_WEST, 8

	def_coord_events

	def_bg_events
	bg_event  4,  1, BGEVENT_READ, PokemonJournalKogaScript
	bg_event  5,  1, BGEVENT_READ, PokemonJournalKogaScript
	bg_event  6,  1, BGEVENT_READ, PokemonJournalKogaScript
	bg_event  7,  1, BGEVENT_READ, PokemonJournalKogaScript

	def_object_events
	object_event  3,  4, SPRITE_FLANNERY, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneWestRestHouse2FlanneryScript, -1

	object_const_def
	const SAFARIZONEWESTRESTHOUSE2_FLANNERY

SafariZoneWestRestHouse2FlanneryScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_FLANNERY
	iftruefwd .Beaten
	checkevent EVENT_INTRODUCED_FLANNERY
	iftruefwd .Introduced
	writetext .IntroText
	sjumpfwd .Question
.Introduced
	writetext .RematchText
.Question
	yesorno
	iffalsefwd .Refused
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked SAFARIZONEWESTRESTHOUSE2_FLANNERY
	checkevent EVENT_BEAT_ELITE_FOUR_AGAIN
	iftruefwd .Rematch
	loadtrainer FLANNERY, 1
	sjumpfwd .StartBattle
.Rematch
	loadtrainer FLANNERY, 2
.StartBattle
	startbattle
	reloadmapafterbattle
	setevent EVENT_INTRODUCED_FLANNERY
	setevent EVENT_BEAT_FLANNERY
	opentext
.Beaten:
	jumpopenedtext .AfterText

.Refused:
	jumpopenedtext .RefusedText

.IntroText:
	text "Hallo!"
	para "Schön, jemanden"
	line "anderen hier zu"
	cont "treffen!"
	para "Ich bin FLANNERY."

	para "Ich komme aus der"
	line "HOENN-Region und"
	cont "mag Feuchtigkeit"

	para "und heiße Quellen."

	para "Die SAFARI-ZONE"
	line "fühlt sich wie zu"
	cont "Hause an!"

	para "Lass uns in einem"
	line "Kampf heiße"
	cont "Attacken"
	cont "austauschen!"
	done

.RematchText:
	text "Hallo, <PLAYER>!"

	para "Schön, dich"
	line "wiederzusehen!"

	para "Eine Niederlage"
	line "bringt mich nicht"
	cont "aus der Ruhe."

	para "Lass uns in einem"
	line "weiteren Kampf"
	cont "heiße Attacken"
	cont "austauschen!"
	done

.SeenText:
	text "Ich zeige dir die"
	line "heißen Attacken,"

	para "die ich am Vulkan"
	line "geübt habe!"
	done

.BeatenText:
	text "Puh! Kurz vor dem"
	line "Ausbruch!"
	done

.AfterText:
	text "Ich hab verloren,"
	line "aber bin völlig"
	cont "zufrieden."

	para "So einen hitzigen"
	line "Kampf erlebe ich"
	cont "selten."

	para "Lass uns"
	line "irgendwann noch"
	cont "mal so kämpfen!"
	done

.RefusedText:
	text "O.K.… Äh… Sei"
	line "nicht schüchtern,"
	cont "wenn du wieder-"
	cont "kommst!"
	done
