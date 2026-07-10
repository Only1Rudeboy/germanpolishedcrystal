Route36_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_ROUTE36_NOOP
	scene_const SCENE_ROUTE36_SUICUNE

	def_callbacks
	callback MAPCALLBACK_OBJECTS, Route36ArthurCallback

	def_warp_events
	warp_event 22,  8, ROUTE_36_NATIONAL_PARK_GATE, 3
	warp_event 22,  9, ROUTE_36_NATIONAL_PARK_GATE, 4
	warp_event 51, 13, ROUTE_36_RUINS_OF_ALPH_GATE, 1
	warp_event 52, 13, ROUTE_36_RUINS_OF_ALPH_GATE, 2
	warp_event 61,  8, ROUTE_36_VIOLET_GATE, 1
	warp_event 61,  9, ROUTE_36_VIOLET_GATE, 2
	warp_event 30, 12, HIDDEN_TREE_GROTTO, 1

	def_coord_events
	coord_event 24,  7, SCENE_ROUTE36_SUICUNE, Route36SuicuneScript
	coord_event 26,  7, SCENE_ROUTE36_SUICUNE, Route36SuicuneScript

	def_bg_events
	bg_event 33,  1, BGEVENT_JUMPTEXT, Route36TrainerTips2Text
	bg_event 49, 11, BGEVENT_JUMPTEXT, RuinsOfAlphNorthSignText
	bg_event 59,  7, BGEVENT_JUMPTEXT, Route36SignText
	bg_event 25,  7, BGEVENT_JUMPTEXT, Route36TrainerTips1Text
	bg_event 53,  4, BGEVENT_JUMPTEXT, Route36AdvancedTips1Text
	bg_event 34,  7, BGEVENT_JUMPTEXT, Route36AdvancedTips2Text
	bg_event 30, 11, BGEVENT_JUMPSTD, treegrotto, HIDDENGROTTO_ROUTE_36
	bg_event 31, 11, BGEVENT_JUMPSTD, treegrotto, HIDDENGROTTO_ROUTE_36

	def_object_events
	object_event 39,  9, SPRITE_WEIRD_TREE, SPRITEMOVEDATA_SUDOWOODO, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, SudowoodoScript, EVENT_ROUTE_36_SUDOWOODO
	object_event 53,  6, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, ArthurScript, EVENT_ROUTE_36_ARTHUR_OF_THURSDAY
	object_event 37, 12, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route36FloriaScript, EVENT_FLORIA_AT_SUDOWOODO
	pokemon_event 25,  6, SUICUNE, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BLUE, ClearText, EVENT_SAW_SUICUNE_ON_ROUTE_36
	object_event 30,  6, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Route36CooltrainerfChiaraScript, -1
	object_event 24, 13, SPRITE_PSYCHIC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPsychicMark, -1
	object_event 35, 14, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 5, TrainerSchoolboyAlan1, -1
	object_event 57,  9, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route36LassScript, -1
	object_event 48,  9, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, Route36RockSmashGuyScript, -1
	fruittree_event 25,  4, FRUITTREE_ROUTE_36, RAWST_BERRY, PAL_NPC_TEAL
	object_event 50,  5, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSchoolgirlMolly, -1

	object_const_def
	const ROUTE36_WEIRD_TREE
	const ROUTE36_ARTHUR
	const ROUTE36_FLORIA
	const ROUTE36_SUICUNE
	const ROUTE36_COOLTRAINERF

Route36ArthurCallback:
	readvar VAR_WEEKDAY
	ifequalfwd THURSDAY, .ArthurAppears
	disappear ROUTE36_ARTHUR
	endcallback

.ArthurAppears:
	appear ROUTE36_ARTHUR
	endcallback

Route36SuicuneScript:
	showemote EMOTE_SHOCK, PLAYER, 15
	pause 15
	playsound SFX_WARP_FROM
	turnobject PLAYER, UP
	applymovement ROUTE36_SUICUNE, Route36SuicuneMovement
	disappear ROUTE36_SUICUNE
	turnobject PLAYER, DOWN
	pause 10
	setscene SCENE_ROUTE36_NOOP
	clearevent EVENT_SAW_SUICUNE_AT_CIANWOOD_CITY
	setmapscene CIANWOOD_CITY, SCENE_CIANWOODCITY_SUICUNE_AND_EUSINE
	end

SudowoodoScript:
	end




.Fight:
	opentext
	writetext UseSquirtbottleText
	yesorno
	iffalse_endtext
	closetext
WateredWeirdTreeScript:: ; export (for when you use Squirtbottle from pack)
	showtext UsedSquirtbottleText
	waitsfx
	playsound SFX_SANDSTORM
	applyonemovement ROUTE36_WEIRD_TREE, tree_shake
	showtext SudowoodoAttackedText
	loadvar VAR_BATTLETYPE, BATTLETYPE_TRAP
	loadwildmon SUDOWOODO, 20
	startbattle
	setevent EVENT_FOUGHT_SUDOWOODO
	ifequalfwd $2, DidntCatchSudowoodo
	disappear ROUTE36_WEIRD_TREE
	reloadmapafterbattle
	special CheckBattleCaughtResult
	iffalsefwd .nocatch
	setflag ENGINE_PLAYER_CAUGHT_SUDOWOODO
.nocatch
	end

DidntCatchSudowoodo:
	end




Route36FloriaScript:
	scall .FloriaMessage
	clearevent EVENT_FLORIA_AT_FLOWER_SHOP
	readvar VAR_FACING
	ifequalfwd UP, .Up
	applymovement ROUTE36_FLORIA, FloriaMovement1
	disappear ROUTE36_FLORIA
	end

.Up:
	applymovement ROUTE36_FLORIA, FloriaMovement2
	disappear ROUTE36_FLORIA
	end

.FloriaMessage:
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftrue_jumptextfaceplayer FloriaTextAfterSudowoodo
	checkevent EVENT_GOT_SQUIRTBOTTLE
	iftrue_jumptextfaceplayer FloriaTextAfterSquirtBottle
	jumpthistextfaceplayer

	text "Ich bin FLORA vom"
	line "BLUMENLADEN!"

	para "Stell dir vor:"

	para "Als ich den"
	line "wackeligen Baum"
	cont "mit"

	para "Wasser benetzte,"
	line "ist er"
	cont "hochgeschreckt!"

	para "Es muss einfach"
	line "ein #mon sein."

	para "Ich wette, es gibt"
	line "seine Verkleidung"

	para "auf, wenn man es"
	line "gießt!"

	para "Genau! Ich sage es"
	line "meiner Schwester"
	cont "und leihe mir ihre"
	cont "Gießkanne!"
	done
Route36RockSmashGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM50_ROCK_SMASH
	iftruefwd .AlreadyGotRockSmash
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftruefwd .ClearedSudowoodo
	jumpthisopenedtext

	text "Ha!"

	para "Ich wollte diesen"
	line "Baum mit meinem"

	para "geraden Schlag"
	line "zerschmettern."

	para "Aber ich konnte"
	line "nicht! Ich bin ein"
	cont "Versager!"
	done

.ClearedSudowoodo:
	writetext RockSmashGuyText2
	promptbutton
	verbosegivetmhm TM_ROCK_SMASH
	setevent EVENT_GOT_TM50_ROCK_SMASH
.AlreadyGotRockSmash:
	jumpthisopenedtext

	text "Das ist"
if DEF(FAITHFUL)
	line "ZERTRÜMMERER."
else
	line "Durchbruch."
endc

	para "Damit kannst du"
	line "Felsen mit einem"

	para "gezielten Schlag"
	line "zertrümmern."

	para "Wenn Felsen im Weg"
	line "sind, dann"
if DEF(FAITHFUL)
	cont "zertrümmere sie!"
else
	cont "brich sie auf!"
endc
	done

Route36LassScript:
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftrue_jumptextfaceplayer Route36LassText_ClearedSudowoodo
	jumpthistextfaceplayer

	text "Ein merkwürdiger"
	line "Baum blockiert den"
	cont "Weg nach DUKATIA"
	cont "CITY."

	para "Ich wollte mir das"
	line "riesige #mon-"

	para "CENTER ansehen,"
	line "das gerade"
	cont "eröffnet wurde…"
	done

TrainerSchoolboyAlan1:
	trainer SCHOOLBOY, ALAN1, EVENT_BEAT_SCHOOLBOY_ALAN, SchoolboyAlan1SeenText, SchoolboyAlan1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_SCHOOLBOY_ALAN
	opentext
	checkflag ENGINE_ALAN_READY_FOR_REMATCH
	iftruefwd .ChooseRematch
	checkflag ENGINE_ALAN_HAS_FIRE_STONE
	iftruefwd .GiveFireStone
	checkcellnum PHONE_SCHOOLBOY_ALAN
	iftruefwd .NumberAccepted
	checkevent EVENT_ALAN_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskAgainForPhoneNumber
	writetext SchoolboyAlanBooksText
	promptbutton
	setevent EVENT_ALAN_ASKED_FOR_PHONE_NUMBER
	callstd asknumber1m
	sjumpfwd .ContinueAskForPhoneNumber

.AskAgainForPhoneNumber:
	callstd asknumber2m
.ContinueAskForPhoneNumber:
	askforphonenumber PHONE_SCHOOLBOY_ALAN
	ifequalfwd $1, .PhoneFull
	ifequalfwd $2, .NumberDeclined
	gettrainername SCHOOLBOY, ALAN1, STRING_BUFFER_3
	callstd registerednumberm
	jumpstd numberacceptedm

.ChooseRematch:
	callstd rematchm
	winlosstext SchoolboyAlan1BeatenText, 0
	readmem wAlanFightCount
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
	checkflag ENGINE_FLYPOINT_BLACKTHORN
	iftruefwd .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_OLIVINE
	iftruefwd .LoadFight1
.LoadFight0:
	loadtrainer SCHOOLBOY, ALAN1
	startbattle
	reloadmapafterbattle
	loadmem wAlanFightCount, 1
	clearflag ENGINE_ALAN_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer SCHOOLBOY, ALAN2
	startbattle
	reloadmapafterbattle
	loadmem wAlanFightCount, 2
	clearflag ENGINE_ALAN_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer SCHOOLBOY, ALAN3
	startbattle
	reloadmapafterbattle
	loadmem wAlanFightCount, 3
	clearflag ENGINE_ALAN_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer SCHOOLBOY, ALAN4
	startbattle
	reloadmapafterbattle
	loadmem wAlanFightCount, 4
	clearflag ENGINE_ALAN_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer SCHOOLBOY, ALAN5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ALAN_READY_FOR_REMATCH
	end

.GiveFireStone:
	callstd giftm
	verbosegiveitem FIRE_STONE
	iffalsefwd .BagFull
	clearflag ENGINE_ALAN_HAS_FIRE_STONE
	setevent EVENT_ALAN_GAVE_FIRE_STONE
	jumpstd numberacceptedm

.BagFull:
	jumpstd packfullm

.NumberAccepted:
	jumpstd numberacceptedm

.NumberDeclined:
	jumpstd numberdeclinedm

.PhoneFull:
	jumpstd phonefullm

Route36CooltrainerfChiaraScript:
	checkevent EVENT_GOT_BINDING_BAND_FROM_ROUTE_36_LEADER
	iftrue_jumptextfaceplayer .AfterText2
	faceplayer
	checkevent EVENT_BEAT_COOLTRAINERF_CHIARA
	iftruefwd .Beaten
	checkevent EVENT_BEAT_SCHOOLBOY_ALAN
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_PSYCHIC_MARK
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_SCHOOLGIRL_MOLLY
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_TWINS_ANN_AND_ANNE
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_PSYCHIC_GREG
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_BEAUTY_CALLIE
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_BEAUTY_CASSANDRA
	iffalse_jumptext .IntroText
	opentext
	writetext .QuestionText
	yesorno
	iffalse_jumpopenedtext .RefusedText
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked ROUTE36_COOLTRAINERF
	loadtrainer COOLTRAINERF, CHIARA
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_COOLTRAINERF_CHIARA
.Beaten:
	opentext
	writetext .AfterText1
	promptbutton
	verbosegiveitem BINDING_BAND
	iffalse_endtext
	setevent EVENT_GOT_BINDING_BAND_FROM_ROUTE_36_LEADER
	jumpthisopenedtext

.AfterText2:
	text "Mit deinem Können"
	line "bist du nicht der"
	cont "einzige Top-"
	cont "Trainer, der dich"
	cont "testen will."
	done

.IntroText:
	text "Ich sah, wie du"
	line "das Mogelbaum"
	cont "aufgeweckt hast."

	para "Klasse gemacht!"

	para "Und du hast den"
	line "Knirpsorden. Ich"
	cont "auch!"

	para "Wie wär's: Besiege"
	line "alle"

	para "Trainer auf Route"
	line "36 und 37."

	para "Dann kämpfe ich"
	line "gegen dich!"
	done

.QuestionText:
	text "Du hast alle"
	line "anderen in der"
	cont "Gegend besiegt."

	para "Dann ist es Zeit"
	line "für unser Duell!"

	para "Ich nutze ein"
	line "Klammerband für"
	cont "meinen Vorteil."

	para "Bist du bereit für"
	line "mich?"
	done

.RefusedText:
	text "Ich bin bereit,"
	line "wann immer du"
	cont "willst!"
	done

.SeenText:
	text "Gegen meine"
	line "Technik hältst du"
	cont "nicht lange durch!"
	done

.BeatenText:
	text "Ich war es, der"
	line "nicht durchhielt?!"
	done

.AfterText1:
	text "Du hast meine"
	line "Technik beobachtet"
	cont "und kontert."

	para "Warum probierst du"
	line "sie nicht selbst?"

	para "Hier, für dich!"
	done

GenericTrainerPsychicMark:
	generictrainer PSYCHIC_T, MARK, EVENT_BEAT_PSYCHIC_MARK, PsychicMarkSeenText, PsychicMarkBeatenText

	text "Ich wäre wirklich"
	line "stark, wenn ich "

	para "wüsste, was mein"
	line "Gegner denkt."
	done
GenericTrainerSchoolgirlMolly:
	generictrainer SCHOOLGIRL, MOLLY, EVENT_BEAT_SCHOOLGIRL_MOLLY, SchoolgirlMollySeenText, SchoolgirlMollyBeatenText

	text "Ich muss noch viel"
	line "lernen."
	done

ArthurScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HARD_STONE_FROM_ARTHUR
	iftruefwd .AlreadyGotStone
	readvar VAR_WEEKDAY
	ifnotequal THURSDAY, ArthurNotThursdayScript
	checkevent EVENT_MET_ARTHUR_OF_THURSDAY
	iftruefwd .MetArthur
	writetext MeetArthurText
	promptbutton
	setevent EVENT_MET_ARTHUR_OF_THURSDAY
.MetArthur:
	writetext ArthurGivesGiftText
	promptbutton
	verbosegiveitem HARD_STONE
	iffalsefwd .BagFull
	setevent EVENT_GOT_HARD_STONE_FROM_ARTHUR
	jumpthisopenedtext

	text "DONATUS: Ein"
	line "#mon, das"

	para "Gestein-Attacken"
	line "benutzt, sollte"
	cont "dies mit sich"
	cont "tragen."

	para "Es verstärkt"
	line "Gestein-Attacken."
	done

.AlreadyGotStone:
	writetext ArthurThursdayText
	waitbutton
.BagFull:
	endtext

ArthurNotThursdayScript:
	jumpthisopenedtext

	text "DONATUS: Heute ist"
	line "nicht Donnerstag."
	cont "Wie enttäuschend."
	done

WeirdTreeMovement_Flee:
	fast_jump_step_up
	fast_jump_step_up
	step_end

FloriaMovement1:
	step_down
	step_down
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

FloriaMovement2:
	step_left
	step_down
	step_down
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

Route36SuicuneMovement:
	fix_facing
	fast_jump_step_down
	fast_jump_step_down
	fast_jump_step_down
	fast_jump_step_right
	fast_jump_step_right
	fast_jump_step_right
	step_end

UseSquirtbottleText:
	text "Das ist ein"
	line "merkwürdiger Baum."
	cont "Möchtest du die"
	cont "SCHIGGYKANNE"
	cont "benutzen?"
	done



UsedSquirtbottleText:
	text "<PLAYER> benutzt"
	line "SCHIGGYKANNE."
	done



SudowoodoAttackedText:
	text "Der merkwürdige"
	line "Baum mag die"
	cont "SCHIGGYKANNE"
	cont "nicht!"

	para "Der merkwürdige"
	line "Baum greift an!"
	done



FloriaTextAfterSquirtBottle:
	text "Ich bin Floria vom"
	line "BLUMENLADEN!"

	para "Als ich meiner"
	line "Schwester vom"

	para "wackeligen Baum"
	line "erzählte, sagte"

	para "sie, er sei"
	line "gefährlich."

	para "Ach, sie hat dir"
	line "ihre Gießkanne"
	cont "geliehen?"

	para "Dann musst du ein"
	line "guter Trainer"
	cont "sein!"

	para "Ich überlasse dir"
	line "den merkwürdigen"
	cont "Baum."

	para "Tschüss!"
	done

FloriaTextAfterSudowoodo:
	text "Ich wusste, der"
	line "wackelige Baum ist"
	cont "ein #mon!"

	para "Ich wollte ihn aus"
	line "seiner"

	para "Verkleidung"
	line "schocken, aber du"
	cont "warst schneller!"

	para "Na gut, ich geh"
	line "zurück zum"
	cont "BLUMENLADEN."

	para "Ich bin übrigens"
	line "Floria."

	para "Tschüss!"
	done


RockSmashGuyText2:
	text "Hast du diesen"
	line "seltsamen Baum"
	cont "weggeschafft?"

	para "Ich bin"
	line "beeindruckt! Ich"
	cont "möchte dir dies"
	cont "geben."
	done




Text_ReceivedTM08: ; unreferenced
	text "<PLAYER> erhält"
	line "TM08."
	done



Route36LassText_ClearedSudowoodo:
	text "Dieser merkwürdige"
	line "Baum ist spurlos"
	cont "verschwunden."

	para "Ach! Der Baum war"
	line "in Wirklichkeit"
	cont "ein #mon?"
	done



PsychicMarkSeenText:
	text "Ich werde jetzt"
	line "deine Gedanken"
	cont "lesen!"
	done



PsychicMarkBeatenText:
	text "Ich habe mich wohl"
	line "bei dir verlesen!"
	done



SchoolgirlMollySeenText:
	text "Mr.Earl hat mir"
	line "beigebracht, mit"
	cont "#mon zu"
	cont "kämpfen!"
	done

SchoolgirlMollyBeatenText:
	text "Mein Lernen…"
	done

SchoolboyAlan1SeenText:
	text "Dank meiner"
	line "Studien bin ich"
	cont "für jedes #mon"
	cont "bereit!"
	done



SchoolboyAlan1BeatenText:
	text "Ups! Ein Fehler in"
	line "der Berechnung?"
	done



SchoolboyAlanBooksText:
	text "Mist! Ich lerne"
	line "auch fünf Stunden"
	cont "am Tag."

	para "Es gibt vieles,"
	line "das du nicht aus"
	cont "Büchern lernen"
	cont "kannst."
	done



MeetArthurText:
	text "DONATUS: Wer bist"
	line "du?"

	para "Ich bin DONATUS"
	line "von Donnerstag."
	done



ArthurGivesGiftText:
	text "Hier bitte. Das"
	line "kannst du haben."
	done



ArthurThursdayText:
	text "DONATUS: Ich bin"
	line "DONATUS von"

	para "Donnerstag. Ich"
	line "bin der zweite"

	para "Sohn von sieben"
	line "Kindern."
	done



Route36SignText:
	text "ROUTE 36"
	done



RuinsOfAlphNorthSignText:
	text "ALPH-RUINEN"
	line "NORDEINGANG"
	done



Route36TrainerTips1Text:
	text "TIPPS für TRAINER"
	line "Der Status der"

	para "#mon ist unter-"
	line "schiedlich, sogar"

	para "innerhalb"
	line "derselben Spezies."

	para "Zu Beginn ist er"
	line "vielleicht noch"
	cont "ähnlich."

	para "Doch die Unter-"
	line "schiede werden "

	para "deutlicher, wenn"
	line "die #mon"
	cont "heranwachsen."
	done



Route36TrainerTips2Text:
	text "TIPPS für TRAINER"
	line "Setze den"

	para "SCHAUFLER ein, um"
	line "an den Eingang"

	para "eines Ortes"
	line "zurückzugelangen."

	para "Das ist sehr"
	line "nützlich beim"
	cont "Erkunden"

	para "von Höhlen und"
	line "anderen"
	cont "Umgebungen."
	done



Route36AdvancedTips1Text:
	text "Prof-Tipps!"

	para "In den Optionen"
	line "kannst du aus 20"
	cont "Rahmen und 8"
	cont "Schriftarten"

	para "wählen!"
	done

Route36AdvancedTips2Text:
	text "Prof-Tipps!"

	para "Haarschnitte,"
	line "Segnungen oder"

	para "Massagen erhöhen"
	line "die Zuneigung —"
	cont "deine #mon"
	cont "kämpfen besser!"
	done
