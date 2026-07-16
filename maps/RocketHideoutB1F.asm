RocketHideoutB1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, RocketHideoutB1FDoorScript

	def_warp_events
	warp_event 15,  2, ROCKET_HIDEOUT_B2F, 1
	warp_event 13,  2, CELADON_GAME_CORNER, 3
	warp_event 16, 19, ROCKET_HIDEOUT_ELEVATOR, 1
	warp_event 13, 24, ROCKET_HIDEOUT_B2F, 4
	warp_event 17, 19, ROCKET_HIDEOUT_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event 13, 15, BGEVENT_ITEM + MAX_REVIVE, EVENT_ROCKET_HIDEOUT_B1F_HIDDEN_MAX_REVIVE

	def_object_events
	object_event 20, 18, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 4, RocketHideoutB1FBlackBeltRylan, -1
	object_event  4,  6, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, RocketHideoutB1FScientistSanders, -1
	object_event 18,  8, SPRITE_PICNICKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, RocketHideoutB1FPicnickerZane, -1
	object_event 12, 19, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, RocketHideoutB1FBattleGirlSasha, -1
	object_event  7, 23, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, RocketHideoutB1FLassMavis, -1
	itemball_event  1, 17, MOON_STONE, 1, EVENT_ROCKET_HIDEOUT_B1F_MOON_STONE
	itemball_event  3, 14, ZINC, 1, EVENT_ROCKET_HIDEOUT_B1F_ZINC

RocketHideoutB1FDoorScript:
	checkevent EVENT_BEAT_BLACKBELT_RYLAN
	iftruefwd .DoorOpen
	changeblock 16, 16, $06
.DoorOpen
	endcallback

RocketHideoutB1FBlackBeltRylan:
	trainer BLACKBELT_T, RYLAN, EVENT_BEAT_BLACKBELT_RYLAN, .SeenText, .BeatenText, 0, .AfterScript

.Script:
	checkevent EVENT_BEAT_BLACKBELT_RYLAN
	iftruefwd .AfterScript
	jumpthistextfaceplayer

.SeenText:
	text "Bei Team Valor"
	line "übertreffen wir"
	cont "unsere Grenzen."

	para "Stärke ist alles,"
	line "was zählt!"
	done

.AfterScript
	checkjustbattled
	iffalsefwd .AfterText
	changeblock 16, 16, $0d
	playsound SFX_ENTER_DOOR
	waitsfx
	refreshmap
	special RestartMapMusic
	end

.AfterText
	jumptextfaceplayer .Text
	end

.Text
	text "Du hast Mut…"

	para "Vielleicht"
	line "solltest du Team"
	cont "Valor beitreten."
	done

.BeatenText:
	text "Deine Stärke ist"
	line "überlegen…"
	done

RocketHideoutB1FScientistSanders:
	generictrainer SCIENTIST, SANDERS, EVENT_BEAT_SCIENTIST_SANDERS, .SeenText, .BeatenText

	text "Leiterin Blanche"
	line "ist eine"
	cont "Strategin."
	para "Sie entscheidet,"
	line "wo wir stationiert"
	cont "sind."
	done

.SeenText:
	text "Team Mystic"
	line "schätzt Strategie."
	para "Nur ein starker"
	line "Verstand kann hier"
	cont "siegen."
	done

.BeatenText:
	text "Deine Taktik ist"
	line "makellos!"
	done

RocketHideoutB1FPicnickerZane:
	generictrainer PICNICKER, ZANE, EVENT_BEAT_PICNICKER_ZANE, .SeenText, .BeatenText

	text "SPARK wäre"
	line "beeindruckt."

	para "Mal sehen, ob du"
	line "weitermachen"
	cont "kannst!"
	done

.SeenText:
	text "Team Instinct"
	line "bedeutet, deinem"
	cont "Bauchgefühl zu"
	cont "vertrauen."

	para "Keine Zeit zum"
	line "Denken, nur"
	cont "handeln!"
	done

.BeatenText:
	text "Du hast diesen"
	line "'Funken'."

	para "Behalte ihn!"
	done

RocketHideoutB1FBattleGirlSasha:
	generictrainer BATTLE_GIRL, SASHA, EVENT_BEAT_BATTLE_GIRL_SASHA, .SeenText, .BeatenText

	text "Die Flamme von"
	line "Valor brennt in"
	cont "dir."
	para "CANDELAs Prüfung"
	line "wird deine Grenzen"
	cont "testen."
	done

.SeenText:
	text "Team Valor steht"
	line "für Leidenschaft"
	cont "und Risiko."

	para "Traust du dich,"
	line "meine Intensität"
	cont "zu matchen?"
	done

.BeatenText:
	text "Deine Flamme… Zu"
	line "hell!"
	done

RocketHideoutB1FLassMavis:
	generictrainer LASS, MAVIS, EVENT_BEAT_LASS_MAVIS, .SeenText, .BeatenText

	text "SPARKs Kämpfe sind"
	line "unberechenbar."
	para "Deshalb mische ich"
	line "es!"
	done

.SeenText:
	text "Meine Strategie?"

	para "Reiner Instinkt,"
	line "nichts weiter!"
	done

.BeatenText:
	text "Dein Instinkt ist"
	line "wohl besser als"
	cont "meiner."
	done
