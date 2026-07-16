CeruleanGymBadgeSpeechHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, CERULEAN_CITY, 1
	warp_event  3,  7, CERULEAN_CITY, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CeruleanGymBadgeSpeechHouseGentlemanScript, -1

CeruleanGymBadgeSpeechHouseGentlemanScript:
	checkevent EVENT_INTRODUCED_TO_CERULEAN_MAN
	iftrue_jumptextfaceplayer .Text2
	faceplayer
	opentext
	writetext .Text1
	waitbutton
	setevent EVENT_INTRODUCED_TO_CERULEAN_MAN
	jumpthisopenedtext

.Text2:
	; GSC-DE Dump
	text "Sammelst du ORDEN"
	line "der PKMN-ARENEN"
	cont "von KANTO?"
	done

.Text1:
	; PC-only Intro
	text "Vor ein paar"
	line "Jahren gab's viele"
	para "Einbrüche, deshalb"
	line "ist jetzt jeder"
	cont "vorsichtig."
	para "Wer bist du?"
	done
