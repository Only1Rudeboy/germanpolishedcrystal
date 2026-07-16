PewterMuseumOfScience2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  7,  7, PEWTER_MUSEUM_OF_SCIENCE_1F, 5

	def_coord_events

	def_bg_events
	bg_event  3,  6, BGEVENT_READ, Museum2FMoonStoneSignpostScript
	bg_event 11,  2, BGEVENT_JUMPTEXT, Museum2FSpaceShuttleSignpostText
	bg_event  0,  1, BGEVENT_READ, PokemonJournalStevenScript
	bg_event  1,  1, BGEVENT_READ, PokemonJournalStevenScript
	bg_event  4,  1, BGEVENT_READ, PokemonJournalCynthiaScript
	bg_event  5,  1, BGEVENT_READ, PokemonJournalCynthiaScript

	def_object_events
	object_event  7,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GRAY, OBJECTTYPE_COMMAND, jumptextfaceplayer, Museum2FScientistText, -1
	object_event  1,  7, SPRITE_CHILD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, Museum2FChildText, -1
	object_event  2,  7, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, Museum2FTeacherText, -1
	object_event  2,  1, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, Museum2FLassText, -1
	object_event 12,  5, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Museum2FPokefanMScript, -1

Museum2FPokefanMScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_SEISMIC_TOSS_INTRO
	iftruefwd Museum2FTutorSeismicTossScript
	checkunits
	iftruefwd .metric
	writetext Museum2FPokefanMImperialText
	sjumpfwd .ok
.metric
	writetext Museum2FPokefanMMetricText
.ok
	waitbutton
	setevent EVENT_LISTENED_TO_SEISMIC_TOSS_INTRO
Museum2FTutorSeismicTossScript:
	writetext Text_Museum2FTutorSeismicToss
	waitbutton
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	writetext Text_Museum2FTutorQuestion
	yesorno
	iffalsefwd .TutorRefused
	setval SEISMIC_TOSS
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpthisopenedtext

	text "Wie du meinst."
	done

.NoSilverLeaf
	jumpthisopenedtext

	text "Du hast kein"
	line "Silberblatt!"
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "So! Dein #MON"
	line "kennt jetzt"
	cont "Geowurf!"
	done

Museum2FMoonStoneSignpostScript:
	reanchormap
	trainerpic METEORITE
	waitbutton
	closepokepic
	jumpthistext

	text "Meteorit, der auf"
	line "den MONDBERG fiel."
	cont "(MONDSTEIN)"
	done

Museum2FScientistText:
	; PC-only (C)
	text "Meteoriten trafen"
	line "den MONDBERG bei"
	cont "MARMORIA CITY."
	para "Wir haben einen"
	line "zur Schau."
	para "Er scheint"
	line "seltsame Energie"
	cont "abzustrahlen…"
	done

Museum2FLassText:
	; PC-only (C)
	text "Aus Fossilien"
	line "wiederbelebte"
	para "#MON sind alle"
	line "vom Typ Gestein."
	para "Waren sie schon"
	line "immer so, oder"
	para "ist das ein"
	line "Ergebnis der"
	cont "Fossilisierung?"
	done

Museum2FPokefanMImperialText:
	text "Dieses Raumschiff"
	line "flog einst 250 km"
	para "über der Erde und"
	line "trotzte der"
	cont "Schwerkraft!"
	para "Weißt du, was auch"
	line "der Schwerkraft"
	cont "trotzt?"
	para "Geowurf,"
	line "natürlich!"
	done

Museum2FChildText:
	text "Steine und Kram"
	line "und Kram und"
	para "Steine. Können wir"
	line "endlich gehen?"
	done

Museum2FTeacherText:
	text "Seufz… Mein Sohn"
	line "hat so wenig Spaß"
	cont "im Museum,"

	para "wie ich gehofft"
	line "hatte."

	para "Kinder, was?"
	done

Museum2FPokefanMMetricText:
	text "Dieses Raumschiff"
	line "flog einst 250 km"
	para "über der Erde und"
	line "trotzte der"
	cont "Schwerkraft!"
	para "Weißt du, was noch"
	line "der Schwerkraft"
	cont "trotzen kann?"
	para "Geowurf,"
	line "natürlich!"
	done

Text_Museum2FTutorSeismicToss:
	text "Ich bringe deinem"
	line "#MON Geowurf"

	para "bei - für ein"
	line "Silberblatt."
	done


Text_Museum2FTutorQuestion:
	text "Soll ich deinem"
	line "#MON Geowurf"
	cont "beibringen?"
	done




Museum2FSpaceShuttleSignpostText:
	text "Raumschiff"
	done

PokemonJournalStevenScript:
	setflag ENGINE_READ_STEVEN_JOURNAL
	jumpthistext

	text "#MON Journal"

	para "Spezial: Fels-Fan"
	line "STEVEN!"

	para "STEVEN STONE soll"
	line "die Devon"
	cont "Corporation"

	para "unterstützen, die"
	line "sein Vater JOSEPH"
	cont "STONE leitet,"

	para "indem er seltene"
	line "Mineralien und"
	cont "sogar Fossilien"
	cont "findet."
	done

PokemonJournalCynthiaScript: ; TODO: move to Goldenrod Museum
	setflag ENGINE_READ_CYNTHIA_JOURNAL
	jumpthistext

	text "#MON Journal"
	para "Spezial:"
	line "Forscherin"
	cont "CYNTHIA!"
	para "CYNTHIA soll viele"
	line "Legenden und"
	cont "Mythen von ihrer"
	para "Großmutter in"
	line "Sinnoh gelernt"
	cont "haben."
	done
