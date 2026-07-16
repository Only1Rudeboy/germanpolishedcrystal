FuchsiaPokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, FUCHSIA_CITY, 4
	warp_event  6,  7, FUCHSIA_CITY, 4
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalJanineScript

	def_object_events
	object_event  6,  3, SPRITE_JANINE_IMPERSONATOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, JanineImpersonatorScript, -1
	pc_nurse_event  5, 1
	object_event  9,  4, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, FuchsiaPokeCenter1FCooltrainerMText, -1
	object_event  1,  4, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, FuchsiaPokeCenter1FCooltrainerFText, -1

	object_const_def
	const FUCHSIAPOKECENTER1F_JANINE_IMPERSONATOR

PokemonJournalJanineScript:
	setflag ENGINE_READ_JANINE_JOURNAL
	jumpthistext

	; PC-only Journal (class C)
	text "#MON Journal"

	para "Spezial: Leiterin"
	line "JANINA!"

	para "Man sagt, JANINA"
	line "war als Kind ein"

	para "Fan des #MON-"
	line "Zoos in FUCHSANIA"
	cont "CITY."
	done

JanineImpersonatorScript:
	showtextfaceplayer .Text1
	applymovement FUCHSIAPOKECENTER1F_JANINE_IMPERSONATOR, .SpinMovement
	faceplayer
	variablesprite SPRITE_JANINE_IMPERSONATOR, SPRITE_JANINE
	special RefreshSprites
	showtext .Text2
	applymovement FUCHSIAPOKECENTER1F_JANINE_IMPERSONATOR, .SpinMovement
	faceplayer
	variablesprite SPRITE_JANINE_IMPERSONATOR, SPRITE_CUTE_GIRL
	special RefreshSprites
	end

; GSC-DE Dump 6242–6243
.Text1:
	text "Ich bin JANINA!"
	line "Hokus pokus…"
	cont "Fidibus!"
	done

.Text2:
	text "Siehst du! Jetzt"
	line "sehe ich genauso"
	cont "aus wie sie!"
	done

.SpinMovement:
rept 3
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
endr
	turn_head_down
	step_end

; GSC-DE Dump 6240–6241
FuchsiaPokeCenter1FCooltrainerMText:
	text "He! Du hast einen"
	line "völlig neuen"
	cont "#dex!"

	para "Hat PROF. EICH"
	line "dir den gegeben?"
	done

FuchsiaPokeCenter1FCooltrainerFText:
	text "Ich habe mich in"
	line "der PKMN-ARENA"

	para "ganz schön"
	line "erschreckt."

	para "Da waren viele"
	line "Mädchen, die alle"
	cont "gleich aussahen."
	done
