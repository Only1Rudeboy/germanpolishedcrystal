BlackthornMart_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, BLACKTHORN_CITY, 4
	warp_event  3,  7, BLACKTHORN_CITY, 4

	def_coord_events

	def_bg_events

	def_object_events
	mart_clerk_event  1,  3, MARTTYPE_STANDARD, MART_BLACKTHORN
	object_event  7,  6, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, BlackthornMartCooltrainermText, -1
	object_event  5,  2, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, BlackthornMartBlackbeltText, -1
	object_event 11,  3, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, BlackthornMartSuperNerdText, -1

BlackthornMartCooltrainermText:
	text "Top-Genesung"
	line "gibt's hier nicht"
	cont "zu kaufen, aber"

	para "sie belebt ein"
	line "besiegtes #mon"
	cont "voll."

	para "Achtung--sie"
	line "stellt keine AP"
	cont "wieder her, die"

	para "für Attacken"
	line "nötigen"
	cont "Attackenpunkte."
	done

BlackthornMartBlackbeltText:
	text "Top-Schutz hält"
	line "schwache #mon"
	cont "von dir fern."

	para "Er wirkt am"
	line "längsten von"
	cont "allen"

	para "Schutzsprays."
	done

BlackthornMartSuperNerdText:
	text "Alle Städte in"
	line "Johto sind nach"
	cont "Pflanzen benannt."

	para "Ist dir das schon"
	line "aufgefallen?"
	done
