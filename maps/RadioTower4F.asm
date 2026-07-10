RadioTower4F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  0,  0, RADIO_TOWER_5F, 1
	warp_event  9,  0, RADIO_TOWER_3F, 2
	warp_event 12,  0, RADIO_TOWER_5F, 2
	warp_event 17,  0, RADIO_TOWER_3F, 3

	def_coord_events

	def_bg_events
	bg_event  7,  0, BGEVENT_JUMPTEXT, RadioTower4FProductionSignText
	bg_event 15,  0, BGEVENT_JUMPTEXT, RadioTower4FStudio2SignText

	def_object_events
	object_event  5,  6, SPRITE_ROCKET, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerGruntM10, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  6,  4, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, RadioTower4FFisherText, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event 14,  6, SPRITE_MARY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower4FDJMaryScript, -1
	pokemon_event 12,  7, MEOWTH, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BROWN, RadioTowerMeowthText, -1
	object_event 14,  1, SPRITE_PROTON, SPRITEMOVEDATA_STANDING_LEFT, 0, 2, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerProton1, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 12,  4, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerGruntF4, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  4,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerRocketScientistRich, EVENT_RADIO_TOWER_ROCKET_TAKEOVER

	object_const_def
	const RADIOTOWER4F_ROCKET

RadioTower4FDJMaryScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_FAIRYFEATHER_FROM_MARY
	iftrue_jumpopenedtext RadioTower4FDJMaryText_After
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftruefwd .ClearedRockets
	jumpthisopenedtext

	text "MARGIT: Warum?"
	line "Warum muss ich das"
	cont "durchmachen?"

	para "MAUZI, hilf mir!"
	done


.ClearedRockets:
	writetext RadioTower4FDJMaryText_ClearedRockets
	promptbutton
	verbosegiveitem FAIRYFEATHER
	iffalse_endtext
	setevent EVENT_GOT_FAIRYFEATHER_FROM_MARY
	jumpthisopenedtext

	text "MARGIT: Perfekt"
	line "für #mon mit"

	para "Fee-Attacken,"
	line "nicht wahr?"
	done

GenericTrainerGruntM10:
	generictrainer GRUNTM, 10, EVENT_BEAT_ROCKET_GRUNTM_10, GruntM10SeenText, GruntM10BeatenText

	text "Ich kann es nicht"
	line "glauben, ich wurde"
	cont "besiegt!"
	done
GenericTrainerProton1:
	generictrainer PROTON, PROTON1, EVENT_BEAT_PROTON_1, Proton1SeenText, Proton1BeatenText

	text "Du hast dir meinen"
	line "Respekt verdient."
	cont "Hier ist ein Tipp"
	cont "für dich."

	para "Es ist noch nicht"
	line "zu spät. Noch"
	cont "kannst du"
	cont "umkehren."
	done
GenericTrainerGruntF4:
	generictrainer GRUNTF, 4, EVENT_BEAT_ROCKET_GRUNTF_4, GruntF4SeenText, GruntF4BeatenText

	text "Ich liebe mein"
	line "hübsches Äußeres!"

	para "Wer schert sich um"
	line "#mon?"
	done
GenericTrainerRocketScientistRich:
	generictrainer ROCKET_SCIENTIST, RICH, EVENT_BEAT_ROCKET_SCIENTIST_RICH, RocketScientistRichSeenText, RocketScientistRichBeatenText

	text "Glaubst du allen"
	line "Ernstes, TEAM"
	cont "ROCKET aufhalten"
	cont "zu können?"
	done
RadioTower4FFisherText:
	text "Als ich bei den"
	line "RUINEN war, hörte"
	cont "ich Radio."

	para "Ich empfing eine"
	line "seltsame Sendung."
	done





RadioTower4FDJMaryText_ClearedRockets:
	text "MARGIT: Oh! Du"
	line "hast mich"
	cont "gerettet! Nimm"
	cont "dies als"

	para "Zeichen meines"
	line "Dankes!"
	done





RadioTower4FDJMaryText_After:
	text "MARGIT: Wir hören"
	line "uns in PROF."

	para "EICHs #mon-"
	line "TALKSHOW wieder."
	done





RadioTowerMeowthText:
	text "MAUZI: Mauzi…"
	done





GruntM10SeenText:
	text "Du hast vor, den"
	line "INTENDANTEN zu"
	cont "retten?"

	para "Dies wird nicht"
	line "möglich sein, da"
	cont "ich dich besiege!"
	done





GruntM10BeatenText:
	text "Nein! Unglaublich!"
	done





Proton1SeenText:
	text "Stopp! Ich bin als"
	line "TEAM ROCKET-"
	cont "Festung bekannt!"

	para "Keinen Schritt"
	line "weiter!"
	done
Proton1BeatenText:
	text "Die Festung wurde"
	line "gestürmt!"
	done
GruntF4SeenText:
	text "Sind #mon nicht"
	line "wirklich niedlich?"

	para "Ich denke, meine"
	line "#mon sind"

	para "niedlich nachdem"
	line "sie deine besiegt"
	cont "haben!"
	done





GruntF4BeatenText:
	text "Ach, nein! Sie"
	line "sind absolut"
	cont "unnütz!"
	done





RocketScientistRichSeenText:
	text "Exzellent."

	para "Mit dem RADIOTURM"
	line "können wir unser"
	cont "Vorhaben in die"
	cont "Tat umsetzen."
	done
RocketScientistRichBeatenText:
	text "Hmmm…"

	para "Jeder große Plan"
	line "hat einen Haken."
	done
RadioTower4FProductionSignText:
	text "3S PRODUKTION"
	done





RadioTower4FStudio2SignText:
	text "3S STUDIO 2"
	done





