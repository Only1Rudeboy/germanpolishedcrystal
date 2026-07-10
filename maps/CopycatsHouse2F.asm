CopycatsHouse2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, CopycatsHouse2FCallback

	def_warp_events
	warp_event  3,  0, COPYCATS_HOUSE_1F, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  3, SPRITE_COPYCAT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_TEAL, OBJECTTYPE_SCRIPT, 0, CopycatScript, -1
	object_event  6,  4, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, DODRIO, -1, PAL_MON_BROWN, OBJECTTYPE_SCRIPT, NO_FORM, CopycatsDodrioScript, -1
	object_event  6,  1, SPRITE_MON_ICON, SPRITEMOVEDATA_STILL, 0, CLEFAIRY, -1, PAL_MON_PINK, OBJECTTYPE_SCRIPT, NO_FORM, CopycatsHouse2FDollScript, EVENT_COPYCATS_HOUSE_2F_DOLL
	object_event  2,  1, SPRITE_MON_ICON, SPRITEMOVEDATA_STILL, 0, GENGAR, -1, PAL_MON_PURPLE, OBJECTTYPE_SCRIPT, NO_FORM, CopycatsHouse2FDollScript, -1
	object_event  7,  1, SPRITE_MON_ICON, SPRITEMOVEDATA_STILL, 0, MURKROW, -1, PAL_MON_BLUE, OBJECTTYPE_SCRIPT, NO_FORM, CopycatsHouse2FDollScript, -1
	pokemon_event  0,  4, DITTO, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_PURPLE, CopycatsHouse2FDittoText, -1

	object_const_def
	const COPYCATSHOUSE2F_COPYCAT

CopycatsHouse2FCallback:
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	endcallback

CopycatScript:
	readvar VAR_PLAYERGENDER
	ifequalfwd PLAYER_FEMALE, CopycatFemaleScript
	ifequalfwd PLAYER_ENBY, CopycatEnbyScript
	ifequalfwd PLAYER_BETA, CopycatBetaScript
	; fallthrough

CopycatMaleScript:
	faceplayer
	checkevent EVENT_GOT_PASS_FROM_COPYCAT
	iftruefwd .GotPass
	checkevent EVENT_RETURNED_LOST_ITEM_TO_COPYCAT
	iftrue CopycatReturnedLostItemScript
	checkkeyitem LOST_ITEM
	iftrue CopycatFoundLostItemScript
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	faceplayer
	loadmem wObject1Palette, 0
	variablesprite SPRITE_COPYCAT, SPRITE_CHRIS
	special RefreshSprites
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .ReturnedMachinePart
	showtext CopycatGreeting1Text
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	sjump CopycatRetortScript

.ReturnedMachinePart:
	showtext CopycatLostDoll1Text
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	sjump CopycatWorriedScript

.GotPass:
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	faceplayer
	loadmem wObject1Palette, 0
	variablesprite SPRITE_COPYCAT, SPRITE_CHRIS
	special RefreshSprites
	showtext CopycatThanks1Text
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	sjump CopycatFinalScript

CopycatFemaleScript:
	faceplayer
	checkevent EVENT_GOT_PASS_FROM_COPYCAT
	iftruefwd .GotPass
	checkevent EVENT_RETURNED_LOST_ITEM_TO_COPYCAT
	iftrue CopycatReturnedLostItemScript
	checkkeyitem LOST_ITEM
	iftrue CopycatFoundLostItemScript
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	faceplayer
	loadmem wObject1Palette, 0
	variablesprite SPRITE_COPYCAT, SPRITE_KRIS
	special RefreshSprites
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .ReturnedMachinePart
	showtext CopycatGreeting2Text
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	sjumpfwd CopycatRetortScript

.ReturnedMachinePart:
	showtext CopycatLostDoll2Text
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	sjumpfwd CopycatWorriedScript

.GotPass:
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	faceplayer
	loadmem wObject1Palette, 0
	variablesprite SPRITE_COPYCAT, SPRITE_KRIS
	special RefreshSprites
	showtext CopycatThanks2Text
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	sjump CopycatFinalScript

CopycatEnbyScript:
	faceplayer
	checkevent EVENT_GOT_PASS_FROM_COPYCAT
	iftruefwd .GotPass
	checkevent EVENT_RETURNED_LOST_ITEM_TO_COPYCAT
	iftrue CopycatReturnedLostItemScript
	checkkeyitem LOST_ITEM
	iftrue CopycatFoundLostItemScript
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	faceplayer
	loadmem wObject1Palette, 0
	variablesprite SPRITE_COPYCAT, SPRITE_CRYS
	special RefreshSprites
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .ReturnedMachinePart
	showtext CopycatGreeting2Text
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	sjumpfwd CopycatRetortScript

.ReturnedMachinePart:
	showtext CopycatLostDoll2Text
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	sjumpfwd CopycatWorriedScript

.GotPass:
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	faceplayer
	loadmem wObject1Palette, 0
	variablesprite SPRITE_COPYCAT, SPRITE_CRYS
	special RefreshSprites
	showtext CopycatThanks2Text
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	sjump CopycatFinalScript

CopycatBetaScript:
	faceplayer
	checkevent EVENT_GOT_PASS_FROM_COPYCAT
	iftruefwd .GotPass
	checkevent EVENT_RETURNED_LOST_ITEM_TO_COPYCAT
	iftrue CopycatReturnedLostItemScript
	checkkeyitem LOST_ITEM
	iftruefwd CopycatFoundLostItemScript
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	faceplayer
	loadmem wObject1Palette, 0
	variablesprite SPRITE_COPYCAT, SPRITE_BETA
	special RefreshSprites
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .ReturnedMachinePart
	showtext CopycatGreeting2Text
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	sjumpfwd CopycatRetortScript

.ReturnedMachinePart:
	showtext CopycatLostDoll2Text
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	sjumpfwd CopycatWorriedScript

.GotPass:
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	faceplayer
	loadmem wObject1Palette, 0
	variablesprite SPRITE_COPYCAT, SPRITE_BETA
	special RefreshSprites
	showtext CopycatThanks2Text
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	sjump CopycatFinalScript

CopycatRetortScript:
	faceplayer
	loadmem wObject1Palette, 1
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	special RefreshSprites
	jumpthistext

	text "NACHAHMERIN: Hm?"
	line "Das Nachahmen"
	cont "aufgeben?"

	para "Aber das ist meine"
	line "liebste"
	cont "Beschäftigung!"
	done
CopycatWorriedScript:
	faceplayer
	loadmem wObject1Palette, 1
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	special RefreshSprites
	setevent EVENT_MET_COPYCAT_FOUND_OUT_ABOUT_LOST_ITEM
	jumpthistext

	text "NACHAHMERIN:"
	line "Bitte?"

	para "Ich soll dir nicht"
	line "sagen, was du zu"
	cont "tun hast?"

	para "Aber ich mache mir"
	line "wirklich Sorgen…"
	cont "Was, wenn jemand"
	cont "sie findet?"
	done
CopycatFoundLostItemScript:
	opentext
	writetext .FoundDollText
	promptbutton
	takekeyitem LOST_ITEM
	setevent EVENT_RETURNED_LOST_ITEM_TO_COPYCAT
	clearevent EVENT_COPYCATS_HOUSE_2F_DOLL
	sjumpfwd CopycatGivePassScript

.FoundDollText:

	text "NACHAHMERIN: Jaa!"
	line "Das ist meine"
	cont "PIEPI-#PUPPE!"

	para "Siehst du die Naht"
	line "am rechten"

	para "Bein? Das ist der"
	line "Beweis!"
	done
CopycatReturnedLostItemScript:
	opentext
CopycatGivePassScript:
	writetext .GivePassText
	promptbutton
	verbosegivekeyitem PASS
	iffalse_endtext
	setevent EVENT_GOT_PASS_FROM_COPYCAT
	jumpthisopenedtext

	text "NACHAHMERIN: Das"
	line "ist der FAHRSCHEIN"
	cont "für den MAGNETZUG."

	para "Der Mann von der"
	line "Eisenbahn gab mir"

	para "das, als sie unser"
	line "altes Haus"
	cont "niederrissen, um"
	cont "den BAHNHOF zu"
	cont "bauen."
	done
.GivePassText:
	text "Also gut. Hier ist"
	line "der FAHRSCHEIN für"
	cont "den MAGNETZUG! Wie"
	cont "versprochen."
	done
CopycatFinalScript:
	faceplayer
	loadmem wObject1Palette, 1
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	special RefreshSprites
	jumpthistext

	text "NACHAHMERIN: "
	line "Darauf kannst du"
	cont "wetten!"
	done
CopycatGreeting1Text:
	text "<PLAYER>: Hi!"
	line "Magst du #mon?"

	para "<PLAYER>: Äh,"
	line "nein, ich frage"
	cont "dich."

	para "<PLAYER>: Was? Du"
	line "bist komisch!"
	done
CopycatLostDoll1Text:
	text "<PLAYER>: Hi! Ich"
	line "habe gehört,"

	para "dass du deine"
	line "Lieblings-"
	cont "#PUPPE verloren"
	cont "hast."

	para "<PLAYER>: Gibst du"
	line "mir einen FAHR-"
	cont "SCHEIN, wenn ich"
	cont "sie finde?"

	para "<PLAYER>: Ich"
	line "suche sie für"
	cont "dich."

	para "Du glaubst, sie"
	line "auf dem Weg nach"
	cont "ORANIA CITY"
	cont "verloren zu haben?"
	done
CopycatThanks1Text:
	text "<PLAYER>: Hi!"
	line "Vielen Dank für"
	cont "den FAHRSCHEIN!"

	para "<PLAYER>: Bitte?"

	para "<PLAYER>: Ist es"
	line "wirklich so toll,"
	cont "jede Bewegung"
	cont "nachzuahmen?"
	done
CopycatGreeting2Text:
	text "<PLAYER>: Hi. Du"
	line "musst #mon"
	cont "mögen."

	para "<PLAYER>: Nein,"
	line "nicht ich. Ich"
	cont "habe dich gefragt."

	para "<PLAYER>: Bitte?"
	line "Du bist seltsam!"
	done
CopycatLostDoll2Text:
	text "<PLAYER>: Hi. Hast"
	line "du wirklich deine"
	cont "#PUPPE"
	cont "verloren?"

	para "<PLAYER>: Du gibst"
	line "mir wirklich"

	para "einen FAHRSCHEIN,"
	line "falls ich sie"
	cont "finde?"

	para "<PLAYER>: Gewiss,"
	line "ich halte die"
	cont "Augen offen!"

	para "Du denkst, du hast"
	line "sie in ORANIA CITY"
	cont "verloren?"
	done
CopycatThanks2Text:
	text "<PLAYER>: Danke"
	line "für den"
	cont "FAHRSCHEIN!"

	para "<PLAYER>: …Bitte?"

	para "<PLAYER>: Macht es"
	line "wirklich so"

	para "viel Spaß mir"
	line "alles"
	cont "nachzusprechen und"
	cont "alles nachzuahmen?"
	done
CopycatSpinMovement:
rept 2
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
endr
	turn_head_down
	step_end

CopycatsDodrioScript:
	opentext
	writetext .Text1
	cry DODRIO
	promptbutton
	jumpthisopenedtext

	text "SPIEGLEIN, SPIEG-"
	line "LEIN AN DER WAND,"

	para "WER IST DIE"
	line "SCHOENSTE IM"
	cont "GANZEN"

	para "LAND?"
	done
.Text1:
	text "DODRI: Gii giii!"
	done
CopycatsHouse2FDollScript:
	jumpthistext

	text "Das ist ein"
	line "seltenes #mon!"
	cont "Was?"

	para "Es ist nur eine"
	line "Puppe…"
	done
CopycatsHouse2FDittoText:
	text "Ditto: Dii…"
	done
