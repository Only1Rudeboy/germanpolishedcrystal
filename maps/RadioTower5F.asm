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
	waitbutton
	waitbutton
	end


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
	text "D-Du! Bist du"
	line "gekommen, um mich"
	cont "zu retten?"
	done
FakeDirectorTextBefore2:
	text "Ist es das, was du"
	line "erwartet hast?"
	para "Falsch! Ich bin"
	line "ein Betrüger!"
	para "Ich gebe vor, der"
	line "Echte zu sein, um"
	cont "unsere Übernahme"
	cont "vorzubereiten."
	para "Willst du wissen,"
	line "wo der echte"
	cont "INTENDANT ist?"
	para "Ich verrate es"
	line "-wenn du mich"
	cont "besiegst!"
	done



FakeDirectorTextBefore3:
	text "Ich gab vor, der"
	line "Echte zu sein, um"
	cont "unsere Übernahme"
	cont "vorzubereiten."
	para "Willst du wissen,"
	line "wo wir den echten"
	cont "INTENDANTEN"
	cont "versteckt haben?"
	para "Klar, ich sag's"
	line "dir - aber nur,"
	cont "wenn du mich"
	cont "besiegst!"
	done

FakeDirectorWinText:
	text "O.K. Ich sage dir,"
	line "wo er ist."
	done
FakeDirectorTextAfter:
	text "Wir haben den"
	line "echten INTENDANTEN"
	cont "ins UNTERGRUND-"
	cont "LAGERHAUS"
	cont "verschleppt."
	para "Es liegt am Ende"
	line "des UNTERGRUNDS."
	para "Aber ich"
	line "bezweifle, dass du"
	cont "so weit kommst."
	done



Ariana1SeenText:
	text "Kennst du mich"
	line "noch aus dem"
	cont "VERSTECK in"
	cont "MAHAGONIA CITY?"
	para "Damals habe ich"
	line "verloren - aber"
	cont "das wird heute"
	cont "nicht passieren."
	done
Ariana1BeatenText:
	text "Das darf nicht"
	line "wahr sein!"
	para "Ich habe mich so"
	line "angestrengt und"
	cont "trotzdem verloren…"
	done
RadioTower5FRocketBossBeforeText:
	text "Oh? Du bist so"
	line "weit gekommen?"
	para "Du musst ein"
	line "ausgezeichneter"
	cont "Trainer sein."
	para "Wir wollen den"
	line "RADIOTURM"
	cont "übernehmen und"
	cont "unsere Rückkehr"
	cont "verkünden."
	para "Dann kehrt unser"
	line "Anführer GIOVANNI"
	cont "aus seinem"
	cont "Solo-Training"
	cont "zurück."
	para "Wir erlangen"
	line "unseren früheren"
	cont "Ruhm zurück!"
	para "Ich lasse nicht"
	line "zu, dass du unsere"
	cont "Pläne durchkreuzt."
	done



RadioTower5FRocketBossWinText:
	text "Nein! Vergib mir,"
	line "GIOVANNI!"
	done
RadioTower5FRocketBossAfterText:
	text "Wie kann das sein?"
	para "Unsere Träume…"
	line "wurden"
	cont "zerschlagen."
	para "Ich konnte meine"
	line "Aufgabe nicht"
	cont "erfüllen."
	para "Wie GIOVANNI löse"
	line "ich TEAM ROCKET"
	cont "hier und heute"
	cont "auf."
	para "Leb wohl."
	done



RadioTower5FDirectorThankYouText:
	text "INTENDANT:"
	line "<PLAYER>! Vielen"
	cont "Dank!"
	para "Dein Mut hat die"
	line "#mon im ganzen"
	cont "Land gerettet."
	para "Es ist nicht viel,"
	line "aber bitte nimm"
	cont "dies."
	done



RadioTower5FDirectorDescribeClearBellText:
	text "Früher stand in"
	line "DUKATIA CITY ein"
	cont "alter Turm."
	para "Er war baufällig"
	line "-also bauten wir"
	cont "diesen RADIOTURM."
	para "Beim Bau fanden"
	line "wir diese Glocke."
	para "Man sagt, früher"
	line "lebten viele"
	cont "#mon in DUKATIA"
	cont "CITY."
	para "Vielleicht… hat"
	line "diese Glocke mit"
	cont "dem ZINNTURM in"
	cont "TEAK CITY zu tun…"
	para "Ah! Das erinnert"
	line "mich…"
	para "Ich hörte TEAM"
	line "ROCKET flüstern."
	para "Sie scheinen am"
	line "ZINNTURM etwas im"
	cont "Schilde zu führen."
	para "Ich weiß nicht,"
	line "was - vielleicht"
	cont "solltest du"
	cont "nachsehen."
	para "O.K., ich gehe"
	line "zurück in mein"
	cont "BÜRO."
	done



RadioTower5FDirectorText:
	text "INTENDANT: Hallo,"
	line "<PLAYER>!"
	para "Du weißt, ich"
	line "liebe #mon."
	para "Ich errichtete"
	line "diesen RADIOTURM,"
	cont "um meiner Liebe"
	cont "Ausdruck zu geben."
	para "Es wäre wunderbar,"
	line "wenn die Menschen"
	cont "unsere Sendungen"
	cont "liebten."
	done



BenText:
	text "BEN: Hörst du dir"
	line "unsere Musik an?"
	done



SignpostRadioTower5FOffice:
	text "4S BÜRO DES"
	line "INTENDANTEN"
	done
SignpostRadioTower5FStudio:
	text "4S STUDIO 1"
	done
