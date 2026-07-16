Route43_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route43CheckIfRocketsScript
	callback MAPCALLBACK_TILES, Route43RainScript

	def_warp_events
	warp_event  9, 51, ROUTE_43_MAHOGANY_GATE, 1
	warp_event 10, 51, ROUTE_43_MAHOGANY_GATE, 2
	warp_event 17, 35, ROUTE_43_GATE, 3
	warp_event 17, 31, ROUTE_43_GATE, 1
	warp_event 18, 31, ROUTE_43_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 13,  3, BGEVENT_JUMPTEXT, Route43Sign1Text
	bg_event 11, 49, BGEVENT_JUMPTEXT, Route43Sign2Text
	bg_event 16, 38, BGEVENT_JUMPTEXT, Route43TrainerTipsText
	bg_event  7, 42, BGEVENT_JUMPTEXT, Route43AdvancedTipsText

	def_object_events
	object_event  1,  6, SPRITE_LADY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route43SightseerfScript, -1
	object_event 13,  5, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerPokemaniacBen, -1
	object_event 13, 20, SPRITE_POKEMANIAC, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacBrent1, -1
	object_event 14,  7, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerPokemaniacRon, -1
	object_event  4, 16, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerFisherMarvin, -1
	object_event  8, 10, SPRITE_PICNICKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerPicnickerTiffany1, -1
	object_event 13, 40, SPRITE_CAMPER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerCamperSpencer, -1
	object_event  8, 32, SPRITE_BREEDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBreederJody, -1
	object_event 11, 24, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSrandjrIvyandamy1, -1
	object_event 11, 25, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSrandjrIvyandamy2, -1
	cuttree_event  2, 28, EVENT_ROUTE_43_CUT_TREE
	fruittree_event  1, 26, FRUITTREE_ROUTE_43, PERSIM_BERRY, PAL_NPC_PINK
	itemball_event 12, 32, MAX_ETHER, 1, EVENT_ROUTE_43_MAX_ETHER

	object_const_def
	const ROUTE43_SIGHTSEER_F

Route43CheckIfRocketsScript:
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftruefwd Route43NoRocketsScript
	setmapscene ROUTE_43_GATE, SCENE_ROUTE43GATE_ROCKET_SHAKEDOWN
	endcallback

Route43RainScript:
	special Special_GetOvercastIndex
	ifequalfwd LAKE_OF_RAGE_OVERCAST, .flood
	changemapblocks Route43_BlockData
	endcallback

.flood
	changemapblocks Route43Raining_BlockData
	endcallback

Route43NoRocketsScript:
	setmapscene ROUTE_43_GATE, SCENE_ROUTE43GATE_NOOP
	endcallback

Route43SightseerfScript:
	checkevent EVENT_GOT_FLAME_ORB_FROM_ROUTE_43_LEADER
	iftrue_jumptextfaceplayer .AfterText2
	faceplayer
	checkevent EVENT_BEAT_SIGHTSEERF_LENIE
	iftruefwd .Beaten
	checkevent EVENT_BEAT_BREEDER_JODY
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_SR_AND_JR_IVY_AND_AMY
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_CAMPER_SPENCER
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_POKEMANIAC_BEN
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_POKEMANIAC_BRENT
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_POKEMANIAC_RON
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_FISHER_MARVIN
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_PICNICKER_TIFFANY
	iffalse_jumptext .IntroText
	opentext
	writetext .QuestionText
	yesorno
	iffalse_jumpopenedtext .RefusedText
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked ROUTE43_SIGHTSEER_F
	loadtrainer SIGHTSEERF, LENIE
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_SIGHTSEERF_LENIE
.Beaten:
	opentext
	writetext .AfterText1
	promptbutton
	verbosegiveitem FLAME_ORB
	iffalse_endtext
	setevent EVENT_GOT_FLAME_ORB_FROM_ROUTE_43_LEADER
	jumpthisopenedtext

.AfterText2:
	text "Ich liebe es, neue"
	line "Orte zu besuchen"
	para "und dort jeden"
	line "Trainer"
	cont "herauszufordern."
	para "Ich suche weiter"
	line "nach starken"
	cont "Trainern wie dir."
	done

.IntroText:
	text "Ich suche starke"
	line "Trainer in Johto,"
	para "aber ich habe noch"
	line "keinen gefunden."
	para "Hmmm … Du siehst"
	line "vielversprechend"
	cont "aus."
	para "Ich kann es in"
	line "deinen Augen"
	cont "sehen."
	para "Lass uns kämpfen,"
	line "aber zuerst will"
	para "ich sehen, wie du"
	line "diese Route"
	para "eroberst, indem du"
	line "alle anderen"
	cont "besiegst."
	done

.QuestionText:
	text "Ausgezeichnet!"
	line "Zeit, meine neue"
	cont "Strategie zu"
	cont "testen …"
	para "Bist du bereit für"
	line "einen Kampf?"
	done

.RefusedText:
	text "Ach… Ich war so"
	line "aufgeregt!"

	para "Lass mich nicht"
	line "warten!"
	done

.SeenText:
	text "Mal sehen, wie"
	line "stark Johtos"
	cont "Trainer sind!"

	para "Stell dich meiner"
	line "Flame-Orb-"
	cont "Strategie!"
	done

.BeatenText:
	text "Klasse! ♥"
	done

.AfterText1:
	text "Toll! Endlich hab"
	line "ich gefunden, was"
	cont "ich suchte!"
	para "Ich gebe dir einen"
	line "Flame Orb,"
	para "aber sei"
	line "vorsichtig, wenn"
	cont "du ihn einem"
	cont "#MON gibst."
	done

GenericTrainerBreederJody:
	generictrainer BREEDER, JODY, EVENT_BEAT_BREEDER_JODY, BreederJodySeenText, BreederJodyBeatenText

	text "Ein Baby-#MON"
	line "kann manchmal"

	para "eine Attacke vom"
	line "Vater erben,"

	para "auch eine, die es"
	line "normalerweise"
	cont "nicht lernt."
	done

GenericTrainerSrandjrIvyandamy1:
	generictrainer SR_AND_JR, IVYANDAMY1, EVENT_BEAT_SR_AND_JR_IVY_AND_AMY, SrandjrIvyandamy1SeenText, SrandjrIvyandamy1BeatenText

	text "IVY: Meine Junior"
	line "soll nicht denken,"
	cont "ich"
	para "könnte ihr nicht"
	line "helfen."
	done

GenericTrainerSrandjrIvyandamy2:
	generictrainer SR_AND_JR, IVYANDAMY2, EVENT_BEAT_SR_AND_JR_IVY_AND_AMY, SrandjrIvyandamy2SeenText, SrandjrIvyandamy2BeatenText

	text "Amy: Ich hoffe,"
	line "meine Senior hat"

	para "gemerkt, wie hart"
	line "ich mich bemüht"
	cont "habe."
	done

GenericTrainerCamperSpencer:
	generictrainer CAMPER, SPENCER, EVENT_BEAT_CAMPER_SPENCER, CamperSpencerSeenText, CamperSpencerBeatenText

	text "Was geht da vor"
	line "sich am SEE DES"
	cont "ZORNS?"
	para "Wir wollen dort"
	line "zelten."
	done

GenericTrainerPokemaniacBen:
	generictrainer POKEMANIAC, BEN, EVENT_BEAT_POKEMANIAC_BEN, PokemaniacBenSeenText, PokemaniacBenBeatenText

	text "Du fragst, was ich"
	line "außer #MON noch"
	cont "mag?"
	para "MARGIT vom Radio!"
	line "Die ist bestimmt"
	cont "süß!"
	done

TrainerPokemaniacBrent1:
	trainer POKEMANIAC, BRENT1, EVENT_BEAT_POKEMANIAC_BRENT, PokemaniacBrent1SeenText, PokemaniacBrent1BeatenText, 0, PokemaniacBrent1Script

PokemaniacBrent1Script:
	loadvar VAR_CALLERID, PHONE_POKEMANIAC_BRENT
	opentext
	checkflag ENGINE_BRENT_READY_FOR_REMATCH
	iftruefwd .WantsBattle
	checkcellnum PHONE_POKEMANIAC_BRENT
	iftruefwd .NumberAccepted
	checkevent EVENT_BRENT_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskedAlready
	writetext PokemaniacBrentAfterBattleText
	promptbutton
	setevent EVENT_BRENT_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjumpfwd .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_POKEMANIAC_BRENT
	ifequalfwd $1, .PhoneFull
	ifequalfwd $2, .NumberDeclined
	gettrainername POKEMANIAC, BRENT1, STRING_BUFFER_3
	scall .RegisteredNumber
	sjumpfwd .NumberAccepted

.WantsBattle:
	scall .Rematch
	winlosstext PokemaniacBrent1BeatenText, 0
	readmem wBrentFightCount
	ifequalfwd 3, .Fight3
	ifequalfwd 2, .Fight2
	ifequalfwd 1, .Fight1
	ifequalfwd 0, .LoadFight0
.Fight3:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .LoadFight3
.Fight2:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd .LoadFight2
.Fight1:
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftruefwd .LoadFight1
.LoadFight0:
	loadtrainer POKEMANIAC, BRENT1
	startbattle
	reloadmapafterbattle
	loadmem wBrentFightCount, 1
	clearflag ENGINE_BRENT_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer POKEMANIAC, BRENT2
	startbattle
	reloadmapafterbattle
	loadmem wBrentFightCount, 2
	clearflag ENGINE_BRENT_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer POKEMANIAC, BRENT3
	startbattle
	reloadmapafterbattle
	loadmem wBrentFightCount, 3
	clearflag ENGINE_BRENT_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer POKEMANIAC, BRENT4
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_BRENT_READY_FOR_REMATCH
	end

.AskNumber1:
	jumpstd asknumber1m

.AskNumber2:
	jumpstd asknumber2m

.RegisteredNumber:
	jumpstd registerednumberm

.NumberAccepted:
	jumpstd numberacceptedm

.NumberDeclined:
	jumpstd numberdeclinedm

.PhoneFull:
	jumpstd phonefullm

.Rematch:
	jumpstd rematchm

GenericTrainerPokemaniacRon:
	generictrainer POKEMANIAC, RON, EVENT_BEAT_POKEMANIAC_RON, PokemaniacRonSeenText, PokemaniacRonBeatenText

	text "Für die meisten"
	line "Menschen ist es"
	para "ganz natürlich,"
	line "unterschiedliche"
	para "Arten von #MON"
	line "zu mögen."
	para "Es geht bei"
	line "#MON nicht"
	para "darum, das"
	line "Stärkste von allen"
	cont "zu haben."
	done


GenericTrainerFisherMarvin:
	generictrainer FISHER, MARVIN, EVENT_BEAT_FISHER_MARVIN, FisherMarvinSeenText, FisherMarvinBeatenText

	text "KURTs KÖDERBALL"
	line "eignet sich am"
	para "besten, #MON,"
	line "die an der Angel"
	cont "hängen,"
	cont "einzufangen."
	para "Er ist viel"
	line "effektiver als der"
	cont "HYPERBALL."
	done

TrainerPicnickerTiffany1:
	trainer PICNICKER, TIFFANY1, EVENT_BEAT_PICNICKER_TIFFANY, PicnickerTiffany1SeenText, PicnickerTiffany1BeatenText, 0, PicnickerTiffany1Script

PicnickerTiffany1Script:
	loadvar VAR_CALLERID, PHONE_PICNICKER_TIFFANY
	opentext
	checkflag ENGINE_TIFFANY_READY_FOR_REMATCH
	iftruefwd .WantsBattle
	checkflag ENGINE_TIFFANY_HAS_FAIRYFEATHER
	iftruefwd .HasFairyFeather
	checkcellnum PHONE_PICNICKER_TIFFANY
	iftruefwd .NumberAccepted
	checkpoke CLEFAIRY
	iffalsefwd .NoClefairy
	checkevent EVENT_TIFFANY_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskedAlready
	writetext PicnickerTiffanyWantsPicnicText
	promptbutton
	setevent EVENT_TIFFANY_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjumpfwd .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_PICNICKER_TIFFANY
	ifequalfwd $1, .PhoneFull
	ifequalfwd $2, .NumberDeclined
	gettrainername PICNICKER, TIFFANY1, STRING_BUFFER_3
	scall .RegisteredNumber
	sjumpfwd .NumberAccepted

.WantsBattle:
	scall .Rematch
	winlosstext PicnickerTiffany1BeatenText, 0
	readmem wTiffanyFightCount
	ifequalfwd 3, .Fight3
	ifequalfwd 2, .Fight2
	ifequalfwd 1, .Fight1
	ifequalfwd 0, .LoadFight0
.Fight3:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .LoadFight3
.Fight2:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd .LoadFight2
.Fight1:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftruefwd .LoadFight1
.LoadFight0:
	loadtrainer PICNICKER, TIFFANY1
	startbattle
	reloadmapafterbattle
	loadmem wTiffanyFightCount, 1
	clearflag ENGINE_TIFFANY_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer PICNICKER, TIFFANY2
	startbattle
	reloadmapafterbattle
	loadmem wTiffanyFightCount, 2
	clearflag ENGINE_TIFFANY_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer PICNICKER, TIFFANY3
	startbattle
	reloadmapafterbattle
	loadmem wTiffanyFightCount, 3
	clearflag ENGINE_TIFFANY_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer PICNICKER, TIFFANY4
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_TIFFANY_READY_FOR_REMATCH
	end

.HasFairyFeather:
	scall .Gift
	verbosegiveitem FAIRYFEATHER
	iffalsefwd .NoRoom
	clearflag ENGINE_TIFFANY_HAS_FAIRYFEATHER
	setevent EVENT_TIFFANY_GAVE_FAIRYFEATHER
	sjumpfwd .NumberAccepted

.NoRoom:
	sjumpfwd .PackFull

.NoClefairy:
	jumpthisopenedtext

	text "Ist mein PIEPI"
	line "nicht"
	cont "herzallerliebst?"
	done

.AskNumber1:
	jumpstd asknumber1f

.AskNumber2:
	jumpstd asknumber2f

.RegisteredNumber:
	jumpstd registerednumberf

.NumberAccepted:
	jumpstd numberacceptedf

.NumberDeclined:
	jumpstd numberdeclinedf

.PhoneFull:
	jumpstd phonefullf

.Rematch:
	jumpstd rematchf

.Gift:
	jumpstd giftf

.PackFull:
	jumpstd packfullf

PokemaniacBenSeenText:
	text "Ich liebe #MON!"
	para "Deshalb habe ich"
	line "angefangen,"
	cont "#MON zu sammeln"
	cont "und"
	para "damit werde ich"
	line "auch nicht mehr"
	cont "aufhören!"
	done







PokemaniacBenBeatenText:
	text "Wie konntest du"
	line "mir das antun?"
	done







PokemaniacBrent1SeenText:
	text "Heh! Hast du"
	line "seltene #MON?"
	done
PokemaniacBrent1BeatenText:
	text "Meine armen"
	line "#MON-Lieblinge!"
	done
PokemaniacBrentAfterBattleText:
	text "Ich wäre schon"
	line "froh, wenn ich nur"
	cont "ein einziges"
	cont "seltenes #MON"
	cont "hätte."
	done







PokemaniacRonSeenText:
	text "Stell dir mal vor!"
	para "So ein <RIVAL> hat"
	line "sich über mein"
	cont "#MON lustig"
	cont "gemacht!"
	para "Unverschämtheit!"
	line "Mein #MON ist"
	cont "toll!"
	done







PokemaniacRonBeatenText:
	text "Mein NIDOKING hat"
	line "sich wacker"
	cont "geschlagen!"
	done







FisherMarvinSeenText:
	text "Ich bin gerade"
	line "ziemlich am Boden."
	para "Vielleicht liegt"
	line "das an dem Item,"
	cont "das ich benutze."
	para "Kämpfen wir! Das"
	line "hebt vielleicht"
	cont "meine Laune!"
	done







FisherMarvinBeatenText:
	text "Ich habe verloren,"
	line "aber ich fühle"
	cont "mich trotzdem"
	cont "besser."
	done







CamperSpencerSeenText:
	text "Man kann so viel"
	line "unternehmen mit"
	cont "seinen #MON das"
	cont "macht unheimlich"
	cont "viel Spaß!"
	done







CamperSpencerBeatenText:
	text "Verlieren macht"
	line "überhaupt keinen"
	cont "Spaß…"
	done







PicnickerTiffany1SeenText:
	text "Gehst du auch zum"
	line "SEE DES ZORNS?"

	para "Lass uns ein"
	line "bisschen spielen!"
	done

PicnickerTiffany1BeatenText:
	text "Ich habe zu lange"
	line "gespielt!"
	done
PicnickerTiffanyWantsPicnicText:
	text "Ich mache ein"
	line "Picknick mit"
	cont "meinen #MON."

	para "Setz dich doch zu"
	line "uns."
	done







BreederJodySeenText:
	text "Ich habe #MON"
	line "gezüchtet, damit"

	para "sie spezielle"
	line "Attacken kennen!"
	done

BreederJodyBeatenText:
	text "Trotzdem verloren!"
	done

SrandjrIvyandamy1SeenText:
	text "IVY: Ich zeige"
	line "meiner Junior,"
	para "wie man das macht!"
	done

SrandjrIvyandamy1BeatenText:
	text "IVY: Du hast mich"
	line "vor meiner Junior"

	para "bloßgestellt…"
	done

SrandjrIvyandamy2SeenText:
	text "Amy: Ein Trainer!"
	line "Senior, bitte"

	para "hilf mir beim"
	line "Gewinnen!"
	done

SrandjrIvyandamy2BeatenText:
	text "Amy: Es hat nicht"
	line "geklappt…"
	done

Route43Sign1Text:
	; GSC-DE Dump
	text "ROUTE 43"
	para "SEE DES ZORNS -"
	line "MAHAGONIA CITY"
	done







Route43Sign2Text:
	; GSC-DE Dump
	text "ROUTE 43"
	para "SEE DES ZORNS -"
	line "MAHAGONIA CITY"
	done







Route43TrainerTipsText:
	text "TIPPS für TRAINER"

	para "Alle #MON haben"
	line "Vor- und Nach-"

	para "teile. Das hängt"
	line "ganz davon ab,"
	cont "welchem Element"
	cont "sie angehören."

	para "Sind zwei #MON"
	line "unterschiedlicher"

	para "Elemente, kann"
	line "sogar ein #MON"
	cont "verlieren, das"
	cont "einen höheren"
	cont "Level hat."

	para "Finde heraus,"
	line "welche Elemente"

	para "effektiv oder"
	line "ineffektiv gegen"
	cont "deine #MON"
	cont "sind."
	done







Route43AdvancedTipsText:
	text "Profi-Tipps!"
	para "Ein #MON kann"
	line "sein Wesen per"
	cont "Vererbung"
	para "weitergeben, wenn"
	line "es einen Everstone"
	cont "trägt!"
	para "Ein Destiny Knot"
	line "kann alle"
	cont "Potenziale"
	cont "weitergeben!"
	para "Die sechs"
	line "Power-Items"
	para "können das"
	line "Potenzial in ihrem"
	cont "einen Wert"
	cont "weitergeben!"
	para "Und eine Ability"
	line "Cap kann die"
	para "Chance erhöhen,"
	line "dass Nachkommen"
	cont "eine versteckte"
	cont "Fähigkeit haben!"
	done
