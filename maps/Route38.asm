Route38_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 35,  8, ROUTE_38_ECRUTEAK_GATE, 1
	warp_event 35,  9, ROUTE_38_ECRUTEAK_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 33,  7, BGEVENT_JUMPTEXT, Route38SignText
	bg_event  5, 13, BGEVENT_JUMPTEXT, Route38TrainerTipsText
	bg_event 17,  5, BGEVENT_JUMPTEXT, Route38AdvancedTipsText

	def_object_events
	object_event  4,  1, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerSchoolboyChad1, -1
	object_event 15,  3, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerLassDana1, -1
	object_event 12, 15, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBird_keeperToby, -1
	object_event 19,  9, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBeautyValencia, -1
	object_event 24,  5, SPRITE_SAILOR, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, PAL_NPC_DARK_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSailorHarry, -1
	fruittree_event 12, 10, FRUITTREE_ROUTE_38, SITRUS_BERRY, PAL_NPC_BROWN
	object_event  5,  8, SPRITE_BEAUTY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBeautyOlivia, -1

GenericTrainerBird_keeperToby:
	generictrainer BIRD_KEEPER, TOBY, EVENT_BEAT_BIRD_KEEPER_TOBY, Bird_keeperTobySeenText, Bird_keeperTobyBeatenText

	text "Ich will im Gelben"
	line "Wald"

	para "trainieren und"
	line "meinem #mon Fly"
	cont "beibringen."
	done

TrainerSailorHarry:
	trainer SAILOR, HARRY, EVENT_BEAT_SAILOR_HARRY, SailorHarrySeenText, SailorHarryBeatenText, 0, .Script, TRAINERPAL_DARK_SAILOR

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "Alle Menschen auf"
	line "der ganzen Welt"

	para "leben glücklich"
	line "zusammen mit den"
	cont "#mon."
	done
TrainerLassDana1:
	trainer LASS, DANA1, EVENT_BEAT_LASS_DANA, LassDana1SeenText, LassDana1BeatenText, 0, .script

.script
	loadvar VAR_CALLERID, PHONE_LASS_DANA
	opentext
	checkflag ENGINE_DANA_READY_FOR_REMATCH
	iftruefwd .DanaRematch
	checkflag ENGINE_DANA_HAS_THUNDERSTONE
	iftruefwd .TryGiveThunderstone
	checkcellnum PHONE_LASS_DANA
	iftruefwd .NumberAccepted
	checkevent EVENT_DANA_ASKED_FOR_PHONE_NUMBER
	iftruefwd .SecondTimeAsking
	writetext LassDanaMoomooMilkText
	promptbutton
	setevent EVENT_DANA_ASKED_FOR_PHONE_NUMBER
	callstd asknumber1f
	sjumpfwd .AskForPhoneNumber

.SecondTimeAsking:
	callstd asknumber2f
.AskForPhoneNumber:
	askforphonenumber PHONE_LASS_DANA
	ifequalfwd $1, .PhoneFull
	ifequalfwd $2, .DeclinedPhoneNumber
	gettrainername LASS, DANA1, STRING_BUFFER_3
	callstd registerednumberf
	jumpstd numberacceptedf

.DanaRematch:
	callstd rematchf
	winlosstext LassDana1BeatenText, 0
	readmem wDanaFightCount
	ifequalfwd 4, .Fight4
	ifequalfwd 3, .Fight3
	ifequalfwd 2, .Fight2
	ifequalfwd 1, .Fight1
	ifequalfwd 0, .LoadFight0
.Fight4:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .LoadFight4
.Fight3:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd .LoadFight3
.Fight2:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftruefwd .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_CIANWOOD
	iftruefwd .LoadFight1
.LoadFight0:
	loadtrainer LASS, DANA1
	startbattle
	reloadmapafterbattle
	loadmem wDanaFightCount, 1
	clearflag ENGINE_DANA_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer LASS, DANA2
	startbattle
	reloadmapafterbattle
	loadmem wDanaFightCount, 2
	clearflag ENGINE_DANA_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer LASS, DANA3
	startbattle
	reloadmapafterbattle
	loadmem wDanaFightCount, 3
	clearflag ENGINE_DANA_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer LASS, DANA4
	startbattle
	reloadmapafterbattle
	loadmem wDanaFightCount, 4
	clearflag ENGINE_DANA_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer LASS, DANA5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_DANA_READY_FOR_REMATCH
	end

.TryGiveThunderstone:
	callstd giftf
	verbosegiveitem THUNDERSTONE
	iffalsefwd .NoRoomForThunderstone
	clearflag ENGINE_DANA_HAS_THUNDERSTONE
	setevent EVENT_DANA_GAVE_THUNDERSTONE
	jumpstd numberacceptedf

.NoRoomForThunderstone:
	jumpstd packfullf

.NumberAccepted:
	jumpstd numberacceptedf

.DeclinedPhoneNumber:
	jumpstd numberdeclinedf

.PhoneFull:
	jumpstd phonefullf

TrainerSchoolboyChad1:
	trainer SCHOOLBOY, CHAD1, EVENT_BEAT_SCHOOLBOY_CHAD, SchoolboyChad1SeenText, SchoolboyChad1BeatenText, 0, .script

.script
	loadvar VAR_CALLERID, PHONE_SCHOOLBOY_CHAD
	opentext
	checkflag ENGINE_CHAD_READY_FOR_REMATCH
	iftruefwd .ChadRematch
	checkcellnum PHONE_SCHOOLBOY_CHAD
	iftruefwd .HaveChadsNumber
	checkevent EVENT_CHAD_ASKED_FOR_PHONE_NUMBER
	iftruefwd .SecondTimeAsking
	writetext SchoolboyChadSoManyTestsText
	promptbutton
	setevent EVENT_CHAD_ASKED_FOR_PHONE_NUMBER
	callstd asknumber1m
	sjumpfwd .AskToRegisterNumber

.SecondTimeAsking:
	callstd asknumber2m
.AskToRegisterNumber:
	askforphonenumber PHONE_SCHOOLBOY_CHAD
	ifequalfwd $1, .PhoneFull
	ifequalfwd $2, .SaidNo
	gettrainername SCHOOLBOY, CHAD1, STRING_BUFFER_3
	callstd registerednumberm
	jumpstd numberacceptedm

.ChadRematch:
	callstd rematchm
	winlosstext SchoolboyChad1BeatenText, 0
	readmem wChadFightCount
	ifequalfwd 4, .Fight4
	ifequalfwd 3, .Fight3
	ifequalfwd 2, .Fight2
	ifequalfwd 1, .Fight1
	ifequalfwd 0, .LoadFight0
.Fight4:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .LoadFight4
.Fight3:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd .LoadFight3
.Fight2:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftruefwd .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_MAHOGANY
	iftruefwd .LoadFight1
.LoadFight0:
	loadtrainer SCHOOLBOY, CHAD1
	startbattle
	reloadmapafterbattle
	loadmem wChadFightCount, 1
	clearflag ENGINE_CHAD_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer SCHOOLBOY, CHAD2
	startbattle
	reloadmapafterbattle
	loadmem wChadFightCount, 2
	clearflag ENGINE_CHAD_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer SCHOOLBOY, CHAD3
	startbattle
	reloadmapafterbattle
	loadmem wChadFightCount, 3
	clearflag ENGINE_CHAD_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer SCHOOLBOY, CHAD4
	startbattle
	reloadmapafterbattle
	loadmem wChadFightCount, 4
	clearflag ENGINE_CHAD_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer SCHOOLBOY, CHAD5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_CHAD_READY_FOR_REMATCH
	end

.HaveChadsNumber:
	jumpstd numberacceptedm

.SaidNo:
	jumpstd numberdeclinedm

.PhoneFull:
	jumpstd phonefullm

GenericTrainerBeautyValencia:
	generictrainer BEAUTY, VALENCIA, EVENT_BEAT_BEAUTY_VALENCIA, BeautyValenciaSeenText, BeautyValenciaBeatenText

	text "Wenn ich #mon"
	line "sehe, scheint mich"
	cont "das zu entspannen."
	done
GenericTrainerBeautyOlivia:
	generictrainer BEAUTY, OLIVIA, EVENT_BEAT_BEAUTY_OLIVIA, BeautyOliviaSeenText, BeautyOliviaBeatenText

	text "Kuhmuh-Milch tut"
	line "Schönheit und"
	cont "Gesundheit gut."

	para "Am liebsten kaufe"
	line "ich gleich ein"
	cont "Dutzend Flaschen!"
	done

Bird_keeperTobySeenText:
	text "Fliege hoch in die"
	line "Luft, mein"
	cont "herrliches"
	cont "Vogel-#mon!"
	done
Bird_keeperTobyBeatenText:
	text "Ich fühle mich,"
	line "als würde ich mich"
	cont "selbst in die"
	cont "Lüfte erheben."
	done
SchoolboyChad1SeenText:
	text "Jetzt probiere ich"
	line "etwas aus, das ich"
	cont "heute gelernt"
	cont "habe."
	done



SchoolboyChad1BeatenText:
	text "Ich fürchte, ich"
	line "habe noch nicht"
	cont "genug gelernt."
	done



SchoolboyChadSoManyTestsText:
	text "Ich habe so viele"
	line "Prüfungen, dass"

	para "ich nicht viel"
	line "Zeit für #mon"
	cont "habe."

	para "Wenn ich also mal"
	line "Zeit zum Spielen"
	cont "habe, dann"
	cont "konzentriere ich"
	cont "mich."
	done



LassDana1SeenText:
	text "Du scheinst dich"
	line "mit #mon"
	cont "auszukennen."

	para "Gibst du mir bitte"
	line "einige Ratschläge?"
	done



LassDana1BeatenText:
	text "Ich verstehe. So"
	line "kämpfst du also."
	done



LassDanaMoomooMilkText:
	text "Ich kenne etwas"
	line "sehr Bekömmliches!"

	para "Die Milch von der"
	line "KUHMUH-FARM ist"
	cont "bekannt für ihren"
	cont "guten Geschmack."
	done



BeautyValenciaSeenText:
	text "Hallo! Du bist"
	line "bestimmt so nett"

	para "und zeigst mir"
	line "deine #mon?"
	done
BeautyValenciaBeatenText:
	text "Ich bin froh, dass"
	line "ich deine #mon"
	cont "sehen durfte!"
	done
SailorHarrySeenText:
	text "Ich war im"
	line "Ausland. Deswegen"

	para "kenne ich alle"
	line "#mon-Arten!"
	done



SailorHarryBeatenText:
	text "Deine Fähigkeiten"
	line "sind"
	cont "Spitzenklasse!"
	done



BeautyOliviaSeenText:
	text "Meine #mon und"
	line "ich sind"
	cont "wunderschön, nicht"
	cont "wahr?"
	done



BeautyOliviaBeatenText:
	text "Wir trinken"
	line "täglich"
	cont "KUHMUH-MILCH."
	done



Route38SignText:
	text "ROUTE 38"

	para "OLIVIANA CITY -"
	line "TEAK CITY"
	done



Route38TrainerTipsText:
	text "TIPPS für TRAINER"
	line "Wenn sich ein"

	para "#mon"
	line "weiterentwickelt,"
	cont "kannst"

	para "du diesen Prozess"
	line "aufhalten."

	para "Drücke während der"
	line "Entwicklung den"
	cont "B-Knopf."

	para "So wird das"
	line "#mon erschreckt"
	cont "und es bricht die"
	cont "Entwicklung ab."
	done



Route38AdvancedTipsText:
	text "Profi-Tipps!"

	para "Drücke Start im"
	line "#mon-Lager,"

	para "um schnell den"
	line "Box-Namen zu"
	cont "fokussieren!"

	para "Du kannst Name und"
	line "Design jeder Box"
	cont "ändern!"

	para "Drücke Select, um"
	line "die A-Taste-"
	cont "Funktion für"
	cont "#mon zu ändern!"
	done
