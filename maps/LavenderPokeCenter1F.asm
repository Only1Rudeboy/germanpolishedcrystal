LavenderPokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, LAVENDER_TOWN, 1
	warp_event  6,  7, LAVENDER_TOWN, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalMrFujiScript

	def_object_events
	pc_nurse_event  5, 1
	object_event  1,  5, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavenderPokeCenter1FYoungsterScript, -1
	object_event 11,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, LavenderPokeCenter1FGentlemanText, -1
	object_event  6,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, LavenderPokeCenter1FTeacherText, -1

PokemonJournalMrFujiScript:
	setflag ENGINE_READ_MR_FUJI_JOURNAL
	jumpthistext

	text "#mon Journal"

	para "Redaktion: Der"
	line "schüchterne MR."
	cont "FUJI lehnte"

	para "unser Interview-"
	line "gesuch ab."

	para "Er ist ein"
	line "liebenswerter"
	cont "Mann, den man in"

	para "LAVANDIA"
	line "verehrt und"
	cont "schätzt."
	done

LavenderPokeCenter1FYoungsterScript:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iffalse_jumptextfaceplayer .NoMachinePartText
	checkevent EVENT_EXORCISED_LAV_RADIO_TOWER
	iffalse_jumptextfaceplayer .NoExorcismText
	jumpthistextfaceplayer

	text "Der Direktor des"
	line "Funkturms war"
	cont "sicher glücklich."

	para "Er sagte, sie"
	line "sind endlich"
	cont "wieder"
	cont "auf Sendung!"
	done

.NoMachinePartText:
	text "Wenn das"
	line "Kraftwerk"
	line "nicht läuft,"

	para "fährt auch der"
	line "Magnetzug nicht…"

	para "Und der Funkturm"
	line "kann nicht"
	cont "senden…"
	done

.NoExorcismText:
	text "Das Kraftwerk"
	line "läuft wieder,"

	para "aber der Funkturm"
	line "sendet immer noch"
	cont "nicht."

	para "Was ist da los?"
	done

LavenderPokeCenter1FGentlemanText:
	text "Im Norden von"
	line "LAVANDIA ist der"

	para "FELSTUNNEL. Er"
	line "führt zum"
	cont "KRAFTWERK."
	done
LavenderPokeCenter1FTeacherText:
	text "Es gibt ein"
	line "Radio-"
	line "programm mit"
	cont "#-Flöten-Musik."

	para "Ach? Ah, dein"
	line "Radio"
	line "braucht eine"
	cont "Expn.Card dafür."
	done
