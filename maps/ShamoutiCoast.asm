ShamoutiCoast_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 22, 15, FIRE_ISLAND, 1
	warp_event 54, 11, ICE_ISLAND, 1
	warp_event 84, 13, LIGHTNING_ISLAND, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  9, SPRITE_ARTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerArtistRin, -1
	object_event 12,  5, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, PAL_NPC_DARK_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfMarina, -1
	object_event 34,  9, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFisherDallas, -1
	object_event 39, 13, SPRITE_LADY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSightseerfPilar, -1
	object_event 66,  4, SPRITE_SIGHTSEER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSightseersCyandvi1, -1
	object_event 67,  4, SPRITE_LADY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSightseersCyandvi2, -1
	object_event 71, 16, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, PAL_NPC_DARK_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermAshe, -1
	object_event  6, -3, SPRITE_LADY, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	itemball_event  6, 11, STAR_PIECE, 1, EVENT_SHAMOUTI_COAST_STAR_PIECE

GenericTrainerArtistRin:
	generictrainer ARTIST, RIN, EVENT_BEAT_ARTIST_RIN, .SeenText, .BeatenText

	text "Von diesen Inseln"
	line "geht eine seltsame"
	cont "Kraft aus."

	para "Ich möchte das in"
	line "meinem Bild fest-"
	cont "halten."
	done

.SeenText:
	text "Ich male die drei"
	line "Inseln!"

	para "Bitte versperr mir"
	line "nicht die Sicht!"
	done

.BeatenText:
	text "Ich kann nicht"
	line "gleichzeitig malen"
	cont "und kämpfen."
	done

TrainerSwimmerfMarina:
	trainer SWIMMERF, MARINA, EVENT_BEAT_SWIMMERF_MARINA, .SeenText, .BeatenText, 0, .Script, TRAINERPAL_DARK_SWIMMERF

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "Wäre ich auf einer"
	line "einsamen Insel"
	cont "gestrandet, würde"
	cont "ich…"

	para "natürlich meine"
	line "#MON mitneh-"
	cont "men!"
	done

.SeenText:
	text "Wärst du auf einer"
	line "einsamen Insel"
	cont "gestrandet, welche"
	cont "drei Dinge würdest"
	cont "du mitnehmen?"
	done

.BeatenText:
	text "Weggespült ohne"
	line "Paddel!"
	done

GenericTrainerFisherDallas:
	generictrainer FISHER, DALLAS, EVENT_BEAT_FISHER_DALLAS, .SeenText, .BeatenText

	text "Egal wo ich angle,"
	line "ich hole immer nur"
	cont "Kronkorken raus."

	para "Das macht mich"
	line "wahnsinnig!"
	done

.SeenText:
	text "Argh! Nicht schon"
	line "wieder!"
	done

.BeatenText:
	text "Hm? Oh, nicht du…"
	line "mit dir ist alles"
	cont "in Ordnung."
	done

GenericTrainerSightseerfPilar:
	generictrainer SIGHTSEERF, PILAR, EVENT_BEAT_SIGHTSEERF_PILAR, .SeenText, .BeatenText

	text "Wow, ist dein"
	line "#MON aber"
	cont "stark!"

	para "Du musst weit"
	line "gereist sein, um"

	para "so viel Erfahrung"
	line "zu sammeln."
	done

.SeenText:
	text "Hallo! Ich bin von"
	line "weit her gekommen."

	para "Wie wäre es mit"
	line "einem Kampf?"
	done

.BeatenText:
	text "Ich dachte, das"
	line "würde länger"
	cont "dauern…"
	done

GenericTrainerSightseersCyandvi1:
	generictrainer SIGHTSEERS, CYANDVI1, EVENT_BEAT_SIGHTSEERS_CY_AND_VI, .SeenText, .BeatenText

	text "CY: Wir reisen"
	line "zusammen um die"
	cont "Welt."
	done

.SeenText:
	text "CY: Lust auf einen"
	line "kleinen Kampf?"
	done

.BeatenText:
	text "CY: Vi wird das"
	line "nicht gefallen…"
	done

GenericTrainerSightseersCyandvi2:
	generictrainer SIGHTSEERS, CYANDVI2, EVENT_BEAT_SIGHTSEERS_CY_AND_VI, .SeenText, .BeatenText

	text "VI: Cy und ich"
	line "sehen uns die"
	cont "Inseln an."
	done

.SeenText:
	text "VI: Wollen wir"
	line "kämpfen?"
	done

.BeatenText:
	text "VI: Tja, das war's"
	line "dann wohl."
	done

TrainerSwimmermAshe:
	trainer SWIMMERM, ASHE, EVENT_BEAT_SWIMMERM_ASHE, .SeenText, .BeatenText, 0, .Script, TRAINERPAL_DARK_SWIMMERM

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "Vor einer Weile"
	line "konnte ich noch"
	cont "gar nicht"
	cont "schwimmen."

	para "Jetzt mache ich es"
	line "so oft, dass ich"
	cont "mich kaum noch an"
	cont "früher erinnere."
	cont "Haha!"
	done

.SeenText:
	text "Schwimmen? Ich?"
	line "Ja, das liebe ich."
	done

.BeatenText:
	text "Ich habe da so ein"
	line "flaues Gefühl…"
	done
