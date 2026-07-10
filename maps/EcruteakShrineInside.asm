EcruteakShrineInside_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5, 11, ECRUTEAK_SHRINE_OUTSIDE, 1
	warp_event  6, 11, ECRUTEAK_SHRINE_OUTSIDE, 1

	def_coord_events

	def_bg_events
	bg_event  5,  6, BGEVENT_JUMPTEXT, EcruteakShrineInsideAltarText
	bg_event  6,  6, BGEVENT_JUMPTEXT, EcruteakShrineInsideAltarText

	def_object_events
	object_event  7,  6, SPRITE_SABRINA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakShrineInsideReiScript, -1
	object_event  3,  8, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakShrineInsideGrampsText, -1
	object_event 10,  5, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakShrineInsideSageText, -1
	object_event  1,  6, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakShrineInsideGrannyText, -1
	pokemon_event 10,  3, FURRET, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BROWN, ClearText, -1

	object_const_def
	const ECRUTEAKSHRINEINSIDE_REI

EcruteakShrineInsideReiScript:
	faceplayer
	opentext
	checkflag ENGINE_DAILY_SHRINE_VISIT
	iftruefwd .ReiDone
	writetext EcruteakShrineInsideReiGreetingText
	loadmenu .ReiMenuDataHeader
	verticalmenu
	closewindow
	ifequalfwd $1, .ReiBless
	ifequalfwd $2, .ReiBattle
	sjumpfwd .ReiCancel

.ReiBless
	writetext EcruteakShrineInsideReiBlessText
	promptbutton
	special Special_ReiBlessing
	ifequalfwd $0, .ReiCancel
	ifequalfwd $1, .EggBlessing
	setflag ENGINE_DAILY_SHRINE_VISIT
	writetext EcruteakShrineInsideReiBlessingText
	special PlayCurMonCry
	waitbutton
	writetext EcruteakShrineInsideHappinessText
	waitbutton
	sjumpfwd .ReiDone

.ReiBattle
	writetext EcruteakShrineInsideReiBattleText
	waitbutton
	closetext
	setflag ENGINE_DAILY_SHRINE_VISIT
	winlosstext EcruteakShrineInsideReiBeatenText, 0
	setlasttalked ECRUTEAKSHRINEINSIDE_REI
	readvar VAR_BADGES
	ifequalfwd 16, .Battle3
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd .Battle2
	loadtrainer REI, 1
	startbattle
	reloadmapafterbattle
	sjumpfwd .AfterRematch

.Battle2:
	loadtrainer REI, 2
	startbattle
	reloadmapafterbattle
	sjumpfwd .AfterRematch

.Battle3:
	loadtrainer REI, 3
	startbattle
	reloadmapafterbattle
	; fallthrough

.AfterRematch:
	opentext
	; fallthrough

.ReiDone
	jumpthisopenedtext

	text "Rei: Komm doch"
	line "morgen wieder."
	done

.ReiCancel
	jumpthisopenedtext

	text "Rei: Komm"
	line "wieder, wenn"
	cont "du deine"
	cont "Meinung"
	cont "änderst."
	done

.EggBlessing
	jumpthisopenedtext

	text "Rei: Ein EI"
	line "kann ich nicht"
	cont "segnen."
	done

.ReiMenuDataHeader:
	db MENU_BACKUP_TILES
	menu_coords 0, 4, 11, 11
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 3 ; items
	db "Segen@"
	db "Kampf@"
	db "Zurück@"

EcruteakShrineInsideReiGreetingText:
	text "Rei: Ach, hallo."
	line "Willkommen in"
	cont "unserem Schrein."

	para "Bist du gekommen,"
	line "damit ich eines"
	cont "deiner #mon"
	cont "segnen soll?"

	para "Oder möchtest du"
	line "kämpfen?"
	done

EcruteakShrineInsideReiBlessText:
	text "Rei: OK, welches"
	line "#mon soll ich"
	cont "segnen?"
	done

EcruteakShrineInsideReiBlessingText:
	text "Rei: Mögest du"
	line "Ruhe und Frieden"
	cont "finden."
	done

EcruteakShrineInsideHappinessText:
	text_ram wStringBuffer3
	text " sieht"
	line "zufrieden aus."
	done
EcruteakShrineInsideReiBattleText:
	text "Rei: Sehr gut."
	line "Böse Geister,"
	cont "verschwindet!"
	done

EcruteakShrineInsideReiBeatenText:
	text "Ich gebe auf!"
	done



EcruteakShrineInsideGrampsText:
	text "Die"
	line "Schreinjungfer"
	line "hier ist meine"
	cont "Enkelin."
	done

EcruteakShrineInsideSageText:
	text "Die meisten hier"
	line "im Schrein"
	line "trainieren"

	para "HOOTHOOT und"
	line "WIESOR, um"
	cont "Geister zu"
	cont "bekämpfen."

	para "Rei ist"
	line "besonders. Sie"
	cont "setzt Feuer- und"
	cont "Psycho-#mon"
	cont "ein."
	done

EcruteakShrineInsideGrannyText:
	text "Gott sei Dank"
	line "gab es keinen"
	cont "Magnetzug-Halt in"
	cont "Viola City."

	para "Das hätte unsere"
	line "traditionelle"
	cont "Landschaft"
	cont "zerstört."
	done

EcruteakShrineInsideAltarText:
	text "Bitte zeige Ehre"
	line "und Respekt beim"
	cont "Besuch."
	done
