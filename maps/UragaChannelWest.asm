UragaChannelWest_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 16,  9, SCARY_CAVE_1F, 2

	def_coord_events

	def_bg_events
	bg_event 17, 11, BGEVENT_JUMPTEXT, ScaryCaveWestSignText
	bg_event 15, 11, BGEVENT_ITEM + BIG_PEARL, EVENT_URAGA_CHANNEL_WEST_HIDDEN_BIG_PEARL

	def_object_events
	object_event 13,  9, SPRITE_ENGINEER, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, UragaChannelWestEngineerText, -1

UragaChannelWestEngineerText:
	text "Die Strömung"
	line "spült allerlei"
	cont "Treibgut an."

	para "Ich suche mit"
	line "einem"
	cont "Metalldetek-"
	cont "tor versteckte"
	cont "Items."

	para "Ein Itemfinder"
	line "wäre besser…"
	done

ScaryCaveWestSignText:
	text "Uraga-Kanal"
	line "voraus"

	para "Betrete ihn nur"
	line "von Route 18 im"
	cont "Westen!"
	done
