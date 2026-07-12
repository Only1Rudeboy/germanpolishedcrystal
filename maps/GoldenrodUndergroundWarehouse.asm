GoldenrodUndergroundWarehouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, GoldenrodUndergroundResetSwitches

	def_warp_events
	warp_event  2, 12, GOLDENROD_UNDERGROUND_SWITCH_ROOM, 2
	warp_event  3, 12, GOLDENROD_UNDERGROUND_SWITCH_ROOM, 3
	warp_event 17,  2, GOLDENROD_DEPT_STORE_B1F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  9,  8, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerGruntM24, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  8, 15, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerGruntM14, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 14,  3, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerGruntM15, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 12,  8, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodUndergroundWarehouseDirectorScript, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	itemball_event 18, 15, MAX_ETHER, 1, EVENT_GOLDENROD_UNDERGROUND_WAREHOUSE_MAX_ETHER
	tmhmball_event 13,  9, TM_X_SCISSOR, EVENT_GOLDENROD_UNDERGROUND_WAREHOUSE_TM_X_SCISSOR
	itemball_event  2,  1, ULTRA_BALL, 1, EVENT_GOLDENROD_UNDERGROUND_WAREHOUSE_ULTRA_BALL

GenericTrainerGruntM24:
	generictrainer GRUNTM, 24, EVENT_BEAT_ROCKET_GRUNTM_24, GruntM24SeenText, GruntM24BeatenText

	text "TEAM ROCKET wird"
	line "weitermachen. Sie"
	cont "warten auf die"
	cont "Rückkehr von"
	cont "GIOVANNI."

	para "Wir werden alles"
	line "dafür geben."
	done
GenericTrainerGruntM14:
	generictrainer GRUNTM, 14, EVENT_BEAT_ROCKET_GRUNTM_14, GruntM14SeenText, GruntM14BeatenText

	text "Ich habe verloren…"

	para "Bitte vergib mir,"
	line "GIOVANNI!"
	done
GenericTrainerGruntM15:
	generictrainer GRUNTM, 15, EVENT_BEAT_ROCKET_GRUNTM_15, GruntM15SeenText, GruntM15BeatenText

	text "Hiuck-hiuck-hiuck!"
	line "Das war grandios!"
	cont "Ich werde dich"
	cont "nicht vergessen!"
	done
GoldenrodUndergroundWarehouseDirectorScript:
	checkevent EVENT_RECEIVED_CARD_KEY
	iftrue_jumptextfaceplayer DirectorAfterText
	faceplayer
	opentext
	writetext DirectorIntroText
	promptbutton
	verbosegivekeyitem CARD_KEY
	setevent EVENT_RECEIVED_CARD_KEY
	setevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_1
	clearevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_2
	clearevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_3
	writetext DirectorCardKeyText
	promptbutton
	jumpopenedtext DirectorAfterText

GruntM24SeenText:
	text "Wie bist du so"
	line "weit gekommen?"

	para "Ich denke, es gibt"
	line "keine andere"
	cont "Lösung, um dich"
	cont "loszuwerden."
	done


GruntM24BeatenText:
	text "Er wurde mich los…"
	done


GruntM14SeenText:
	text "Weiter kommst du"
	line "nicht!"

	para "Ich habe niemals"
	line "Mitleid mit meinen"
	cont "Gegnern, auch"
	cont "nicht mit Kindern!"
	done


GruntM14BeatenText:
	text "Verdammt!"
	done


GruntM15SeenText:
	text "Hiuck-hiuck-hiuck!"
	line "Ich kenne dich!"

	para "Du hast mich in"
	line "unserem Versteck"
	cont "richtig vermöbelt!"
	done


GruntM15BeatenText:
	text "Hiuck-hiuck-hiuck!"
	line "So ist das also?"
	done


DirectorIntroText:
	text "INTENDANT: Wie?"
	line "Was? Du willst"
	cont "mich retten?"

	para "Danke!"

	para "Der RADIOTURM!"

	para "Was geschieht"
	line "dort?"

	para "Von TEAM ROCKET"
	line "besetzt?"

	para "Hier, nimm diesen"
	line "TÜRÖFFNER."
	done


DirectorCardKeyText:
	text "INTENDANT: Damit"
	line "kannst du den"
	cont "Rollladen im 2S"
	cont "öffnen."
	done


DirectorAfterText:
	text "Ich flehe dich an,"
	line "uns zu helfen."

	para "Niemand weiß, was"
	line "sie vorhaben, wenn"

	para "sie erst Kontrolle"
	line "über den"
	cont "Transmitter"
	cont "erlangen."

	para "Sie könnten sogar"
	line "mit einem"
	cont "Spezialsignal alle"
	cont "#mon"
	cont "kontrollieren!"

	para "Bitte hilf mir! Du"
	line "bist meine letzte"
	cont "Rettung."

	para "Bitte rette den"
	line "RADIOTURM…"

	para "Und alle #mon"
	line "in diesem Land!"
	done


