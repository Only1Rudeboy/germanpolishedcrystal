LyrasHouse1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, NEW_BARK_TOWN, 4
	warp_event  3,  7, NEW_BARK_TOWN, 4
	warp_event  0,  0, LYRAS_HOUSE_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_UP, LyrasFridgeScript
	bg_event  8,  1, BGEVENT_JUMPTEXT, LyrasSinkText
	bg_event  9,  1, BGEVENT_JUMPTEXT, LyrasStoveText
	bg_event  5,  1, BGEVENT_UP, LyrasTVScript

	def_object_events
	object_event  2,  3, SPRITE_DAD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, LyrasDadScript, -1

LyrasDadScript:
	faceplayer
	opentext
	checkevent EVENT_LYRA_IN_HER_ROOM
	iffalsefwd .LyraInside
	checkevent EVENT_GOT_SS_TICKET_FROM_ELM
	iftruefwd .LyraTraining
	jumpthisopenedtext

	text "Hallo, <PLAYER>!"
	line "LYRA ist nicht da."
	para "Sie hilft dem"
	line "Professor."
	done

.LyraInside
	jumpthisopenedtext

	text "Hallo, <PLAYER>!"
	line "LYRA ist oben."

	para "Sie spielt wie"
	line "immer mit ihren"
	cont "#mon."
	done

.LyraTraining
	jumpthisopenedtext

	text "Hallo, <PLAYER>!"
	line "LYRA ist nicht da."
	para "Sie sammelt ORDEN"
	line "in ganz JOHTO!"
	done




LyrasFridgeScript:
	jumpthistext

	text "Mal sehen, was im"
	line "Kühlschrank ist …"
	para "Frisches Wasser"
	line "und Reisbällchen!"
	done

LyrasSinkText:
	text "Das Waschbecken"
	line "glänzt."
	done
LyrasStoveText:
	text "Auf dem Herd"
	line "köchelt Curry."
	done
LyrasTVScript:
	jumpthistext

	text "Im TV läuft ein"
	line "Film: Ein Mädchen"
	para "mit Zöpfen geht"
	line "einen Backsteinweg"
	cont "entlang."
	para "Ich sollte auch"
	line "losgehen!"
	done
