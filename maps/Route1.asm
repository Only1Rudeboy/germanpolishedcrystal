Route1_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 10,  1, ROUTE_1_VIRIDIAN_GATE, 3

	def_coord_events

	def_bg_events
	bg_event  9, 27, BGEVENT_JUMPTEXT, Route1SignText

	def_object_events
	object_event  6, 12, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSchoolboyDanny, -1
	object_event 17, 14, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSchoolboySherman, -1
	object_event 16, 21, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerCooltrainermFrench, -1
	object_event 11, 25, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerCooltrainerfQuinn, -1
	fruittree_event  5,  7, FRUITTREE_ROUTE_1, FIGY_BERRY, PAL_NPC_BROWN

GenericTrainerSchoolboyDanny:
	generictrainer SCHOOLBOY, DANNY, EVENT_BEAT_SCHOOLBOY_DANNY, SchoolboyDannySeenText, SchoolboyDannyBeatenText

	text "Es ist ein"
	line "ungeschriebenes"

	para "Gesetz, dass"
	line "Trainer kämpfen,"
	cont "wenn sie sich"
	cont "begegnen."
	done
GenericTrainerSchoolboySherman:
	generictrainer SCHOOLBOY, SHERMAN, EVENT_BEAT_SCHOOLBOY_SHERMAN, SchoolboyShermanSeenText, SchoolboyShermanBeatenText

	text "Ich sollte alle"
	line "Fehler von heute"
	cont "aufzeichnen."
	done

GenericTrainerCooltrainermFrench:
	generictrainer COOLTRAINERM, FRENCH, EVENT_BEAT_COOLTRAINERM_FRENCH, CooltrainermFrenchSeenText, CooltrainermFrenchBeatenText

	text "Das war ein toller"
	line "Kampf! Findest du"
	cont "nicht?"
	done

GenericTrainerCooltrainerfQuinn:
	generictrainer COOLTRAINERF, QUINN, EVENT_BEAT_COOLTRAINERF_QUINN, CooltrainerfQuinnSeenText, CooltrainerfQuinnBeatenText

	text "Du bist stark."

	para "Du hast offenbar"
	line "hart trainiert."
	done
SchoolboyDannySeenText:
	text "Wenn sich zwei"
	line "Trainer begegnen,"
	cont "wollen sie sofort"
	cont "kämpfen."
	done






SchoolboyDannyBeatenText:
	text "Argh… Ich habe"
	line "erneut verloren…"
	done






SchoolboyShermanSeenText:
	text "Direkt nach dem"
	line "Unterricht gehe"
	cont "ich raus und übe!"
	done

SchoolboyShermanBeatenText:
	text "Ich muss dem"
	line "Lehrbuch folgen."
	done

CooltrainermFrenchSeenText:
	text "Du!"

	para "Ich habe auf"
	line "jemanden wie dich"
	cont "gewartet!"
	done

CooltrainermFrenchBeatenText:
	text "So stark wie"
	line "erwartet!"
	done

CooltrainerfQuinnSeenText:
	text "Du da! Willst du"
	line "kämpfen?"
	done






CooltrainerfQuinnBeatenText:
	text "Versagt und weg…"
	done






Route1SignText:
	text "ROUTE 1"
	para "ALABASTIA -"
	line "VERTANIA CITY"
	done






