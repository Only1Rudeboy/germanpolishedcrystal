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

	; PC-only Journal
	text "#MON-Journal"
	para "Spezial: MISTY!"
	para "Man sagt, MISTY"
	line "verehre LORELEI,"
	para "ein ehemaliges"
	line "Mitglied der TOP"
	cont "VIER."
	done

CeruleanPokeCenter1FGymGuyScript:
	checkunits
	iftrue_jumptextfaceplayer .MetricText
	jumpthistextfaceplayer

	; PC imperial (Dump metric-only)
	text "Mit einer Ge-"
	line "schwindigkeit von"
	para "über 340 mph reist"
	line "der MAGNETZUG in"
	para "null Komma nichts"
	line "zwischen KANTO und"
	cont "JOHTO hin und her."
	para "Dadurch ist JOHTO"
	line "ganz nah."
	done
.MetricText:
	; GSC-DE Dump
	text "Mit einer Ge-"
	line "schwindigkeit von"
	para "über 550km/h reist"
	line "der MAGNETZUG in"
	para "null Komma nichts"
	line "zwischen KANTO und"
	cont "JOHTO hin und her."
	para "Dadurch ist JOHTO"
	line "ganz nah."
	done

CeruleanPokeCenter1FSuperNerdText:
	; GSC-DE Dump
	text "Ich kämpfe lieber"
	line "mit #MON, die"
	para "ich trainiert"
	line "habe, auch wenn"
	para "sie schwach sind,"
	line "als mit #MON,"
	para "die ich neu"
	line "gefangen habe."
	done
