FastShipCabins_SW_SSW_NW_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  0, FAST_SHIP_1F, 5
	warp_event  2, 19, FAST_SHIP_1F, 6
	warp_event  3, 19, FAST_SHIP_1F, 6
	warp_event  2, 31, FAST_SHIP_1F, 7
	warp_event  3, 31, FAST_SHIP_1F, 7

	def_coord_events

	def_bg_events
	bg_event  7,  1, BGEVENT_READ, FastShipBed
	bg_event  7,  2, BGEVENT_READ, FastShipBed

	def_object_events
	object_event  1, 15, SPRITE_FIREBREATHER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerFirebreatherLyle, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  6, 15, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerBug_catcherKen, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  5, 27, SPRITE_RICH_BOY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerRichBoyWinston, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  1, 26, SPRITE_BEAUTY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBeautyCassie, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  3, 28, SPRITE_ROCKER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerGuitaristmClyde, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND

GenericTrainerFirebreatherLyle:
	generictrainer FIREBREATHER, LYLE, EVENT_BEAT_FIREBREATHER_LYLE, FirebreatherLyleSeenText, FirebreatherLyleBeatenText

	text "Ich denke, Feuer"
	line "ist schwach auf"
	cont "hoher See."

	para "Das ist egal?"
	line "Wirklich?"
	done
GenericTrainerBug_catcherKen:
	generictrainer BUG_CATCHER, KEN, EVENT_BEAT_BUG_CATCHER_KEN, Bug_catcherKenSeenText, Bug_catcherKenBeatenText

	text "In JOHTO findest"
	line "du viele #mon"
	cont "in den Bäumen!"
	done
GenericTrainerRichBoyWinston:
	generictrainer RICH_BOY, WINSTON, EVENT_BEAT_RICH_BOY_WINSTON, RichBoyWinstonSeenText, RichBoyWinstonBeatenText

	text "Dieses Schiff ist"
	line "so öde."
	done

GenericTrainerBeautyCassie:
	generictrainer BEAUTY, CASSIE, EVENT_BEAT_BEAUTY_CASSIE, BeautyCassieSeenText, BeautyCassieBeatenText

	text "Eine Schiffsreise"
	line "ist am besten, um"
	cont "ein gebrochenes"
	cont "Herz zu vergessen."

	para "Aber eine Reise"
	line "mit dem SCHNELL-"
	cont "BOOT ist für die"
	cont "Trauer zu kurz."
	done
TrainerGuitaristmClyde:
	trainer GUITARISTM, CLYDE, EVENT_BEAT_GUITARISTM_CLYDE, GuitaristmClydeSeenText, GuitaristmClydeBeatenText, 0, GuitaristmClydeScript

GuitaristmClydeScript:
	endifjustbattled
	opentext
	checkbp 0
	iffalsefwd .BattleTower
	jumpthisopenedtext

	text "Apropos RADIO-"
	line "STATION: Wie "

	para "lauten die"
	line "Glückszahlen für"
	cont "diese Woche?"
	done
.BattleTower:
	jumpthisopenedtext

	text "Ich wollte mein"
	line "Debut im DUELLTURM"
	cont "geben…"

	para "Ich sollte nach"
	line "ORANIA CITY"
	cont "zurückgehen und"
	cont "härter trainieren…"
	done
FastShipBed:
	showtext FastShipBedText1
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	special HealParty
	playmusic MUSIC_HEAL
	pause 60
	turnobject PLAYER, LEFT
	special RestartMapMusic
	special Special_FadeInQuickly
	showtext FastShipBedText2
	checkevent EVENT_FAST_SHIP_HAS_ARRIVED
	iftruefwd .AlreadyArrived
	checkevent EVENT_FAST_SHIP_FOUND_GIRL
	iftruefwd .CanArrive
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftruefwd .CanArrive
.AlreadyArrived:
	end

.CanArrive:
	playsound SFX_ELEVATOR_END
	pause 30
	checkevent EVENT_FAST_SHIP_DESTINATION_OLIVINE
	iftruefwd .ArrivedOlivine
	showtext FastShipArrivedVermilionText
	setevent EVENT_FAST_SHIP_HAS_ARRIVED
	end

.ArrivedOlivine:
	showtext FastShipArrivedOlivineText
	setevent EVENT_FAST_SHIP_HAS_ARRIVED
	end

FirebreatherLyleSeenText:
	text "Ich gehe nach"
	line "KANTO, um meine"
	cont "Feuerspuck-Künste"
	cont "vorzuführen!"
	done





FirebreatherLyleBeatenText:
	text "Zisch… Die Flamme"
	line "ist klein…"
	done





Bug_catcherKenSeenText:
	text "Ich besuche meine"
	line "Oma, um einige"
	cont "Käfer zu fangen!"
	done
Bug_catcherKenBeatenText:
	text "Ach, wow. Du bist"
	line "stark!"
	done
RichBoyWinstonSeenText:
	text "Du kannst dir kein"
	line "Ticket leisten."

	para "Sieht aus, als"
	line "hätten wir einen"
	cont "Blindpassagier!"
	done

RichBoyWinstonBeatenText:
	text "Wow! Wo hast du"
	line "deine #mon her?"
	done

BeautyCassieSeenText:
	text "Ich versuche,"
	line "meine Leiden zu"
	cont "vergessen. Lass"
	cont "uns kämpfen!"
	done





BeautyCassieBeatenText:
	text "Mein Herz weint…"
	done





GuitaristmClydeSeenText:
	text "Ich werde meine"
	line "Lieder bei der"

	para "RADIOSTATION in"
	line "DUKATIA CITY"
	cont "vorspielen."
	done
GuitaristmClydeBeatenText:
	text "Yowza! Total"
	line "verzerrt!"
	done
FastShipBedText1:
	text "Ein weiches Bett!"
	line "Schlafenszeit…"
	done





FastShipBedText2:
	text "Ah, ausgeruht und"
	line "frisch!"
	done





FastShipArrivedOlivineText:
	text "Die M.S. AQUA legt"
	line "in"

	para "OLIVIANA CITY an."
	done





FastShipArrivedVermilionText:
	text "Die M.S. AQUA legt"
	line "in"

	para "ORANIA CITY an."
	done





