NationalPark_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 35, 18, ROUTE_36_NATIONAL_PARK_GATE, 1
	warp_event 35, 19, ROUTE_36_NATIONAL_PARK_GATE, 2
	warp_event 12, 47, ROUTE_35_NATIONAL_PARK_GATE, 1
	warp_event 13, 47, ROUTE_35_NATIONAL_PARK_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 16, 44, BGEVENT_JUMPTEXT, NationalParkRelaxationSquareText
	bg_event 29, 31, BGEVENT_JUMPTEXT, NationalParkBattleNoticeText
	bg_event 14,  4, BGEVENT_JUMPTEXT, NationalParkTrainerTipsText
	bg_event  8, 47, BGEVENT_ITEM + FULL_HEAL, EVENT_NATIONAL_PARK_HIDDEN_FULL_HEAL

	def_object_events
	object_event 17, 24, SPRITE_PICNICKER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, NationalParkLassText, -1
	object_event 16,  4, SPRITE_MATRON, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, NationalParkPokefanFText, -1
	object_event 29, 40, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, NationalParkTeacher1Script, -1
	object_event 28,  6, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, NationalParkGameboyKidScript, -1
	object_event 13, 41, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 0, GenericTrainerSchoolgirlEliza, -1
	object_event 12, 41, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 0, GenericTrainerSchoolboyJohnny, -1
	object_event 19, 41, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WANDER, 2, 1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, NationalParkTeacher2Text, -1
	pokemon_event 28, 40, PERSIAN, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BROWN, NationalParkPersianText, -1
	object_event 29, 23, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyJack1, -1
	object_event 20, 29, SPRITE_POKEFAN_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerPokefanfBeverly1, -1
	object_event 18,  9, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerPokefanmWilliam, -1
	object_event 10, 14, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerLassKrise, -1
	object_event 28, 13, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBugManiacLou, -1
	object_event  4, 19, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, OfficermKeithScript, -1
	itemball_event 37, 12, SHINY_STONE, 1, EVENT_NATIONAL_PARK_SHINY_STONE
	tmhmball_event  3, 43, TM_DIG, EVENT_NATIONAL_PARK_TM_DIG

NationalParkTeacher1Script:
	faceplayer
	opentext
	checkevent EVENT_GOT_QUICK_CLAW
	iftruefwd .GotQuickClaw
	writetext NationalParkTeacher1Text
	promptbutton
	verbosegiveitem QUICK_CLAW
	iffalsefwd .NoRoom
	setevent EVENT_GOT_QUICK_CLAW
.GotQuickClaw:
	writetext NationalParkTeacher1Text_GotQuickClaw
	waitbutton
.NoRoom:
	endtext

OfficermKeithScript:
	checktime 1 << NITE
	iffalse_jumptextfaceplayer OfficermKeithDaytimeText
	checkevent EVENT_BEAT_OFFICERM_KEITH
	iftrue_jumptextfaceplayer OfficermKeithAfterText
	faceplayer
	opentext
	special SaveMusic
	playmusic MUSIC_OFFICER_ENCOUNTER
	writetext OfficermKeithSeenText
	waitbutton
	closetext
	winlosstext OfficermKeithWinText, 0
	loadtrainer OFFICERM, KEITH
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_OFFICERM_KEITH
	endtext

GenericTrainerBugManiacLou:
	generictrainer BUG_MANIAC, LOU, EVENT_BEAT_BUG_MANIAC_LOU, BugManiacLouSeenText, BugManiacLouBeatenText

	text "Früher war ich nur"
	line "ein Käfer-"
	cont "Sammler,"

	para "doch ich hab mich"
	line "zum Käfer-Maniac"
	cont "entwickelt!"
	done

GenericTrainerSchoolgirlEliza:
	generictrainer SCHOOLGIRL, ELIZA, EVENT_BEAT_SCHOOLGIRL_ELIZA, SchoolgirlElizaSeenText, SchoolgirlElizaBeatenText

	text "Das ist mir egal!"
	line "Ich liebe Myrapla"
	cont "trotzdem!"
	done

GenericTrainerSchoolboyJohnny:
	generictrainer SCHOOLBOY, JOHNNY, EVENT_BEAT_SCHOOLBOY_JOHNNY, SchoolboyJohnnySeenText, SchoolboyJohnnyBeatenText

	text "Na ja, ich mag"
	line "Sonnkern trotzdem"
	cont "lieber!"
	done

NationalParkGameboyKidScript:
	showtextfaceplayer NationalParkGameboyKidText
	turnobject LAST_TALKED, DOWN
	end

TrainerSchoolboyJack1:
	trainer SCHOOLBOY, JACK1, EVENT_BEAT_SCHOOLBOY_JACK, SchoolboyJack1SeenText, SchoolboyJack1BeatenText, 0, SchoolboyJack1Script

SchoolboyJack1Script:
	loadvar VAR_CALLERID, PHONE_SCHOOLBOY_JACK
	opentext
	checkflag ENGINE_JACK_READY_FOR_REMATCH
	iftruefwd .Rematch
	checkcellnum PHONE_SCHOOLBOY_JACK
	iftruefwd .NumberAccepted
	checkevent EVENT_JACK_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskAgain
	writetext SchoolboyJackTradeMonText
	promptbutton
	setevent EVENT_JACK_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjumpfwd .RequestNumber

.AskAgain:
	scall .AskNumber2
.RequestNumber:
	askforphonenumber PHONE_SCHOOLBOY_JACK
	ifequalfwd $1, .PhoneFull
	ifequalfwd $2, .NumberDeclined
	gettrainername SCHOOLBOY, JACK1, STRING_BUFFER_3
	scall .RegisteredNumber
	sjumpfwd .NumberAccepted

.Rematch:
	scall .RematchStd
	winlosstext SchoolboyJack1BeatenText, 0
	readmem wJackFightCount
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
	checkflag ENGINE_FLYPOINT_OLIVINE
	iftruefwd .LoadFight1
.LoadFight0:
	loadtrainer SCHOOLBOY, JACK1
	startbattle
	reloadmapafterbattle
	loadmem wJackFightCount, 1
	clearflag ENGINE_JACK_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer SCHOOLBOY, JACK2
	startbattle
	reloadmapafterbattle
	loadmem wJackFightCount, 2
	clearflag ENGINE_JACK_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer SCHOOLBOY, JACK3
	startbattle
	reloadmapafterbattle
	loadmem wJackFightCount, 3
	clearflag ENGINE_JACK_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer SCHOOLBOY, JACK4
	startbattle
	reloadmapafterbattle
	loadmem wJackFightCount, 4
	clearflag ENGINE_JACK_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer SCHOOLBOY, JACK5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_JACK_READY_FOR_REMATCH
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

.RematchStd:
	jumpstd rematchm

GenericTrainerPokefanmWilliam:
	generictrainer POKEFANM, WILLIAM, EVENT_BEAT_POKEFANM_WILLIAM, PokefanmWilliamSeenText, PokefanmWilliamBeatenText

	text "Ich habe zwar den"
	line "Kampf verloren,"

	para "aber meine #mon"
	line "gewinnen den"
	cont "Schönheitspreis."
	done
TrainerPokefanfBeverly1:
	trainer POKEFANF, BEVERLY1, EVENT_BEAT_POKEFANF_BEVERLY, PokefanfBeverly1SeenText, PokefanfBeverly1BeatenText, 0, PokefanfBeverly1Script

PokefanfBeverly1Script:
	loadvar VAR_CALLERID, PHONE_POKEFAN_BEVERLY
	opentext
	checkflag ENGINE_BEVERLY_HAS_NUGGET
	iftruefwd .GiveNugget
	checkcellnum PHONE_POKEFAN_BEVERLY
	iftruefwd .NumberAccepted
	checkpoke MARILL
	iffalsefwd .NoMarill
	checkevent EVENT_BEVERLY_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskAgain
	writetext PokefanBeverlyCuteMonText
	promptbutton
	setevent EVENT_BEVERLY_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjumpfwd .RequestNumber

.AskAgain:
	scall .AskNumber2
.RequestNumber:
	askforphonenumber PHONE_POKEFAN_BEVERLY
	ifequalfwd $1, .PhoneFull
	ifequalfwd $2, .NumberDeclined
	gettrainername POKEFANF, BEVERLY1, STRING_BUFFER_3
	scall .RegisteredNumber
	sjumpfwd .NumberAccepted

.GiveNugget:
	scall .Gift
	verbosegiveitem NUGGET
	iffalsefwd .NoRoom
	clearflag ENGINE_BEVERLY_HAS_NUGGET
	sjumpfwd .NumberAccepted

.NoRoom:
	sjumpfwd .PackFull

.NoMarill:
	jumpthisopenedtext

	text "Mein Freund hat"
	line "ein MARILL!"

	para "Ich finde es"
	line "liebenswert."

	para "Ich hätte gerne"
	line "selbst ein MARILL…"
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

.Gift:
	jumpstd giftf

.PackFull:
	jumpstd packfullf

GenericTrainerLassKrise:
	generictrainer LASS, KRISE, EVENT_BEAT_LASS_KRISE, LassKriseSeenText, LassKriseBeatenText

	text "Ich dachte, du"
	line "starrst mich an,"
	cont "weil ich süß bin!"
	done
NationalParkLassText:
	text "Sieh dir meine"
	line "Tasche an!"

	para "Ich habe meine"
	line "Lieblinge aus dem"

	para "#dex gedruckt"
	line "und auf meine"
	cont "Tasche geklebt."
	done


NationalParkPokefanFText:
	text "Das ist ein BRIEF"
	line "von meiner"
	cont "Tochter. Das macht"
	cont "mir Freude."
	done


NationalParkTeacher1Text:
	text "Pass bitte auf!"

	para "…Ach, ich muss"
	line "aufhören, immer"

	para "wie ein Lehrer zu"
	line "denken."

	para "Du musst ein"
	line "#mon-Trainer"
	cont "sein."

	para "Da du so hart"
	line "arbeitest, möchte"

	para "ich dir dies"
	line "überreichen."
	done


NationalParkTeacher1Text_GotQuickClaw:
	text "Gib die FLINKKLAUE"
	line "einem #mon."

	para "Manchmal erhält es"
	line "durch sie die"
	cont "Initiative."
	done


SchoolgirlElizaSeenText:
	text "Myrapla ist ein-"
	line "fach das Süßeste!"

	para "Findest du nicht"
	line "auch?"
	done

SchoolgirlElizaBeatenText:
	text "Mein armes"
	line "Myrapla…"
	done

SchoolboyJohnnySeenText:
	text "Sonnkern ist ein-"
	line "fach das Coolste!"

	para "Habe ich recht?"
	done

SchoolboyJohnnyBeatenText:
	text "Sonnkern, nein…"
	done

NationalParkTeacher2Text:
	text "Ich gehe oft im"
	line "PARK spazieren,"

	para "aber ich meide das"
	line "hohe Gras."

	para "Trainer möchten"
	line "immer kämpfen…"
	done


NationalParkPersianText:
	text "SNOBILIKAT: Fauch!"
	done


NationalParkGameboyKidText:
	text "Ich drucke meinen"
	line "#dex aus."

	para "Du kannst auch"
	line "BRIEFE oder"

	para "PC-BOXEN"
	line "ausdrucken."
	done


SchoolboyJack1SeenText:
	text "Die #mon-Welt"
	line "bietet dir viel."

	para "Es gibt noch viele"
	line "Dinge, über die"
	cont "wir nichts wissen."

	para "Aber ich weiß mehr"
	line "als du!"
	done


SchoolboyJack1BeatenText:
	text "Wa-Wa-Was?"
	done


SchoolboyJackTradeMonText:
	text "Man kann noch viel"
	line "lernen."

	para "Zum Beispiel…"

	para "Es gibt"
	line "{d:NUM_TMS}"
	cont "verschiedene TMs."

	para "Getauschte #mon"
	line "erhalten mehr"
	cont "Erfahrungspunkte."
	done


PokefanfBeverly1SeenText:
	text "Meine #mon sind"
	line "entzückend."

	para "Ich will dir"
	line "sagen, wie stolz"
	cont "sie mich machen."
	done


PokefanfBeverly1BeatenText:
	text "Was Stolz angeht,"
	line "kann ich dich"
	cont "schlagen, aber…"
	done


PokefanBeverlyCuteMonText:
	text "Ich muss zugeben,"
	line "dass deine #mon"
	cont "auch süß sind."
	done


PokefanmWilliamSeenText:
	text "Wir bewundern"
	line "unsere #mon,"
	cont "auch wenn sie uns"
	cont "nicht mögen."

	para "Das macht eben den"
	line "wahren FAN aus."
	done


PokefanmWilliamBeatenText:
	text "Mei-Mein #mon!"
	done


LassKriseSeenText:
	text "Was ist? Warum"
	line "starrst du mich so"
	cont "an?"

	para "Ach, ein Kampf?"
	done


LassKriseBeatenText:
	text "…Hmmm…"
	done


BugManiacLouSeenText:
	text "Niemand toppt"
	line "meine Liebe zu"
	cont "Käfer-#mon!"
	done

BugManiacLouBeatenText:
	text "Wie kann das"
	line "sein?!"
	done

OfficermKeithSeenText:
	text "Halt! Was machst"
	line "du so spät"
	cont "draußen?"
	done

OfficermKeithWinText:
	text "Du kannst dich gut"
	line "wehren!"
	done

OfficermKeithAfterText:
	text "Der Park bleibt"
	line "nachts offen,"

	para "weil Polizisten"
	line "wie ich ihn sicher"
	cont "halten!"
	done

OfficermKeithDaytimeText:
	text "Genießt du den"
	line "Park?"

	para "Nimm immer ein"
	line "#mon mit,"

	para "wenn du ins hohe"
	line "Gras gehst!"
	done

NationalParkRelaxationSquareText:
	text "ERHOLUNGSORT"
	line "NATIONALPARK"
	done


NationalParkBattleNoticeText:
	text "Was steht denn"
	line "hier?"

	para "Kämpfe sind nur im"
	line "Gras gestattet."

	para "NATIONALPARK BÜRO"
	line "DES WÄCHTERs"
	done


NationalParkTrainerTipsText:
	text "TIPPS für TRAINER"

	para "Möchtest du deine"
	line "BRIEFE drucken,"
	cont "öffne sie und"
	cont "drücke START."
	done


