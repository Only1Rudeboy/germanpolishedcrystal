CeruleanPokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, CERULEAN_CITY, 4
	warp_event  6,  7, CERULEAN_CITY, 4
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalMistyScript

	def_object_events
	pc_nurse_event  5, 1
	object_event  1,  5, SPRITE_GYM_GUY, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeruleanPokeCenter1FGymGuyScript, -1
	object_event  8,  4, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeruleanPokeCenter1FSuperNerdText, -1

PokemonJournalMistyScript:
	setflag ENGINE_READ_MISTY_JOURNAL
	jumpthistext

	text "#mon Journal"

	para "Spezial:"
	line "Misty!"

	para "Man sagt, Misty"
	line "verehre Lorelei,"

	para "ein ehemaliges"
	line "Mitglied der"
	cont "TOP VIER."
	done

CeruleanPokeCenter1FGymGuyScript:
	checkunits
	iftrue_jumptextfaceplayer .MetricText
	jumpthistextfaceplayer

	text "Mit einer Ge-"
	line "schwindigkeit von"

	para "über 340 mph"
	line "reist"
	line "der MAGNETZUG in"

	para "null Komma nichts"
	line "zwischen KANTO"
	cont "und"
	cont "JOHTO hin und"
	cont "her."

	para "Dadurch ist JOHTO"
	line "ganz nah."
	done
.MetricText:
	text "Der Magnetzug"
	line "fährt"
	line "über 550 km/h."

	para "Er verbindet"
	line "Kanto"
	line "und"

	para "Johto in"
	line "kürzester"
	line "Zeit."

	para "Johto ist so gut"
	line "erreichbar."
	done

CeruleanPokeCenter1FSuperNerdText:
	text "Ich kämpfe lieber"
	line "mit #mon, die"

	para "ich trainiert"
	line "habe, auch wenn"

	para "sie schwach sind,"
	line "als mit #mon,"

	para "die ich neu"
	line "gefangen habe."
	done
