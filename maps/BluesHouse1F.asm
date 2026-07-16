BluesHouse1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, PALLET_TOWN, 2
	warp_event  3,  7, PALLET_TOWN, 2
	warp_event  7,  0, BLUES_HOUSE_2F, 1

	def_coord_events

	def_bg_events
	bg_event  5,  1, BGEVENT_UP, RedsHouse1FTVScript

	def_object_events
	object_event  2,  3, SPRITE_DAISY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, DaisyScript, -1

DaisyScript:
	readvar VAR_HOUR
	ifequalfwd 15, .Massage
	checkflag ENGINE_TEA_IN_BLUES_HOUSE
	iftrue .After
	jumpthistextfaceplayer

	; GSC-DE Dump 6418
	text "SARAH: Hi! Mein"
	line "kleiner Bruder ist"
	para "ARENALEITER in"
	line "VERTANIA CITY."
	para "Aber er verlässt"
	line "die Stadt so oft,"
	para "dass die Trainer"
	line "Schwierigkeiten"
	cont "bekommen."
	done

.Massage:
	faceplayer
	opentext
	writetext .IntroText
	yesorno
	iffalsefwd .NoMassage
	writetext .QuestionText
	waitbutton
	special Special_DaisyMassage
	ifequalfwd 0, .NoMassage
	ifequal 1, .EggMassage
	setflag ENGINE_TEA_IN_BLUES_HOUSE
	writetext .OkayText
	waitbutton
	closetext
	special FadeOutPalettes
	special LoadMapPalettes
	special SaveMusic
	playmusic MUSIC_HEAL
	pause 60
	special FadeInPalettes_EnableDynNoApply
	special RestoreMusic
	opentext
	writetext .LooksContentText
	special PlayCurMonCry
	promptbutton
	jumpthisopenedtext

	; GSC-DE Dump 6423
	text "SARAH: Hier bitte."
	line "Schon fertig."
	para "Siehst du? Ist es"
	line "jetzt nicht"
	cont "wunderschön?"
	para "Es ist so ein"
	line "süßes #MON."
	done

.IntroText:
	; GSC-DE Dump 6419
	text "SARAH: Hi! Gutes"
	line "Timing. Ich war"
	cont "gerade dabei, Tee"
	cont "zu machen."
	para "Hättest du auch"
	line "gern eine"
	cont "Tasse Tee?"
	para "Oh, deine #MON"
	line "sehen ein bisschen"
	cont "mitgenommen aus."
	para "Möchtest du, dass"
	line "ich eines für dich"
	cont "verschönere?"
	done

.After:
	jumpthistextfaceplayer

	; GSC-DE Dump 6424
	text "SARAH: Um diese"
	line "Zeit trinke ich"
	para "immer meinen Tee."
	line "Möchtest du auch"
	cont "eine Tasse Tee?"
	done

.NoMassage:
	jumpthistext

	; GSC-DE Dump 6425
	text "SARAH: Möchtest du"
	line "keines deiner"
	para "#MON ver-"
	line "schönern lassen?"
	cont "Gut, dann trinken"
	cont "wir eben nur Tee."
	done

.QuestionText:
	; GSC-DE Dump 6420
	text "SARAH: Welches"
	line "soll ich ver-"
	cont "schönern?"
	done

.OkayText:
	; GSC-DE Dump 6421
	text "SARAH: Gut. In"
	line "kürzester Zeit"
	cont "wird es hübsch und"
	cont "adrett aussehen."
	done

.LooksContentText:
	; GSC-DE Dump 6422
	text_ram wStringBuffer3
	text " sieht"
	line "zufrieden aus."
	done

.EggMassage:
	jumpthistext

	; GSC-DE Dump 6426
	text "SARAH: Es tut mir"
	line "Leid, aber ich"
	cont "kann wirklich kein"
	cont "EI verschönern."
	done
