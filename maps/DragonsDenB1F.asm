DragonsDenB1F_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_DRAGONSDENB1F_NOOP
	scene_const SCENE_DRAGONSDENB1F_CLAIR_GIVES_TM

	def_callbacks
	callback MAPCALLBACK_NEWMAP, DragonsDenB1FRivalCallback

	def_warp_events
	warp_event 20,  3, DRAGONS_DEN_1F, 3
	warp_event 19, 29, DRAGON_SHRINE, 1

	def_coord_events
	coord_event 19, 30, SCENE_DRAGONSDENB1F_CLAIR_GIVES_TM, DragonsDenB1FClairTrigger

	def_bg_events
	bg_event 18, 24, BGEVENT_JUMPTEXT, DragonsDenShrineSignText
	bg_event 33, 29, BGEVENT_ITEM + REVIVE, EVENT_DRAGONS_DEN_B1F_HIDDEN_REVIVE
	bg_event 21, 17, BGEVENT_ITEM + MAX_POTION, EVENT_DRAGONS_DEN_B1F_HIDDEN_MAX_POTION
	bg_event 31, 15, BGEVENT_ITEM + MAX_ELIXIR, EVENT_DRAGONS_DEN_B1F_HIDDEN_MAX_ELIXIR

	def_object_events
	object_event 14, 30, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_DRAGONS_DEN_CLAIR
	object_event 20, 23, SPRITE_RIVAL, SPRITEMOVEDATA_WANDER, 2, 2, -1, 0, OBJECTTYPE_SCRIPT, 0, DragonsDenB1FRivalScript, EVENT_RIVAL_DRAGONS_DEN
	object_event 34, 19, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, KimonoGirlMinaScript, -1
	object_event 20,  8, SPRITE_DRAGON_TAMER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerDragonTamerDarin, -1
	object_event  8,  8, SPRITE_DRAGON_TAMER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerDragonTamerAdam, -1
	object_event  4, 17, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerAceDuoDanandcara1, -1
	object_event  4, 18, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerAceDuoDanandcara2, -1
	object_event 30, 29, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerTwinsLeaandpia1, -1
	object_event 31, 29, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerTwinsLeaandpia2, -1
	itemball_event 35, 16, DRAGON_FANG, 1, EVENT_DRAGONS_DEN_B1F_DRAGON_FANG
	itemball_event 30,  4, CALCIUM, 1, EVENT_DRAGONS_DEN_B1F_CALCIUM
	itemball_event  5, 20, MAX_ELIXIR, 1, EVENT_DRAGONS_DEN_B1F_MAX_ELIXIR

	object_const_def
	const DRAGONSDENB1F_CLAIR
	const DRAGONSDENB1F_RIVAL
	const DRAGONSDENB1F_KIMONO_GIRL

DragonsDenB1FRivalCallback:
	checkevent EVENT_BEAT_RIVAL_IN_MT_MOON
	iftruefwd .CheckDay
	disappear DRAGONSDENB1F_RIVAL
	endcallback

.CheckDay:
	checkevent EVENT_GOT_RIVALS_EGG
	iffalsefwd .AppearRival
	readvar VAR_WEEKDAY
	ifequalfwd TUESDAY, .AppearRival
	ifequalfwd THURSDAY, .AppearRival
	ifequalfwd SATURDAY, .AppearRival
	disappear DRAGONSDENB1F_RIVAL
	endcallback

.AppearRival:
	appear DRAGONSDENB1F_RIVAL
	endcallback

DragonsDenB1FClairTrigger:
	appear DRAGONSDENB1F_CLAIR
	opentext
	writetext .WaitText
	pause 30
	closetext
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, LEFT
	playmusic MUSIC_CLAIR
	applymovement DRAGONSDENB1F_CLAIR, .WalksToYouMovement
	opentext
	writetext .GiveTMText
	promptbutton
	verbosegivetmhm TM_DRAGON_PULSE
	setevent EVENT_GOT_TM59_DRAGON_PULSE
	writetext .DescribeDragonPulseText
	promptbutton
	writetext ClairPokemonLeagueDirectionsText ; in BlackthornGym1F.asm
	waitbutton
	closetext
	applymovement DRAGONSDENB1F_CLAIR, .WalksAwayMovement
	special Special_FadeOutMusic
	pause 30
	special RestartMapMusic
	disappear DRAGONSDENB1F_CLAIR
	setscene SCENE_DRAGONSDENB1F_NOOP
	setmapscene NEW_BARK_TOWN, SCENE_NEWBARKTOWN_LYRA_FINAL
	clearevent EVENT_LYRA_IN_HER_ROOM
	end

.WaitText:
	text "Moment!"
	done
.GiveTMText:
	text "SANDRA: Das tut"
	line "mir Leid."

	para "Hier, nimm das als"
	line "Entschuldigung."
	done
.DescribeDragonPulseText:
	text "Darin ist"
	line "Drachenpuls."

	para "Wenn du es nicht"
	line "willst, musst du"
	cont "es nicht nehmen."
	done

.WalksToYouMovement:
	slow_step_right
	slow_step_right
	slow_step_right
	slow_step_right
	step_end

.WalksAwayMovement:
	slow_step_left
	slow_step_left
	slow_step_left
	slow_step_left
	step_end

DragonsDenShrineSignText:
	text "DRACHENSCHREIN"

	para "Der Schrein ehrt"
	line "die Drachen #-"
	cont "MON, die früher"

	para "in der DRACHEN-"
	line "HÖHLE gelebt"
	cont "haben sollen."
	done
DragonsDenB1FRivalScript:
	playmusic MUSIC_RIVAL_ENCOUNTER
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftruefwd .RivalTalkAgain
	checkevent EVENT_GOT_RIVALS_EGG
	iftruefwd .RivalTalk
	writetext .Training1Text
	waitbutton
	writetext .GiveEggText
	promptbutton
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftruefwd .GiveChikoritaEgg
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftruefwd .GiveCyndaquilEgg
	giveegg TOTODILE
	sjumpfwd .GotRivalsEgg

.GiveChikoritaEgg:
	giveegg CHIKORITA
	sjumpfwd .GotRivalsEgg

.GiveCyndaquilEgg:
	giveegg CYNDAQUIL
.GotRivalsEgg
	iffalsefwd .PartyAndBoxFull
	writetext .DescribeEggText
	waitbutton
	closetext
	setevent EVENT_GOT_RIVALS_EGG
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	setmapscene ELMS_LAB, SCENE_ELMSLAB_AIDE_GIVES_POKE_BALLS
	special RestartMapMusic
	end

.PartyAndBoxFull:
	writetext .PartyAndBoxFullText
	waitbutton
	closetext
	special RestartMapMusic
	end

.RivalTalk:
	writetext .Training1Text
	waitbutton
	closetext
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	special RestartMapMusic
	end

.RivalTalkAgain:
	writetext .Training2Text
	waitbutton
	closetext
	special RestartMapMusic
	end

.GiveEggText:
	text "… Hör zu."

	para "Das #mon, das"
	line "ich… aus dem"
	cont "Labor…"

	para "mitnahm, hatte ein"
	line "Ei. Ich brauche es"
	cont "nicht."

	para "Hier. Nimm es."
	done

.DescribeEggText:
	text "Hmpf. Bist du hier"
	line "durch?"

	para "Dann geh mir aus"
	line "dem Weg."
	done

.PartyAndBoxFullText:
	text "Hmpf. Du hast"
	line "keinen Platz…"
	cont "nicht einmal in"
	cont "deiner Box…"
	done

.Training1Text:
	text "… Was? <PLAYER>?"

	para "…Nein, ich möchte"
	line "jetzt nicht mit"
	cont "dir kämpfen…"

	para "Meine #mon sind"
	line "noch nicht bereit,"
	cont "dich zu schlagen."

	para "Ich darf sie nicht"
	line "zu schroff"
	cont "behandeln."

	para "Ich muss"
	line "disziplinierter"
	cont "sein, wenn"

	para "ich der weltbeste"
	line "#mon-Trainer"
	cont "werden möchte…"
	done
.Training2Text:
	text "…"

	para "Wow…"

	para "Du musst lernen,"
	line "mir aus dem Weg zu"
	cont "gehen…"
	done
GenericTrainerDragonTamerDarin:
	generictrainer DRAGON_TAMER, DARIN, EVENT_BEAT_DRAGON_TAMER_DARIN, .SeenText, .BeatenText

	text "In dem SCHREIN da"
	line "vorne lebt der"

	para "MEISTER unseres"
	line "Drachenklans. Du"

	para "darfst nicht"
	line "einfach eintreten!"
	done
.SeenText:

	text "Du! Wie kannst du"
	line "es wagen! Niemand"

	para "bat dich"
	line "einzutreten!"
	done

.BeatenText:

	text "S-stark!"
	done

GenericTrainerDragonTamerAdam:
	generictrainer DRAGON_TAMER, ADAM, EVENT_BEAT_DRAGON_TAMER_ADAM, .SeenText, .BeatenText

	text "Nicht einmal die"
	line "Kraft der Drachen"
	cont "konnte dich"
	cont "aufhalten."

	para "Du bist vielleicht"
	line "genau der Trainer,"

	para "den unser MEISTER"
	line "sucht."
	done

.SeenText:

	text "Du solltest nicht"
	line "hier sein!"
	done

.BeatenText:
	text "Nein! Ich wurde"
	line "besiegt!"
	done

GenericTrainerAceDuoDanandcara1:
	generictrainer ACE_DUO, DANANDCARA1, EVENT_BEAT_ACE_DUO_DAN_AND_CARA, .SeenText, .BeatenText

	text "Dan: Bald bekomme"
	line "ich vom MEISTER"

	para "die Erlaubnis,"
	line "Drachen"
	cont "einzusetzen."

	para "Dann werde ich ein"
	line "großartiger"
	cont "Drachen-Trainer"

	para "und gewinne die"
	line "Anerkennung"
	cont "unseres MEISTERs."
	done

.SeenText:
	text "Dan: Ich darf zwar"
	line "keine Drachen"
	cont "nutzen,"

	para "aber ich bin"
	line "trotzdem stark!"
	done

.BeatenText:
	text "Dan: Du warst noch"
	line "stärker!"
	done

GenericTrainerAceDuoDanandcara2:
	generictrainer ACE_DUO, DANANDCARA2, EVENT_BEAT_ACE_DUO_DAN_AND_CARA, .SeenText, .BeatenText

	text "Cara: Drachen sind"
	line "schwer zu"

	para "erziehen und sehr"
	line "stark."

	para "Sie sind nichts"
	line "für jeden."
	done

.SeenText:
	text "Cara: Willst du"
	line "auch Drachen"
	cont "trainieren?"
	done

.BeatenText:
	text "Cara: Ach, Mist,"
	line "ich hab verloren!"
	done

GenericTrainerTwinsLeaandpia1:
	generictrainer TWINS, LEAANDPIA1, EVENT_BEAT_TWINS_LEA_AND_PIA, .SeenText, .BeatenText

	text "Es kam mir vor,"
	line "als würde ich"
	cont "gegen SIEGFRIED"
	cont "kämpfen."
	done
.SeenText:

	text "Ein Fremder, den"
	line "wir nicht kennen."
	done

.BeatenText:

	text "Aua!"
	done

GenericTrainerTwinsLeaandpia2:
	generictrainer TWINS, LEAANDPIA1, EVENT_BEAT_TWINS_LEA_AND_PIA, .SeenText, .BeatenText

	text "Wir verraten dich."

	para "Der MEISTER wird"
	line "erzürnt sein."
	done
.SeenText:

	text "Wer bist du?"
	done

.BeatenText:

	text "Fiesling."
	done

KimonoGirlMinaScript:
	checkevent EVENT_GOT_ABILITYPATCH_FROM_KIMONO_GIRL_MINA
	iftrue_jumptextfaceplayer .OutroText
	faceplayer
	checkevent EVENT_BEAT_KIMONO_GIRL_MINA
	iftruefwd .Beaten
	checkevent EVENT_BEAT_KIMONO_GIRL_NAOKO
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_KIMONO_GIRL_SAYO
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_KIMONO_GIRL_ZUKI
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_KIMONO_GIRL_KUNI
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_KIMONO_GIRL_MIKI
	iffalse_jumptext .IntroText
	showtext .SeenText
	winlosstext .BeatenText, 0
	setlasttalked DRAGONSDENB1F_KIMONO_GIRL
	loadtrainerwithpal KIMONO_GIRL, MINA, TRAINERPAL_MINA
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_KIMONO_GIRL_MINA
.Beaten:
	opentext
	writetext .AfterText
	promptbutton
	verbosegiveitem ABILITYPATCH
	iffalse_jumpopenedtext .BagFullText
	setevent EVENT_GOT_ABILITYPATCH_FROM_KIMONO_GIRL_MINA
	jumpthisopenedtext

.OutroText:
	text "Der Weg aus TEAK"
	line "CITY hat"

	para "sich gelohnt."

	para "Die DRACHENHÖHLE"
	line "ist ein idealer"
	cont "Ort zum"
	cont "Trainieren."
	done

.BagFullText:
	text "…Sobald du wieder"
	line "Platz in deiner"
	cont "Tasche hast."
	done

.IntroText:
	text "Ich bin ein"
	line "KIMONO-GIRL."

	para "Hast du meine fünf"
	line "tanzenden Cousinen"
	cont "in TEAK CITY nicht"
	cont "getroffen?"

	para "Sag mir Bescheid,"
	line "wenn du sie"
	cont "triffst."
	done

.SeenText:
	text "Wer am meisten"
	line "weiß, spricht am"
	cont "wenigsten!"

	para "Ich fordere dich"
	line "und deine #mon"
	cont "heraus!"
	done

.BeatenText:
	text "Ach, du bist"
	line "wunderbar…"
	done

.AfterText:
	text "Du bist ein echter"
	line "Trainer."

	para "Du bist dieses"
	line "Item würdig!"
	done
