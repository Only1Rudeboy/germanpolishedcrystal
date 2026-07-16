MystriStage_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_MYSTRISTAGE_NOOP
	scene_const SCENE_MYSTRISTAGE_ARCEUS_EVENT

	def_callbacks

	def_warp_events
	warp_event  6, 19, SINJOH_RUINS, 1
	warp_event  7, 19, SINJOH_RUINS, 1

	def_coord_events
	coord_event  6, 11, SCENE_MYSTRISTAGE_ARCEUS_EVENT, MystriStageTrigger1Script
	coord_event  7, 11, SCENE_MYSTRISTAGE_ARCEUS_EVENT, MystriStageTrigger2Script

	def_bg_events

	def_object_events
	object_event  6, 10, SPRITE_CYNTHIA, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, MystriStageCynthiaSafeguardScript, EVENT_LISTENED_TO_CYNTHIA_INTRO
	object_event  7,  7, SPRITE_CYNTHIA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, MystriStageCynthiaScript, EVENT_MYSTRI_STAGE_CYNTHIA
	object_event  6,  8, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, EGG, -1, PAL_MON_BLUE, OBJECTTYPE_SCRIPT, NO_FORM, MystriStageEggScript, EVENT_MYSTRI_STAGE_EGG

	object_const_def
	const MYSTRISTAGE_CYNTHIA1
	const MYSTRISTAGE_CYNTHIA2
	const MYSTRISTAGE_EGG

MystriStageTrigger2Script:
	applyonemovement PLAYER, step_up
MystriStageTrigger1Script:
	faceobject PLAYER, MYSTRISTAGE_CYNTHIA1
	pause 10
	showemote EMOTE_SHOCK, MYSTRISTAGE_CYNTHIA1, 15
	pause 10
	faceobject MYSTRISTAGE_CYNTHIA1, PLAYER
MystriStageCynthiaSafeguardScript:
	showtext MystriStageCynthiaIntroText
	follow MYSTRISTAGE_CYNTHIA1, PLAYER
	applymovement MYSTRISTAGE_CYNTHIA1, MystriStageMovementData_CynthiaStepsUp
	stopfollow
	turnobject MYSTRISTAGE_CYNTHIA1, LEFT
	turnobject PLAYER, RIGHT
	showtext MystriStageCynthiaSpeechText
	showemote EMOTE_SHOCK, MYSTRISTAGE_CYNTHIA1, 15
	showtext MystriStageCynthiaLeadText2
	pause 10
	appear MYSTRISTAGE_CYNTHIA2
	disappear MYSTRISTAGE_CYNTHIA1
	setlasttalked MYSTRISTAGE_CYNTHIA2
	setevent EVENT_LISTENED_TO_CYNTHIA_INTRO
	setscene SCENE_MYSTRISTAGE_NOOP
	; fallthrough

MystriStageCynthiaScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CYNTHIA
	iftruefwd MystriStageBeatCynthiaScript
	writetext MystriStageCynthiaIdeaText
	waitbutton
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse_jumpopenedtext MystriStageCynthiaNotNowText
	writetext MystriStageCynthiaChallengeText
	yesorno
	iffalse_jumpopenedtext MystriStageCynthiaNoText
	writetext MystriStageCynthiaYesText
	waitbutton
	closetext
	winlosstext MystriStageCynthiaWinText, 0
	setlasttalked MYSTRISTAGE_CYNTHIA2
	loadtrainer CYNTHIA, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CYNTHIA
	opentext
MystriStageBeatCynthiaScript:
	checkevent EVENT_GOT_WISE_GLASSES_FROM_CYNTHIA
	iftrue_jumpopenedtext MystriStageCynthiaFinalText
	writetext MystriStageCynthiaItemText
	waitbutton
	verbosegiveitem WISE_GLASSES
	iffalse_endtext
	setevent EVENT_GOT_WISE_GLASSES_FROM_CYNTHIA
	writetext MystriStageCynthiaAfterText
	waitbutton
	closetext
	pause 15
	showemote EMOTE_SHOCK, MYSTRISTAGE_CYNTHIA2, 15
	special Special_FadeOutMusic
	pause 15
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	pause 15
	playsound SFX_UNKNOWN_60
	waitsfx
	pause 20
	playsound SFX_METRONOME
	waitsfx
	special Special_FadeInQuickly
	pause 10
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	playsound SFX_PROTECT
	waitsfx
	special Special_FadeInQuickly
	pause 10
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	pause 20
	playsound SFX_EGG_HATCH
	waitsfx
	appear MYSTRISTAGE_EGG
	faceplayer
	pause 30
	special RestartMapMusic
	special Special_FadeInQuickly
	pause 20
	turnobject MYSTRISTAGE_CYNTHIA2, DOWN
	pause 40
	jumpthistextfaceplayer

	text "CYNTHIA: Könnte"
	line "das … ein Ei sein?"
	para "Haben wir gerade"
	line "den Moment"
	para "miterlebt, als ein"
	line "Ei in diese Welt"
	cont "kam?"
	para "Ein Moment, den"
	line "noch niemand"
	cont "gesehen hat?"
	done

MystriStageEggScript:
	special GiveMystriEgg
	iffalse_jumptext MystriStageNoRoomText
	disappear MYSTRISTAGE_EGG
	opentext
	writetext MystriStageEggText
	playsound SFX_KEY_ITEM
	waitsfx
	ifequalfwd 1, .InParty
	special Special_CurBoxFullCheck
	iffalsefwd .BoxNotFull
	farwritetext _CurBoxFullText
.BoxNotFull
	special GetCurBoxName
	farwritetext _EggSentToPCText
.InParty
	waitendtext

MystriStageCynthiaIntroText:
	text "Mein Name ist"
	line "CYNTHIA. Ich bin"
	cont "#MON-Trainerin."
	para "Und du?"
	para "… Ich verstehe."
	line "Die Kraft der"
	cont "Unown hat dich"
	cont "hierher gebracht."
	done

MystriStageCynthiaSpeechText:
	text "CYNTHIA: Das sind"
	line "die Sinjoh-Ruinen."
	para "Vor langer Zeit …"
	line "kamen Menschen aus"
	para "Sinnoh, meiner"
	line "Heimatregion, um"
	cont "hier zu leben."
	para "Sie sehnten sich"
	line "wohl nach Hause,"
	para "und bauten diesen"
	line "Tempel, um ihre"
	cont "Traditionen zu"
	cont "ehren."
	para "Wir stehen auf der"
	line "Mystri-Bühne."
	para "Früher feierte man"
	line "hier mit Musik und"
	cont "Tanz."
	para "CYNTHIA: Ich"
	line "erforsche Mythen"
	para "über alte Orte wie"
	line "die Sinjoh-Ruinen."
	para "Einer behauptet,"
	line "diese Bühne sei"
	para "erfüllt von der"
	line "Kraft der"
	cont "Schöpfung."
	para "Es heißt, wenn der"
	line "Führer die"
	para "Mystri-Bühne"
	line "betritt …"
	done

MystriStageCynthiaLeadText2:
	text "CYNTHIA: Was? Du"
	line "hast diese"

	para "Phrase in den"
	line "Alph-Ruinen"
	cont "gelesen?"

	para "Das ist sehr"
	line "interessant."

	para "Könnte der Führer"
	line "ein #MON sein?"
	cont "Oder ein Mensch?"
	done

MystriStageCynthiaIdeaText:
	text "CYNTHIA: … Ich hab"
	line "eine Idee. Nenn es"
	para "Trainer-Intuition."
	para "Wenn du und ich"
	line "hier kämpfen,"
	para "wird etwas"
	line "passieren."
	done

MystriStageCynthiaNotNowText:
	text "CYNTHIA: Aber ich"
	line "denke nicht, dass"

	para "wir jetzt kämpfen"
	line "sollten. Du bist"
	cont "nicht bereit."

	para "Komm wieder, wenn"
	line "du die TOP VIER"
	cont "besiegt hast."
	done

MystriStageCynthiaChallengeText:
	text "CYNTHIA: Bist du"
	line "bereit, mein"
	cont "Gegner zu sein?"
	done

MystriStageCynthiaNoText:
	text "CYNTHIA: Komm"
	line "wieder, wenn du"
	cont "bereit bist."
	done

MystriStageCynthiaYesText:
	text "CYNTHIA: Bevor ich"
	line "mein #MON"
	cont "schicke,"
	para "beginnt mein Herz"
	line "immer zu rasen …"
	done

MystriStageCynthiaWinText:
	text "Ich kann mich"
	line "nicht erinnern,"
	cont "wann ich"
	para "zuletzt so"
	line "übertrumpft wurde!"
	done

MystriStageCynthiaItemText:
	text "CYNTHIA: Das war"
	line "über meine"
	cont "Erwartungen!"

	para "Was für ein"
	line "außergewöhnlicher"
	cont "Kampf!"

	para "Bitte nimm dieses"
	line "Item. Ich glaube,"

	para "du weißt, wie man"
	line "es gut nutzt."
	done

MystriStageCynthiaAfterText:
	text "CYNTHIA: Hat unser"
	line "Kampf die"
	cont "Mystri-Bühne"
	cont "beeinflusst?"
	done


MystriStageCynthiaFinalText:
	text "CYNTHIA: Ein Ei"
	line "ist die Wiege"
	cont "jedes Lebewesens."
	para "Der Planet selbst"
	line "ist gewissermaßen"
	cont "ein Ei …"
	para "Leben aus einem Ei"
	line "wird einmal ein"
	para "Ende finden … um"
	line "von neuem zu"
	cont "beginnen …"
	done

MystriStageEggText:
	text "<PLAYER> findet"
	line "ein mysteriöses"
	cont "Ei!"
	done

MystriStageNoRoomText:
	text "Du hast keinen"
	line "Platz dafür -nicht"
	cont "mal in der Box!"
	done

MystriStageMovementData_CynthiaStepsUp:
	step_up
	step_up
	step_up
	step_right
	step_end
