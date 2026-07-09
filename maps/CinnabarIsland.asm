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

	text "Willst du gegen"
	line "mich kämpfen,"
	cont "zeig mir"

	para "wie viele KANTO-"
	line "Orden du hast."

	para "Weniger als"
	line "sieben… Du bist"
	cont "noch nicht bereit"
	cont "für mich."
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
	text "Wer bist du?"

	para "Na, du bist"
	line "augenscheinlich"
	cont "ein Trainer…"

	para "Ich heiße BLAU."

	para "Ich war einmal"
	line "ein"
	line "CHAMP, wenn auch"

	para "nur für kurze"
	line "Zeit…"

	para "Dieser nervige"
	line "ROT"
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

	para "Sieh dich gut"
	line "um…"

	para "Ein Vulkan bricht"
	line "aus und"
	cont "vernichtet"

	para "auf einen Schlag"
	line "eine ganze Stadt."

	para "Wir werden"
	line "weiter-"
	line "hin mit unseren"

	para "#mon siegen"
	line "oder verlieren."

	para "Aber wenn sich"
	line "die"
	line "Natur erhebt, ist"
	cont "alles im Nu"
	cont "dahin."

	para "…"

	para "So ist das"
	line "eben…"

	para "Trotz allem bin"
	line "ich immer noch"
	cont "ein"
	cont "Trainer."

	para "Wenn ich einen"
	line "starken Gegner"
	cont "treffe, möchte"
	cont "ich"
	cont "gegen ihn"
	cont "kämpfen."

	para "Wenn du gegen"
	line "mich"
	line "kämpfen möchtest,"

	para "dann besuche die"
	line "#mon-ARENA in"
	cont "VERTANIA CITY."

	para "Dort werde ich"
	line "mich deiner"
	cont "annehmen."
	done


CinnabarIslandBlueBattleText:
	text "Seh ich einen"
	line "starken Gegner,"
	cont "will ich sofort"
	cont "kämpfen."
	done

CinnabarIslandBlueReadyText:
	text "Willst du gegen"
	line "mich kämpfen,"
	cont "komm in die"
	cont "Arena von"
	cont "VERTANIA CITY."

	para "Dort nehm ich"
	line "dich an."
	done


CinnabarIslandGymSignText:
	text "Hier ist eine"
	line "Nachricht…"

	para "Die #mon-ARENA"
	line "der"
	line "ZINNOBERINSEL"

	para "wurde auf die"
	line "SEESCHAUMINSELN"
	cont "verlegt."

	para "PYRO"
	done


CinnabarIslandSignText:
	text "ZINNOBERINSEL"

	para "Die Feurige Stadt"
	line "Brennender"
	cont "Begierde"
	done


CinnabarIslandVolcanoWarningSignText:
	text "ACHTUNG"

	para "Der Zinnober-"
	line "Vulkan schläft,"
	cont "ist aber aktiv!"

	para "Betritt ihn nicht"
	line "ohne Flucht-"
	cont "möglichkeit!"
	done
