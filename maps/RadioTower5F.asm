RadioTower5F_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_RADIOTOWER5F_FAKE_DIRECTOR
	scene_const SCENE_RADIOTOWER5F_ROCKET_BOSS
	scene_const SCENE_RADIOTOWER5F_NOOP

	def_callbacks

	def_warp_events
	warp_event  0,  0, RADIO_TOWER_4F, 1
	warp_event 12,  0, RADIO_TOWER_4F, 3

	def_coord_events
	coord_event  0,  3, SCENE_RADIOTOWER5F_FAKE_DIRECTOR, FakeDirectorScript
	coord_event 16,  5, SCENE_RADIOTOWER5F_ROCKET_BOSS, RadioTower5FRocketBossTrigger

	def_bg_events
	bg_event  3,  0, BGEVENT_JUMPTEXT, SignpostRadioTower5FOffice
	bg_event 11,  0, BGEVENT_JUMPTEXT, SignpostRadioTower5FStudio
	bg_event 15,  0, BGEVENT_JUMPTEXT, SignpostRadioTower5FStudio

	def_object_events
	object_event  3,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, RadioTower5FDirectorText, EVENT_RADIO_TOWER_DIRECTOR
	object_event  0,  4, SPRITE_PETREL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Petrel1Script, EVENT_RADIO_TOWER_PETREL
	object_event 13,  5, SPRITE_ARCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 17,  2, SPRITE_ARIANA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerAriana1, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 13,  5, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, BenText, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	itemball_event  8,  5, ZOOM_LENS, 1, EVENT_RADIO_TOWER_5F_ZOOM_LENS

	object_const_def
	const RADIOTOWER5F_DIRECTOR
	const RADIOTOWER5F_PETREL
	const RADIOTOWER5F_ARCHER
	const RADIOTOWER5F_ARIANA

FakeDirectorScript:
	turnobject RADIOTOWER5F_DIRECTOR, UP
	showemote EMOTE_SHOCK, RADIOTOWER5F_DIRECTOR, 15
	showtext FakeDirectorTextBefore1
	applymovement RADIOTOWER5F_DIRECTOR, FakeDirectorMovement
	special SaveMusic
	playmusic MUSIC_ROCKET_ENCOUNTER
	showtext FakeDirectorTextBefore2
	applymovement RADIOTOWER5F_DIRECTOR, FakeDirectorSpinMovement
	appear RADIOTOWER5F_PETREL
	disappear RADIOTOWER5F_DIRECTOR
	turnobject RADIOTOWER5F_PETREL, UP
	pause 10
Petrel1Script:
	checkevent EVENT_BEAT_PETREL_1
	iftrue_jumptextfaceplayer FakeDirectorTextAfter
	setscene SCENE_RADIOTOWER5F_ROCKET_BOSS
	faceplayer
	showtext FakeDirectorTextBefore3
	winlosstext FakeDirectorWinText, 0
	setlasttalked RADIOTOWER5F_PETREL
	loadtrainer PETREL, PETREL1
	startbattle
	reloadmapafterbattle
	opentext
	writetext FakeDirectorTextAfter
	promptbutton
	verbosegivekeyitem BASEMENT_KEY
	closetext
	setevent EVENT_BEAT_PETREL_1
	end

GenericTrainerAriana1:
	generictrainer ARIANA, ARIANA1, EVENT_BEAT_ARIANA_1, Ariana1SeenText, Ariana1BeatenText

	; GSC-DE Dump
	text "<PLAYER>, oder?"
	para "Ein Balg wie du"
	line "weiß die Größe"
	para "von TEAM ROCKET"
	line "nicht zu würdigen."
	para "Das ist schade."
	line "Ich bewundere"
	cont "deine Stärke."
	done

RadioTower5FRocketBossTrigger:
	applymovement PLAYER, RadioTower5FPlayerTwoStepsLeftMovement
	playmusic MUSIC_ROCKET_ENCOUNTER
	turnobject RADIOTOWER5F_ARCHER, RIGHT
	showtext RadioTower5FRocketBossBeforeText
	winlosstext RadioTower5FRocketBossWinText, 0
	setlasttalked RADIOTOWER5F_ARCHER
	loadtrainer ARCHER, ARCHER1
	startbattle
	reloadmapafterbattle
	showtext RadioTower5FRocketBossAfterText
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear RADIOTOWER5F_ARCHER
	disappear RADIOTOWER5F_ARIANA
	pause 15
	special Special_FadeInQuickly
	setevent EVENT_BEAT_ARCHER_1
	setevent EVENT_CLEARED_RADIO_TOWER
	clearflag ENGINE_ROCKETS_IN_RADIO_TOWER
	setevent EVENT_GOLDENROD_CITY_ROCKET_SCOUT
	setevent EVENT_GOLDENROD_CITY_ROCKET_TAKEOVER
	setevent EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	clearevent EVENT_MAHOGANY_MART_OWNERS
	clearflag ENGINE_ROCKETS_IN_MAHOGANY
	clearevent EVENT_GOLDENROD_CITY_CIVILIANS
	clearevent EVENT_RADIO_TOWER_CIVILIANS_AFTER
	setevent EVENT_BLACKTHORN_CITY_DRAGON_TAMER_BLOCKS_GYM
	clearevent EVENT_BLACKTHORN_CITY_DRAGON_TAMER_DOES_NOT_BLOCK_GYM
	special PlayMapMusic
	disappear RADIOTOWER5F_PETREL
	disappear RADIOTOWER5F_DIRECTOR
	moveobject RADIOTOWER5F_DIRECTOR, 12, 0
	appear RADIOTOWER5F_DIRECTOR
	applymovement RADIOTOWER5F_DIRECTOR, RadioTower5FDirectorWalksIn
	turnobject PLAYER, RIGHT
	opentext
	writetext RadioTower5FDirectorThankYouText
	promptbutton
	verbosegivekeyitem CLEAR_BELL
	writetext RadioTower5FDirectorDescribeClearBellText
	waitbutton
	closetext
	setscene SCENE_RADIOTOWER5F_NOOP
	setmapscene ECRUTEAK_HOUSE, SCENE_ECRUTEAKHOUSE_SAGE_BLOCKS
	setevent EVENT_GOT_CLEAR_BELL
	setevent EVENT_TEAM_ROCKET_DISBANDED
	applymovement RADIOTOWER5F_DIRECTOR, RadioTower5FDirectorWalksOut
	playsound SFX_EXIT_BUILDING
	disappear RADIOTOWER5F_DIRECTOR
	moveobject RADIOTOWER5F_DIRECTOR, 3, 6
	appear RADIOTOWER5F_DIRECTOR
	end

FakeDirectorMovement:
	step_left
	step_left
	step_left
	step_up
	step_up
	step_end

FakeDirectorSpinMovement:
	turn_head_left
	turn_head_down
	turn_head_right
	turn_head_up
	turn_head_left
	turn_head_down
	turn_head_right
	turn_head_up
	turn_head_left
	turn_head_down
	turn_head_right
	turn_head_up
	step_sleep 8
	step_end

RadioTower5FDirectorWalksIn:
	step_down
	step_down
	step_right
	step_right
	step_right
	step_right
	step_down
	step_down
	step_down
	step_left
	step_end

RadioTower5FDirectorWalksOut:
	step_right
	step_up
	step_up
	step_up
	step_left
	step_left
	step_left
	step_left
	step_up
	step_up
	step_end

RadioTower5FPlayerTwoStepsLeftMovement:
	step_left
	step_left
	step_end

FakeDirectorTextBefore1:
	; GSC-DE Dump
	text "D-Du! Bist du"
	line "gekommen, um mich"
	cont "zu retten?"
	done

FakeDirectorTextBefore2:
	; GSC-DE Dump
	text "Ist es das, was du"
	line "erwartet hast?"
	para "Falsch! Ich bin"
	line "ein Betrüger!"
	para "Ich gebe vor, der"
	line "Echte zu sein, um"
	para "unsere Übernahme"
	line "vorzubereiten."
	para "Möchtest du wis-"
	line "sen, wo wir den"
	cont "echten INTENDANTEN"
	cont "versteckt haben?"
	para "Ich werde es dir"
	line "verraten, wenn"
	cont "du mich besiegst!"
	done

FakeDirectorTextBefore3:
	; GSC-DE Dump (same reveal text; PC uses this path)
	text "Ist es das, was du"
	line "erwartet hast?"
	para "Falsch! Ich bin"
	line "ein Betrüger!"
	para "Ich gebe vor, der"
	line "Echte zu sein, um"
	para "unsere Übernahme"
	line "vorzubereiten."
	para "Möchtest du wis-"
	line "sen, wo wir den"
	cont "echten INTENDANTEN"
	cont "versteckt haben?"
	para "Ich werde es dir"
	line "verraten, wenn"
	cont "du mich besiegst!"
	done

FakeDirectorWinText:
	; GSC-DE Dump
	text "O.K. Ich sage"
	line "dir, wo er ist."
	done

FakeDirectorTextAfter:
	; GSC-DE Dump
	text "Wir haben den"
	line "echten INTENDANTEN"
	para "in das UNTERGRUND-"
	line "LAGERHAUS"
	cont "verschleppt."
	para "Es ist am Ende"
	line "des UNTERGRUNDs."
	para "Ich bezweifle"
	line "aber, dass du"
	cont "so weit kommst."
	done

Ariana1SeenText:
	; GSC-DE Dump
	text "Kennst du mich"
	line "noch aus dem"
	cont "VERSTECK in"
	cont "MAHAGONIA CITY?"
	para "Damals habe ich"
	line "verloren, aber das"
	para "wird heute nicht"
	line "passieren."
	done

Ariana1BeatenText:
	; GSC-DE Dump
	text "Das darf nicht"
	line "wahr sein!"
	para "Ich habe mich so"
	line "angestrengt und"
	cont "dennoch verloren…"
	done

RadioTower5FRocketBossBeforeText:
	; GSC-DE Dump
	text "Oh? Du bist"
	line "so weit gekommen?"
	para "Du musst ein aus-"
	line "gezeichneter Trai-"
	cont "ner sein."
	para "Wir planen, die"
	line "RADIOSTATION zu"
	para "annektieren und"
	line "unsere Rückkehr"
	cont "bekanntzugeben."
	para "Das sollte unseren"
	line "Anführer GIOVANNI"
	para "überzeugen, sein"
	line "Solo-Training"
	cont "abzubrechen und"
	cont "zurückzukehren."
	para "Wir werden unseren"
	line "früheren Ruhm"
	cont "wiedererlangen."
	para "Ich werde nicht"
	line "zulassen, dass du"
	cont "unsere Pläne"
	cont "durchkreuzt."
	done

RadioTower5FRocketBossWinText:
	; GSC-DE Dump
	text "Nein! Vergib mir,"
	line "GIOVANNI!"
	done

RadioTower5FRocketBossAfterText:
	; GSC-DE Dump
	text "Wie kann das sein?"
	para "Unsere Träume wur-"
	line "den zerschlagen."
	para "Ich konnte meine"
	line "Aufgabe nicht"
	cont "erfüllen."
	para "Wie GIOVANNI"
	line "werde ich TEAM"
	para "ROCKET hier und"
	line "heute auflösen."
	para "Leb wohl."
	done

RadioTower5FDirectorThankYouText:
	; GSC-DE Dump
	text "INTENDANT:"
	line "<PLAYER>!"
	cont "Vielen Dank!"
	para "Dein couragiertes"
	line "Handeln hat die"
	para "#MON im ganzen"
	line "Land gerettet."
	para "Ich weiß, es ist"
	line "nicht viel, aber"
	cont "nimm dies bitte."
	done

RadioTower5FDirectorDescribeClearBellText:
	; GSC-DE Dump
	text "Früher gab es hier"
	line "einen Turm in"
	cont "DUKATIA CITY."
	para "Aber er war alt"
	line "und baufällig."
	para "Also haben wir ihn"
	line "durch unseren"
	cont "RADIOTURM ersetzt."
	para "Beim Bau haben wir"
	line "diese Glocke"
	cont "gefunden."
	para "Ich hörte, dass"
	line "früher viele ver-"
	cont "schiedene #MON"
	para "in DUKATIA CITY"
	line "lebten."
	para "Vielleicht…"
	para "…hat diese Glocke"
	line "etwas mit dem"
	para "ZINNTURM in TEAK"
	line "CITY zu tun…"
	para "Ah!"
	para "Das erinnert mich…"
	para "Ich habe TEAM"
	line "ROCKET zufällig"
	cont "flüstern hören."
	para "Es scheint, als"
	line "führten sie etwas"
	cont "am ZINNTURM im"
	cont "Schilde."
	para "Ich habe keine"
	line "Ahnung, was vor"
	para "sich geht. Viel-"
	line "leicht solltest du"
	cont "es überprüfen."
	para "O.K., ich gehe in"
	line "mein BÜRO zurück."
	done

RadioTower5FDirectorText:
	; GSC-DE Dump
	text "INTENDANT: Hallo,"
	line "<PLAYER>!"
	para "Du weißt, ich"
	line "liebe #MON."
	para "Ich errichtete"
	line "diesen RADIOTURM,"
	para "um meiner Liebe zu"
	line "#MON Ausdruck"
	cont "zu verleihen."
	para "Es wäre wunderbar,"
	line "wenn die Menschen"
	cont "unsere Sendungen"
	cont "liebten."
	done

BenText:
	; GSC-DE Dump
	text "BEN: Hörst du dir"
	line "unsere Musik an?"
	done

SignpostRadioTower5FOffice:
	; GSC-DE Dump
	text "4S BÜRO DES"
	line "   INTENDANTEN"
	done

SignpostRadioTower5FStudio:
	; GSC-DE Dump
	text "4S STUDIO 1"
	done
