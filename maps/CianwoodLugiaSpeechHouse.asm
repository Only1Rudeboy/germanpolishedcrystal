CianwoodLugiaSpeechHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, CIANWOOD_CITY, 6
	warp_event  3,  7, CIANWOOD_CITY, 6

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_JUMPSTD, picturebookshelf
	bg_event  1,  1, BGEVENT_JUMPSTD, picturebookshelf

	def_object_events
	object_event  2,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CianwoodLugiaSpeechHouseTeacherText, -1
	object_event  6,  5, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CianwoodLugiaSpeechHouseLassText, -1
	object_event  0,  2, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, CianwoodLugiaSpeechHouseTwinText, -1
	object_event  5,  3, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodHouseBlackBeltScript, -1

CianwoodHouseBlackBeltScript:
	checkevent EVENT_GOT_ASSAULT_VEST_FROM_CIANWOOD
	iftrue_jumptextfaceplayer CianwoodHouseBlackBeltText2
	faceplayer
	opentext
	writetext CianwoodHouseBlackBeltText1
	promptbutton
	verbosegiveitem ASSAULT_VEST
	iffalse_endtext
	setevent EVENT_GOT_ASSAULT_VEST_FROM_CIANWOOD
	jumpopenedtext CianwoodHouseBlackBeltText2

CianwoodHouseBlackBeltText1:
	; PC
	text "Ich ging in die"
	line "ARENA in dieser"
	cont "Weste,"
	para "aber man hat mich"
	line "ausgelacht und"
	cont "rausgeworfen!"
	para "Ich kann sie dort"
	line "nicht mehr"
	cont "tragen--"
	para "du kannst sie"
	line "haben."
	done

CianwoodHouseBlackBeltText2:
	; PC
	text "Gut. Ich werde"
	line "hart trainieren"
	para "und mir einen"
	line "Platz in der ARENA"
	cont "verdienen!"
	done

CianwoodLugiaSpeechHouseTeacherText:
	; GSC-DE Dump
	text "Du kommst von"
	line "OLIVIANA CITY?"
	para "Hast du auf dem"
	line "Weg hierher die"
	cont "vier Inseln ge-"
	cont "sehen?"
	para "Ich habe gehört,"
	line "dass sich dort ein"
	cont "mythisches Wesen"
	cont "verstecken soll."
	done

CianwoodLugiaSpeechHouseLassText:
	; GSC-DE Dump
	text "Man sagt auch,"
	line "dass man es nur"
	para "sehen kann, wenn"
	line "man einen SILBER-"
	cont "FLÜGEL hat."
	para "Er muss denselben"
	line "Geruch wie diese"
	cont "Kreatur haben."
	done

CianwoodLugiaSpeechHouseTwinText:
	; PC
	text "Ich hörte, dass"
	line "die Strudel um die"
	para "Inseln von der"
	line "Meereskreatur"
	cont "verursacht werden."
	para "Es könnte einer"
	line "Spezialattacke"
	cont "bedürfen, um sie"
	cont "zu passieren."
	done



