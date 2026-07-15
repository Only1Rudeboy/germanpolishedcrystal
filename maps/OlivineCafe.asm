OlivineCafe_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4,  7, OLIVINE_CITY, 6
	warp_event  5,  7, OLIVINE_CITY, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  6,  2, SPRITE_BAKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeStrengthSailorScript, -1
	object_event  4,  4, SPRITE_LYRA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeLyraScript, EVENT_GOT_AMULET_COIN_FROM_LYRA
	object_event  9,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivineCafeFishingGuruText, -1
	object_event  9,  6, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivineCafeSailorText, -1
	object_event  7,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, (1 << MORN), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivineCafeOfficerText, -1
	object_event  7,  4, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, (1 << DAY), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivineCafeYoungsterText, -1
	object_event  3,  2, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, (1 << EVE) | (1 << NITE), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivineCafeFisherText, -1

	object_const_def
	const OLIVINECAFE_BAKER
	const OLIVINECAFE_LYRA

OlivineCafeStrengthSailorScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BAKER_CHELSIE
	iftrue_jumpopenedtext BakerChelsieAfterText
	writetext BakerChelsieGreetingText
	yesorno
	iffalse_jumpopenedtext BakerChelsieNoBattleText
	writetext BakerChelsieSeenText
	waitbutton
	closetext
	winlosstext BakerChelsieBeatenText, 0
	setlasttalked OLIVINECAFE_BAKER
	loadtrainer BAKER, CHELSIE
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BAKER_CHELSIE
	opentext
	jumpthisopenedtext

BakerChelsieAfterText:
	text "Ich gebe meinem"
	line "Brot immer"
	cont "Vitamine."

	para "Sie machen meine"
	line "#mon stärker."
	done

OlivineCafeLyraScript:
	faceplayer
	opentext
	writetext OlivineCafeLyraText1
	promptbutton
	verbosegiveitem AMULET_COIN
	iffalse_endtext
	writetext OlivineCafeLyraText2
	waitbutton
	closetext
	readvar VAR_FACING
	ifnotequal UP, .GoStraightDown
	applyonemovement OLIVINECAFE_LYRA, step_right
.GoStraightDown
	applymovement OLIVINECAFE_LYRA, OlivineCafeMovementData_LyraLeaves
	playsound SFX_EXIT_BUILDING
	disappear OLIVINECAFE_LYRA
	setevent EVENT_GOT_AMULET_COIN_FROM_LYRA
	waitsfx
	end

OlivineCafeMovementData_LyraLeaves:
	step_down
	step_down
	step_down
	step_end

OlivineCafeFishingGuruText:
	text "Im OLIVIANA"
	line "CITY-CAFE gibt es"
	cont "nur"
	para "delikate"
	line "Seemanns-kost für"
	cont "MATROSEN"
	para "auf dem"
	line "Speiseplan!"
	done




OlivineCafeSailorText:
	text "Immer wenn ich in"
	line "diese Stadt komme,"
	para "gehe ich ins"
	line "OLIVIANA"
	cont "CITY-CAFE."
	para "Jedes Gericht auf"
	line "der Karte stärkt"
	para "mich. Ich kann"
	line "nicht aufhören zu"
	cont "essen!"
	done




BakerChelsieGreetingText:
	text "Meine #mon"
	line "kommen in Form!"

	para "Ich hab sie mit"
	line "meinem"
	cont "Spezialhefebrot"
	cont "aufgezogen!"

	para "Willst du gegen"
	line "sie kämpfen?"
	done

BakerChelsieSeenText:
	text "Du wirst sehen,"
	line "was mein Brot"
	cont "kann!"
	done

BakerChelsieBeatenText:
	text "Du bist stark."
	line "Isst du mein"
	cont "Spezialbrot?"
	done

BakerChelsieNoBattleText:
	text "Mit meinen"
	line "brotgezogenen"
	cont "#mon bist du"
	cont "nicht fertig!"
	done

OlivineCafeLyraText1:
	text "LYRA: Hallo,"
	line "<PLAYER>! Probier"
	cont "mal das Essen"
	cont "hier."

	para "Es ist echt"
	line "lecker!"

	para "Obwohl ich nicht"
	line "zu viel essen"
	cont "will…"

	para "Ach, stimmt! Ich"
	line "hab ein Item"

	para "gefunden, das dir"
	line "gefallen könnte."
	cont "Hier!"
	done

OlivineCafeLyraText2:
	text "Ist es nicht"
	line "hübsch? Und"
	cont "nützlich!"
	para "Na ja, ich muss"
	line "los."
	para "Ich will den"
	line "Gelben Wald in"
	para "ANEMONIA CITY"
	line "sehen, bevor ich"
	cont "nach Hause geh."
	para "Bis bald, <PLAYER>!"
	done

OlivineCafeOfficerText:
	text "Ich weiß, es ist"
	line "ein Klischee,"

	para "aber ich komme"
	line "immer hierher für"
	cont "Donuts."

	para "Ich kann nicht"
	line "genug bekommen!"
	done

OlivineCafeYoungsterText:
	text "Diese Donuts sind"
	line "toll."
	para "Mit Marmelade sind"
	line "sie mein Favorit!"
	para "Nichts geht über"
	line "einen Donut mit"
	cont "Marmelade."
	done

OlivineCafeFisherText:
	text "Ich würde joggen"
	line "gehen, aber ich"

	para "will meine Figur"
	line "nicht ruinieren."
	done
