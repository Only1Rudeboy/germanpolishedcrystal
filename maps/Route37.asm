Route37_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, SunnyCallback

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event  5,  3, BGEVENT_JUMPTEXT, Route37SignText
	bg_event  4,  2, BGEVENT_ITEM + ETHER, EVENT_ROUTE_37_HIDDEN_ETHER

	def_object_events
	object_event 16,  8, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, SunnyScript, EVENT_ROUTE_37_SUNNY_OF_SUNDAY
	object_event  6, 12, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerTwinsToriandtil1, -1
	object_event  7, 12, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerTwinsToriandtil2, -1
	object_event 14, 11, SPRITE_PSYCHIC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPsychicGreg, -1
	object_event  4,  6, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBeautyCallie, -1
	object_event  9,  6, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_DARK_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBeautyCassandra, -1
	fruittree_event 13,  5, FRUITTREE_ROUTE_37_1, RED_APRICORN, PAL_NPC_RED
	fruittree_event 16,  5, FRUITTREE_ROUTE_37_2, BLU_APRICORN, PAL_NPC_BLUE
	fruittree_event 15,  7, FRUITTREE_ROUTE_37_3, BLK_APRICORN, PAL_NPC_BLACK

	object_const_def
	const ROUTE37_SUNNY

SunnyCallback:
	readvar VAR_WEEKDAY
	ifequalfwd SUNDAY, .SunnyAppears
	disappear ROUTE37_SUNNY
	endcallback

.SunnyAppears:
	appear ROUTE37_SUNNY
	endcallback

GenericTrainerTwinsToriandtil1:
	generictrainer TWINS, ANNANDANNE1, EVENT_BEAT_TWINS_ANN_AND_ANNE, TwinsToriandtil1SeenText, TwinsToriandtil1BeatenText

	; GSC-DE Dump (Namen: Til/Tori PC)
	text "TIL: Ich kenne"
	line "die Gedanken"
	para "meiner Schwester"
	line "und die meiner"
	cont "#MON."
	done

GenericTrainerTwinsToriandtil2:
	generictrainer TWINS, ANNANDANNE2, EVENT_BEAT_TWINS_ANN_AND_ANNE, TwinsToriandtil2SeenText, TwinsToriandtil2BeatenText

	; GSC-DE Dump (Namen: Til/Tori PC)
	text "TORI: Wir fühlen"
	line "dasselbe wie"
	cont "unsere #MON."
	done

GenericTrainerPsychicGreg:
	generictrainer PSYCHIC_T, GREG, EVENT_BEAT_PSYCHIC_GREG, PsychicGregSeenText, PsychicGregBeatenText

	; GSC-DE Dump
	text "Im Kampf stellt"
	line "es eine gute"
	cont "Taktik dar, die"
	cont "gegnerischen"
	cont "#MON in Schlaf"
	cont "zu versetzen oder"
	cont "sie zu"
	cont "paralysieren."
	done

SunnyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_MAGNET_FROM_SUNNY
	iftruefwd SunnySundayScript
	readvar VAR_WEEKDAY
	ifnotequal SUNDAY, SunnyNotSundayScript
	checkevent EVENT_MET_SUNNY_OF_SUNDAY
	iftruefwd .MetSunny
	writetext MeetSunnyText
	promptbutton
	setevent EVENT_MET_SUNNY_OF_SUNDAY
.MetSunny:
	writetext SunnyGivesGiftText
	promptbutton
	verbosegiveitem MAGNET
	iffalsefwd SunnyDoneScript
	setevent EVENT_GOT_MAGNET_FROM_SUNNY
	jumpthisopenedtext

	; GSC-DE Dump
	text "SONNFRIED: Dieses"
	line "Ding…"
	para "Äh…"
	para "…Was war das"
	line "nochmal…"
	para "…"
	para "Ah! Jetzt erinnere"
	line "ich mich!"
	para "Ein #MON, das"
	line "Elektro-Attacken"
	para "verwendet, sollte"
	line "dies erhalten."
	para "Meine Schwester"
	line "MONJA behauptet,"
	cont "es verstärkt"
	cont "Elektro-Attacken!"
	done

SunnySundayScript:
	writetext SunnySundayText
	waitbutton
SunnyDoneScript:
	endtext

SunnyNotSundayScript:
	jumpthisopenedtext

	; GSC-DE Dump
	text "SONNFRIED: Ist"
	line "heute nicht Sonn-"
	cont "tag? Äh… Das habe"
	cont "ich vergessen!"
	done

GenericTrainerBeautyCallie:
	generictrainer BEAUTY, CALLIE, EVENT_BEAT_BEAUTY_CALLIE, BeautyCallieSeenText, BeautyCallieBeatenText

	; PC-only
	text "Wow, du bist süß"
	line "und auch noch gut!"
	done

TrainerBeautyCassandra:
	trainer BEAUTY, CASSANDRA, EVENT_BEAT_BEAUTY_CASSANDRA, BeautyCassandraSeenText, BeautyCassandraBeatenText, 0, .Script, TRAINERPAL_DARK_BEAUTY

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	; PC-only
	text "Leute wie du sind"
	line "gut, obwohl sie"
	para "jung sind…"
	done

TwinsToriandtil1SeenText:
	; GSC-DE Dump (Namen: Til/Tori PC)
	text "TIL: Tori und ich"
	line "arbeiten immer"
	cont "zusammen!"
	done

TwinsToriandtil1BeatenText:
TwinsToriandtil2BeatenText:
	; GSC-DE Dump (Namen: Til/Tori PC)
	text "Til & Tori: Nn…"
	line "ein wenig zu"
	cont "stark."
	done

TwinsToriandtil2SeenText:
	; GSC-DE Dump (Namen: Til/Tori PC)
	text "TORI: Til und ich"
	line "arbeiten immer"
	cont "zusammen!"
	done

PsychicGregSeenText:
	; GSC-DE Dump
	text "#MON können"
	line "nicht agieren,"
	cont "wenn sie"
	cont "schlafen."
	para "Ich werde dir zei-"
	line "gen, wie furcht-"
	cont "erregend das ist!"
	done

PsychicGregBeatenText:
	; GSC-DE Dump
	text "Ich habe"
	line "verloren. Wie"
	cont "betrüblich…"
	done

MeetSunnyText:
	; GSC-DE Dump
	text "SONNFRIED: Hi!"
	para "Ich bin SONNFRIED"
	line "von Sonntag. Soll"
	cont "heißen, heute ist"
	cont "Sonntag!"
	done

SunnyGivesGiftText:
	; GSC-DE Dump
	text "Mir wurde aufge-"
	line "tragen, dir das"
	para "zu überreichen,"
	line "wenn ich dich"
	cont "treffe!"
	done

SunnySundayText:
	; GSC-DE Dump
	text "SONNFRIED: Meine"
	line "Geschwister heißen"
	cont "MONJA, DIETLINDE,"
	cont "MITKO, DONATUS,"
	cont "FRIEDA und SAMSON."
	para "Sie sind alle"
	line "älter als ich!"
	done

BeautyCallieSeenText:
	; PC-only
	text "Ach, du bist ein"
	line "süßer kleiner"
	cont "Trainer!"
	para "Willst du nicht"
	line "gegen mich"
	cont "kämpfen?"
	done

BeautyCallieBeatenText:
	; PC-only
	text "Du bist gut…"
	done

BeautyCassandraSeenText:
	; PC-only
	text "Hey, hey, du"
	line "junger Trainer!"
	para "Willst du nicht"
	line "gegen mich"
	cont "kämpfen?"
	done

BeautyCassandraBeatenText:
	; PC-only
	text "Wow, du bist"
	line "stark…"
	done

Route37SignText:
	; GSC-DE Dump
	text "ROUTE 37"
	done
