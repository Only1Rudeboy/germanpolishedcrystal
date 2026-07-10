CeladonCafe_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  6,  7, CELADON_CITY, 9
	warp_event  7,  7, CELADON_CITY, 9

	def_coord_events

	def_bg_events
	bg_event  5,  0, BGEVENT_JUMPTEXT, EatathonContestPosterText
	bg_event  7,  1, BGEVENT_JUMPTEXT, EatathonContestTrashCanText

	def_object_events
	object_event  7,  4, SPRITE_MAYLENE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, MayleneScript, -1
	object_event  4,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonCafeTeacher, -1
	object_event  4,  6, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonCafeFisher1, -1
	object_event  1,  7, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonCafeFisher2, -1
	object_event  1,  2, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonCafeFisher3, -1
	object_event  9,  3, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, ChefText_Eatathon, -1
	object_event 11,  4, SPRITE_BAKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonCafeBakerText, -1

	object_const_def
	const CELADONCAFE_MAYLENE
	const CELADONCAFE_TEACHER

MayleneScript:
	showtext MayleneText1
	faceplayer
	opentext
	writetext MayleneText2
	waitbutton
	checkevent EVENT_BEAT_MAYLENE
	iftruefwd .Done
	writetext MayleneText3
	yesorno
	iffalsefwd .Refused
	writetext MayleneSeenText
	waitbutton
	closetext
	winlosstext MayleneBeatenText, 0
	setlasttalked CELADONCAFE_MAYLENE
	checkevent EVENT_BEAT_ELITE_FOUR_AGAIN
	iftruefwd .Rematch
	loadtrainer MAYLENE, 1
	sjumpfwd .StartBattle
.Rematch
	loadtrainer MAYLENE, 2
.StartBattle
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_MAYLENE
	opentext
	writetext MayleneAfterText
	waitbutton
.Done
	closetext
	turnobject CELADONCAFE_MAYLENE, RIGHT
	end

.Refused
	writetext MayleneRefusedText
	waitbutton
	closetext
	turnobject CELADONCAFE_MAYLENE, RIGHT
	end

CeladonCafeTeacher:
	checkkeyitem COIN_CASE
	iftruefwd .NoCoinCase
	showtext TeacherText_CrunchCrunch
	showtextfaceplayer TeacherText_NoCoinCase
	turnobject LAST_TALKED, LEFT
	end

.NoCoinCase:
	showtext TeacherText_KeepEating
	turnobject CELADONCAFE_TEACHER, RIGHT
	showtext TeacherText_MoreChef
	turnobject CELADONCAFE_TEACHER, LEFT
	end

CeladonCafeFisher1:
	showtext Fisher1Text_Snarfle
	showtextfaceplayer Fisher1Text_Concentration
	turnobject LAST_TALKED, LEFT
	end

CeladonCafeFisher2:
	showtext Fisher2Text_GulpChew
	showtextfaceplayer Fisher2Text_Quantity
	turnobject LAST_TALKED, RIGHT
	end

CeladonCafeFisher3:
	showtext Fisher3Text_MunchMunch
	showtextfaceplayer Fisher3Text_GoldenrodIsBest
	turnobject LAST_TALKED, RIGHT
	end

ChefText_Eatathon:
	text "Hi!"

	para "Wir veranstalten"
	line "gerade einen"
	cont "Fresswettbewerb."

	para "Wir können dich"
	line "jetzt nicht"
	cont "bedienen. Sorry."
	done

Fisher1Text_Snarfle:
	text "…Schmatz, mampf…"
	done

Fisher1Text_Concentration:
	text "Sprich mich nicht"
	line "an!"

	para "Du störst meine"
	line "Konzentration!"
	done

Fisher2Text_GulpChew:
	text "…Schluck… Mampf…"
	done

Fisher2Text_Quantity:
	text "Mir ist Menge"
	line "wichtiger als"
	cont "Qualität!"

	para "Ich bin glücklich,"
	line "wenn ich satt bin!"
	done

Fisher3Text_MunchMunch:
	text "Mampf, mampf…"
	done

Fisher3Text_GoldenrodIsBest:
	text "Das Essen hier ist"
	line "gut, aber in"
	cont "Dukatia City"
	cont "gibt's"

	para "das beste Essen"
	line "überhaupt."
	done

TeacherText_CrunchCrunch:
	text "Knabber… Knabber…"
	done

TeacherText_NoCoinCase:
	text "Hier gibt dir"
	line "niemand einen"

	para "Münzkorb. Schau"
	line "lieber in Johto."
	done

TeacherText_KeepEating:
	text "Knabber… Knabber…"

	para "Ich kann noch mehr"
	line "essen!"
	done

TeacherText_MoreChef:
	text "Mehr, Chef!"
	done

MayleneText1:
	text "Hilda: Mampf mampf"
	line "mampf…"
	done

MayleneText2:
	text "Der"
	line "Fresswettbewerb!"

	para "Ich hätte nie von"
	line "so etwas"
	cont "Wunderbarem"

	para "geträumt."

	para "Nach strenger Diät"
	line "im Training kann"
	cont "ich wie ein"

	para "Relaxo essen."

	para "Die Gewinnerin"
	line "isst auch noch"
	cont "umsonst."

	para "Das ist ein wahr"
	line "gewordener Traum!"
	done

MayleneText3:
	text "Ich werde langsam"
	line "satt…"

	para "Ähm, willst du als"
	line "Pause mit mir"
	cont "kämpfen?"
	done

MayleneRefusedText:
	text "Seufz… okay."
	done

MayleneSeenText:
	text "Okay! Rei!"

	para "Oh, das ist meine"
	line "Verbeugung vor"
	cont "einem Kampf."

	para "Ich setz alles"
	line "ein, was ich hab!"
	done

MayleneBeatenText:
	text "Ich muss meine"
	line "Niederlage"
	cont "eingestehen…"

	para "Du bist viel zu"
	line "stark."
	done

MayleneAfterText:
	text "Danke, <PLAYER>!"

	para "Ich bin bereit,"
	line "weiterzuessen!"
	done

CeladonCafeBakerText:
	text "Ich arbeite hier,"
	line "weil ich jederzeit"
	cont "essen"

	para "kann. Ganz"
	line "einfach."
	done

EatathonContestPosterText:
	text "Fresswettbewerb!"
	line "Kein Zeitlimit!"

	para "Ein Kampf ohne"
	line "Ende! Der größte"
	cont "Vielfraß bekommt"

	para "alles umsonst!"
	done

EatathonContestTrashCanText:
	text "Der Müll ist"
	line "voller Reste vom"
	cont "Fresswettbewerb…"
	done
