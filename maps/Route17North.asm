Route17North_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route17NorthAlwaysOnBikeCallback

	def_warp_events
	warp_event 15,  6, ROUTE_16_17_GATE, 1
	warp_event 15,  7, ROUTE_16_17_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 13,  3, BGEVENT_JUMPTEXT, CyclingRoadSignText

	def_object_events
	object_event  9,  6, SPRITE_OFFICER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OfficerfJamieScript, -1

Route17NorthAlwaysOnBikeCallback:
	setflag ENGINE_ALWAYS_ON_BIKE
	endcallback

OfficerfJamieScript:
	checktime 1 << NITE
	iffalse_jumptextfaceplayer OfficerfJamieDaytimeText
	checkevent EVENT_BEAT_OFFICERF_JAMIE
	iftrue_jumptextfaceplayer OfficerfJamieAfterText
	faceplayer
	opentext
	special SaveMusic
	playmusic MUSIC_OFFICER_ENCOUNTER
	writetext OfficerfJamieSeenText
	waitbutton
	closetext
	winlosstext OfficerfJamieBeatenText, 0
	loadtrainer OFFICERF, JAMIE
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_OFFICERF_JAMIE
	endtext

OfficerfJamieSeenText:
	text "Hey du! Machst du"
	line "Ärger?"
	done

OfficerfJamieBeatenText:
	text "Hmph!"
	done

OfficerfJamieAfterText:
	text "Nachts auf dem Rad"
	line "unterwegs"

	para "wirkt einfach"
	line "verdächtig."
	done

OfficerfJamieDaytimeText:
	text "Biker und Rocker"
	line "machen auf dieser"

	para "Straße gern Ärger."

	para "Misch dich nicht"
	line "ein, klar?"
	done

CyclingRoadSignText:
	text "RADWEG"

	para "Es geht den ganzen"
	line "Weg nur bergab!"
	done
