PewterMuseumOfScience1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 10,  7, PEWTER_CITY, 6
	warp_event 11,  7, PEWTER_CITY, 8
	warp_event 16,  7, PEWTER_CITY, 7
	warp_event 17,  7, PEWTER_CITY, 7
	warp_event  7,  7, PEWTER_MUSEUM_OF_SCIENCE_2F, 1

	def_coord_events

	def_bg_events
	bg_event  2,  3, BGEVENT_READ, KabutopsFossilSignpostScript
	bg_event  6,  3, BGEVENT_READ, OmastarFossilSignpostScript
	bg_event  3,  6, BGEVENT_READ, AerodactylFossilSignpostScript
	bg_event 12,  1, BGEVENT_JUMPTEXT, Museum1FBookshelfSignpostText
	bg_event 13,  1, BGEVENT_JUMPTEXT, Museum1FBookshelfSignpostText
	bg_event 14,  1, BGEVENT_JUMPTEXT, Museum1FBookshelfSignpostText
	bg_event 15,  1, BGEVENT_JUMPTEXT, Museum1FBookshelfSignpostText
	bg_event 17,  1, BGEVENT_JUMPTEXT, Museum1FBookshelfSignpostText
	bg_event 18,  1, BGEVENT_JUMPTEXT, Museum1FBookshelfSignpostText

	def_object_events
	object_event 18,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, Museum1FFossilScientistScript, -1
	object_event 12,  4, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Museum1FReceptionistScript, -1
	object_event 16,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GRAY, OBJECTTYPE_COMMAND, jumptextfaceplayer, Museum1FScientistText, -1
	object_event  1,  7, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Museum1FGrampsText, -1
	object_event  4,  3, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Museum1FYoungsterText, -1

	object_const_def
	const PEWTERMUSEUMOFSCIENCE1F_SCIENTIST2

Museum1FFossilScientistScript:
	faceplayer
	opentext
	writetext Museum1FFossilScientistText
	waitbutton
	checkitem HELIX_FOSSIL
	iftruefwd .own_helix
	checkitem DOME_FOSSIL
	iftruefwd .own_dome
	checkitem OLD_AMBER
	iftruefwd .ask_old_amber
	jumpthisopenedtext

	text "Hey! Du hast"
	line "keine Fossilien."
	done

.own_helix
	checkitem DOME_FOSSIL
	iftruefwd .own_helix_and_dome
	checkitem OLD_AMBER
	iftruefwd .ask_helix_amber
	writetext AskHelixFossilText
	yesorno
	iftrue ResurrectHelixFossil
	sjumpfwd .maybe_later

.own_dome
	checkitem OLD_AMBER
	iftruefwd .ask_dome_amber
	writetext AskDomeFossilText
	yesorno
	iftrue ResurrectDomeFossil
	sjumpfwd .maybe_later

.own_helix_and_dome
	checkitem OLD_AMBER
	iftruefwd .ask_helix_dome_amber
	loadmenu HelixDomeMenuDataHeader
	verticalmenu
	closewindow
	ifequalfwd $1, ResurrectHelixFossil
	ifequalfwd $2, ResurrectDomeFossil
	sjumpfwd .maybe_later

.ask_old_amber
	writetext AskOldAmberText
	yesorno
	iftruefwd ResurrectOldAmber
	sjumpfwd .maybe_later

.ask_helix_amber
	loadmenu HelixAmberMenuDataHeader
	verticalmenu
	closewindow
	ifequalfwd $1, ResurrectHelixFossil
	ifequalfwd $2, ResurrectOldAmber
	sjumpfwd .maybe_later

.ask_dome_amber
	loadmenu DomeAmberMenuDataHeader
	verticalmenu
	closewindow
	ifequalfwd $1, ResurrectDomeFossil
	ifequalfwd $2, ResurrectOldAmber
	sjumpfwd .maybe_later

.ask_helix_dome_amber
	loadmenu HelixDomeAmberMenuDataHeader
	verticalmenu
	closewindow
	ifequalfwd $1, ResurrectHelixFossil
	ifequalfwd $2, ResurrectDomeFossil
	ifequalfwd $3, ResurrectOldAmber
.maybe_later:
	jumpthisopenedtext

	text "Sprich mich an,"
	line "wenn du es dir"
	cont "anders"
	cont "überlegst."
	done

HelixDomeMenuDataHeader:
	db MENU_BACKUP_TILES
	menu_coords 0, 4, 15, 11
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 3 ; items
	db "Helixfossil@"
	db "Domfossil@"
	db "Zurück@"

HelixAmberMenuDataHeader:
	db MENU_BACKUP_TILES
	menu_coords 0, 4, 15, 11
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 3 ; items
	db "Helixfossil@"
	db "Altbernstein@"
	db "Zurück@"

DomeAmberMenuDataHeader:
	db MENU_BACKUP_TILES
	menu_coords 0, 4, 14, 11
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 3 ; items
	db "Domfossil@"
	db "Altbernstein@"
	db "Zurück@"

HelixDomeAmberMenuDataHeader:
	db MENU_BACKUP_TILES
	menu_coords 0, 2, 15, 11
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 4 ; items
	db "Helixfossil@"
	db "Domfossil@"
	db "Altbernstein@"
	db "Zurück@"

ResurrectHelixFossil:
	takeitem HELIX_FOSSIL
	scall ResurrectAFossilScript
	givepoke OMANYTE, 20
	sjumpfwd FinishResurrect

ResurrectDomeFossil:
	takeitem DOME_FOSSIL
	scall ResurrectAFossilScript
	givepoke KABUTO, 20
	sjumpfwd FinishResurrect

ResurrectOldAmber:
	takeitem OLD_AMBER
	scall ResurrectAFossilScript
	givepoke AERODACTYL, 20
FinishResurrect:
	iffalse_jumpopenedtext NoRoomForFossilPokemonText
	jumpthisopenedtext

	text "Pass gut auf"
	line "es auf!"
	done

ResurrectAFossilScript:
	writetext ResurrectingPokemonText
	waitbutton
	closetext
	turnobject PEWTERMUSEUMOFSCIENCE1F_SCIENTIST2, RIGHT
	pause 15
	playsound SFX_BOOT_PC
	waitsfx
	pause 30
	playsound SFX_4_NOTE_DITTY
	waitsfx
	pause 5
	waitsfx
	pause 30
	playsound SFX_SHUT_DOWN_PC
	waitsfx
	pause 15
	faceplayer
	opentext
	end

Museum1FReceptionistScript:
	readvar VAR_FACING
	ifequalfwd DOWN, .Sneak
	ifequalfwd LEFT, .Sneak
	jumpthistextfaceplayer

	text "Willkommen!"

	para "Dank einer groß-"
	line "zügigen Spende"
	cont "von Silph Co.,"

	para "ist der Eintritt"
	line "frei!"

	para "Bitte schau dich"
	line "um."
	done

.Sneak:
	jumpthistextfaceplayer

	text "Du kannst nicht"
	line "hinten rein-"
	cont "schleichen!"
	done

KabutopsFossilSignpostScript:
	reanchormap
	trainerpic KABUTOPS_FOSSIL
	waitbutton
	closepokepic
	jumpthistext

	text "Kabutops-Fossil"
	line "(Domfossil)"

	para "Ein primitives,"
	line "seltenes #mon."
	done

OmastarFossilSignpostScript:
	reanchormap
	trainerpic OMASTAR_FOSSIL
	waitbutton
	closepokepic
	jumpthistext

	text "Omastar-Fossil"
	line "(Helixfossil)"

	para "Ein primitives,"
	line "seltenes #mon."
	done

AerodactylFossilSignpostScript:
	reanchormap
	trainerpic AERODACTYL_FOSSIL
	waitbutton
	closepokepic
	jumpthistext

	text "Aerodactyl-"
	line "Fossil"

	para "Ein primitives,"
	line "seltenes #mon."
	done

Museum1FScientistText:
	text "Wir sind stolz"
	line "auf"
	line "drei Fossilien"

	para "seltener, urzeit-"
	line "licher #mon."

	para "Ich habe beim"
	line "Zusammenbau"
	cont "geholfen!"
	done

Museum1FFossilScientistText:
	text "Wusstest du, dass"
	line "man aus Fossilien"

	para "#mon"
	line "herstellt?"

	para "Wenn du das"
	line "brauchst, über-"
	cont "nehme ich das!"
	done

Museum1FGrampsText:
	text "Das ist ein"
	line "prächtiges"
	cont "Fossil!"
	done

Museum1FYoungsterText:
	text "Es gibt zwei"
	line "Orte,"
	line "die ich liebe!"

	para "Einer sind die"
	line "Ruinen von Alph"
	cont "in Johto."

	para "Das andere ist"
	line "das Museum von"
	cont "Marmoria City!"

	para "Beide haben so"
	line "viel Geschichte!"
	done

Museum1FBookshelfSignpostText:
	text "Dicke, gut"
	line "gelesene Bücher!"

	para "Archäologie-Man-"
	line "ual, Verlorene"
	cont "#mon,"
	cont "#mon-Vorfahren,"

	para "Pflege der"
	line "Lehmschicht von"
	cont "Kanto…"
	done

AskHelixFossilText:
	text "Willst du das"
	line "Helixfossil"
	cont "reanimieren?"
	done

AskDomeFossilText:
	text "Willst du das"
	line "Domfossil"
	cont "reanimieren?"
	done

AskOldAmberText:
	text "Willst du den"
	line "Altbernstein"
	cont "reanimieren?"
	done



ResurrectingPokemonText:
	text "OK! Ich"
	line "reanimiere"
	line "das #mon!"
	done

NoRoomForFossilPokemonText:
	text "Hey! Du kannst"
	line "kein weiteres"
	cont "#mon tragen,"
	cont "und deine Box"
	cont "ist auch voll!"
	done
