SafariZoneWardensHome_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4,  7, FUCHSIA_CITY, 5
	warp_event  5,  7, FUCHSIA_CITY, 5

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_JUMPSTD, picturebookshelf
	bg_event  5,  0, BGEVENT_JUMPTEXT, WardenPhotoText
	bg_event  7,  0, BGEVENT_JUMPTEXT, SafariZonePhotoText
	bg_event  8,  1, BGEVENT_JUMPTEXT, WardensHouseCuriosText
	bg_event  9,  1, BGEVENT_JUMPTEXT, WardensHouseCuriosText

	def_object_events
	object_event  2,  4, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WardensGranddaughter, -1

WardensGranddaughter:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_WARDENS_GRANDDAUGHTER
	iftruefwd .AlreadyMet
	writetext WardensGranddaughterText1
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_WARDENS_GRANDDAUGHTER
	end
.AlreadyMet:
	jumpthisopenedtext

	text "Viele Leute waren"
	line "traurig, dass die"

	para "SAFARI-ZONE"
	line "geschlossen wurde."
	cont "Aber Großvater ist"
	cont "so stur…"
	done
WardensGranddaughterText1:
	text "Mein Großvater ist"
	line "der WÄRTER in der"
	cont "SAFARI-ZONE."

	para "Zumindest war er"
	line "das…"

	para "Er hat sich ent-"
	line "schieden, Urlaub"

	para "zu machen und ist"
	line "verreist, ganz"
	cont "allein."

	para "Er hat einfach so"
	line "die SAFARI-ZONE"
	cont "verlassen."
	done






WardenPhotoText:
	text "Das Foto zeigt"
	line "einen lächelnden,"

	para "alten Mann umgeben"
	line "von #mon."
	done






SafariZonePhotoText:
	text "Das Foto zeigt"
	line "eine große Wiese,"

	para "auf der seltene"
	line "#mon"
	cont "herumtollen."
	done






WardensHouseCuriosText:
	text "Eine Vitrine"
	line "voller Fossilien"
	cont "und"

	para "alter #mon-"
	line "Souvenirs."
	done
