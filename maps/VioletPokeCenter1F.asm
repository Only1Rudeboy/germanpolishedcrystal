VioletPokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, VIOLET_CITY, 5
	warp_event  6,  7, VIOLET_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalFalknerScript

	def_object_events
	object_event 10,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, VioletPokeCenter1FElmsAideScript, EVENT_ELMS_AIDE_IN_VIOLET_POKEMON_CENTER
	pc_nurse_event  5, 1
	object_event  9,  4, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletPokeCenter1FGameboyKidText, -1
	object_event  2,  3	, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletPokeCenter1FGentlemanText, -1
	object_event  0,  5, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletPokeCenter1FSageText, -1
	object_event 11,  5, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletPokeCenter1FYoungsterText, -1

	object_const_def
	const VIOLETPOKECENTER1F_SCIENTIST

PokemonJournalFalknerScript:
	setflag ENGINE_READ_FALKNER_JOURNAL
	jumpthistext

	text "#MON Journal"
	para "Spezial:"
	line "ARENALEITER FALK!"
	para "Man sagt, FALK"
	line "verehrte seinen"
	cont "Vater, der früher"
	para "die ARENA in"
	line "VIOLA CITY"
	cont "leitete."
	done

VioletPokeCenter1FElmsAideScript:
	faceplayer
	opentext
	checkevent EVENT_REFUSED_TO_TAKE_EGG_FROM_ELMS_AIDE
	iftruefwd .SecondTimeAsking
	writetext .IntroText
	sjumpfwd .AskTakeEgg
.SecondTimeAsking:
	writetext .QuestionText
.AskTakeEgg:
	yesorno
	iffalsefwd .RefusedEgg
	giveegg TOGEPI
	iffalse_jumpopenedtext .PartyAndBoxFull
	setevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	clearevent EVENT_ELMS_AIDE_IN_LAB
	clearevent EVENT_TOGEPI_HATCHED
	setmapscene ROUTE_32, SCENE_ROUTE32_LYRA_GROTTOES
	writetext .GoodbyeText
	waitbutton
	closetext
	readvar VAR_FACING
	ifequalfwd UP, .AideWalksAroundPlayer
	turnobject PLAYER, DOWN
	applymovement VIOLETPOKECENTER1F_SCIENTIST, .WalkStraightMovement
	sjumpfwd .Finish
.AideWalksAroundPlayer:
	applymovement VIOLETPOKECENTER1F_SCIENTIST, .WalkAroundMovement
	turnobject PLAYER, DOWN
	applymovement VIOLETPOKECENTER1F_SCIENTIST, .WalkDownMovement
.Finish:
	playsound SFX_EXIT_BUILDING
	disappear VIOLETPOKECENTER1F_SCIENTIST
	waitsfx
	end

.PartyAndBoxFull:
	text "Oh, du hast keinen"
	line "Platz mehr für ein"
	cont "weiteres #MON."
	para "Ich warte hier,"
	line "bis du Platz für"
	cont "das EI geschaffen"
	cont "hast."
	done

.RefusedEgg:
	setevent EVENT_REFUSED_TO_TAKE_EGG_FROM_ELMS_AIDE
	jumpthisopenedtext

	text "A-Aber… PROF."
	line "LIND hat nach dir"
	cont "gefragt…"
	done
.IntroText:
	text "<PLAYER>, lange"
	line "nicht gesehen."
	para "PROF. LIND hat"
	line "mich gebeten, nach"
	cont "dir zu suchen."
	para "Er hat noch eine"
	line "Bitte an dich."
	para "Nimm bitte das"
	line "#MON-EI!"
	done

.QuestionText:
	text "<PLAYER>, nimmst du"
	line "das EI?"
	done

.GoodbyeText:
	text "Wir haben ent-"
	line "deckt, dass ein"
	para "#MON erst"
	line "schlüpft, nachdem"
	para "es im EI gewachsen"
	line "ist."
	para "Außerdem muss es"
	line "sich in der Nähe"
	para "anderer #MON"
	line "befinden, um zu"
	cont "schlüpfen."
	para "<PLAYER>, du bist"
	line "die einzige Per-"
	cont "son, auf die wir"
	para "uns verlassen"
	line "können."
	para "Bitte ruf PROF."
	line "LIND an, wenn das"
	cont "EI so weit ist!"
	done
.WalkAroundMovement:
	step_left
	step_left
	step_down
	step_left
	step_left
	step_end

.WalkStraightMovement:
	step_down
	step_left
	step_left
	step_left
	step_left
.WalkDownMovement:
	step_down
	step_down
	step_down
	step_down
	step_end

VioletPokeCenter1FGameboyKidText:
	text "Ein Kerl namens"
	line "BILL hat das"
	para "#MON-PC-LAGE-"
	line "RUNGS-SYSTEM"
	para "erfunden."
	done

VioletPokeCenter1FGentlemanText:
	text "Es war vor etwa"
	line "drei Jahren."
	para "TEAM ROCKET hatte"
	line "etwas Übles mit"
	cont "den #MON vor."
	para "Aber die Gerech-"
	line "tigkeit hat ge-"
	cont "siegt! Ein junger"
	cont "Trainer hat sie"
	cont "zerschlagen."
	done
VioletPokeCenter1FSageText:
	text "Manche SONNKERN"
	line "tragen ein"
	cont "Goldblatt."
	para "Und manche"
	line "MYRAPLA ein"
	cont "Silberblatt."
	para "Das schätzen"
	line "bestimmte Leute"
	cont "sehr."
	done

VioletPokeCenter1FYoungsterText:
	text "#MON sind"
	line "schlau. Sie gehor-"
	cont "chen nur Trainern,"
	cont "vor denen sie auch"
	cont "Respekt haben."
	para "Hat der Trainer"
	line "nicht genug ORDEN,"
	para "machen sie, was"
	line "sie wollen."
	done
