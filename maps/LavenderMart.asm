LavenderMart_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, LAVENDER_TOWN, 5
	warp_event  3,  7, LAVENDER_TOWN, 5

	def_coord_events

	def_bg_events

	def_object_events
	mart_clerk_event  1,  3, MARTTYPE_STANDARD, MART_LAVENDER
	object_event  6,  6, SPRITE_HIKER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, LavenderMartPokefanMText, -1
	object_event  9,  2, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, LavenderMartRockerText, -1

LavenderMartPokefanMText:
	text "Es ist unabding-"
	line "bar, SCHUTZ bei"

	para "sich zu haben,"
	line "wenn man Höhlen"
	cont "erkundet."

	para "Obwohl ich Höhlen"
	line "sehr gerne"

	para "erforsche, habe"
	line "ich noch nicht"
	cont "alle erforscht."
	done


LavenderMartRockerText:
	text "Ich habe von"
	line "einem"
	line "Kunstschmied"

	para "gehört, der maß-"
	line "gefertigte #-"
	cont "BÄLLE in AZALEA"

	para "in JOHTO her-"
	line "stellt. Ich"
	cont "wünschte, ich"
	cont "hätte auch"
	cont "welche."
	done


