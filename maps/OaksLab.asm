OaksLab_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4, 11, PALLET_TOWN, 3
	warp_event  5, 11, PALLET_TOWN, 3

	def_coord_events

	def_bg_events
	bg_event  6,  1, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  7,  1, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  8,  1, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  9,  1, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  0,  7, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  1,  7, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  2,  7, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  3,  7, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  6,  7, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  7,  7, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  8,  7, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  9,  7, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  4,  0, BGEVENT_JUMPTEXT, OaksLabPoster1Text
	bg_event  5,  0, BGEVENT_JUMPTEXT, OaksLabPoster2Text
	bg_event  0,  1, BGEVENT_JUMPTEXT, OaksLabPCText

	def_object_events
	object_event  4,  2, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Oak, -1
	object_event  7,  3, SPRITE_MON_ICON, SPRITEMOVEDATA_STILL, 0, EEVEE, -1, PAL_MON_BROWN, OBJECTTYPE_SCRIPT, NO_FORM, EeveeDollScript, EVENT_DECO_EEVEE_DOLL
	object_event  1,  8, SPRITE_AROMA_LADY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, OaksAssistant1Text, -1
	object_event  8,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, OaksAssistant2Text, -1
	object_event  1,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, OaksAssistant3Text, -1
	object_event  2,  1, SPRITE_BOOK_PAPER_POKEDEX, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptext, OaksLabPokedexText, -1

	object_const_def
	const OAKSLAB_OAK
	const OAKSLAB_EEVEE_DOLL

Oak:
	faceplayer
	opentext
	checkevent EVENT_OPENED_MT_SILVER
	iftruefwd .GiveStarter
	checkevent EVENT_TALKED_TO_OAK_IN_KANTO
	iftruefwd .GiveStarter
	writetext OakWelcomeKantoText
	promptbutton
	setevent EVENT_TALKED_TO_OAK_IN_KANTO
.GiveStarter:
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftruefwd .CheckBadges
	checkevent EVENT_GOT_A_POKEMON_FROM_IVY
	iffalsefwd .CheckBadges
	writetext OakLabGiveStarterText
	promptbutton
	waitsfx
	checkevent EVENT_GOT_BULBASAUR_FROM_IVY
	iftruefwd .Charmander
	checkevent EVENT_GOT_CHARMANDER_FROM_IVY
	iftruefwd .Squirtle
	givepoke BULBASAUR, PLAIN_FORM, 10, SITRUS_BERRY
	iffalsefwd .PartyAndBoxFull
	setevent EVENT_GOT_A_POKEMON_FROM_OAK
	sjumpfwd .CheckBadges

.Charmander:
	givepoke CHARMANDER, PLAIN_FORM, 10, SITRUS_BERRY
	iffalsefwd .PartyAndBoxFull
	setevent EVENT_GOT_A_POKEMON_FROM_OAK
	sjumpfwd .CheckBadges

.Squirtle:
	givepoke SQUIRTLE, PLAIN_FORM, 10, SITRUS_BERRY
	iffalsefwd .PartyAndBoxFull
	setevent EVENT_GOT_A_POKEMON_FROM_OAK
	sjumpfwd .CheckBadges

.PartyAndBoxFull:
	writetext OakLabPartyAndBoxFullText
	waitbutton
.CheckBadges:
	checkevent EVENT_OPENED_MT_SILVER
	iftruefwd .CheckPokedex
	checkevent EVENT_BEAT_ELITE_FOUR_AGAIN
	iftruefwd .BattleOak
	readvar VAR_BADGES
	ifequalfwd 16, .Complain1
	ifequalfwd  8, .Complain2
	writetext OakYesKantoBadgesText
	promptbutton
.CheckPokedex:
	checkkeyitem CATCH_CHARM
	iftruefwd .GotCatchCharm
	writetext OakLabCatchMoreText
	promptbutton
	verbosegivekeyitem CATCH_CHARM
	writetext OakLabCatchCharmText
	waitbutton
.GotCatchCharm
	writetext OakLabDexCheckText
	waitbutton
	special ProfOaksPCBoot
	checkkeyitem OVAL_CHARM
	iftruefwd .NoOvalCharm
	setval16 NUM_POKEMON
	special CountSeen
	iffalsefwd .NoOvalCharm
	writetext OakLabSeenAllText
	promptbutton
	verbosegivekeyitem OVAL_CHARM
	writetext OakLabOvalCharmText
	waitbutton
.NoOvalCharm
	checkkeyitem SHINY_CHARM
	iftruefwd .NoShinyCharm
	setval16 NUM_POKEMON
	special CountCaught
	iffalsefwd .NoShinyCharm
	writetext OakLabCaughtAllText
	promptbutton
	verbosegivekeyitem SHINY_CHARM
	writetext OakLabShinyCharmText
	waitbutton
.NoShinyCharm
	jumpthisopenedtext

	text "Wenn du mal"
	line "wieder"
	line "in der Gegend"
	cont "bist, dann schau"
	cont "doch wieder rein."
	done

.BattleOak:
	checkevent EVENT_LISTENED_TO_OAK_INTRO
	iftruefwd .HeardIntro
	writetext OakMightBeReadyText
	waitbutton
	setevent EVENT_LISTENED_TO_OAK_INTRO
.HeardIntro:
	writetext OakChallengeText
	yesorno
	iffalsefwd .NotReady
	writetext OakSeenText
	waitbutton
	closetext
	winlosstext OakWinText, 0
	setlasttalked OAKSLAB_OAK
	loadtrainer PROF_OAK, 1
	startbattle
	reloadmapafterbattle
	opentext
	writetext OakOpenMtSilverText
	promptbutton
	setevent EVENT_BEAT_PROF_OAK
	setevent EVENT_OPENED_MT_SILVER
	sjump .CheckPokedex

.NotReady:
	writetext OakRefusedText
	promptbutton
	sjump .CheckPokedex

.Complain1:
	writetext OakNoEliteFourRematchText
	promptbutton
	sjump .CheckPokedex

.Complain2:
	writetext OakNoKantoBadgesText
	promptbutton
	sjump .CheckPokedex

EeveeDollScript:
	turnobject OAKSLAB_OAK, RIGHT
	opentext
	writetext ProfOakEeveeDollTradeText
	waitbutton
	checkitem EVERSTONE
	iffalse_jumpopenedtext NoEverstoneText
	writetext WantToTradeText
	yesorno
	iffalse_jumpopenedtext NoTradeText
	takeitem EVERSTONE
	disappear OAKSLAB_EEVEE_DOLL
	setevent EVENT_DECO_EEVEE_DOLL
	writetext EeveeDollText
	playsound SFX_ITEM
	pause 60
	waitbutton
	writetext EeveeDollSentText
	waitbutton
	jumpthisopenedtext

	text "Prof.Eich: Stell"
	line "es"
	line "hin, wo du es"
	cont "oft siehst!"
	done

OakWelcomeKantoText:
	text "EICH: <PLAYER>!"
	line "Schön, dass du"

	para "den weiten Weg"
	line "nach KANTO"
	cont "gemacht"
	cont "hast."

	para "Was hältst du von"
	line "den Trainern hier"

	para "draußen?"
	line "Ziemlich stark,"

	para "was?"
	done





OakLabGiveStarterText:
	text "EICH: Ach, Prof."
	line "Ivy lässt grüßen?"

	para "Danke, dass du"
	line "ihre Grüße"
	cont "überbracht hast,"
	cont "<PLAYER>."

	para "Sie ist eine gute"
	line "Freundin von mir."

	para "Wenn sie dir ein"
	line "#mon gab, mach"
	cont "ich dasselbe!"

	para "Dieses #mon"
	line "sieht man in"
	cont "KANTO und JOHTO"
	cont "selten."
	done

OakLabPartyAndBoxFullText:
	text "Hm, du hast"
	line "keinen"
	line "Platz dafür und"
	line "deine Box ist"
	cont "voll."
	done

OakLabDexCheckText:
	text "Wie geht es mit"
	line "dem #DEX voran?"

	para "Mal sehen…"
	done





OakLabCatchMoreText:
	text "Ich möchte dir"
	line "danken für deine"

	para "Hilfe beim"
	line "Ausfüllen des"
	cont "#DEX."

	para "Nimm das als"
	line "Belohnung für"
	cont "deine Arbeit!"
	done

OakLabCatchCharmText:
	text "Mit einem Fang-"
	line "Glücksbringer"

	para "steigt die Chance"
	line "auf einen"
	cont "Volltreffer-Fang."

	para "Dann wird der"
	line "#BALL genau"

	para "geworfen und"
	line "fängt eher!"
	done

OakLabSeenAllText:
	text "Du triffst"
	line "ständig"
	line "neue #mon,"

	para "nicht wahr?"

	para "Nimm das als"
	line "Belohnung für"
	cont "deine Arbeit!"
	done

OakLabOvalCharmText:
	text "Mit einem Oval-"
	line "Glücksbringer"

	para "steigt die"
	line "Chance,"
	line "in der ZUCHT ein"
	cont "Ei zu finden."
	done

OakLabCaughtAllText:
	text "Ich hatte recht,"
	line "dir den #DEX"

	para "zu geben."

	para "Er zeugt von"
	line "deinem Einsatz…"

	para "Und von der"
	line "Hilfe vieler…"

	para "Und von den"
	line "Banden zu deinen"
	cont "#mon!"

	para "Nimm das als"
	line "Belohnung für"
	cont "deine Arbeit!"
	done

OakLabShinyCharmText:
	text "Mit einem Shiny-"
	line "Glücksbringer"

	para "steigt die"
	line "Chance,"
	line "ein schillerndes"
	cont "#mon zu finden!"
	done


OakMightBeReadyText:
	text "EICH:"
	line "Unglaublich,"
	line "<PLAYER>!"

	para "Du hast die TOP"
	line "VIER ein zweites"
	cont "Mal besiegt!"

	para "Vielleicht bist"
	line "du"
	line "bereit für den"
	cont "SILBERBERG."
	done

OakChallengeText:
	text "EICH: Der SILBER-"
	line "BERG ist ein"
	cont "hoher"

	para "Berg mit vielen"
	line "wilden #mon."

	para "Er ist zu"
	line "gefährlich für"

	para "normale Trainer"
	line "und verboten."

	para "Ich muss deine"
	line "Fähigkeiten"
	cont "selbst"
	cont "prüfen."

	para "Bist du bereit"
	line "für einen Kampf?"
	done

OakRefusedText:
	text "EICH: Komm"
	line "wieder,"
	line "wenn du bereit"
	cont "bist."
	done

OakSeenText:
	text "EICH: Gib in"
	line "diesem"
	line "Kampf alles!"
	done

OakWinText:
	text "Ich habe dich"
	line "richtig"
	cont "eingeschätzt!"
	done

OakOpenMtSilverText:
	text "EICH: Wow! Das"
	line "ist"
	line "hervorragend!"

	para "Du hast die ORDEN"
	line "der ARENALEITER"
	cont "in"
	cont "KANTO erkämpft."
	cont "Gut gemacht!"

	para "Ich habe dich"
	line "richtig"
	cont "eingeschätzt."

	para "Weißt du was,"
	line "<PLAYER>? Ich"

	para "werde es so ein-"
	line "richten, dass du"
	cont "zum SILBERBERG"
	cont "gehen kannst."

	para "Der SILBERBERG"
	line "ist"
	line "ein großes"
	cont "Habitat"

	para "für viele wilde"
	line "#mon."

	para "Es ist zu"
	line "gefährlich für"

	para "einen Durch-"
	line "schnittstrainer."

	para "Deshalb ist es"
	line "verboten. Aber"
	cont "für"
	cont "dich, <PLAYER>,"
	cont "können wir eine"
	cont "Ausnahme machen."

	para "Steige auf das"
	line "INDIGO PLATEAU."

	para "Von dort kannst"
	line "du den SILBERBERG"
	cont "erreichen."
	done





OakNoKantoBadgesText:
	text "EICH: Hm? Du hast"
	line "keine ORDEN der"

	para "#mon-ARENEN"
	line "in KANTO?"

	para "Die ARENALEITER"
	line "in"
	line "KANTO sind"
	cont "genauso"

	para "stark wie die"
	line "in JOHTO."

	para "Ich schlage vor,"
	line "du forderst sie"
	cont "heraus."
	done





OakNoEliteFourRematchText:
	text "EICH: Wow! Das"
	line "ist"
	line "hervorragend!"

	para "Du hast die ORDEN"
	line "der ARENALEITER"
	cont "in KANTO."

	para "Jetzt kannst du"
	line "die TOP VIER mit"
	cont "ihren besten"
	cont "#mon fordern."

	para "Weiter so,"
	line "<PLAYER>!"
	done

OakYesKantoBadgesText:
	text "EICH: Ah, du"
	line "sammelst ORDEN"
	cont "der"
	cont "ARENALEITER von"
	cont "KANTO."

	para "Ich kann mir"
	line "vorstellen, dass"

	para "es schwer für"
	line "dich"
	line "ist, aber du"
	cont "sammelst"
	cont "wertvolle"
	cont "Erfahrungen."

	para "Besuche mich"
	line "wieder, wenn du"

	para "sie alle hast."
	line "Ich gebe dir dann"
	cont "ein Geschenk."

	para "Streng dich"
	line "weiter"
	line "so an, <PLAYER>!"
	done





OaksAssistant1Text:
	text "PROF. EICHs #-"
	line "MON-TALK wird in"

	para "KANTO nicht im"
	line "Radio gesendet."

	para "Das ist schade."
	line "Ich würde es"
	cont "gerne"
	cont "hören."
	done





OaksAssistant2Text:
	text "Die Forschungen"
	line "des PROFESSORs"
	cont "kommen dank"
	cont "deiner"

	para "Arbeit am #DEX"
	line "sehr gut voran."
	done





OaksAssistant3Text:
	text "Erzähl es keinem,"
	line "aber PROF. EICHs"

	para "#mon-TALK wird"
	line "nicht live"
	cont "gesendet."
	done





OaksLabPoster1Text:
	text "Drücke START, um"
	line "das MENÜ zu"
	cont "öffnen."
	done





OaksLabPoster2Text:
	text "Möchtest du"
	line "deinen"
	line "Spielstand von"

	para "Zeit zu Zeit"
	line "speichern, dann"
	cont "wähle im MENÜ die"
	cont "Option SICHERN."
	done





OaksLabPCText:
	text "Auf dem PC ist"
	line "eine E-Mail."

	para "…"

	para "Wie kommen Sie"
	line "mit Ihren"
	cont "Forschungen"
	cont "voran,"
	cont "PROF. EICH?"

	para "Nun, ich ackere"
	line "weiter."

	para "Ich habe Gerüchte"
	line "gehört, dass"

	para "sich <PLAYER>"
	line "einen Namen"
	cont "macht."

	para "Es freut mich,"
	line "das"
	line "zu hören."

	para "PROF. LIND in"
	line "Neuborkia"
	done





ProfOakEeveeDollTradeText:
	text "EICH: Ach, bewun-"
	line "derst du meine"
	cont "Evoli-Puppe?"

	para "Ich tausche sie"
	line "gegen einen"
	cont "Ewigstein."
	done

NoEverstoneText:
	text "Aber du hast"
	line "keinen davon…"
	done

WantToTradeText:
	text "Möchtest du"
	line "tauschen?"
	done

NoTradeText:
	text "Es wird hier noch"
	line "sein, wenn du es"
	cont "dir anders"
	cont "überlegst."
	done

EeveeDollText:
	text "<PLAYER> erhält"
	line "Evoli-Puppe."
	done

EeveeDollSentText:
	text "Evoli-Puppe wurde"
	line "nach Hause"
	cont "geschickt."
	done


OaksLabPokedexText:
	text "Das ist"
	line "Prof.Linds"
	line "#dex."
	done
