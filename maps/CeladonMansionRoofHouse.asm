CeladonMansionRoofHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, CELADON_MANSION_ROOF, 3
	warp_event  3,  7, CELADON_MANSION_ROOF, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  2, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 2, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonMansionRoofHousePharmacistScript, -1

CeladonMansionRoofHousePharmacistScript:
	checkevent EVENT_GOT_TM03_CURSE
	iftrue_jumptextfaceplayer .CurseText
	faceplayer
	opentext
	writetext .IntroText
	promptbutton
	checktime 1 << NITE
	iffalse_jumpopenedtext .NotNiteText
	writetext .StoryText
	promptbutton
	verbosegivetmhm TM_CURSE
	setevent EVENT_GOT_TM03_CURSE
	jumpthisopenedtext

.CurseText:
	text "TM03 ist Fluch."
	para "Eine"
	line "furchteinflößende"
	cont "Attacke,"
	para "die die KP des"
	line "Opfers langsam"
	cont "aufzehrt."
	done

.IntroText:
	text "Lass mich eine"
	line "gruselige"
	cont "Geschichte"
	cont "erzählen …"
	done

.NotNiteText:
	text "Andererseits ist"
	line "es nicht so"
	cont "gruselig, solange"

	para "es draußen noch"
	line "hell ist."

	para "Komm nach"
	line "Sonnenuntergang"
	cont "wieder, O.K.?"
	done

.StoryText:
	text "Es war einmal ein"
	line "kleiner Junge, dem"
	para "man ein neues"
	line "Fahrrad schenkte …"
	para "Er wollte es"
	line "sofort"
	cont "ausprobieren …"
	para "Er hatte so viel"
	line "Spaß, dass er"
	cont "nicht bemerkte,"
	para "wie die Sonne"
	line "unterging …"
	para "Auf der dunklen"
	line "Heimfahrt wurde"
	cont "das Rad plötzlich"
	para "langsamer!"
	para "Die Pedale wurden"
	line "so schwer!"
	para "Als er aufhörte zu"
	line "treten, rollte das"
	cont "Rad rückwärts!"
	para "Es war, als sei"
	line "das Rad verflucht"
	cont "und wollte ihn"
	para "ins Nichts ziehen!"
	para "…"
	para "…"
	para "KREEEEEISCH!"
	para "Der Junge fuhr den"
	line "Radweg bergauf!"
	para "… Bum-bum,"
	line "bum-bum!"
	para "Weil du so"
	line "geduldig zugehört"
	cont "hast, nimm dies:"
	cont "TM03!"
	done
