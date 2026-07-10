ValenciaPort_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 10, 17, ROUTE_49, 1
	warp_event 11, 17, ROUTE_49, 1

	def_coord_events

	def_bg_events
	bg_event 10,  9, BGEVENT_ITEM + MAX_POTION, EVENT_VALENCIA_PORT_HIDDEN_MAX_POTION

	def_object_events
	object_event 11,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ValenciaPortSailorScript, -1
	object_event 13, 10, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, ValenciaPortFisherText, -1

	object_const_def
	const VALENCIAPORT_SAILOR

ValenciaPortSailorScript:
	faceplayer
	opentext
	writetext .QuestionText
	yesorno
	iffalsefwd .RefuseFerry
	writetext .DepartText
	waitbutton
	closetext
	turnobject VALENCIAPORT_SAILOR, UP
	pause 10
	playsound SFX_EXIT_BUILDING
	disappear VALENCIAPORT_SAILOR
	waitsfx
	applyonemovement PLAYER, step_up
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	waitsfx
	setmapscene SEAGALLOP_FERRY_SHAMOUTI_GATE, SCENE_SEAGALLOPFERRYSHAMOUTIGATE_LEAVE
	warp SEAGALLOP_FERRY_SHAMOUTI_GATE, 6, 5
	end

.RefuseFerry
	jumpopenedtext .RefuseText

.QuestionText:
	text "Zurück zur"
	line "Shamouti-Insel?"
	done

.DepartText:
	text "Na gut!"

	para "Alle an Bord der"
	line "Seagallop-Fähre!"
	done

.RefuseText:
	text "Ich warte genau"
	line "hier."
	done

ValenciaPortFisherText:
	text "Hast du das Meer"
	line "bemerkt?"

	para "Diese Gewässer"
	line "unterscheiden"

	para "sich von denen in"
	line "KANTO und JOHTO."
	done
