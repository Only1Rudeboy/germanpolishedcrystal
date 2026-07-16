CinnabarIsland_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, CinnabarIslandFlyPoint

	def_warp_events
	warp_event 11, 15, CINNABAR_POKECENTER_1F, 1
	warp_event 18,  9, CINNABAR_VOLCANO_1F, 1
	warp_event  7,  7, POKEMON_MANSION_1F, 1

	def_coord_events

	def_bg_events
	bg_event  9, 15, BGEVENT_JUMPTEXT, CinnabarIslandGymSignText
	bg_event  9, 11, BGEVENT_JUMPTEXT, CinnabarIslandSignText
	bg_event 21, 11, BGEVENT_JUMPTEXT, CinnabarIslandVolcanoWarningSignText
	bg_event 11, 12, BGEVENT_ITEM + RARE_CANDY, EVENT_CINNABAR_ISLAND_HIDDEN_RARE_CANDY

	def_object_events
	object_event 20, 14, SPRITE_BLUE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CinnabarIslandBlue, EVENT_BLUE_IN_CINNABAR
	itemball_event 22,  2, MAGMARIZER, 1, EVENT_CINNABAR_ISLAND_MAGMARIZER

	object_const_def
	const CINNABARISLAND_BLUE

CinnabarIslandFlyPoint:
	setflag ENGINE_FLYPOINT_CINNABAR
	endcallback

CinnabarIslandBlue:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_BLUE_INTRO
	iftruefwd .HeardIntro
	writetext CinnabarIslandBlueText
	waitbutton
	setevent EVENT_LISTENED_TO_BLUE_INTRO
.HeardIntro
	writetext CinnabarIslandBlueBattleText
	waitbutton
	readvar VAR_BADGES
	ifgreater 14, .Ready
	jumpthisopenedtext

	; PC badge gate (class C)
	text "Willst du gegen"
	line "mich kämpfen, zeig"
	cont "mir"
	para "wie viele KANTO-"
	line "ORDEN du hast."
	para "Weniger als sieben"
	line "… Du bist noch"
	cont "nicht bereit für"
	cont "mich."
	done

.Ready
	writetext CinnabarIslandBlueReadyText
	waitbutton
	closetext
	playsound SFX_WARP_TO
	applyonemovement CINNABARISLAND_BLUE, teleport_from
	disappear CINNABARISLAND_BLUE
	clearevent EVENT_VIRIDIAN_GYM_BLUE
	end

CinnabarIslandBlueText:
	; GSC-DE Dump
	text "Wer bist du?"
	para "Na, du bist"
	line "augenscheinlich"
	cont "ein Trainer…"
	para "Ich heiße BLAU."
	para "Ich war einmal ein"
	line "CHAMP, wenn auch"
	para "nur für kurze"
	line "Zeit…"
	para "Dieser nervige ROT"
	line "hat mich ganz"
	para "schön fertig-"
	line "gemacht…"
	para "Wie dem auch sei,"
	line "was willst du?"
	para "Willst du gegen"
	line "mich kämpfen?"
	para "…Ich sage es nur"
	line "ungern, aber ich"
	para "habe gar keine"
	line "Lust zu kämpfen."
	para "Sieh dich gut um…"
	para "Ein Vulkan bricht"
	line "aus und vernichtet"
	para "auf einen Schlag"
	line "eine ganze Stadt."
	para "Wir werden weiter-"
	line "hin mit unseren"
	para "#MON siegen"
	line "oder verlieren."
	para "Aber wenn sich die"
	line "Natur erhebt, ist"
	cont "alles im Nu dahin."
	para "…"
	para "So ist das eben…"
	para "Trotz allem bin"
	line "ich immer noch ein"
	cont "Trainer."
	done

CinnabarIslandBlueBattleText:
	; GSC-DE Dump
	text "Wenn ich einen"
	line "starken Gegner"
	cont "treffe, möchte ich"
	cont "gegen ihn kämpfen."
	done

CinnabarIslandBlueReadyText:
	; GSC-DE Dump
	text "Wenn du gegen mich"
	line "kämpfen möchtest,"
	para "dann besuche die"
	line "PKMN-ARENA in"
	cont "VERTANIA CITY."
	para "Dort werde ich"
	line "mich deiner"
	cont "annehmen."
	done

CinnabarIslandGymSignText:
	; GSC-DE Dump
	text "Hier ist eine"
	line "Nachricht…"
	para "Die PKMN-ARENA der"
	line "ZINNOBERINSEL"
	para "wurde auf die"
	line "SEESCHAUMINSELN"
	cont "verlegt."
	para "PYRO"
	done

CinnabarIslandSignText:
	; GSC-DE Dump
	text "ZINNOBERINSEL"
	para "Die Feurige Stadt"
	line "Brennender"
	cont "Begierde"
	done

CinnabarIslandVolcanoWarningSignText:
	; PC (class C)
	text "ACHTUNG"
	para "Der ZINNOBER-"
	line "VULKAN schläft,"
	cont "ist aber aktiv!"
	para "Betritt ihn nicht"
	line "ohne"
	cont "Fluchtmöglichkeit!"
	done
