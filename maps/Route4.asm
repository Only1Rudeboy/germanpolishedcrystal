Route4_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4,  7, MOUNT_MOON_B1F, 8
	warp_event 19,  5, MOUNT_MOON_SQUARE, 1

	def_coord_events

	def_bg_events
	bg_event  7,  9, BGEVENT_JUMPTEXT, MtMoonSignText
	bg_event 17,  9, BGEVENT_JUMPTEXT, CableCarSignText
	bg_event 15,  4, BGEVENT_ITEM + ULTRA_BALL, EVENT_ROUTE_4_HIDDEN_ULTRA_BALL

	def_object_events
	object_event 51,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerYoungsterOliver, -1
	object_event 38, 13, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerLassJennifer, -1
	object_event 28,  6, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBird_keeperHank, -1
	object_event 12, 10, SPRITE_PICNICKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerPicnickerHope, -1
	object_event 35,  8, SPRITE_PICNICKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerPicnickerSharon, -1
	object_event 26, 13, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route4SuperNerd1Script, -1
	object_event 29, 13, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route4SuperNerd2Script, -1
	object_event 19,  7, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Route4EngineerScript, EVENT_MT_MOON_RIVAL
	object_event 17,  5, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MT_MOON_RIVAL
	itemball_event 42,  5, HP_UP, 1, EVENT_ROUTE_4_HP_UP
	object_event 68,  6, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BEAT_BLUE

GenericTrainerYoungsterOliver:
	generictrainer YOUNGSTER, OLIVER, EVENT_BEAT_YOUNGSTER_OLIVER, YoungsterOliverSeenText, YoungsterOliverBeatenText

	text "Man sagt, ich"
	line "stelle zu viele"
	cont "Fragen, aber"

	para "so sind Kinder,"
	line "oder?"
	done

GenericTrainerLassJennifer:
	generictrainer LASS, JENNIFER, EVENT_BEAT_LASS_JENNIFER, LassJenniferSeenText, LassJenniferBeatenText

	text "#mon machen so"
	line "viel Spaß. Findest"
	cont "du nicht?"
	done

GenericTrainerBird_keeperHank:
	generictrainer BIRD_KEEPER, HANK, EVENT_BEAT_BIRD_KEEPER_HANK, Bird_keeperHankSeenText, Bird_keeperHankBeatenText

	text "Hast du ein spe-"
	line "zielles #mon,"

	para "das du trainieren"
	line "möchtest, setze es"

	para "an die erste"
	line "Stelle und tausche"
	cont "es sofort aus."

	para "So funktioniert"
	line "das."
	done
GenericTrainerPicnickerHope:
	generictrainer PICNICKER, HOPE, EVENT_BEAT_PICNICKER_HOPE, PicnickerHopeSeenText, PicnickerHopeBeatenText

	text "Ich hörte, dass"
	line "PIEPI am MONDBERG"

	para "auftauchen. Aber"
	line "wo soll das sein?"
	done
GenericTrainerPicnickerSharon:
	generictrainer PICNICKER, SHARON, EVENT_BEAT_PICNICKER_SHARON, PicnickerSharonSeenText, PicnickerSharonBeatenText

	text "……Ich sollte wohl"
	line "noch mehr"
	cont "trainieren…"
	done
Route4SuperNerd1Script:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_IRON_HEAD_INTRO
	iftruefwd Route4TutorIronHeadScript
	writetext Route4SuperNerd1Text
	waitbutton
	setevent EVENT_LISTENED_TO_IRON_HEAD_INTRO
Route4TutorIronHeadScript:
	writetext Text_Route4TutorIronHead
	waitbutton
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	writetext Text_Route4Tutor1Question
	yesorno
	iffalsefwd .TutorRefused
	setval IRON_HEAD
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpthisopenedtext

	text "Aber es ist besser"
	line "als Aqua Tail!"
	done

.NoSilverLeaf
	jumpopenedtext Text_Route4TutorsNoSilverLeaf

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "So! Dein #mon"
	line "kennt jetzt Iron"
	cont "Head!"
	done

Route4SuperNerd2Script:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_AQUA_TAIL_INTRO
	iftruefwd Route4TutorAquaTailScript
	writetext Route4SuperNerd2Text
	waitbutton
	setevent EVENT_LISTENED_TO_AQUA_TAIL_INTRO
Route4TutorAquaTailScript:
	writetext Text_Route4TutorAquaTail
	waitbutton
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	writetext Text_Route4Tutor2Question
	yesorno
	iffalsefwd .TutorRefused
	setval AQUA_TAIL
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpthisopenedtext

	text "Aber es ist besser"
	line "als Iron Head!"
	done

.NoSilverLeaf
	jumpopenedtext Text_Route4TutorsNoSilverLeaf

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "So! Dein #mon"
	line "kennt jetzt Aqua"
	cont "Tail!"
	done

Route4EngineerScript:
	showtext Route4EngineerText1
	showtextfaceplayer Route4EngineerText2
	turnobject LAST_TALKED, UP
	end

YoungsterOliverSeenText:
	text "Hallo! Wie heißt"
	line "du? Wohin gehst"
	cont "du?"
	done

YoungsterOliverBeatenText:
	text "Ich hab nur"
	line "gefragt…"
	done

LassJenniferSeenText:
	text "Ich kämpfe, wann"
	line "immer ich kann,"

	para "nur um Zeit mit"
	line "meinen #mon zu"
	cont "verbringen."
	done

LassJenniferBeatenText:
	text "Juhuu!"
	done

Bird_keeperHankSeenText:
	text "Ich trainiere"
	line "#mon. Trittst"
	cont "du gegen mich an?"
	done
Bird_keeperHankBeatenText:
	text "Uff! Ich habe"
	line "verloren…"
	done
PicnickerHopeSeenText:
	text "Ich spüre, dass"
	line "ich gewinnen kann."

	para "Mal sehen, ob das"
	line "stimmt!"
	done





PicnickerHopeBeatenText:
	text "Argh, du bist zu"
	line "stark."
	done





PicnickerSharonSeenText:
	text "Ähm… Ich…"
	done





PicnickerSharonBeatenText:
	text "…"
	done





Route4SuperNerd1Text:
	text "#mon mit harten"
	line "Köpfen sind top!"

	para "Arcanine, Golem,"
	line "Snorlax!"

	para "Findest du nicht?"
	done

Route4SuperNerd2Text:
	text "#mon mit langen"
	line "Schwänzen sind"
	cont "top!"

	para "Slowbro, Golduck,"
	line "Feraligatr!"

	para "Findest du nicht?"
	done

Text_Route4TutorIronHead:
	text "Gib mir ein"
	line "Silberblatt und"

	para "ich bringe deinem"
	line "#mon Iron Head"
	cont "bei!"
	done

Text_Route4TutorAquaTail:
	text "Gib mir ein"
	line "Silberblatt und"

	para "ich bringe deinem"
	line "#mon Aqua Tail"
	cont "bei!"
	done

Text_Route4TutorsNoSilverLeaf:
	text "Du hast kein"
	line "Silberblatt…"
	done

Text_Route4Tutor1Question:
	text "Soll ich deinem"
	line "#mon Iron Head"
	cont "beibringen?"
	done

Text_Route4Tutor2Question:
	text "Soll ich deinem"
	line "#mon Aqua Tail"
	cont "beibringen?"
	done





Route4EngineerText1:
	text "Zieht die"
	line "Schrauben fester"
	cont "an!"
	done

Route4EngineerText2:
	text "Die Seilbahn ist"
	line "gerade außer"
	cont "Betrieb."

	para "Bis wir sie"
	line "repariert haben,"

	para "ist der MONDBERG-"
	line "PLATZ geschlossen."
	done

MtMoonSignText:
	text "MONDBERG-TUNNEL"
	done

CableCarSignText:
	text "Seilbahn zum"
	line "MONDBERGPLATZ"
	done
