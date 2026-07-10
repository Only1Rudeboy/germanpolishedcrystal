SafariZoneNorth_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 41, 32, SAFARI_ZONE_EAST, 3
	warp_event 41, 33, SAFARI_ZONE_EAST, 4
	warp_event 10, 37, SAFARI_ZONE_WEST, 3
	warp_event 11, 37, SAFARI_ZONE_WEST, 4
	warp_event 22, 37, SAFARI_ZONE_HUB, 7
	warp_event 23, 37, SAFARI_ZONE_HUB, 8
	warp_event 37,  5, SAFARI_ZONE_NORTH_REST_HOUSE, 1
	warp_event  4, 37, SAFARI_ZONE_WEST, 1
	warp_event  5, 37, SAFARI_ZONE_WEST, 2

	def_coord_events

	def_bg_events
	bg_event 15, 33, BGEVENT_JUMPTEXT, SafariZoneNorthAreaSignText
	bg_event 38,  6, BGEVENT_JUMPTEXT, SafariZoneNorthRestHouseSignText
	bg_event 28, 30, BGEVENT_JUMPTEXT, SafariZoneNorthTrainerTips1SignText
	bg_event 20, 34, BGEVENT_JUMPTEXT, SafariZoneNorthTrainerTips2SignText
	bg_event  5, 27, BGEVENT_JUMPTEXT, SafariZoneNorthTrainerTips3SignText
	bg_event 31, 19, BGEVENT_ITEM + LUCKY_PUNCH, EVENT_SAFARI_ZONE_NORTH_HIDDEN_LUCKY_PUNCH

	def_object_events
	object_event 18, 23, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerBattleGirlPadma, -1
	object_event  7,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerYoungsterTyler, -1
	object_event 36,  9, SPRITE_BEAUTY, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBeautyRachael, -1
	object_event 15, 14, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneNorthCooltrainerFScript, -1
	itemball_event 24, 18, EVIOLITE, 1, EVENT_SAFARI_ZONE_NORTH_EVIOLITE
	itemball_event 21,  9, PROTEIN, 1, EVENT_SAFARI_ZONE_NORTH_PROTEIN

GenericTrainerBattleGirlPadma:
	generictrainer BATTLE_GIRL, PADMA, EVENT_BEAT_BATTLE_GIRL_PADMA, BattleGirlPadmaSeenText, BattleGirlPadmaBeatenText

	text "Wenn du deine"
	line "Gefühle ins"

	para "Training steckst,"
	line "wirst du stark!"
	done

GenericTrainerYoungsterTyler:
	generictrainer YOUNGSTER, TYLER, EVENT_BEAT_YOUNGSTER_TYLER, YoungsterTylerSeenText, YoungsterTylerBeatenText

	text "#mon springen"
	line "hervor, wenn du"
	cont "es am wenigsten"
	cont "erwartest."
	done

GenericTrainerBeautyRachael:
	generictrainer BEAUTY, RACHAEL, EVENT_BEAT_BEAUTY_RACHAEL, BeautyRachaelSeenText, BeautyRachaelBeatenText

	text "Vor einem Jahr"
	line "war"
	line "ich noch"
	line "Schwarzgurt."

	para "Die Kraft der"
	line "Medizin ist"

	para "erstaunlich,"
	line "findest du nicht?"
	done

SafariZoneNorthCooltrainerFScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_DOUBLE_EDGE_INTRO
	iftruefwd SafariZoneNorthTutorDoubleEdgeScript
	writetext SafariZoneNorthCooltrainerFText
	waitbutton
	setevent EVENT_LISTENED_TO_DOUBLE_EDGE_INTRO
SafariZoneNorthTutorDoubleEdgeScript:
	writetext Text_SafariZoneNorthTutorDoubleEdge
	waitbutton
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	writetext Text_SafariZoneNorthTutorQuestion
	yesorno
	iffalsefwd .TutorRefused
	setval DOUBLE_EDGE
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpthisopenedtext

	text "Na gut."
	done

.NoSilverLeaf
	jumpthisopenedtext

	text "Du hast keine"
	line "Silberblätter…"
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "So! Dein #mon"
	line "kennt jetzt"

	para "Risikotackle!"
	done

BattleGirlPadmaSeenText:
	text "Ich trainiere mit"
	line "meinen #mon, um"
	cont "als Team stärker"
	cont "zu werden!"
	done

BattleGirlPadmaBeatenText:
	text "Wir müssen härter"
	line "trainieren!"
	done

YoungsterTylerSeenText:
	text "Du findest #mon"
	line "überall!"

	para "Im Gras, im"
	line "Wasser,"
	line "in Höhlen oder"
	cont "auf Bäumen!"
	done

YoungsterTylerBeatenText:
	text "Ich muss weiter-"
	line "suchen!"
	done

BeautyRachaelSeenText:
	text "Mein Sommerkleid"
	line "ist perfekt für"
	cont "die Safari-Zone!"
	done

BeautyRachaelBeatenText:
	text "Nicht ideal zum"
	line "Kämpfen…"
	done

SafariZoneNorthCooltrainerFText:
	text "Ich hab ein"
	line "Chaneira"
	cont "gefangen!"

	para "Was für ein"
	line "Glück! Ich bringe"

	para "ihm einen ganz"
	line "starken Tackle"
	cont "bei."

	para "Lass mich mein"
	line "Glück mit dir"
	cont "teilen!"
	done

Text_SafariZoneNorthTutorDoubleEdge:
	text "Ich bringe deinem"
	line "#mon"
	cont "Risikotackle"

	para "bei — für ein"
	line "Silberblatt."
	done


Text_SafariZoneNorthTutorQuestion:
	text "Soll ich deinem"
	line "#mon"
	cont "Risikotackle"
	cont "beibringen?"
	done



SafariZoneNorthAreaSignText:
	text "Safari-Zone"
	line "Nordbereich"
	done

SafariZoneNorthRestHouseSignText:
	text "Rasthaus"
	done

SafariZoneNorthTrainerTips1SignText:
	text "Trainer-Tipps"

	para "Attacken"
	line "desselben"
	line "Typs können"
	cont "physisch,"
	cont "speziell oder"
	cont "Status-Attacken"
	cont "sein."
	done

SafariZoneNorthTrainerTips2SignText:
	text "Trainer-Tipps"

	para "#mon verstecken"
	line "sich im hohen"
	cont "Gras!"

	para "Lauf im Zickzack"
	line "durchs Gras, um"
	cont "sie aufzuscheu-"
	cont "chen."
	done

SafariZoneNorthTrainerTips3SignText:
	text "Trainer-Tipps"

	para "Der Rest des"
	line "Schilds ist"
	cont "abgerissen…"
	done
