SlowpokeWellEntrance_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 11,  7, AZALEA_TOWN, 6
	warp_event  7,  5, SLOWPOKE_WELL_B1F, 1

	def_coord_events

	def_bg_events
	bg_event  6, 13, BGEVENT_ITEM + SUPER_POTION, EVENT_SLOWPOKE_WELL_ENTRANCE_HIDDEN_SUPER_POTION

	def_object_events
	object_event  8,  9, SPRITE_KURT, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SlowpokeWellEntranceKurtText, EVENT_SLOWPOKE_WELL_KURT

SlowpokeWellEntranceKurtText:
	text "KURT: Hallo!"
	line "<PLAYER>!"

	para "Die Wache ganz"
	line "oben ist"
	cont "weggelaufen, als"
	cont "ich sie anschrie."

	para "Aber dann bin ich"
	line "in den BRUNNEN"
	cont "gefallen."

	para "Ich bin so hart "
	line "auf meinem Rücken"
	cont "gelandet, dass ich"
	cont "mich nicht mehr"
	cont "bewegen kann."

	para "Mist! Wenn ich fit"
	line "wäre, würden"

	para "meine #mon sie"
	line "bestrafen…"

	para "Ah, mir ist nicht"
	line "zu helfen."

	para "<PLAYER>, zeig"
	line "ihnen, wie mutig"
	cont "du bist. Tu es für"
	cont "mich!"
	done
