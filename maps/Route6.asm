Route6_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 21,  9, ROUTE_6_UNDERGROUND_PATH_ENTRANCE, 1
	warp_event 10,  1, ROUTE_6_SAFFRON_GATE, 3

	def_coord_events

	def_bg_events
	bg_event 23, 11, BGEVENT_JUMPTEXT, Route6UndergroundPathSignText
	bg_event  7,  9, BGEVENT_JUMPTEXT, Route6AdvancedTipsSignText

	def_object_events
	object_event 21, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route6PokefanMText, EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	object_event 13, 24, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 0, GenericTrainerPokefanmRex, -1
	object_event 14, 24, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 0, GenericTrainerPokefanmAllan, -1
	object_event 16, 17, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerTwinsDayanddani1, -1
	object_event 17, 17, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerTwinsDayanddani2, -1
	object_event 20, 27, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerYoungsterChaz, -1
	object_event 12, 13, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerGuitaristfWanda, -1
	object_event 21, 19, SPRITE_OFFICER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 1, OfficerfJennyScript, -1
	fruittree_event 17,  5, FRUITTREE_ROUTE_6, STARF_BERRY, PAL_NPC_GREEN

GenericTrainerPokefanmRex:
	generictrainer POKEFANM, REX, EVENT_BEAT_POKEFANM_REX, PokefanmRexSeenText, PokefanmRexBeatenText

	; GSC-DE Dump 7172
	text "Sieh, wie grazil"
	line "sich mein PHANPY"
	cont "bewegt!"

	para "Es ist so süß,"
	line "dass dein Herz"
	cont "dahinschmilzt."
	done
PokefanmRexSeenText:
	; GSC-DE Dump 7170
	text "Mein PHANPY ist"
	line "das niedlichste"
	cont "der ganzen Welt."
	done






PokefanmRexBeatenText:
	; GSC-DE Dump 7171
	text "Mein PHANPY!"
	done






GenericTrainerPokefanmAllan:
	generictrainer POKEFANM, ALLAN, EVENT_BEAT_POKEFANM_ALLAN, PokefanmAllanSeenText, PokefanmAllanBeatenText

	; GSC-DE Dump 7175
	text "Sieh, wie grazil"
	line "sich mein"
	cont "TEDDIURSA bewegt!"

	para "Es ist so süß,"
	line "dass dein Herz"
	cont "dahinschmilzt."
	done
PokefanmAllanSeenText:
	; GSC-DE Dump 7173
	text "Mein TEDDIURSA ist"
	line "das niedlichste"
	cont "der ganzen Welt."
	done






PokefanmAllanBeatenText:
	; GSC-DE Dump 7174
	text "Mein TEDDIURSA!"
	done






GenericTrainerTwinsDayanddani1:
	generictrainer TWINS, DAYANDDANI1, EVENT_BEAT_TWINS_DAY_AND_DANI, TwinsDayanddani1SeenText, TwinsDayanddani1BeatenText

	text "DAY: Du hast uns"
	line "geschlagen…"
	done

TwinsDayanddani1SeenText:
	text "DAY: Willst du uns"
	line "besiegen?"
	done

TwinsDayanddani1BeatenText:
	text "DAY: Waaah!"
	done

GenericTrainerTwinsDayanddani2:
	generictrainer TWINS, DAYANDDANI2, EVENT_BEAT_TWINS_DAY_AND_DANI, TwinsDayanddani2SeenText, TwinsDayanddani2BeatenText

	text "DANI: Wir wurden"
	line "abgeschlagen."
	done

TwinsDayanddani2SeenText:
	text "DANI: Wir hauen"
	line "dich um!"
	done

TwinsDayanddani2BeatenText:
	text "DANI: Eeeeh!"
	done

GenericTrainerYoungsterChaz:
	generictrainer YOUNGSTER, CHAZ, EVENT_BEAT_YOUNGSTER_CHAZ, .SeenText, .BeatenText

	text "Ich und mein"
	line "großes Maul…"
	done

.SeenText:
	text "Seh ich da einen"
	line "starken Trainer?"

	para "Nö, hier ist nur"
	line "Müll!"
	done

.BeatenText:
	text "Der Müll war ich…"
	done

GenericTrainerGuitaristfWanda:
	generictrainer GUITARISTF, WANDA, EVENT_BEAT_GUITARISTF_WANDA, .SeenText, .BeatenText

	text "Geh einfach"
	line "weiter…"
	done

.SeenText:
	text "Du solltest lieber"
	line "rennen!"
	done

.BeatenText:
	text "Der Kampf ist"
	line "verloren…"
	done

OfficerfJennyScript:
	checktime 1 << NITE
	iffalse_jumptextfaceplayer .DaytimeText
	checkevent EVENT_BEAT_OFFICERF_JENNY
	iftrue_jumptextfaceplayer .AfterText
	faceplayer
	opentext
	special SaveMusic
	playmusic MUSIC_OFFICER_ENCOUNTER
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	loadtrainer OFFICERF, JENNY
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_OFFICERF_JENNY
	endtext

.DaytimeText:
	text "Wir Polizisten"
	line "wahren hier den"
	cont "Frieden."
	done

.SeenText:
	text "Du siehst mir"
	line "unbekannt aus."

	para "Schiggy-Trupp,"
	line "angreifen!"
	done

.BeatenText:
	text "Schiggy-Trupp,"
	line "zurückziehen…"
	done

.AfterText:
	text "Tut mir leid, dich"
	line "zu stören."
	para "Nachts werde ich"
	line "leicht nervös."
	done

Route6PokefanMText:
	; GSC-DE Dump 7176
	text "Die Straße zum"
	line "KRAFTWERK bleibt"

	para "gesperrt, bis das"
	line "Problem gelöst"
	cont "wurde."
	done






Route6UndergroundPathSignText:
	; GSC-DE Dump 7177
	text "TUNNELPFAD"

	para "AZURIA CITY -"
	line "ORANIA CITY"
	done






Route6AdvancedTipsSignText:
	text "Profi-Tipps!"

	para "Manche Items"
	line "wirken schädlich"
	cont "für den Träger,"

	para "wie ein Eisenball"
	line "oder ein"
	cont "Wahl-Schal."

	para "Aber mit der"
	line "Attacke Trick"

	para "kann der Träger"
	line "sein Item mit dem"
	cont "des Gegners"
	cont "tauschen!"
	done
