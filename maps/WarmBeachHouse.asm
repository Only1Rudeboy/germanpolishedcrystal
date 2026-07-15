WarmBeachHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, WARM_BEACH, 3
	warp_event  3,  7, WARM_BEACH, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, WarmBeachHouseGrampsText, -1
	object_event  5,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, WarmBeachHouseGrannyText, -1
	object_event  3,  3, SPRITE_BOOK_PAPER_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, WarmBeachHouseBookScript, -1

WarmBeachHouseGrampsText:
	text "Die Shamouti-"
	line "Prophezeiung ist"
	cont "uralt."

	para "Jeder auf der"
	line "Insel kennt sie."
	done

WarmBeachHouseGrannyText:
	text "Wenn Feuer, Eis"
	line "und Blitz"
	para "nicht im"
	line "Gleichgewicht"
	cont "sind,"
	para "kann die Welt"
	line "untergehen…"
	done

WarmBeachHouseBookScript:
	opentext
	writetext .Text0
	yesorno
	iffalse_endtext
	writetext .Text1
	yesorno
	iffalse_endtext
	writetext .Text2
	yesorno
	iffalse_endtext
	jumpthisopenedtext

	text "Von den drei"
	line "Inseln nimm die"
	cont "uralten Sphären."
	para "Denn zwischen"
	line "Leben und Tod"
	cont "wirst du"
	para "den Unterschied"
	line "machen."
	para "Steig zum Schrein,"
	line "um das Falsche zu"
	cont "richten,"
	para "und die Welt wird"
	line "durch das Lied des"
	cont "Wächters geheilt …"
	done

.Text0:
	text "Die Shamouti-"
	line "Prophezeiung"

	para "Willst du sie"
	line "lesen?"
	done

.Text1:
	text "Stört nicht das"
	line "Gleichgewicht von"
	cont "Feuer, Eis oder"
	cont "Blitz,"
	para "sonst bringen"
	line "diese Titanen"
	cont "Zerstörung über"
	cont "die Welt, in der"
	cont "sie"
	cont "aufeinandertreffe-"
	cont "n."
	para "Obwohl der große"
	line "Wächter des"
	cont "Wassers erstehen"
	cont "wird, um"
	para "den Kampf zu"
	line "beenden, wird sein"
	cont "Lied allein"
	para "scheitern, und so"
	line "wird die Erde zu"
	cont "Asche werden."
	para "Weiterlesen?"
	done

.Text2:
	text "O Auserwählter,"
	line "vereine alle drei"
	cont "in deinen Händen."

	para "Ihre vereinten"
	line "Schätze bändigen"
	cont "das Ungeheuer des"
	cont "Meeres."

	para "Weiterlesen?"
	done
