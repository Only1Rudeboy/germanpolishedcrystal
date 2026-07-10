Route35CoastSouth_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event 35, 14, BGEVENT_ITEM + STAR_PIECE, EVENT_ROUTE_35_COAST_SOUTH_HIDDEN_STAR_PIECE

	def_object_events
	object_event 26,  7, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerSwimmermWalter, -1
	object_event 24, 23, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmerfLisa, -1
	object_event 13, 18, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmerfJill, -1
	object_event 35, 12, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBird_keeperBryan, -1
	object_event 39, 16, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSrandjrBeaandmay1, -1
	object_event 39, 17, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSrandjrBeaandmay2, -1
	object_event 16, 10, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSailorHarvey, -1
	object_event 38,  6, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerLassRose, -1
	object_event 33,  6, SPRITE_FLOATING_BALL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, 0, OBJECTTYPE_ITEMBALL, PLAYEREVENT_ITEMBALL, BIG_PEARL, 1, EVENT_ROUTE_35_COAST_SOUTH_BIG_PEARL
	object_event  6, 15, SPRITE_FLOATING_BALL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, PAL_NPC_ENV_GREEN, OBJECTTYPE_ITEMBALL, PLAYEREVENT_KEYITEMBALL, GO_GOGGLES, EVENT_OLIVINE_PORT_GO_GOGGLES
	itemball_event 13, 31, STAR_PIECE, 1, EVENT_GOLDENROD_HARBOR_STAR_PIECE
	object_event 17, 31, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1

GenericTrainerSwimmermWalter:
	generictrainer SWIMMERM, WALTER, EVENT_BEAT_SWIMMERM_WALTER, SwimmermWalterSeenText, SwimmermWalterBeatenText

	text "Die Sonne"
	line "spiegelt"
	line "sich im Wasser —"

	para "und ich hab mich"
	line "trotzdem"
	cont "verbrannt!"
	done

GenericTrainerSwimmerfLisa:
	generictrainer SWIMMERF, LISA, EVENT_BEAT_SWIMMERF_LISA, SwimmerfLisaSeenText, SwimmerfLisaBeatenText

	text "Im Meer ist Platz"
	line "genug zum Angeln"

	para "und Kämpfen."
	done

GenericTrainerSwimmerfJill:
	generictrainer SWIMMERF, JILL, EVENT_BEAT_SWIMMERF_JILL, SwimmerfJillSeenText, SwimmerfJillBeatenText

	text "Meinen Verlust"
	line "vergesse ich mit"
	cont "einem Bad."
	done

GenericTrainerBird_keeperBryan:
	generictrainer BIRD_KEEPER, BRYAN, EVENT_BEAT_BIRD_KEEPER_BRYAN, Bird_keeperBryanSeenText, Bird_keeperBryanBeatenText

	text "Manche #mon"
	line "rennen sofort"
	cont "weg."

	para "Versuche, sie mit"
	line "KURTs TURBOBALL"
	cont "einzufangen. "

	para "Sobald ich eine"
	line "APRIKOKO WSS"
	cont "finde, bringe ich"
	cont "sie zu KURT."

	para "Er macht dann"
	line "daraus einen maß-"
	cont "gefertigten"
	cont "#BALL."
	done
GenericTrainerSrandjrBeaandmay1:
	generictrainer SR_AND_JR, BEAANDMAY1, EVENT_BEAT_SR_AND_JR_BEA_AND_MAY, SrandjrBeaandmay1SeenText, SrandjrBeaandmay1BeatenText

	text "Bea: Ich bringe"
	line "May"
	line "bei, stärker zu"
	cont "werden."
	done

GenericTrainerSrandjrBeaandmay2:
	generictrainer SR_AND_JR, BEAANDMAY2, EVENT_BEAT_SR_AND_JR_BEA_AND_MAY, SrandjrBeaandmay2SeenText, SrandjrBeaandmay2BeatenText

	text "May: Ich frage"
	line "Bea,"
	line "wie ich stärker"
	cont "werde."
	done

GenericTrainerSailorHarvey:
	generictrainer SAILOR, HARVEY, EVENT_BEAT_SAILOR_HARVEY, SailorHarveySeenText, SailorHarveyBeatenText

	text "Der Einzige, auf"
	line "den du dich auf"

	para "hoher See verlas-"
	line "sen kannst, bist"
	cont "du selbst!"

	para "Ich bin so stolz"
	line "auf mich selbst!"
	done
GenericTrainerLassRose:
	generictrainer LASS, ROSE, EVENT_BEAT_LASS_ROSE, LassRoseSeenText, LassRoseBeatenText

	text "Du hast meine"
	line "armen"
	line "Welt-#mon"
	cont "verletzt!"

	para "Heile sie in"
	line "einem"
	line "#mon-Center!"
	done

SwimmermWalterSeenText:
	text "Ich hab Sonnen-"
	line "creme vergessen"

	para "und verstecke"
	line "mich"
	line "hinter diesen"
	cont "Felsen."
	done

SwimmermWalterBeatenText:
	text "Autsch!"
	done

SwimmerfLisaSeenText:
	text "Die Fischer haben"
	line "mich angeschrien,"
	cont "weil ich sie"

	para "genervt habe…"
	done

SwimmerfLisaBeatenText:
	text "Ich wollte nur"
	line "kämpfen…"
	done

SwimmerfJillSeenText:
	text "Stehe ich in"
	line "diesem"
	line "Bikini nicht gut"
	cont "aus?"
	done

SwimmerfJillBeatenText:
	text "Hmpf!"
	done

Bird_keeperBryanSeenText:
	text "Welche Art von"
	line "#BALL"
	cont "benutzt du?"
	done
Bird_keeperBryanBeatenText:
	text "Mist! Nicht"
	line "schnell genug!"
	done
SrandjrBeaandmay1SeenText:
	text "Bea: Starke"
	line "#mon mag ich"
	cont "lieber als"

	para "niedliche #mon."

	para "Zusammen haben"
	line "wir"
	line "aber niedliche"
	cont "und"
	cont "starke #mon!"
	done

SrandjrBeaandmay1BeatenText:
	text "Bea: Stärke und"
	line "Niedlichkeit"
	cont "reichten nicht!"
	done

SrandjrBeaandmay2SeenText:
	text "May: Niedliche"
	line "#mon mag ich"

	para "lieber als starke"
	line "#mon."

	para "Zusammen haben"
	line "wir"
	line "starke und"
	cont "niedliche"
	cont "#mon!"
	done

SrandjrBeaandmay2BeatenText:
	text "May: Niedlichkeit"
	line "und Stärke"
	cont "reichten nicht!"
	done

SailorHarveySeenText:
	text "Hah! Deine #mon"
	line "sehen aus wie"
	cont "Leichtgewichte!"
	done

SailorHarveyBeatenText:
	text "Was für Kraft!"
	line "Willst du mit mir"

	para "auf hoher See"
	line "segeln?"
	done

LassRoseSeenText:
	text "Diese #mon habe"
	line "ich aus aller"
	cont "Welt"
	cont "gesammelt!"
	done

LassRoseBeatenText:
	text "Ach nein!"
	line "Dafür bin ich um"
	cont "die Welt gereist!"
	done
