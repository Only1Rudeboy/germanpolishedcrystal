FastShipB1F_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_FASTSHIPB1F_SAILOR_BLOCKS
	scene_const SCENE_FASTSHIPB1F_NOOP

	def_callbacks

	def_warp_events
	warp_event  1,  9, FAST_SHIP_1F, 11
	warp_event 27, 11, FAST_SHIP_1F, 12

	def_coord_events
	coord_event 26,  5, SCENE_FASTSHIPB1F_SAILOR_BLOCKS, FastShipB1FSailorBlocksLeft
	coord_event 27,  5, SCENE_FASTSHIPB1F_SAILOR_BLOCKS, FastShipB1FSailorBlocksRight

	def_bg_events

	def_object_events
	object_event 26,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, FastShipB1FSailorScript, EVENT_FAST_SHIP_B1F_SAILOR_LEFT
	object_event 27,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, FastShipB1FSailorScript, EVENT_FAST_SHIP_B1F_SAILOR_RIGHT
	object_event  5,  9, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSailorJeff, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  2,  2, SPRITE_PICNICKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerPicnickerDebra, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event 22,  7, SPRITE_JUGGLER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerJugglerFritz, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event 10, 11, SPRITE_BAKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerBakerSharyn, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event 13,  2, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_DARK_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSailorGarrett, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event 21,  6, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerFisherJonah, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event 11,  9, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBlackbeltWai, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event 19,  2, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSailorKenneth, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  5,  9, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerTeacherShirley, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event 10,  7, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSchoolboyNate, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event 10,  9, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSchoolboyRicky, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND

	object_const_def
	const FASTSHIPB1F_SAILOR1
	const FASTSHIPB1F_SAILOR2

FastShipB1FSailorBlocksLeft:
	checkevent EVENT_FAST_SHIP_B1F_SAILOR_RIGHT
	iftruefwd FastShipB1FAlreadyBlocked
	applymovement FASTSHIPB1F_SAILOR2, FastShipB1FSailorBlocksLeftMovement
	moveobject FASTSHIPB1F_SAILOR1, 26, 4
	appear FASTSHIPB1F_SAILOR1
	pause 5
	disappear FASTSHIPB1F_SAILOR2
	end

FastShipB1FSailorBlocksRight:
	checkevent EVENT_FAST_SHIP_B1F_SAILOR_LEFT
	iftruefwd FastShipB1FAlreadyBlocked
	applymovement FASTSHIPB1F_SAILOR1, FastShipB1FSailorBlocksRightMovement
	moveobject FASTSHIPB1F_SAILOR2, 27, 4
	appear FASTSHIPB1F_SAILOR2
	pause 5
	disappear FASTSHIPB1F_SAILOR1
FastShipB1FAlreadyBlocked:
	end






FastShipB1FSailorScript:
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftrue_jumptextfaceplayer FastShipB1FOnDutySailorDirectionsText
	faceplayer
	opentext
	checkevent EVENT_FAST_SHIP_LAZY_SAILOR
	iftruefwd .LazySailor
	checkevent EVENT_FAST_SHIP_INFORMED_ABOUT_LAZY_SAILOR
	iftrue_jumpopenedtext FastShipB1FOnDutySailorRefusedText
	setevent EVENT_FAST_SHIP_INFORMED_ABOUT_LAZY_SAILOR
	clearevent EVENT_FAST_SHIP_CABINS_NNW_NNE_NE_SAILOR
	jumpthisopenedtext

	text "Hey, du da."
	line "Könntest du meinen"
	cont "Kumpel suchen?"
	para "Er treibt sich"
	line "irgendwo rum,"
	cont "dieser faule Sack!"
	para "Ich würde ihn gern"
	line "suchen, aber ich"
	cont "hab Dienst."
	done

.LazySailor:
	writetext FastShipB1FOnDutySailorThanksText
	checkevent EVENT_FAST_SHIP_FOUND_GIRL
	iffalsefwd .NotFoundGirl
	waitendtext

.NotFoundGirl:
	promptbutton
	jumpthisopenedtext

	text "Ein kleines"
	line "Mädchen?"

	para "Ich glaube, sie"
	line "ist hier"
	cont "vorbeigekommen."
	done
GenericTrainerSailorJeff:
	generictrainer SAILOR, JEFF, EVENT_BEAT_SAILOR_JEFF, SailorJeffSeenText, SailorJeffBeatenText

	text "Ich denke, ich"
	line "werde nie"
	cont "gewinnen, wenn ich"
	cont "die Sache nicht"
	cont "ernst nehme."
	done
GenericTrainerPicnickerDebra:
	generictrainer PICNICKER, DEBRA, EVENT_BEAT_PICNICKER_DEBRA, PicnickerDebraSeenText, PicnickerDebraBeatenText

	text "SAFFRONIA,"
	line "PRISMANIA… Ich"
	cont "habe gehört,"

	para "es gibt viele"
	line "große Städte in"
	cont "KANTO."
	done
GenericTrainerJugglerFritz:
	generictrainer JUGGLER, FRITZ, EVENT_BEAT_JUGGLER_FRITZ, JugglerFritzSeenText, JugglerFritzBeatenText

	text "Ich reise nie mehr"
	line "mit dem"
	para "Schiff. Das"
	line "nächste Mal nehme"
	cont "ich den MAGNETZUG."
	done
GenericTrainerBakerSharyn:
	generictrainer BAKER, SHARYN, EVENT_BEAT_BAKER_SHARYN, BakerSharynSeenText, BakerSharynBeatenText

	text "Ich bin vielleicht"
	line "nicht der beste im"
	para "Kampf, aber die"
	line "Leute lieben mein"
	cont "Gebäck."
	done

TrainerSailorGarrett:
	trainer SAILOR, GARRETT, EVENT_BEAT_SAILOR_GARRETT, SailorGarrettSeenText, SailorGarrettBeatenText, 0, .Script, TRAINERPAL_DARK_SAILOR



.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "Wir bringen unsere"
	line "Passagiere von"
	para "ORANIA CITY nach"
	line "OLIVIANA CITY."
	done
GenericTrainerFisherJonah:
	generictrainer FISHER, JONAH, EVENT_BEAT_FISHER_JONAH, FisherJonahSeenText, FisherJonahBeatenText

	text "Ich werde am Kai"
	line "von ORANIA angeln."
	done
GenericTrainerBlackbeltWai:
	generictrainer BLACKBELT_T, WAI, EVENT_BEAT_BLACKBELT_WAI, BlackbeltWaiSeenText, BlackbeltWaiBeatenText

	text "Ich konnte den"
	line "KARATE-MEISTER in"
	cont "JOHTO nicht"
	cont "finden."

	para "Er soll irgendwo"
	line "in einer Höhle"
	cont "trainieren."
	done
GenericTrainerSailorKenneth:
	generictrainer SAILOR, KENNETH, EVENT_BEAT_SAILOR_KENNETH, SailorKennethSeenText, SailorKennethBeatenText

	text "Acht ORDEN! Das"
	line "heißt, du"
	para "hast die"
	line "ARENA-LEITER"
	cont "besiegt."
	para "Kein Wunder, dass"
	line "du so stark bist!"
	done
GenericTrainerTeacherShirley:
	generictrainer TEACHER_F, SHIRLEY, EVENT_BEAT_TEACHER_SHIRLEY, TeacherShirleySeenText, TeacherShirleyBeatenText

	text "Wir machen einen"
	line "Ausflug zu den"
	cont "RUINEN bei VIOLA"
	cont "CITY."
	done
GenericTrainerSchoolboyNate:
	generictrainer SCHOOLBOY, NATE, EVENT_BEAT_SCHOOLBOY_NATE, SchoolboyNateSeenText, SchoolboyNateBeatenText

	text "In den RUINEN"
	line "empfängt das Radio"
	cont "seltsame Signale."
	done
GenericTrainerSchoolboyRicky:
	generictrainer SCHOOLBOY, RICKY, EVENT_BEAT_SCHOOLBOY_RICKY, SchoolboyRickySeenText, SchoolboyRickyBeatenText

	text "Im #mon Journal"
	line "stand, dass es in"

	para "den RUINEN vier"
	line "solcher"
	cont "Steintafeln gibt."
	done

FastShipB1FSailorBlocksRightMovement:
	fix_facing
	run_step_right
	remove_fixed_facing
	turn_head_down
	step_end

FastShipB1FSailorBlocksLeftMovement:
	fix_facing
	run_step_left
	remove_fixed_facing
	turn_head_down
	step_end


FastShipB1FOnDutySailorRefusedText:
	text "Ach, ach…"

	para "Der KAPITÄN wird"
	line "wütend sein…"
	done





FastShipB1FOnDutySailorThanksText:
	text "Danke! Ich habe"
	line "mit ihm"

	para "geredet, er wird"
	line "nicht mehr"
	cont "faulenzen!"
	done





FastShipB1FOnDutySailorDirectionsText:
	text "Der Speisesaal ist"
	line "geradeaus."
	para "Die Treppen am"
	line "Ende führen in die"
	cont "KAPITÄNS-KAJÜTE."
	done





SailorJeffSeenText:
	text "In den Pausen ist"
	line "Kämpfen meine"
	cont "Lieblingsbeschäft-"
	cont "igung."
	done





SailorJeffBeatenText:
	text "Sieg oder"
	line "Niederlage, meine"
	cont "Pause ist vorüber!"
	done





PicnickerDebraSeenText:
	text "Mir ist"
	line "langweilig. Willst"
	cont "du kämpfen?"
	done





PicnickerDebraBeatenText:
	text "Au! Du bist zu"
	line "stark!"
	done





JugglerFritzSeenText:
	text "Uff… Ich bin"
	line "seekrank!"
	done





JugglerFritzBeatenText:
	text "Ich kann mich"
	line "nicht bewegen…"
	done





BakerSharynSeenText:
	text "Während ich Brot"
	line "backe, backe ich"

	para "auch deine"
	line "#mon!"
	done

BakerSharynBeatenText:
	text "Zumindest ist mein"
	line "Brot ein Sieger."
	done

SailorGarrettSeenText:
	text "Hier arbeiten wir"
	line "Matrosen!"
	done





SailorGarrettBeatenText:
	text "Ich habe auf"
	line "eigenem Terrain"
	cont "verloren…"
	done





FisherJonahSeenText:
	text "Auch wenn wir mit"
	line "dem Schiff fahren,"
	cont "kann ich nicht"
	cont "angeln!"
	para "Wie langweilig!"
	line "Lass uns kämpfen!"
	done





FisherJonahBeatenText:
	text "M-mir ist nicht"
	line "mehr langweilig…"
	done





BlackbeltWaiSeenText:
	text "Ich trainiere"
	line "meine Beine, indem"
	para "ich das Schaukeln"
	line "des Schiffes"
	cont "ausgleiche!"
	done





BlackbeltWaiBeatenText:
	text "Gestürzt und platt"
	line "gemacht!"
	done





SailorKennethSeenText:
	text "Ich bin Matrose!"
	para "Aber ich trainiere"
	line "#mon, um der"
	cont "CHAMP zu werden!"
	done





SailorKennethBeatenText:
	text "Mein"
	line "Trainingsrückstand"
	cont "ist"
	cont "offensichtlich…"
	done





TeacherShirleySeenText:
	text "Lass die Finger"
	line "von meinen"
	cont "Schülern!"
	done





TeacherShirleyBeatenText:
	text "Ah!"
	done





SchoolboyNateSeenText:
	text "Kennst du die"
	line "ALPH-RUINEN?"
	done





SchoolboyNateBeatenText:
	text "Ah!"
	done





SchoolboyRickySeenText:
	text "In den ALPH-RUINEN"
	line "gibt es seltsame"
	cont "Steinplatten."
	done





SchoolboyRickyBeatenText:
	text "Ich wurde"
	line "vermöbelt!"
	done





