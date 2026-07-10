FastShipCabins_SE_SSE_CaptainsCabin_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, FAST_SHIP_1F, 8
	warp_event  3,  7, FAST_SHIP_1F, 8
	warp_event  2, 19, FAST_SHIP_1F, 9
	warp_event  3, 19, FAST_SHIP_1F, 9
	warp_event  2, 33, FAST_SHIP_1F, 10
	warp_event  3, 33, FAST_SHIP_1F, 10

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2, 17, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, SSAquaGrandpa, EVENT_FAST_SHIP_CABINS_SE_SSE_GENTLEMAN
	object_event  3, 17, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, SSAquaGranddaughterHadFunText, EVENT_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_TWIN_1
	object_event  2, 25, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SSAquaGranddaughterBefore, EVENT_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_TWIN_2
	object_event  3, 25, SPRITE_CAPTAIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAquaCaptain, -1
	object_event  5,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerPokefanmColin, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  2,  4, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerTwinsMegandpeg1, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  3,  4, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerTwinsMegandpeg2, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  5,  5, SPRITE_PSYCHIC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerPsychicRodney, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  2,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPokefanmJeremy, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  5,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerPokefanfGeorgia, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  1, 15, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSupernerdShawn, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND

	object_const_def
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN2

SSAquaCaptain:
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftrue_jumptextfaceplayer SSAquaCaptainHowDoYouLikeText
	jumpthistextfaceplayer

	text "Puh! Danke, dass"
	line "du mitgekommen"
	cont "bist."

	para "Das kleine Mädchen"
	line "bei Laune zu"
	cont "halten war"
	cont "anstrengend."
	done

SSAquaGranddaughterBefore:
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN2, RIGHT
	showtext SSAquaGranddaughterCaptainPlayWithMeText
	showtextfaceplayer SSAquaGranddaughterHasToFindGrandpaText
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	callasm DisableDynPalUpdates
	disappear FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN2
	applymovement PLAYER, SSAquaCaptainsCabinWarpsToGrandpasCabinMovement
	moveobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1, 3, 19
	appear FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1
	turnobject PLAYER, UP
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1, UP
	loadmem wObject1Palette, 1
	callasm SetBlackObjectPals
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, RIGHT
	callasm FadeInPalettes_EnableDynNoApply
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, DOWN
	showemote EMOTE_SHOCK, FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, 15
	applymovement FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1, SSAquaGranddaughterEntersCabinMovement
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, RIGHT
	showtext SSAquaGranddaughterWasPlayingText
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN2, DOWN
	applyonemovement FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, step_down
	opentext
	writetext SSAquaEntertainedGranddaughterText
	promptbutton
	setevent EVENT_VERMILION_PORT_SAILOR_AT_GANGWAY
	setmapscene FAST_SHIP_1F, SCENE_FASTSHIP1F_NOOP
	sjumpfwd SSAquaMachoBraceAndDocking

SSAquaGrandpa:
	checkevent EVENT_GOT_MACHO_BRACE_FROM_GRANDPA_ON_SS_AQUA
	iftrue_jumptextfaceplayer SSAquaGrandpaTravellingText
	faceplayer
	opentext
	checkevent EVENT_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_TWIN_2
	iftruefwd SSAquaFoundGranddaughter
	writetext SSAquaCantFindGranddaughterText
	waitbutton
	closetext
	setmapscene FAST_SHIP_1F, SCENE_FASTSHIP1F_NOOP
	end

SSAquaMachoBraceAndDocking:
	writetext SSAquaGrandpaHaveThisText
	promptbutton
	verbosegiveitem MACHO_BRACE
	iffalsefwd .FailedMachoBrace
	setevent EVENT_GOT_MACHO_BRACE_FROM_GRANDPA_ON_SS_AQUA
	sjumpfwd .ContinueDocking
.FailedMachoBrace:
	writetext .NoRoomForMachoBrace
	waitbutton
.ContinueDocking:
	closetext
	waitsfx
	playsound SFX_ELEVATOR_END
	pause 30
	opentext
	writetext SSAquaHasArrivedVermilionText
	waitbutton
	setevent EVENT_FAST_SHIP_HAS_ARRIVED
	setevent EVENT_FAST_SHIP_FOUND_GIRL
	endtext

.NoRoomForMachoBrace:
	text "Aber du kannst es"
	line "nicht tragen! Ich"
	cont "bewahre es für die"
	cont "nächste Fahrt auf."
	done

SSAquaFoundGranddaughter:
	writetext SSAquaGrandpaHaveThisText
	promptbutton
	verbosegiveitem MACHO_BRACE
	iffalse_endtext
	setevent EVENT_GOT_MACHO_BRACE_FROM_GRANDPA_ON_SS_AQUA
	endtext

GenericTrainerPokefanmColin:
	generictrainer POKEFANM, COLIN, EVENT_BEAT_POKEFANM_COLIN, PokefanmColinSeenText, PokefanmColinBeatenText

	text "Du reist ganz"
	line "alleine?"

	para "Ist deine Mutter"
	line "nicht besorgt?"
	done
GenericTrainerTwinsMegandpeg1:
	generictrainer TWINS, MEGANDPEG1, EVENT_BEAT_TWINS_MEG_AND_PEG, TwinsMegandpeg1SeenText, TwinsMegandpeg1BeatenText

	text "“Baby” ist kein"
	line "schöner Name für"
	cont "Mädchen!"
	done
GenericTrainerTwinsMegandpeg2:
	generictrainer TWINS, MEGANDPEG2, EVENT_BEAT_TWINS_MEG_AND_PEG, TwinsMegandpeg2SeenText, TwinsMegandpeg2BeatenText

	text "Manchmal sind"
	line "Kinder schlauer"
	cont "als Erwachsene!"
	done
GenericTrainerPsychicRodney:
	generictrainer PSYCHIC_T, RODNEY, EVENT_BEAT_PSYCHIC_RODNEY, PsychicRodneySeenText, PsychicRodneyBeatenText

	text "Ich verstehe! Man"
	line "kann den Radio-"
	cont "sender aus JOHTO"
	cont "auf dem SCHNELL-"
	cont "BOOT hören."
	done
GenericTrainerPokefanmJeremy:
	generictrainer POKEFANM, JEREMY, EVENT_BEAT_POKEFANM_JEREMY, PokefanmJeremySeenText, PokefanmJeremyBeatenText

	text "Ich muss in den"
	line "#mon-SALON, um"
	cont "sie zurechtmachen"
	cont "zu lassen!"
	done
GenericTrainerPokefanfGeorgia:
	generictrainer POKEFANF, GEORGIA, EVENT_BEAT_POKEFANF_GEORGIA, PokefanfGeorgiaSeenText, PokefanfGeorgiaBeatenText

	text "Ach, ja! Ich muss"
	line "meine #mon von"
	cont "der PENSION"
	cont "abholen!"
	done
GenericTrainerSupernerdShawn:
	generictrainer SUPER_NERD, SHAWN, EVENT_BEAT_SUPER_NERD_SHAWN, SupernerdShawnSeenText, SupernerdShawnBeatenText

	text "Der BALL, den du"
	line "einsetzt, muss zu"
	cont "der Situation"
	cont "passen."
	done
SSAquaCaptainsCabinWarpsToGrandpasCabinMovement:
	run_step_right
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	step_end

SSAquaGranddaughterEntersCabinMovement:
	step_up
	step_up
	turn_head_left
	step_end


SSAquaCaptainHowDoYouLikeText:
	text "Hat dir die Fahrt"
	line "mit der M.S. AQUA"
	cont "gefallen?"

	para "Sie gleitet"
	line "regelrecht über"
	cont "die Wellen."
	done



SSAquaCantFindGranddaughterText:
	text "Ach, hallo…"

	para "Ich kann meine"
	line "Enkelin nirgendwo"
	cont "finden."

	para "Wenn sie an Bord"
	line "ist, ist alles in"
	cont "Ordnung."

	para "Sie ist ein"
	line "Energiebündel und"

	para "könnte jemanden"
	line "nerven. Ich mache"
	cont "mir ernsthaft"
	cont "Sorgen…"
	done



SSAquaEntertainedGranddaughterText:
	text "<PLAYER>, oder?"
	line "Ich hörte, du hast"
	cont "meine Enkelin bei"
	cont "Laune gehalten."

	para "Ich möchte dir"
	line "dafür danken."
	done



SSAquaGrandpaHaveThisText:
	text "Ich möchte, dass"
	line "du das nimmst!"
	done



SSAquaGrandpaTravellingText:
	text "Wir reisen um die"
	line "Welt."
	done



SSAquaGranddaughterCaptainPlayWithMeText:
	text "KAPITÄN, spielst"
	line "du mit mir?"

	para "Mir ist"
	line "langweilig! Ich"
	cont "möchte spielen!"
	done



SSAquaGranddaughterHasToFindGrandpaText:
	text "Hallo! Willst du"
	line "mit mir spielen?"

	para "…Oh!"

	para "Opa sorgt sich um"
	line "mich?"

	para "Ich muss los!"

	para "Ich muss Opa"
	line "finden!"
	done



SSAquaGranddaughterWasPlayingText:
	text "Opa, hier bin ich!"
	line "Ich habe mit dem"

	para "Kapitän und dem"
	line "großen Kind"
	cont "gespielt!"
	done

SSAquaGranddaughterHadFunText:
	text "Das Spielen hat"
	line "mir Spaß gemacht!"
	done



PokefanmColinSeenText:
	text "Hey, Winzling!"
	line "Möchtest du gegen"
	cont "mich antreten?"
	done



PokefanmColinBeatenText:
	text "Du bist stark!"
	done



TwinsMegandpeg1SeenText:
	text "Du denkst, ich bin"
	line "noch ein Baby? Das"
	cont "ist gemein!"
	done



TwinsMegandpeg1BeatenText:
	text "Ach! Wir haben"
	line "verloren!"
	done



TwinsMegandpeg2SeenText:
	text "Ich bin kein Baby!"

	para "So etwas sagt man"
	line "nicht zu einer"
	cont "Dame!"
	done



TwinsMegandpeg2BeatenText:
	text "Ach! Wir haben"
	line "verloren!"
	done



PsychicRodneySeenText:
	text "Ssh! Mein Gehirn"
	line "empfängt"
	cont "Radiowellen!"
	done



PsychicRodneyBeatenText:
	text "…Ich kann etwas"
	line "hören!"
	done



PokefanmJeremySeenText:
	text "Was denkst du?"
	line "Meine #mon sind"
	cont "doch schön, oder?"
	done



PokefanmJeremyBeatenText:
	text "Ach, nein! Meine"
	line "schönen #mon!"
	done



PokefanfGeorgiaSeenText:
	text "Ich gehe ins"
	line "EINKAUFSZENTRUM"
	cont "und…"
	done



PokefanfGeorgiaBeatenText:
	text "Was wollte ich"
	line "tun?"
	done



SupernerdShawnSeenText:
	text "Was für #bälle"
	line "hast du dabei?"
	done



SupernerdShawnBeatenText:
	text "Warte! Halt!"
	line "Nicht! Bitte!"
	done



SSAquaHasArrivedVermilionText:
	text "Die M.S. AQUA legt"
	line "in"

	para "ORANIA CITY an."
	done



