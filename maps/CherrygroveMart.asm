CherrygroveMart_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, CHERRYGROVE_CITY, 1
	warp_event  3,  7, CHERRYGROVE_CITY, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygroveMartClerkScript, -1
	object_event  7,  6, SPRITE_COOL_DUDE, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygroveMartCooltrainerMScript, -1
	object_event  2,  5, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CherrygroveMartYoungsterText, -1

CherrygroveMartClerkScript:
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftruefwd .AfterDex
	pokemart MARTTYPE_STANDARD, MART_CHERRYGROVE

.AfterDex:
	pokemart MARTTYPE_STANDARD, MART_CHERRYGROVE_DEX

CherrygroveMartCooltrainerMScript:
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue_jumptextfaceplayer CherrygroveMartCooltrainerMText_PokeBallsInStock
	jumpthistextfaceplayer

	text "Die # Bälle"
	line "sind gerade"
	cont "ausverkauft!"

	para "Wann bekommen sie"
	line "wohl neue?"
	done

CherrygroveMartCooltrainerMText_PokeBallsInStock:
	text "#BÄLLE sind"
	line "wieder auf Lager!"
	cont "Jetzt kann ich"
	cont "#mon fangen!"
	done


CherrygroveMartYoungsterText:
	text "Als ich durch das"
	line "Gras spazierte,"

	para "hat ein Käfer-"
	line "#mon mein"

	para "#mon vergiftet!"

	para "Ich ging einfach"
	line "weiter, aber dann"
	cont "wurde mein #mon"
	cont "plötzlich besiegt."

	para "Du solltest stän-"
	line "dig ein GEGENGIFT"
	cont "mit dir führen."
	done


