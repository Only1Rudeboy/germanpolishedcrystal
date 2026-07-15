OlivinePunishmentSpeechHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, OLIVINE_CITY, 4
	warp_event  3,  7, OLIVINE_CITY, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivinePunishmentSpeechHouseDadText, -1
	object_event  5,  5, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivinePunishmentSpeechHouseDaughterText, -1

OlivinePunishmentSpeechHouseDadText:
	text "Auf dem Weg nach"
	line "ANEMONIA CITY"
	para "siehst du vier"
	line "verlassene Inseln."
	para "Ungezogene Kinder"
	line "werden zur"
	cont "Bestrafung auf"
	cont "diese Inseln"
	cont "geschickt!"
	done


OlivinePunishmentSpeechHouseDaughterText:
	text "Wenn ich ungezogen"
	line "bin, macht mir"
	cont "Papa mit"
	cont "gruseligen"
	cont "Geschichten Angst."
	done


