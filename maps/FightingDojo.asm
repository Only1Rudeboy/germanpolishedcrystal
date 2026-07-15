DEF FIGHTINGDOJO_REMATCH_VARSPRITE_1 EQU SPRITE_BIG_DOLL
DEF FIGHTINGDOJO_REMATCH_VARSPRITE_2 EQU SPRITE_COPYCAT
DEF FIGHTINGDOJO_REMATCH_VARSPRITE_3 EQU SPRITE_CONSOLE

FightingDojo_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, FightingDojoSetupRematchesCallback

	def_warp_events
	warp_event  4, 11, SAFFRON_CITY, 1
	warp_event  5, 11, SAFFRON_CITY, 1

	def_coord_events

	def_bg_events
	bg_event  4,  0, BGEVENT_JUMPTEXT, FightingDojoSign1Text
	bg_event  5,  0, BGEVENT_JUMPTEXT, FightingDojoSign2Text
	bg_event  9,  0, BGEVENT_READ, MapFightingDojoSignpost2Script

	def_object_events
	object_event  0,  1, FIGHTINGDOJO_REMATCH_VARSPRITE_1, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, FightingDojoRematch1Script, EVENT_REMATCH_GYM_LEADER_1
	object_event  0,  2, FIGHTINGDOJO_REMATCH_VARSPRITE_2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, FightingDojoRematch2Script, EVENT_REMATCH_GYM_LEADER_2
	object_event  0,  3, FIGHTINGDOJO_REMATCH_VARSPRITE_3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, FightingDojoRematch3Script, EVENT_REMATCH_GYM_LEADER_3
	object_event  4,  3, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, FightingDojoBlackBelt, -1

	object_const_def
	const FIGHTINGDOJO_REMATCH_1
	const FIGHTINGDOJO_REMATCH_2
	const FIGHTINGDOJO_REMATCH_3

FightingDojoSetupRematchesCallback:
	disappear FIGHTINGDOJO_REMATCH_1
	disappear FIGHTINGDOJO_REMATCH_2
	disappear FIGHTINGDOJO_REMATCH_3
	checkevent EVENT_BEAT_BLUE
	iftruefwd .SetupDailyRematches
	endcallback

MACRO rematch ; person, sprite, x, y, face, palette
	moveobject FIGHTINGDOJO_REMATCH_\1, \3, \4
	turnobject FIGHTINGDOJO_REMATCH_\1, \5
	setmapobjectpal FIGHTINGDOJO_REMATCH_\1, PAL_NPC_\6
	appear FIGHTINGDOJO_REMATCH_\1
	variablesprite FIGHTINGDOJO_REMATCH_VARSPRITE_\1, SPRITE_\2
ENDM

.SetupDailyRematches:
	readvar VAR_WEEKDAY
	ifequalfwd MONDAY, .Monday
	ifequalfwd TUESDAY, .Tuesday
	ifequalfwd WEDNESDAY, .Wednesday
	ifequal THURSDAY, .Thursday
	ifequal FRIDAY, .Friday
	ifequal SATURDAY, .Saturday

.Sunday
	checktime (1 << EVE) | (1 << NITE)
	iftruefwd .SundayNight
.SundayMorningAndDay
	rematch 1, JASMINE, 3, 6, RIGHT, RED
	rematch 2, ERIKA, 6, 6, LEFT, GREEN
	endcallback
.SundayNight
	rematch 3, SABRINA, 6, 4, DOWN, RED
	endcallback

.Monday
	checktime (1 << EVE) | (1 << NITE)
	iftruefwd .MondayNight
.MondayMorningAndDay
	rematch 1, FALKNER, 3, 5, RIGHT, BLUE
	rematch 2, JANINE, 6, 5, LEFT, PURPLE
	endcallback
.MondayNight
	checkevent EVENT_BEAT_WALKER
	iffalsefwd .NoWalker
	rematch 3, WALKER, 8, 4, DOWN, BLUE
.NoWalker
	endcallback

.Tuesday
	checktime (1 << EVE) | (1 << NITE)
	iftruefwd .TuesdayNight
.TuesdayMorningAndDay
	rematch 1, PRYCE, 3, 6, RIGHT, BROWN
	rematch 2, BLAINE, 6, 6, LEFT, BROWN
	endcallback
.TuesdayNight
	checkevent EVENT_BEAT_LORELEI_AGAIN
	iffalsefwd .NoLorelei
	rematch 3, LORELEI, 6, 4, DOWN, RED
.NoLorelei
	endcallback

.Wednesday
	checktime 1 << MORN
	iftruefwd .WednesdayMorning
	checktime (1 << EVE) | (1 << NITE)
	iftruefwd .WednesdayNight
.WednesdayDay
	rematch 1, BROCK, 3, 7, RIGHT, BROWN
	rematch 2, MISTY, 3, 5, RIGHT, ORANGE
	rematch 3, BLUE, 6, 6, LEFT, BLUE
	endcallback
.WednesdayMorning
	rematch 1, BROCK, 3, 5, RIGHT, BROWN
	rematch 2, MISTY, 6, 5, LEFT, ORANGE
	endcallback
.WednesdayNight
	rematch 3, BLUE, 8, 4, DOWN, BLUE
	endcallback

.Thursday
	checktime 1 << MORN
	iftruefwd .ThursdayMorning
	checktime (1 << EVE) | (1 << NITE)
	iftruefwd .ThursdayNight
.ThursdayDay
	checkevent EVENT_BEAT_PALMER
	iffalsefwd .NoPalmer
	rematch 3, PALMER, 3, 6, DOWN, GREEN
.NoPalmer
	endcallback
.ThursdayMorning
	rematch 1, BUGSY, 1, 6, DOWN, GREEN
	endcallback
.ThursdayNight
	rematch 2, MORTY, 2, 4, DOWN, BROWN
	endcallback

.Friday
	checktime 1 << MORN
	iftruefwd .FridayMorning
	checktime (1 << EVE) | (1 << NITE)
	iftruefwd .FridayNight
.FridayDay
	checkevent EVENT_BEAT_YELLOW
	iffalsefwd .NoYellow
	rematch 3, YELLOW, 6, 6, DOWN, ORANGE
.NoYellow
	endcallback
.FridayMorning
	rematch 1, SURGE, 6, 7, DOWN, BROWN
	endcallback
.FridayNight
	rematch 2, CLAIR, 2, 6, RIGHT, BLUE
	endcallback

.Saturday
	checktime 1 << MORN
	iftruefwd .SaturdayMorning
	checktime (1 << EVE) | (1 << NITE)
	iftruefwd .SaturdayNight
.SaturdayDay
	rematch 1, WHITNEY, 3, 6, RIGHT, RED
	rematch 2, CHUCK, 6, 6, LEFT, BROWN
	endcallback
.SaturdayMorning
	rematch 1, WHITNEY, 3, 6, RIGHT, RED
	endcallback
.SaturdayNight
	checkevent EVENT_BEAT_AGATHA
	iffalsefwd .NoAgatha
	rematch 3, AGATHA, 2, 4, DOWN, BROWN
.NoAgatha
	endcallback

FightingDojoBlackBelt:
	checkevent EVENT_BEAT_BLUE
	iftrue_jumptextfaceplayer BlackBeltText_ExplainsRematches
	jumpthistextfaceplayer

	text "Hallo!"
	para "Der"
	line "KARATE-MEISTER,"
	cont "der"
	para "Leiter des KARATE"
	line "DOJO, übt in einer"
	cont "Höhle in JOHTO."
	done
MapFightingDojoSignpost2Script:
	opentext
	writetext FightingDojoScheduleQuestionText
	yesorno
	iffalse_endtext
.sunday
	writetext FightingDojoScheduleSundayText
	waitbutton
.monday
	checkevent EVENT_BEAT_WALKER
	iftruefwd .monday_walker
	writetext FightingDojoScheduleMondayText
	waitbutton
	sjumpfwd .tuesday
.monday_walker
	writetext FightingDojoScheduleMondayWalkerText
	waitbutton
.tuesday
	checkevent EVENT_BEAT_LORELEI_AGAIN
	iftruefwd .tuesday_lorelei
	writetext FightingDojoScheduleTuesdayText
	waitbutton
	sjumpfwd .wednesday
.tuesday_lorelei
	writetext FightingDojoScheduleTuesdayLoreleiText
	waitbutton
.wednesday
	writetext FightingDojoScheduleWednesdayText
	waitbutton
.thursday
	checkevent EVENT_BEAT_PALMER
	iftruefwd .thursday_palmer
	writetext FightingDojoScheduleThursdayText
	waitbutton
	sjumpfwd .friday
.thursday_palmer
	writetext FightingDojoScheduleThursdayPalmerText
	waitbutton
.friday
	checkevent EVENT_BEAT_YELLOW
	iftruefwd .friday_yellow
	writetext FightingDojoScheduleFridayText
	waitbutton
	sjumpfwd .saturday
.friday_yellow
	writetext FightingDojoScheduleFridayYellowText
	waitbutton
.saturday
	checkevent EVENT_BEAT_AGATHA
	iftruefwd .saturday_agatha
	jumpthisopenedtext

	text "Saturday: BIANKA,"
	line "HARTWIG,???"
	done
.saturday_agatha
	jumpthisopenedtext

	text "Saturday: BIANKA,"
	line "HARTWIG, Agatha"
	done

BlackBeltText_ExplainsRematches:
	text "Arenaleiter aus"
	line "Kanto und Johto"

	para "kommen in dieses"
	line "Kampf-DOJO zum"
	cont "Training."

	para "Du solltest dich"
	line "anschließen!"
	done

FightingDojoSign1Text:
	text "Es geschieht, was"
	line "geschehen muss!"
	done





FightingDojoSign2Text:
	text "Feinde, wo man"
	line "hinsieht!"
	done






MACRO rematch_script
	; rematch_script name, trainer, flag
	checkflag ENGINE_GYM_LEADER_REMATCH_\3
	iftrue_jumptextfaceplayer \1Text_Done
	faceplayer
	showtext \1Text_Greeting
	winlosstext \1Text_WinLoss, 0
	loadtrainer \2, 2
	startbattle
	reloadmapafterbattle
	setflag ENGINE_GYM_LEADER_REMATCH_\3
	end
ENDM

FightingDojoRematch1Script:
	readvar VAR_WEEKDAY
	ifequalfwd MONDAY, .Falkner
	ifequalfwd TUESDAY, .Pryce
	ifequalfwd WEDNESDAY, .Brock
	ifequalfwd THURSDAY, .Bugsy
	ifequalfwd FRIDAY, .Surge
	ifequalfwd SATURDAY, .Whitney

.Jasmine
	rematch_script Jasmine, JASMINE, 1

.Falkner
	rematch_script Falkner, FALKNER, 1

.Pryce
	rematch_script Pryce, PRYCE, 1

.Brock
	rematch_script Brock, BROCK, 1

.Bugsy
	rematch_script Bugsy, BUGSY, 1

.Surge
	rematch_script Surge, LT_SURGE, 1

.Whitney
	rematch_script Whitney, WHITNEY, 1

FightingDojoRematch2Script:
	readvar VAR_WEEKDAY
	ifequalfwd MONDAY, .Janine
	ifequalfwd TUESDAY, .Blaine
	ifequalfwd WEDNESDAY, .Misty
	ifequalfwd THURSDAY, .Morty
	ifequalfwd FRIDAY, .Clair
	ifequalfwd SATURDAY, .Chuck

.Erika
	rematch_script Erika, ERIKA, 2

.Janine
	rematch_script Janine, JANINE, 2

.Blaine
	rematch_script Blaine, BLAINE, 2

.Misty
	rematch_script Misty, MISTY, 2

.Morty
	rematch_script Morty, MORTY, 2

.Clair
	rematch_script Clair, CLAIR, 2

.Chuck
	rematch_script Chuck, CHUCK, 2

FightingDojoRematch3Script:
	readvar VAR_WEEKDAY
	ifequalfwd MONDAY, .Walker
	ifequalfwd TUESDAY, .Lorelei
	ifequalfwd WEDNESDAY, .Blue
	ifequalfwd THURSDAY, .Palmer
	ifequalfwd FRIDAY, .Yellow
	ifequalfwd SATURDAY, .Agatha

.Sabrina
	rematch_script Sabrina, SABRINA, 3

.Walker
	rematch_script Walker, WALKER, 3

.Lorelei
	rematch_script Lorelei, LORELEI, 3

.Blue
	rematch_script Blue, BLUE, 3

.Palmer
	rematch_script Palmer, TOWERTYCOON, 3

.Yellow
	rematch_script Yellow, YELLOW, 3

.Agatha
	rematch_script Agatha, AGATHA, 3

BrockText_Greeting:
	text "Ich mag"
	line "Gesteins-#mon"
	cont "am meisten."
	para "Sie sind hart und"
	line "rau, aber trotzdem"
	cont "spröde."
	para "Du wirst sehen,"
	line "wie viel stärker"
	para "meine"
	line "Stein-#mon"
	cont "geworden sind!"
	done

MistyText_Greeting:
	text "Ich hab viel Gutes"
	line "über dich gehört"
	para "seit unserem"
	line "letzten Kampf."
	para "Lass mich testen,"
	line "wie gut du bist!"
	done

SurgeText_Greeting:
	text "Ich spüre starke"
	line "Elektro-Kraft um"

	para "den Magnetzug!"

	para "Ich bin heiß auf"
	line "einen"
	cont "elektrisierenden"
	cont "Kampf!"
	done

ErikaText_Greeting:
	text "Schön, dich wieder"
	line "zu sehen!"
	para "Wie geht's dir?"
	para "Der Ort passt"
	line "nicht so zu mir,"
	cont "aber …"
	para "egal, lass uns"
	line "kämpfen!"
	done

JanineText_Greeting:
	text "Ich kann meine"
	line "Ninja-Technik"
	para "nicht nutzen, aber"
	line "ich lasse"
	para "dich nicht"
	line "gewinnen!"
	done

SabrinaText_Greeting:
	text "Ich wusste, dass"
	line "du wieder kommst,"

	para "um gegen mich zu"
	line "kämpfen."

	para "Ich hatte so ein"
	line "Gefühl."
	done

BlaineText_Greeting:
	text "Meine ARENA gibt's"
	line "noch nicht. Also"
	para "halten wir unser"
	line "Revanche-Match"
	cont "genau hier!"
	done

BlueText_Greeting:
	text "Gut! Du bist auch"
	line "hier."

	para "Danke, dass du"
	line "gekommen bist,"

	para "um gegen mich zu"
	line "verlieren!"
	done

FalknerText_Greeting:
	text "Ich bin heute in"
	line "Topform."
	para "Es ist schön,"
	line "wieder gegen dich"
	cont "kämpfen zu dürfen!"
	done

BugsyText_Greeting:
	text "Schön, dich wieder"
	line "zu sehen! Sieh dir"
	cont "meine"
	cont "Käfer-Forschung"
	cont "an!"
	done

WhitneyText_Greeting:
	text "Hallo, <PLAYER>! Da"
	line "wir beide hier"
	para "sind, lass uns"
	line "kämpfen!"
	para "Bist du bereit?"
	done

MortyText_Greeting:
	text "Das legendäre"
	line "#mon hat mich"
	cont "nicht gewählt …"
	para "Aber das heißt"
	line "nicht, dass mir"
	para "die Zukunft fehlt."
	line "Lass uns kämpfen!"
	done

ChuckText_Greeting:
	text "Da bist du ja!"
	para "Koste mein"
	line "24-Stunden-"
	cont "Training!"
	done

JasmineText_Greeting:
	text "Hallo, <PLAYER>…"
	line "Wie geht's dir?"
	cont "Mir geht's gut…"

	para "Bist du bereit,"
	line "wieder gegen mich"
	cont "zu kämpfen?"
	done

PryceText_Greeting:
	text "Worte sind nicht"
	line "nötig. Ein"
	cont "#mon-Kampf ist"

	para "unser Weg, uns zu"
	line "verständigen."
	done

ClairText_Greeting:
	text "… Also bist du da."
	para "Jetzt kämpfen wir!"
	done

PalmerText_Greeting:
	text "Du hast es also"
	line "bis hierher"
	cont "geschafft!"
	para "Als Turm-Tycoon"
	line "werde ich dir"
	para "mein Bestes geben."
	para "So zeigen die"
	line "besten Trainer"
	para "einander Respekt."
	para "Indem sie als"
	line "echte #mon-"
	para "Schüler mit vollem"
	line "Einsatz kämpfen!"
	done

LoreleiText_Greeting:
	text "Hallo wieder,"
	line "<PLAYER>."
	para "Jetzt sind wir auf"
	line "meinem Heimrevier."
	para "Ich werde nicht"
	line "verlieren!"
	done

AgathaText_Greeting:
	text "Hallo, Kind."
	para "Füllst du noch"
	line "einen #dex für"
	para "den alten Prof."
	line "Lind?"
	para "#mon sind zum"
	line "Kämpfen da!"
	para "Zeig mir dein"
	line "wahres Talent als"
	cont "Trainer!"
	done

WalkerText_Greeting:
	text "Hey, <PLAYER>!"
	para "Mein Sohn FALK war"
	line "wohl gerade"
	para "nicht hier…"
	para "Wie wär's, wenn"
	line "wir stattdessen"
	cont "kämpfen?"
	done

YellowText_Greeting:
	text "Hallo, <PLAYER>!"
	para "Mal sehen …"
	para "Ja! Du kümmerst"
	line "dich noch gut um"
	cont "deine #mon!"
	para "Du bist stärker"
	line "geworden, aber ich"
	cont "auch!"
	done

BrockText_WinLoss:
	text "Ich hab wieder"
	line "verloren…"

	para "Du machst diese"
	line "Reise nicht"
	cont "umsonst!"
	done

MistyText_WinLoss:
	text "Toll! Du wirst mit"
	line "jedem Kampf"
	cont "stärker!"
	done

SurgeText_WinLoss:
	text "Du bist sehr"
	line "stark!"
	para "Aber ich werde"
	line "meine Schuld eines"
	cont "Tages begleichen!"
	done

ErikaText_WinLoss:
	text "Du bist noch"
	line "stärker geworden…"
	done

JanineText_WinLoss:
	text "Ich hab heute"
	line "verloren, aber"

	para "nächstes Mal"
	line "gewinne ich!"
	done

SabrinaText_WinLoss:
	text "Ich weiß… wir"
	line "werden uns wieder"
	cont "begegnen."
	done

BlaineText_WinLoss:
	text "Waaah! Ich bin"
	line "wieder"
	cont "ausgebrannt!"
	done

BlueText_WinLoss:
	text "Genau wie ich"
	line "dachte!"

	para "Kein Wunder, dass"
	line "du Champion"
	cont "geworden bist…"
	done

FalknerText_WinLoss:
	text "Mmm … Bis zum"
	line "besten Trainer ist"
	cont "es noch weit …"
	done

BugsyText_WinLoss:
	text "Du hast dich wohl"
	line "viel mit #mon"
	cont "beschäftigt!"
	done

WhitneyText_WinLoss:
	text "Du bist wirklich"
	line "stark!"

	para "Aber nächstes Mal"
	line "verliere ich"
	cont "nicht!"
	done

MortyText_WinLoss:
	text "Ich hab wieder"
	line "verloren… Du hast"

	para "mehr als nur"
	line "Kraft."
	done

ChuckText_WinLoss:
	text "Wahaha! Ein Kampf"
	line "mit dir wird nie"
	cont "langweilig!"
	done

JasmineText_WinLoss:
	text "Deinem Ruf"
	line "entsprechend…"
	done

PryceText_WinLoss:
	text "Mmm…"
	line "Beeindruckend!"
	done

ClairText_WinLoss:
	text "Nicht schlecht. …"

	para "Jetzt gib alles!"
	done

PalmerText_WinLoss:
	text "Bravo! Mein Herz"
	line "fühlt sich"
	cont "inspiriert!"
	done

LoreleiText_WinLoss:
	text "Wie kannst du nur!"
	done

AgathaText_WinLoss:
	text "Juhu!"
	done

WalkerText_WinLoss:
	text "Ich war dir nicht"
	line "gewachsen!"
	done

YellowText_WinLoss:
	text "Hahaha!"
	done

BrockText_Done:
MistyText_Done:
SurgeText_Done:
ErikaText_Done:
JanineText_Done:
SabrinaText_Done:
BlaineText_Done:
BlueText_Done:
FalknerText_Done:
BugsyText_Done:
WhitneyText_Done:
MortyText_Done:
ChuckText_Done:
JasmineText_Done:
PryceText_Done:
ClairText_Done:
PalmerText_Done:
LoreleiText_Done:
AgathaText_Done:
WalkerText_Done:
YellowText_Done:
	text "Ich bin für heute"
	line "mit Kämpfen"
	cont "fertig."
	done

FightingDojoScheduleQuestionText:
	text "Ein Trainingsplan!"
	line "Lesen?"
	done

FightingDojoScheduleSundayText:
	text "Sonntag: JASMIN,"
	line "ERIKA, SABRINA"
	done

FightingDojoScheduleMondayText:
	text "Montag: FALK,"
	line "JANINA,???"
	done

FightingDojoScheduleMondayWalkerText:
	text "Montag: FALK,"
	line "JANINA, WALKER"
	done

FightingDojoScheduleTuesdayText:
	text "Dienstag: NORBERT,"
	line "PYRO,???"
	done

FightingDojoScheduleTuesdayLoreleiText:
	text "Dienstag: NORBERT,"
	line "PYRO, LORELEI"
	done

FightingDojoScheduleWednesdayText:
	text "Mittwoch: ROCKO,"
	line "MISTY, BLAU"
	done

FightingDojoScheduleThursdayText:
	text "Donnerstag:"
	line "KAI,???, JENS"
	done

FightingDojoScheduleThursdayPalmerText:
	text "Donnerstag: KAI,"
	line "PALMER, JENS"
	done

FightingDojoScheduleFridayText:
	text "Freitag: MAJOR"
	line "BOB,???, SANDRA"
	done

FightingDojoScheduleFridayYellowText:
	text "Freitag: MAJOR"
	line "BOB, YELLOW,"
	cont "SANDRA"
	done
