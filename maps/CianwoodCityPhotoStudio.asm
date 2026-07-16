CianwoodCityPhotoStudio_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, CIANWOOD_CITY, 5
	warp_event  3,  7, CIANWOOD_CITY, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CianwoodPhotoStudioFishingGuruScript, -1

CianwoodPhotoStudioFishingGuruScript:
	faceplayer
	opentext
	checkflag ENGINE_DAILY_PHOTOGRAPH
	iftrue_jumpopenedtext PhotoStudioAlreadyDoneText
	writetext PhotoStudioGreetingText
	yesorno
	iffalse_jumpopenedtext PhotoStudioRefusedText
	writetext PhotoStudioWhichMonText
	promptbutton
	special Special_CianwoodPhotograph
	ifequalfwd $0, .NoPicture
	ifequalfwd $1, .EggPicture
	setflag ENGINE_DAILY_PHOTOGRAPH
	writetext PhotoStudioHoldStillText
	waitbutton
	closetext
	special FadeOutPalettes
	special LoadMapPalettes
	callasm LoadBlindingFlashPalette
	pause 10
	playsound SFX_DOUBLE_SLAP
	waitsfx
	pause 10
	special FadeInPalettes_EnableDynNoApply
	readmem wCurPartySpecies
	pokepic 0
	cry 0
	waitsfx
	closepokepic
	opentext
	writetext PhotoStudioPrestoText
	special PlayCurMonCry
	waitbutton
	jumpthisopenedtext

	text "Komm wieder, O.K.?"
	done

.NoPicture:
	jumpthisopenedtext

	text "Ach, kein Bild?"
	line "Komm wieder, O.K.?"
	done

.EggPicture:
	jumpthisopenedtext

	text "Ein Ei? Mein"
	line "Talent ist mehr"
	cont "wert…"
	done

PhotoStudioGreetingText:
	; GSC-DE Dump (+ PC: #MON-Wahl)
	text "Deine #MON sind"
	line "großartig!"
	para "Wie wär's mit ei-"
	line "nem Foto als Sou-"
	cont "venir?"
	done

PhotoStudioWhichMonText:
	; GSC-DE Dump / PC
	text "O.K.! Und jetzt"
	line "sag: CHEESE!"
	para "Welches #MON"
	line "soll ich"
	cont "fotografieren?"
	done

PhotoStudioHoldStillText:
	; PC
	text "Alles klar. Bleib"
	line "kurz ganz still."
	done

PhotoStudioPrestoText:
	; PC
	text "Presto! Fertig!"
	para "Dein "
	text_ram wStringBuffer3
	line "sieht fröhlicher"
	cont "aus!"
	done

PhotoStudioAlreadyDoneText:
	; PC
	text "Ich habe dir heute"
	line "schon ein Foto"
	cont "gemacht."
	para "Komm morgen"
	line "wieder."
	done

PhotoStudioRefusedText:
	; GSC-DE Dump
	text "Oh, schade. Ich"
	line "dachte, das wäre"
	para "ein schönes Anden-"
	line "ken…"
	done
