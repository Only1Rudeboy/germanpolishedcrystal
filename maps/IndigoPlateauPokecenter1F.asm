IndigoPlateauPokecenter1F_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_INDIGOPLATEAUPOKECENTER1F_RIVAL_BATTLE

	def_callbacks
	callback MAPCALLBACK_NEWMAP, PrepareEliteFourCallback

	def_warp_events
	warp_event  9, 13, INDIGO_PLATEAU, 1
	warp_event 10, 13, INDIGO_PLATEAU, 2
	warp_event  0, 13, POKECENTER_2F, 1
	warp_event 12,  3, WILLS_ROOM, 1

	def_coord_events
	coord_event 14,  4, SCENE_INDIGOPLATEAUPOKECENTER1F_RIVAL_BATTLE, PlateauRivalBattleTrigger1
	coord_event 15,  4, SCENE_INDIGOPLATEAUPOKECENTER1F_RIVAL_BATTLE, PlateauRivalBattleTrigger2

	def_bg_events
	bg_event 13,  7, BGEVENT_READ, PokemonJournalGiovanniScript

	def_object_events
	object_event 14,  9, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_INDIGO_PLATEAU_POKECENTER_RIVAL
	object_event 14,  9, SPRITE_LYRA, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_INDIGO_PLATEAU_POKECENTER_LYRA
	object_event 10,  9, SPRITE_YELLOW, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, IndigoPlateauYellowScript, EVENT_INDIGO_PLATEAU_POKECENTER_YELLOW
	pc_nurse_event  9, 7
	mart_clerk_event  1,  9, MARTTYPE_STANDARD, MART_INDIGO_PLATEAU
	object_event  6,  9, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, IndigoPlateauTeleportGuyScript, EVENT_TELEPORT_GUY
	pokemon_event  5,  9, ABRA, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BROWN, IndigoPlateauAbraText, EVENT_TELEPORT_GUY
	object_event  5, 12, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, IndigoPlateauCooltrainermText, -1

	object_const_def
	const INDIGOPLATEAUPOKECENTER1F_RIVAL
	const INDIGOPLATEAUPOKECENTER1F_LYRA
	const INDIGOPLATEAUPOKECENTER1F_YELLOW

PrepareEliteFourCallback:
	setmapscene WILLS_ROOM, SCENE_WILLSROOM_LOCK_DOOR
	setmapscene KOGAS_ROOM, SCENE_KOGASROOM_LOCK_DOOR
	setmapscene BRUNOS_ROOM, SCENE_BRUNOSROOM_LOCK_DOOR
	setmapscene KARENS_ROOM, SCENE_KARENSROOM_LOCK_DOOR
	setmapscene LANCES_ROOM, SCENE_LANCESROOM_LOCK_DOOR
	setmapscene HALL_OF_FAME, SCENE_HALLOFFAME_ENTER
	clearevent EVENT_WILLS_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_WILLS_ROOM_EXIT_OPEN
	clearevent EVENT_KOGAS_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_KOGAS_ROOM_EXIT_OPEN
	clearevent EVENT_BRUNOS_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_BRUNOS_ROOM_EXIT_OPEN
	clearevent EVENT_KARENS_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_KARENS_ROOM_EXIT_OPEN
	clearevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_LANCES_ROOM_EXIT_OPEN
	clearevent EVENT_BEAT_ELITE_4_WILL
	clearevent EVENT_BEAT_ELITE_4_KOGA
	clearevent EVENT_BEAT_ELITE_4_BRUNO
	clearevent EVENT_BEAT_ELITE_4_KAREN
	clearevent EVENT_BEAT_CHAMPION_LANCE
	setevent EVENT_LANCES_ROOM_OAK_AND_MARY
	endcallback

PlateauRivalBattleTrigger1:
	moveobject INDIGOPLATEAUPOKECENTER1F_RIVAL, 15, 9
	moveobject INDIGOPLATEAUPOKECENTER1F_LYRA, 15, 9
PlateauRivalBattleTrigger2:
	checkevent EVENT_FINAL_BATTLE_WITH_LYRA
	iftruefwd .LyraFight
	readvar VAR_WEEKDAY
	ifequalfwd MONDAY, .MaybeRivalFight
	ifequalfwd TUESDAY, .MaybeLyraFight
	ifequalfwd WEDNESDAY, .MaybeRivalFight
	ifequalfwd THURSDAY, .MaybeLyraFight
	ifequalfwd FRIDAY, .MaybeRivalFight
	ifequalfwd SATURDAY, .MaybeLyraFight
	end

.MaybeRivalFight:
	checkevent EVENT_BEAT_RIVAL_IN_MT_MOON
	iffalse DoNothingScript
	checkflag ENGINE_INDIGO_PLATEAU_RIVAL_FIGHT
	iftrue DoNothingScript
	turnobject PLAYER, DOWN
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	pause 15
	appear INDIGOPLATEAUPOKECENTER1F_RIVAL
	applymovement INDIGOPLATEAUPOKECENTER1F_RIVAL, PlateauRivalApproachesMovement
	playmusic MUSIC_RIVAL_ENCOUNTER
	faceobject INDIGOPLATEAUPOKECENTER1F_RIVAL, PLAYER
	faceobject PLAYER, INDIGOPLATEAUPOKECENTER1F_RIVAL
	showtext PlateauRivalText1
	setevent EVENT_INDIGO_PLATEAU_POKECENTER_RIVAL
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftruefwd .RivalTotodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftruefwd .RivalChikorita
	; Cyndaquil
	winlosstext PlateauRivalWinText, PlateauRivalLoseText
	setlasttalked INDIGOPLATEAUPOKECENTER1F_RIVAL
	loadtrainer RIVAL2, 6
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjumpfwd .RivalPostBattle

.RivalTotodile:
	winlosstext PlateauRivalWinText, PlateauRivalLoseText
	setlasttalked INDIGOPLATEAUPOKECENTER1F_RIVAL
	loadtrainer RIVAL2, 4
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjumpfwd .RivalPostBattle

.RivalChikorita:
	winlosstext PlateauRivalWinText, PlateauRivalLoseText
	setlasttalked INDIGOPLATEAUPOKECENTER1F_RIVAL
	loadtrainer RIVAL2, 5
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
.RivalPostBattle:
	special DeleteSavedMusic
	playmusic MUSIC_RIVAL_AFTER
	showtext PlateauRivalText2
	turnobject PLAYER, DOWN
	applymovement INDIGOPLATEAUPOKECENTER1F_RIVAL, PlateauRivalLeavesMovement
	disappear INDIGOPLATEAUPOKECENTER1F_RIVAL
	setscene SCENE_INDIGOPLATEAUPOKECENTER1F_RIVAL_BATTLE
	playmapmusic
	setflag ENGINE_INDIGO_PLATEAU_RIVAL_FIGHT
	end

.MaybeLyraFight:
	checkevent EVENT_BEAT_ELITE_FOUR_AGAIN
	iffalse DoNothingScript
	checkflag ENGINE_INDIGO_PLATEAU_LYRA_FIGHT
	iftrue DoNothingScript
.LyraFight:
	turnobject PLAYER, DOWN
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	pause 15
	appear INDIGOPLATEAUPOKECENTER1F_LYRA
	applymovement INDIGOPLATEAUPOKECENTER1F_LYRA, PlateauRivalApproachesMovement
	faceobject INDIGOPLATEAUPOKECENTER1F_LYRA, PLAYER
	faceobject PLAYER, INDIGOPLATEAUPOKECENTER1F_LYRA
	opentext
	writetext PlateauLyraText1
	waitbutton
	playmusic MUSIC_WALLY_BATTLE_ORAS
	writetext PlateauLyraText2
	waitbutton
	closetext
	setevent EVENT_INDIGO_PLATEAU_POKECENTER_LYRA
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftruefwd .LyraTotodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftruefwd .LyraChikorita
	; Cyndaquil
	winlosstext PlateauLyraWinText, PlateauLyraLoseText
	setlasttalked INDIGOPLATEAUPOKECENTER1F_LYRA
	loadtrainer LYRA2, 1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjumpfwd .LyraPostBattle

.LyraTotodile:
	winlosstext PlateauRivalWinText, PlateauRivalLoseText
	setlasttalked INDIGOPLATEAUPOKECENTER1F_LYRA
	loadtrainer LYRA2, 2
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjumpfwd .LyraPostBattle

.LyraChikorita:
	winlosstext PlateauRivalWinText, PlateauRivalLoseText
	setlasttalked INDIGOPLATEAUPOKECENTER1F_LYRA
	loadtrainer LYRA2, 3
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
.LyraPostBattle:
	special DeleteSavedMusic
	playmusic MUSIC_LYRA_DEPARTURE_HGSS
	showtext PlateauLyraText3
	turnobject PLAYER, DOWN
	applymovement INDIGOPLATEAUPOKECENTER1F_LYRA, PlateauRivalLeavesMovement
	disappear INDIGOPLATEAUPOKECENTER1F_LYRA
	setscene SCENE_INDIGOPLATEAUPOKECENTER1F_RIVAL_BATTLE
	playmapmusic
	setflag ENGINE_INDIGO_PLATEAU_LYRA_FIGHT
	clearevent EVENT_FINAL_BATTLE_WITH_LYRA
	end

PlateauRivalText1:
	text "Moment noch!"

	para "Akzeptierst du"
	line "die"
	line "Herausforderung"

	para "der #mon LIGA?"
	line "Das wird nicht"
	cont "passieren."

	para "Meine perfekt"
	line "trainierten #-"
	cont "MON werden dich"
	cont "zermalmen."

	para "<PLAYER>!"

	para "Ich fordere dich"
	line "heraus!"
	done







PlateauRivalWinText:
	text "…"
	line "O.K. - Ich habe"

	para "verloren…"
	done







PlateauRivalText2:
	text "…Mist… Ich"
	line "kann nicht"
	cont "gewinnen…"

	para "Ich… ich muss"
	line "mich"
	line "mehr um meine"
	cont "#mon kümmern…"

	para "Versuche, nicht"
	line "zu verlieren!"
	done







PlateauRivalLoseText:
	text "…"

	para "Wow…"
	line "Mit meinen"

	para "Partnern werde"
	line "ich der CHAMP"
	cont "sein!"
	done







PlateauLyraText1:
	text "<PLAYER>!"

	para "Ich bin durch"
	line "Johto gereist,"

	para "habe Orden"
	line "gesammelt und"

	para "mich immer"
	line "weiter"
	cont "verbessert."

	para "Das kennst du"
	line "doch auch,"
	cont "<PLAYER>."

	para "Und jetzt…"

	para "bin ich hier am"
	line "Indigo-Plateau."

	para "Weißt du, was"
	line "das bedeutet?"

	para "Ich darf dich"
	line "fordern, nicht"
	cont "nur"
	cont "als Freundin,"
	done

PlateauLyraText2:
	text "sondern als"
	line "#mon-Liga-"
	cont "Championin!"
	done

PlateauLyraWinText:
	text "Du bist immer"
	line "noch stärker als"
	cont "ich…"
	done

PlateauLyraLoseText:
	text "…Ich habe"
	line "gewonnen?"
	done

PlateauLyraText3:
	text "Ich bin nicht"
	line "sauer,"
	line "dass ich verloren"
	cont "habe."

	para "Ich konnte Johto"
	line "erkunden, neue"
	cont "Leute"
	cont "treffen, meine"

	para "#mon stärker"
	line "machen, als ich"

	para "gedacht hätte,"
	line "sie"
	line "werden könnten…"

	para "Und ich konnte"
	line "gegen dich"

	para "kämpfen und"
	line "alles geben."

	para "Du hast mich"
	line "besiegt."

	para "Besieg jetzt die"
	line "#mon Liga!"
	done

PlateauRivalApproachesMovement:
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end

PlateauRivalLeavesMovement:
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end

PokemonJournalGiovanniScript:
	setflag ENGINE_READ_GIOVANNI_JOURNAL
	jumpthistext

	text "#mon Journal"

	para "Spezial:"
	line "Boss Giovanni!"

	para "Bei der"
	line "Durchsuchung"
	cont "der verlassenen"
	cont "#mon-ARENA in"
	cont "VERTANIA CITY"

	para "stellte sich"
	line "heraus, dass"
	cont "Giovanni,"

	para "der Arenaleiter,"
	line "auch der Boss"
	cont "von TEAM ROCKET"
	cont "war."
	done

IndigoPlateauYellowScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_YELLOW_INTRO
	iftruefwd .HeardIntro
	writetext .GreetingText
	waitbutton
	setevent EVENT_LISTENED_TO_YELLOW_INTRO
.HeardIntro
	writetext .QuestionText
	yesorno
	iffalse_jumpopenedtext .RefusedText
	writetext .GiveStarterText
	promptbutton
	waitsfx
	checkevent EVENT_GOT_BULBASAUR_FROM_IVY
	iftruefwd .Squirtle
	checkevent EVENT_GOT_CHARMANDER_FROM_IVY
	iftruefwd .Bulbasaur
	givepoke CHARMANDER, PLAIN_FORM, 10, SITRUS_BERRY
	iffalse_jumpopenedtext .PartyAndBoxFullText
	getmonname CHARMANDER, STRING_BUFFER_3
	sjumpfwd .Finish

.Bulbasaur:
	givepoke BULBASAUR, PLAIN_FORM, 10, SITRUS_BERRY
	iffalse_jumpopenedtext .PartyAndBoxFullText
	getmonname BULBASAUR, STRING_BUFFER_3
	sjumpfwd .Finish

.Squirtle:
	givepoke SQUIRTLE, PLAIN_FORM, 10, SITRUS_BERRY
	iffalse_jumpopenedtext .PartyAndBoxFullText
	getmonname SQUIRTLE, STRING_BUFFER_3
.Finish:
	writetext .GoodbyeText
	waitbutton
	closetext
	readvar VAR_FACING
	turnobject PLAYER, DOWN
	ifnotequal UP, .noleftstep
	applyonemovement INDIGOPLATEAUPOKECENTER1F_YELLOW, step_left
.noleftstep
	applymovement INDIGOPLATEAUPOKECENTER1F_YELLOW, .DownMovement
	playsound SFX_EXIT_BUILDING
	disappear INDIGOPLATEAUPOKECENTER1F_YELLOW
	setevent EVENT_GOT_A_POKEMON_FROM_YELLOW
	waitsfx
	end

.PartyAndBoxFullText:
	text "Yellow: Ach…"
	line "Du kannst kein"

	para "weiteres #mon"
	line "bei dir tragen…"

	para "Und deine Box"
	line "ist auch voll…"
	done

.GreetingText:
	text "Yellow: Hallo,"
	line "<PLAYER>!"

	para "Ich hab mir den"
	line "Kampf der"
	line "TOP VIER"
	cont "angesehen."

	para "Sie sind so"
	line "intens…"
	line "Und sie haben"
	cont "so starke"

	para "Bindungen zu"
	line "ihren #mon…"

	para "Eines Tages"
	line "erreiche ich"
	cont "ihr Niveau."
	done

.QuestionText:
	text "Yellow: <PLAYER>,"
	line "kannst du mir"
	cont "einen Gefallen"
	cont "tun?"

	para "Ich hab ein"
	line "#mon, das ich"
	cont "nicht selbst"
	cont "aufziehen kann,"
	cont "und ich will"

	para "es nicht im"
	line "PC lassen."

	para "Nimmst du es,"
	line "bitte?"
	done

.GiveStarterText:
	text "Yellow: Danke,"
	line "<PLAYER>! Hier"
	cont "ist es!"
	done

.RefusedText:
	text "Yellow: Ach…"
	line "Aber was ist mit"
	cont "dem #mon?"
	done

.GoodbyeText:
	text "Yellow: Pass gut"
	line "auf"

	para ""
	text_ram wStringBuffer3
	text ","
	line "<PLAYER>!"

	para "Ich hoffe, wir"
	line "sehen uns wieder."
	cont "Tschüss!"
	done

.DownMovement:
	step_down
	step_down
	step_down
	step_down
	step_end

IndigoPlateauTeleportGuyScript:
	faceplayer
	opentext
	writetext .Text
	yesorno
	iffalse_jumpopenedtext .NoText
	writetext .YesText
	waitbutton
	closetext
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
	warp NEW_BARK_TOWN, 15, 6
	end

.Text:
	text "Ah! Du forderst"
	line "also die TOP VIER"

	para "heraus? Bist du"
	line "wirklich bereit?"

	para "Wenn du mehr"
	line "trainieren"
	cont "willst,"

	para "kann dir mein"
	line "ABRA helfen."

	para "Es kann dich"
	line "nach Hause"
	cont "TELEPORTIEREN."

	para "Möchtest du jetzt"
	line "nach Hause?"
	done
.YesText:
	text "O.K. Stell"
	line "dir dein Haus"
	cont "vor…"
	done
.NoText:
	text "O.K. Alles"
	line "Gute!"
	done
IndigoPlateauAbraText:
	text "ABRA: Aabra…"
	done
IndigoPlateauCooltrainermText:
	text "In der #mon"
	line "LIGA stellen dich"

	para "die TOP VIER auf"
	line "eine harte Probe."

	para "Du musst sie alle"
	line "schlagen. Wenn du"

	para "verlierst, musst"
	line "du ganz von vorne"
	cont "anfangen!"
	done
