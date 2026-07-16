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
	; GSC-DE Dump 6213
	text "Du kannst TOP-BE-"
	line "LEBER zwar nicht"

	para "kaufen, aber er"
	line "füllt die KP be-"
	cont "siegter #MON"

	para "wieder vollständig"
	line "auf."

	para "Vorsicht! Die AP,"
	line "oder ANGRIFFSPUNK-"
	cont "TE, werden nicht"
	cont "aufgefüllt."
	done

BlackthornMartBlackbeltText:
	; GSC-DE Dump 6214
	text "TOP-SCHUTZ hält"
	line "dir schwache #-"
	cont "MON vom Leib."

	para "Von allen SCHUTZ-"
	line "Sprays hält es am"
	cont "längsten an."
	done

BlackthornMartSuperNerdText:
	; PC-only
	text "Alle Städte in"
	line "JOHTO sind nach"
	cont "Pflanzen benannt."

	para "Ist dir das schon"
	line "aufgefallen?"
	done
