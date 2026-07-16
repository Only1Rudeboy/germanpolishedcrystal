Route15_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4,  4, ROUTE_15_FUCHSIA_GATE, 3
	warp_event  4,  5, ROUTE_15_FUCHSIA_GATE, 4

	def_coord_events

	def_bg_events
	bg_event 19,  9, BGEVENT_JUMPTEXT, Route15SignText

	def_object_events
	object_event 10, 10, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSchoolboyKipp, -1
	object_event 15, 13, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSchoolboyTommy, -1
	object_event 27, 10, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSchoolboyBilly, -1
	object_event 33, 10, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSchoolgirlFaith, -1
	object_event 30, 12, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerTeacherColette, -1
	object_event 20, 10, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, PAL_NPC_DARK_GREEN, OBJECTTYPE_TRAINER, 3, TrainerTeacherHillary, -1
	object_event 30,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerPokefanfBoone, -1
	object_event 14,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerPokefanfEleanor, -1
	object_event 19,  5, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerTwinsKayandtia1, -1
	object_event 20,  5, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerTwinsKayandtia2, -1
	itemball_event 12,  5, PP_UP, 1, EVENT_ROUTE_15_PP_UP
	cuttree_event 43,  5, EVENT_ROUTE_14_CUT_TREE_3

GenericTrainerTeacherColette:
	generictrainer TEACHER_F, COLETTE, EVENT_BEAT_TEACHER_COLETTE, TeacherColetteSeenText, TeacherColetteBeatenText

	text "Ehe ich Lehrer"
	line "wurde, vergaß ich"

	para "immer eine Menge"
	line "Dinge."
	done
TrainerTeacherHillary:
	trainer TEACHER_F, HILLARY, EVENT_BEAT_TEACHER_HILLARY, TeacherHillarySeenText, TeacherHillaryBeatenText, 0, .Script, TRAINERPAL_DARK_TEACHER_F

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "Lernen ist sehr"
	line "wichtig, aber"
	cont "Bewegung ist"
	cont "genauso"
	cont "essentiell."
	done
GenericTrainerSchoolboyKipp:
	generictrainer SCHOOLBOY, KIPP, EVENT_BEAT_SCHOOLBOY_KIP, SchoolboyKippSeenText, SchoolboyKippBeatenText

	text "Meine Mutter macht"
	line "sich immer große"
	para "Sorgen um mich."
	line "Ständig muss ich"
	cont "sie anrufen."
	done
GenericTrainerSchoolboyTommy:
	generictrainer SCHOOLBOY, TOMMY, EVENT_BEAT_SCHOOLBOY_TOMMY, SchoolboyTommySeenText, SchoolboyTommyBeatenText

	text "Sayonara! Das habe"
	line "ich in meinem"
	cont "Japanischkurs"
	cont "gelernt."
	done
GenericTrainerSchoolboyBilly:
	generictrainer SCHOOLBOY, BILLY, EVENT_BEAT_SCHOOLBOY_BILLY, SchoolboyBillySeenText, SchoolboyBillyBeatenText

	text "Wenn #mon ein"
	line "Unterrichtsfach"
	cont "wäre, dann wäre"
	cont "ich bestimmt der"
	cont "Beste!"
	done
GenericTrainerSchoolgirlFaith:
	generictrainer SCHOOLGIRL, FAITH, EVENT_BEAT_SCHOOLGIRL_FAITH, SchoolgirlFaithSeenText, SchoolgirlFaithBeatenText

	text "Ich bin müde vom"
	line "Laufen. Ich muss"
	cont "eine Pause machen."
	done
GenericTrainerPokefanfBoone:
	generictrainer POKEFANF, BOONE, EVENT_BEAT_POKEFANF_BOONE, PokefanfBooneSeenText, PokefanfBooneBeatenText

	text "Beim Kämpfen sieht"
	line "man #mon,"
	para "man noch nie"
	line "gesehen hat."
	para "Das ist so toll!"
	done

GenericTrainerPokefanfEleanor:
	generictrainer POKEFANF, ELEANOR, EVENT_BEAT_POKEFANF_ELEANOR, PokefanfEleanorSeenText, PokefanfEleanorBeatenText

	text "Meine #mon sind"
	line "nicht schwach!"

	para "Deine #mon sind"
	line "zu stark!"
	done

GenericTrainerTwinsKayandtia1:
	generictrainer TWINS, KAYANDTIA1, EVENT_BEAT_TWINS_KAY_AND_TIA, TwinsKayandtia1SeenText, TwinsKayandtia1BeatenText

	text "Die Wahrheit: Ich"
	line "bin Kay!"

	para "Vielleicht…"
	done

GenericTrainerTwinsKayandtia2:
	generictrainer TWINS, KAYANDTIA2, EVENT_BEAT_TWINS_KAY_AND_TIA, TwinsKayandtia2SeenText, TwinsKayandtia2BeatenText

	text "Vielleicht"
	line "Wahrheit:"

	para "Ich bin Tia!"
	line "Absolut!"
	done

TeacherColetteSeenText:
	text "Hast du etwas"
	line "vergessen?"
	done



TeacherColetteBeatenText:
	text "Uah!"
	done



TeacherHillarySeenText:
	text "Bei schönem Wetter"
	line "würden die Kinder"
	para "lieber im Schulhof"
	line "spielen, als in"
	para "den Klassenzimmern"
	line "zu lernen."
	done



TeacherHillaryBeatenText:
	text "Ich wollte nicht"
	line "verlieren…"
	done



SchoolboyKippSeenText:
	text "Warte! Ich muss"
	line "meine Mutter"
	cont "anrufen."
	done



SchoolboyKippBeatenText:
	text "Tut mir leid,"
	line "Mutter! Ich wurde"
	cont "besiegt!"
	done



SchoolboyTommySeenText:
	text "Lass uns kämpfen."
	line "Ich werde nicht"
	cont "verlieren!"
	done



SchoolboyTommyBeatenText:
	text "Ich hätte meine"
	line "Hausaufgaben"
	cont "machen sollen!"
	done



; GSC-DE Dump 7023, 7027
SchoolgirlFaithSeenText:
	text "Wir machen einen"
	line "Ausflug zum RADIO-"
	cont "TURM in LAVANDIA,"

	para "um dort etwas in"
	line "Sozialkunde zu"
	cont "lernen."
	done

SchoolgirlFaithBeatenText:
	text "Du bist unheimlich"
	line "stark!"
	done

SchoolboyBillySeenText:
	text "Sport ist mein"
	line "Lieblingsfach!"
	done

SchoolboyBillyBeatenText:
	text "Oh, nein!"
	line "Wie konnte ich nur"

	para "verlieren?"
	done



PokefanfBooneSeenText:
	text "Hey, deine #mon"
	line "…"
	para "Zeig sie mir. Zeig"
	line "sie mir!"
	done

PokefanfBooneBeatenText:
	text "Juhu! Das war"
	line "toll!"
	done

PokefanfEleanorSeenText:
	text "Na gut, #mon,"
	line "Zeit für einen"
	cont "Kampf!"
	done

PokefanfEleanorBeatenText:
	text "Na ja…"
	done

TwinsKayandtia1SeenText:
	text "Wir sind die"
	line "Zwillinge Kay und"
	cont "Tia!"

	para "Weißt du, welche"
	line "von uns ich bin?"
	done

TwinsKayandtia1BeatenText:
	text "Tia und Kay haben"
	line "beide verloren…"
	done

TwinsKayandtia2SeenText:
	text "Wir sind die"
	line "Zwillinge Kay und"
	cont "Tia!"

	para "Weißt du, welche"
	line "von uns ich bin?"
	done

TwinsKayandtia2BeatenText:
	text "Tia und Kay haben"
	line "beide verloren…"
	done

Route15SignText:
	text "ROUTE 15"
	para "FUCHSANIA CITY -"
	line "LAVANDIA"
	done



