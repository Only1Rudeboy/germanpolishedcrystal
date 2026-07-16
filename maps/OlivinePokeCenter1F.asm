OlivinePokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, OLIVINE_CITY, 1
	warp_event  6,  7, OLIVINE_CITY, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalJasmineScript

	def_object_events
	object_event  8,  1, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BeautyCharlotteScript, -1
	pc_nurse_event  5, 1
	object_event  2,  6, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumpstd, happinesschecknpc, -1
	object_event  2,  3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivinePokeCenter1FFisherText, -1
	object_event 11,  6, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivinePokeCenter1FTeacherText, -1

	object_const_def
	const OLIVINEPOKECENTER1F_BEAUTY

PokemonJournalJasmineScript:
	setflag ENGINE_READ_JASMINE_JOURNAL
	jumpthistext

	text "#mon Journal"
	para "Spezial: JASMIN!"
	para "Man munkelt,"
	line "JASMIN und ERIKA"
	para "von der"
	line "Dukatia-ARENA"
	cont "tauschen"
	para "sich über Mode"
	line "aus."
	done

BeautyCharlotteScript:
	checkevent EVENT_BEAT_BEAUTY_CHARLOTTE
	iftrue_jumptextfaceplayer .AfterText
	faceplayer
	opentext
	writetext .GreetingText
	yesorno
	iffalse_jumpopenedtext .NoBattleText
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked OLIVINEPOKECENTER1F_BEAUTY
	loadtrainer BEAUTY, CHARLOTTE
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BEAUTY_CHARLOTTE
	jumpthistext

.AfterText:
	text "Wie cool ist es,"
	line "so ein besonderes"
	cont "#mon zu haben?"
	done

.GreetingText:
	text "Ach, bist du ein"
	line "Trainer?"
	para "Du kommst gerade"
	line "recht!"
	para "Mein einzigartiges"
	line "und schönes"
	cont "#mon ist wieder"
	cont "fit."
	para "Willst du kämpfen"
	line "und von meinem"
	cont "#mon begeistert"
	cont "werden?"
	done

.NoBattleText:
	text "Ach, wirklich?"
	line "Sprich mich an,"

	para "wenn du mal"
	line "kämpfen willst!"
	done

.SeenText:
	text "Na gut! Ich komme!"
	done

.BeatenText:
	text "Toller Kampf!"
	done

OlivinePokeCenter1FFisherText:
	; GSC-DE Dump
	text "Der MATROSE im"
	line "OLIVIANA CITY-CAFE"
	cont "nebenan ist sehr"
	cont "großzügig."
	para "Er hat meinem"
	line "#MON STÄRKE"
	para "beigebracht. Jetzt"
	line "kann es Felsen be-"
	cont "wegen."
	done

OlivinePokeCenter1FTeacherText:
	; GSC-DE Dump
	text "Da gibt es jeman-"
	line "den in ANEMONIA"
	cont "CITY jenseits des"
	cont "Meeres."
	para "Ich habe gehört,"
	line "wie er mit seinen"
	cont "seltenen #MON"
	cont "angegeben hat."
	done
