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

	text "#MON Journal"
	para "Redaktion: Der"
	line "schüchterne MR."
	cont "FUJI lehnte"
	para "unser"
	line "Interviewgesuch"
	cont "ab."
	para "Er ist ein"
	line "liebenswerter"
	cont "Mann, den man in"
	para "LAVANDIA verehrt"
	line "und schätzt."
	done

LavenderPokeCenter1FYoungsterScript:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iffalse_jumptextfaceplayer .NoMachinePartText
	checkevent EVENT_EXORCISED_LAV_RADIO_TOWER
	iffalse_jumptextfaceplayer .NoExorcismText
	jumpthistextfaceplayer

	; GSC-DE Dump 3175
	text "Der INTENDANT der"
	line "RADIOSTATION war"
	cont "hoch erfreut."

	para "Er sagte, sie"
	line "seien wieder auf"

	para "Sendung, weil das"
	line "KRAFTWERK wieder"
	cont "einwandfrei"
	cont "arbeite."
	done

.NoMachinePartText:
	; GSC-DE Dump 3174
	text "Wenn das KRAFTWERK"
	line "nicht funktio-"
	cont "niert, läuft der"

	para "MAGNETZUG auch"
	line "nicht…"

	para "Das bedeutet, dass"
	line "auch die RADIO-"
	cont "STATION nicht"

	para "auf Sendung"
	line "gehen kann…"
	done

.NoExorcismText:
	; PC-only (CAPS)
	text "Das KRAFTWERK"
	line "läuft wieder,"

	para "aber der RADIOTURM"
	line "sendet immer noch"
	cont "nicht."

	para "Was ist da los?"
	done

LavenderPokeCenter1FGentlemanText:
	; GSC-DE Dump 3172
	text "Im Norden von"
	line "LAVANDIA ist der"

	para "FELSTUNNEL. Er"
	line "führt zum"
	cont "KRAFTWERK."
	done
LavenderPokeCenter1FTeacherText:
	; GSC-DE Dump 3173
	text "Es gibt eine"
	line "Musiksendung im"
	cont "Radio, die Melo-"
	cont "dien auf der #"
	cont "floete sendet."

	para "Ach ja? Ah, dein"
	line "Radio braucht ein"
	cont "ZUSATZSET, damit"
	cont "du das empfangen"
	cont "kannst."
	done
