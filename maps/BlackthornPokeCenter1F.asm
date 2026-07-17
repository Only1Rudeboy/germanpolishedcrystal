BlackthornPokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, BLACKTHORN_CITY, 5
	warp_event  6,  7, BLACKTHORN_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalClairScript

	def_object_events
	pc_nurse_event  5, 1
	object_event  8,  1, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ProfOaksAide4Script, -1
	object_event 11,  6, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumpstd, happinesschecknpc, -1
	object_event  8,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, BlackthornPokeCenter1FGentlemanText, -1
	object_event  1,  4, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, BlackthornPokeCenter1FTwinText, -1

PokemonJournalClairScript:
	setflag ENGINE_READ_CLAIR_JOURNAL
	jumpthistext

	text "#MON-Journal"

	para "Spezialthema:"
	line "ARENALEITERIN SANDRA!"

	para "SANDRAs leuchtend"
	line "blaues Outfit und"
	cont "Cape machten sie"

	para "zum neuesten"
	line "Modetrend."
	done

ProfOaksAide4Script:
	checkevent EVENT_GOT_LUCKY_EGG_FROM_PROF_OAKS_AIDE
	iftrue_jumptextfaceplayer .ExplainText
	faceplayer
	opentext
	writetext .HiText
	waitbutton
	setval16 60
	special CountCaught
	iftruefwd .HereYouGo
	jumpthisopenedtext

	text "Mal sehen… Oh je!"
	line "Du hast"
	para "erst "
	text_decimal wTempDexOwn, 2, 3
	text "Arten von #MON"
	line "gefangen."
	para "Komm wieder, wenn"
	line "du 60 Arten"
	cont "gefangen hast."
	done

.HereYouGo
	writetext .HereYouGoText
	waitbutton
	verbosegiveitem LUCKY_EGG
	iffalse_jumpopenedtext .NoRoomText
	setevent EVENT_GOT_LUCKY_EGG_FROM_PROF_OAKS_AIDE
	jumpthisopenedtext

.ExplainText:
	text "Das Glücks-Ei"
	line "hilft einem"
	cont "#MON, mehr"
	cont "Erfahrung"

	para "als sonst zu"
	line "sammeln."

	para "Nutz es, um den"
	line "#dex zu"
	cont "vervollständigen!"
	done

.HiText:
	text "Hallo! Ich bin"
	line "PROF. EICHs"
	cont "Assistent."
	para "Wenn du 60 Arten"
	line "von #MON"
	cont "gefangen hast,"
	para "soll ich dir ein"
	line "Item geben."
	para "Also, <PLAYER>,"
	line "hast du mindestens"
	cont "60"
	para "Arten von #MON"
	line "gefangen?"
	done

.HereYouGoText:
	text "Mal sehen… Gut"
	line "gemacht! Du hast"
	para "gefangen "
	text_decimal wTempDexOwn, 2, 3
	text "Arten von #MON."
	para "Glückwunsch! Hier"
	line "bitte!"
	done

.NoRoomText:
	text "Oh! Du hast wohl"
	line "keinen Platz mehr"
	cont "dafür."
	done

BlackthornPokeCenter1FGentlemanText:
	; GSC-DE Dump 6215
	text "Tief im Inneren"
	line "des fernen INDIGO"

	para "PLATEAUs befindet"
	line "sich die #MON"
	cont "LIGA."

	para "Ich hörte, die"
	line "besten Trainer des"

	para "Landes versammeln"
	line "sich dort."
	done

BlackthornPokeCenter1FTwinText:
	; GSC-DE Dump 6216
	text "Es gibt da eine"
	line "Attacke, die ich"

	para "unbedingt meinen"
	line "#MON beibrin-"
	cont "gen musste."

	para "Also ging ich zum"
	line "ATTACKEN-VERLER-"
	cont "NER, um eine VM-"
	cont "Attacke vergessen"
	cont "zu lassen."
	done
