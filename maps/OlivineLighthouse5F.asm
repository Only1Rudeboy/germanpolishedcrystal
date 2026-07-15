OlivineLighthouse5F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  9, 15, OLIVINE_LIGHTHOUSE_6F, 1
	warp_event  3,  5, OLIVINE_LIGHTHOUSE_4F, 2
	warp_event  9,  7, OLIVINE_LIGHTHOUSE_4F, 3
	warp_event 16,  7, OLIVINE_LIGHTHOUSE_4F, 9
	warp_event 17,  7, OLIVINE_LIGHTHOUSE_4F, 10
	warp_event 16,  5, OLIVINE_LIGHTHOUSE_6F, 2
	warp_event 17,  5, OLIVINE_LIGHTHOUSE_6F, 3

	def_coord_events

	def_bg_events
	bg_event  3, 13, BGEVENT_ITEM + HYPER_POTION, EVENT_OLIVINE_LIGHTHOUSE_5F_HIDDEN_HYPER_POTION

	def_object_events
	object_event  8, 11, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSailorErnest, -1
	object_event  8,  3, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerBird_keeperDenis, -1
	itemball_event 15, 12, RARE_CANDY, 1, EVENT_OLIVINE_LIGHTHOUSE_5F_RARE_CANDY
	itemball_event  6, 15, SUPER_REPEL, 1, EVENT_OLIVINE_LIGHTHOUSE_5F_SUPER_REPEL
	tmhmball_event  2, 13, TM_ENERGY_BALL, EVENT_OLIVINE_LIGHTHOUSE_5F_TM_ENERGY_BALL

GenericTrainerBird_keeperDenis:
	generictrainer BIRD_KEEPER, DENIS, EVENT_BEAT_BIRD_KEEPER_DENIS, Bird_keeperDenisSeenText, Bird_keeperDenisBeatenText

	text "Mein #mon hat"
	line "das FLIEGEN in"
	cont "ANEMONIA CITY"
	cont "gelernt."

	para "Da ich ein"
	line "Verlierer bin,"
	cont "fliege ich nun"
	cont "fort, über das"
	cont "Meer…"
	done


GenericTrainerSailorErnest:
	generictrainer SAILOR, ERNEST, EVENT_BEAT_SAILOR_ERNEST, SailorErnestSeenText, SailorErnestBeatenText

	text "Ein ARENALEITER"
	line "muss nicht nur"
	para "stark sein. Auch"
	line "Mitgefühl zeichnet"
	cont "ihn aus."
	done

SailorErnestSeenText:
	text "Ich hatte vor,"
	line "gegen JASMIN zu"

	para "kämpfen, aber sie"
	line "ist nicht da. Wie"
	cont "wäre es mit dir?"
	done



SailorErnestBeatenText:
	text "Wow, du hast mich"
	line "überwältigt!"
	done



Bird_keeperDenisSeenText:
	text "Wir fliegen"
	line "ziemlich hoch."

	para "Meine"
	line "Vogel-#mon sind"
	cont "in Bestform."
	done
Bird_keeperDenisBeatenText:
	text "Ups… Sie sind"
	line "abgestürzt…"
	done
