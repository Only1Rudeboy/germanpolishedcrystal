SilphCo1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .SilphCo1FMoveOfficerCallback

	def_warp_events
	warp_event  2,  9, SAFFRON_CITY, 7
	warp_event  3,  9, SAFFRON_CITY, 21
	warp_event 13,  0, SILPH_CO_2F, 1

	def_coord_events

	def_bg_events
	bg_event  8,  0, BGEVENT_JUMPTEXT, SilphCoElevatorText

	def_object_events
	object_event 13,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilphCoOfficerScript, -1
	object_event  4,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, SilphCoReceptionistText, -1
	object_event 11,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, SilphCo1FGentlemanText, -1
	object_event  8,  4, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, SilphCo1FCooltrainerfText, -1

	object_const_def
	const SILPHCO1F_OFFICER

.SilphCo1FMoveOfficerCallback:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iffalsefwd .Nothing
	moveobject SILPHCO1F_OFFICER, 14, 1
.Nothing
	endcallback

SilphCoOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .OfficerScriptAfterPowerRestored
	jumpthisopenedtext

	text "Nur Mitarbeiter"
	line "dürfen nach oben"
	cont "gehen."

	para "Der Strom fällt"
	line "aus, und der Chef"

	para "will für den"
	line "Notfall hohe"
	cont "Sicherheit."

	para "Das haben wir vor"
	line "drei Jahren"
	cont "gelernt."
	done

.OfficerScriptAfterPowerRestored
	jumpthisopenedtext

	text "Du hast die"
	line "Stromversorgung"
	cont "wieder"
	cont "hergestellt?"

	para "Danke! Jetzt kann"
	line "die Forschung"
	cont "weitergehen."

	para "Schau dich ruhig"
	line "oben um."
	done

SilphCoReceptionistText:
	text "Willkommen. Das"
	line "ist das BÜRO-"
	cont "GEBÄUDE der SILPH"
	cont "CO."
	done




SilphCo1FGentlemanText:
	text "Ich habe einen"
	line "Termin mit dem"

	para "Chefingenieur hier"
	line "in der SILPH CO."
	done

SilphCo1FCooltrainerfText:
	text "Ich versuche, den"
	line "Mut aufzubringen,"
	cont "die"

	para "Rezeptionistin"
	line "nach einem Date zu"
	cont "fragen."

	para "Sobald sie mit dem"
	line "Telefon fertig"
	cont "ist…"
	done

SilphCoElevatorText:
	text "Außer Betrieb"
	done
