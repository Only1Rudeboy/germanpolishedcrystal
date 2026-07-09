WiseTriosRoom_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_WISETRIOSROOM_SAGE_BLOCKS
	scene_const SCENE_WISETRIOSROOM_NOOP

	def_callbacks
	callback MAPCALLBACK_OBJECTS, WiseTriosRoomCallback

	def_warp_events
	warp_event  7,  4, BELLCHIME_TRAIL, 1
	warp_event  7,  5, BELLCHIME_TRAIL, 2
	warp_event  1,  4, ECRUTEAK_HOUSE, 5

	def_coord_events
	coord_event  7,  4, SCENE_WISETRIOSROOM_SAGE_BLOCKS, WiseTriosRoom_CannotEnterTinTowerScript

	def_bg_events

	def_object_events
	object_event  6,  2, SPRITE_ELDER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, WiseTriosRoomSage1Text, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	object_event  6,  7, SPRITE_ELDER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, WiseTriosRoomSage2Text, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	object_event  7,  5, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, WiseTriosRoomSage3Text, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	object_event  4,  2, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerElderGaku, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	object_event  4,  6, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerElderMasa, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	object_event  6,  4, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerElderKoji, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2

	object_const_def
	const WISETRIOSROOM_ELDER1
	const WISETRIOSROOM_ELDER2
	const WISETRIOSROOM_ELDER3
	const WISETRIOSROOM_ELDER4
	const WISETRIOSROOM_ELDER5
	const WISETRIOSROOM_ELDER6

WiseTriosRoomCallback:
	checkevent EVENT_FOUGHT_SUICUNE
	iftruefwd .NoWiseTrio
	checkevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	iftruefwd .WiseTrio2
	checkkeyitem CLEAR_BELL
	iftruefwd .WiseTrio2
	clearevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	endcallback

.WiseTrio2:
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	clearevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	endcallback

.NoWiseTrio:
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	endcallback

WiseTriosRoom_CannotEnterTinTowerScript:
	turnobject WISETRIOSROOM_ELDER3, UP
	turnobject PLAYER, DOWN
	showemote EMOTE_SHOCK, WISETRIOSROOM_ELDER3, 20
	follow PLAYER, WISETRIOSROOM_ELDER3
	applymovement PLAYER, WiseTriosRoomSageBlocksPlayerMovement
	stopfollow
	turnobject PLAYER, RIGHT
	showtext WiseTriosRoomSage3BlocksExitText
	applymovement WISETRIOSROOM_ELDER3, WiseTriosRoomSageReturnsMovement
	turnobject WISETRIOSROOM_ELDER3, LEFT
	end

TrainerElderGaku:
	trainer ELDER, GAKU, EVENT_BEAT_ELDER_GAKU, ElderGakuSeenText, ElderGakuBeatenText, 0, .Script, TRAINERPAL_GAKU

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "Ah, du behauptest"
	line "also, SUICUNE,"

	para "ENTEI und RAIKOU"
	line "während sie"

	para "schliefen"
	line "gesehen zu haben?"

	para "Unglaublich!"

	para "Der Legende nach"
	line "können sie"
	cont "während"

	para "des Schlafs nicht"
	line "gesehen werden…"
	done
TrainerElderMasa:
	trainer ELDER, MASA, EVENT_BEAT_ELDER_MASA, ElderMasaSeenText, ElderMasaBeatenText, 0, .Script, TRAINERPAL_MASA

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "Früher gab es"
	line "hier"
	line "zwei neunstöckige"
	cont "Türme."

if DEF(FAITHFUL)
	para "Der eine war der"
	line "Kupferturm, der"
else
	para "Der eine war der"
	line "Gongturm, der"
endc

	para "#mon aus dem"
	line "Schlaf wecken"
	cont "sollte."

	para "Der andere war"
	line "der Glockenturm,"

	para "in dem #mon"
	line "Ruhe fanden."

	para "Die Aussicht von"
	line "den Türmspitzen"

	para "muss großartig"
	line "gewesen sein."

	para "Zu jener Zeit"
	line "soll"
	line "ein riesiges,"

	para "silberfarbenes"
	line "#mon auf dem"
if DEF(FAITHFUL)
	line "Kupferturm sein"
else
	line "Gongturm sein"
endc

	para "Nest gehabt"
	line "haben."

	para "Doch…"

	para "Vor etwa 150"
	line "Jahren wurde"

	para "einer der Türme"
	line "vom Blitz"
	cont "getroffen."

	para "Er brannte drei"
	line "Tage lang."

	para "Ein plötzlicher"
	line "Regenguss löschte"

	para "schließlich das"
	line "Feuer."

	para "So entstand die"
	line "TURMRUINE."
	done

TrainerElderKoji:
	trainer ELDER, KOJI, EVENT_BEAT_ELDER_KOJI, ElderKojiSeenText, ElderKojiBeatenText, 0, .Script, TRAINERPAL_KOJI

.Script:
	checkevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	iftrue_jumptext SageKojiAfterBattleFinalText
	pause 10
	showemote EMOTE_SHOCK, WISETRIOSROOM_ELDER6, 20
	opentext
	writetext SageKojiAfterBattleQuestionText
	promptbutton
	writetext SageKojiAfterBattleSpeechText
	waitbutton
	closetext
	applymovement WISETRIOSROOM_ELDER6, WiseTriosRoomSageAllowsPassageMovement
	turnobject WISETRIOSROOM_ELDER6, UP
	setevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	setscene SCENE_WISETRIOSROOM_NOOP
	end

WiseTriosRoomSageBlocksPlayerMovement:
	step_left
	step_left
	step_end

WiseTriosRoomSageReturnsMovement:
	step_right
	step_down
	step_end

WiseTriosRoomSageAllowsPassageMovement:
	step_right
	step_down
	step_end

WiseTriosRoomSage1Text:
	text "Erstaunlich…"

	para "SUICUNE, ENTEI"
	line "und"
	line "RAIKOU sind aus"
	cont "dem Schlaf"
	cont "erwacht…"

	para "Wird die Legende"
	line "wahr?"
	done







WiseTriosRoomSage2Text:
	text "Wir trainieren"
	line "bei"
	line "der TURMRUINE,"

	para "aber wir haben"
	line "nie"
	line "von einem Loch"
	cont "ge-"
	cont "hört, das sich"
	cont "dort geöffnet"

	para "haben soll."
	line "Jemand"
	line "muss das absicht-"
	cont "lich getan haben."
	done







WiseTriosRoomSage3BlocksExitText:
	text "Zutritt zum ZINN-"
	line "TURM haben jene,"

	para "die den ORDEN der"
	line "#mon-ARENA von"
	cont "TEAK CITY tragen."

	para "Da SUICUNE,"
	line "RAIKOU"
	line "und ENTEI jetzt"

	para "aber erwacht"
	line "sind,"
	line "muss ich dich"

	para "bitten, nicht"
	line "einzutreten!"
	done







WiseTriosRoomSage3Text:
	text "Wir, das TRIO der"
	line "WEISEN, sind die"

	para "Hüter der legen-"
	line "dären #mon."
	done







ElderGakuSeenText:
	text "Die Legende"
	line "besagt,"
	line "dass bei einem"

	para "Trainer, der die"
	line "Seelen der #mon"

	para "berühren kann,"
	line "ein"
	line "#mon erscheint,"

	para "um diesen Trainer"
	line "auf die Probe zu"

	para "stellen am"
	line "Glockenturm."

	para "Die Legende ist"
	line "wahr geworden!"

	para "Das legendäre"
	line "#mon SUICUNE"
	cont "ist erschienen!"

	para "Wir, das TRIO der"
	line "WEISEN, werden"
	line "prüfen, ob du"

	para "würdig bist,"
	line "einzutreten!"
	done

ElderGakuBeatenText:
	text "Stärker als wir"
	line "dachten? Wer"
	cont "weiß…"
	done
ElderMasaSeenText:
	text "Kann man dir die"
	line "Wahrheit"
	cont "anvertrauen?"

	para "Ich muss prüfen,"
	line "ob du würdig"
	cont "bist."
	done
ElderMasaBeatenText:
	text "…Ich sage dir"
	line "die Wahrheit…"
	done
ElderKojiSeenText:
	text "Beweise mir deine"
	line "Kraft!"
	done
ElderKojiBeatenText:
	text "Zu stark!"
	line "Warum?"
	done
SageKojiAfterBattleQuestionText:
	text "Du… bist du der"
	line "Trainer, der von"

	para "dem legendären"
	line "#mon erwartet"
	cont "wird?"
	done







SageKojiAfterBattleSpeechText:
	text "Ich verstehe…"

	para "Wir, das TRIO der"
	line "WEISEN, sind ver-"
	cont "antwortlich für"
	cont "den Schutz der"

	para "legendären #-"
	line "MON. Wir"
	cont "gestatten"

	para "nur jenen"
	line "Zutritt,"
	line "die eine reine"

	para "Seele und wahre"
	line "Kraft besitzen."

	para "Schreite voran"
	line "und"
	line "betritt den"
	cont "ZINNTURM."

	para "SUICUNE wird dich"
	line "prüfen."
	done







SageKojiAfterBattleFinalText:
	text "Schreite voran!"

	para "SUICUNE wird dich"
	line "prüfen."
	done







