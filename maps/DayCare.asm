DayCare_MapScriptHeader:
	def_scene_scripts
	scene_script DayCareMeetDayCareManScene, SCENE_DAYCARE_MEET_DAYCARE_MAN
	scene_const SCENE_DAYCARE_NOOP

	def_callbacks
	callback MAPCALLBACK_OBJECTS, DayCareEggCheckCallback

	def_warp_events
	warp_event  0,  4, ROUTE_34, 3
	warp_event  0,  5, ROUTE_34, 4
	warp_event  2,  7, ROUTE_34, 5
	warp_event  3,  7, ROUTE_34, 5

	def_coord_events

	def_bg_events
	bg_event  5,  1, BGEVENT_JUMPSTD, difficultbookshelf

	def_object_events
	object_event  5,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, DayCareLadyScript, -1
	object_event  0,  5, SPRITE_LYRA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LYRA_DAYCARE
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, DayCareManScript_Inside, EVENT_DAYCARE_MAN_IN_DAYCARE

	object_const_def
	const DAYCARE_GRANNY
	const DAYCARE_LYRA

DayCareMeetDayCareManScene:
	sdefer DayCare_MeetGrandma
	end

DayCareEggCheckCallback:
	checkflag ENGINE_DAY_CARE_MAN_HAS_EGG
	iftruefwd .PutDayCareManOutside
	clearevent EVENT_DAYCARE_MAN_IN_DAYCARE
	setevent EVENT_DAYCARE_MAN_ON_ROUTE_34
	endcallback

.PutDayCareManOutside:
	setevent EVENT_DAYCARE_MAN_IN_DAYCARE
	clearevent EVENT_DAYCARE_MAN_ON_ROUTE_34
	endcallback

DayCare_MeetGrandma:
	follow DAYCARE_LYRA, PLAYER
	applymovement DAYCARE_LYRA, DayCareMovementData_LyraApproachesGrandma
	stopfollow
	turnobject PLAYER, UP
	turnobject DAYCARE_GRANNY, DOWN
	callasm .GetPlayerPronouns
	showtext DayCareLyraHelloText
	showemote EMOTE_SHOCK, DAYCARE_LYRA, 15
	showtext DayCareLyraProtestText
	turnobject DAYCARE_LYRA, DOWN
	showtext DayCareLyraGoodbyeText
	applymovement DAYCARE_LYRA, DayCareMovementData_LyraStartsToLeave
	showemote EMOTE_SHOCK, DAYCARE_LYRA, 15
	turnobject DAYCARE_LYRA, LEFT
	turnobject PLAYER, RIGHT
	showtext DayCareLyraForgotText
	addcellnum PHONE_LYRA
	opentext
	writetext GotLyrasNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	waitbutton
	writetext DayCareLyraHasInfoText
	waitbutton
	closetext
	turnobject DAYCARE_LYRA, UP
	showtext DayCareLyraEmbarassedText
	applymovement DAYCARE_LYRA, DayCareMovementData_LyraLeaves
	disappear DAYCARE_LYRA
	setscene SCENE_DAYCARE_NOOP
	end

.GetPlayerPronouns:
	assert PLAYER_MALE & 1 == 0
	assert PLAYER_FEMALE & 1 == 1
	assert PLAYER_ENBY & 1 == 0
	assert PLAYER_BETA & 1 == 1
	ld a, [wPlayerGender]
	and 1
	jr nz, .female
	ld de, .boy
	ld hl, wStringBuffer3
	call CopyName2
	ld de, .he
	ld hl, wStringBuffer4
	jmp CopyName2

.female
	ld de, .girl
	ld hl, wStringBuffer3
	call CopyName2
	ld de, .she
	ld hl, wStringBuffer4
	jmp CopyName2

.boy:  db "Junge… Freund.@"
.girl: db "Mädchen… Freundin.@"
.she:  db "Sie ist doch talentiert.@"
.he:   db "Er ist doch talentiert.@"

DayCareManScript_Inside:
	faceplayer
	opentext
	checkevent EVENT_GOT_ODD_EGG
	iftruefwd .AlreadyHaveOddEgg
	writetext DayCareManText_GiveOddEgg
	promptbutton
	special GiveOddEgg
	iffalse_jumpopenedtext DayCareText_PartyAndBoxFull
	writetext DayCareText_GotOddEgg
	playsound SFX_GET_EGG_FROM_DAYCARE_LADY
	waitsfx
	ifequalfwd 1, .InParty
	special Special_CurBoxFullCheck
	iffalsefwd .BoxNotFull
	farwritetext _CurBoxFullText
.BoxNotFull
	special GetCurBoxName
	farwritetext _EggSentToPCText
	promptbutton
.InParty:
	writetext DayCareText_DescribeOddEgg
	setevent EVENT_GOT_ODD_EGG
	waitendtext

.AlreadyHaveOddEgg:
	special Special_DayCareMan
	waitendtext

DayCareLadyScript:
	faceplayer
	opentext
	checkflag ENGINE_DAY_CARE_MAN_HAS_EGG
	iftrue_jumpopenedtext Text_GrampsLookingForYou
	checkevent EVENT_LYRA_GAVE_AWAY_EGG
	iffalsefwd .NoLyrasEgg
	checkevent EVENT_GOT_LYRAS_EGG
	iftruefwd .NoLyrasEgg
	writetext DayCareLadyText_GiveLyrasEgg
	promptbutton
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftruefwd .GiveCyndaquilEgg
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftruefwd .GiveTotodileEgg
	giveegg CHIKORITA
	sjumpfwd .GotLyrasEgg

.GiveCyndaquilEgg:
	giveegg CYNDAQUIL
	sjumpfwd .GotLyrasEgg

.GiveTotodileEgg:
	giveegg TOTODILE
.GotLyrasEgg
	iffalse_jumpopenedtext DayCareText_PartyAndBoxFull
	writetext DayCareLadyText_DescribeLyrasEgg
	setevent EVENT_GOT_LYRAS_EGG
	waitendtext

.NoLyrasEgg:
	special Special_DayCareLady
	waitendtext

DayCareMovementData_LyraApproachesGrandma:
	step_right
	step_right
	step_right
	step_right
	step_right
	step_up
	step_end

DayCareMovementData_LyraStartsToLeave:
	step_right
	step_down
	step_end

DayCareMovementData_LyraLeaves:
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

DayCareLyraHelloText:
	text "Lyra: Oma!"

	para "Lass mich dir"
	line "jemanden"
	cont "vorstellen."

	para "Das ist <PLAYER>!"

	para "Oma: Aha."

	para "Das ist wohl dein"
	line ""
	text_ram wStringBuffer3

	para "Verstehe. Hmm."
	done

DayCareLyraProtestText:
	text "Lyra: Was?"
	line "Oma…!"

	para "Wovon redest"
	line "du?"

	para "<PLAYER> wohnt"
	line "nur in der Nähe…"

	para "Oma: Hahaha."
	line "Schon gut, schon"
	cont "gut."

	para ""
	text_ram wStringBuffer4

	para "Stimmt's,"
	line "<PLAYER>?"
	line "Komm uns mal"
	cont "besuchen!"
	done

DayCareLyraGoodbyeText:
	text "Lyra: Ich sollte"
	line "jetzt gehen…"
	cont "Tschüss!"
	done

DayCareLyraForgotText:
	text "Lyra: Ach!"
	line "Fast vergessen!"

	para "Hier! Das ist"
	line "meine #Com-"
	cont "Nummer!"
	done

GotLyrasNumberText:
	text "Du speicherst"
	line "Lyras Nummer."
	done

DayCareLyraHasInfoText:
	text "Ruf mich an,"
	line "wann du willst!"

	para "Oma und Opa"
	line "haben mir viel"
	cont "über #mon"
	cont "beigebracht,"

	para "und das geb ich"
	line "gern an dich"
	cont "weiter."
	done

DayCareLyraEmbarassedText:
	text "Lyra: Oma!"

	para "Hör auf damit!"

	para "Wir sind beide"
	line "Trainer, und"

	para "Trainer tauschen"
	line "Nummern aus."
	cont "Mehr nicht."
	done

Text_GrampsLookingForYou:
	text "Opa hat nach dir"
	line "gesucht."
	done






Text_DayCareManTalksAboutEggTicket: ; unreferenced
	text "Ich bin der"
	line "PENSIONSLEITER."

	para "In DUKATIA CITY"
	line "gibt es etwas"

	para "Neues, das man"
	line "TAUSCHECKE nennt."

	para "Ich erhielt ein"
	line "EI-TICKET, dass"

	para "man gegen ein"
	line "KURIOS-EI eintau-"
	cont "schen kann."

	para "Aber da wir eine"
	line "PENSION leiten,"

	para "brauchen wir es"
	line "nicht. Du kannst"

	para "es haben."
	done





DayCareManText_GiveOddEgg:
	text "Ich bin der"
	line "PENSIONSLEITER."

	para "Kennst du dich"
	line "mit EIERN aus?"

	para "Ich habe #mon"
	line "mit meiner"
	cont "Frau aufgezogen."

	para "Wir waren ent-"
	line "setzt, als wir"
	cont "ein"
	cont "EI fanden!"

	para "Das ist doch"
	line "unglaublich,"
	cont "oder?"

	para "Nun, möchtest du"
	line "das EI? Gut, nimm"

	para "es, du darfst es"
	line "behalten!"
	done






DayCareText_ComeAgain: ; unreferenced
	text "Komm wieder."
	done





DayCareText_GotOddEgg:
	text "<PLAYER> erhält"
	line "KURIOS-EI!"
	done





DayCareText_DescribeOddEgg:
	text "Ich fand dies,"
	line "als"
	line "ich mich um ein"

	para "#mon eines"
	line "anderen Trainers"

	para "kümmerte. Aber"
	line "der"
	line "Trainer wollte"
	cont "das"

	para "EI nicht, also"
	line "habe ich es"
	cont "behalten."
	done





DayCareLadyText_GiveLyrasEgg:
	text "Hallo, mein Kind."

	para "Lyra hat mir"
	line "gesagt, dieses EI"
	cont "ist ein Geschenk"
	cont "für dich. Bitte!"
	done

DayCareLadyText_DescribeLyrasEgg:
	text "Das EI stammt von"
	line "ihrem ersten"
	cont "#mon."

	para "Sie muss dir als"
	line "Trainerin wirk-"
	cont "lich vertrauen."
	done

DayCareText_PartyAndBoxFull:
	text "Du hast keinen"
	line "Platz dafür,"
	cont "nicht"
	cont "einmal in deiner"
	cont "Box."
	done
