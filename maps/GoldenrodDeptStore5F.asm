GoldenrodDeptStore5F_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, GoldenrodDeptStore5FCheckIfSunday

	def_warp_events
	warp_event 12,  0, GOLDENROD_DEPT_STORE_4F, 1
	warp_event 15,  0, GOLDENROD_DEPT_STORE_6F, 1
	warp_event  2,  0, GOLDENROD_DEPT_STORE_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event 14,  0, BGEVENT_JUMPTEXT, GoldenrodDeptStore5FDirectoryText

	def_object_events
	object_event  7,  5, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore5FReceptionistScript, EVENT_GOLDENROD_DEPT_STORE_5F_HAPPINESS_EVENT_LADY
	object_event  8,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, pokemart, MARTTYPE_TM, MART_GOLDENROD_5F_TM, -1
	object_event  6,  3, SPRITE_COOL_DUDE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, trade, NPC_TRADE_MIKE, -1
	object_event  3,  6, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodDeptStore5FLassText, -1
	object_event  9,  1, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodDeptStore5FPokefanMText, -1
	object_event 13,  5, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore5FTwinScript, -1

	object_const_def
	const GOLDENRODDEPTSTORE5F_RECEPTIONIST

GoldenrodDeptStore5FCheckIfSunday:
	readvar VAR_WEEKDAY
	ifequalfwd SUNDAY, .yes
	disappear GOLDENRODDEPTSTORE5F_RECEPTIONIST
	endcallback

.yes
	appear GOLDENRODDEPTSTORE5F_RECEPTIONIST
	endcallback

GoldenrodDeptStore5FReceptionistScript:
	faceplayer
	opentext
	readvar VAR_WEEKDAY
	ifnotequal SUNDAY, .EventIsOver
	checktmhm TM_RETURN
	iftruefwd .EventIsOver
	checkflag ENGINE_GOLDENROD_MALL_5F_HAPPINESS_EVENT
	iftruefwd .EventIsOver
	special GetFirstPokemonHappiness
	writetext GoldenrodDeptStore5FReceptionistOhYourMonDotDotDotText
	promptbutton
	ifgreater FRIEND_BALL_HAPPINESS - 1, .VeryHappy
	jumpthisopenedtext

	text "Es ist"
	line "entzückend!"

	para "Du solltest ihm"
	line "gute VM-Attacken"
	cont "beibringen."
	done



.VeryHappy:
	writetext GoldenrodDeptStore5FReceptionistThisMoveShouldBePerfectText
	promptbutton
	verbosegivetmhm TM_RETURN
	setflag ENGINE_GOLDENROD_MALL_5F_HAPPINESS_EVENT
	endtext

.EventIsOver:
	jumpthisopenedtext

	text "Es gibt für jedes"
	line "#mon passen-"
	cont "de TMs."
	done
GoldenrodDeptStore5FTwinScript:
	checkflag ENGINE_DAILY_MYSTERY_GIFT
	iftrue_jumptextfaceplayer .ComeBackText
	faceplayer
	opentext
	writetext GoldenrodDeptStore5FCarrieMysteryGiftRequiresGBCText
	promptbutton
	random NUM_BERRIES
	addval FIRST_BERRY
	getitemname USE_SCRIPT_VAR, STRING_BUFFER_4
	verbosegiveitem ITEM_FROM_MEM
	iffalse_jumpopenedtext MysteryGiftGirl_NoRoomText
	setflag ENGINE_DAILY_MYSTERY_GIFT
	jumpthisopenedtext

.ComeBackText:
	text "Morgen gibt es"
	line "wieder eine"
	cont "Beere."
	done

GoldenrodDeptStore5FReceptionistOhYourMonDotDotDotText:
	text "Hallo! Oh, dein"
	line "#mon…"
	done



GoldenrodDeptStore5FReceptionistThisMoveShouldBePerfectText:
	text "Es hängt sehr an"
	line "dir."

	para "Diese Attacke"
	line "passt genau zu"
	cont "euch beiden."
	done



GoldenrodDeptStore5FCarrieMysteryGiftRequiresGBCText:
	text "Die GEHEIMGABE"
	line "erfordert einen"
	cont "Game Boy Color."
	done



MysteryGiftGirl_NoRoomText:
	text "Aber du kannst"
	line "es nicht"
	cont "tragen…"
	done

GoldenrodDeptStore5FLassText:
	text "Sonntags kommt"
	line "eine Dame, um"
	cont "nach"
	cont "den #mon zu"
	cont "sehen."

	para "Sie verteilt"
	line "sogar"
	line "TMs!"
	done



GoldenrodDeptStore5FPokefanMText:
	text "Ein #mon, das"
	line "du durch Tausch"
	cont "erhalten hast,"
	cont "kannst du nicht"
	cont "umbenennen."

	para "Der Name spiegelt"
	line "die Gefühle des"

	para "Original-Trainers"
	line "wieder."
	done



GoldenrodDeptStore5FDirectoryText:
	text "Rüste deine #-"
	line "MON auf."

	para "4S TM-ECKE"
	done



