DarkCaveVioletEntrance_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_DARKCAVEVIOLETENTRANCE_FALKNER
	scene_const SCENE_DARKCAVEVIOLETENTRANCE_NOOP

	def_callbacks

	def_warp_events
	warp_event  3, 15, ROUTE_31, 3
	warp_event 17,  1, DARK_CAVE_BLACKTHORN_ENTRANCE, 2
	warp_event 35, 33, ROUTE_46, 3

	def_coord_events
	coord_event  6,  2, SCENE_DARKCAVEVIOLETENTRANCE_FALKNER, DarkCaveVioletEntranceFalknerTrigger

	def_bg_events
	bg_event 26,  3, BGEVENT_ITEM + ELIXIR, EVENT_DARK_CAVE_VIOLET_ENTRANCE_HIDDEN_ELIXIR

	def_object_events
	pokemon_event 10, 2, URSARING, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BROWN, ClearText, EVENT_DARK_CAVE_URSARING
	object_event  9,  2, SPRITE_PIDGEOTTO_SIDE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_DARK_CAVE_PIDGEOTTO
	object_event  8,  2, SPRITE_FALKNER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_DARK_CAVE_FALKNER
	itemball_event  6,  8, POTION, 1, EVENT_DARK_CAVE_VIOLET_ENTRANCE_POTION
	smashrock_event 16, 14
	smashrock_event 27, 6
	smashrock_event  7, 14
	smashrock_event 36, 31
	itemball_event 36, 22, DUSK_STONE, 1, EVENT_DARK_CAVE_VIOLET_ENTRANCE_DUSK_STONE
	itemball_event 35,  9, HYPER_POTION, 1, EVENT_DARK_CAVE_VIOLET_ENTRANCE_HYPER_POTION
	itemball_event 30, 28, DIRE_HIT, 1, EVENT_DARK_CAVE_VIOLET_ENTRANCE_DIRE_HIT

	object_const_def
	const DARKCAVEVIOLETENTRANCE_URSARING
	const DARKCAVEVIOLETENTRANCE_PIDGEOTTO
	const DARKCAVEVIOLETENTRANCE_FALKNER

DarkCaveVioletEntranceFalknerTrigger:
	waitsfx
	checkdarkness
	iftruefwd .Darkness
	scall .BeatUrsaring
	showemote EMOTE_SHOCK, DARKCAVEVIOLETENTRANCE_FALKNER, 15
	opentext
	writetext DarkCaveVioletEntranceFalknerIntroText
.Finish:
	writetext DarkCaveVioletEntranceFalknerExplanationText
	waitbutton
	closetext
	follow PLAYER, DARKCAVEVIOLETENTRANCE_FALKNER
	applymovement PLAYER, DarkCaveVioletEntranceMovementData_PlayerStepAside
	stopfollow
	turnobject PLAYER, DOWN
	applymovement DARKCAVEVIOLETENTRANCE_FALKNER, DarkCaveVioletEntranceMovementData_FalknerLeave
	disappear DARKCAVEVIOLETENTRANCE_FALKNER
	pause 15
	clearevent EVENT_VIOLET_GYM_FALKNER
	setmapscene VIOLET_GYM, SCENE_VIOLETGYM_NOOP
	setscene SCENE_DARKCAVEVIOLETENTRANCE_NOOP
	end

.Darkness:
	checkevent EVENT_GOT_TM70_FLASH
	iftruefwd .ProgressAnyway
	showtext DarkCaveVioletEntranceFalknerDarknessText
	applyonemovement PLAYER, step_left
	end

.ProgressAnyway:
	showtext DarkCaveVioletEntranceFalknerProgressAnywayText
	scall .BeatUrsaring
	opentext
	writetext DarkCaveVioletEntranceFalknerDarkIntroText
	sjump .Finish

.BeatUrsaring:
	special SaveMusic
	playmusic MUSIC_JOHTO_TRAINER_BATTLE
	pause 40
	opentext
	writetext DarkCaveVioletEntranceFalknerAttackText
	pause 30
	closetext
	cry PIDGEOTTO
	waitsfx
	playsound SFX_TACKLE
	applymovement DARKCAVEVIOLETENTRANCE_PIDGEOTTO, DarkCaveVioletEntranceMovementData_PidgeottoAttack
	waitsfx
	pause 30
	cry URSARING
	pause 30
	disappear DARKCAVEVIOLETENTRANCE_URSARING
	pause 15
	special RestoreMusic
	opentext
	writetext DarkCaveVioletEntranceFalknerReturnText
	pause 30
	closetext
	disappear DARKCAVEVIOLETENTRANCE_PIDGEOTTO
	pause 20
	applyonemovement DARKCAVEVIOLETENTRANCE_FALKNER, step_left
	end

DarkCaveVioletEntranceMovementData_PidgeottoAttack:
	run_step_right
	run_step_left
	step_end

DarkCaveVioletEntranceMovementData_PlayerStepAside:
	step_left
	step_left
	step_left
	step_end

DarkCaveVioletEntranceMovementData_FalknerLeave:
	step_down
	step_left
	step_down
	step_down
	step_down
	step_down
	step_end

DarkCaveVioletEntranceFalknerAttackText:
	text "Falkner: Setz"
	line "Flügelschlag ein,"
	cont "Pidgeotto!"
	done

DarkCaveVioletEntranceFalknerReturnText:
	text "Gut gemacht,"
	line "Pidgeotto."
	done

DarkCaveVioletEntranceFalknerIntroText:
	text "Ach! Du musst ein"
	line "Trainer sein."
	prompt

DarkCaveVioletEntranceFalknerDarkIntroText:
	text "Du musst mutig"
	line "sein, um hier in"
	cont "stockdunkler Nacht"
	cont "herzukommen."
	prompt

DarkCaveVioletEntranceFalknerExplanationText:
	text "Ich bin Falkner,"
	line "der Arenaleiter"
	cont "von Viola City."

	para "Ich erkunde Höhlen"
	line "nicht zum Spaß,"

	para "aber dieses"
	line "Ursaring hat"
	cont "Trainer"
	cont "angegriffen,"

	para "die sich nicht"
	line "wehren konnten."

	para "Als Arenaleiter"
	line "ist es meine"
	cont "Pflicht,"

	para "so etwas zu"
	line "regeln."

	para "Du willst also"
	line "einen Orden?"

	para "Dann triff mich in"
	line "der #mon-ARENA"
	cont "in Viola City."
	done

DarkCaveVioletEntranceFalknerDarknessText:
	text "Falkner: Ist da"
	line "jemand?"

	para "Komm nicht näher!"

	para "Es ist zu dunkel,"
	line "du könntest dich"
	cont "verletzen."
	done

DarkCaveVioletEntranceFalknerProgressAnywayText:
	text "Falkner: Ist da"
	line "jemand?"

	para "Ohne Licht die"
	line "Dunkelhöhle zu"
	cont "erkunden ist"
	cont "leichtsinnig!"

	para "Ich bin mitten im"
	line "Kampf, also halt"
	cont "Abstand!"
	done
