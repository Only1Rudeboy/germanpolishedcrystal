Route45_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4,  5, DARK_CAVE_BLACKTHORN_ENTRANCE, 1
	warp_event 16, 22, HIDDEN_CAVE_GROTTO, 1

	def_coord_events

	def_bg_events
	bg_event 17,  5, BGEVENT_JUMPTEXT, Route45SignText
	bg_event 17, 78, BGEVENT_ITEM + PP_UP, EVENT_ROUTE_45_HIDDEN_PP_UP
	bg_event 16, 21, BGEVENT_JUMPSTD, cavegrotto, HIDDENGROTTO_ROUTE_45

	def_object_events
	object_event 19, 75, SPRITE_DRAGON_TAMER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, 0, OBJECTTYPE_SCRIPT, 0, Route45Dragon_tamerScript, -1
	object_event  5, 59, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBattleGirlNozomi, -1
	object_event 12, 18, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerHikerErik, -1
	object_event 19, 65, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerHikerMichael, -1
	object_event  7, 28, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerHikerParry, -1
	object_event 13, 65, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerHikerTimothy, -1
	object_event 16, 50, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerBlackbeltKenji, -1
	object_event 21, 18, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCooltrainermRyan, -1
	object_event  6, 33, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerCooltrainerfKelly, -1
	fruittree_event 20, 80, FRUITTREE_ROUTE_45, LEPPA_BERRY, PAL_NPC_RED
	itemball_event  8, 51, NUGGET, 1, EVENT_ROUTE_45_NUGGET
	itemball_event  5, 66, REVIVE, 1, EVENT_ROUTE_45_REVIVE
	itemball_event  7, 20, ELIXIR, 1, EVENT_ROUTE_45_ELIXIR
	itemball_event 15, 32, MAX_POTION, 1, EVENT_ROUTE_45_MAX_POTION
	object_event  4, 70, SPRITE_CAMPER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerCamperQuentin, -1

	object_const_def
	const ROUTE45_DRAGON_TAMER

Route45Dragon_tamerScript:
	checkevent EVENT_GOT_FOCUS_SASH_FROM_ROUTE_45_LEADER
	iftrue_jumptextfaceplayer .AfterText2
	faceplayer
	checkevent EVENT_BEAT_DRAGON_TAMER_AEGON
	iftruefwd .Beaten
	checkevent EVENT_BEAT_BATTLE_GIRL_NOZOMI
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_BLACKBELT_KENJI
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_HIKER_ERIK
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_HIKER_MICHAEL
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_HIKER_PARRY
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_HIKER_TIMOTHY
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_COOLTRAINERM_RYAN
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_COOLTRAINERF_KELLY
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_CAMPER_QUENTIN
	iffalse_jumptext .IntroText
	opentext
	writetext .QuestionText
	yesorno
	iffalse_jumpopenedtext .RefusedText
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked ROUTE45_DRAGON_TAMER
	loadtrainer DRAGON_TAMER, AEGON
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_DRAGON_TAMER_AEGON
.Beaten:
	opentext
	writetext .AfterText1
	promptbutton
	verbosegiveitem FOCUS_SASH
	iffalse_endtext
	setevent EVENT_GOT_FOCUS_SASH_FROM_ROUTE_45_LEADER
	jumpthisopenedtext

.AfterText2:
	text "Die Kunst,"
	line "Drachen-#mon zu"
	cont "trainieren, ist"
	cont "einfach toll."
	para "Du solltest auch"
	line "ein"
	cont "Drachenbändiger"
	cont "werden."
	done

.IntroText:
	text "Ich trainiere hier"
	line "meine Drachen."
	para "Hm? Ein Kampf? Ich"
	line "will einen"
	para "guten, also"
	line "beweise mir, dass"
	cont "du stark bist."
	para "Besiege alle"
	line "Trainer auf dieser"
	cont "Route,"
	para "dann kämpfe ich"
	line "gegen dich."
	done

.QuestionText:
	text "Ach, du bist"
	line "bereit. Zeit für"
	cont "ein Duell:"

	para "deine #mon"
	line "gegen meine"
	cont "Drachen."

	para "Sollen wir jetzt"
	line "anfangen?"
	done

.RefusedText:
	text "Kein Problem. Ich"
	line "trainiere weiter."
	done

.SeenText:
	text "Mal sehen, ob du"
	line "mit dem unerbitt-"

	para "lichen Fokus"
	line "meiner Drachen"
	cont "klarkommst. Los,"
	cont "Dragoran!"
	done

.BeatenText:
	text "Wie mächtig! Meine"
	line "#mon waren dir"
	cont "nicht gewachsen."
	done

.AfterText1:
	text "Deine Stärke"
	line "gleicht meiner!"

	para "Nimm das. Du hast"
	line "es verdient."
	done

GenericTrainerBattleGirlNozomi:
	generictrainer BATTLE_GIRL, NOZOMI, EVENT_BEAT_BATTLE_GIRL_NOZOMI, BattleGirlNozomiSeenText, BattleGirlNozomiBeatenText

	text "Danke für das"
	line "Training, <PLAYER>!"
	done

TrainerBlackbeltKenji:
	trainer BLACKBELT_T, KENJI1, EVENT_BEAT_BLACKBELT_KENJI, BlackbeltKenji1SeenText, BlackbeltKenji1BeatenText, 0, BlackbeltKenji1Script

BlackbeltKenji1Script:
	loadvar VAR_CALLERID, PHONE_BLACKBELT_KENJI
	opentext
	checkcellnum PHONE_BLACKBELT_KENJI
	iftruefwd .Registered
	checkevent EVENT_KENJI_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskedAlready
	special Special_SampleKenjiBreakCountdown
	writetext BlackbeltKenjiAfterBattleText
	waitbutton
	setevent EVENT_KENJI_ASKED_FOR_PHONE_NUMBER
	scall Route45AskNumber1M
	sjumpfwd .AskForNumber

.AskedAlready:
	scall Route45AskNumber2M
.AskForNumber:
	askforphonenumber PHONE_BLACKBELT_KENJI
	ifequalfwd $1, Route45PhoneFullM
	ifequalfwd $2, Route45NumberDeclinedM
	gettrainername BLACKBELT_T, KENJI1, STRING_BUFFER_3
	scall Route45RegisteredNumberM
	sjumpfwd Route45NumberAcceptedM

.Registered:
	readvar VAR_KENJI_BREAK
	ifnotequal $1, Route45NumberAcceptedM
	checktime 1 << MORN
	iftruefwd .Morning
	checktime (1 << EVE) | (1 << NITE)
	iftruefwd .Night
	checkevent EVENT_KENJI_ON_BREAK
	iffalsefwd Route45NumberAcceptedM
	scall Route45GiftM
	verbosegiveitem PP_UP
	iffalsefwd .NoRoom
	clearevent EVENT_KENJI_ON_BREAK
	special Special_SampleKenjiBreakCountdown
	sjumpfwd Route45NumberAcceptedM

.Morning:
	jumpthisopenedtext

	text "Ich trainiere noch"
	line "ein wenig bis zur"
	cont "Mittagspause."
	done
.Night:
	jumpthisopenedtext

	text "Wir hatten alle"
	line "eine ausgedehnte"

	para "Mittagspause und"
	line "sind wieder fit!"

	para "Wir setzen das"
	line "Training fort!"
	done
.NoRoom:
	sjumpfwd Route45PackFullM

Route45AskNumber1M:
	end







Route45AskNumber2M:
	end







Route45RegisteredNumberM:
	end







Route45NumberAcceptedM:
	end







Route45NumberDeclinedM:
	end







Route45PhoneFullM:
	end







Route45RematchM:
	end







Route45GiftM:
	end







Route45PackFullM:
	end







HikerParryHasIron:
	setevent EVENT_PARRY_IRON
	jumpstd packfullm
	end

Route45RematchGiftM:
	end







GenericTrainerHikerErik:
	generictrainer HIKER, ERIK, EVENT_BEAT_HIKER_ERIK, HikerErikSeenText, HikerErikBeatenText

	text "Ich gehe zum"
	line "EISPFAD bei"
	para "EBENHOLZ CITY,"
	line "um etwas mehr"
	cont "zu trainieren."
	done

GenericTrainerHikerMichael:
	generictrainer HIKER, MICHAEL, EVENT_BEAT_HIKER_MICHAEL, HikerMichaelSeenText, HikerMichaelBeatenText

	text "Mensch, wie ich"
	line "diese KP-PLUS"
	cont "liebe! Mm, lecker!"
	para "Ich trinke immer"
	line "die von meinen"
	cont "#mon!"
	para "Ich kann nichts"
	line "dagegen tun!"
	done

TrainerHikerParry:
	trainer HIKER, PARRY1, EVENT_BEAT_HIKER_PARRY, HikerParry1SeenText, HikerParry1BeatenText, 0, HikerParry1Script

HikerParry1Script:
	loadvar VAR_CALLERID, PHONE_HIKER_PARRY
	opentext
	checkflag ENGINE_PARRY_READY_FOR_REMATCH
	iftruefwd .WantsBattle
	checkcellnum PHONE_HIKER_PARRY
	iftrue Route45NumberAcceptedM
	checkevent EVENT_PARRY_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskedAlready
	writetext HikerParryAfterBattleText
	promptbutton
	setevent EVENT_PARRY_ASKED_FOR_PHONE_NUMBER
	scall Route45AskNumber1M
	sjumpfwd .AskForNumber

.AskedAlready:
	scall Route45AskNumber2M
.AskForNumber:
	askforphonenumber PHONE_HIKER_PARRY
	ifequal $1, Route45PhoneFullM
	ifequal $2, Route45NumberDeclinedM
	gettrainername HIKER, PARRY1, STRING_BUFFER_3
	scall Route45RegisteredNumberM
	sjump Route45NumberAcceptedM

.WantsBattle:
	scall Route45RematchM
	winlosstext HikerParry1BeatenText, 0
	readmem wParryFightCount
	ifequalfwd 2, .Fight2
	ifequalfwd 1, .Fight1
	ifequalfwd 0, .LoadFight0
.Fight2:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .LoadFight2
.Fight1:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd .LoadFight1
.LoadFight0:
	loadtrainer HIKER, PARRY1
	startbattle
	reloadmapafterbattle
	loadmem wParryFightCount, 1
	clearflag ENGINE_PARRY_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer HIKER, PARRY2
	startbattle
	reloadmapafterbattle
	loadmem wParryFightCount, 2
	clearflag ENGINE_PARRY_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer HIKER, PARRY3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_PARRY_READY_FOR_REMATCH
	checkevent EVENT_PARRY_IRON
	iftruefwd .HasIron
	checkevent EVENT_GOT_IRON_FROM_PARRY
	iftruefwd .GotIron
	scall Route45RematchGiftM
	verbosegiveitem IRON
	iffalse HikerParryHasIron
	setevent EVENT_GOT_IRON_FROM_PARRY
	sjump Route45NumberAcceptedM

.GotIron:
	end

.HasIron:
	opentext
	writetext HikerParryGivesIronText
	waitbutton
	verbosegiveitem IRON
	iffalse HikerParryHasIron
	clearevent EVENT_PARRY_IRON
	setevent EVENT_GOT_IRON_FROM_PARRY
	sjump Route45NumberAcceptedM

GenericTrainerHikerTimothy:
	generictrainer HIKER, TIMOTHY, EVENT_BEAT_HIKER_TIMOTHY, HikerTimothySeenText, HikerTimothyBeatenText

	text "#mon zu"
	line "entdecken, war das"
	para "Beste, was mir"
	line "passieren konnte."
	done

GenericTrainerCooltrainermRyan:
	generictrainer COOLTRAINERM, RYAN, EVENT_BEAT_COOLTRAINERM_RYAN, CooltrainermRyanSeenText, CooltrainermRyanBeatenText

	text "Wie ich sehe,"
	line "ziehst du deine"
	cont "#mon mit"
	cont "Sorgfalt auf."

	para "Die Gemeinschaft,"
	line "die du bildest,"
	cont "wird dich in"
	cont "gefährlichen"
	cont "Situationen"
	cont "retten."
	done

GenericTrainerCooltrainerfKelly:
	generictrainer COOLTRAINERF, KELLY, EVENT_BEAT_COOLTRAINERF_KELLY, CooltrainerfKellySeenText, CooltrainerfKellyBeatenText

	text "Ich mag keine"
	line "übermäßig starken"
	cont "Attacken."
	para "Ich will gewinnen,"
	line "aber ich möchte"
	cont "dabei keine"
	cont "#mon ver-"
	cont "letzen."
	done

GenericTrainerCamperQuentin:
	generictrainer CAMPER, QUENTIN, EVENT_BEAT_CAMPER_QUENTIN, CamperQuentinSeenText, CamperQuentinBeatenText

	text "Warst du schon im"
	line "DUELLTURM?"
	para "Ich verliere dort"
	line "niemals, aber…"
	done

BattleGirlNozomiSeenText:
	text "Hier hat kein"
	line "schwaches #mon"
	cont "etwas zu suchen!"
	done

BattleGirlNozomiBeatenText:
	text "Was für ein Kampf!"
	done

HikerErikSeenText:
	text "Sei auf alles"
	line "vorbereitet!"
	para "Lass mich mal"
	line "sehen, wie gut"
	cont "deine #mon"
	cont "trainiert sind!"
	done







HikerErikBeatenText:
	text "Oh, ich habe"
	line "verloren!"
	done







HikerMichaelSeenText:
	text "He! Du hast Mumm"
	line "in den Knochen!"
	cont "Aber weißt du was?"
	para "Wenn es um echte"
	line "Courage geht, bin"
	cont "ich der Mann!"
	done







HikerMichaelBeatenText:
	text "Meine #mon"
	line "waren leider nicht"
	cont "couragiert genug!"
	done







HikerParry1SeenText:
	text "Meine #mon"
	line "sind voller"
	cont "Energie!"
	done

HikerParry1BeatenText:
	text "Ojemine! Ich bin"
	line "der große"
	cont "Verlierer!"
	done
HikerParryAfterBattleText:
	text "Ich bin eher"
	line "langsam, was das"
	cont "Denken betrifft,"
	cont "weißt du?"
	para "Deswegen setze ich"
	line "alles auf Kraft."
	done







HikerTimothySeenText:
	text "Warum ich auf"
	line "Berge klettere?"
	para "Weil es sie"
	line "gibt."
	para "Warum ich"
	line "#mon trainiere?"
	para "Weil es sie"
	line "gibt!"
	done







HikerTimothyBeatenText:
	text "Niederlagen…"
	line "Die gibt es auch!"
	done







HikerParryGivesIronText:
	text "Ich weiß nicht,"
	line "wie ich gewinnen"
	cont "kann!"
	para "Mach weiter!"
	para "Oh, und nimm dies"
	line "- dies ist das"
	para "Geschenk, das du"
	line "beim letzten Mal"
	para "nicht mitnehmen"
	line "konntest."
	done







BlackbeltKenji1SeenText:
	text "Ich habe hier"
	line "ganz allein"
	cont "trainiert."
	para "Sieh die Früchte"
	line "meiner Arbeit!"
	done

BlackbeltKenji1BeatenText:
	text "Aahh!"
	done

BlackbeltKenjiAfterBattleText:
	text "Das schreit nach"
	line "extremen"
	cont "Maßnahmen."
	para "Ich ziehe mich"
	line "zurück in die"
	cont "Berge, um mich im"
	cont "Alleinsein zu"
	cont "üben."
	done







CooltrainermRyanSeenText:
	text "Was hältst du vom"
	line "#mon-Training?"
	done







CooltrainermRyanBeatenText:
	text "Du verdienst meine"
	line "ganze Hochachtung."
	done







CooltrainerfKellySeenText:
	text "Welche Kampf-"
	line "technik verwendest"
	cont "du?"
	para "Setze starke"
	line "Attacken nicht"
	cont "völlig willkürlich"
	cont "ein!"
	done







CooltrainerfKellyBeatenText:
	text "Gut. Dann habe ich"
	line "eben verloren."
	done







CamperQuentinSeenText:
	text "Ich bin wirklich"
	line "stark!"
	para "Gibt es hier"
	line "die Möglichkeit"
	cont "meine Stärke zu"
	cont "beweisen?"
	done







CamperQuentinBeatenText:
	text "Ich habe im DUELL-"
	line "TURM gut gekämpft…"
	done







Route45SignText:
	text "ROUTE 45"
	line "BERGWEG VORAUS"
	done







