Route34Coast_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events

	def_coord_events

	def_bg_events

	def_object_events
	object_event  7, 47, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmermFrank, -1
	object_event 10, 21, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_DARK_RED, OBJECTTYPE_TRAINER, 4, TrainerSwimmermNadar, -1
	object_event  7, 61, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerSwimmermConrad, -1
	object_event  8, 43, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmerfCaroline, -1
	object_event  8,  6, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmerfNatalia, -1
	object_event 12, 14, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFisherFrancis, -1
	object_event  7, 32, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerBird_keeperTony, -1
	object_event  3, 37, SPRITE_FLOATING_BALL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, 0, OBJECTTYPE_ITEMBALL, PLAYEREVENT_ITEMBALL, PEARL_STRING, 1, EVENT_ROUTE_34_COAST_PEARL_STRING

GenericTrainerSwimmermFrank:
	generictrainer SWIMMERM, FRANK, EVENT_BEAT_SWIMMERM_FRANK, .SeenText, .BeatenText

	text "Meer, Sand, Sonne"
	line "und #MON!"

	para "Was braucht man"
	line "noch?"
	done

.SeenText:
	text "Ich mache Urlaub"
	line "mit meiner Frau,"
	cont "aber O.K.-- ich"
	cont "kämpfe mit dir."
	done

.BeatenText:
	text "Mir egal, ich bin"
	line "im Urlaub!"
	done

TrainerSwimmermNadar:
	trainer SWIMMERM, NADAR, EVENT_BEAT_SWIMMERM_NADAR, .SeenText, .BeatenText, 0, .Script, TRAINERPAL_DARK_SWIMMERM

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "Schwimmen üben"
	line "oder mit meinen"
	cont "#MON"
	cont "trainieren?"

	para "Was für ein"
	line "Dilemma."
	done

.SeenText:
	text "Schwimmen ist"
	line "meine Spezialität!"
	para "#MON-Kämpfe"
	line "auch!"
	done

.BeatenText:
	text "Bei meiner eigenen"
	line "Spezialität"
	cont "verloren?"
	done

GenericTrainerSwimmermConrad:
	generictrainer SWIMMERM, CONRAD, EVENT_BEAT_SWIMMERM_CONRAD, .SeenText, .BeatenText

	text "UV-Strahlen"
	line "reflektiert das"
	cont "Wasser."

	para "Denk an"
	line "Sonnencreme."
	done

.SeenText:
	text "Creme drauf,"
	line "Brille runter …"
	cont "Ich bin bereit"
	para "für die Wellen!"
	done

.BeatenText:
	text "Uff! Diesmal"
	line "trafen mich die"
	cont "Wellen."
	done

GenericTrainerSwimmerfCaroline:
	generictrainer SWIMMERF, CAROLINE, EVENT_BEAT_SWIMMERF_CAROLINE, .SeenText, .BeatenText

	text "Wir wohnen in"
	line "Dukatia, aber"

	para "diese Route ist"
	line "ein wunderbarer"
	cont "Ausflug!"
	done

.SeenText:
	text "Mein Mann und ich"
	line "sind hier im"
	cont "Urlaub."
	done

.BeatenText:
	text "Ach! Wie schade."
	done

GenericTrainerSwimmerfNatalia:
	generictrainer SWIMMERF, NATALIA, EVENT_BEAT_SWIMMERF_NATALIA, .SeenText, .BeatenText

	text "Ich glaub, ich"
	line "kaufte den"
	cont "falschen Bikini."

	para "Die Farbe passt"
	line "nicht."
	done

.SeenText:
	text "Ich kaufte einen"
	line "neuen Bikini."

	para "Das ist die"
	line "neueste Mode."
	done

.BeatenText:
	text "Bah!"
	done

GenericTrainerFisherFrancis:
	generictrainer FISHER, FRANCIS, EVENT_BEAT_FISHER_FRANCIS, .SeenText, .BeatenText

	text "Ob ich gewinne"
	line "oder verliere,"
	para "ist egal. Ich will"
	line "Spaß haben und"
	cont "angeln."
	done

.SeenText:
	text "Ich angle gern"
	line "nach #MON an"
	cont "exotischen Orten."
	done

.BeatenText:
	text "Ach! Was für ein"
	line "toller Treffer!"
	done

GenericTrainerBird_keeperTony:
	generictrainer BIRD_KEEPER, BIRD_KEEPER_TONY, EVENT_BEAT_BIRD_KEEPER_TONY, .SeenText, .BeatenText

	text "Jeder kennt den"
	line "Vogel, der alles"
	cont "sagt."
	done

.SeenText:
	text "Kennst du den"
	line "Vogel?"
	done

.BeatenText:
	text "Du kennst den"
	line "Vogel nicht?"
	done
