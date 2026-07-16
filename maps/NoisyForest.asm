NoisyForest_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  6,  4, ROCKY_BEACH, 2
	warp_event  6,  5, ROCKY_BEACH, 3
	warp_event 35, 28, SHAMOUTI_SHRINE_RUINS, 1
	warp_event 35, 29, SHAMOUTI_SHRINE_RUINS, 2

	def_coord_events

	def_bg_events
	bg_event 15,  9, BGEVENT_JUMPTEXT, NoisyForestSignpostText
	bg_event 25, 31, BGEVENT_JUMPTEXT, NoisyForestSignpostText
	bg_event 32,  2, BGEVENT_ITEM + ULTRA_BALL, EVENT_NOISY_FOREST_HIDDEN_ULTRA_BALL
	bg_event 34, 18, BGEVENT_ITEM + TINYMUSHROOM, EVENT_NOISY_FOREST_HIDDEN_TINYMUSHROOM
	bg_event  7, 29, BGEVENT_ITEM + FULL_RESTORE, EVENT_NOISY_FOREST_HIDDEN_FULL_RESTORE

	def_object_events
	object_event 19, 36, SPRITE_AROMA_LADY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TOLD_ABOUT_PIKABLU
	object_event 24, 31, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, MARILL, -1, PAL_MON_BLUE, OBJECTTYPE_SCRIPT, NO_FORM, NoisyForestPikabluScript, EVENT_NOISY_FOREST_PIKABLU
	object_event 10, 15, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerBird_keeperTrent, -1
	object_event 20,  4, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBug_maniacPierre, -1
	object_event  4, 27, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBug_maniacDylan, -1
	object_event 31, 17, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerGuitaristfJaclyn, -1
	object_event 12, 30, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerGuitaristmEzekiel, -1
	object_event 20, 34, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerHikerLester, -1
	object_event 13,  6, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 0, (1 << MORN) | (1 << DAY), PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, NoisyForestTeacherText, -1
	object_event 40, 15, SPRITE_CHILD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, NoisyForestChildText, -1
	itemball_event 41,  2, BALMMUSHROOM, 1, EVENT_NOISY_FOREST_BALMMUSHROOM
	itemball_event 16, 28, MULCH, 1, EVENT_NOISY_FOREST_MULCH
	tmhmball_event 20, 20, TM_DRAIN_PUNCH, EVENT_NOISY_FOREST_TM_DRAIN_PUNCH
	cuttree_event 40, 12, EVENT_NOISY_FOREST_CUT_TREE_1
	cuttree_event 12, 21, EVENT_NOISY_FOREST_CUT_TREE_2

	object_const_def
	const NOISYFOREST_WILHOMENA
	const NOISYFOREST_PIKABLU

GenericTrainerBug_maniacPierre:
	generictrainer BUG_MANIAC, PIERRE, EVENT_BEAT_BUG_MANIAC_PIERRE, .SeenText, .BeatenText

	text "Bzzz… Bzzz…"

	para "Dieses Geräusch"
	line "hängt mir im Kopf"
	cont "fest…"
	done

.SeenText:
	text "Meine #MON"
	line "lieben diesen"
	cont "Wald."

	para "Hier summen sie"
	line "pausenlos!"
	done

.BeatenText:
	text "Bzzz! Verloren!"
	done

GenericTrainerBug_maniacDylan:
	generictrainer BUG_MANIAC, DYLAN, EVENT_BEAT_BUG_MANIAC_DYLAN, .SeenText, .BeatenText

	text "Es gibt etwas am"
	line "Summen dieses"

	para "Waldes, das Käfer"
	line "einfach lieben."
	done

.SeenText:
	text "So glücklich hab"
	line "ich meine Käfer"
	cont "noch nie gesehen!"
	done

.BeatenText:
	text "Ach, aber sie"
	line "waren so"
	cont "glücklich!"
	done

GenericTrainerGuitaristfJaclyn:
	generictrainer GUITARISTF, JACLYN, EVENT_BEAT_GUITARISTF_JACLYN, .SeenText, .BeatenText

	text "Warte! Ich bin"
	line "noch nicht fertig"
	cont "mit Singen!"
	done

.SeenText:
	text "Lass meine Gitarre"
	line "heulen!"
	para "Hör mich schreien!"
	done

.BeatenText:
	text "Giyaaaah!"
	done

GenericTrainerGuitaristmEzekiel:
	generictrainer GUITARISTM, EZEKIEL, EVENT_BEAT_GUITARISTM_EZEKIEL, .SeenText, .BeatenText

	text "Wenn du genau"
	line "hinhörst, kannst"
	cont "du"

	para "den Rhythmus des"
	line "Waldesummens"
	cont "hören."
	done

.SeenText:
	text "Kampf? Klar, bin"
	line "dabei."
	done

.BeatenText:
	text "Wow. Stark!"
	done

GenericTrainerHikerLester:
	generictrainer HIKER, LESTER, EVENT_BEAT_HIKER_LESTER, .SeenText, .BeatenText

	text "Was, darf ein"
	line "Wanderer keinen"
	cont "Wald erkunden,"

	para "statt immer nur"
	line "Berge zu"
	cont "besteigen?"
	done

.SeenText:
	text "Yahoo!"
	done

.BeatenText:
	text "Gweh! Hust!"

	para "Das Geschrei hat"
	line "mich erwürgt!"
	done

GenericTrainerBird_keeperTrent:
	generictrainer BIRD_KEEPER, TRENT, EVENT_BEAT_BIRD_KEEPER_TRENT, .SeenText, .BeatenText

	text "Ich stehe jeden"
	line "Tag früh auf, um"
	cont "hier meine Vögel"
	cont "zu trainieren."
	para "Der Lärm gehört zu"
	line "unserem Training"
	cont "dazu."
	done

.SeenText:
	text "Der frühe Vogel"
	line "fängt den Wurm!"
	done

.BeatenText:
	text "Sieht so aus, als"
	line "wär ich der Wurm…"
	done

NoisyForestTeacherText:
	text "Ich komme hier"
	line "morgens zum"
	cont "Spazieren."
	para "Ich hab sogar"
	line "einen"
	cont "Schrittzähler, der"
	cont "meine Schritte"
	cont "zählt!"
	done

NoisyForestChildText:
	text "Gah! Dieser Ort"
	line "ist"
	cont "ohrenbetäubend!"
	done

NoisyForestPikabluScript:
	showcrytext .PikabluText, MARILL
	appear NOISYFOREST_WILHOMENA
	applymovement NOISYFOREST_WILHOMENA, .WalkToYou
	turnobject PLAYER, DOWN
	showtext .OwnerText1
	disappear NOISYFOREST_PIKABLU
	opentext
	writetext .OwnerText2
	promptbutton
	verbosegiveitem ODD_SOUVENIR
	iffalsefwd .NoItem
	setevent EVENT_GOT_ODD_SOUVENIR_FROM_WILHOMENA
	writetext .OwnerText3
.Leave:
	waitbutton
	closetext
	applymovement NOISYFOREST_WILHOMENA, .WalkAway
	disappear NOISYFOREST_WILHOMENA
	clearevent EVENT_SHAMOUTI_ISLAND_WILHOMENA
	end

.NoItem:
	writetext .OwnerText4
	sjump .Leave

.PikabluText:
	text "MARILL: Rill!"
	done

.OwnerText1:
	text "Du hast mein"
	line "Pikablu gefunden!"
	cont "Danke!"
	done

.OwnerText2:
	text "Nimm dies als"
	line "kleines"
	cont "Dankeschön."
	done

.OwnerText3:
	text "Ein Souvenir"
	line "deiner Zeit auf"
	cont "der"
	cont "Shamouti-Insel!"
	para "Sieht es nicht"
	line "seltsam aus?"
	para "Tschüss und"
	line "nochmal danke!"
	done

.OwnerText4:
	text "Ach, du kannst es"
	line "gerade nicht"
	cont "tragen."
	para "Komm zum"
	line "#MON-Center,"
	cont "wenn du es willst."
	done

.WalkToYou:
	step_right
	step_right
	step_right
	step_right
	step_right
	step_up
	step_up
	step_up
	step_end

.WalkAway:
	step_down
	step_down
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

NoisyForestSignpostText:
	text "Lauter Wald"
	done
