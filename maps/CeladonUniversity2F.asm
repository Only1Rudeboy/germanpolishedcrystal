CeladonUniversity2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 23,  8, CELADON_UNIVERSITY_1F, 3
	warp_event  7,  0, CELADON_UNIVERSITY_CAFETERIA, 1
	warp_event  3,  8, CELADON_UNIVERSITY_WILLOWS_OFFICE, 1
	warp_event 13,  0, CELADON_UNIVERSITY_HYPER_TEST_ROOM, 1
	warp_event 19,  8, CELADON_UNIVERSITY_WESTWOODS_OFFICE, 1
	warp_event 21,  0, CELADON_UNIVERSITY_POOL, 1
	warp_event  7,  8, CELADON_UNIVERSITY_NURSES_OFFICE, 1

	def_coord_events

	def_bg_events
	bg_event  6,  0, BGEVENT_JUMPTEXT, CeladonUniversity2FCafeteriaSignText
	bg_event 12,  0, BGEVENT_JUMPTEXT, CeladonUniversity2FHyperTestSignText
	bg_event 20,  0, BGEVENT_JUMPTEXT, CeladonUniversity2FPoolSignText
	bg_event  2,  8, BGEVENT_JUMPTEXT, CeladonUniversity2FWillowsOfficeSignText
	bg_event  6,  8, BGEVENT_JUMPTEXT, CeladonUniversity2FNursesOfficeSignText
	bg_event 18,  8, BGEVENT_JUMPTEXT, CeladonUniversity2FWestwoodsOfficeSignText
	bg_event 16,  1, BGEVENT_READ, CeladonUniversity2FMagikarpSign
	bg_event 24,  1, BGEVENT_READ, CeladonUniversity2FCuboneSign

	def_object_events
	object_event  2,  3, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, CeladonUniversity2FCooltrainerfScript, -1
	object_event  5,  3, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversity2FCooltrainermText, -1
	object_event 17,  2, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversity2FYoungster1Text, -1
	object_event 11,  7, SPRITE_COWGIRL, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversity2FCowgirlText, -1
	object_event  4,  9, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversity2FBug_catcherText, -1
	object_event 13, 13, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversity2FLassText, -1
	object_event 21, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversity2FYoungster2Text, -1

CeladonUniversity2FCooltrainerfScript:
	checkevent EVENT_GOT_ANTIDOTE_IN_UNIVERSITY
	iftrue_jumptextfaceplayer .Text5
	faceplayer
	opentext
	writetext .Text1
	waitbutton
	writetext .Text2
	yesorno
	iffalse_jumpopenedtext .Text6
	takeitem FRESH_WATER
	iffalse_jumpopenedtext .Text6
	writetext .Text3
	waitbutton
	writetext .Text4
	waitbutton
	verbosegiveitem ANTIDOTE
	iffalsefwd .NoRoomForAntidote
	setevent EVENT_GOT_ANTIDOTE_IN_UNIVERSITY
	jumpthisopenedtext

.Text5:
	text "Gegengifte heilen"
	line "Vergiftungen bei"
	cont "#mon, aber ein"

	para "Mensch würde davon"
	line "krank werden."
	done

.NoRoomForAntidote:
	giveitem FRESH_WATER
	jumpthisopenedtext

	text "Oh… Behalt dein"
	line "Tafelwasser dann…"
	done

.Text1:
	text "Wow, ich hab"
	line "Durst!"

	para "Aber ich hab kein"
	line "Kleingeld für die"
	cont "Automaten…"

	para "Hast du"
	line "Tafelwasser?"
	done

.Text2:
	text "Ein Tafelwasser"
	line "abgeben?"
	done

.Text3:
	text "<PLAYER> gab das"
	line "Tafelwasser ab."
	done

.Text4:
	text "Vielen Dank!"
	line "Hier, nimm das!"
	done

.Text6:
	text "Oh… Aber ich hab"
	line "so Durst…"
	done

CeladonUniversity2FCooltrainermText:
	text "Die Mensa wird oft"
	line "ziemlich voll,"

	para "drum ess ich"
	line "lieber im Flur."
	done

CeladonUniversity2FYoungster1Text:
	text "Ich hab den"
	line "Hyper-Test wieder"
	cont "nicht bestanden…"

	para "Aber ich gebe"
	line "nicht auf!"
	done

CeladonUniversity2FCowgirlText:
	text "Meine Klasse macht"
	line "einen Ausflug in"
	cont "die Safari-Zone!"
	done

CeladonUniversity2FBug_catcherText:
	text "Prof.Willow"
	line "schickt seine"
	cont "Assistenten los,"

	para "um in der Stadt"
	line "die #mon zu"
	cont "erforschen."
	done

CeladonUniversity2FLassText:
	text "Neben ihrem Amt"
	line "als Prismania-"
	cont "Arenaleiterin,"

	para "war Erika hier an"
	line "der Uni die Beste"
	cont "ihrer Klasse."

	para "Ich wünschte, ich"
	line "wär so cool wie"
	cont "sie."
	done

CeladonUniversity2FYoungster2Text:
	text "Prof.Westwood ist"
	line "etwas exzentrisch."

	para "Manchmal"
	line "entschuldigt er"
	cont "sich bei den"

	para "Porträts seiner"
	line "Vorfahren."
	done

CeladonUniversity2FCafeteriaSignText:
	text "Mensa"
	done

CeladonUniversity2FHyperTestSignText:
	text "Hyper-Testraum"
	done

CeladonUniversity2FPoolSignText:
	text "Schwimmbad"
	done

CeladonUniversity2FWillowsOfficeSignText:
	text "Prof.Willows"
	line "Büro"
	done

CeladonUniversity2FNursesOfficeSignText:
	text "Schwestern-"
	line "zimmer"
	done

CeladonUniversity2FWestwoodsOfficeSignText:
	text "Prof.Westwoods"
	line "Büro"
	done

CeladonUniversity2FMagikarpSign:
	reanchormap
	pokepic MAGIKARP, MAGIKARP_ORCA_FORM
	cry MAGIKARP
	waitbutton
	closepokepic
	jumpthistext

	text "Ein Karpador"
	line "schwimmt herum."
	done

CeladonUniversity2FCuboneSign:
	reanchormap
	trainerpic CUBONE_ARMOR
	waitbutton
	closepokepic
	jumpthistext

	text "Das ist der"
	line "Kampfknochen und"
	cont "Schädelhelm eines"
	cont "Tragosso."
	done
