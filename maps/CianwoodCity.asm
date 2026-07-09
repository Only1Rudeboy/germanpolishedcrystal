CianwoodCity_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_CIANWOODCITY_NOOP
	scene_const SCENE_CIANWOODCITY_SUICUNE_AND_EUSINE

	def_callbacks
	callback MAPCALLBACK_NEWMAP, CianwoodCityFlyPointAndSuicune

	def_warp_events
	warp_event 17, 41, MANIAS_HOUSE, 1
	warp_event  8, 43, CIANWOOD_GYM, 1
	warp_event 23, 43, CIANWOOD_POKECENTER_1F, 1
	warp_event 15, 47, CIANWOOD_PHARMACY, 1
	warp_event  9, 31, CIANWOOD_CITY_PHOTO_STUDIO, 1
	warp_event 15, 37, CIANWOOD_LUGIA_SPEECH_HOUSE, 1
	warp_event  5, 17, MOVE_MANIACS_HOUSE, 1
	warp_event  4, 25, CLIFF_EDGE_GATE, 1

	def_coord_events
	coord_event 11, 16, SCENE_CIANWOODCITY_SUICUNE_AND_EUSINE, CianwoodCitySuicuneAndEusine

	def_bg_events
	bg_event 20, 34, BGEVENT_JUMPTEXT, CianwoodCitySignText
	bg_event  6, 44, BGEVENT_JUMPTEXT, CianwoodGymSignText
	bg_event 19, 47, BGEVENT_JUMPTEXT, CianwoodPharmacySignText
	bg_event  8, 32, BGEVENT_JUMPTEXT, CianwoodPhotoStudioSignText
	bg_event  6, 26, BGEVENT_JUMPTEXT, CianwoodCliffEdgeGateSignText
	bg_event  8, 22, BGEVENT_JUMPTEXT, CianwoodMoveManiacSignText
	bg_event 16, 31, BGEVENT_JUMPTEXT, CianwoodAdvancedTipsSignText
	bg_event  4, 19, BGEVENT_ITEM + REVIVE, EVENT_CIANWOOD_CITY_HIDDEN_REVIVE
	bg_event  5, 29, BGEVENT_ITEM + MAX_ETHER, EVENT_CIANWOOD_CITY_HIDDEN_MAX_ETHER

	def_object_events
	object_event 11, 21, SPRITE_EUSINE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_CIANWOOD_CITY_EUSINE
	pokemon_event 10, 14, SUICUNE, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BLUE, ClearText, EVENT_SAW_SUICUNE_AT_CIANWOOD_CITY
	object_event 21, 37, SPRITE_CAMPER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CianwoodCityYoungsterText, -1
	object_event 16, 33, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CianwoodCityPokefanMText, -1
	object_event 14, 42, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CianwoodCityLassText, -1
	smashrock_event  8, 16
	smashrock_event  9, 17
	smashrock_event  6, 24
	smashrock_event  4, 29
	smashrock_event 10, 27
	smashrock_event  4, 19
	object_event 10, 46, SPRITE_MATRON, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CianwoodCityChucksWife, -1
	object_event  4, 26, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CianwoodCityRocketText, EVENT_BEAT_CHUCK
	object_event  9, 25, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CianwoodCitySailorText, -1
	object_event 22, 32, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CianwoodCityFisherText, -1

	object_const_def
	const CIANWOODCITY_EUSINE
	const CIANWOODCITY_SUICUNE

CianwoodCityFlyPointAndSuicune:
	setflag ENGINE_FLYPOINT_CIANWOOD
	setevent EVENT_EUSINE_IN_BURNED_TOWER
	checkevent EVENT_BEAT_EUSINE
	iffalsefwd .Done
	disappear CIANWOODCITY_EUSINE
.Done:
	endcallback

CianwoodCitySuicuneAndEusine:
	turnobject PLAYER, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	pause 15
	playsound SFX_WARP_FROM
	applymovement CIANWOODCITY_SUICUNE, CianwoodCitySuicuneApproachMovement
	turnobject PLAYER, DOWN
	pause 15
	playsound SFX_WARP_FROM
	applymovement CIANWOODCITY_SUICUNE, CianwoodCitySuicuneDepartMovement
	disappear CIANWOODCITY_SUICUNE
	pause 10
	setscene SCENE_CIANWOODCITY_NOOP
	clearevent EVENT_SAW_SUICUNE_ON_ROUTE_42
	checkevent EVENT_GOT_HM05_WHIRLPOOL
	iftruefwd .NoLyra
	setmapscene ROUTE_42, SCENE_ROUTE42_LYRA
	sjumpfwd .Continue
.NoLyra
	setmapscene ROUTE_42, SCENE_ROUTE42_SUICUNE
.Continue
	checkevent EVENT_BEAT_EUSINE
	iftrue DoNothingScript
	setevent EVENT_BEAT_EUSINE
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
	appear CIANWOODCITY_EUSINE
	applymovement CIANWOODCITY_EUSINE, CianwoodCityEusineApproachMovement
	showtext EusineSuicuneText
	winlosstext EusineBeatenText, EusineLossText
	setlasttalked CIANWOODCITY_EUSINE
	loadtrainer MYSTICALMAN, EUSINE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	special DeleteSavedMusic
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
	showtext EusineAfterText
	applymovement CIANWOODCITY_EUSINE, CianwoodCityEusineDepartMovement
	disappear CIANWOODCITY_EUSINE
	pause 20
	special Special_FadeOutMusic
	playmapmusic
	pause 10
	end

CianwoodCityChucksWife:
	checkevent EVENT_BEAT_CHUCK
	iftrue_jumptextfaceplayer ChucksWifeChubbyText
	jumpthistextfaceplayer

	text "Du bist übers"
	line "Meer gekommen,"
	cont "um herzu-"
	cont "kommen?"

	para "Das muss hart"
	line "gewesen sein."

	para "Es wäre viel"
	line "einfacher, wenn"

	para "dein #mon"
	line "Fliegen"
	cont "könnte…"
	done

CianwoodCitySuicuneApproachMovement:
	fix_facing
	fast_jump_step_down
	fast_jump_step_down
	fast_jump_step_right
	step_end

CianwoodCitySuicuneDepartMovement:
	fix_facing
	fast_jump_step_right
	fast_jump_step_up
	fast_jump_step_right
	fast_jump_step_right
	step_end

CianwoodCityEusineApproachMovement:
	step_up
	step_up
	step_up
	step_up
	step_end

CianwoodCityEusineDepartMovement:
	step_down
	step_down
	step_down
	step_down
	step_end


ChucksWifeChubbyText:
	text "Mein Mann hat ge-"
	line "gen dich"
	cont "verloren."
	cont "Also muss er här-"
	cont "ter trainieren."

	para "Das ist auch gut"
	line "so. Er hat in"
	cont "letzter Zeit"
	cont "etwas"
	cont "Speck angesetzt."
	done



CianwoodCityYoungsterText:
	text "Setzt du FLIEGEN"
	line "ein, kannst du"
	cont "di-"
	cont "rekt von hier aus"
	cont "nach OLIVIANA"
	cont "CITY"
	cont "reisen."
	done



CianwoodCityPokefanMText:
	text "Die Felsen nörd-"
	line "lich der Stadt"
	cont "können zerschmet-"
	cont "tert werden."

	para "Vielleicht"
	line "findest"
	line "du etwas unter"
	cont "ihnen."

	para "Deine #mon"
	line "können ZERTRÜMME-"
	cont "RER einsetzen, um"
	cont "sie aus dem Weg"
	cont "zu"
	cont "räumen."
	done



CianwoodCityLassText:
	text "HARTWIG, der ARE-"
	line "NALEITER steigt"

	para "gerne mit seinen"
	line "#mon in den"
	cont "Ring."
	done



CianwoodCityRocketText:
	text "Hier ist der Weg"
	line "gesperrt!"

	para "Warum? Kümmere"
	line "dich um deine"
	cont "eigenen Sachen!"
	done

CianwoodCitySailorText:
	text "Diese Höhle ist"
	line "der einzige Weg"
	cont "zur ROUTE 47."
	done

CianwoodCityFisherText:
	text "Die APOTHEKE von"
	line "ANEMONIA CITY"

	para "ist seit über"
	line "500 Jahren im"

	para "Geschäft. Das"
	line "muss ein Rekord"
	cont "sein,"
	cont "oder?"
	done

EusineSuicuneText:
	text "EUSIN: Yo,"
	line "<PLAYER>."

	para "War das eben"
	line "nicht"
	line "SUICUNE?"

	para "Ich habe nur"
	line "einen"
	line "Blick riskiert,"

	para "aber ich dachte,"
	line "ich hätte SUICUNE"

	para "auf den Wellen"
	line "rennen sehen."

	para "SUICUNE ist schön"
	line "und fabelhaft."

	para "Und es rennt"
	line "durch"
	line "Städte und"
	cont "Straßen"

	para "mit wahnsinniger"
	line "Geschwindigkeit."

	para "Es ist"
	line "wundervoll…"

	para "Ich möchte"
	line "SUICUNE"
	line "von nahem sehen…"

	para "Ich habe mich"
	line "entschieden."

	para "Ich kämpfe wie"
	line "ein"
	line "Trainer, um mir"

	para "SUICUNEs Respekt"
	line "zu verdienen!"

	para "Auf, <PLAYER>."
	line "Lass uns kämpfen!"
	done



EusineBeatenText:
	text "Ich hasse es, das"
	line "zuzugeben, aber"
	cont "du"
	cont "hast gewonnen."
	done



EusineLossText:
	text "Ja!"

	para "Suicune wird"
	line "meine Größe jetzt"
	cont "erkennen!"
	done

EusineAfterText:
	text "Du bist Wahnsinn,"
	line "<PLAYER>!"

	para "Darum sind dir"
	line "#mon so"
	cont "zugetan."

	para "Jetzt weiß ich's."

	para "Ich werde weiter"
	line "nach SUICUNE"
	cont "suchen."

	para "Ich bin sicher,"
	line "dass ich ihm"
	cont "eines"
	cont "Tages begegne."

	para "Man sieht sich!"
	done



CianwoodCitySignText:
	text "ANEMONIA CITY"

	para "Eine Hafenstadt"
	line "Umgeben von Stür-"
	cont "mischer See"
	done



CianwoodGymSignText:
	text "#mon-ARENA von"
	line "ANEMONIA CITY"

	para "LEITUNG: HARTWIG"
	line "Er spricht durch"

	para "seine Fäuste"
	done



CianwoodPharmacySignText:
	text "500 Jahre voller"
	line "Tradition."

	para "APOTHEKE von"
	line "ANEMONIA CITY"

	para "Gerne erwarten"
	line "wir"
	line "Ihre"
	cont "medizinischen"
	cont "Fragen"
	done



CianwoodPhotoStudioSignText:
	text "FOTOSTUDIO von"
	line "ANEMONIA CITY"

	para "Mach dir einen"
	line "Schnappschuss zur"
	cont "Erinnerung!"
	done



CianwoodCliffEdgeGateSignText:
	text "Steilklippen-Tor"

	para "Der Gelbe Wald"
	line "liegt direkt"
	cont "voraus!"
	done

CianwoodMoveManiacSignText:
	text "Attacken-Maniac"
	line "voraus"
	done

CianwoodAdvancedTipsSignText:
	text "Profi-Tipps!"

	para "Du kannst einen"
	line "#-Ball auf ein"

	para "gefangenes #mon"
	line "anwenden, um"
	cont "seinen Ball zu"
	cont "ändern!"

	para "Doch du bekommst"
	line "den ursprüng-"
	cont "lichen #-Ball"
	cont "nicht zurück!"
	done
