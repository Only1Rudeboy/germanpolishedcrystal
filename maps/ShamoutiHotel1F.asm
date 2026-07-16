ShamoutiHotel1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, ShamoutiHotel1FRestaurantTrigger

	def_warp_events
	warp_event  8,  7, SHAMOUTI_ISLAND, 2
	warp_event  9,  7, SHAMOUTI_ISLAND, 2
	warp_event  2,  0, SHAMOUTI_HOTEL_2F, 1
	warp_event 14,  0, SHAMOUTI_HOTEL_RESTAURANT, 1

	def_coord_events

	def_bg_events
	bg_event 15,  0, BGEVENT_JUMPTEXT, ShamoutiHotelRestaurantSignText

	def_object_events
	object_event  8,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, ShamoutiHotel1FReceptionistText, -1
	object_event  2,  4, SPRITE_ARTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ShamoutiHotel1FArtistScript, -1
	object_event  5,  4, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, ShamoutiHotel1FCooltrainermText, -1
	object_event 12,  5, SPRITE_LADY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, ShamoutiHotel1FLadyText, -1
	object_event 14,  7, SPRITE_CAMPER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, ShamoutiHotel1FYoungsterText, -1

ShamoutiHotel1FRestaurantTrigger:
	setmapscene SHAMOUTI_HOTEL_RESTAURANT, SCENE_SHAMOUTIHOTELRESTAURANT_MEET
	endcallback

ShamoutiHotel1FReceptionistText:
	text "Willkommen im"
	line "Shamouti Hotel."
	para "Leider sind alle"
	line "Zimmer belegt,"
	para "aber besuche unser"
	line "Oasis-Restaurant."
	done

ShamoutiHotel1FArtistScript:
	faceplayer
	opentext
	checkflag ENGINE_CHANGED_TRENDY_PHRASE
	iftruefwd .SetTrendyPhraseToday
	writetext .Text1
	yesorno
	iftruefwd .Yes
	writetext .Text2
	promptbutton
	special SpecialTrendyPhrase
	setflag ENGINE_CHANGED_TRENDY_PHRASE
	jumpopenedtext .Text3

.SetTrendyPhraseToday
	jumpopenedtext .Text4

.Yes
	jumpopenedtext .Text5

.Text1:
	text "Egal wohin du"
	line "gehst, <TRENDY>"

	para "ist das Coolste!"
	line "Stimmt's nicht?"
	done

.Text2:
	text "Was?! <TRENDY> ist"
	line "nicht das Coolste?"
	para "Na, was ist denn"
	line "heutzutage das"
	cont "Coolste?"
	done

.Text3:
	text "Ach ja! Jetzt hab"
	line "ich's!"

	para "<TRENDY> ist"
	line "einfach das Beste"
	cont "überhaupt!"
	done

.Text4:
	text "<TRENDY> ist"
	line "gerade total"
	cont "angesagt!"
	done

.Text5:
	text "Du weißt es! Ich"
	line "kann nicht genug"
	cont "von <TRENDY>"
	cont "bekommen!"
	done

ShamoutiHotel1FCooltrainermText:
	text "Also, <TRENDY> ist"
	line "das neue Ding? Das"
	cont "ist echt cool!"
	done

ShamoutiHotel1FLadyText:
	text "Hast du beim"
	line "Angeln schon mal"
	cont "einen Bottle Cap"
	cont "gefunden?"
	para "In Alola, woher"
	line "ich komme, gibt es"
	cont "einen Mann,"
	para "der deinem #MON"
	line "Hyper-Training"
	cont "geben kann--und"
	para "so sein volles"
	line "Potenzial"
	cont "ausschöpft--nur"
	cont "für einen Bottle"
	cont "Cap."
	done

ShamoutiHotel1FYoungsterText:
	text "Ich hab gehört,"
	line "<TRENDY> ist"
	cont "gerade 'in'!"
	done

ShamoutiHotelRestaurantSignText:
	text "Oasis-Restaurant"
	done
