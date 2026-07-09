BlackthornGym1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, BlackthornGym1FBoulderCallback

	def_warp_events
	warp_event  4, 17, BLACKTHORN_CITY, 1
	warp_event  5, 17, BLACKTHORN_CITY, 1
	warp_event  1,  7, BLACKTHORN_GYM_2F, 1
	warp_event  7,  9, BLACKTHORN_GYM_2F, 2
	warp_event  2,  6, BLACKTHORN_GYM_2F, 3
	warp_event  7,  7, BLACKTHORN_GYM_2F, 4
	warp_event  7,  6, BLACKTHORN_GYM_2F, 5

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, BlackthornGymStatue
	bg_event  6, 15, BGEVENT_READ, BlackthornGymStatue

	def_object_events
	object_event  5,  3, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornGymClairScript, -1
	object_event  7, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornGymGuyScript, -1
	object_event  1, 14, SPRITE_DRAGON_TAMER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerDragonTamerPaul, -1
	object_event  6,  6, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerCooltrainermMike, -1
	object_event  9,  2, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCooltrainerfLola, -1

BlackthornGym1FBoulderCallback:
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_1
	iffalsefwd .skip1
	changeblock 8, 2, $3b
.skip1
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_2
	iffalsefwd .skip2
	changeblock 2, 4, $3a
.skip2
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_3
	iffalsefwd .skip3
	changeblock 8, 6, $3b
.skip3
	endcallback

BlackthornGymStatue:
	gettrainername CLAIR, 1, STRING_BUFFER_4
	checkflag ENGINE_RISINGBADGE
	iftruefwd .Beaten
	jumpstd gymstatue1
.Beaten:
	readvar VAR_BADGES
	ifgreater 15, .LyraToo
	jumpstd gymstatue2
.LyraToo
	jumpstd gymstatue3

BlackthornGymClairScript:
	checkflag ENGINE_RISINGBADGE
	iftrue_jumptextfaceplayer ClairPokemonLeagueDirectionsText
	checkevent EVENT_BEAT_CLAIR
	iftrue_jumptextfaceplayer .TooMuchToExpectText
	showtextfaceplayer .IntroText
	winlosstext .WinText, 0
	loadtrainer CLAIR, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CLAIR
	showtext .GoToDragonsDenText
	setevent EVENT_BEAT_DRAGON_TAMER_PAUL
	setevent EVENT_BEAT_COOLTRAINERM_CODY
	setevent EVENT_BEAT_COOLTRAINERM_MIKE
	setevent EVENT_BEAT_COOLTRAINERF_FRAN
	setevent EVENT_BEAT_COOLTRAINERF_LOLA
	clearevent EVENT_MAHOGANY_MART_OWNERS
	setevent EVENT_BLACKTHORN_CITY_GRAMPS_BLOCKS_DRAGONS_DEN
	clearevent EVENT_BLACKTHORN_CITY_GRAMPS_NOT_BLOCKING_DRAGONS_DEN
	end

.IntroText:
	text "Ich bin Sandra."

	para "Die weltbeste"
	line "Drachenmeisterin."

	para "Ich kann es sogar"
	line "mit der Top Vier"
	cont "der #mon-Liga"

	para "aufnehmen."

	para "Willst du dich"
	line "immer noch mit"
	cont "mir messen?"

	para "…Gut. Dann los!"

	para "Als Arenaleiterin"
	line "setze ich meine"
	cont "volle Kraft gegen"

	para "jeden Gegner ein!"
	done

.WinText:
	text "Ich habe"
	line "verloren?"

	para "Das glaub ich"
	line "nicht. Das muss"
	cont "ein Irrtum sein…"
	done

.GoToDragonsDenText:
	text "Das gebe ich"
	line "nicht zu."

	para "Ich habe"
	line "vielleicht"
	cont "verloren, aber du"

	para "bist noch nicht"
	line "bereit für die"
	cont "#mon-Liga."

	para "Ich weiß. Du"
	line "solltest die"
	cont "Drachenmeister-"

	para "Prüfung wagen."

	para "Hinter dieser"
	line "Arena liegt ein"
	cont "Ort namens"

	para "Drachenhöhle."

	para "In ihrer Mitte"
	line "gibt es einen"
	cont "kleinen Schrein."

	para "Geh dorthin."

	para "Wenn du beweist,"
	line "dass du deine"
	cont "faulen Ideale"

	para "abgelegt hast,"
	line "erkenne ich dich"

	para "als würdigen"
	line "Trainer für einen"

	para "Arenaorden an!"
	done

.TooMuchToExpectText:
	text "Was ist los?"

	para "Ist das zu viel"
	line "von dir verlangt?"
	done

ClairPokemonLeagueDirectionsText:
	text "Was ist los?"

	para "Willst du nicht"
	line "zur #mon-Liga?"

	para "Weißt du, wie man"
	line "dahin kommt?"

	para "Von hier aus geh"
	line "nach Neuborkia."
	cont "Dann surf nach"

	para "Osten."

	para "Der Weg dorthin"
	line "ist sehr hart."

	para "Wag es ja nicht,"
	line "bei der #mon-Liga"
	cont "zu verlieren!"

	para "Sonst fühl ich"
	line "mich noch"
	cont "schlechter, dass"

	para "ich gegen dich"
	line "verloren hab!"

	para "Gib alles, was"
	line "du hast."
	done

BlackthornGymGuyScript:
	checkevent EVENT_BEAT_CLAIR
	iftrue_jumptextfaceplayer .WinText
	jumpthistextfaceplayer

	text "Yo! Zukünftiger"
	line "Champ!"

	para "Es war eine lange"
	line "Reise, aber wir"
	cont "sind fast fertig!"

	para "Verlass dich auf"
	line "mich!"

	para "Sandra nutzt"
	line "mythische,"
	cont "heilige Drachen-"

	para "#mon."

	para "Denen kann man"
	line "nicht leicht"
	cont "schaden."

	para "Aber weißt du,"
	line "sie sollen schwach"
	cont "gegen Eis-"

	para "Attacken sein."
	done

.WinText:
	text "Toll, dass du"
	line "Sandra besiegt"
	cont "hast!"

	para "Übrig bleibt nur"
	line "noch die #mon-"
	cont "Liga."

	para "Du bist auf dem"
	line "Weg, #mon-"
	cont "Champion zu"

	para "werden!"
	done

GenericTrainerDragonTamerPaul:
	generictrainer DRAGON_TAMER, PAUL, EVENT_BEAT_DRAGON_TAMER_PAUL, .SeenText, .BeatenText

	text "Siegfried sagte,"
	line "er würde dich"
	cont "gern wiedersehen?"

	para "Auf keinen Fall!"
	done

.SeenText:
	text "Dein erster Kampf"
	line "gegen Drachen?"

	para "Ich zeig dir, wie"
	line "hart sie sind!"
	done

.BeatenText:
	text "Meine Drachen-"
	line "#mon haben"
	cont "verloren?"
	done

GenericTrainerCooltrainermMike:
	generictrainer COOLTRAINERM, MIKE, EVENT_BEAT_COOLTRAINERM_MIKE, .SeenText, .BeatenText

	text "Jetzt kenne ich"
	line "meine Schwächen."

	para "Danke, dass du"
	line "sie mir gezeigt"
	cont "hast!"
	done

.SeenText:
	text "Meine Chance zu"
	line "verlieren? Nicht"
	cont "mal ein Prozent!"
	done

.BeatenText:
	text "Seltsam."
	done

GenericTrainerCooltrainerfLola:
	generictrainer COOLTRAINERF, LOLA, EVENT_BEAT_COOLTRAINERF_LOLA, .SeenText, .BeatenText

	text "Drachen sind"
	line "schwach gegen"
	cont "Drachen-Attacken."
	done

.SeenText:
	text "Drachen sind"
	line "heilige #mon."

	para "Sie stecken voller"
	line "Lebensenergie."

	para "Wenn du es nicht"
	line "ernst meinst,"
	cont "wirst du sie nicht"

	para "besiegen können."
	done

.BeatenText:
	text "Gut gemacht!"
	done
