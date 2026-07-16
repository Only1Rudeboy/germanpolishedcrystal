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

	; GSC-DE Dump
	text "Heh, könntest"
	line "du mal nach meinem"
	cont "Kollegen suchen?"

	para "Er faulenzt"
	line "irgendwo. Dieser"
	cont "Müßiggänger!"

	para "Ich würde ihn"
	line "selbst suchen,"
	cont "aber ich bin"
	cont "gerade im Dienst."
	done

.LazySailor:
	writetext FastShipB1FOnDutySailorThanksText
	checkevent EVENT_FAST_SHIP_FOUND_GIRL
	iffalsefwd .NotFoundGirl
	waitendtext

.NotFoundGirl:
	promptbutton
	jumpthisopenedtext

	; GSC-DE Dump
	text "Ein kleines"
	line "Mädchen?"

	para "Ich glaube, sie"
	line "ist hier vorbei-"
	cont "gekommen."
	done

GenericTrainerSailorJeff:
	generictrainer SAILOR, JEFF, EVENT_BEAT_SAILOR_JEFF, SailorJeffSeenText, SailorJeffBeatenText

	; GSC-DE Dump
	text "Ich denke, ich"
	line "werde nie"
	cont "gewinnen, wenn ich"
	cont "die Sache nicht"
	cont "ernst nehme."
	done

GenericTrainerPicnickerDebra:
	generictrainer PICNICKER, DEBRA, EVENT_BEAT_PICNICKER_DEBRA, PicnickerDebraSeenText, PicnickerDebraBeatenText

	; GSC-DE Dump
	text "SAFFRONIA,"
	line "PRISMANIA…"
	cont "Ich habe gehört,"

	para "es gibt viele"
	line "große Städte"
	cont "in KANTO."
	done

GenericTrainerJugglerFritz:
	generictrainer JUGGLER, FRITZ, EVENT_BEAT_JUGGLER_FRITZ, JugglerFritzSeenText, JugglerFritzBeatenText

	; GSC-DE Dump
	text "Ich reise nie"
	line "mehr mit dem"

	para "Schiff. Das"
	line "nächste Mal nehme"
	cont "ich den MAGNETZUG."
	done

GenericTrainerBakerSharyn:
	generictrainer BAKER, SHARYN, EVENT_BEAT_BAKER_SHARYN, BakerSharynSeenText, BakerSharynBeatenText

	; PC-only
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

	; GSC-DE Dump
	text "Wir bringen unsere"
	line "Passagiere von"

	para "ORANIA CITY nach"
	line "OLIVIANA CITY."
	done

GenericTrainerFisherJonah:
	generictrainer FISHER, JONAH, EVENT_BEAT_FISHER_JONAH, FisherJonahSeenText, FisherJonahBeatenText

	; GSC-DE Dump
	text "Ich werde am Kai"
	line "von ORANIA angeln."
	done

GenericTrainerBlackbeltWai:
	generictrainer BLACKBELT_T, WAI, EVENT_BEAT_BLACKBELT_WAI, BlackbeltWaiSeenText, BlackbeltWaiBeatenText

	; GSC-DE Dump
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

	; GSC-DE Dump
	text "Acht ORDEN!"
	line "Das heißt, du"

	para "hast die ARENA-"
	line "LEITER besiegt."

	para "Kein Wunder, dass"
	line "du so stark bist!"
	done

GenericTrainerTeacherShirley:
	generictrainer TEACHER_F, SHIRLEY, EVENT_BEAT_TEACHER_SHIRLEY, TeacherShirleySeenText, TeacherShirleyBeatenText

	; GSC-DE Dump
	text "Wir machen einen"
	line "Ausflug zu den"
	cont "RUINEN bei"
	cont "VIOLA CITY."
	done

GenericTrainerSchoolboyNate:
	generictrainer SCHOOLBOY, NATE, EVENT_BEAT_SCHOOLBOY_NATE, SchoolboyNateSeenText, SchoolboyNateBeatenText

	; GSC-DE Dump
	text "In den RUINEN"
	line "empfängt das Radio"
	cont "seltsame Signale."
	done

GenericTrainerSchoolboyRicky:
	generictrainer SCHOOLBOY, RICKY, EVENT_BEAT_SCHOOLBOY_RICKY, SchoolboyRickySeenText, SchoolboyRickyBeatenText

	; GSC-DE Dump
	text "Ich habe gelesen,"
	line "dass es vier von"
	cont "den Steinplatten"
	cont "gibt."
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
	; GSC-DE Dump
	text "Oh, oh…"

	para "Der KAPITÄN"
	line "wird wütend sein…"
	done

FastShipB1FOnDutySailorThanksText:
	; GSC-DE Dump
	text "Danke!"
	line "Ich habe mit ihm"

	para "geredet, er wird"
	line "nicht mehr"
	cont "faulenzen!"
	done

FastShipB1FOnDutySailorDirectionsText:
	; GSC-DE Dump
	text "Der Speisesaal"
	line "ist geradeaus."

	para "Die Treppen am"
	line "Ende führen in"
	cont "die KAPITÄNS-"
	cont "KAJÜTE."
	done

SailorJeffSeenText:
	; GSC-DE Dump
	text "In den Pausen ist"
	line "Kämpfen meine"
	cont "Lieblingsbeschäf-"
	cont "tigung."
	done

SailorJeffBeatenText:
	; GSC-DE Dump
	text "Sieg oder"
	line "Niederlage, meine"
	cont "Pause ist vorüber!"
	done

PicnickerDebraSeenText:
	; GSC-DE Dump
	text "Mir ist lang-"
	line "weilig. Willst du"
	cont "kämpfen?"
	done

PicnickerDebraBeatenText:
	; GSC-DE Dump
	text "Au! Du bist zu"
	line "stark!"
	done

JugglerFritzSeenText:
	; GSC-DE Dump
	text "Uff…"
	line "Ich bin seekrank!"
	done

JugglerFritzBeatenText:
	; GSC-DE Dump
	text "Ich kann mich"
	line "nicht bewegen…"
	done

BakerSharynSeenText:
	; PC-only
	text "Während ich Brot"
	line "backe, backe ich"

	para "auch deine"
	line "#MON!"
	done

BakerSharynBeatenText:
	; PC-only
	text "Zumindest ist mein"
	line "Brot ein Sieger."
	done

SailorGarrettSeenText:
	; GSC-DE Dump
	text "Hier arbeiten wir"
	line "Matrosen!"
	done

SailorGarrettBeatenText:
	; GSC-DE Dump
	text "Ich habe auf"
	line "eigenem Terrain"
	cont "verloren…"
	done

FisherJonahSeenText:
	; GSC-DE Dump
	text "Auch wenn wir"
	line "mit dem Schiff"
	cont "fahren, kann ich"
	cont "nicht angeln!"

	para "Wie langweilig!"
	line "Lass uns kämpfen!"
	done

FisherJonahBeatenText:
	; GSC-DE Dump
	text "M-mir ist nicht"
	line "mehr langweilig…"
	done

BlackbeltWaiSeenText:
	; GSC-DE Dump
	text "Ich trainiere"
	line "meine Beine, indem"

	para "ich das Schaukeln"
	line "des Schiffes"
	cont "ausgleiche!"
	done

BlackbeltWaiBeatenText:
	; GSC-DE Dump
	text "Gestürzt und platt"
	line "gemacht!"
	done

SailorKennethSeenText:
	; GSC-DE Dump
	text "Ich bin Matrose!"

	para "Aber ich trainiere"
	line "#MON, um"
	cont "der CHAMP zu"
	cont "werden!"
	done

SailorKennethBeatenText:
	; GSC-DE Dump
	text "Mein Trainings-"
	line "rückstand ist"
	cont "offensichtlich…"
	done

TeacherShirleySeenText:
	; GSC-DE Dump
	text "Lass die Finger"
	line "von meinen"
	cont "Schülern!"
	done

TeacherShirleyBeatenText:
	; GSC-DE Dump
	text "Ah!"
	done

SchoolboyNateSeenText:
	; GSC-DE Dump
	text "Kennst du die"
	line "ALPH-RUINEN?"
	done

SchoolboyNateBeatenText:
	; GSC-DE Dump
	text "Ah!"
	done

SchoolboyRickySeenText:
	; GSC-DE Dump
	text "In den ALPH-RUINEN"
	line "gibt es seltsame"
	cont "Steinplatten."
	done

SchoolboyRickyBeatenText:
	; GSC-DE Dump
	text "Ich wurde"
	line "vermöbelt!"
	done
