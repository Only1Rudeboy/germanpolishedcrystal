ShamoutiPokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, SHAMOUTI_ISLAND, 1
	warp_event  6,  7, SHAMOUTI_ISLAND, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalLoreleiScript

	def_object_events
	object_event  6,  3, SPRITE_IVY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ShamoutiPokeCenter1FIvyScript, EVENT_SHAMOUTI_POKE_CENTER_IVY
	pc_nurse_event  5, 1

	object_const_def
	const SHAMOUTIPOKECENTER1F_IVY

PokemonJournalLoreleiScript:
	setflag ENGINE_READ_LORELEI_JOURNAL
	jumpthistext

	text "#mon Journal"

	para "Spezial: Ex-TOP"
	line "VIER Lorelei!"

	para "Man sagt, Lorelei"
	line "habe eine"
	cont "komplette"

	para "Sammlung von"
	line "#mon-Puppen."
	done

ShamoutiPokeCenter1FIvyScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_IVY_INTRO
	iftruefwd .HeardIntro
	writetext .GreetingText
	waitbutton
	setevent EVENT_LISTENED_TO_IVY_INTRO
.HeardIntro
	writetext .OfferText
	loadmenu .KantoStarterMenuData
	verticalmenu
	closewindow
	ifequalfwd $1, .Bulbasaur
	ifequalfwd $2, .Charmander
	ifequalfwd $3, .Squirtle
	jumpthisopenedtext

	text "Ivy: Hm, ich"
	line "dachte, du wärst"
	cont "froh, ein seltenes"

	para "#mon"
	line "großzuziehen…"
	done

.Bulbasaur:
	writetext .ChoseKantoStarterText
	promptbutton
	waitsfx
	givepoke BULBASAUR, PLAIN_FORM, 10, SITRUS_BERRY
	iffalse_jumpopenedtext .NoRoomText
	getmonname BULBASAUR, STRING_BUFFER_3
	setevent EVENT_GOT_BULBASAUR_FROM_IVY
	sjumpfwd .Finish

.Charmander:
	writetext .ChoseKantoStarterText
	promptbutton
	waitsfx
	givepoke CHARMANDER, PLAIN_FORM, 10, SITRUS_BERRY
	iffalse_jumpopenedtext .NoRoomText
	getmonname CHARMANDER, STRING_BUFFER_3
	setevent EVENT_GOT_CHARMANDER_FROM_IVY
	sjumpfwd .Finish

.Squirtle:
	writetext .ChoseKantoStarterText
	promptbutton
	waitsfx
	givepoke SQUIRTLE, PLAIN_FORM, 10, SITRUS_BERRY
	iffalse_jumpopenedtext .NoRoomText
	getmonname SQUIRTLE, STRING_BUFFER_3
	setevent EVENT_GOT_SQUIRTLE_FROM_IVY
.Finish:
	writetext .GoodbyeText
	waitbutton
	closetext
	readvar VAR_FACING
	turnobject PLAYER, DOWN
	ifnotequal UP, .noleftstep
	applyonemovement SHAMOUTIPOKECENTER1F_IVY, step_left
.noleftstep
	applymovement SHAMOUTIPOKECENTER1F_IVY, .DownMovement
	playsound SFX_EXIT_BUILDING
	disappear SHAMOUTIPOKECENTER1F_IVY
	setevent EVENT_GOT_A_POKEMON_FROM_IVY
	checkevent EVENT_BEAT_YELLOW
	iffalsefwd .skip
	clearevent EVENT_INDIGO_PLATEAU_POKECENTER_YELLOW
.skip
	waitsfx
	end

.NoRoomText:
	text "Schade, es scheint"
	line "keinen Platz zu"
	cont "geben — weder in"
	cont "deinem Team noch"
	cont "in deiner Box…"
	done

.GreetingText:
	text "Ivy: Ach! Du bist"
	line "<PLAYER>, der neue"
	cont "Champion!"

	para "Freut mich, dich"
	line "kennenzulernen!"

	para "Ich bin Ivy, ein"
	line "#mon-Professor."

	para "Ich erforsche"
	line "lokale Variationen"
	cont "im Aussehen von"
	cont "#mon."

	para "Wusstest du, dass"
	line "manche wilde"
	cont "#mon"

	para "Attacken kennen,"
	line "die nur in ihrem"
	cont "Lebensraum"
	cont "vorkommen?"

	para "Und selbst zwei"
	line "#mon derselben"

	para "Art in einem"
	line "Gebiet können"
	cont "verschiedene"
	cont "Farben haben…"

	para "Ach,"
	line "Entschuldigung,"
	cont "ich schweife oft"
	cont "ab."
	done

.OfferText:
	text "Ivy: Du machst"
	line "also eine ganz"
	cont "neue"

	para "Arena-Herausfor-"
	line "derung in einer"
	cont "neuen Region…"

	para "Aha! Warum gebe"
	line "ich dir nicht auch"
	cont "ein neues #mon?"

	para "Welches möchtest"
	line "du?"
	done

.ChoseKantoStarterText:
	text "Ivy: Das finde ich"
	line "auch ein tolles"
	cont "#mon!"
	done

.GoodbyeText:
	text "Ivy: Prof. Elm hat"
	line "dir ein #mon"
	cont "anvertraut, und"

	para "Prof. Oak hat dir"
	line "einen #dex"
	cont "gegeben, also"

	para "weiß ich, dass du"
	line "gut auf"
	cont ""
	text_ram wStringBuffer3
	text "."

	para "Na ja, ich muss"
	line "zurück mit der"
	cont "Fähre"

	para "in mein Labor auf"
	line "der Valencia-"
	cont "Insel."

	para "Grüß Prof. Oak von"
	line "mir!"
	done

.DownMovement:
	step_down
	step_down
	step_down
	step_down
	step_end

.KantoStarterMenuData:
	db MENU_BACKUP_TILES
	menu_coords 0, 2, 13, 11
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 4 ; items
	db "Bulbasaur@"
	db "Charmander@"
	db "Squirtle@"
	db "Zurück@"
