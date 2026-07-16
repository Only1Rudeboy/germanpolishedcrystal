Route32Coast_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4, 55, UNION_CAVE_B1F_SOUTH, 4
	warp_event 17, 49, ROUTE_32_COAST_HOUSE, 1
	warp_event  8, 42, HIDDEN_TREE_GROTTO, 1

	def_coord_events

	def_bg_events
	bg_event 15, 27, BGEVENT_JUMPTEXT, Route32CoastTrainerTipsText
	bg_event  5, 57, BGEVENT_JUMPTEXT, Route32CoastUnionCaveSignText
	bg_event 17, 32, BGEVENT_ITEM + LEVEL_BALL, EVENT_ROUTE_32_COAST_HIDDEN_LEVEL_BALL
	bg_event  5, 43, BGEVENT_ITEM + HYPER_POTION, EVENT_ROUTE_32_COAST_HIDDEN_HYPER_POTION
	bg_event 14,  6, BGEVENT_ITEM + ELIXIR, EVENT_ROUTE_32_COAST_HIDDEN_ELIXIR
	bg_event  8, 41, BGEVENT_JUMPSTD, treegrotto, HIDDENGROTTO_ROUTE_32_COAST
	bg_event  9, 41, BGEVENT_JUMPSTD, treegrotto, HIDDENGROTTO_ROUTE_32_COAST

	def_object_events
	object_event  9,  5, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSwimmermMichel, -1
	object_event 18, 65, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_DARK_RED, OBJECTTYPE_TRAINER, 4, TrainerSwimmermLucas, -1
	object_event 20,  6, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSwimmerfAlison, -1
	object_event 23, 15, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSwimmerfStephanie, -1
	object_event 18, 21, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_DARK_BLUE, OBJECTTYPE_TRAINER, 5, TrainerBird_keeperPowell, -1
	object_event 14, 60, SPRITE_COSPLAYER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCosplayerChloe, -1
	object_event 24, 60, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFisherKiley, -1
	object_event  6, 20, SPRITE_CAMPER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerCamperCraig, -1
	object_event 11, 43, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerLassLayla, -1
	object_event 25, 33, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCoupleFoxandrae1, -1
	object_event 25, 34, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCoupleFoxandrae2, -1
	object_event  6, 59, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route32CoastLassText, -1
	fruittree_event 21, 49, FRUITTREE_ROUTE_32_COAST, ASPEAR_BERRY, PAL_NPC_BROWN
	itemball_event  5, 16, WHITE_HERB, 1, EVENT_ROUTE_32_COAST_WHITE_HERB
	object_event 21, 61, SPRITE_FLOATING_BALL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, 0, OBJECTTYPE_ITEMBALL, PLAYEREVENT_ITEMBALL, SOFT_SAND, 1, EVENT_ROUTE_32_COAST_SOFT_SAND

GenericTrainerSwimmermMichel:
	generictrainer SWIMMERM, MICHEL, EVENT_BEAT_SWIMMERM_MICHEL, .SeenText, .BeatenText

	text "Lektion gelernt!"
	line "Immer erst"
	cont "aufwärmen!"
	done

.SeenText:
	text "Ich habe auf dich"
	line "gewartet!"

	para "Lass uns kämpfen!"
	line "Jetzt!"
	done

.BeatenText:
	text "Ach, au! Ich habe"
	line "einen Krampf!"
	done

TrainerSwimmermLucas:
	trainer SWIMMERM, LUCAS, EVENT_BEAT_SWIMMERM_LUCAS, .SeenText, .BeatenText, 0, .Script, TRAINERPAL_DARK_SWIMMERM

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "Regenbögen durch"
	line "Sonnenlicht"
	cont "erscheinen"
	para "der Sonne"
	line "gegenüber am"
	cont "Himmel."
	para "Interessant, oder?"
	done

.SeenText:
	text "Licht reflektiert"
	line "und bricht in"

	para "Wassertropfen und"
	line "erzeugt einen"
	cont "Regenbogen."
	done

.BeatenText:
	text "Dieser Kampf war"
	line "bunt!"
	done

GenericTrainerSwimmerfAlison:
	generictrainer SWIMMERF, ALISON, EVENT_BEAT_SWIMMERF_ALISON, .SeenText, .BeatenText

	text "Ein… Aus…"

	para "Ist das nicht"
	line "erfrischend?"
	done

.SeenText:
	text "Vor dem Kampf"
	line "musst du tief"
	cont "durchatmen."
	done

.BeatenText:
	text "Glub… Ich hab"
	line "Salzwasser"
	cont "geschluckt…"
	done

GenericTrainerSwimmerfStephanie:
	generictrainer SWIMMERF, STEPHANIE, EVENT_BEAT_SWIMMERF_STEPHANIE, .SeenText, .BeatenText

	text "Schall ist im"
	line "Wasser schneller"
	cont "als in Luft."

	para "Cool, oder?"
	done

.SeenText:
	text "Hast du das"
	line "gehört?"
	done

.BeatenText:
	text "Boo!"
	done

TrainerBird_keeperPowell:
	trainer BIRD_KEEPER, POWELL, EVENT_BEAT_BIRD_KEEPER_POWELL, .SeenText, .BeatenText, 0, .Script, TRAINERPAL_DARK_BIRD_KEEPER

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "Meine #MON"
	line "können Fliegen,"
	cont "auch ohnmächtig,"

	para "damit ich nach"
	line "Hause komm."

	para "Praktisch, oder?"
	done

.SeenText:
	text "Ich kann nicht"
	line "schwimmen, also"
	cont "flog ich her."
	done

.BeatenText:
	text "Ach nein! Meine"
	line "#MON!"
	done

GenericTrainerCosplayerChloe:
	generictrainer COSPLAYER, CHLOE, EVENT_BEAT_COSPLAYER_CHLOE, .SeenText, .BeatenText

	text "In diesem Outfit"
	line "sagen alle, ich"
	para "bin überall die"
	line "Süßeste!"
	done

.SeenText:
	text "Gefällt dir mein"
	line "Kostüm? Es ist"
	cont "super effektiv!"
	done

.BeatenText:
	text "Das war wohl nicht"
	line "sehr effektiv …"
	done

GenericTrainerFisherKiley:
	generictrainer FISHER, KILEY, EVENT_BEAT_FISHER_KILEY, .SeenText, .BeatenText

	text "Du brauchst eine"
	line "gute Angel, wenn"

	para "du gute #MON"
	line "fangen willst."
	done

.SeenText:
	text "Heh, heute läuft"
	line "es gut. Wie wär's"
	cont "mit einem Kampf?"
	done

.BeatenText:
	text "Uff. Diesmal hatte"
	line "ich kein Glück."
	done

GenericTrainerCamperCraig:
	generictrainer CAMPER, CRAIG, EVENT_BEAT_CAMPER_CRAIG, .SeenText, .BeatenText

	text "Abenteuer wartet"
	line "außerhalb des"
	cont "Zelts!"
	para "Also raus und viel"
	line "Spaß haben!"
	done

.SeenText:
	text "Nichts schlägt die"
	line "Natur!"
	done

.BeatenText:
	text "Ich bin ein"
	line "glücklicher"
	cont "Camper."
	done

GenericTrainerLassLayla:
	generictrainer LASS, LAYLA, EVENT_BEAT_LASS_LAYLA, .SeenText, .BeatenText

	text "Wenn du einen"
	line "Wunsch sagst, geht"
	cont "er nicht in"
	cont "Erfüllung!"
	done

.SeenText:
	text "Wenn du einen"
	line "Wunsch hättest,"
	cont "welcher wär's?"
	done

.BeatenText:
	text "Sag mir deinen"
	line "Wunsch aber nicht!"
	done

GenericTrainerCoupleFoxandrae1:
	generictrainer COUPLE, FOXANDRAE1, EVENT_BEAT_COUPLE_FOX_AND_RAE, .SeenText, .BeatenText

	text "Fox: Unser"
	line "Teamwork als Paar"
	cont "reichte diesmal"
	cont "nicht."
	done

.SeenText:
	text "Fox: Komm schon,"
	line "Rae, lass uns"
	cont "kämpfen!"
	done

.BeatenText:
	text "Fox: Du hast Rae"
	line "und mich…"
	done

GenericTrainerCoupleFoxandrae2:
	generictrainer COUPLE, FOXANDRAE2, EVENT_BEAT_COUPLE_FOX_AND_RAE, .SeenText, .BeatenText

	text "Rae: Wir haben"
	line "verloren, aber wir"
	cont "sind noch ein"
	cont "glückliches Paar."
	done

.SeenText:
	text "Rae: Hey Fox, wie"
	line "wär's mit einem"
	cont "Kampf?"
	done

.BeatenText:
	text "Rae: Wie konntest"
	line "du Fox und mich"
	cont "schlagen?"
	done

Route32CoastLassText:
	text "Hechel, keuch…"
	para "Endlich habe ich"
	line "es durch diese"
	cont "Höhle geschafft!"
	para "Sie war größer,"
	line "als ich annahm."
	para "Ich war zu"
	line "erschöpft, um"
	cont "alles"
	para "zu erkunden, also"
	line "habe ich sie"
	para "verlassen."
	done
Route32CoastTrainerTipsText:
	text "Trainer-Tipps"

	para "Ein #MON mit"
	line "Aufheber kann"

	para "nach einem Kampf"
	line "ein Item halten!"
	done

Route32CoastUnionCaveSignText:
	text "EINHEITSTUNNEL"
	line "Geradeaus"
	done
