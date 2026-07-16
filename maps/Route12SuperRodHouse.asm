Route12SuperRodHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, ROUTE_12_SOUTH, 1
	warp_event  3,  7, ROUTE_12_SOUTH, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route12SuperRodHouseFishingGuruScript, -1

Route12SuperRodHouseFishingGuruScript:
	checkevent EVENT_GOT_SUPER_ROD
	iftrue_jumptextfaceplayer .GaveSuperRodText
	faceplayer
	opentext
	writetext OfferSuperRodText
	yesorno
	iffalsefwd .Refused
	writetext GiveSuperRodText
	promptbutton
	verbosegivekeyitem SUPER_ROD
	iffalsefwd .NoRoom
	setevent EVENT_GOT_SUPER_ROD
	jumpthisopenedtext

.GaveSuperRodText:
	; GSC-DE Dump 3203
	text "Wirf sie aus und"
	line "angle, wo immer"
	cont "es Wasser gibt."

	para "Denk daran - du"
	line "kannst mit ver-"
	cont "schiedenen Angeln"

	para "auch verschiedene"
	line "#mon fangen."
	done

.Refused:
	writetext DontWantSuperRodText
	waitbutton
.NoRoom:
	endtext

OfferSuperRodText:
	; GSC-DE Dump 3201
	text "Ich bin der"
	line "jüngere Bruder des"
	cont "PROFI-ANGLERs."

	para "Wie ich sehe,"
	line "macht dir Angeln"

	para "Spaß. Darüber gibt"
	line "es keinen Zweifel!"

	para "Na? Das stimmt"
	line "doch, oder?"
	done


GiveSuperRodText:
	; GSC-DE Dump 3202
	text "Jawohl! Genau, wie"
	line "ich dachte!"

	para "Hier, Angelfreak!"
	line "Nimm dies - die"
	cont "SUPERANGEL."
	done


DontWantSuperRodText:
	; GSC-DE Dump 3204
	text "Hä? Meine Augen"
	line "haben mich"
	cont "getäuscht."
	done


