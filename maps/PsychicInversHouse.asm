PsychicInversHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, ROUTE_16_WEST, 1
	warp_event  3,  7, ROUTE_16_WEST, 1

	def_coord_events

	def_bg_events
	bg_event  7,  1, BGEVENT_JUMPSTD, difficultbookshelf

	def_object_events
	object_event  2,  2, SPRITE_PSYCHIC, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, PsychicInverScript, -1
	object_event  6,  3, SPRITE_HEX_MANIAC, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, PsychicInversHouseHexManiacText, -1

	object_const_def
	const PSYCHICINVERSHOUSE_INVER

PsychicInverScript:
	checkflag ENGINE_FOUGHT_PSYCHIC_INVER
	iftrue_jumptextfaceplayer PsychicInverTomorrowText
	faceplayer
	opentext
	writetext PsychicInverGreetingText
	yesorno
	iffalse_jumpopenedtext PsychicInverNoText
	writetext PsychicInverYesText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_PSYCHIC_INVER
	winlosstext PsychicInverBeatenText, 0
	setlasttalked PSYCHICINVERSHOUSE_INVER
	special PickPsychicInverParty
	loadtrainer INVER, 1
	loadvar VAR_BATTLETYPE, BATTLETYPE_INVERSE
	startbattle
	reloadmapafterbattle
	opentext
	readmem wInverseBattleScore
	ifequalfwd 0, .Score0
	ifgreater 127, .Score0 ; negative
	ifless 4, .Score1_3
	ifless 7, .Score4_6
	ifless 10, .Score7_9
	writetext InverseBattle10PointRewardText
	setval RARE_CANDY
.Reward
	waitbutton
	writetext PsychicInverRewardText
.GiveReward
	promptbutton
	verbosegiveitem ITEM_FROM_MEM
	endtext

.Score0
	writetext InverseBattle0PointRewardText
	waitbutton
	writetext PsychicInverZeroRewardText
	setval ORAN_BERRY
	sjump .GiveReward

.Score1_3
	writetext InverseBattle1_3PointRewardText
	setval SITRUS_BERRY
	sjump .Reward

.Score4_6
	writetext InverseBattle4_6PointRewardText
	random MARANGABERRY - LUM_BERRY + 1 ; excludes early common berries
	addval LUM_BERRY
	sjump .Reward

.Score7_9
	writetext InverseBattle7_9PointRewardText
	random NUM_STONES
	addval FIRST_STONE
	sjump .Reward

PsychicInverGreetingText:
	text "Oh. Hier hätte ich"
	line "keinen Besucher"
	cont "erwartet. Hmm…"

	para "Sollen wir einen"
	line "etwas seltsamen"
	cont "Kampf führen?"

	para "Ich nenne das"
	line "einen"
	cont "Invers-Kampf!"

	para "Was meinst du?"
	line "Möchtest du einen"
	cont "Invers-Kampf"
	cont "ausprobieren?"
	done

PsychicInverNoText:
	text "Ach, verstehe…"
	line "Schade."

	para "Wenn du es dir"
	line "anders überlegst,"
	cont "komm wieder."
	done

PsychicInverYesText:
	text "Sehr effektive"
	line "Attacken werden"
	cont "kaum effektiv, und"
	cont "umgekehrt."
	done

PsychicInverBeatenText:
	text "Dieser Kampf hat"
	line "mich wohl noch"

	para "mehr erschöpft als"
	line "meine #mon…"
	done

InverseBattle0PointRewardText:
	text "Ich weiß nicht, ob"
	line "du Invers- Kämpfe"
	cont "verstehst…"
	done

InverseBattle1_3PointRewardText:
	text "Du verstehst"
	line "Invers-Kämpfe…"
	done

InverseBattle4_6PointRewardText:
	text "Du verstehst"
	line "Invers-Kämpfe"
	cont "ziemlich gut."
	done

InverseBattle7_9PointRewardText:
	text "Du verstehst"
	line "Invers-Kämpfe"
	cont "perfekt!"
	done

InverseBattle10PointRewardText:
	text "Du bist ein"
	line "Experte bei"
	cont "Invers- Kämpfen."

	para "Ich bin kein Match"
	line "für dich."
	done

PsychicInverZeroRewardText:
	text "Trotzdem schenke"
	line "ich dir etwas,"

	para "also komm bald"
	line "wieder und"
	cont "versuch's noch"
	cont "einmal!"
	done

PsychicInverRewardText:
	text "Für einen Gegner"
	line "wie dich habe"

	para "ich etwas! Hier,"
	line "nimm!"
	done

PsychicInverTomorrowText:
	text "Diese seltsame"
	line "Kraft, die Typen-"

	para "verhältnisse"
	line "umkehrt…"

	para "Ich kann sie nicht"
	line "oft einsetzen."

	para "Komm bitte morgen"
	line "wieder."
	done

PsychicInversHouseHexManiacText:
	text "Mein Bruder hat"
	line "eine mysteriöse"
	cont "Kraft!"

	para "Er kann"
	line "Typenverhältnisse"
	cont "umkehren!"
	cont "Verrückt, oder?"

	para "Sehr effektive und"
	line "kaum effektive"

	para "Attacken werden"
	line "vertauscht!"
	done
