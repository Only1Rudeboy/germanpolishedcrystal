GoldenrodMuseum2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 13,  7, GOLDENROD_MUSEUM_1F, 3

	def_coord_events

	def_bg_events
	bg_event  1,  0, BGEVENT_READ, LugiaPaintingScript
	bg_event  2,  0, BGEVENT_READ, LugiaPaintingScript
	bg_event  4,  0, BGEVENT_READ, BellTowerPaintingScript
	bg_event  5,  0, BGEVENT_READ, BellTowerPaintingScript
	bg_event  7,  0, BGEVENT_READ, HoOhPaintingScript
	bg_event  8,  0, BGEVENT_READ, HoOhPaintingScript
	bg_event  1,  4, BGEVENT_READ, KabutoPuzzleScript
	bg_event  1,  5, BGEVENT_READ, KabutoPuzzleScript
	bg_event  5,  4, BGEVENT_READ, OmanytePuzzleScript
	bg_event  5,  5, BGEVENT_READ, OmanytePuzzleScript
	bg_event  1,  6, BGEVENT_READ, AerodactylPuzzleScript
	bg_event  1,  7, BGEVENT_READ, AerodactylPuzzleScript
	bg_event  5,  6, BGEVENT_READ, HoOhPuzzleScript
	bg_event  5,  7, BGEVENT_READ, HoOhPuzzleScript
	bg_event 10,  1, BGEVENT_JUMPTEXT, TowerRelicText
	bg_event 11,  1, BGEVENT_JUMPTEXT, TowerRelicText
	bg_event 11,  1, BGEVENT_JUMPTEXT, TowerRelicText

	def_object_events
	object_event  4,  2, SPRITE_SIGHTSEER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, (1 << EVE) | (1 << NITE), 0, OBJECTTYPE_SCRIPT, 0, GoldenrodMuseum2FSightseerMScript, -1
	pokemon_event 5,  2, SMEARGLE, SPRITEMOVEDATA_POKEMON, (1 << EVE) | (1 << NITE), PAL_MON_BROWN, GoldenrodMuseum2FSmeargleText, -1
	object_event  3,  6, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GoldenrodMuseum2FScientistScript, -1
	object_event 11,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodMuseum2FTeacherScript, -1

LugiaPaintingScript:
	checkevent EVENT_FOUGHT_LUGIA
	iffalse_jumptext EmptyDisplayText
	reanchormap
	paintingpic LUGIA_PAINTING
	waitbutton
	closepokepic
	jumpthistext

	text "  Der Leviathan"
	line "    erwacht"
	done

HoOhPaintingScript:
	checkevent EVENT_FOUGHT_HO_OH
	iffalse_jumptext EmptyDisplayText
	reanchormap
	paintingpic HO_OH_PAINTING
	waitbutton
	closepokepic
	jumpthistext

	text "   Der Phönix"
	line "   steigt auf"
	done

BellTowerPaintingScript:
	checkevent EVENT_FOUGHT_SUICUNE
	iffalse_jumptext EmptyDisplayText
	reanchormap
	paintingpic BELL_TOWER_PAINTING
	waitbutton
	closepokepic
	jumpthistext

	text "  Freundschaft"
	line "  und Hoffnung"
	done

KabutoPuzzleScript:
	checkevent EVENT_SOLVED_KABUTO_PUZZLE
	iffalse_jumptext EmptyDisplayText
	reanchormap
	paintingpic KABUTO_PUZZLE
	waitbutton
	closepokepic
	jumpthistext

	text "Das fertige"
	line "Kabuto-Panel!"
	done

OmanytePuzzleScript:
	checkevent EVENT_SOLVED_OMANYTE_PUZZLE
	iffalse_jumptext EmptyDisplayText
	reanchormap
	paintingpic OMANYTE_PUZZLE
	waitbutton
	closepokepic
	jumpthistext

	text "Das fertige"
	line "Omanyte-Panel!"
	done

AerodactylPuzzleScript:
	checkevent EVENT_SOLVED_AERODACTYL_PUZZLE
	iffalse_jumptext EmptyDisplayText
	reanchormap
	paintingpic AERODACTYL_PUZZLE
	waitbutton
	closepokepic
	jumpthistext

	text "Das fertige"
	line "Aerodactyl-Panel!"
	done

HoOhPuzzleScript:
	checkevent EVENT_SOLVED_HO_OH_PUZZLE
	iffalse_jumptext EmptyDisplayText
	reanchormap
	paintingpic HO_OH_PUZZLE
	waitbutton
	closepokepic
	jumpthistext

	text "Das fertige"
	line "Ho-Oh-Panel!"
	done

EmptyDisplayText:
	text "Die Vitrine ist"
	line "noch leer…"
	done

TowerRelicText:
	text "Ein uraltes Wand-"
	line "gemälde mit einem"
	cont "mysteriösen #mon."
	done

GoldenrodMuseum2FSightseerMScript:
	checkevent EVENT_FOUGHT_SUICUNE
	iffalse_jumptextfaceplayer GoldenrodMuseum2FSightseerMNoPaintingText
	checkevent EVENT_FOUGHT_HO_OH
	iffalse_jumptextfaceplayer GoldenrodMuseum2FSightseerMNoPaintingText
	checkevent EVENT_FOUGHT_LUGIA
	iffalse_jumptextfaceplayer GoldenrodMuseum2FSightseerMNoPaintingText
	jumpthistextfaceplayer

	text "Diese Gemälde"
	line "sind"
	line "wunderschön!"

	para "Eines Tages hängt"
	line "vielleicht meine"

	para "Kunst auch in"
	line "einem Museum."
	done

GoldenrodMuseum2FSightseerMNoPaintingText:
	text "Ach…! Farbblatt"
	line "und"
	line "ich kamen, weil"
	cont "wir"

	para "von einer Kunst-"
	line "ausstellung zur"

	para "Eröffnung gehört"
	line "haben."

	para "Aber anscheinend"
	line "waren das"
	cont "Gerüchte…"

	para "Diese Galerie ist"
	line "noch nicht"
	cont "fertig!"
	done

GoldenrodMuseum2FSmeargleText:
	text "Smeargle: Smeer!"
	done

GoldenrodMuseum2FScientistScript:
	checkevent EVENT_SOLVED_KABUTO_PUZZLE
	iffalse_jumptextfaceplayer GoldenrodMuseum2FScientistNoArtifactsText
	checkevent EVENT_SOLVED_OMANYTE_PUZZLE
	iffalse_jumptextfaceplayer GoldenrodMuseum2FScientistNoArtifactsText
	checkevent EVENT_SOLVED_AERODACTYL_PUZZLE
	iffalse_jumptextfaceplayer GoldenrodMuseum2FScientistNoArtifactsText
	checkevent EVENT_SOLVED_HO_OH_PUZZLE
	iffalse_jumptextfaceplayer GoldenrodMuseum2FScientistNoArtifactsText
	jumpthistextfaceplayer

	text "Diese Artefakte"
	line "sind"
	cont "faszinierend!"

	para "Schade, dass es"
	line "nur Repliken"
	cont "sind…"

	para "Ich würde die"
	line "echten Stücke"
	cont "gern"
	cont "aus nächster Nähe"
	cont "studieren."
	done

GoldenrodMuseum2FScientistNoArtifactsText:
	text "Ich weiß, das"
	line "Museum hat gerade"

	para "eröffnet, aber"
	line "ich"
	line "hatte mehr"

	para "Ausstellungsstü-"
	line "cke"
	line "erwartet…"

	para "Wo ist alles?"
	done

GoldenrodMuseum2FTeacherScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_BATON_PASS_INTRO
	iftruefwd GoldenrodMuseum2FTutorBatonPassScript
	writetext GoldenrodMuseum2FTutorIntroText
	waitbutton
	setevent EVENT_LISTENED_TO_BATON_PASS_INTRO
; fallthrough
GoldenrodMuseum2FTutorBatonPassScript:
	writetext GoldenrodMuseum2FTutorBatonPassText
	waitbutton
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	writetext GoldenrodMuseum2FTutorQuestion
	yesorno
	iffalsefwd .TutorRefused
	setval BATON_PASS
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

	text "So! Dein #mon"
	line "kennt jetzt"
	cont "Stafette!"
	done

GoldenrodMuseum2FTutorIntroText:
	text "Bevor der neue"
	line "Funkturm gebaut"

	para "wurde, stand hier"
	line "ein alter"

	para "Holzturm."

	para "Dieses"
	line "Wandgemälde"
	line "hing ursprünglich"
	cont "dort."

	para "Es hierher zu"
	line "bringen war"
	cont "nötig,"

	para "um ein Stück"
	line "Johtos Geschichte"
	cont "zu bewahren."

	para "Sogar #mon"
	line "verstehen den"

	para "Wert der"
	line "Erhaltung!"
	done

GoldenrodMuseum2FTutorBatonPassText:
	text "Ich bringe deinem"
	line "#mon Stafette"

	para "bei — für ein"
	line "Silberblatt."
	done


GoldenrodMuseum2FTutorQuestion:
	text "Soll ich deinem"
	line "#mon Stafette"
	cont "beibringen?"
	done
