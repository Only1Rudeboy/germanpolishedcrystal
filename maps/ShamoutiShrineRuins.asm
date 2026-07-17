ShamoutiShrineRuins_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2, 18, NOISY_FOREST, 3
	warp_event  2, 19, NOISY_FOREST, 4

	def_coord_events

	def_bg_events
	bg_event  7, 10, BGEVENT_ITEM + MAX_REVIVE, EVENT_SHAMOUTI_SHRINE_RUINS_HIDDEN_MAX_REVIVE

	def_object_events
	object_event  8, 11, SPRITE_LAWRENCE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ShamoutiShrineRuinsLawrenceScript, EVENT_LAWRENCE_SHAMOUTI_SHRINE_RUINS
	object_event 10, 17, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, ShamoutiShrineRuinsGrampsText, -1
	object_event 14, 13, SPRITE_LADY, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, ShamoutiShrineRuinsLadyText, -1
	itemball_event  4, 27, RARE_CANDY, 1, EVENT_SHAMOUTI_SHRINE_RUINS_RARE_CANDY

	object_const_def
	const SHAMOUTISHRINERUINS_LAWRENCE

ShamoutiShrineRuinsLawrenceScript:
	special Special_FadeOutMusic
	pause 15
	playmusic MUSIC_ZINNIA_ENCOUNTER_ORAS
	showtextfaceplayer .SeenText
	winlosstext .BeatenText, 0
	setlasttalked SHAMOUTISHRINERUINS_LAWRENCE
	loadtrainer LAWRENCE, 1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	special DeleteSavedMusic
	playmusic MUSIC_ZINNIA_ENCOUNTER_ORAS
	opentext
	writetext .AfterText
	promptbutton
	verbosegivekeyitem SILVER_WING
	writetext .SilverWingText
	waitbutton
	closetext
	readvar VAR_FACING
	ifequalfwd UP, .up
	ifequalfwd DOWN, .down
	ifequalfwd LEFT, .left
.right
	turnobject SHAMOUTISHRINERUINS_LAWRENCE, RIGHT
	sjumpfwd .continue
.up
	turnobject SHAMOUTISHRINERUINS_LAWRENCE, UP
	sjumpfwd .continue
.down
	turnobject SHAMOUTISHRINERUINS_LAWRENCE, DOWN
	sjumpfwd .continue
.left
	turnobject SHAMOUTISHRINERUINS_LAWRENCE, LEFT
.continue
	pause 40
	showtextfaceplayer .GoodbyeText
	playsound SFX_WARP_TO
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear SHAMOUTISHRINERUINS_LAWRENCE
	waitsfx
	special Special_FadeInQuickly
	setevent EVENT_BEAT_LAWRENCE
	playmapmusic
	end

.SeenText:
	text "LAWRENCE: Ich"
	line "durchzog viele"
	cont "Regionen, um"

	para "ARKTOS, ZAPDOS und"
	line "LAVADOS zu fangen."

	para "Ohne das komplette"
	line "Set kann ich den"
	cont "Wächter des Meeres"

	para "nicht erwecken…"

	para "Du wirst mir"
	line "helfen, meine"
	cont "Sammlung zu"
	cont "vervollständigen!"
	done

.BeatenText:
	text "Unfassbar. Du"
	line "hast meine legen-"
	cont "däre Sammlung"
	cont "geschlagen…"
	done

.AfterText:
	text "LAWRENCE: Deine"
	line "#MON sind für"
	cont "dich keine bloße"

	para "Sammlung, oder?"

	para "Du behandelst sie"
	line "fast wie Freunde."

	para "War das der Grund,"
	line "dass du meine le-"
	cont "gendären #MON"
	cont "besiegt hast?"

	para "Nun, du hast dir"
	line "das verdient."
	done

.SilverWingText:
	text "Dieser SILBER-"
	line "FLÜGEL stammt vom"
	cont "Wächter des"

	para "Meeres."

	para "Der Duft sollte es"
	line "anlocken,"

	para "aber nur, wenn du"
	line "die drei geflü-"
	cont "gelten Trugbilder"

	para "gemeistert hast…"
	line "die Vögel aus"

	para "Feuer, Eis und"
	line "Blitz."

	para "So sagen es die"
	line "Legenden."
	done

.GoodbyeText:
	text "Mein Traum war,"
	line "dieses #MON zu"
	cont "besitzen,"

	para "aber du hast dich"
	line "als würdig erwie-"
	cont "sen. Nimm es."

	para "Ich beginne meine"
	line "Sammlung von vorn."

	para "Leb wohl."
	done

ShamoutiShrineRuinsGrampsText:
	text "Dieser Schrein war"
	line "prächtig, als ich"
	cont "ein Kind war."

	para "Doch leider wurde"
	line "er vor vielen"
	cont "Jahren von einem"
	cont "Sturm zerstört."

	para "Der Sturm bedrohte"
	line "die ganze Insel,"
	cont "doch"

	para "wir wurden vom"
	line "Wächter der Meere"
	cont "beschützt."

	para "Jedes Jahr danke"
	line "ich dem großen"
	cont "#MON,"

	para "das uns"
	line "beschützte."
	done

ShamoutiShrineRuinsLadyText:
	text "Ich musste auf"
	line "meiner Welttour"
	cont "unbedingt auf"

	para "SHAMOUTI-INSEL"
	line "anhalten."

	para "Angeblich gibt es"
	line "hier irgendwo ein"
	cont "sprechendes"
	cont "#MON."
	done
