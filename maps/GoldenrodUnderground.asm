GoldenrodUnderground_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, GoldenrodUndergroundResetSwitches
	callback MAPCALLBACK_TILES, GoldenrodUndergroundCheckBasementKey
	callback MAPCALLBACK_OBJECTS, GoldenrodUndergroundCheckDayOfWeek

	def_warp_events
	warp_event  1,  2, GOLDENROD_UNDERGROUND_ENTRANCES, 4
	warp_event  1, 38, GOLDENROD_UNDERGROUND_ENTRANCES, 1
	warp_event 16,  6, GOLDENROD_UNDERGROUND, 4
	warp_event 17, 23, GOLDENROD_UNDERGROUND, 3
	warp_event 18, 23, GOLDENROD_UNDERGROUND, 3
	warp_event 18, 19, GOLDENROD_UNDERGROUND_SWITCH_ROOM, 1
	warp_event 19, 36, GOLDENROD_UNDERGROUND_ENTRANCES, 7

	def_coord_events

	def_bg_events
	bg_event 16,  6, BGEVENT_READ, BasementDoorScript
	bg_event 17,  6, BGEVENT_JUMPTEXT, GoldenrodUndergroundNoEntryText
	bg_event  4, 17, BGEVENT_ITEM + PARALYZEHEAL, EVENT_GOLDENROD_UNDERGROUND_HIDDEN_PARALYZEHEAL
	bg_event  2, 22, BGEVENT_ITEM + SUPER_POTION, EVENT_GOLDENROD_UNDERGROUND_HIDDEN_SUPER_POTION
	bg_event 15,  8, BGEVENT_ITEM + ANTIDOTE, EVENT_GOLDENROD_UNDERGROUND_HIDDEN_ANTIDOTE
	bg_event 20, 31, BGEVENT_ITEM + X_SP_ATK, EVENT_GOLDENROD_UNDERGROUND_HIDDEN_X_SP_ATK

	def_object_events
	object_event  5, 15, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BargainMerchantScript, EVENT_GOLDENROD_UNDERGROUND_GRAMPS
	object_event  5, 18, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OlderHaircutBrotherScript, EVENT_GOLDENROD_UNDERGROUND_OLDER_HAIRCUT_BROTHER
	object_event  5, 19, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, YoungerHaircutBrotherScript, EVENT_GOLDENROD_UNDERGROUND_YOUNGER_HAIRCUT_BROTHER
	object_event  5, 25, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BitterMerchantScript, EVENT_GOLDENROD_UNDERGROUND_GRANNY
	object_event 13, 29, SPRITE_PIERS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, PiersScript, -1
	object_event  3, 35, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSupernerdEric, -1
	object_event  4,  9, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSupernerdTeru, -1
	object_event  1, 31, SPRITE_POKEMANIAC, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerPokemaniacIssac, -1
	object_event  0,  6, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPokemaniacDonald, -1
	object_event  8, 31, SPRITE_COSPLAYER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerCosplayerClara, -1
	object_event 14, 29, SPRITE_PIDGEOTTO_SIDE, SPRITEMOVEDATA_MICROPHONE, 0, 0, -1, PAL_NPC_EMOTE_GRAY, OBJECTTYPE_COMMAND, jumptextfaceplayer, PiersMicrophoneText, -1
	object_event  5, 11, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BLACK, OBJECTTYPE_SCRIPT, 0, GoldenrodUndergroundCandyManScript, -1
	keyitemball_event  5, 28, COIN_CASE, EVENT_GOLDENROD_UNDERGROUND_COIN_CASE

	object_const_def
	const GOLDENRODUNDERGROUND_GRAMPS
	const GOLDENRODUNDERGROUND_SUPER_NERD5
	const GOLDENRODUNDERGROUND_SUPER_NERD6
	const GOLDENRODUNDERGROUND_GRANNY
	const GOLDENRODUNDERGROUND_PIERS

GoldenrodUndergroundResetSwitches:
	setevent EVENT_DOOR_1_OPEN
	setevent EVENT_DOOR_2_OPEN
	setevent EVENT_DOOR_3_OPEN
	setevent EVENT_DOOR_4_OPEN
	setevent EVENT_DOOR_5_OPEN
	setevent EVENT_DOOR_6_OPEN
	clearevent EVENT_DOOR_7_OPEN
	clearevent EVENT_DOOR_8_OPEN
	setevent EVENT_DOOR_9_OPEN
	setevent EVENT_DOOR_10_OPEN
	clearevent EVENT_DOOR_11_OPEN
	endcallback

GoldenrodUndergroundCheckBasementKey:
	checkevent EVENT_USED_BASEMENT_KEY
	iffalsefwd .LockBasementDoor
	endcallback

.LockBasementDoor:
	changeblock 16, 6, $3d
	endcallback

GoldenrodUndergroundCheckDayOfWeek:
	readvar VAR_WEEKDAY
	ifequalfwd MONDAY, .Monday
	ifequalfwd TUESDAY, .Tuesday
	ifequalfwd WEDNESDAY, .Wednesday
	ifequalfwd THURSDAY, .Thursday
	ifequalfwd FRIDAY, .Friday
	ifequalfwd SATURDAY, .Saturday

.Sunday:
	disappear GOLDENRODUNDERGROUND_GRAMPS
	disappear GOLDENRODUNDERGROUND_SUPER_NERD5
	appear GOLDENRODUNDERGROUND_SUPER_NERD6
	appear GOLDENRODUNDERGROUND_GRANNY
	endcallback

.Monday:
	disappear GOLDENRODUNDERGROUND_GRAMPS
	checktime 1 << MORN
	iffalsefwd .NotMondayMorning
	appear GOLDENRODUNDERGROUND_GRAMPS
.NotMondayMorning:
	disappear GOLDENRODUNDERGROUND_SUPER_NERD5
	disappear GOLDENRODUNDERGROUND_SUPER_NERD6
	disappear GOLDENRODUNDERGROUND_GRANNY
	endcallback

.Tuesday:
	disappear GOLDENRODUNDERGROUND_GRAMPS
	appear GOLDENRODUNDERGROUND_SUPER_NERD5
	disappear GOLDENRODUNDERGROUND_SUPER_NERD6
	disappear GOLDENRODUNDERGROUND_GRANNY
	endcallback

.Wednesday:
	disappear GOLDENRODUNDERGROUND_GRAMPS
	disappear GOLDENRODUNDERGROUND_SUPER_NERD5
	appear GOLDENRODUNDERGROUND_SUPER_NERD6
	disappear GOLDENRODUNDERGROUND_GRANNY
	endcallback

.Thursday:
	disappear GOLDENRODUNDERGROUND_GRAMPS
	appear GOLDENRODUNDERGROUND_SUPER_NERD5
	disappear GOLDENRODUNDERGROUND_SUPER_NERD6
	disappear GOLDENRODUNDERGROUND_GRANNY
	endcallback

.Friday:
	disappear GOLDENRODUNDERGROUND_GRAMPS
	disappear GOLDENRODUNDERGROUND_SUPER_NERD5
	appear GOLDENRODUNDERGROUND_SUPER_NERD6
	disappear GOLDENRODUNDERGROUND_GRANNY
	endcallback

.Saturday:
	disappear GOLDENRODUNDERGROUND_GRAMPS
	appear GOLDENRODUNDERGROUND_SUPER_NERD5
	disappear GOLDENRODUNDERGROUND_SUPER_NERD6
	appear GOLDENRODUNDERGROUND_GRANNY
	endcallback

GenericTrainerSupernerdEric:
	generictrainer SUPER_NERD, ERIC, EVENT_BEAT_SUPER_NERD_ERIC, SupernerdEricSeenText, SupernerdEricBeatenText

	; GSC-DE Dump
	text "Ich glaube, dass"
	line "ich lieber fair"
	cont "spielen sollte…"
	done

GenericTrainerSupernerdTeru:
	generictrainer SUPER_NERD, TERU, EVENT_BEAT_SUPER_NERD_TERU, SupernerdTeruSeenText, SupernerdTeruBeatenText

	; GSC-DE Dump
	text "Ich kenne die"
	line "Stärken und"
	cont "Schwächen meiner"
	cont "#MON."
	para "Aber ich setze nur"
	line "einen #MON-Typ"
	cont "ein."
	done

GenericTrainerPokemaniacIssac:
	generictrainer POKEMANIAC, ISSAC, EVENT_BEAT_POKEMANIAC_ISSAC, PokemaniacIssacSeenText, PokemaniacIssacBeatenText

	; GSC-DE Dump
	text "Deine #MON"
	line "mögen dich mehr,"
	para "wenn du sie zum"
	line "Coiffeur bringst."
	done

GenericTrainerPokemaniacDonald:
	generictrainer POKEMANIAC, DONALD, EVENT_BEAT_POKEMANIAC_DONALD, PokemaniacDonaldSeenText, PokemaniacDonaldBeatenText

	; GSC-DE Dump
	text "Erstellst du einen"
	line "#DEX? Ich habe"
	cont "einen heißen"
	cont "Tipp für dich."
	para "WANDERER TOM auf"
	line "ROUTE 33 ist sehr"
	cont "freundlich."
	para "Er ruft dich an,"
	line "wenn er seltene"
	cont "#MON sieht."
	done

GenericTrainerCosplayerClara:
	generictrainer COSPLAYER, CLARA, EVENT_BEAT_COSPLAYER_CLARA, CosplayerClaraSeenText, CosplayerClaraBeatenText

	text "Ich hab dieses"
	line "Kostüm selbst"
	cont "gemacht!"
	done

BitterMerchantScript:
	readvar VAR_WEEKDAY
	ifequalfwd SUNDAY, .Open
	ifequalfwd SATURDAY, .Open
	jumptext GoldenrodUndergroundWeAreNotOpenTodayText

.Open:
	pokemart MARTTYPE_BITTER, MART_UNDERGROUND

BargainMerchantScript:
	checkflag ENGINE_GOLDENROD_UNDERGROUND_MERCHANT_CLOSED
	iftrue_jumptext GoldenrodUndergroundWeAreNotOpenTodayText
	readvar VAR_WEEKDAY
	ifequalfwd MONDAY, .CheckMorn
	jumptext GoldenrodUndergroundWeAreNotOpenTodayText

.CheckMorn:
	checktime 1 << MORN
	iffalse_jumptext GoldenrodUndergroundWeAreNotOpenTodayText
	pokemart MARTTYPE_BARGAIN, 0

OlderHaircutBrotherScript:
	readvar VAR_WEEKDAY
	ifequalfwd TUESDAY, .DoHaircut
	ifequalfwd THURSDAY, .DoHaircut
	ifequalfwd SATURDAY, .DoHaircut
	jumptext GoldenrodUndergroundWeAreNotOpenTodayText

.DoHaircut:
	opentext
	checkflag ENGINE_GOLDENROD_UNDERGROUND_GOT_HAIRCUT
	iftruefwd .AlreadyGotHaircut
	special PlaceMoneyTopRight
	writetext GoldenrodUndergroundOlderHaircutBrotherOfferHaircutText
	yesorno
	iffalsefwd .Refused
	checkmoney YOUR_MONEY, 500
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	writetext GoldenrodUndergroundOlderHaircutBrotherAskWhichMonText
	promptbutton
	special Special_OlderHaircutBrother
	ifequalfwd $0, .Refused
	ifequalfwd $1, .Refused
	setflag ENGINE_GOLDENROD_UNDERGROUND_GOT_HAIRCUT
	ifequalfwd $2, .two
	ifequalfwd $3, .three
	sjumpfwd .else

.two
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	sjumpfwd .then

.three
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	sjumpfwd .then

.else
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	; fallthrough

.then
	takemoney YOUR_MONEY, 500
	special PlaceMoneyTopRight
	writetext GoldenrodUndergroundOlderHaircutBrotherWatchItBecomeBeautifulText
	waitbutton
	closetext
	special FadeOutPalettes
	special LoadMapPalettes
	playmusic MUSIC_HEAL
	pause 60
	special FadeInPalettes_EnableDynNoApply
	special RestartMapMusic
	opentext
	writetext GoldenrodUndergroundOlderHaircutBrotherAllDoneText
	waitbutton
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue EitherHaircutBrotherScript_SlightlyHappier
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue EitherHaircutBrotherScript_Happier
	sjump EitherHaircutBrotherScript_MuchHappier

.Refused:
	jumpthisopenedtext

	; GSC-DE Dump
	text "Ist das wahr? Das"
	line "ist eine Schande!"
	done

.NotEnoughMoney:
	jumpthisopenedtext

	; GSC-DE Dump
	text "Du hast nicht"
	line "genügend Geld."
	done

.AlreadyGotHaircut:
	jumpthisopenedtext

	; GSC-DE Dump
	text "Ich mache nur"
	line "einen Haarschnitt"
	cont "pro Tag, und für"
	cont "heute bin ich"
	cont "fertig."
	done

YoungerHaircutBrotherScript:
	readvar VAR_WEEKDAY
	ifequalfwd SUNDAY, .DoHaircut
	ifequalfwd WEDNESDAY, .DoHaircut
	ifequalfwd FRIDAY, .DoHaircut
	jumptext GoldenrodUndergroundWeAreNotOpenTodayText

.DoHaircut:
	opentext
	checkflag ENGINE_GOLDENROD_UNDERGROUND_GOT_HAIRCUT
	iftruefwd .AlreadyGotHaircut
	special PlaceMoneyTopRight
	writetext GoldenrodUndergroundYoungerHaircutBrotherOfferHaircutText
	yesorno
	iffalsefwd .Refused
	checkmoney YOUR_MONEY, 300
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	writetext GoldenrodUndergroundYoungerHaircutBrotherAskWhichMonText
	promptbutton
	special Special_YoungerHaircutBrother
	ifequalfwd $0, .Refused
	ifequalfwd $1, .Refused
	setflag ENGINE_GOLDENROD_UNDERGROUND_GOT_HAIRCUT
	ifequalfwd $2, .two
	ifequalfwd $3, .three
	sjumpfwd .else

.two
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	sjumpfwd .then

.three
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	sjumpfwd .then

.else
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
.then
	takemoney YOUR_MONEY, 300
	special PlaceMoneyTopRight
	writetext GoldenrodUndergroundYoungerHaircutBrotherIllMakeItLookCoolText
	waitbutton
	closetext
	special FadeOutPalettes
	special LoadMapPalettes
	playmusic MUSIC_HEAL
	pause 60
	special FadeInPalettes_EnableDynNoApply
	special RestartMapMusic
	opentext
	writetext GoldenrodUndergroundYoungerHaircutBrotherAllDoneText
	waitbutton
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftruefwd EitherHaircutBrotherScript_SlightlyHappier
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftruefwd EitherHaircutBrotherScript_Happier
	sjumpfwd EitherHaircutBrotherScript_MuchHappier

.Refused:
	jumpthisopenedtext

	; GSC-DE Dump
	text "Nein? "
	line "Schade!"
	done

.NotEnoughMoney:
	jumpthisopenedtext

	; GSC-DE Dump
	text "Du hast nicht"
	line "genügend Geld."
	done

.AlreadyGotHaircut:
	jumpthisopenedtext

	; GSC-DE Dump
	text "Ich mache nur"
	line "einen Haarschnitt"
	para "pro Tag, und für"
	line "heute bin ich"
	cont "fertig."
	done
EitherHaircutBrotherScript_SlightlyHappier:
	writetext HaircutBrosText_SlightlyHappier
	special PlayCurMonCry
	waitendtext

EitherHaircutBrotherScript_Happier:
	writetext HaircutBrosText_Happier
	special PlayCurMonCry
	waitendtext

EitherHaircutBrotherScript_MuchHappier:
	writetext HaircutBrosText_MuchHappier
	special PlayCurMonCry
	waitendtext



BasementDoorScript::
	checkevent EVENT_USED_BASEMENT_KEY
	iftrue_jumptext GoldenrodUndergroundTheDoorIsOpenText
	checkkeyitem BASEMENT_KEY
	iffalse_jumptext GoldenrodUndergroundTheDoorsLockedText
	opentext
	playsound SFX_TRANSACTION
	writetext GoldenrodUndergroundBasementKeyOpenedDoorText
	waitbutton
	closetext
	changeblock 16, 6, $2e
	refreshmap
	setevent EVENT_USED_BASEMENT_KEY
	endtext

GoldenrodUndergroundCandyManScript:
	checkevent EVENT_GOT_CANDY_JAR
	iftruefwd .AlreadyGotCandyJar
	opentext
	writetext .GiveCandyJarText1
	waitbutton
	verbosegivekeyitem CANDY_JAR
	setevent EVENT_GOT_CANDY_JAR
	writetext .GiveCandyJarText2
	waitbutton
	setval 1
	writemem wExpCandySAmount
	endtext

.AlreadyGotCandyJar:
	pokemart MARTTYPE_EXP_CANDY, 0

.GiveCandyJarText1:
	text "Psst! Hierher… Du"
	line "siehst aus, als"
	cont "bräuchtest du"
	cont "einen Schub."

	para "Stell nicht zu"
	line "viele Fragen."

	para "Hier, nimm das."
	done

.GiveCandyJarText2:
	text "Das ist ein"
	line "Bonbonglas."
	para "Du brauchst es, um"
	line "meine, äh,"
	cont "speziellen Bonbons"
	cont "aufzubewahren."
	para "Das erste geht auf"
	line "mich! Probier es."
	para "… Für #mon,"
	line "natürlich."
	done

PiersScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd PiersRematchScript
	checkevent EVENT_BEAT_PIERS
	iftrue_jumpopenedtext PiersAfterText
	checkevent EVENT_INTRODUCED_PIERS
	iftruefwd .AfterIntro
	writetext PiersIntroText
	waitbutton
	setevent EVENT_INTRODUCED_PIERS
.AfterIntro:
	writetext PiersAfterIntroText
	yesorno
	iffalse_jumpopenedtext PiersNoBattleText
	writetext PiersSeenText
	waitbutton
	closetext
	winlosstext PiersBeatenText, 0
	setlasttalked GOLDENRODUNDERGROUND_PIERS
	loadtrainer PIERS, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_PIERS
	opentext
	writetext PiersRewardText
	promptbutton
	verbosegiveitem THROAT_SPRAY
	iffalse_jumpopenedtext PiersAfterText
	setevent EVENT_GOT_THROAT_SPRAY_FROM_PIERS
	jumpthisopenedtext

PiersAfterText:
	text "Wenn du Champ"
	line "werden willst,"

	para "dann leg los!"

	para "Ich schick dir"
	line "Unterstützung mit"
	cont "einem lauten Ruf!"
	done

PiersRematchScript:
	checkevent EVENT_BEAT_PIERS_AGAIN
	iffalsefwd .DoRematch
	checkevent EVENT_GOT_THROAT_SPRAY_FROM_PIERS
	iftrue_jumpopenedtext PiersRematchAfterText
	opentext
	sjumpfwd .GiveThroatSpray
.DoRematch:
	checkevent EVENT_INTRODUCED_PIERS
	iffalsefwd .Intro
	writetext PiersRematchIntroAgainText
	sjumpfwd .AfterIntro
.Intro:
	writetext PiersIntroText
.AfterIntro:
	setevent EVENT_INTRODUCED_PIERS
	waitbutton
	writetext PiersRematchSeenText
	waitbutton
	closetext
	winlosstext PiersRematchBeatenText, 0
	setlasttalked GOLDENRODUNDERGROUND_PIERS
	loadtrainer PIERS, 2
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_PIERS_AGAIN
	opentext
	checkevent EVENT_GOT_THROAT_SPRAY_FROM_PIERS
	iftrue_jumpopenedtext PiersRematchAfterText
.GiveThroatSpray:
	writetext PiersRewardText
	promptbutton
	verbosegiveitem THROAT_SPRAY
	iffalse_jumpopenedtext PiersRematchAfterText
	setevent EVENT_GOT_THROAT_SPRAY_FROM_PIERS
	jumpthisopenedtext

PiersRematchAfterText:
	text "Ich hab eine"
	line "kleine Schwester."
	cont "Sie heißt Marnie."
	para "Sie ist so süß,"
	line "wie man es nur"
	cont "sich vorstellt."
	para "Wenn sie älter"
	line "ist, weiß ich"
	para "nicht, ob sie"
	line "singen, Musik"
	para "machen oder mit"
	line "#mon kämpfen"
	cont "will, oder was"
	cont "ganz Neues."
	para "Aber was auch"
	line "immer sie wählt,"
	para "ich hoffe, sie hat"
	line "so viel"
	cont "Leidenschaft wie"
	cont "du, <PLAYER>!"
	done

PiersIntroText:
	text "Piers: Ein"
	line "bescheidener"
	cont "Sänger kann nur"
	cont "bescheidene Lieder"
	cont "singen … ♪"
	para "Ich bin Piers. Ich"
	line "komme nicht aus"
	cont "Johto,"
	para "aber ich kam her,"
	line "um im Radio"
	para "zu singen und alle"
	line "in meiner Heimat"
	cont "zum Lächeln zu"
	cont "bringen."
	done

PiersAfterIntroText:
	text "Einige meiner"
	line "besten Riffs"

	para "kamen aus einem"
	line "guten Sieg."

	para "Wie wär's mit"
	line "einem Kampf hier"
	cont "und jetzt?"
	done

PiersNoBattleText:
	text "Seufz … Meine"
	line "Seele weint"
	cont "förmlich."
	done

PiersSeenText:
	text "Ich mache dunkle"
	line "Musik und nutze"
	cont "Unlicht-#mon!"

	para "Zeit zu rocken!"
	done

PiersBeatenText:
	text "Mein Team und ich"
	line "haben alles"
	cont "gegeben."
	done

PiersRewardText:
	text "Ich bin froh, dass"
	line "wir kämpfen"
	cont "konnten."
	para "Meine #mon"
	line "fühlen wohl"
	cont "genauso."
	para "Hier, etwas, damit"
	line "du beim nächsten"
	para "Mal noch härter"
	line "rockst!"
	done

PiersRematchIntroAgainText:
	text "Piers: Hallo,"
	line "<PLAYER>."
	done

PiersRematchSeenText:
	text "Hah! Du bist also"
	line "der neue Champ."
	para "Du bist jetzt ein"
	line "großer Fisch!"
	para "Und ich sing immer"
	line "noch meine"
	cont "bescheidenen"
	cont "Lieder …"
	para "Willst du eine"
	line "Zugabe?"
	para "Für dich mache ich"
	line "eine Ausnahme, nur"
	cont "dieses Mal!"
	done

PiersRematchBeatenText:
	text "Das war's?!"
	line "Unmöglich!"
	done

SupernerdEricSeenText:
	; GSC-DE Dump
	text "Ich wurde aus"
	line "der SPIELHALLE"
	cont "hinausgeworfen."
	para "Ich habe versucht,"
	line "mit Hilfe meines"
	cont "#MON zu mogeln…"
	done







SupernerdEricBeatenText:
	text "…Grummel…"
	done







SupernerdTeruSeenText:
	; GSC-DE Dump
	text "Beschränkst du"
	line "dich beim Kämpfen"
	cont "nur auf einen Typ?"
	para "Wenn du die Stär-"
	line "ken deiner Typen"
	para "kennst, hast du im"
	line "Kampf Vorteile."
	done







SupernerdTeruBeatenText:
	text "Oh, oh, oh!"
	done







PokemaniacIssacSeenText:
	; GSC-DE Dump
	text "Meine #MON"
	line "kommen gerade vom"
	cont "Coiffeur!"
	para "Ich zeige dir, wie"
	line "stark sie sind!"
	done







PokemaniacIssacBeatenText:
	text "Arghhh!"
	done







PokemaniacDonaldSeenText:
	; GSC-DE Dump
	text "Ich glaube, du"
	line "besitzt seltene"
	cont "#MON."
	para "Zeig sie mir!"
	done







PokemaniacDonaldBeatenText:
	; GSC-DE Dump
	text "Guah! Ich habe"
	line "verloren! Ich"
	cont "dreh durch!"
	done







CosplayerClaraSeenText:
	text "Pix! Vul, pix! ♥"
	done

CosplayerClaraBeatenText:
	; PC-only
	text "Du dachtest, ich"
	line "wäre ein #MON?"
	para "Nein! Das ist nur"
	line "gutes Cosplay."
	done

GoldenrodUndergroundTheDoorsLockedText:
	text "Die Tür ist"
	line "verschlossen…"
	done







GoldenrodUndergroundTheDoorIsOpenText:
	text "Die Tür ist"
	line "entriegelt."
	done







GoldenrodUndergroundBasementKeyOpenedDoorText:
	; GSC-DE Dump
	text "Mit dem KELLER-"
	line "ÖFFNER wird die"
	cont "Tür entriegelt."
	done







GoldenrodUndergroundOlderHaircutBrotherOfferHaircutText:
	; GSC-DE Dump
	text "Willkommen!"
	para "Ich leite den"
	line "#MON-SALON!"
	para "Ich bin der ältere"
	line "und bessere der"
	cont "beiden COIFFEUR-"
	cont "BRÜDER."
	para "Ich verleihe"
	line "deinen #MON ein"
	cont "schöneres Äußeres"
	cont "für nur ¥500."
	para "Soll ich damit"
	line "anfangen?"
	done







GoldenrodUndergroundOlderHaircutBrotherAskWhichMonText:
	; GSC-DE Dump
	text "Bei welchem"
	line "#MON soll ich"
	cont "Hand anlegen?"
	done







GoldenrodUndergroundOlderHaircutBrotherWatchItBecomeBeautifulText:
	text "O.K.! Sieh her,"
	line "wie schön es wird!"
	done







GoldenrodUndergroundOlderHaircutBrotherAllDoneText:
	text "Hier! Fertig!"
	done







GoldenrodUndergroundYoungerHaircutBrotherOfferHaircutText:
	; GSC-DE Dump
	text "Willkommen im"
	line "#MON-SALON!"
	para "Ich bin der"
	line "jüngere und"
	cont "preiswertere der"
	cont "beiden COIFFEUR-"
	cont "BRÜDER."
	para "Ich verschönere"
	line "deine #MON"
	cont "für nur ¥300."
	para "Also? Wie wär's?"
	done







GoldenrodUndergroundYoungerHaircutBrotherAskWhichMonText:
	; GSC-DE Dump
	text "Welches #MON"
	line "soll ich be-"
	cont "arbeiten?"
	done







GoldenrodUndergroundYoungerHaircutBrotherIllMakeItLookCoolText:
	; GSC-DE Dump
	text "O.K.! Es wird"
	line "cool aussehen!"
	done







GoldenrodUndergroundYoungerHaircutBrotherAllDoneText:
	text "Bitte schön!"
	line "Fertig!"
	done







HaircutBrosText_SlightlyHappier:
	text_ram wStringBuffer3
	text " sieht"
	line "fröhlicher aus."
	done

HaircutBrosText_Happier:
	text_ram wStringBuffer3
	text " sieht"
	line "glücklich aus."
	done

HaircutBrosText_MuchHappier:
	; GSC-DE Dump
	text_ram wStringBuffer3
	text
	line "ist entzückt!"
	done






GoldenrodUndergroundWeAreNotOpenTodayText:
	text "Wir haben heute"
	line "geschlossen."
	done







GoldenrodUndergroundNoEntryText:
	; GSC-DE Dump
	text "BIS HIERHER"
	line "UND NICHT WEITER"
	done







PiersMicrophoneText:
	text "Das ist ein"
	line "Mikrofon."
	done
