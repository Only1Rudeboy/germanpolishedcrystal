GoldenrodNetBallHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 19
	warp_event  3,  7, GOLDENROD_CITY, 19

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodNetBallHouseYoungsterScript, -1
	object_event  6,  3, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodNetBallHouseBugCatcherText, -1

GoldenrodNetBallHouseYoungsterScript:
	checkevent EVENT_GOT_NET_BALL_FROM_GOLDENROD
	iftrue_jumptextfaceplayer .Text2
	faceplayer
	opentext
	writetext .Text1
	promptbutton
	verbosegiveitem NET_BALL
	iffalse_endtext
	setevent EVENT_GOT_NET_BALL_FROM_GOLDENROD
	jumpthisopenedtext

.Text2:
	text "Manchmal hast du"
	line "echt Glück und"

	para "fängst ein #mon"
	line "mit vollen KP."

	para "Ich liebe dieses"
	line "Gefühl."
	done

.Text1:
	text "Ich habe Netzbälle"
	line "gekauft, um"
	para "ein Tannza zu"
	line "fangen, aber beim"
	cont "ersten Wurf"
	para "hat's geklappt!"
	line "Den Rest brauch"
	cont "ich nicht mehr."
	done

GoldenrodNetBallHouseBugCatcherText:
	text "Im NATIONALPARK"
	line "auf ROUTE 35"
	para "gibt es Käferfang-"
	line "Wettbewerbe."
	para "Manchmal kämpft"
	line "sogar KAI mit!"
	done
