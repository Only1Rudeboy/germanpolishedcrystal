MountMoonB2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 10, 24, MOUNT_MOON_B1F, 4
	warp_event 21,  7, MOUNT_MOON_B1F, 5
	warp_event 17, 15, MOUNT_MOON_B1F, 6
	warp_event  3,  9, MOUNT_MOON_B1F, 7

	def_coord_events

	def_bg_events
	bg_event 28,  7, BGEVENT_ITEM + ETHER, EVENT_MOUNT_MOON_B2F_HIDDEN_ETHER
	bg_event  7,  9, BGEVENT_ITEM + STARDUST, EVENT_MOUNT_MOON_B2F_HIDDEN_STARDUST
	bg_event 10, 30, BGEVENT_ITEM + PP_UP, EVENT_MOUNT_MOON_B2F_HIDDEN_PP_UP

	def_object_events
	object_event 24,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerYoungsterJosh, -1
	object_event 12, 21, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBird_keeperMick, -1
	object_event 29, 18, SPRITE_HEX_MANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerHexManiacEsther, -1
	object_event  4, 15, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerCooltrainermConnor, -1
	object_event  9,  8, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSuperNerdMiguel, -1
	object_event 10,  6, SPRITE_ICE_BOULDER_FOSSILS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_ITEMBALL, PLAYEREVENT_ITEMBALL, HELIX_FOSSIL, 1, EVENT_MOUNT_MOON_B2F_HELIX_FOSSIL
	object_event 11,  6, SPRITE_ICE_BOULDER_FOSSILS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_ITEMBALL, PLAYEREVENT_ITEMBALL, DOME_FOSSIL, 1, EVENT_MOUNT_MOON_B2F_DOME_FOSSIL
	itemball_event 11, 14, MOON_STONE, 1, EVENT_MOUNT_MOON_B2F_MOON_STONE
	itemball_event 18, 21, DUSK_STONE, 1, EVENT_MOUNT_MOON_B2F_DUSK_STONE
	itemball_event 22,  3, SHINY_STONE, 1, EVENT_MOUNT_MOON_B2F_SHINY_STONE
	itemball_event 26, 11, BIG_MUSHROOM, 1, EVENT_MOUNT_MOON_B2F_BIG_MUSHROOM

GenericTrainerYoungsterJosh:
	generictrainer YOUNGSTER, YOUNGSTER_JOSH, EVENT_BEAT_YOUNGSTER_JOSH, YoungsterJoshSeenText, YoungsterJoshBeatenText

	text "Mit so einem"
	line "#MON-Team hast"

	para "du sicher viele"
	line "Orte erkundet."

	para "Verlaufen gehört"
	line "bei dir zum"
	cont "Alltag, was?"
	done

GenericTrainerBird_keeperMick:
	generictrainer BIRD_KEEPER, MICK, EVENT_BEAT_BIRD_KEEPER_MICK, Bird_keeperMickSeenText, Bird_keeperMickBeatenText

	text "Gleich und gleich"
	line "gesellt sich gern."
	para "Ich sollte mich"
	line "mit anderen"
	para "Vogel-Sammlern an"
	line "einem sinnvollen"
	cont "Ort treffen."
	done

GenericTrainerHexManiacEsther:
	generictrainer HEX_MANIAC, ESTHER, EVENT_BEAT_HEX_MANIAC_ESTHER, HexManiacEstherSeenText, HexManiacEstherBeatenText

	text "Spieglein,"
	line "Spieglein groß und"
	para "weiß, sah meine"
	line "schnelle"
	cont "Niederlage nicht"
	cont "voraus."
	done

GenericTrainerCooltrainermConnor:
	generictrainer COOLTRAINERM, CONNOR, EVENT_BEAT_COOLTRAINERM_CONNOR, CooltrainermConnorSeenText, CooltrainermConnorBeatenText

	text "Stil und Charme"
	line "gehen Hand in"
	cont "Hand."

	para "Die coolste"
	line "Kombination."
	done

GenericTrainerSuperNerdMiguel:
	generictrainer SUPER_NERD, MIGUEL, EVENT_BEAT_SUPER_NERD_MIGUEL, SuperNerdMiguelSeenText, SuperNerdMiguelBeatenText

	text "Vielleicht mit"
	line "einem Aerodactyl…"
	done

YoungsterJoshSeenText:
	text "Du bist zum"
	line "Erkunden der Höhle"
	cont "gekommen, oder?"
	para "Vorsicht, du"
	line "könntest dich"
	cont "verlaufen."
	done

YoungsterJoshBeatenText:
	text "Du bist gar nicht"
	line "verloren."
	done

Bird_keeperMickSeenText:
	text "Ich weiß nicht,"
	line "warum ich hierher"

	para "kam. Meine Vögel"
	line "können in dieser"
	cont "Höhle nicht"
	cont "fliegen!"
	done

Bird_keeperMickBeatenText:
	text "Ja, das war eine"
	line "schlechte Idee."
	done

HexManiacEstherSeenText:
	text "Spieglein,"
	line "Spieglein an der"
	cont "Wand,"
	para "wer wirft den"
	line "#BALL?"
	done

HexManiacEstherBeatenText:
	text "Du wirst es!"
	done

CooltrainermConnorSeenText:
	text "Man hat es oder"
	line "man hat es nicht."
	done

CooltrainermConnorBeatenText:
	text "Toll! Du hast es!"
	done

SuperNerdMiguelSeenText:
	text "Ich hab diese"
	line "Fossilien gefunden"
	cont "und wiederbelebt!"
	para "Jetzt gehören sie"
	line "mir!"
	done

SuperNerdMiguelBeatenText:
	text "Meine Fossilien"
	line "wurden"
	cont "zerquetscht!"
	done
