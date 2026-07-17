MahoganyGym_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4, 17, MAHOGANY_TOWN, 3
	warp_event  5, 17, MAHOGANY_TOWN, 3

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, MahoganyGymStatue
	bg_event  6, 15, BGEVENT_READ, MahoganyGymStatue

	def_object_events
	object_event  5,  3, SPRITE_PRYCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyGymPryceScript, -1
	object_event  4,  6, SPRITE_SKIER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSkierRoxanne, -1
	object_event  0, 17, SPRITE_BOARDER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBoarderRonald, -1
	object_event  9, 17, SPRITE_SKIER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSkierClarissa, -1
	object_event  5,  9, SPRITE_BOARDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBoarderBrad, -1
	object_event  2,  4, SPRITE_BOARDER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBoarderDouglas, -1
	object_event  7, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MahoganyGymGuyScript, -1

MahoganyGymPryceScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_PRYCE
	iftruefwd .FightDone
	writetext PryceText_Intro
	waitbutton
	closetext
	winlosstext PryceText_Impressed, 0
	loadtrainer PRYCE, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_PRYCE
	opentext
	givebadge GLACIERBADGE, JOHTO_REGION
	; Begin Team Rocket takeover of Radio Tower
	setflag ENGINE_ROCKETS_IN_RADIO_TOWER
	setevent EVENT_GOLDENROD_CITY_CIVILIANS
	setevent EVENT_RADIO_TOWER_BLACKBELT_BLOCKS_STAIRS
	clearevent EVENT_GOLDENROD_CITY_ROCKET_SCOUT
	clearevent EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	clearevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	specialphonecall SPECIALCALL_WEIRDBROADCAST
	setevent EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_EAST
	setmapscene MAHOGANY_TOWN, SCENE_MAHOGANYTOWN_NOOP
.FightDone:
	checkevent EVENT_GOT_TM67_AVALANCHE
	iftrue_jumpopenedtext PryceText_CherishYourPokemon
	setevent EVENT_BEAT_SKIER_ROXANNE
	setevent EVENT_BEAT_SKIER_CLARISSA
	setevent EVENT_BEAT_BOARDER_RONALD
	setevent EVENT_BEAT_BOARDER_BRAD
	setevent EVENT_BEAT_BOARDER_DOUGLAS
	writetext PryceText_GlacierBadgeSpeech
	promptbutton
	verbosegivetmhm TM_AVALANCHE
	setevent EVENT_GOT_TM67_AVALANCHE
	; PC: Avalanche → Lawine (offiziell DE)
	jumpthisopenedtext

	text "Diese TM enthält"
	line "Lawine."
	para "Sie richtet mehr"
	line "Schaden an, wenn"
	para "der Anwender"
	line "zuerst getroffen"
	cont "wurde."
	para "Sie stellt die"
	line "Härte des Winters"
	cont "dar."
	done

GenericTrainerSkierRoxanne:
	generictrainer SKIER, ROXANNE, EVENT_BEAT_SKIER_ROXANNE, SkierRoxanneSeenText, SkierRoxanneBeatenText

	; GSC-DE Dump
	text "Wenn du nicht ge-"
	line "nau rutschst,"
	para "kommst du in die-"
	line "ser PKMN-ARENA"
	cont "nicht weit."
	done

GenericTrainerSkierClarissa:
	generictrainer SKIER, CLARISSA, EVENT_BEAT_SKIER_CLARISSA, SkierClarissaSeenText, SkierClarissaBeatenText

	; GSC-DE Dump
	text "Ich hätte mit mei-"
	line "nen Ski-Künsten"
	cont "nicht so angeben"
	cont "sollen…"
	done

GenericTrainerBoarderRonald:
	generictrainer BOARDER, RONALD, EVENT_BEAT_BOARDER_RONALD, BoarderRonaldSeenText, BoarderRonaldBeatenText

	; GSC-DE Dump
	text "Ich glaube, es"
	line "gibt eine Attacke,"
	para "die #MON"
	line "auch ausführen"
	para "können, wenn sie"
	line "gefroren sind."
	done

GenericTrainerBoarderBrad:
	generictrainer BOARDER, BRAD, EVENT_BEAT_BOARDER_BRAD, BoarderBradSeenText, BoarderBradBeatenText

	; GSC-DE Dump
	text "Diese PKMN-ARENA"
	line "ist toll. Ich"
	cont "liebe es, mit mei-"
	cont "nen #MON hier"
	cont "zu snowboarden!"
	done

GenericTrainerBoarderDouglas:
	generictrainer BOARDER, DOUGLAS, EVENT_BEAT_BOARDER_DOUGLAS, BoarderDouglasSeenText, BoarderDouglasBeatenText

	; GSC-DE Dump
	text "Das Geheimnis von"
	line "NORBERTs Kraft…"
	para "Er meditiert täg-"
	line "lich unter einem"
	para "Wasserfall, um"
	line "Geist und Körper"
	cont "zu stärken."
	done

MahoganyGymGuyScript:
	checkevent EVENT_BEAT_PRYCE
	iftrue_jumptextfaceplayer MahoganyGymGuyWinText
	; GSC-DE Dump
	jumpthistextfaceplayer

	text "NORBERT ist ein"
	line "Veteran, der seine"
	para "#MON schon"
	line "seit fast 50 Jah-"
	cont "ren trainiert."
	para "Angeblich friert"
	line "er seine Gegner"
	para "gerne mit Eis-"
	line "Attacken ein."
	para "Das heißt, du"
	line "solltest ihn mit"
	para "deinem brennenden"
	line "Ehrgeiz schmelzen!"
	done

MahoganyGymStatue:
	gettrainername PRYCE, 1, STRING_BUFFER_4
	checkflag ENGINE_GLACIERBADGE
	iftruefwd .Beaten
	jumpstd gymstatue1
.Beaten:
	readvar VAR_BADGES
	ifgreater 14, .LyraToo
	jumpstd gymstatue2
.LyraToo
	jumpstd gymstatue3

PryceText_Intro:
	; GSC-DE Dump
	text "#MON machen in"
	line "ihrem Leben viele"
	para "Erfahrungen. Genau"
	line "wie Menschen."
	para "Auch ich habe in"
	line "meinem Leben viel"
	cont "gesehen und er-"
	cont "litten."
	para "Da ich der Ältere"
	line "bin, lass mich dir"
	cont "zeigen, was ich"
	cont "meine."
	para "Ich war schon mit"
	line "#MON zusammen,"
	para "bevor du geboren"
	line "wurdest."
	para "Ich verliere nicht"
	line "gerne."
	para "Ich, NORBERT, der"
	line "Wintertrainer,"
	para "werde meine Macht"
	line "demonstrieren!"
	done

PryceText_Impressed:
	; GSC-DE Dump
	text "Ich bin von deinem"
	line "Können beein-"
	cont "druckt."
	para "Mit deinem starken"
	line "Willen, wirst du"
	para "alle Widrigkeiten"
	line "in deinem Leben"
	cont "überstehen."
	para "Du bist dieses"
	line "ORDENS würdig!"
	done

PryceText_GlacierBadgeSpeech:
	; GSC-DE Dump: EISORDEN (engine GLACIERBADGE, badge_names unberührt)
	text "Dieser ORDEN hebt"
	line "den SPEZ-Wert dei-"
	cont "ner #MON."
	para "Außerdem können"
	line "deine #MON"
	cont "WHIRLPOOL einset-"
	cont "zen, um echte"
	cont "Strudel zu"
	cont "überwinden."
	para "Und dies… dies ist"
	line "ein Geschenk von"
	cont "mir!"
	done

PryceText_CherishYourPokemon:
	; GSC-DE Dump
	text "Wenn Eis und"
	line "Schnee geschmolzen"
	cont "sind, kehrt der"
	cont "Frühling wieder."
	para "Du und deine"
	line "#MON werden"
	para "noch viele Jahre"
	line "zusammen sein."
	para "Genießt eure ge-"
	line "meinsame Zeit!"
	done

BoarderRonaldSeenText:
	; GSC-DE Dump
	text "Ich werde deine"
	line "#MON einfrie-"
	cont "ren, so dass sie"
	cont "sich nicht bewegen"
	cont "können."
	done

BoarderRonaldBeatenText:
	; GSC-DE Dump
	text "Mist! Ich konnte"
	line "nichts tun."
	done

BoarderBradSeenText:
	; GSC-DE Dump
	text "Diese PKMN-ARENA"
	line "hat einen rutschi-"
	cont "gen Boden. Das ist"
	cont "doch lustig, oder?"
	para "Aber wir sind"
	line "nicht hier, um zu"
	cont "spielen!"
	done

BoarderBradBeatenText:
	; GSC-DE Dump
	text "Siehst du jetzt,"
	line "wie ernst wir es"
	cont "meinen?"
	done

BoarderDouglasSeenText:
	; GSC-DE Dump
	text "Ich kenne NORBERTs"
	line "Geheimnis."
	done

BoarderDouglasBeatenText:
	; GSC-DE Dump
	text "O.K. Ich verrate"
	line "dir NORBERTs Ge-"
	cont "heimnis."
	done

SkierRoxanneSeenText:
	; GSC-DE Dump
	text "Um zu NORBERT, un-"
	line "serem ARENALEITER,"
	para "zu gelangen, musst"
	line "du denken, bevor"
	cont "du loslegst."
	done

SkierRoxanneBeatenText:
	; GSC-DE Dump
	text "Beim Skifahren"
	line "würde ich nie ge-"
	cont "gen dich verlie-"
	cont "ren."
	done

SkierClarissaSeenText:
	; GSC-DE Dump
	text "Sieh dir meinen"
	line "Parallelschwung"
	cont "an!"
	done

SkierClarissaBeatenText:
	; GSC-DE Dump
	text "Nein! Jetzt bin"
	line "ich weggerutscht!"
	done

MahoganyGymGuyWinText:
	; GSC-DE Dump
	text "NORBERT ist nicht"
	line "übel, aber du"
	cont "bist noch besser!"
	para "Das war ein heißer"
	line "Kampf, der die"
	para "Kluft zwischen den"
	line "Generationen über-"
	cont "wunden hat."
	done
