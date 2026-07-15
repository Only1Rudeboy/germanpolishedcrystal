OlivineMart_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, OLIVINE_CITY, 7
	warp_event  3,  7, OLIVINE_CITY, 7

	def_coord_events

	def_bg_events

	def_object_events
	mart_clerk_event  1,  3, MARTTYPE_STANDARD, MART_OLIVINE
	object_event  6,  2, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivineMartCooltrainerFText, -1
	object_event  1,  6, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivineMartLassText, -1

OlivineMartCooltrainerFText:
	text "Können deine"
	line "#mon schon"
	cont "Leute"
	para "übers Wasser"
	line "tragen?"
	done



OlivineMartLassText:
	text "Ich habe mein"
	line "SMETTBO von meinem"
	cont "Freund aus Übersee"
	cont "bekommen."
	para "Es hatte einen"
	line "BRIEF von ihm"
	cont "dabei."
	para "Willst du wissen,"
	line "was er schreibt?"
	para "Mal sehen … Oh!"
	line "Das ist ein"
	cont "Geheimnis!"
	done



