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
	text "Ich bin SANDRA."
	para "Die weltbeste"
	line "Drachen-Trainerin!"
	para "Ich kann mich als"
	line "ARENALEITERIN von"
	cont "EBENHOLZ CITY"
	cont "sehen lassen."
	para "…Soll ich dir"
	line "etwas erzählen?"
	para "Drachen-#mon"
	line "sind heilig. Sie"
	cont "sind schwer zu"
	cont "fangen und zu"
	cont "erziehen."
	para "Bist du sicher,"
	line "dass du bereit"
	cont "bist?"
	para "Nun gut. Ich zeige"
	line "dir die Kraft der"
	cont "Drachen!"
	done
.WinText:
	text "Ich habe verloren?"
	para "Das… das darf"
	line "nicht sein. Das"
	cont "muss ein Irrtum"
	cont "sein…"
	done
.GoToDragonsDenText:
	text "Das gebe ich nicht"
	line "zu."
	para "Ich habe"
	line "vielleicht"
	cont "verloren, aber du"
	cont "bist noch nicht"
	cont "bereit für die"
	cont "#mon-Liga."
	para "Ich weiß: Du"
	line "solltest die"
	cont "Drachenmeister-"
	cont "Prüfung wagen."
	para "Hinter dieser"
	line "Arena liegt die"
	cont "DRACHENHÖHLE."
	para "In ihrer Mitte"
	line "steht ein kleiner"
	cont "Schrein."
	para "Geh dorthin."
	para "Wenn du beweist,"
	line "dass du deine"
	cont "faulen Ideale"
	cont "abgelegt hast,"
	cont "erkenne ich dich"
	cont "als würdigen"
	cont "Trainer für einen"
	cont "Arenaorden an!"
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
	line "nach NEUBORKIA."
	cont "Dann surf nach"
	cont "Osten."
	para "Der Weg dorthin"
	line "ist sehr hart."
	para "Wag es ja nicht,"
	line "bei der"
	cont "#mon-Liga zu"
	cont "verlieren!"
	para "Sonst fühle ich"
	line "mich noch"
	cont "schlechter, dass"
	cont "ich gegen dich"
	cont "verloren habe!"
	para "Gib alles, was du"
	line "hast."
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
	para "SANDRA nutzt"
	line "mythische, heilige"
	cont "Drachen-#mon."
	para "Denen kann man"
	line "nicht leicht"
	cont "schaden."
	para "Aber weißt du -sie"
	line "sollen schwach"
	cont "gegen Eis-Attacken"
	cont "sein."
	done

.WinText:
	text "Toll, dass du"
	line "SANDRA besiegt"
	cont "hast!"
	para "Übrig bleibt nur"
	line "noch die"
	cont "#mon-Liga."
	para "Du bist auf dem"
	line "Weg,"
	cont "#mon-Champion"
	cont "zu werden!"
	done

GenericTrainerDragonTamerPaul:
	generictrainer DRAGON_TAMER, PAUL, EVENT_BEAT_DRAGON_TAMER_PAUL, .SeenText, .BeatenText

	text "SIEGFRIED sagte,"
	line "er würde dich gern"
	cont "wiedersehen?"
	para "Auf keinen Fall!"
	done

.SeenText:
	text "Dein erster Kampf"
	line "gegen Drachen?"

	para "Ich zeig dir, wie"
	line "hart sie sind!"
	done

.BeatenText:
	text "Meine"
	line "Drachen-#mon"
	cont "haben verloren?"
	done

GenericTrainerCooltrainermMike:
	generictrainer COOLTRAINERM, MIKE, EVENT_BEAT_COOLTRAINERM_MIKE, .SeenText, .BeatenText

	text "Ich kenne jetzt"
	line "meine"
	cont "Schwachstel-len."
	cont "Danke für den"
	cont "Hinweis!"
	done


.SeenText:
	text "Die Chancen, gegen"
	line "dich zu verlieren?"
	cont "Nicht mal ein"
	cont "Prozent!"
	done


.BeatenText:
	text "Hm, eigenartig."
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
	para "Sie sind voller"
	line "Lebensenergie."
	para "Wenn du es nicht"
	line "ernst meinst, dann"
	para "wirst du sie nicht"
	line "besiegen können."
	done


.BeatenText:
	text "Großartig!"
	done

