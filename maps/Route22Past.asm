Route22Past_MapScriptHeader:
	def_scene_scripts
	scene_script Route22PastSilverGiovanniScene, SCENE_ROUTE22PAST_SILVER_GIOVANNI

	def_callbacks

	def_warp_events

	def_coord_events

	def_bg_events

	def_object_events
	object_event  6,  8, SPRITE_CELEBI, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  5,  7, SPRITE_LYRA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  5,  2, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  2,  2, SPRITE_GIOVANNI, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1

	object_const_def
	const ROUTE22PAST_CELEBI
	const ROUTE22PAST_LYRA
	const ROUTE22PAST_RIVAL
	const ROUTE22PAST_GIOVANNI

Route22PastSilverGiovanniScene:
	sdefer .Script
	end

.Script:
	pause 30
	applymovement PLAYER, Route22Past_PlayerLooksAroundMovementData
	showemote EMOTE_SHOCK, ROUTE22PAST_LYRA, 15
	showtext Route22PastLyraWhereAreWeText
	applymovement ROUTE22PAST_LYRA, Route22Past_LyraLooksAroundMovementData
	showtext Route22PastLyraIlexForestDisappearedText
	applymovement ROUTE22PAST_LYRA, Route22Past_LyraStepDownMovementData
	turnobject PLAYER, LEFT
	showtext Route22PastLyraPokeGearText
	applymovement ROUTE22PAST_LYRA, Route22Past_LyraStepDownTurnHeadRigthMovementData
	turnobject PLAYER, DOWN
	showtext Route22PastLyraExplainsTimeTravelText
	showemote EMOTE_SHOCK, ROUTE22PAST_LYRA, 15
	applymovement ROUTE22PAST_LYRA, Route22Past_LyraMoveUpToHearMovementData
	showtext Route22PastLyraHearsSomeoneText
	applymovement PLAYER, Route22Past_PlayerStepUpToLyraMovementData
	follow ROUTE22PAST_LYRA, PLAYER
	applymovement ROUTE22PAST_LYRA, Route22Past_LyraApproachesRivalMovementData
	turnobject ROUTE22PAST_LYRA, UP
	turnobject PLAYER, UP
	stopfollow
	applyonemovement ROUTE22PAST_CELEBI, step_up
	special Special_FadeOutMusic
	applyonemovement ROUTE22PAST_RIVAL, slow_step_left
	showtext Route22PastRivalQuestionsGiovanniText
	turnobject ROUTE22PAST_GIOVANNI, RIGHT
	showtext Route22PastGiovanniRivalArgumentText
	applyonemovement ROUTE22PAST_RIVAL, slow_step_left
	showtext Route22PastRivalProtestsText
	turnobject ROUTE22PAST_GIOVANNI, LEFT
	showtext Route22PastGiovanniGoodbyeText
	applymovement ROUTE22PAST_GIOVANNI, Route22Past_GiovanniLeavesMovementData
	pause 15
	applyonemovement ROUTE22PAST_RIVAL, slow_step_left
	showtext Route22PastRivalRantText
	special Special_FadeOutMusic
	playmusic MUSIC_RIVAL_ENCOUNTER
	applymovement ROUTE22PAST_RIVAL, ROUTE22PAST_RIVALRunsIntoPlayerMovementData
	showemote EMOTE_SHOCK, ROUTE22PAST_RIVAL, 15
	showtext Route22PastRivalInsultText
	playsound SFX_TACKLE
	applymovement PLAYER, ROUTE22PAST_RIVALShovesPlayerDownMovementData
	turnobject ROUTE22PAST_LYRA, DOWN
	applymovement ROUTE22PAST_RIVAL, ROUTE22PAST_RIVALLeavesMovementData
	special RestartMapMusic
	applymovement ROUTE22PAST_LYRA, Route22Past_LyraMeetsPlayerMovementData
	showtext Route22PastLyraConclusionText
	cry CELEBI
	applymovement ROUTE22PAST_CELEBI, Route22Past_CelebiHopsMovementData
	waitsfx
	playsound SFX_GAME_FREAK_LOGO_GS
	special FadeOutPalettes
	special LoadMapPalettes
	pause 30
	special FadeInPalettes_EnableDynNoApply
	waitsfx
	showemote EMOTE_SHOCK, PLAYER, 15
	applymovement ROUTE22PAST_LYRA, Route22Past_LyraLooksAroundAgainMovementData
	turnobject ROUTE22PAST_LYRA, DOWN
	showtext Route22PastLyraOhNoText
	playsound SFX_PROTECT
	applymovement ROUTE22PAST_CELEBI, Route22Past_CelebiFloatsMovementData
	waitsfx
	playsound SFX_GAME_FREAK_LOGO_GS
	special FadeOutPalettes
	pause 30
	waitsfx
	clearevent EVENT_GIOVANNIS_CAVE_CELEBI
	clearevent EVENT_GIOVANNIS_CAVE_LYRA
	clearevent EVENT_GIOVANNIS_CAVE_GIOVANNI
	setmapscene GIOVANNIS_CAVE, SCENE_GIOVANNISCAVE_PAST_GIOVANNI
	warp GIOVANNIS_CAVE, 5, 5
	end

Route22Past_PlayerLooksAroundMovementData:
	turn_head_left
	step_sleep_8
	step_sleep_8
	step_sleep_8
	turn_head_right
	step_sleep_8
	step_sleep_8
	step_sleep_8
	turn_head_up
	step_sleep_8
	step_sleep_8
	step_sleep_8
	step_end

Route22Past_LyraLooksAroundMovementData:
	slow_step_up
	step_sleep_8
	step_sleep_8
	step_sleep_8
Route22Past_LyraLooksAroundAgainMovementData:
	turn_head_left
	step_sleep_8
	step_sleep_8
	step_sleep_8
	turn_head_right
	step_sleep_8
	step_sleep_8
	step_sleep_8
	step_end

Route22Past_LyraStepDownMovementData:
	slow_step_down
	step_end

Route22Past_LyraStepDownTurnHeadRigthMovementData:
	slow_step_down
	turn_head_right
	step_end

Route22Past_LyraMoveUpToHearMovementData:
	slow_step_up
	slow_step_up
	step_end

Route22Past_PlayerStepUpToLyraMovementData:
	slow_step_up
	step_end

Route22Past_LyraApproachesRivalMovementData:
	slow_step_up
	slow_step_up
	slow_step_left
	step_end

Route22Past_GiovanniLeavesMovementData:
	slow_step_left
	slow_step_left
	step_end

ROUTE22PAST_RIVALRunsIntoPlayerMovementData:
	step_right
	step_right
	step_right
	step_down
	step_end

ROUTE22PAST_RIVALShovesPlayerDownMovementData:
	turn_head_up
	fix_facing
	jump_step_down
	step_sleep_6
	turn_head_left
	step_right
	remove_fixed_facing
	step_end

ROUTE22PAST_RIVALLeavesMovementData:
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end

Route22Past_LyraMeetsPlayerMovementData:
	step_right
	step_down
	step_down
	turn_head_right
	step_end

Route22Past_CelebiHopsMovementData:
	step_left
	turn_head_down
	step_end

Route22Past_CelebiFloatsMovementData:
	turn_head_down
	fix_facing
	slow_step_up
	slow_step_up
	slow_step_up
	remove_fixed_facing
	step_end

Route22PastLyraWhereAreWeText:
	text "Lyra: Wo sind"
	line "wir…?"
	done

Route22PastLyraIlexForestDisappearedText:
	text "Lyra: Der"
	line "Steinei-"
	line "chenwald ist weg!"

	para "…So ist es nicht."
	line "Wir wurden wo-"
	cont "andershin"
	cont "versetzt…?"
	done

Route22PastLyraPokeGearText:
	text "Lyra: <PLAYER>,"
	line "mein #gear-"
	cont "Radio"

	para "zeigt ein Datum"
	line "von vor drei"
	cont "Jahren!"
	done

Route22PastLyraExplainsTimeTravelText:
	text "Ist das… sehe ich"
	line "da…"
	cont "Celebi?"

	para "Das erklärt"
	line "alles!"
	line "Celebi muss seine"

	para "Kraft genutzt"
	line "haben, um uns in"
	cont "die Vergangenheit"
	cont "zu bringen!"
	done

Route22PastLyraHearsSomeoneText:
	text "<PLAYER>, ich"
	line "höre noch"
	line "jemanden."

	para "Mal sehen, wer"
	line "das ist!"
	done

Route22PastRivalQuestionsGiovanniText:
	text "<RIVAL>: Du hast"
	line "mir gesagt… du"

	para "bist der Beste"
	line "der Welt!"

	para "Willst du"
	line "aufgeben?"

	para "Was willst du"
	line "jetzt tun?"
	done

Route22PastGiovanniRivalArgumentText:
	text "…… …… ……"

	para "Man muss seine"
	line "Niederlage"
	cont "anerkennen,"

	para "bevor man"
	line "weitermachen"
	line "kann…"

	para "Ich gehe vorerst"
	line "allein…"

	para "Damit ich eines"
	line "Tages eine"

	para "stärkere Organi-"
	line "sation gründe!"

	para "<RIVAL>: Was an"
	line "dir war denn"
	cont "Nummer eins?"

	para "So viele sammeln"
	line "und dann von"

	para "einem Kind"
	line "besiegt werden!"

	para "…… …… ……"

	para "Das Potenzial"
	line "vieler vereinen"

	para "ergibt große"
	line "Macht…"

	para "So ist eine"
	line "Organisation!"

	para "Ich habe… das"
	line "Potenzial meiner"

	para "Untergebenen"
	line "nicht genutzt…"

	para "Aber eines Tages"
	line "wirst du die"

	para "Wiederkehr von"
	line "mir und Team"
	cont "Rocket erleben!"
	done

Route22PastRivalProtestsText:
	text "<RIVAL>: Ich"
	line "verstehe dich"
	cont "nicht!"

	para "Du ergibst"
	line "einfach keinen"
	cont "Sinn!"
	done

Route22PastGiovanniGoodbyeText:
	text "…… …… ……"

	para "Eines Tages wirst"
	line "du es verstehen."
	done

Route22PastRivalRantText:
	text "<RIVAL>: Ich will"
	line "dich nicht"
	cont "verstehen!"

	para "Ich werde nie"
	line "so werden wie"
	cont "du!"

	para "Alleine ein"
	line "Feigling und"

	para "vor anderen"
	line "ein Tyrann!"

	para "Ich werde stark!"
	line "Ganz alleine"

	para "werde ich ein"
	line "stärkerer Mensch!"

	para "Ganz alleine!"
	done

Route22PastRivalInsultText:
	text "<RIVAL>: …Was"
	line "starrst du so?"
	done

Route22PastLyraConclusionText:
	text "Lyra: Wer glaubt"
	line "er eigentlich?"

	para "Das war"
	line "unnötig!"

	para "Aber sie sprachen"
	line "von der"

	para "Wiederkehr von"
	line "Team Rocket…"

	para "Team Rocket wurde"
	line "vor drei Jahren"

	para "von einem Kind"
	line "aus KANTO"
	cont "besiegt."

	para "Das ist also"
	line "wirklich die"
	cont "Vergangenheit!"
	done

Route22PastLyraOhNoText:
	text "Lyra: Ach nein!"
	line "Es passiert"
	cont "wieder…!"

	para "Celebis"
	line "Zeitreise!"
	done
