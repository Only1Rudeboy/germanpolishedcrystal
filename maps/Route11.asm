Route11_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 45,  8, ROUTE_11_GATE, 1
	warp_event 45,  9, ROUTE_11_GATE, 2

	def_coord_events

	def_bg_events
	bg_event  5,  7, BGEVENT_JUMPTEXT, Route11SignText
	bg_event 44,  5, BGEVENT_ITEM + REVIVE, EVENT_ROUTE_11_HIDDEN_REVIVE

	def_object_events
	object_event 32, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerYoungsterOwen, -1
	object_event 30,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerYoungsterJason, -1
	object_event 21,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerYoungsterAlfie, -1
	object_event 40,  7, SPRITE_PSYCHIC, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerPsychicHerman, -1
	object_event 12,  6, SPRITE_PSYCHIC, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPsychicFidel, -1
	object_event 24, 14, SPRITE_PSYCHIC, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPsychicUri, -1
	object_event 38,  1, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerEngineerBernie, -1
	object_event 38, 14, SPRITE_ENGINEER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerEngineerCamden, -1
	object_event  9,  3, SPRITE_ROCKER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerGuitaristmRoger, -1
	object_event 10, 16, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerGuitaristfRitsuko, -1
	fruittree_event 44,  2, FRUITTREE_ROUTE_11, GANLON_BERRY, PAL_NPC_PURPLE
	tmhmball_event 44, 13, TM_VENOSHOCK, EVENT_ROUTE_11_TM_VENOSHOCK

GenericTrainerYoungsterOwen:
	generictrainer YOUNGSTER, OWEN, EVENT_BEAT_YOUNGSTER_OWEN, YoungsterOwenSeenText, YoungsterOwenBeatenText

	text "Ich habe immer"
	line "fair und ehrenhaft"
	cont "gekämpft."
	para "Ich habe es noch"
	line "nie bedauert."
	done
YoungsterOwenSeenText:
	text "Bei #MON wird"
	line "nicht gemogelt."

	para "Immer fair"
	line "spielen."
	done





YoungsterOwenBeatenText:
	text "Huch? Wie konnte"
	line "das passieren?"
	done





GenericTrainerYoungsterJason:
	generictrainer YOUNGSTER, JASON, EVENT_BEAT_YOUNGSTER_JASON, YoungsterJasonSeenText, YoungsterJasonBeatenText

	text "Im Gras werde ich"
	line "mehr #MON"
	cont "fangen."
	done
YoungsterJasonSeenText:
	text "Es juckt und"
	line "sticht, wenn ich"
	para "mit meinen Shorts"
	line "durchs Gras laufe."
	done





YoungsterJasonBeatenText:
	text "Aiyaaah! Ich bekam"
	line "Dresche!"
	done





GenericTrainerYoungsterAlfie:
	generictrainer YOUNGSTER, ALFIE, EVENT_BEAT_YOUNGSTER_ALFIE, .SeenText, .BeatenText

	text "Alles macht mehr"
	line "Spaß, wenn es ein"
	cont "Wettkampf ist."
	done

.SeenText:
	text "Drei, zwei,"
	line "eins--LOS!"
	done

.BeatenText:
	text "Spiel, Satz, Sieg."
	done

GenericTrainerPsychicHerman:
	generictrainer PSYCHIC_T, HERMAN, EVENT_BEAT_PSYCHIC_HERMAN, PsychicHermanSeenText, PsychicHermanBeatenText

	text "…"

	para "Ich verlor, als"
	line "ich meine Augen"
	cont "schloss…"
	done

PsychicHermanSeenText: ; text > text
	text "…"
	done





PsychicHermanBeatenText:
	text "…"
	done





GenericTrainerPsychicFidel:
	generictrainer PSYCHIC_T, FIDEL, EVENT_BEAT_PSYCHIC_FIDEL, PsychicFidelSeenText, PsychicFidelBeatenText

	text "Deine Überzeugung"
	line "ist stark…"

	para "Du bist stark,"
	line "weil du an deine"
	cont "#MON glaubst."
	done
PsychicFidelSeenText:
	text "Ich kann es sehen"
	line "…"
	para "Ich kann alles"
	line "über dich sehen …"
	done





PsychicFidelBeatenText:
	text "Deine Stärke"
	line "konnte ich nicht"
	cont "sehen…"
	done





GenericTrainerPsychicUri:
	generictrainer PSYCHIC_T, URI, EVENT_BEAT_PSYCHIC_URI, .SeenText, .BeatenText

	text "PROF. LIND gibt"
	line "mir keinen #"
	cont "dex. Ich frag"
	cont "mich, warum?"
	done

.SeenText:
	text "Eines Morgens"
	line "wachte ein Junge"
	cont "mit ESP als"
	cont "Kadabra auf!"
	done

.BeatenText:
	text "Stadtlegende? Was"
	line "ist das?"
	done

GenericTrainerEngineerBernie:
	generictrainer ENGINEER, BERNIE, EVENT_BEAT_ENGINEER_BERNIE, .SeenText, .BeatenText

	text "Verbreite das Wort"
	line "zum Energiesparen!"
	done

.SeenText:
	text "Vorsicht! Ich"
	line "verlege Kabel!"
	done

.BeatenText:
	text "Das war"
	line "elektrisch!"
	done

GenericTrainerEngineerCamden:
	generictrainer ENGINEER, CAMDEN, EVENT_BEAT_ENGINEER_CAMDEN, .SeenText, .BeatenText

	text "Eine Brücke und"
	line "ein #MON-Team"

	para "brauchen beide"
	line "Wissen und"
	cont "Geschick."
	done

.SeenText:
	text "Ingenieurwesen"
	line "studierte ich an"
	cont "der Universität in"
	cont "PRISMANIA!"
	done

.BeatenText:
	text "Abschaltung!"
	done

GenericTrainerGuitaristmRoger:
	generictrainer GUITARISTM, ROGER, EVENT_BEAT_GUITARISTM_ROGER, .SeenText, .BeatenText

	text "Gib nicht auf,"
	line "ohne zu kämpfen!"
	done

.SeenText:
	text "Fremde auf der"
	line "Straße,"

	para "zwei zufällige"
	line "Blicke treffen"
	cont "sich!"
	done

.BeatenText:
	text "Strahle weiter, du"
	line "verrückter"
	cont "Diamant!"
	done

GenericTrainerGuitaristfRitsuko:
	generictrainer GUITARISTF, RITSUKO, EVENT_BEAT_GUITARISTF_RITSUKO, .SeenText, .BeatenText

	text "♪ Rock'n, rock'n'"
	line "roll Radio… ♪"
	done

.SeenText:
	text "Hey ho, los"
	line "geht's!"
	done

.BeatenText:
	text "Kein Erfolg für"
	line "mich…"
	done

Route11SignText:
	; GSC-DE Dump 2378
	text "ROUTE 11"
	done





