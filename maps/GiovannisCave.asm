GiovannisCave_MapScriptHeader:
	def_scene_scripts
	scene_script DoNothingScript, SCENE_GIOVANNISCAVE_NOOP
	scene_script GiovannisCavePastBattleScene, SCENE_GIOVANNISCAVE_PAST_GIOVANNI

	def_callbacks

	def_warp_events
	warp_event  5,  7, TOHJO_FALLS, 3

	def_coord_events

	def_bg_events
	bg_event  5,  2, BGEVENT_READ, GiovannisCaveRadioScript
	bg_event  2,  6, BGEVENT_ITEM + BERSERK_GENE, EVENT_GIOVANNIS_CAVE_HIDDEN_BERSERK_GENE

	def_object_events
	object_event  5,  6, SPRITE_CELEBI, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_GIOVANNIS_CAVE_CELEBI
	object_event  4,  5, SPRITE_LYRA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_GIOVANNIS_CAVE_LYRA
	object_event  5,  3, SPRITE_GIOVANNI, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_GIOVANNIS_CAVE_GIOVANNI
	smashrock_event  3,  6
	smashrock_event  6,  2

	object_const_def
	const GIOVANNISCAVE_CELEBI
	const GIOVANNISCAVE_LYRA
	const GIOVANNISCAVE_GIOVANNI

GiovannisCavePastBattleScene:
	sdefer .Script
	end

.Script:
	pause 30
	turnobject PLAYER, UP
	turnobject GIOVANNISCAVE_LYRA, UP
	showemote EMOTE_SHOCK, GIOVANNISCAVE_GIOVANNI, 15
	turnobject GIOVANNISCAVE_GIOVANNI, DOWN
	showtext GiovannisCaveGiovanniIntroText
	applyonemovement GIOVANNISCAVE_GIOVANNI, slow_step_down
	showtext GiovannisCaveGiovanniMemoriesText
	turnobject GIOVANNISCAVE_LYRA, RIGHT
	showtext GiovannisCaveLyraQuestionsText
	showemote EMOTE_SHOCK, GIOVANNISCAVE_LYRA, 15
	showtext GiovannisCaveLyraRecognizesGiovanniText
	playmusic MUSIC_ROCKET_OVERTURE
	turnobject GIOVANNISCAVE_LYRA, UP
	turnobject GIOVANNISCAVE_GIOVANNI, UP
	showtext GiovannisCaveBroadcastText
	turnobject GIOVANNISCAVE_GIOVANNI, DOWN
	showtext GiovannisCaveGiovanniIMustGoText
	setmapscene GIOVANNIS_CAVE, SCENE_GIOVANNISCAVE_NOOP
	clearevent EVENT_TIME_TRAVELING
	winlosstext GiovannisCaveGiovanniBeatenText, 0
	setlasttalked GIOVANNISCAVE_GIOVANNI
	loadtrainer GIOVANNI, GIOVANNI2
	startbattle
	reloadmapafterbattle
	setevent EVENT_TIME_TRAVELING
	applymovement GIOVANNISCAVE_GIOVANNI, GiovannisCave_GiovanniStepsBackMovementData
	showtext GiovannisCaveGiovanniAfterText
	applymovement GIOVANNISCAVE_GIOVANNI, GiovannisCave_GiovanniLeavesMovementData
	playsound SFX_ENTER_DOOR
	disappear GIOVANNISCAVE_GIOVANNI
	waitsfx
	turnobject PLAYER, DOWN
	turnobject GIOVANNISCAVE_LYRA, DOWN
	showtext GiovannisCaveBroadcastAfterText
	applyonemovement GIOVANNISCAVE_LYRA, slow_step_down
	showtext GiovannisCaveLyraFeelsSorryText
	playsound SFX_GAME_FREAK_LOGO_GS
	special FadeOutPalettes
	special LoadMapPalettes
	pause 30
	special FadeInPalettes_EnableDynNoApply
	waitsfx
	showemote EMOTE_SHOCK, PLAYER, 15
	applymovement PLAYER, GiovannisCave_PlayerStepsAsideMovementData
	applymovement GIOVANNISCAVE_LYRA, GiovannisCave_LyraLooksAroundMovementData
	showtext GiovannisCaveLyraWantsToLeaveText
	playsound SFX_PROTECT
	applymovement GIOVANNISCAVE_CELEBI, GiovannisCave_CelebiFloatsMovementData
	waitsfx
	playsound SFX_GAME_FREAK_LOGO_GS
	special FadeOutPalettes
	pause 30
	waitsfx
	disappear GIOVANNISCAVE_CELEBI
	disappear GIOVANNISCAVE_LYRA
	warp CINNABAR_LAB, 30, 16
	end

GiovannisCaveRadioScript:
	checkevent EVENT_TIME_TRAVEL_FINISHED
	iftrue_jumptext GiovannisCaveRadioAfterTimeTravelText
	jumpthistext

	text "Hier steht ein"
	line "Radio, das nicht"
	cont "mehr funktioniert"
	cont "…"
	done

GiovannisCaveRadioAfterTimeTravelText:
	text "Du kannst das"
	line "Radio nicht"
	cont "einschalten."

	para "GIOVANNI muss es"
	line "hier gelassen"
	cont "haben…"
	done

GiovannisCave_GiovanniStepsBackMovementData:
	turn_head_down
	fix_facing
	slow_step_up
	remove_fixed_facing
	slow_step_right
	step_end

GiovannisCave_GiovanniLeavesMovementData:
	step_down
	step_down
	step_down
	step_down
	step_left
	turn_head_down
	step_end

GiovannisCave_PlayerStepsAsideMovementData:
	turn_head_left
	fix_facing
	slow_step_right
	remove_fixed_facing
	step_end

GiovannisCave_LyraLooksAroundMovementData:
	turn_head_left
	step_sleep_8
	step_sleep_8
	step_sleep_8
	turn_head_right
	step_end

GiovannisCave_CelebiFloatsMovementData:
	turn_head_down
	fix_facing
	slow_step_up
	slow_step_up
	slow_step_up
	remove_fixed_facing
	step_end

GiovannisCaveGiovanniIntroText:
	text "…"
	para "Ich weiß nicht,"
	line "warum du hierher"
	para "gekommen bist,"
	line "aber ich muss dich"
	para "warnen: Das ist"
	line "kein Ort für Kids"
	cont "wie dich."
	para "LYRA: Hä? Das ist"
	line "der Typ, mit dem"
	para "wir gerade"
	line "gestritten haben!"
	done

GiovannisCaveGiovanniMemoriesText:
	text "Du hast einen"
	line "bestimmten Blick…"

	para "Ich erinnere mich"
	line "an dich!"

	para "Vor drei Jahren"
	line "hat ein Kind"
	cont "unsere"

	para "Pläne ruiniert,"
	line "aber du hast"
	cont "unsere"

	para "Probleme von"
	line "Anfang an"
	cont "verursacht!"

	para "…"

	para "Ich bin auf dem"
	line "Weg nach Dukatia"
	cont "City,"

	para "um dem Ruf zu"
	line "folgen und mein"

	para "Team wieder zu"
	line "treffen."

	para "Willst du mir"
	line "wieder in den Weg"
	cont "kommen?"
	done

GiovannisCaveLyraQuestionsText:
	text "LYRA: Vor drei"
	line "Jahren…? Dukatia"
	cont "City…?"
	done

GiovannisCaveLyraRecognizesGiovanniText:
	text "Das ist der, den"
	line "Team Rocket"
	para "erreichen wollte!"
	para "Ihr Boss,"
	line "GIOVANNI!"
	para "<PLAYER>, wann hast"
	line "du GIOVANNI schon"
	cont "mal getroffen…?"
	done

GiovannisCaveBroadcastText:
	text "' … … Ähem, wir"
	line "sind Team Rocket!"
	cont "Nach drei Jahren"
	cont "Vorbereitung sind"
	cont "wir aus der Asche"
	cont "auferstanden!"
	cont "GIOVANNI! Hörst du"
	cont "uns? Wir haben es"
	cont "geschafft! Wo ist"
	cont "unser Boss? Hört"
	cont "er zu?'"
	para "LYRA: Team Rocket"
	line "hat gerade den"
	para "Funkturm besetzt …"
	para "Du bist dort, aber"
	line "auch hier …"
	done

GiovannisCaveGiovanniIMustGoText:
	text "GIOVANNI: Meine"
	line "alten Verbündeten"
	cont "brauchen mich…"
	para "Wir werden den"
	line "Fehler von vor"
	cont "drei Jahren nicht"
	cont "wiederholen!"
	para "Team Rocket wird"
	line "wiedergeboren!"
	para "LYRA: Hah! <PLAYER>"
	line "hat dich schon"
	cont "gestoppt! …Wird"
	cont "stoppen."
	para "Wird gestoppt"
	line "haben…?"
	para "…Zeitreisen ist"
	line "verwirrend!"
	para "GIOVANNI: Genug"
	line "Geschwätz! Aus"
	cont "meinem Weg!"
	done

GiovannisCaveGiovanniBeatenText:
	text "Was in aller Welt"
	line "bist du?"
	done

GiovannisCaveGiovanniAfterText:
	text "GIOVANNI: Wie ist"
	line "das möglich …?"
	para "Die letzten drei"
	line "Jahre waren"
	cont "umsonst …?"
	para "Wie kann ein Kind"
	line "wie du meinen"
	para "Traum schon wieder"
	line "zerstören?"
	done

GiovannisCaveBroadcastAfterText:
	text "' … … Hey! Wo ist"
	line "GIOVANNI hin? Ob"
	cont "er unserer Sendung"
	cont "zuhört … … '"
	done

GiovannisCaveLyraFeelsSorryText:
	text "LYRA: Sie rufen"
	line "ständig nach ihrem"
	cont "Boss."
	para "Es tut mir leid,"
	line "dass sie nicht"
	cont "wissen, dass er"
	para "nicht kommt."
	para "Aber gerade"
	line "besiegst du sie,"
	cont "<PLAYER>!"
	done

GiovannisCaveLyraWantsToLeaveText:
	text "LYRA: Nicht schon"
	line "wieder…! Ich hab"

	para "genug! Bitte lass"
	line "uns zurück in"
	cont "unsere Zeit!"
	done
