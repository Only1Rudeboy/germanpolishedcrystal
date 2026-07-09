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

	text "#mon-Journal"

	para "Spezialthema:"
	line "Leiterin Sandra!"

	para "Sandras leuchtend"
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

	text "Mal sehen…"
	line "Oh je! Du hast"

	para "erst "
	text_decimal wTempDexOwn, 2, 3
	text " Arten"
	line "von #mon"
	cont "gefangen."

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
	line "hilft einem #mon,"
	cont "mehr Erfahrung"

	para "als sonst zu"
	line "sammeln."

	para "Nutz es, um den"
	line "#dex zu"
	cont "vervollständigen!"
	done

.HiText:
	text "Hallo! Ich bin"
	line "Prof. Eichs"
	cont "Assistent."

	para "Wenn du 60 Arten"
	line "von #mon"
	cont "gefangen hast,"

	para "soll ich dir ein"
	line "Item geben."

	para "Also, <PLAYER>,"
	line "hast du"
	cont "mindestens 60"

	para "Arten von #mon"
	line "gefangen?"
	done

.HereYouGoText:
	text "Mal sehen… Gut"
	line "gemacht! Du hast"

	para "gefangen "
	text_decimal wTempDexOwn, 2, 3
	text " Arten"
	line "von #mon."

	para "Glückwunsch!"
	line "Hier bitte!"
	done

.NoRoomText:
	text "Oh! Du hast wohl"
	line "keinen Platz"
	cont "mehr dafür."
	done

BlackthornPokeCenter1FGentlemanText:
	text "Tief im fernen"
	line "Indigo-Plateau"
	cont "liegt die #mon-"

	para "Liga."

	para "Ich hörte, die"
	line "besten Trainer aus"
	cont "dem ganzen Land"

	para "versammeln sich"
	line "dort."
	done

BlackthornPokeCenter1FTwinText:
	text "Da gab's diese"
	line "Attacke, die mein"
	cont "#mon unbedingt"

	para "lernen musste."

	para "Also ließ ich vom"
	line "Attacken-"
	cont "Verlerner eine"

	para "VM-Attacke"
	line "vergessen."
	done
