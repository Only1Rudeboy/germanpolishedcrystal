MoveManiacsHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, CIANWOOD_CITY, 7
	warp_event  3,  7, CIANWOOD_CITY, 7

	def_coord_events

	def_bg_events
	bg_event  7,  1, BGEVENT_JUMPSTD, magazinebookshelf

	def_object_events
	object_event  2,  3, SPRITE_COSPLAYER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, MoveReminderScript, -1

MoveReminderScript:
	faceplayer
	opentext
	writetext MoveReminderIntroText
	waitbutton
	checkitem GOLD_LEAF
	iffalsefwd .no_gold_leaf
	writetext MoveReminderPromptText
	yesorno
	iffalsefwd .refused
	setval NO_MOVE ; to toggle move relearner
	writetext MoveReminderWhichMonText
	waitbutton
	special Special_MoveTutor
	ifequalfwd $0, .teach_move
.refused
	jumpopenedtext MoveReminderCancelText

.no_gold_leaf
	jumpopenedtext MoveReminderNoGoldLeafText

.teach_move
	takeitem GOLD_LEAF
	jumpopenedtext MoveReminderCancelText

MoveReminderIntroText::
	text "Ich? Ich bin der"
	line "Attacken-Maniac."

	para "Ich bringe deinem"
	line "#mon eine"

	para "Attacke wieder"
	line "in Erinnerung,"

	para "wenn du mir ein"
	line "Goldblatt gibst!"
	done

MoveReminderPromptText::
	text "Soll ich einem"
	line "deiner #mon"
	cont "eine Attacke"
	cont "beibringen?"
	done

MoveReminderWhichMonText::
	text "Juhu! Welches"
	line "#mon braucht"
	cont "Hilfe?"
	done

MoveReminderNoGoldLeafText::
	text "Hm? Du hast kein"
	line "Goldblatt."

	para "Manchmal findest"
	line "du welche bei"
	cont "wilden Myrapla."
	done

MoveReminderNoMovesText::
	text "Tut mir leid… Es"
	line "gibt keine"

	para "Attacke, die"
	line "dieses #mon"
	cont "lernen kann."
	prompt

MoveReminderCancelText::
	text "Braucht dein"
	line "#mon eine"

	para "Attacke, komm mit"
	line "einem Goldblatt"
	cont "wieder!"
	done
