SilphCo3F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 11,  0, SILPH_CO_2F, 2

	def_coord_events

	def_bg_events
	bg_event  8,  0, BGEVENT_JUMPTEXT, SilphCoElevatorText
	bg_event  4,  3, BGEVENT_JUMPTEXT, SilphCo3FDeptSignText
	bg_event 10,  3, BGEVENT_JUMPTEXT, SilphCo3FDeptSignText
	bg_event  0,  5, BGEVENT_JUMPTEXT, SilphCo3FPhotoText
	bg_event  1,  5, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  5,  0, BGEVENT_JUMPSTD, difficultbookshelf

	def_object_events
	object_event 10,  7, SPRITE_SILPH_EMPLOYEE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo3FSilphEmployeeScript, -1
	object_event  2,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SilphCo3FScientist1Text, -1
	object_event  9,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SilphCo3FScientist2Text, -1
	object_event 14,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, pokemart, MARTTYPE_SILPH, MART_SILPH_CO, -1
	object_event 13,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, SilphCo3FOfficerText, -1
	object_event  7,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, SilphCo3FGentlemanText, -1

SilphCo3FSilphEmployeeScript:
	checkevent EVENT_GOT_CHERISH_BALL_FROM_SAFFRON
	iftrue_jumptextfaceplayer .Text2
	faceplayer
	opentext
	writetext .Text1
	promptbutton
	verbosegiveitem CHERISH_BALL
	iffalse_endtext
	setevent EVENT_GOT_CHERISH_BALL_FROM_SAFFRON
	jumpthisopenedtext

.Text2:
	text "Das ist ein sehr"
	line "seltener"
	cont "#ball-Typ."

	para "Verschwende ihn"
	line "nicht!"
	done

.Text1:
	text "Ich komme aus"
	line "einer"
	cont "Familie von #-"
	cont "ball-Herstellern."

	para "Mein Vater Kurt"
	line "lehrt meine"
	cont "Tochter"

	para "Aprikoko-Bälle,"
	line "während ich hier"
	cont "arbeite."

	para "Du hast ihnen in"
	line "Azalea City"
	cont "geholfen? Toll!"

	para "Freut mich, dass"
	line "es Maizie gut"
	cont "geht."

	para "Nimm das als"
	line "Dankeschön!"
	done

SilphCo3FScientist1Text:
	text "Silph ist eine"
	line "Partnerschaft mit"
	cont "Devon eingegangen."

	para "Wir haben Produkte"
	line "voneinander"
	cont "lizenziert."
	done

SilphCo3FScientist2Text:
	text "#Bälle"
	line "funktionieren nach"
	cont "dem gleichen"
	cont "Prinzip"

	para "wie das"
	line "#mon-Lager-"
	cont "System."

	para "#mon werden in"
	line "digitale Daten"
	cont "umgewandelt und"

	para "an einem neuen Ort"
	line "wieder aufgebaut."
	done

SilphCo3FOfficerText:
	text "Ich darf dich"
	line "nicht in die"
	cont "oberen Stockwerke"
	cont "lassen,"

	para "auch wenn du"
	line "vertrauenswürdig"
	cont "bist."

	para "Tut mir leid, aber"
	line "das sind die"
	cont "Regeln."
	done

SilphCo3FGentlemanText:
	text "Ich bin von der"
	line "Devon Corporation"
	cont "zu Besuch."

	para "Wir arbeiten"
	line "zusammen, um die"
	cont "#ball-Technik"
	cont "weiterzuentwicke-"
	cont "ln!"
	done

SilphCo3FDeptSignText:
	text "Silph Co. 3F #"
	line "Ball Tech"
	done

SilphCo3FPhotoText:
	text "Das ist ein Foto"
	line "des Silph-Chefs."

	para "Er sieht verärgert"
	line "aus."
	done
