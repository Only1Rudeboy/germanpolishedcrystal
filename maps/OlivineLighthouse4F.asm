OlivineLighthouse4F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 13,  3, OLIVINE_LIGHTHOUSE_3F, 1
	warp_event  3,  5, OLIVINE_LIGHTHOUSE_5F, 2
	warp_event  9,  7, OLIVINE_LIGHTHOUSE_5F, 3
	warp_event  9,  5, OLIVINE_LIGHTHOUSE_3F, 3
	warp_event 16,  9, OLIVINE_LIGHTHOUSE_3F, 6
	warp_event 17,  9, OLIVINE_LIGHTHOUSE_3F, 7
	warp_event  8,  3, OLIVINE_LIGHTHOUSE_3F, 8
	warp_event  9,  3, OLIVINE_LIGHTHOUSE_3F, 9
	warp_event 16,  7, OLIVINE_LIGHTHOUSE_5F, 4
	warp_event 17,  7, OLIVINE_LIGHTHOUSE_5F, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event  7, 14, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_DARK_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSailorKent, -1
	object_event 11,  2, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerLassConnie, EVENT_OLIVINE_LIGHTHOUSE_JASMINE

GenericTrainerLassConnie:
	generictrainer LASS, CONNIE, EVENT_BEAT_LASS_CONNIE, LassConnieSeenText, LassConnieBeatenText

	; GSC-DE Dump
	text "O.K. Jeder wäre"
	line "besorgt, wenn"
	cont "seine #MON"
	cont "verletzt sind."
	para "Ich werde für das"
	line "#MON beten,"
	para "dann kann JASMIN"
	line "in die PKMN-ARENA"
	cont "zurückkehren."
	done

TrainerSailorKent:
	trainer SAILOR, KENT, EVENT_BEAT_SAILOR_KENT, SailorKentSeenText, SailorKentBeatenText, 0, SailorKentScript, TRAINERPAL_DARK_SAILOR

SailorKentScript:
	endifjustbattled
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iftrue_jumptextfaceplayer SailorKentFinalText
	jumpthistextfaceplayer

	; GSC-DE Dump
	text "Apropos krank: Mir"
	line "ist zu Ohren"
	para "gekommen, dass es"
	line "in ANEMONIA CITY"
	cont "eine gute APOTHEKE"
	cont "geben soll."
	done

SailorKentSeenText:
	; GSC-DE Dump
	text "JASMIN muss krank"
	line "vor Sorge um das"
	cont "#MON hier sein."
	para "Man sieht sie"
	line "momentan nicht"
	cont "einmal lächeln."
	done

SailorKentBeatenText:
	; GSC-DE Dump
	text "Ich habe im"
	line "Moment auch nichts"
	cont "zu lachen…"
	done

SailorKentFinalText:
	; PC
	text "Das #MON hier"
	line "ist wieder gesund."
	para "Die"
	line "ANEMONIA-Apotheke"
	cont "hat ihren Ruf"
	cont "bestätigt!"
	done

LassConnieSeenText:
	; GSC-DE Dump
	text "JASMIN ist die"
	line "ARENALEITERIN in"
	cont "dieser Stadt."
	para "Ich möchte, dass"
	line "sie mit mir"
	cont "zurückkommt."
	para "Es ist besser,"
	line "niemand stellt"
	cont "sich mir in den"
	cont "Weg!"
	done

LassConnieBeatenText:
	; GSC-DE Dump
	text "Uh! Meine #MON!"
	done
