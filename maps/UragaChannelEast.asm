UragaChannelEast_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2, 11, SCARY_CAVE_1F, 1

	def_coord_events

	def_bg_events
	bg_event 45,  5, BGEVENT_JUMPTEXT, UragaChannelSignText
	bg_event  3, 13, BGEVENT_JUMPTEXT, ScaryCaveEastSignText
	bg_event 33,  4, BGEVENT_ITEM + NUGGET, EVENT_URAGA_CHANNEL_EAST_HIDDEN_NUGGET
	bg_event 34, 14, BGEVENT_ITEM + PEARL, EVENT_URAGA_CHANNEL_EAST_HIDDEN_PEARL
	bg_event 22, 12, BGEVENT_ITEM + BOTTLE_CAP, EVENT_URAGA_CHANNEL_EAST_HIDDEN_BOTTLE_CAP
	bg_event  9, 11, BGEVENT_ITEM + STAR_PIECE, EVENT_URAGA_CHANNEL_EAST_HIDDEN_STAR_PIECE

	def_object_events
	object_event  5,  2, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSwimmerfWoda, -1
	object_event 22,  7, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCooltrainermKieran, -1
	object_event 34, 15, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBikerTyrone, -1
	object_event 10,  3, SPRITE_FLOATING_BALL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, 0, OBJECTTYPE_ITEMBALL, PLAYEREVENT_ITEMBALL, DIVE_BALL, 1, EVENT_URAGA_CHANNEL_EAST_DIVE_BALL
	itemball_event 20,  8, EVIOLITE, 1, EVENT_URAGA_CHANNEL_EAST_EVIOLITE

GenericTrainerSwimmerfWoda:
	generictrainer SWIMMERF, WODA, EVENT_BEAT_SWIMMERF_WODA, .SeenText, .BeatenText

	text "Die starken"
	line "Strömungen hier"
	cont "sind ideal zum"
	cont "Trainieren."
	done

.SeenText:
	text "Bist du auch zum"
	line "Trainieren hier?"
	done

.BeatenText:
	text "Du brauchst kein"
	line "weiteres Training!"
	done

GenericTrainerCooltrainermKieran:
	generictrainer COOLTRAINERM, KIERAN, EVENT_BEAT_COOLTRAINERM_KIERAN, .SeenText, .BeatenText

	text "Ich konnte mein"
	line "#mon nicht"

	para "auf Linie bringen."
	line "Ich muss mich"
	cont "wieder"
	cont "fokussieren."
	done

.SeenText:
	text "Los geht's wie"
	line "#mon!"
	done

.BeatenText:
	text "Spiel vorbei."
	done

GenericTrainerBikerTyrone:
	generictrainer BIKER, TYRONE, EVENT_BEAT_BIKER_TYRONE, .SeenText, .BeatenText

	text "Ich bin beim"
	line "Angeben auf der"
	cont "RADWEG ins Wasser"
	cont "gefallen."

	para "Dann haben mich"
	line "starke Strömungen"
	cont "hierher"
	cont "geschleppt."
	done

.SeenText:
	text "Hust! Würg!"
	done

.BeatenText:
	text "…Keuch!"
	done

UragaChannelSignText:
	text "Uraga-Kanal"
	done

ScaryCaveEastSignText:
	text "Auf dem Schild ist"
	line "Graffiti…"

	para "“Diese Höhle ist"
	line "gruselig!”"
	done
