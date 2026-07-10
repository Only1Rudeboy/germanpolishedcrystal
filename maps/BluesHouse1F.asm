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

	text "Daisy: Hi! Mein"
	line "kleiner Bruder ist"
	cont "der Arenaleiter"

	para "in Vertania City."

	para "Aber er ist so oft"
	line "weg, das macht den"
	cont "Trainern"

	para "Probleme."
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

	text "Daisy: So, fertig!"

	para "Sieht's nicht toll"
	line "aus?"

	para "So ein süßes"
	line "#mon."
	done

.IntroText:
	text "Daisy: Hi! Gute"
	line "Zeit. Ich trink"
	cont "gerade Tee."

	para "Möchtest du"
	line "mitmachen?"

	para "Oh, deine #mon"
	line "sind etwas"
	cont "schmutzig."

	para "Soll ich eins"
	line "pflegen?"
	done

.After:
	jumpthistextfaceplayer

	text "Daisy: Um diese"
	line "Zeit trink ich"
	cont "immer Tee."

	para "Komm mit."
	done

.NoMassage:
	jumpthistext

	text "Daisy: Willst du"
	line "keins pflegen"
	cont "lassen? Okay,"

	para "dann trinken wir"
	line "nur Tee."
	done

.QuestionText:
	text "Daisy: Welches"
	line "soll ich pflegen?"
	done

.OkayText:
	text "Daisy: Okay, im Nu"
	line "sieht's toll aus."
	done

.LooksContentText:
	text_ram wStringBuffer3
	text " sieht zufrieden"
	line "aus."
	done

.EggMassage:
	jumpthistext

	text "Daisy: Oh, sorry."
	line "Ein Ei kann ich"
	cont "nicht pflegen."
	done
