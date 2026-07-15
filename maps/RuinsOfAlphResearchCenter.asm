RuinsOfAlphResearchCenter_MapScriptHeader:
	def_scene_scripts
	scene_script DoNothingScript, SCENE_RUINSOFALPHRESEARCHCENTER_NOOP
	scene_script RuinsOfAlphResearchCenterGetUnownDexScene, SCENE_RUINSOFALPHRESEARCHCENTER_GET_UNOWN_DEX

	def_callbacks
	callback MAPCALLBACK_OBJECTS, RuinsOfAlphResearchCenterScientistCallback

	def_warp_events
	warp_event  2,  7, RUINS_OF_ALPH_OUTSIDE, 7
	warp_event  3,  7, RUINS_OF_ALPH_OUTSIDE, 7

	def_coord_events

	def_bg_events
	bg_event  6,  5, BGEVENT_JUMPTEXT, RuinsOfAlphResearchCenterAcademicBooksText
	bg_event  3,  4, BGEVENT_READ, MapRuinsofAlphResearchCenterSignpost1Script
	bg_event  7,  1, BGEVENT_JUMPTEXT, RuinsOfAlphResearchCenterPrinterText_DoesntWork
	bg_event  5,  0, BGEVENT_JUMPTEXT, RuinsOfAlphResearchCenterProfSilktreePhotoText

	def_object_events
	object_event  4,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist1Script, -1
	object_event  5,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 1, 2, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist2Script, -1
	object_event  2,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist3Script, EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST

	object_const_def
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST1
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST2
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST3

RuinsOfAlphResearchCenterScientistCallback:
	checkscene
	ifequalfwd $1, .ShowScientist
	endcallback

.ShowScientist:
	moveobject RUINSOFALPHRESEARCHCENTER_SCIENTIST3, 3, 7
	appear RUINSOFALPHRESEARCHCENTER_SCIENTIST3
	endcallback

RuinsOfAlphResearchCenterGetUnownDexScene:
	end



.Script:
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, RuinsOfAlphResearchCenterApproachesComputerMovement
	playsound SFX_BOOT_PC
	pause 60
	playsound SFX_SWITCH_POKEMON
	pause 30
	playsound SFX_TALLY
	pause 30
	playsound SFX_TRANSACTION
	pause 30
	turnobject RUINSOFALPHRESEARCHCENTER_SCIENTIST3, DOWN
	showtext RuinsOfAlphResearchCenterModifiedDexText
	applyonemovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, step_down
	opentext
	writetext RuinsOfAlphResearchCenterDexUpgradedText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_UNOWN_DEX
	writetext RuinsOfAlphResearchCenterScientist3Text
	waitbutton
	closetext
	applyonemovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, step_up
	setscene SCENE_RUINSOFALPHRESEARCHCENTER_NOOP
	special RestartMapMusic
	end

RuinsOfAlphResearchCenterScientist3Script:
	faceplayer
	opentext
	checkevent EVENT_RUINS_OF_ALPH_CLIMAX_DONE
	iftruefwd .Conclusion
	readvar VAR_UNOWNCOUNT
	ifequalfwd NUM_UNOWN, .PrinterAvailable
	jumpopenedtext RuinsOfAlphResearchCenterScientist3Text

.Conclusion:
	jumpthisopenedtext

	text "Wir werden die"
	line "geöffnete Kammer"
	para "nach und nach"
	line "untersuchen."
	para "Wir müssen darauf"
	line "achten, die Stätte"
	cont "nicht zu stören."
	done

.PrinterAvailable:
	writetext RuinsOfAlphResearchCenterScientist3_PrinterAvailable
	promptbutton
	setevent EVENT_DECO_UNOWN_DOLL
	writetext GotUnownDollText
	playsound SFX_ITEM
	pause 60
	waitbutton
	writetext UnownDollSentText
	promptbutton
	writetext RuinsofAlphResearchCenterScientistRewardText
	promptbutton
	writetext RuinsofAlphResearchCenterScientistInterruptedText
	pause 30
	closetext
	pause 15
	playsound SFX_EMBER
	earthquake 60
	waitsfx
	setevent EVENT_DOOR_OPENED_IN_RUINS_OF_ALPH
	showemote EMOTE_SHOCK, PLAYER, 15
	showemote EMOTE_SHOCK, RUINSOFALPHRESEARCHCENTER_SCIENTIST3, 15
	showemote EMOTE_SHOCK, RUINSOFALPHRESEARCHCENTER_SCIENTIST1, 15
	showemote EMOTE_SHOCK, RUINSOFALPHRESEARCHCENTER_SCIENTIST2, 15
	showtext RuinsofAlphResearchCenterScientistShockedText
	readvar VAR_FACING
	ifequalfwd UP, .GoAround
	follow RUINSOFALPHRESEARCHCENTER_SCIENTIST3, PLAYER
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, RuinsofAlphResearchCenterLeave2MovementData
	stopfollow
	sjumpfwd .Continue
.GoAround:
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, RuinsofAlphResearchCenterScientistStepAsideMovementData
	follow RUINSOFALPHRESEARCHCENTER_SCIENTIST3, PLAYER
	applyonemovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, step_down
	stopfollow
.Continue:
	playsound SFX_EXIT_BUILDING
	disappear RUINSOFALPHRESEARCHCENTER_SCIENTIST3
	applyonemovement PLAYER, step_down
	playsound SFX_EXIT_BUILDING
	disappear PLAYER
	special FadeOutPalettes
	setevent EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	clearevent EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
	clearevent EVENT_RUINS_OF_ALPH_OUTSIDE_SCIENTIST_CLIMAX
	setevent EVENT_DO_RUINS_OF_ALPH_CLIMAX
	pause 15
	warpfacing DOWN, RUINS_OF_ALPH_OUTSIDE, 19, 18
	end

RuinsofAlphResearchCenterScientistStepAsideMovementData:
	step_right
	step_down
	step_end

RuinsofAlphResearchCenterLeave2MovementData:
	step_down
	step_down
	step_end

RuinsOfAlphResearchCenterScientist1Script:
	faceplayer
	opentext
	readvar VAR_UNOWNCOUNT
	ifequalfwd NUM_UNOWN, .GotAllUnown
	checkflag ENGINE_UNOWN_DEX
	iftruefwd .GotUnownDex
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftruefwd .UnownAppeared
	jumpthisopenedtext

	text "Die RUINEN sind"
	line "etwa 1.500 Jahre"
	cont "alt."
	para "Aber man weiß"
	line "nicht, warum oder"
	cont "von wem sie erbaut"
	cont "wurden."
	done

.UnownAppeared:
	jumpthisopenedtext

	text "Es gibt #mon in"
	line "den RUINEN?"
	para "Das sind"
	line "unfassbare"
	cont "Neuigkeiten!"
	para "Das müssen wir"
	line "erforschen."
	done

.GotUnownDex:
	jumpthisopenedtext

	text "Ich frage mich,"
	line "wie viele #mon"
	cont "wohl in den RUINEN"
	cont "leben?"
	done
.GotAllUnown:
	writetext RuinsOfAlphResearchCenterScientist1Text_GotAllUnown
	waitbutton
	closetext
	clearevent EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	end

RuinsOfAlphResearchCenterScientist2Script:
	faceplayer
	opentext
	readvar VAR_UNOWNCOUNT
	ifgreater 3, .GotAllUnown
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftruefwd .UnownAppeared
	jumpthisopenedtext

	text "Es gibt"
	line "merkwürdige Muster"
	cont "an"
	para "den Wänden der"
	line "RUINEN."
	para "Sie müssen der"
	line "Schlüssel zur"
	cont "Lösung des Rätsels"
	cont "der RUINEN sein."
	done


.UnownAppeared:
	jumpthisopenedtext

	text "Die seltsamen"
	line "#mon in den"
	cont "RUINEN?"

	para "Sie ähneln den"
	line "Zeichnungen an"

	para "den Wänden dort"
	line "sehr."

	para "Hmm…"

	para "Das muss heißen,"
	line "dass es viele"
	cont "Arten gibt…"
	done

.GotAllUnown:
	readvar VAR_UNOWNCOUNT
	ifequalfwd NUM_UNOWN, .ResearchComplete
	readvar VAR_UNOWNCOUNT
	ifgreater 10, .ResearchOngoing
	jumpthisopenedtext

	text "Warum sind diese"
	line "antiken Muster"
	para "jetzt an den"
	line "Wänden"
	cont "aufgetaucht?"
	para "Das wird immer"
	line "geheimnisvoller…"
	done
.ResearchComplete:
	writetext RuinsOfAlphResearchCenterScientist2Text_RadioWaves
	waitbutton
	closetext
	clearevent EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	end

.ResearchOngoing:
	jumpthisopenedtext

	text "Wir glauben, etwas"
	line "hat die"
	para "rätselhaften"
	line "Muster in den"
	cont "RUINEN verursacht."
	para "Wir konzentrieren"
	line "unsere Forschung"
	cont "darauf."
	done

MapRuinsofAlphResearchCenterSignpost1Script:
	opentext
	checkevent EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
	iffalsefwd .SkipChecking
	checkevent EVENT_DECO_UNOWN_DOLL
	iftruefwd .SkipChecking
	jumpthisopenedtext

	text "ALPH-RUINEN 10."
	line "Forschungsjahr"
	done

.SkipChecking:
	readvar VAR_UNOWNCOUNT
	jumpopenedtext RuinsOfAlphResearchCenterComputerText_GotAllUnown

RuinsOfAlphResearchCenterApproachesComputerMovement:
	step_up
	step_up
	step_left
	turn_head_up
	step_end

RuinsOfAlphResearchCenterModifiedDexText:
	text "Geschafft!"
	para "Ich habe deinen"
	line "#DEX erweitert."
	para "Ich habe dir einen"
	line "optionalen #DEX"
	para "extra für ICOGNITO"
	line "eingebaut. Er"
	para "speichert sie in"
	line "der Reihenfolge,"
	cont "in der du sie"
	cont "fängst."
	done



RuinsOfAlphResearchCenterDexUpgradedText:
	text "<PLAYER>s #DEX"
	line "wurde erweitert."
	done



RuinsOfAlphResearchCenterScientist3Text:
	text "Jedes ICOGNITO,"
	line "das du fängst,"
	cont "wird darin"
	cont "eingetragen."
	para "Schlage nach, um"
	line "zu erfahren, wie"
	cont "viele es gibt."
	done



RuinsOfAlphResearchCenterScientist3_PrinterAvailable:
	text "Hast du alle"
	line "verschiedenen"
	cont "ICOGNITO?"

	para "Das ist eine"
	line "Spitzenleistung!"

	para "Ich habe den"
	line "Drucker"
	cont "aufgestellt, um"
	cont "ICOGNITOs Daten"
	cont "auszudrucken."

	para "Du kannst ihn"
	line "jederzeit gerne"
	cont "benutzen."
	done


GotUnownDollText:
	text "<PLAYER> erhält"
	line "ICOGNITO-Puppe."
	done

UnownDollSentText:
	text "ICOGNITO-Puppe"
	line "wurde nach Hause"
	cont "geschickt."
	done

RuinsofAlphResearchCenterScientistRewardText:
	text "Ich hab diese"
	line "Puppe selbst"
	cont "entworfen!"
	done

RuinsofAlphResearchCenterScientistInterruptedText:
	text "Du kannst--"
	done

RuinsofAlphResearchCenterScientistShockedText:
	text "Was war DAS?!"
	done





RuinsOfAlphResearchCenterScientist1Text_GotAllUnown:
	text "Unsere Forschung"
	line "und deine Hilfe"
	para "geben uns einen"
	line "tiefen Einblick in"
	cont "die RUINEN."
	para "Es scheint, als ob"
	line "die RUINEN als"
	para "Habitat für"
	line "#mon gebaut"
	cont "wurden."
	done



RuinsOfAlphResearchCenterScientist2Text_RadioWaves:
	text "Meiner Forschung"
	line "zufolge…"

	para "erschienen jene"
	line "geheimnisvollen"
	cont "Muster,"

	para "als das #-Com"
	line "Center gebaut"
	cont "wurde."

	para "Das bedeutet,"
	line "Funkwellen haben"

	para "irgendeine"
	line "Verbindung…"
	done



RuinsOfAlphResearchCenterComputerText_GotAllUnown:
	text "Geheimnisvolles"
	line "#mon Name:"
	cont "ICOGNITO"
	para "26 verschiedene"
	line "gefunden."
	done



RuinsOfAlphResearchCenterPrinterText_DoesntWork:
	text "Das scheint noch"
	line "nicht zu"
	cont "funktionieren."
	done



RuinsOfAlphResearchCenterProfSilktreePhotoText:
	text "Ein Foto vom"
	line "Gründer des"

	para "FORSCHUNGS-"
	line "ZENTRUMS,"
	cont "PROF. SILKTREE."
	done



RuinsOfAlphResearchCenterAcademicBooksText:
	text "Es gibt viele"
	line "wissenschaftliche"
	cont "Bücher dort."

	para "Antike Ruinen…"
	line "Geheimnisse der"
	cont "Antike…"
	done



