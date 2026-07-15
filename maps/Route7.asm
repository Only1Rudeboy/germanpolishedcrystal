Route7_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 15,  6, ROUTE_7_SAFFRON_GATE, 1
	warp_event 15,  7, ROUTE_7_SAFFRON_GATE, 2

	def_coord_events

	def_bg_events
	bg_event  5, 13, BGEVENT_JUMPTEXT, Route7UndergroundPathSignText
	bg_event  6, 11, BGEVENT_JUMPTEXT, Route7LockedDoorText

	def_object_events
	object_event  1,  0, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_SNORLAX, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Route7Snorlax, EVENT_ROUTE_7_SNORLAX
	object_event 15, 11, SPRITE_BREEDER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerBreederCarlene, -1
	itemball_event 16,  1, MENTAL_HERB, 1, EVENT_ROUTE_7_MENTAL_HERB

	object_const_def
	const ROUTE7_BIG_SNORLAX

GenericTrainerBreederCarlene:
	generictrainer BREEDER, CARLENE, EVENT_BEAT_BREEDER_CARLENE, .SeenText, .BeatenText

	text "Ich lasse mein"
	line "Picto Sketch"

	para "nutzen und züchte"
	line "dann weiter,"

	para "um die Attacke"
	line "weiterzugeben!"

	para "Clever, oder?"
	done

.SeenText:
	text "Mein Team ist"
	line "perfekt für jede"
	cont "Situation!"
	done

.BeatenText:
	text "Gegen dich hatten"
	line "wir keine Chance!"
	done

Route7Snorlax:
	opentext
	special SpecialSnorlaxAwake
	iftruefwd .Awake
	jumpthisopenedtext

	text "RELAXO schläft"
	line "friedlich…"
	done
.Awake:
	writetext .AwakeText
	pause 15
	cry SNORLAX
	closetext
	loadvar VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon SNORLAX, 60
	startbattle
	disappear ROUTE7_BIG_SNORLAX
	setevent EVENT_FOUGHT_SNORLAX
	reloadmapafterbattle
	end


.AwakeText:
	text "Der #Com wird"
	line "in der Nähe des"
	cont "schlafenden"
	cont "RELAXOs platziert"
	cont "…"
	para "…"
	para "RELAXO ist"
	line "aufgewacht!"
	done
Route7UndergroundPathSignText:
	text "Was steht auf dem"
	line "Flugblatt?"

	para "…Ruppige Trainer"
	line "tragen auf dem"

	para "TUNNELPFAD Kämpfe"
	line "aus."

	para "Da sich die"
	line "Beschwerden der"
	cont "Anwohner häuften,"
	cont "wurde der"
	cont "TUNNELPFAD auf"
	cont "unbestimmte Zeit"
	cont "geschlossen."

	para "ORDNUNGSAMT VON"
	line "PRISMANIA CITY"
	done


Route7LockedDoorText:
	text "Es ist verriegelt"
	line "…"
	done


