CeladonHotelRoom2_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  5, CELADON_HOTEL_2F, 3
	warp_event  4,  5, CELADON_HOTEL_2F, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, MrHyperScript, -1

MrHyperScript:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_MR_HYPER
	iftruefwd .IntroDone
	writetext .TextIntro
	waitbutton
	setevent EVENT_TALKED_TO_MR_HYPER
	; fallthrough
.IntroDone:
	writetext .TextAskTrain
	yesorno
	iffalse_jumpopenedtext .TextComeBackAnytime
.CheckBottleCaps:
	checkitem BOTTLE_CAP
	iffalse_jumpopenedtext .TextNoBottleCaps
	writetext .TextTrainWho
	waitbutton
	special Special_HyperTrain
	iffalse_jumpopenedtext .TextComeBackAnytime
	takeitem BOTTLE_CAP
	writetext .TextGotStronger
	waitbutton
	writetext .TextTrainSomeMore
	yesorno
	iftrue .CheckBottleCaps
	jumpthisopenedtext

.TextComeBackAnytime:
	text "Komm jederzeit"
	line "wieder! MR. SUPER-"
	cont "SPEZIAL freut sich"
	cont "immer!"
	done

.TextIntro:
	text "Ich bin MR. SUPER-"
	line "SPEZIAL!"
	para "Weißt du auch"
	line "warum?"
	para "Weil ich #MON"
	line "beim Super-"
	cont "Spezialtraining"
	cont "helfe!"
	para "Es lässt ein"
	line "#MON, dessen"
	cont "Fleiß-Werte maxi-"
	cont "mal sind, noch"
	cont "stärker werden!"
	para "Dieses Training"
	line "verbessert ihre"
	cont "Statuswerte."
	para "Wenn du willst,"
	line "trainiere ich dein"
	cont "#MON für ein"
	cont "paar Kronkorken."
	done

.TextAskTrain:
	text "Na, wie klingt's?"
	line "Willst du mein"
	cont "Super-Spezial-"
	cont "training"
	cont "probieren?"
	done

.TextNoBottleCaps:
	text "Du hast keine"
	line "Kronkorken?"

	para "Angler fangen"
	line "manchmal welche…"
	done

.TextTrainWho:
	text "Welches #MON"
	line "soll ich stärken?"
	done

.TextGotStronger:
	text "Fertig! Die Werte"
	line "von"
	cont ""
	text_ram wStringBuffer1
	cont "steigen!"
	done

.TextTrainSomeMore:
	text "Noch ein #MON"
	line "trainieren?"
	done
