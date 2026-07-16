DimCave5F_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_STONETABLE, DimCave5FSetUpStoneTable

	def_warp_events
	warp_event 13, 31, ROUTE_10_NORTH, 5
	warp_event  2, 16, DIM_CAVE_4F, 1
	warp_event 27, 29, DIM_CAVE_4F, 2
	warp_event 28, 25, DIM_CAVE_4F, 3

	def_coord_events

	def_bg_events
	bg_event 12, 28, BGEVENT_ITEM + X_SP_ATK, EVENT_DIM_CAVE_5F_HIDDEN_X_SP_ATK

	def_object_events
	strengthboulder_event 25,  5, EVENT_BOULDER_IN_DIM_CAVE_5F
	object_event 13,  4, SPRITE_RILEY, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, DimCave5FRileyScript, EVENT_DIM_CAVE_RILEY
	object_event 24, 17, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSuper_nerdFoote, -1
	object_event 13, 25, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerEngineerHoward, -1
	object_event 21, 28, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerSuper_nerdDave, -1
	itemball_event 13, 13, RARE_CANDY, 1, EVENT_DIM_CAVE_5F_RARE_CANDY
	itemball_event  9, 27, DUSK_STONE, 1, EVENT_DIM_CAVE_5F_DUSK_STONE
	itemball_event 31, 14, HYPER_POTION, 1, EVENT_DIM_CAVE_5F_HYPER_POTION

	object_const_def
	const DIMCAVE5F_BOULDER
	const DIMCAVE5F_RILEY

DimCave5FSetUpStoneTable:
	usestonetable .StoneTable
	endcallback

.StoneTable:
	stonetable 4, DIMCAVE5F_BOULDER, .Boulder
	db -1 ; end

.Boulder:
	disappear DIMCAVE5F_BOULDER
	clearevent EVENT_BOULDER_FELL_IN_DIM_CAVE_4F
	pause 30
	playsound SFX_STRENGTH
	earthquake 80
	jumpthistext

	text "Der Fels ist"
	line "heruntergefallen."
	done
DimCave5FRileyScript:
	faceplayer
	checkevent EVENT_BEAT_RILEY
	iftruefwd .Beaten
	opentext
	writetext .ChallengeText
	yesorno
	iffalse_jumpopenedtext .NoText
	writetext .YesText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked DIMCAVE5F_RILEY
	loadtrainer RILEY, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_RILEY
.Beaten
	opentext
	writetext .ItemText
	promptbutton
	verbosegiveitem POWER_BRACER
	iffalse_endtext
	writetext .GoodbyeText
	waitbutton
	closetext
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear DIMCAVE5F_RILEY
	pause 15
	special Special_FadeInQuickly
	clearevent EVENT_BATTLE_TOWER_RILEY
	end

.ChallengeText:
	text "… Wer bist du?"
	para "Okay, du bist"
	line "<PLAYER>."
	para "Ich bin Riley. Ja,"
	line "ich bin Trainer."
	para "Ich besitze eine"
	line "Mine wie diese"
	cont "-ein guter"
	cont "Trainingsplatz für"
	cont "mich."
	para "Wenn du willst,"
	line "können wir"
	cont "kämpfen."
	done

.YesText:
	text "Wir geben alles,"
	line "um deine #MON"

	para "zu besiegen."
	done

.NoText:
	text "Na gut. Dann"
	line "trainieren wir"
	cont "weiter hier."
	done

.BeatenText:
	text "Mal kämpfen wir,"
	line "mal kämpfen wir"
	cont "zusammen."
	para "Schön, wie Trainer"
	line "miteinander"
	cont "umgehen können."
	done

.ItemText:
	text "Kenne deinen"
	line "Feind."

	para "Wenn du die"
	line "#MON und"
	cont "Attacken des"

	para "Gegners kennst,"
	line "steigen deine"

	para "Siegeschancen."
	line "Aber auch dein"

	para "Team zu stärken"
	line "ist wichtig."

	para "Das hilft dir"
	line "dabei."
	done

.GoodbyeText:
	text "Der Kampf mit dir"
	line "hat Spaß gemacht."

	para "Jetzt teste ich"
	line "meine Fähigkeiten"
	cont "im Kampfturm."

	para "Bis bald!"

	para "Pass auf dem Weg"
	line "raus auf."
	done

GenericTrainerSuper_nerdFoote:
	generictrainer SUPER_NERD, FOOTE, EVENT_BEAT_SUPER_NERD_FOOTE, .SeenText, .BeatenText

	text "Ein Leben retten"
	line "oder fünf?"
	para "Als"
	line "#MON-Trainer"
	cont "hast du vielleicht"
	para "die Kraft, alle"
	line "sechs zu retten!"
	done

.SeenText:
	text "Ich hab ein Rätsel"
	line "für dich!"
	para "Würdest du ein"
	line "#MON vor einen"
	para "Lorenbahnwagen"
	line "stoßen, um fünf zu"
	cont "retten?"
	done

.BeatenText:
	text "Du hast ohne Worte"
	line "geantwortet … Wie"
	cont "zen!"
	done

GenericTrainerEngineerHoward:
	generictrainer ENGINEER, HOWARD, EVENT_BEAT_ENGINEER_HOWARD, .SeenText, .BeatenText

	text "Das Wasser fließt"
	line "vom AZURIA-KAP"
	para "südwärts und endet"
	line "im KRAFTWERK."
	done

.SeenText:
	text "Dieser Wasserfall"
	line "versorgt ganz"
	cont "KANTO mit Energie!"
	done

.BeatenText:
	text "Nein! Ein"
	line "Blackout…"
	done

GenericTrainerSuper_nerdDave:
	generictrainer SUPER_NERD, DAVE, EVENT_BEAT_SUPER_NERD_DAVE, .SeenText, .BeatenText

	text "Zum Abbauen"
	line "braucht man eine"
	cont "Spitzhacke."
	para "Hier in der Nähe"
	line "bekommt man keine."
	done

.SeenText:
	text "Meine Fähigkeiten"
	line "in Bergbau,"
	para "Juwelen, Schmelzen"
	line "und Handwerk sind"
	cont "auf Maximum!"
	done

.BeatenText:
	text "Aber nicht beim"
	line "Kämpfen…"
	done
