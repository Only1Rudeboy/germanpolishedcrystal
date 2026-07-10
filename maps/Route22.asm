Route22_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4,  4, POKEMON_LEAGUE_GATE, 1
	warp_event  4,  5, POKEMON_LEAGUE_GATE, 2

	def_coord_events

	def_bg_events
	bg_event  7,  7, BGEVENT_JUMPTEXT, VictoryRoadEntranceSignText
	bg_event 23, 11, BGEVENT_JUMPTEXT, Route22AdvancedTipsSignText

	def_object_events
	object_event 20, 11, SPRITE_KUKUI, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, KukuiScript, -1
	object_event 28,  2, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route22CooltrainerfText, -1

	object_const_def
	const ROUTE22_KUKUI

KukuiScript:
	checkevent EVENT_BEAT_KUKUI
	iftrue_jumptextfaceplayer .AfterText
	faceplayer
	opentext
	checkevent EVENT_INTRODUCED_KUKUI
	iftruefwd .Introduced
	writetext .IntroText
	sjumpfwd .Question
.Introduced
	writetext .RematchText
.Question
	yesorno
	iffalse_jumpopenedtext .RefusedText
	writetext .SeenText
	waitbutton
	closetext
	setevent EVENT_INTRODUCED_KUKUI
	winlosstext .BeatenText, 0
	setlasttalked ROUTE22_KUKUI
	checkevent EVENT_BEAT_ELITE_FOUR_AGAIN
	iftruefwd .Rematch
	loadtrainer KUKUI, 1
	sjumpfwd .StartBattle
.Rematch
	loadtrainer KUKUI, 2
.StartBattle
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_KUKUI
	jumpthistext

.AfterText:
	text "Krass! Ich bin mit"
	line "voller Wucht auf"
	cont "dich los,"

	para "und du hast"
	line "trotzdem gewonnen!"

	para "Kein Wunder, dass"
	line "du der Champ bist!"

	para "Ich muss härter"
	line "trainieren, bevor"

	para "ich bereit für die"
	line "Liga bin."

	para "Und dann fordere"
	line "ich dich wieder"
	cont "heraus! Juhu!"
	done

.IntroText:
	text "Hallo! Ich bin"
	line "Kukui."

	para "Du heißt also"
	line "<PLAYER>? Alles"
	cont "klar, Kumpel!"

	para "Ich komme aus der"
	line "fernen Region"
	cont "Alola!"

	para "Dort gibt's keine"
	line "#mon-Liga, also"

	para "bin ich nach Kanto"
	line "gekommen, um die"
	cont "Top Vier"

	para "hier zu fordern,"
	line "ja!"

	para "Hä? Du bist der"
	line "neue Champ?"

	para "Juhu, kein Wunder,"
	line "dass du so cool"
	cont "aussiehst!"

	para "Mein Team und ich"
	line "sind bereit."

	para "Wie wär's, wir"
	line "lassen die Liga"
	cont "aus und fordern"

	para "dich gleich jetzt"
	line "heraus?"
	done

.RematchText:
	text "Hallo, <PLAYER>!"

	para "Seit unserem"
	line "letzten Kampf hab"
	cont "ich hart"

	para "trainiert, ja! Du"
	line "siehst auch"
	cont "stärker aus!"

	para "Wie wär's mit"
	line "einer Revanche?"
	done

.SeenText:
	text "Lass uns einen"
	line "Kampf führen, der"
	cont "dieser"

	para "Stunde würdig ist!"
	done

.BeatenText:
	text "Ich konnte nicht"
	line "gewinnen, obwohl"
	cont "ich alles gab…"
	done

.RefusedText:
	text "Voll auf deine"
	line "eigene Quest"
	cont "fokussiert, ja?"

	para "Das respektiere"
	line "ich!"
	done

Route22CooltrainerfText:
	text "Der Name “Kanto”"
	line "bedeutet “östlich"
	cont "der Barriere”."

	para "Die Barriere muss"
	line "wohl der"
	cont "Silberberg sein."
	done

VictoryRoadEntranceSignText:
	text "#mon LIGA"

	para "SIEGESSTRASSE"
	line "EINGANG"
	done







Route22AdvancedTipsSignText:
	text "Prof-Tipps!"

	para "Neues Spiel+"
	line "behält dein"

	para "altes Geld,"
	line "Kampfpunkte und"

	para "alle #mon im"
	line "PC!"
	done
