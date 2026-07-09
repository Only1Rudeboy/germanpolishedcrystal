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

	text "Komm wieder, OK?"
	done

.NoPicture:
	jumpthisopenedtext

	text "Ach, kein Bild?"
	line "Komm wieder, OK?"
	done

.EggPicture:
	jumpthisopenedtext

	text "Ein Ei? Mein"
	line "Talent"
	line "ist mehr wert…"
	done

PhotoStudioGreetingText:
	text "Ich bin Cameron"
	line "der Fotograf."

	para "Du hast wunder-"
	line "bare #mon bei"
	cont "dir."

	para "Wie wäre es mit"
	line "einem Foto als"
	cont "Andenken?"
	done

PhotoStudioWhichMonText:
	text "OK! Größtes"
	line "Lächeln!"

	para "Welches #mon"
	line "soll ich foto-"
	cont "grafieren?"
	done

PhotoStudioHoldStillText:
	text "Alles klar. Bleib"
	line "kurz ganz still."
	done

PhotoStudioPrestoText:
	text "Presto! Fertig!"

	para "Dein "
	text_ram wStringBuffer3
	line "sieht fröhlicher"
	cont "aus!"
	done

PhotoStudioAlreadyDoneText:
	text "Ich habe dir"
	line "heute"
	line "schon ein Foto"
	cont "gemacht."

	para "Komm morgen"
	line "wieder."
	done

PhotoStudioRefusedText:
	text "Ach, schade. Ich"
	line "dachte, das wäre"

	para "ein schönes"
	line "Anden-"
	line "ken…"
	done