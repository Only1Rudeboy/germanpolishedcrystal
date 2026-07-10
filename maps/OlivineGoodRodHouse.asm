OlivineGoodRodHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, OLIVINE_CITY, 5
	warp_event  3,  7, OLIVINE_CITY, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoodRodGuru, -1

GoodRodGuru:
	faceplayer
	opentext
	checkevent EVENT_GOT_GOOD_ROD
	iftrue_jumpopenedtext HaveGoodRodText
	writetext OfferGoodRodText
	yesorno
	iffalse_jumpopenedtext DontWantGoodRodText
	writetext GiveGoodRodText
	promptbutton
	verbosegivekeyitem GOOD_ROD
	writetext GaveGoodRodText
	waitbutton
	closetext
	setevent EVENT_GOT_GOOD_ROD
	end

OfferGoodRodText:
	text "OLIVIANA CITY"
	line "liegt am Meer!"

	para "Daher sollte man"
	line "dort auch jede"
	cont "Menge Fische"
	cont "finden!"

	para "Ich fische hier"
	line "seit 30 Jahren."

	para "Willst du das Meer"
	line "und die Fische"
	cont "sehen?"
	done


GiveGoodRodText:
	text "Ah, hahah! Und da"
	line "haben wir einen"
	cont "neuen Angler!"
	done


GaveGoodRodText:
	text "Fische findet man"
	line "nicht nur im Meer."

	para "Sie sind überall,"
	line "wo es Wasser gibt."
	done


DontWantGoodRodText:
	text "Waaas? Du willst"
	line "nicht fischen!?"
	cont "Unfassbar!"
	done


HaveGoodRodText:
	text "Wie steht's? Den"
	line "großen Fang"
	cont "gemacht?"
	done


