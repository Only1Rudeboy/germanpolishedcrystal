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
	line "mich kämpfen, zeig"
	cont "mir"
	para "wie viele"
	line "KANTO-Orden du"
	cont "hast."
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
	text "Yo! Ich bin BLAU,"
	line "ARENALEITER von"
	cont "VERTANIA!"
	para "Die Arena hier ist"
	line "im Vulkan…"
	done
CinnabarIslandBlueBattleText:
	text "Bereit für einen"
	line "harten Kampf?"
	done
CinnabarIslandBlueReadyText:
	text "Komm nach"
	line "VERTANIA, wenn du"
	cont "mich herausfordern"
	cont "willst!"
	done
CinnabarIslandGymSignText:
	text "PKMN-ARENA von"
	line "ZINNOBERINSEL"
	para "Der Vulkan hält"
	line "sie verborgen…"
	done
CinnabarIslandSignText:
	text "ZINNOBERINSEL"
	para "Die Feurige Stadt"
	line "Brennender"
	cont "Begierde"
	done
CinnabarIslandVolcanoWarningSignText:
	text "ACHTUNG"
	para "Der"
	line "Zinnober-Vulkan"
	cont "schläft, ist aber"
	cont "aktiv!"
	para "Betritt ihn nicht"
	line "ohne"
	cont "Fluchtmöglichkeit!"
	done
