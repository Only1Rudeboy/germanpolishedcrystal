PlayersNeighborsHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, NEW_BARK_TOWN, 3
	warp_event  3,  7, NEW_BARK_TOWN, 3

	def_coord_events

	def_bg_events
	bg_event  5,  1, BGEVENT_READ, InitialRadio

	def_object_events
	object_event  5,  3, SPRITE_MATRON, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, PlayersNeighborText, EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
	object_event  2,  3, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, PlayersNeighborsDaughterText, -1
	object_event  5,  4, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, (1 << EVE) | (1 << NITE), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, PlayersNeighborsHusbandText, -1

PlayersNeighborsDaughterText:
	text "PIKACHU ist ein"
	line "entwickeltes"
	cont "#MON."
	para "PROF. LINDs"
	line "Entdeckungen"
	cont "sind wirklich"
	cont "erstaunlich."
	para "Er ist berühmt für"
	line "seine Forschungen"
	cont "auf dem Gebiet der"
	cont "#MON-Evolution."
	para "…Seufz…"
	para "Ich wünschte, ich"
	line "wäre ein Forscher"
	cont "wie er…"
	done




PlayersNeighborsHusbandText:
	text "Diese Stadt ist"
	line "die südöstlichste"
	para "in ganz JOHTO."
	done

PlayersNeighborText:
	text "Meine Tochter will"
	line "unbedingt PROF."
	para "LINDs Assistentin"
	line "werden."
	para "Sie liebt #MON"
	line "von ganzem Herzen!"
	para "Aber ich auch!"
	done




