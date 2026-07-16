Route21_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event 12, 37, BGEVENT_ITEM + STARDUST, EVENT_ROUTE_21_HIDDEN_STARDUST_1
	bg_event  5, 66, BGEVENT_ITEM + STARDUST, EVENT_ROUTE_21_HIDDEN_STARDUST_2

	def_object_events
	object_event  8, 13, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmerfNikki, -1
	object_event  3, 29, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSwimmerfChelan, -1
	object_event  5, 45, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmerfKendra, -1
	object_event 16, 72, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerSwimmermEsteban, -1
	object_event 15, 85, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmermDuane, -1
	object_event  2, 89, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSwimmermSeth, -1
	object_event  5, 21, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFisherMurphy, -1
	object_event 15, 25, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFisherArnold, -1
	object_event  7, 36, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFisherLiam, -1
	object_event  5, 56, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFisherGideon, -1
	object_event 15, 62, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBird_keeperKinsley, -1
	object_event  7, 83, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBird_keeperEaston, -1
	itemball_event 13, 26, STAR_PIECE, 1, EVENT_ROUTE_21_STAR_PIECE
	fruittree_event 12,  3, FRUITTREE_ROUTE_21, ENIGMA_BERRY, PAL_NPC_BLACK

GenericTrainerSwimmerfNikki:
	generictrainer SWIMMERF, NIKKI, EVENT_BEAT_SWIMMERF_NIKKI, SwimmerfNikkiSeenText, SwimmerfNikkiBeatenText

	; GSC-DE Dump 7112
	text "Ich muss mich"
	line "vor Hautreizungen"
	cont "in Acht nehmen."
	done
SwimmerfNikkiSeenText:
	; GSC-DE Dump 7110
	text "Falls ich gewinne,"
	line "musst du mich mit"
	cont "der Sonnencreme"
	cont "einreiben!"
	done

SwimmerfNikkiBeatenText:
	; GSC-DE Dump 7111
	text "Ich habe Angst vor"
	line "einem Sonnenbrand…"
	done





GenericTrainerSwimmerfChelan:
	generictrainer SWIMMERF, CHELAN, EVENT_BEAT_SWIMMERF_CHELAN, .SeenText, .BeatenText

	text "Ein elektrischer"
	line "Bikini würde dich"
	cont "wohl schockieren!"
	done

.SeenText:
	text "Ich liebe Bikinis!"
	para "Hätte ich einen"
	line "elektrischen"
	cont "Bikini,"
	para "könnte ich ihn"
	line "sogar im Winter"
	cont "tragen!"
	done

.BeatenText:
	text "Achhh…"
	done

GenericTrainerSwimmerfKendra:
	generictrainer SWIMMERF, KENDRA, EVENT_BEAT_SWIMMERF_KENDRA, .SeenText, .BeatenText

	text "Ob irgendwo"
	line "Badeanzüge für"
	cont "#MON verkauft"
	cont "werden?"
	done

.SeenText:
	text "Hey, Trainer! Zieh"
	line "doch auch einen"
	cont "Badeanzug an!"
	done

.BeatenText:

	text "Ich wollte nicht"
	line "verlieren…"
	done

GenericTrainerSwimmermEsteban:
	generictrainer SWIMMERM, ESTEBAN, EVENT_BEAT_SWIMMERM_ESTEBAN, .SeenText, .BeatenText

	text "Wir nannten"
	line "unseren Lehrer"
	cont "Professor"
	cont "Quaputzi!"
	done

.SeenText:
	text "Mein Schwimmlehrer"
	line "hatte ein Gesicht"
	cont "wie ein Quaputzi."
	done

.BeatenText:
	text "Tut mir leid,"
	line "Lehrer…"
	done

GenericTrainerSwimmermDuane:
	generictrainer SWIMMERM, DUANE, EVENT_BEAT_SWIMMERM_DUANE, .SeenText, .BeatenText

	text "Um mehr zu"
	line "gewinnen, muss ich"
	cont "an meiner Ausdauer"
	cont "arbeiten!"
	done

.SeenText:
	text "Schwimmen ist"
	line "Ganzkörpertrainin-"
	cont "g."
	para "Es macht dich"
	line "wirklich stark!"
	done

.BeatenText:
	text "Meine #MON und"
	line "ich haben keine"
	cont "Kraft…"
	done

GenericTrainerSwimmermSeth:
	generictrainer SWIMMERM, SETH, EVENT_BEAT_SWIMMERM_SETH, SwimmermSethSeenText, SwimmermSethBeatenText

	; GSC-DE Dump 7109
	text "Dieser arrogante"
	line "Typ war beim"
	cont "Vulkan auf der"
	cont "ZINNOBERINSEL."
	done
SwimmermSethSeenText:
	; GSC-DE Dump 7107
	text "Mach weiter so!"
	done

SwimmermSethBeatenText:
	; GSC-DE Dump 7108
	text "Gluck…"
	done





GenericTrainerFisherMurphy:
	generictrainer FISHER, MURPHY, EVENT_BEAT_FISHER_MURPHY, .SeenText, .BeatenText

	text "Das #MON, das"
	line "mir entwischte,"
	cont "war riesig."

	para "Das ist die"
	line "Wahrheit!"
	done

.SeenText:
	text "Hä? Ich habe einen"
	line "Trainer statt"
	cont "eines #MON"
	cont "gefangen!"
	done

.BeatenText:
	text "Meine Angelschnur"
	line "wurde durchtrennt!"
	done

GenericTrainerFisherArnold:
	generictrainer FISHER, ARNOLD, EVENT_BEAT_FISHER_ARNOLD, FisherArnoldSeenText, FisherArnoldBeatenText

	; GSC-DE Dump 7115
	text "Ich gehe zurück"
	line "zum Angeln…"
	done
FisherArnoldSeenText:
	; GSC-DE Dump 7113
	text "Angeln langweilt"
	line "mich. Lass uns"
	cont "kämpfen!"
	done

FisherArnoldBeatenText:
	; GSC-DE Dump 7114
	text "Total versagt…"
	done





GenericTrainerFisherLiam:
	generictrainer FISHER, LIAM, EVENT_BEAT_FISHER_LIAM, .SeenText, .BeatenText

	text "Ich hätte dich"
	line "bitten sollen zu"

	para "warten, bis ich"
	line "das #MON"
	cont "eingeholt habe…"
	done

.SeenText:
	text "Wau! Ein Biss!"

	para "…Hä? Ein Kampf?"

	para "O.K., los geht's!"
	done

.BeatenText:
	text "Jagst du zwei"
	line "#MON,"

	para "fängst du keins!"
	done

GenericTrainerFisherGideon:
	generictrainer FISHER, GIDEON, EVENT_BEAT_FISHER_GIDEON, .SeenText, .BeatenText

	text "Warum bist du"
	line "eigentlich"
	cont "#MON-Trainer"
	cont "geworden?"
	done

.SeenText:
	text "Bin ich Angler"
	line "geworden, weil ich"
	cont "geduldig bin,"
	para "oder wurde ich"
	line "geduldiger, weil"
	cont "ich Angler bin?"
	done

.BeatenText:
	text "Hmm… Hmmm…"
	done

GenericTrainerBird_keeperKinsley:
	generictrainer BIRD_KEEPER, KINSLEY, EVENT_BEAT_BIRD_KEEPER_KINSLEY, .SeenText, .BeatenText

	text "Ich muss nur noch"
	line "mehr mit den"
	cont "Flügeln schlagen!"
	done

.SeenText:
	text "Vielleicht kann"
	line "ich irgendwann wie"
	cont "meine"
	cont "Vogel-#MON"
	cont "fliegen!"
	done

.BeatenText:
	text "Ich konnte nicht"
	line "fliegen…"
	done

GenericTrainerBird_keeperEaston:
	generictrainer BIRD_KEEPER, EASTON, EVENT_BEAT_BIRD_KEEPER_EASTON, .SeenText, .BeatenText

	text "Wir glauben, wir"
	line "nutzen #MON."
	para "Aber irgendwann"
	line "haben die #MON"
	cont "angefangen, uns zu"
	cont "nutzen …"
	done

.SeenText:
	text "Vogel-Profis sind"
	line "so toll mit ihren"
	cont "Vogel-#MON!"
	done

.BeatenText:
	text "Ich konnte es"
	line "nicht packen…"
	done
