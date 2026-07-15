CeladonUniversityCafeteria_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 13,  7, CELADON_UNIVERSITY_2F, 2
	warp_event 14,  7, CELADON_UNIVERSITY_2F, 2

	def_coord_events

	def_bg_events
	bg_event 10,  0, BGEVENT_JUMPTEXT, CeladonUniversityCafeteriaSignText

	def_object_events
	object_event 11,  2, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonUniversityCafeteriaCoreyScript, -1
	object_event  4,  2, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityCafeteriaCooltrainerfText, -1
	object_event  7,  3, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityCafeteriaBeautyText, -1
	object_event  2,  6, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityCafeteriaYoungster1Text, -1
	object_event  8,  6, SPRITE_LADY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityCafeteriaLadyText, -1
	object_event 11,  5, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonUniversityCafeteriaYoungster2Script, -1
	object_event  0,  3, SPRITE_BAKER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonUniversityCafeteriaBakerScript, -1

	object_const_def
	const CELADONUNIVERSITYCAFETERIA_COREY

CeladonUniversityCafeteriaCoreyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_COOLTRAINERM_COREY
	iftruefwd .Beaten
	checkevent EVENT_INTRODUCED_CELADON_FOUR
	iftruefwd .IntroducedCeladonFour1
	writetext .IntroText1
	sjumpfwd .AfterIntro
.IntroducedCeladonFour1
	writetext .IntroText2
.AfterIntro
	yesorno
	iffalse_jumpopenedtext .NoBattleText
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked CELADONUNIVERSITYCAFETERIA_COREY
	loadtrainer COOLTRAINERM, COOLTRAINERM_COREY
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_COOLTRAINERM_COREY
	opentext
.Beaten
	setevent EVENT_INTRODUCED_CELADON_FOUR
	checkevent EVENT_BEAT_COOLTRAINERM_RAYMOND
	iffalse_jumpopenedtext .AfterText1
	checkevent EVENT_BEAT_COOLTRAINERM_FERGUS
	iffalse_jumpopenedtext .AfterText1
	checkevent EVENT_BEAT_COOLTRAINERF_NEESHA
	iffalse_jumpopenedtext .AfterText1
	checkevent EVENT_GOT_CHOICE_BAND_FROM_CELADON_FOUR
	iftrue_jumpopenedtext .FinalText
	writetext .AfterText2
	promptbutton
	verbosegiveitem CHOICE_BAND
	iffalse_jumpopenedtext CeladonUni_NoRoomText
	setevent EVENT_GOT_CHOICE_BAND_FROM_CELADON_FOUR
	jumpthisopenedtext

.FinalText:
	text "Du wärst ein"
	line "Star-Student, wenn"
	cont "du dich hier"
	para "einschreibst."
	para "Aber du hast"
	line "andere Ziele,"
	cont "oder?"
	done

.IntroText1:
	text "Ich bin Corey!"
	line "Einer der vier"
	cont "Toptrainer der"
	cont "Prismania-Uni."

	para "Man kennt uns als"
	line "Prismanias Vier!"

	para "Lass mich zeigen,"
	line "wie wir den Titel"

	para "mit einem Kampf"
	line "verdienten!"
	done

.IntroText2:
	text "Ich bin Corey!"
	line "Einer der"
	cont "Prismanias Vier!"
	para "Du forderst uns"
	line "alle vier heraus?"
	para "Klar, ich bin hier"
	line "eh fertig mit"
	cont "Essen."
	para "Bereit für den"
	line "Kampf?"
	done

.NoBattleText:
	text "Ja, wir können"
	line "einschüchtern."
	done

.SeenText:
	text "Das wird ein"
	line "Leichtes!"
	done

.BeatenText:
	text "Ich hab dich"
	line "unterschätzt…"
	done

.AfterText1:
	text "Du bist stark!"
	para "Aber ich bin nur"
	line "einer der"
	cont "Prismanias Vier."
	para "Sucht die anderen,"
	line "um deine Stärke"
	para "wirklich zu"
	line "testen!"
	done

.AfterText2:
	text "Du hast alle vier"
	line "Prismanias Vier"
	cont "besiegt?"

	para "Glückwunsch!"

	para "Nimm das als"
	line "Andenken!"
	done

CeladonUni_NoRoomText:
	text "Das kannst du"
	line "nicht tragen."
	done

CeladonUniversityCafeteriaCooltrainerfText:
	text "Hier gibt's die"
	line "besten"
	cont "Hamburger-Steaks"
	cont "im"
	para "Zinnober-Stil"
	line "diesseits von"
	cont "Kanto!"
	para "Fühlt sich an wie"
	line "zuhause."
	done

CeladonUniversityCafeteriaBeautyText:
	text "Der Koch hat"
	line "endlich wieder"
	cont "Spezialität"
	cont "gemacht!"

	para "Ich hol mir"
	line "vielleicht"
	cont "Nachschlag."
	done

CeladonUniversityCafeteriaYoungster1Text:
	text "Ich bat die Mensa,"
	line "Stratos-Eis zu"
	cont "führen."
	para "Es erinnert mich"
	line "an daheim, und"
	cont "schmeckt lecker!"
	done

CeladonUniversityCafeteriaLadyText:
	text "Ich mache Diät."
	line "Heute gibt's einen"
	para "nahrhaften"
	line "Rutschsamen-Salat."
	done

CeladonUniversityCafeteriaYoungster2Script:
	checkevent EVENT_GOT_LEMONADE_IN_UNIVERSITY
	iftrue_jumptextfaceplayer .Text2
	faceplayer
	opentext
	writetext .Text1
	promptbutton
	verbosegiveitem LEMONADE
	iffalse_jumpopenedtext CeladonUni_NoRoomText
	setevent EVENT_GOT_LEMONADE_IN_UNIVERSITY
	jumpopenedtext .Text2

.Text1:
	text "Der Automat gab"
	line "mir ein Getränk"
	cont "extra!"

	para "Lass es mich mit"
	line "dir teilen."
	done

.Text2:
	text "Ich liebe kalte"
	line "Limonade nach"
	cont "hartem Kampf."
	done

CeladonUniversityCafeteriaBakerScript:
	faceplayer
	opentext
	checkflag ENGINE_BOUGHT_LEFTOVERS
	iftrue_jumpopenedtext .Text3
	writetext .Text1
	special PlaceMoneyTopRight
	yesorno
	iffalse_jumpopenedtext .Text4
	checkmoney YOUR_MONEY, 4000
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	giveitem LEFTOVERS
	iffalse_jumpopenedtext .Text6
	setflag ENGINE_BOUGHT_LEFTOVERS
	waitsfx
	playsound SFX_TRANSACTION
	takemoney YOUR_MONEY, 4000
	special PlaceMoneyTopRight
	jumpthisopenedtext

.Text2:
	text "Hier, Schätzchen!"
	line "Guten Appetit!"
	done

.NotEnoughMoney:
	jumpthisopenedtext

	text "Du hast nicht"
	line "genug Geld…"
	done

.Text1:
	text "Was denn,"
	line "Schätzchen?"

	para "Tut mir leid, das"
	line "Abendessen ist"
	cont "vorbei."

	para "Ich hab noch"
	line "Überreste, aber"

	para "die kosten ¥4000."
	line "Willst du welche?"
	done

.Text3:
	text "Heute gibt's keine"
	line "Überreste mehr."
	done

.Text4:
	text "Schönen Tag noch!"
	done

.Text6:
	text "Das kannst du"
	line "nicht tragen,"
	cont "Schätzchen."
	done

CeladonUniversityCafeteriaSignText:
	text "Bitte räum auf,"
	line "wenn du fertig"
	cont "gegessen hast."
	done
