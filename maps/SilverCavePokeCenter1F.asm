SilverCavePokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, SILVER_CAVE_OUTSIDE, 1
	warp_event  6,  7, SILVER_CAVE_OUTSIDE, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalLanceScript

	def_object_events
	pc_nurse_event  5, 1
	object_event  9,  4, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 1, 2, -1, 0, OBJECTTYPE_SCRIPT, 0, SilverCavePokeCenterGrampsScript, -1
	object_event  2,  4, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 1, 2, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SilverCavePokeCenter1FGrannyText, -1

PokemonJournalLanceScript:
	setflag ENGINE_READ_LANCE_JOURNAL
	jumpthistext

	text "#mon Journal"

	para "Spezial: Champ"
	line "Dragoran!"

	para "Dragoran wurde"
	line "beim Einkaufen"

	para "seiner Umhänge im"
	line "DUKATIA-Kaufhaus"
	cont "gesehen."
	done

SilverCavePokeCenterGrampsScript:
	checkevent EVENT_GOT_EXPERT_BELT
	iftrue_jumptextfaceplayer .AfterText
	faceplayer
	opentext
	writetext .GreetingText
	waitbutton
	readvar VAR_PKMN_JOURNALS
	ifequalfwd 0, .ReadNone
	ifequalfwd NUM_POKEMON_JOURNALS, .ReadThemAll
	jumpthisopenedtext

	text "Ach, du hast"
	done
	text_decimal hScriptVar, 1, 2
	line " gelesen?"

	para "Nicht schlecht,"
	line "aber ich habe"
	cont "{d:NUM_POKEMON_JOURNALS}!"
	done

.ReadNone:
	jumpthisopenedtext

	text "Du hast keine"
	line "gelesen? Schade."
	para "In #mon-Centern"
	line "stehen die meisten"
	para "im Regal, aber"
	line "echte Fans wie ich"
	cont "suchen die"
	cont "seltenen."
	done

.ReadThemAll:
	writetext .ReadAllText
	promptbutton
	verbosegiveitem EXPERT_BELT
	iffalse_endtext
	setevent EVENT_GOT_EXPERT_BELT
	jumpthisopenedtext

.AfterText:
	text "Dieser Gürtel ist"
	line "nicht nur Deko."

	para "Er stärkt deine"
	line "#mon, wenn sie"
	cont "ihn tragen."
	done

.GreetingText:
	text "In meiner Jugend"
	line "war ich selbst ein"
	cont "talentierter"
	cont "Trainer."
	para "Heute lese ich nur"
	line "im #mon Journal"
	cont "über andere."
	para "Liest du auch das"
	line "Journal?"
	done

.ReadAllText:
	text "Du hast alle"
	line "gelesen?"
	para "Dann bist"
	para "du ein"
	line "Journal-Experte"
	cont "wie ich!"
	para "Nimm das als"
	line "Beweis deiner"
	cont "Fan-Treue!"
	done

SilverCavePokeCenter1FGrannyText:
	text "Trainer, die nach"
	line "Stärke streben,"
	para "erklimmen den"
	line "SIL-BERBERG trotz"
	cont "seiner vielen"
	cont "Gefahren …"
	para "Durch ihre treuen"
	line "#mon haben"
	para "sie das Gefühl,"
	line "überall hinkommen"
	para "zu können …"
	done
