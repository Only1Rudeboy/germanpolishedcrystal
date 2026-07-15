WarmBeach_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 15, 13, WARM_BEACH_SHACK, 1
	warp_event  8,  5, SHAMOUTI_TUNNEL, 2
	warp_event  3,  8, WARM_BEACH_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 17, 14, BGEVENT_JUMPTEXT, WarmBeachShackSignText
	bg_event 18, 20, BGEVENT_JUMPTEXT, WarmBeachShrineText
	bg_event 19, 20, BGEVENT_JUMPTEXT, WarmBeachShrineText
	bg_event  7, 20, BGEVENT_ITEM + PEARL, EVENT_WARM_BEACH_HIDDEN_PEARL

	def_object_events
	object_event 11,  8, SPRITE_SIGHTSEER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSightseermGareth, -1
	object_event  4, 12, SPRITE_AROMA_LADY, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerAromaLadyHolly, -1
	object_event 11, 14, SPRITE_COOL_DUDE, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, WarmBeachCooltrainermText, -1
	object_event 22, 20, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, WarmBeachCooltrainerfText, -1
	object_event 17, 21, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, SLOWKING, -1, PAL_MON_PINK, OBJECTTYPE_SCRIPT, PLAIN_FORM, WarmBeachSlowkingScript, -1
	object_event 11, 20, SPRITE_PICNICKER, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, WarmBeachLassScript, -1
	object_event  6, 23, SPRITE_LADY, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, WarmBeachLadyText, -1

GenericTrainerSightseermGareth:
	generictrainer SIGHTSEERM, GARETH, EVENT_BEAT_SIGHTSEERM_GARETH, .SeenText, .BeatenText

	text "Auch außerhalb von"
	line "Kämpfen sind diese"
	para "Items schöne"
	line "Souvenirs."
	done

.SeenText:
	text "Ich hab gerade"
	line "nützliche Items"
	para "auf dem"
	line "Freiluftmarkt"
	cont "gekauft!"
	done

.BeatenText:
	text "Meine Items"
	line "reichten nicht…"
	done

GenericTrainerAromaLadyHolly:
	generictrainer AROMA_LADY, HOLLY, EVENT_BEAT_AROMA_LADY_HOLLY, .SeenText, .BeatenText

	text "Der Geruchssinn"
	line "ist wichtig, um in"
	cont "der Natur zu"
	cont "leben."
	done

.SeenText:
	text "Ich bin eins mit"
	line "den Düften der"
	cont "Natur."
	done

.BeatenText:
	text "Niederlage hat"
	line "einen eigenen"
	cont "Geruch…"
	done

WarmBeachCooltrainermText:
	text "Hier gibt es ein"
	line "#mon, das"
	cont "spricht!"
	para "Ich würde es nicht"
	line "glauben, wenn ich"
	para "es nicht selbst"
	line "gesehen hätte!"
	done

WarmBeachCooltrainerfText:
	text "Ich wurde als"
	line "Festmaid dieses"
	para "Jahrs gewählt und"
	line "muss die Melodie"
	para "des Auserwählten"
	line "spielen."
	para "Ich bin nervös und"
	line "übe deshalb hier."
	done

WarmBeachSlowkingScript:
	jumpthistext

	text "Ich könnte eine"
	line "Hose gebrauchen…"
	done

WarmBeachLassScript:
	faceplayer
	opentext
	checkflag ENGINE_SEASHORE_SHELL_BELL
	iftrue_jumpopenedtext .Text3
	writetext .Text1
	special PlaceMoneyTopRight
	yesorno
	iffalse_jumpopenedtext .Text4
	checkmoney YOUR_MONEY, 4000
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	giveitem SHELL_BELL
	iffalse_jumpopenedtext .Text6
	setflag ENGINE_SEASHORE_SHELL_BELL
	waitsfx
	playsound SFX_TRANSACTION
	takemoney YOUR_MONEY, 4000
	special PlaceMoneyTopRight
	jumpthisopenedtext

	text "Eine"
	line "Muschelglocke, nur"
	cont "für dich!"
	done

.NotEnoughMoney:
	jumpthisopenedtext

	text "Du hast nicht"
	line "genug Geld…"
	done

.Text1:
	text "Ich sammle"
	line "Muscheln am Strand"
	cont "und"
	para "mache daraus"
	line "Muschelglocken."
	para "Man sagt, ihr"
	line "Klang heilt."
	para "Sie kosten ¥4000."
	line "Willst du eine?"
	done

.Text3:
	text "Heute habe ich nur"
	line "eine Muschelglocke"
	cont "gemacht …"
	done

.Text4:
	text "Schon okay!"
	done

.Text6:
	text "Du hast keinen"
	line "Platz mehr…"
	done

WarmBeachLadyText:
	text "Die Inseln drüben"
	line "werden als Tempel"
	para "des Feuers, des"
	line "Eises und des"
	para "Blitzes"
	line "bezeichnet."
	para "So steht es in"
	line "dieser Broschüre -"
	para "aber wozu sind sie"
	line "da?"
	done

WarmBeachShackSignText:
	text "Strandhütte"
	done

WarmBeachShrineText:
	text "Ein Schrein für"
	line "den Wächter der"
	cont "Meere."
	done
