SproutTower1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  7, 15, VIOLET_CITY, 7
	warp_event  8, 15, VIOLET_CITY, 7
	warp_event  4,  4, SPROUT_TOWER_2F, 1
	warp_event  0,  6, SPROUT_TOWER_2F, 2
	warp_event 15,  3, SPROUT_TOWER_2F, 3

	def_coord_events

	def_bg_events
	bg_event  5, 15, BGEVENT_JUMPTEXT, SproutTower1FStatueText
	bg_event 10, 15, BGEVENT_JUMPTEXT, SproutTower1FStatueText

	def_object_events
	object_event 11,  4, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KimonoGirlMakoScript, -1
	object_event  5,  4, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SproutTower1FSage1Text, -1
	object_event  4,  7, SPRITE_SAGE, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SproutTower1FSage2Text, -1
	object_event  9, 12, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, SproutTower1FGrannyScript, -1
	object_event  7,  9, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, SproutTower1FTeacherText, -1
	object_event  1,  5, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSageChow, -1
	itemball_event 14,  7, PARALYZEHEAL, 1, EVENT_SPROUT_TOWER1F_PARALYZEHEAL

	object_const_def
	const SPROUTTOWER1F_KIMONO_GIRL

SproutTower1FGrannyScript:
	checkunits
	iftrue_jumptextfaceplayer .MetricText
	jumpthistextfaceplayer

	text "Ein über 30 m"
	line "großes KNOFENSA…"

	para "Man sagt, es wurde"
	line "die Trägersäule"
	cont "des Turmes."
	done
.MetricText:
	text "Ein über 30 m"
	line "großes KNOFENSA…"

	para "Man sagt, es wurde"
	line "die Trägersäule"
	cont "des Turmes."
	done

GenericTrainerSageChow:
	generictrainer SAGE, CHOW, EVENT_BEAT_SAGE_CHOW, SageChowSeenText, SageChowBeatenText

	text "Die Basis jeder"
	line "Koexistenz ist"
	cont "Zusammenarbeit."

	para "Lasst uns dies nie"
	line "vergessen!"
	done
SageChowSeenText:
	text "Wir bewachen"
	line "diesen Turm."

	para "In tiefster Dank-"
	line "barkeit ehren wir"
	cont "hier alle #mon."
	done







SageChowBeatenText:
	text "Da-Danke!"
	done







SproutTower1FSage1Text:
	text "Nur wenn du es bis"
	line "ganz nach oben"
	cont "schaffst, erhältst"
	cont "du eine VM."
	done







SproutTower1FSage2Text:
	text "Der KNOFENSA-TURM"
	line "wurde vor langer"

	para "Zeit als #mon-"
	line "Trainingsstätte"
	cont "errichtet."
	done







SproutTower1FTeacherText:
	text "Siehst du, wie sie"
	line "sich bewegt?"

	para "Die Trainer"
	line "findest du oben."
	done







SproutTower1FStatueText:
	text "Eine #mon-"
	line "Statue…"

	para "Sie sieht sehr"
	line "erhaben aus."
	done







KimonoGirlMakoScript:
	checkevent EVENT_GOT_RARE_CANDY_FROM_KIMONO_GIRL_MAKO
	iftrue_jumptextfaceplayer .OutroText
	faceplayer
	checkevent EVENT_BEAT_KIMONO_GIRL_MAKO
	iftruefwd .Beaten
	checkevent EVENT_BEAT_KIMONO_GIRL_NAOKO
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_KIMONO_GIRL_SAYO
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_KIMONO_GIRL_ZUKI
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_KIMONO_GIRL_KUNI
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_KIMONO_GIRL_MIKI
	iffalse_jumptext .IntroText
	showtext .SeenText
	winlosstext .BeatenText, 0
	setlasttalked SPROUTTOWER1F_KIMONO_GIRL
	loadtrainerwithpal KIMONO_GIRL, MAKO, TRAINERPAL_MAKO
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_KIMONO_GIRL_MAKO
.Beaten:
	opentext
	writetext .AfterText
	promptbutton
	verbosegiveitem RARE_CANDY
	iffalse_endtext
	setevent EVENT_GOT_RARE_CANDY_FROM_KIMONO_GIRL_MAKO
	jumpthisopenedtext

.OutroText:
	text "Wir KIMONO-GIRLS"
	line "tanzen, aber wir"
	cont "kämpfen auch."
	done

.IntroText:
	text "Hallo, Trainer."

	para "Ich bin ein"
	line "KIMONO-GIRL."

	para "Ich bin aus TEAK"
	line "CITY durch Wald"
	cont "und Höhle hierher"
	cont "gekommen,"

	para "um in diesem Turm"
	line "zu trainieren."

	para "Kennst du meine"
	line "fünf tanzenden"
	cont "Cousinen in TEAK?"

	para "Komm wieder und"
	line "sag mir Bescheid!"
	done

.SeenText:
	text "Ach, du hast meine"
	line "fünf"

	para "tanzenden Cousinen"
	line "besiegt?"

	para "Dann fordere ich"
	line "dich und deine"
	cont "#mon heraus!"
	done

.BeatenText:
	text "Ach, du bist"
	line "wirklich stark…"
	done

.AfterText:
	text "Du hast einen"
	line "tollen Kampfgeist!"

	para "Du weißt, was du"
	line "damit anfangen"
	cont "sollst!"
	done
