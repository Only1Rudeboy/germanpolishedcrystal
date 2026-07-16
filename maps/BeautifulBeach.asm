BeautifulBeach_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 11, 23, SEAGALLOP_FERRY_SHAMOUTI_GATE, 1
	warp_event 12, 23, SEAGALLOP_FERRY_SHAMOUTI_GATE, 1
	warp_event 27, 18, BEAUTIFUL_BEACH_VILLA, 1

	def_coord_events

	def_bg_events
	bg_event 14, 21, BGEVENT_JUMPTEXT, BeautifulBeachWelcomeSignText
	bg_event 29, 19, BGEVENT_JUMPTEXT, BeautifulBeachVillaSignText

	def_object_events
	object_event 11, 18, SPRITE_AROMA_LADY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerAromaLadyBryony, -1
	object_event 26, 26, SPRITE_SIGHTSEER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSightseermJaska, -1
	object_event 33, 23, SPRITE_TAMER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerTamerVince, -1
	object_event  5, 22, SPRITE_LADY, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSightseerfRosie, -1
	object_event 12, 13, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, PAL_NPC_DARK_GREEN, OBJECTTYPE_TRAINER, 2, TrainerSwimmerfRachel, -1
	object_event 27, 13, SPRITE_ARTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerArtistMarlene, -1
	itemball_event  6, 19, LUXURY_BALL, 1, EVENT_BEAUTIFUL_BEACH_LUXURY_BALL
	itemball_event 36, 20, FULL_RESTORE, 1, EVENT_BEAUTIFUL_BEACH_FULL_RESTORE
	fruittree_event -2, 13, FRUITTREE_SHAMOUTI_ISLAND, FIGY_BERRY, PAL_NPC_BROWN

BeautifulBeachWelcomeSignText:
	text "Willkommen auf"
	line "Shamouti-Insel!"

	para "Die Hauptinsel"
	line "liegt im Westen."
	done

BeautifulBeachVillaSignText:
	text "Insel-Villa"
	done

GenericTrainerAromaLadyBryony:
	generictrainer AROMA_LADY, BRYONY, EVENT_BEAT_AROMA_LADY_BRYONY, .SeenText, .BeatenText

	text "Die Düfte hier"
	line "beleben mich"
	cont "immer."
	done

.SeenText:
	text "Tropische Blumen,"
	line "Meeresbrise…"

	para "Shamouti-Insel"
	line "duftet einfach"
	cont "herrlich!"
	done

.BeatenText:
	text "Hat dich der"
	line "Inselduft zum Sieg"
	cont "beflügelt?"
	done

GenericTrainerSightseermJaska:
	generictrainer SIGHTSEERM, JASKA, EVENT_BEAT_SIGHTSEERM_JASKA, .SeenText, .BeatenText

	text "Ich weiß, es ist"
	line "albern, aber ein"
	cont "Glücksbringer gibt"
	para "mir Sicherheit."
	done

.SeenText:
	text "Meine Glückssocken"
	line "beschützen mich"
	cont "auf Reisen."
	done

.BeatenText:
	text "Sie helfen mir"
	line "nicht, Kämpfe zu"
	cont "gewinnen…"
	done

GenericTrainerTamerVince:
	generictrainer TAMER, VINCE, EVENT_BEAT_TAMER_VINCE, .SeenText, .BeatenText

	text "Meine #MON sind"
	line "bestens gezähmt,"

	para "doch ich bleibe"
	line "wild wie eh und"
	cont "je!"
	done

.SeenText:
	text "Mein brüllender"
	line "Geist wird nie"
	cont "gezähmt!"
	done

.BeatenText:
	text "Nyuh?! GRRR!"
	done

GenericTrainerSightseerfRosie:
	generictrainer SIGHTSEERF, ROSIE, EVENT_BEAT_SIGHTSEERF_ROSIE, .SeenText, .BeatenText

	text "Shamouti-Insel hat"
	line "so viel"
	cont "Geschichte!"
	para "Ich kann's nicht"
	line "erwarten, sie zu"
	cont "fotografieren."
	done

.SeenText:
	text "Der Schrein, die"
	line "drei Tempel, die"
	cont "alten Ruinen… Wo"
	cont "zuerst hin?"
	done

.BeatenText:
	text "Ich schätze,"
	line "zuerst zum"
	cont "#MON-Center."
	done

TrainerSwimmerfRachel:
	trainer SWIMMERF, RACHEL, EVENT_BEAT_SWIMMERF_RACHEL, .SeenText, .BeatenText, 0, .Script, TRAINERPAL_DARK_SWIMMERF

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "Ich könnte den"
	line "ganzen Tag in"
	cont "diesem Wasser"

	para "verbringen."
	done

.SeenText:
	text "Weißer Sand und"
	line "blaues Wasser …"
	para "Schöner Strand"
	line "macht seinem Namen"
	cont "alle Ehre!"
	done

.BeatenText:
	text "Du kämpfst"
	line "wunderschön!"
	done

GenericTrainerArtistMarlene:
	generictrainer ARTIST, MARLENE, EVENT_BEAT_ARTIST_MARLENE, .SeenText, .BeatenText

	text "Die drei"
	line "Grundfarben der"
	cont "Malerei sind Rot,"

	para "Blau und Gelb."

	para "Doch bei Licht"
	line "sind es Rot, Blau"
	cont "und Grün."
	done

.SeenText:
	text "Mein Smeargle-Trio"
	line "kann jede Szene"
	cont "malen!"
	done

.BeatenText:
	text "Sie konnten keinen"
	line "Kampf gewinnen …"
	done
