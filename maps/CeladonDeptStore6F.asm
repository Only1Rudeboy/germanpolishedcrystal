CeladonDeptStore6F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 15,  0, CELADON_DEPT_STORE_5F, 2
	warp_event  2,  0, CELADON_DEPT_STORE_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event 14,  0, BGEVENT_JUMPTEXT, CeladonDeptStore6FDirectoryText

	def_object_events
	object_event  9,  2, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonDeptStore6FSuperNerdText, -1
	object_event 12,  5, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WANDER, 1, 2, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonDeptStore6FYoungsterText, -1
	object_event  5,  1, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore3FGameboyKid1Script, -1
	object_event  6,  1, SPRITE_GAMER_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore3FGameboyKid2Script, -1

CeladonDeptStore3FGameboyKid1Script:
	showtextfaceplayer CeladonDeptStore3FGameboyKid1Text
	turnobject LAST_TALKED, DOWN
	end

CeladonDeptStore3FGameboyKid2Script:
	showtextfaceplayer CeladonDeptStore3FGameboyKid2Text
	turnobject LAST_TALKED, DOWN
	end

CeladonDeptStore6FSuperNerdText:
	; GSC-DE Dump
	text "Ein Spielautomat"
	line "mit einem"
	cont "Roulette…"
	para "Die gibt es schon"
	line "lange nicht mehr."
	done

CeladonDeptStore6FYoungsterText:
	; GSC-DE Dump
	text "Aww! Hier gibt es"
	line "keine Spiele!"
	para "Ich wollte doch"
	line "spielen…"
	done

CeladonDeptStore3FGameboyKid1Text:
	; GSC-DE Dump
	text "Oh, oh! Ich habe"
	line "mein #MON"
	para "getauscht, ohne"
	line "ihm UP-GRADE"
	cont "wegzunehmen."
	done

CeladonDeptStore3FGameboyKid2Text:
	; GSC-DE Dump
	text "Ja! Endlich"
	line "habe ich mein"
	cont "PORYGON!"
	para "Ich bin nicht sehr"
	line "gut an den Spiel-"
	cont "automaten. Deswe-"
	cont "gen habe ich nie"
	cont "genügend Münzen…"
	para "…Was?"
	para "Das getauschte"
	line "PORYGON hat sich"
	cont "in ein anderes"
	cont "#MON"
	cont "verwandelt!"
	done

CeladonDeptStore6FDirectoryText:
	; GSC-DE Dump (PC 6F)
	text "6F: DACHTERRASSE"
	line "SPIELAUTOMATEN"
	done
