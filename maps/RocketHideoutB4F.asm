RocketHideoutB4F_MapScriptHeader:
	def_scene_scripts
	scene_script RocketHideoutB4FMeetLeadersScene, SCENE_ROCKETHIDEOUTB4F_MEET_LEADERS
	scene_script RocketHideoutB4FMetLeadersScene, SCENE_ROCKETHIDEOUTB4F_MET_LEADERS
	scene_const SCENE_ROCKETHIDEOUTB4F_NOOP

	def_callbacks
	callback MAPCALLBACK_OBJECTS, RocketHideoutB4FLiftKeyScript
	callback MAPCALLBACK_TILES, RocketHideoutB4FDoorScript

	def_warp_events
	warp_event 11, 10, ROCKET_HIDEOUT_B3F, 2
	warp_event 16, 15, ROCKET_HIDEOUT_ELEVATOR, 1
	warp_event 17, 15, ROCKET_HIDEOUT_ELEVATOR, 1

	def_coord_events
	coord_event 16, 11, SCENE_ROCKETHIDEOUTB4F_MEET_LEADERS, RocketHideoutB4FMeetLeadersLeftScript
	coord_event 17, 11, SCENE_ROCKETHIDEOUTB4F_MEET_LEADERS, RocketHideoutB4FMeetLeadersRightScript

	def_bg_events
	bg_event 17,  1, BGEVENT_ITEM + MAX_POTION, EVENT_ROCKET_HIDEOUT_B4F_HIDDEN_MAX_POTION

	def_object_events
	object_event 17,  3, SPRITE_CANDELA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, (1 << EVE) | (1 << NITE), 0, OBJECTTYPE_SCRIPT, 0, RocketHideoutB4FCandelaScript, -1
	object_event 16,  6, SPRITE_SPARK, SPRITEMOVEDATA_STANDING_UP, 0, 0, (1 << EVE) | (1 << NITE), 0, OBJECTTYPE_SCRIPT, 0, RocketHideoutB4FSparkScript, -1
	object_event 19,  6, SPRITE_BLANCHE, SPRITEMOVEDATA_STANDING_UP, 0, 0, (1 << EVE) | (1 << NITE), 0, OBJECTTYPE_SCRIPT, 0, RocketHideoutB4FBlancheScript, -1
	object_event  3,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, RocketHideoutB4FYoungsterArdenScript, -1
	object_event 15, 12, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 2, RocketHideoutB4FTeacherSerena, -1
	object_event 18, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 2, RocketHideoutB4FSuperNerdNolan, -1
	keyitemball_event 2,  2, LIFT_KEY, EVENT_ROCKET_HIDEOUT_B4F_LIFT_KEY
	itemball_event 1,  4, X_SP_ATK,    1, EVENT_ROCKET_HIDEOUT_B4F_X_SP_ATK
	itemball_event 2, 12, PP_UP,        1, EVENT_ROCKET_HIDEOUT_B4F_PP_UP
	itemball_event 4, 20, DUBIOUS_DISC, 1, EVENT_ROCKET_HIDEOUT_B4F_DUBIOUS_DISC

	object_const_def
	const ROCKETHIDEOUTB4F_CANDELA
	const ROCKETHIDEOUTB4F_SPARK
	const ROCKETHIDEOUTB4F_BLANCHE
	const ROCKETHIDEOUTB4F_YOUNGSTER_ARDEN
	const ROCKETHIDEOUTB4F_TEACHER_SERENA
	const ROCKETHIDEOUTB4F_SUPER_NERD_NOLAN
	const ROCKETHIDEOUTB4F_LIFT_KEY

RocketHideoutB4FDoorScript:
	checkevent EVENT_BEAT_TEACHER_SERENA
	iftruefwd .beat_serena
	changeblock 16, 10, $07
	endcallback
.beat_serena
	checkevent EVENT_BEAT_SUPER_NERD_NOLAN
	iftruefwd .beat_theo
	changeblock 16, 10, $07
	endcallback
.beat_theo
	changeblock 16, 10, $0d
	endcallback

RocketHideoutB4FLiftKeyScript:
	checkevent EVENT_BEAT_YOUNGSTER_ARDEN
	iftruefwd .beat_arden
	disappear ROCKETHIDEOUTB4F_LIFT_KEY
.beat_arden
	endcallback

RocketHideoutB4FMeetLeadersLeftScript:
	checktime (1 << EVE) | (1 << NITE)
	iffalse TooEarly
	applymovement PLAYER, .MovePlayerUp
	sjumpfwd RocketHideoutB4FMeetLeadersScript

.MovePlayerUp:
	step_up
	step_up
	step_up
	step_up
	step_right
	turn_head_up
	step_end

RocketHideoutB4FMeetLeadersRightScript:
	checktime (1 << EVE) | (1 << NITE)
	iffalse TooEarly
	applymovement PLAYER, .MovePlayerUp
	sjumpfwd RocketHideoutB4FMeetLeadersScript

.MovePlayerUp:
	step_up
	step_up
	step_up
	step_up
	step_end

RocketHideoutB4FMeetLeadersScript:
	setscene SCENE_ROCKETHIDEOUTB4F_MET_LEADERS
	showtext .CandelaIntro1Text
	turnobject ROCKETHIDEOUTB4F_SPARK, RIGHT
	showtext .BlancheIntro1Text
	turnobject ROCKETHIDEOUTB4F_BLANCHE, LEFT
	turnobject ROCKETHIDEOUTB4F_SPARK, UP
	pause 20
	turnobject ROCKETHIDEOUTB4F_SPARK, RIGHT
	showtext .SparkIntro1Text
	turnobject ROCKETHIDEOUTB4F_SPARK, UP
	turnobject ROCKETHIDEOUTB4F_BLANCHE, UP
	showtext .CandelaIntro2Text
	turnobject ROCKETHIDEOUTB4F_SPARK, RIGHT
	showtext .BlancheIntro2Text
	turnobject ROCKETHIDEOUTB4F_BLANCHE, LEFT
	turnobject ROCKETHIDEOUTB4F_SPARK, UP
	showtext .SparkIntro2Text
	turnobject ROCKETHIDEOUTB4F_SPARK, DOWN
	showtext .SparkIntro3Text
	turnobject ROCKETHIDEOUTB4F_BLANCHE, DOWN
	showtext .CandelaIntro3Text
	setmapobjectmovedata ROCKETHIDEOUTB4F_SPARK, SPRITEMOVEDATA_STANDING_DOWN
	setmapobjectmovedata ROCKETHIDEOUTB4F_BLANCHE, SPRITEMOVEDATA_STANDING_DOWN
	end


.CandelaIntro1Text:
	text "Candela: Ich sag"
	line "dir, rohe Kraft"
	cont "gewinnt immer!"

	para "Training soll"
	line "hart sein, wie"
	cont "ein Kampf!"
	done

.BlancheIntro1Text:
	text "Blanche: Stärke"
	line "ist nutzlos"
	cont "ohne Strategie."

	para "Kluge Planung"
	line "gewinnt immer."
	done

.SparkIntro1Text:
	text "Spark: Ihr beiden"
	line "verpasst den"
	cont "Punkt!"

	para "Instinkt ist"
	line "alles--"
	cont "vertrau ihm!"
	done

.CandelaIntro2Text:
	text "Candela:"
	line "Instinkt?"
	line "Das ist nur"
	cont "Raten!"

	para "Echte Trainer"
	line "setzen auf"
	cont "Stärke!"
	done

.BlancheIntro2Text:
	text "Blanche: Candela,"
	line "Spark, das ist"
	cont "nicht der Moment!"

	para "Was ist mit dem"
	line "Großen Baum-"
	cont "projekt?"
	done

.SparkIntro2Text:
	text "Spark: Stimmt!"
	line "Der"
	line "große Kirsch-"
	cont "baum--"
	done

.SparkIntro3Text:
	text "Moment, wer ist"
	line "das da?"
	done

.CandelaIntro3Text:
	text "Candela: Der da"
	line "hat echte Kraft!"

	para "Da du so weit"
	line "gekommen bist,"
	cont "kämpfen wir!"

	para "Wenn du gewinnst,"
	line "verraten wir dir"
	cont "unser Projekt!"
	done

RocketHideoutB4FMeetLeadersScene:
RocketHideoutB4FMetLeadersScene:
TooEarly:
	end


RocketHideoutB4FSparkScript:
	faceplayer
	checkevent EVENT_BEAT_SPARK
	iftrue_jumptext .AfterText2
	opentext
	writetext .GreetingText
	yesorno
	iffalsefwd .Refused
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	loadtrainer SPARK_T, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_SPARK
	opentext
	writetext .AfterText1
	waitbutton
	verbosegivekeyitem MALIGN_LURE
	writetext .AfterText2
	waitbutton
	checkevent EVENT_BEAT_CANDELA
	iffalse_endtext
	checkevent EVENT_BEAT_BLANCHE
	iffalse_endtext
	sjump RocketHideoutB4FDefeatedAllLeadersScript

.Refused:
	jumpopenedtext .RefusedText

.GreetingText:
	text "Spark: Hey!"
	line "Bereit,"
	line "deinem Instinkt"
	cont "zu vertrauen?"
	done

.SeenText:
	text "Super! Mal sehen,"
	line "wie weit dein"
	cont "Instinkt reicht!"
	done

.BeatenText:
	text "Wow, du warst"
	line "echt klasse!"

	para "Dein Instinkt"
	line "hat recht gehabt!"
	done

.AfterText1:
	text "Spark: Hier ist"
	line "der Malign Lure."
	done

.AfterText2:
	text "Der Malign Lure"
	line "nutzt kühne"
	cont "Energie."

	para "So wecke ich"
	line "etwas Kreativi-"
	cont "tät!"

	para "Nutze ihn mutig!"
	done

.RefusedText:
	text "Ach, schade!"
	line "Lass dich nicht"
	cont "von Angst"
	cont "bremsen!"

	para "Komm wieder, wenn"
	line "du bereit bist."
	done

RocketHideoutB4FCandelaScript:
	faceplayer
	checkevent EVENT_BEAT_CANDELA
	iftrue_jumptext .AfterText2
	opentext
	writetext .GreetingText
	yesorno
	iffalsefwd .Refused
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	loadtrainer CANDELA, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CANDELA
	opentext
	writetext .AfterText1
	waitbutton
	verbosegivekeyitem HARSH_LURE
	writetext .AfterText2
	waitbutton
	checkevent EVENT_BEAT_SPARK
	iffalse_endtext
	checkevent EVENT_BEAT_BLANCHE
	iffalse_endtext
	sjump RocketHideoutB4FDefeatedAllLeadersScript

.Refused:
	jumpopenedtext .RefusedText

.GreetingText:
	text "Candela: Bereit,"
	line "deine Stärke zu"
	cont "testen?"
	done

.SeenText:
	text "So ist es recht!"
	line "Zeig mir deine"
	cont "Kraft!"
	done

.BeatenText:
	text "Okay, du hast"
	line "heute deine"
	cont "Stärke bewiesen."

	para "Ich gebe zu:"
	line "Du hast gewonnen."
	done

.AfterText1:
	text "Candela: Hier ist"
	line "der Harsh Lure."
	done

.AfterText2:
	text "Candela: Der"
	line "Harsh"
	line "Lure zieht wilde"
	cont "Kraft an."

	para "Das ist mein Bei-"
	line "trag zum Projekt."

	para "Nutze ihn weise."
	done

.RefusedText:
	text "Nein? Wohl noch"
	line "nicht bereit."

	para "Komm wieder, wenn"
	line "du mehr Feuer"
	cont "hast!"
	done

RocketHideoutB4FBlancheScript:
	faceplayer
	checkevent EVENT_BEAT_BLANCHE
	iftrue_jumptext .AfterText2
	opentext
	writetext .GreetingText
	yesorno
	iffalsefwd .Refused
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	loadtrainer BLANCHE, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BLANCHE
	opentext
	writetext .AfterText1
	waitbutton
	verbosegivekeyitem POTENT_LURE
	writetext .AfterText2
	waitbutton
	checkevent EVENT_BEAT_SPARK
	iffalse_endtext
	checkevent EVENT_BEAT_CANDELA
	iffalse_endtext
	sjump RocketHideoutB4FDefeatedAllLeadersScript

.Refused:
	jumpopenedtext .RefusedText

.GreetingText:
	text "Blanche: Schätzt"
	line "du Strategie?"

	para "Sollen wir deine"
	line "Taktik testen?"
	done

.SeenText:
	text "Sehr gut, zeig"
	line "mir deine"
	cont "Technik!"
	done

.BeatenText:
	text "Ein guter Plan,"
	line "wirklich."

	para "Du hast mich"
	line "besiegt."
	done

.AfterText1:
	text "Blanche: Das ist"
	line "der Potent Lure."
	done

.AfterText2:
	text "Der Potent Lure"
	line "verstärkt seine"
	cont "Präzision."

	para "Das ist mein Bei-"
	line "trag zum Erfolg."

	para "Nutze ihn"
	line "vorsich-"
	line "tig."
	done

.RefusedText:
	text "Hmm, nicht"
	line "so selbstsicher?"

	para "Komm wieder, wenn"
	line "du bereit bist,"
	cont "vorauszudenken."
	done

RocketHideoutB4FYoungsterArdenScript:
	faceplayer
	checkevent EVENT_BEAT_YOUNGSTER_ARDEN
	iftruefwd .AfterBattle
	showtext .GreetingText
	winlosstext .BeatenText, 0
	loadtrainer YOUNGSTER, ARDEN
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_YOUNGSTER_ARDEN
	readvar VAR_FACING
	ifnotequal RIGHT, .NotLeftOfArden
	moveobject ROCKETHIDEOUTB4F_LIFT_KEY, 4, 2
.NotLeftOfArden
	appear ROCKETHIDEOUTB4F_LIFT_KEY
.AfterBattle
	showtext .AfterText
	end

.GreetingText
	text "Team Valor ist…"

	para "Moment--nein!"

	para "Ich meine, ich"
	line "glaube, ich bin"
	cont "verlaufen!"
	done

.BeatenText:
	text "Wo war noch mal"
	line "der Aufzug?"
	done

.AfterText:
	text "Ach nein, der"
	line "Aufzugsschlüssel!"

	para "Candela wird"
	line "sauer sein!"
	done

RocketHideoutB4FTeacherSerena:
	trainer TEACHER_F, SERENA, EVENT_BEAT_TEACHER_SERENA, .SeenText, .AfterText, 0, .Script

.Script
	checkevent EVENT_BEAT_TEACHER_SERENA
	iftruefwd .AfterScript
	jumpthistextfaceplayer

.AfterScript
	checkevent EVENT_BEAT_SUPER_NERD_NOLAN
	iftruefwd .DoorScript
	endifjustbattled
	jumptextfaceplayer .AfterText
	end

.DoorScript
	checkjustbattled
	iffalsefwd .skip_open
	changeblock 16, 10, $0d
	playsound SFX_ENTER_DOOR
	waitsfx
	refreshmap
	special RestartMapMusic
	end
.skip_open
	jumptextfaceplayer .AfterText
	end

.AfterText
	text "Die Anführer sind"
	line "nur nachts hier."

	para "Tagsüber arbeiten"
	line "sie an der"
	cont "Universität."
	done

.SeenText:
	text "Mal sehen, ob du"
	line "schlau genug"
	cont "bist,"

	para "es mit den"
	line "Anführern"
	cont "aufzunehmen!"
	done

.BeatenText:
	text "Unterricht"
	line "beendet!"
	done

RocketHideoutB4FSuperNerdNolan:
	trainer TEACHER_M, NOLAN, EVENT_BEAT_SUPER_NERD_NOLAN, .SeenText, .AfterText, 0, .Script

.Script
	checkevent EVENT_BEAT_SUPER_NERD_NOLAN
	iftruefwd .AfterScript
	jumpthistextfaceplayer

.AfterScript
	checkevent EVENT_BEAT_TEACHER_SERENA
	iftruefwd .DoorScript
	endifjustbattled
	jumptextfaceplayer .AfterText
	end

.DoorScript
	checkjustbattled
	iffalsefwd .skip_open
	changeblock 16, 10, $0d
	playsound SFX_ENTER_DOOR
	waitsfx
	refreshmap
	special RestartMapMusic
	end
.skip_open
	jumptextfaceplayer .AfterText
	end

.AfterText
	text "Die Anführer"
	line "streiten"
	line "oft, aber sie"
	cont "sind"
	cont "gute Freunde."
	done

.SeenText:
	text "Willst du die"
	line "Anführer heraus-"
	cont "fordern?"

	para "Dann musst du"
	line "zuerst mich"
	cont "besiegen!"
	done

.BeatenText:
	text "Ich hab's"
	line "vermasselt!"
	done

RocketHideoutB4FDefeatedAllLeadersScript:
	closetext
	special FadeOutPalettes
	warpfacing UP, ROCKET_HIDEOUT_B4F, 17, 7
	turnobject ROCKETHIDEOUTB4F_SPARK, DOWN
	turnobject ROCKETHIDEOUTB4F_BLANCHE, DOWN
	special LoadMapPalettes
	special FadeInPalettes_EnableDynNoApply
	showtext .FinalText
	end

.FinalText:
	text "Candela: Du bist"
	line "stärker als ich"
	cont "dachte."

	para "Die Sprays, die"
	line "wir dir gaben,"
	cont "sind mehr als sie"
	cont "wirken."

	para "Blanche: Jeder"
	line "Lure enthält die"

	para "Essenz eines"
	line "legendären Vogel-"
	cont "#mon."

	para "Sie wurden"
	line "erschaffen, um"
	cont "andere ihrer Art"
	cont "anzurufen."

	para "Spark: Aber sie"
	line "nützen nur am"
	cont "richtigen Ort."

	para "Deshalb ist der"
	line "Große Baum so"
	cont "wichtig."

	para "Candela: Der Baum"
	line "ist uralt,"

	para "ein heiliger Ort"
	line "zum Schlafen."

	para "Er ist verbunden"
	line "mit der Energie"
	cont "der Region."

	para "Blanche: Mächtige"
	line "Vögel haben sich"

	para "dort seit"
	line "Generationen"
	cont "versammelt."

	para "Der Baum"
	line "verstärkt"
	line "den Ruf der"
	cont "Lures."

	para "Spark: Wenn du"
	line "sie"
	line "dort einsetzt,"

	para "wer weiß, was"
	line "erscheinen mag!"
	done
