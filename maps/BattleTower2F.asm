BattleTower2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  0,  1, BATTLE_TOWER_1F, 4

	def_coord_events

	def_bg_events
	bg_event  4,  3, BGEVENT_UP, BattleTower2FTVScript
	bg_event  5,  3, BGEVENT_UP, BattleTower2FTVScript
	bg_event 16,  3, BGEVENT_UP, BattleTower2FTVScript
	bg_event 17,  3, BGEVENT_UP, BattleTower2FTVScript

	def_object_events
	object_event  4,  6, SPRITE_CHERYL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTower2FCherylScript, EVENT_BATTLE_TOWER_CHERYL
	object_event  7,  7, SPRITE_RILEY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTower2FRileyScript, EVENT_BATTLE_TOWER_RILEY
	object_event  9,  4, SPRITE_BUCK, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTower2FBuckScript, EVENT_BATTLE_TOWER_BUCK
	object_event 17,  8, SPRITE_MARLEY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTower2FMarleyScript, EVENT_BATTLE_TOWER_MARLEY
	object_event 12,  7, SPRITE_MIRA, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTower2FMiraScript, EVENT_BATTLE_TOWER_MIRA
	object_event 15,  6, SPRITE_ANABEL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTower2FAnabelScript, EVENT_BATTLE_TOWER_ANABEL
	object_event  4,  6, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, BattleTower2FCooltrainermText, EVENT_MURKY_SWAMP_CHERYL
	object_event  7,  7, SPRITE_LADY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, BattleTower2FLadyText, EVENT_DIM_CAVE_RILEY
	object_event  9,  4, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, BattleTower2FTwinText, EVENT_CINNABAR_VOLCANO_BUCK
	object_event 17,  8, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, BattleTower2FSuperNerdText, EVENT_QUIET_CAVE_MARLEY
	pokemon_event 18,  8, PIKACHU, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_RED, BattleTower2FPikachuText, EVENT_QUIET_CAVE_MARLEY
	object_event 12,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, BattleTower2FYoungsterText, EVENT_SCARY_CAVE_MIRA
	object_event 15,  6, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, BattleTower2FBlackbeltText, EVENT_BATTLE_TOWER_OUTSIDE_ANABEL

	object_const_def
	const BATTLETOWER2F_CHERYL
	const BATTLETOWER2F_RILEY
	const BATTLETOWER2F_BUCK
	const BATTLETOWER2F_MARLEY
	const BATTLETOWER2F_MIRA
	const BATTLETOWER2F_ANABEL

BattleTower2FTVScript:
	jumpthistext

	text "Im Fernsehen läuft"
	line "ein spannender"
	cont "Kampf."
	done

BattleTower2FCherylScript:
	checkflag ENGINE_CHERYL_DONE_TODAY
	iftrue_jumptextfaceplayer .AfterText
	faceplayer
	opentext
	writethistext
		text "Oh, hallo,"
		line "<PLAYER>."
		para "Es ist lange her…"
		line "nicht wahr?"
		para "Hättest du Lust,"
		line "gegen mich zu"
		cont "kämpfen?"
		done
	yesorno
	iffalse_jumpopenedtext .RefuseText
	setflag ENGINE_CHERYL_DONE_TODAY
	writethistext
		text "Ich sollte dich"
		line "warnen, meine"
		cont "#MON können"
		para "recht wild sein."
		done
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked BATTLETOWER2F_CHERYL
	checkevent EVENT_BEAT_ELITE_FOUR_AGAIN
	iftruefwd .Team3
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd .Team2
	loadtrainer CHERYL, 1
	sjumpfwd .StartBattle
.Team2
	loadtrainer CHERYL, 2
	sjumpfwd .StartBattle
.Team3
	loadtrainer CHERYL, 3
.StartBattle
	startbattle
	reloadmapafterbattle
	jumpthistext

.AfterText:
	text "Trainer zu sein"
	line "ist nicht leicht."
	para "Je mehr du"
	line "kämpfst, desto"
	cont "mehr entdeckst du."
	para "Aber weißt du was?"
	line "Genau dafür liebe"
	cont "ich #MON auch!"
	done

.BeatenText:
	text "Die richtige"
	line "Balance aus"
	cont "Angriff und"
	para "Verteidigung zu"
	line "finden…"
	para "Das ist nicht"
	line "leicht."
	done

.RefuseText:
	text "Kicher…"
	para "Unsere #MON"
	line "wären ganz"
	cont "erschöpft, wenn"
	para "wir ständig"
	line "kämpfen würden,"
	cont "oder?"
	done

BattleTower2FRileyScript:
	checkflag ENGINE_RILEY_DONE_TODAY
	iftrue_jumptextfaceplayer .AfterText
	faceplayer
	opentext
	writethistext
		text "Hallo. Lange nicht"
		line "gesehen."
		para "Dieser Blick… ich"
		line "nehme an, du bist"
		cont "kampfbereit?"
		done
	yesorno
	iffalse_jumpopenedtext .RefuseText
	setflag ENGINE_RILEY_DONE_TODAY
	writethistext
		text "Kämpfen ist unsere"
		line "Art der Begrüßung!"
		done
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked BATTLETOWER2F_RILEY
	checkevent EVENT_BEAT_ELITE_FOUR_AGAIN
	iftruefwd .Team2
	loadtrainer RILEY, 1
	sjumpfwd .StartBattle
.Team2
	loadtrainer RILEY, 2
.StartBattle
	startbattle
	reloadmapafterbattle
	jumpthistext

.AfterText:
	text "Wäre ich nicht in"
	line "der Düsterhöhle"
	cont "gewesen…"
	para "wärst du nicht in"
	line "der Düsterhöhle"
	cont "gewesen…"
	para "hätten wir uns nie"
	line "getroffen."
	para "Oder wären wir uns"
	line "woanders"
	cont "begegnet?"
	done

.BeatenText:
	text "Manchmal kämpfen"
	line "wir, manchmal tun"
	cont "wir uns zusammen."
	para "Toll, wie Trainer"
	line "miteinander"
	cont "umgehen können."
	done

.RefuseText:
	text "Oh, na gut. Dann"
	line "warten wir, bis du"
	cont "bereit bist."
	done

BattleTower2FBuckScript:
	checkflag ENGINE_BUCK_DONE_TODAY
	iftrue_jumptextfaceplayer .AfterText
	faceplayer
	opentext
	writethistext
		text "Ehehehe! Endlich"
		line "bist du da!"
		para "Kämpfen wir jetzt?"
		done
	yesorno
	iffalse_jumpopenedtext .RefuseText
	setflag ENGINE_BUCK_DONE_TODAY
	writethistext
		text "Ich spüre, wie"
		line "meine #MON vor"
		cont "Vorfreude zittern!"
		done
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked BATTLETOWER2F_BUCK
	checkevent EVENT_BEAT_ELITE_FOUR_AGAIN
	iftruefwd .Team2
	loadtrainer BUCK, 1
	sjumpfwd .StartBattle
.Team2
	loadtrainer BUCK, 2
.StartBattle
	startbattle
	reloadmapafterbattle
	jumpthistext

.AfterText:
	text "Puh! Das war"
	line "heftig!"
	para "Ich feile wohl"
	line "weiter an meinem"
	cont "Team."
	done

.BeatenText:
	text "Hehehe! Du bist"
	line "der Hammer!"
	done

.RefuseText:
	text "Hä, was? Das nimmt"
	line "mir den Wind aus"
	cont "den Segeln."
	done

BattleTower2FMarleyScript:
	checkflag ENGINE_MARLEY_DONE_TODAY
	iftrue_jumptextfaceplayer .AfterText
	faceplayer
	opentext
	writethistext
		text "…Oh? Ein Kampf?"
		line "Mit mir?"
		done
	yesorno
	iffalse_jumpopenedtext .RefuseText
	setflag ENGINE_MARLEY_DONE_TODAY
	writethistext
		text "…O.K. Ich…"
		line "verliere nicht…!"
		done
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked BATTLETOWER2F_MARLEY
	checkevent EVENT_BEAT_ELITE_FOUR_AGAIN
	iftruefwd .Team3
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd .Team2
	loadtrainer MARLEY, 1
	sjumpfwd .StartBattle
.Team2
	loadtrainer MARLEY, 2
	sjumpfwd .StartBattle
.Team3
	loadtrainer MARLEY, 3
.StartBattle
	startbattle
	reloadmapafterbattle
	jumpthistext

.AfterText:
	text "…Kämpfen mit dir"
	line "gefällt mir"
	cont "vielleicht."
	para "…Nur ein"
	line "bisschen. Nur"
	cont "ganz wenig."
	done

.BeatenText:
	text "…Achh."
	done

.RefuseText:
	text "…Ach, du. Ich mag"
	line "dich langsam etwas"
	cont "weniger."
	done

BattleTower2FMiraScript:
	checkflag ENGINE_MIRA_DONE_TODAY
	iftrue_jumptextfaceplayer .AfterText
	faceplayer
	opentext
	writethistext
		text "<PLAYER>! MIRA ist"
		line "jetzt stärker!"
		para "Bitte! Kämpf mit"
		line "MIRA!"
		done
	yesorno
	iffalse_jumpopenedtext .RefuseText
	setflag ENGINE_MIRA_DONE_TODAY
	writethistext
		text "MIRA zeigt dir,"
		line "dass MIRA sich"
		cont "nicht mehr"
		para "verirrt, <PLAYER>!"
		done
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked BATTLETOWER2F_MIRA
	checkevent EVENT_BEAT_ELITE_FOUR_AGAIN
	iftruefwd .Team2
	loadtrainer MIRA, 1
	sjumpfwd .StartBattle
.Team2
	loadtrainer MIRA, 2
.StartBattle
	startbattle
	reloadmapafterbattle
	jumpthistext

.AfterText:
	text "<PLAYER>, du bist"
	line "immer bei deinen"
	cont "#MON."
	para "So bist du so"
	line "stark geworden."
	para "MIRA beginnt zu"
	line "verstehen!"
	done

.BeatenText:
	text "MIRA fragt sich,"
	line "ob sie es weit im"
	cont "DUELLTURM"
	cont "schafft."
	done

.RefuseText:
	text "MIRA ist etwas"
	line "traurig…"
	done

BattleTower2FAnabelScript:
	checkflag ENGINE_ANABEL_DONE_TODAY
	iftrue_jumptextfaceplayer .AfterText
	faceplayer
	opentext
	writethistext
		text "Du bist wirklich"
		line "gekommen, um mich"
		cont "zu sehen…"
		para "Ich muss mich"
		line "gegen dich nicht"
		cont "zurückhalten…"
		para "Bist du bereit?"
		done
	yesorno
	iffalse_jumpopenedtext .RefuseText
	setflag ENGINE_ANABEL_DONE_TODAY
	writethistext
		text "Fangen wir an, ja?"
		done
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked BATTLETOWER2F_ANABEL
	loadtrainer ANABEL, 2
	startbattle
	reloadmapafterbattle
	jumpthistext

.AfterText:
	text "Das hat Spaß"
	line "gemacht…"
	para "Noch nie hat mir"
	line "ein #MON-Kampf"
	cont "so viel Freude"
	para "bereitet…"
	done

.BeatenText:
	text "Danke…"
	done

.RefuseText:
	text "Das ist sehr"
	line "enttäuschend…"
	done

BattleTower2FCooltrainermText:
	text "Ich muss los, aber"
	line "ich kann nicht"
	cont "aufhören,"
	para "diesen Kampf"
	line "anzuschauen!"
	done

BattleTower2FLadyText:
	text "Was macht mich als"
	line "Trainerin am"
	cont "glücklichsten?"
	para "Dass #MON mir"
	line "viele Freunde"
	cont "bringen!"
	done

BattleTower2FTwinText:
	text "Manche wundern"
	line "sich, ein kleines"
	cont "Mädchen wie mich"
	para "im DUELLTURM zu"
	line "sehen."
	para "Ich muss ja nicht"
	line "selbst kämpfen,"
	cont "weißt du?"
	done

BattleTower2FSuperNerdText:
	text "Hehe! Alle Trainer"
	line "hier wirken so"
	para "erbärmlich!"
	para "…Aber genau diese"
	line "Einstellung lässt"
	cont "dich mit einem"
	para "Treffer verlieren!"
	para "Lass nicht nach,"
	line "Pikachu!"
	done

BattleTower2FPikachuText:
	text "PIKACHU: Pichuu!"
	done

BattleTower2FYoungsterText:
	text "Stark zu sein"
	line "heißt schwach zu"
	cont "sein."
	para "Schwach zu sein"
	line "heißt stark zu"
	cont "sein."
	para "Das hat mir mal"
	line "jemand gesagt."
	para "Ich versteh es"
	line "nicht, aber es"
	cont "klingt"
	cont "tiefgründig."
	done

BattleTower2FBlackbeltText:
	text "Der Karateanzug"
	line "ist die Uniform"
	cont "der Kämpfer!"
	para "Nichts eignet sich"
	line "besser für den"
	cont "DUELLTURM"
	para "als das!"
	done
