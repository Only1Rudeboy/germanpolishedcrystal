ScaryCave1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 33, 31, URAGA_CHANNEL_EAST, 1
	warp_event 11, 31, URAGA_CHANNEL_WEST, 1
	warp_event 20, 30, SCARY_CAVE_B1F, 1
	warp_event 34, 10, SCARY_CAVE_B1F, 2
	warp_event  9,  1, SCARY_CAVE_SHIPWRECK, 1

	def_coord_events

	def_bg_events
	bg_event 34,  3, BGEVENT_ITEM + MAX_ELIXIR, EVENT_SCARY_CAVE_1F_HIDDEN_MAX_ELIXIR
	bg_event 18, 28, BGEVENT_ITEM + PEARL_STRING, EVENT_SCARY_CAVE_1F_HIDDEN_PEARL_STRING
	bg_event 30, 29, BGEVENT_ITEM + PEARL, EVENT_SCARY_CAVE_1F_HIDDEN_PEARL

	def_object_events
	object_event 15,  5, SPRITE_MIRA, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, ScaryCave1FMiraScript, EVENT_SCARY_CAVE_MIRA
	object_event  8, 24, SPRITE_BURGLAR, SPRITEMOVEDATA_WANDER, 1, 2, -1, 0, OBJECTTYPE_SCRIPT, 0, ScaryCave1FPharmacistScript, -1
	object_event 36,  2, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerRuin_maniacSmilte, -1
	object_event  8, 18, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSuper_nerdKouta, -1
	object_event 22, 20, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_DARK_RED, OBJECTTYPE_TRAINER, 1, TrainerCoupleJoeandjo1, -1
	object_event 23, 20, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_DARK_RED, OBJECTTYPE_TRAINER, 1, TrainerCoupleJoeandjo2, -1
	object_event 37, 16, SPRITE_HEX_MANIAC, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerHex_maniacBethany, -1
	object_event 36, 29, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 0, GenericTrainerScientistPiotr, -1
	itemball_event 27,  7, X_SP_DEF, 1, EVENT_SCARY_CAVE_1F_X_SP_DEF
	itemball_event  4,  9, DUSK_STONE, 1, EVENT_SCARY_CAVE_1F_DUSK_STONE
	itemball_event 33, 19, HYPER_POTION, 1, EVENT_SCARY_CAVE_1F_HYPER_POTION
	itemball_event 28, 23, MAX_REPEL, 1, EVENT_SCARY_CAVE_1F_MAX_REPEL
	itemball_event  3, 29, REVIVE, 1, EVENT_SCARY_CAVE_1F_REVIVE

	object_const_def
	const SCARYCAVE1F_MIRA

ScaryCave1FMiraScript:
	faceplayer
	checkevent EVENT_BEAT_MIRA
	iftruefwd .Beaten
	opentext
	writetext .ChallengeText
	yesorno
	iffalse_jumpopenedtext .NoText
	writetext .YesText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked SCARYCAVE1F_MIRA
	loadtrainer MIRA, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_MIRA
.Beaten
	opentext
	writetext .ItemText
	promptbutton
	verbosegiveitem POWER_LENS
	iffalse_endtext
	writetext .GoodbyeText
	waitbutton
	closetext
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear SCARYCAVE1F_MIRA
	pause 15
	special Special_FadeInQuickly
	clearevent EVENT_BATTLE_TOWER_MIRA
	end

.ChallengeText:
	text "Ich bin Mira … Ich"
	line "habe #MON"
	para "gefangen, aber"
	line "diese Höhle ist"
	cont "mir zu gruselig …"
	para "Ich will stärker"
	line "werden, damit ich"
	cont "keine Angsthase"
	cont "mehr bin."
	para "Bitte! Bitte kämpf"
	line "mit mir!"
	done

.YesText:
	text "Ja! Mira zeigt dir"
	line "ihre #MON!"
	done

.NoText:
	text "Mira ist traurig…"
	done

.BeatenText:
	text "Mira möchte viel,"
	line "viel stärker"
	cont "werden, wie"
	cont "<PLAYER>!"
	done

.ItemText:
	text "<PLAYER>, bist du"
	line "so gut geworden,"

	para "weil du immer bei"
	line "deinen #MON"
	cont "bist?"

	para "Ja! Das muss es"
	line "sein!"

	para "Mira fängt an, es"
	line "zu verstehen!"

	para "Danke, <PLAYER>!"

	para "Mira möchte, dass"
	line "du das hast!"
	done

.GoodbyeText:
	text "Mira versucht es"
	line "wie du, <PLAYER>!"
	para "Ich werde im"
	line "DUELLTURM stärker!"
	para "<PLAYER>, tschüss!"
	done

ScaryCave1FPharmacistScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_SUCKER_PUNCH_INTRO
	iftruefwd .HeardIntro
	writetext .IntroText
	waitbutton
	setevent EVENT_LISTENED_TO_SUCKER_PUNCH_INTRO
.HeardIntro:
	writetext .QuestionText
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	yesorno
	iffalsefwd .TutorRefused
	setval SUCKER_PUNCH
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpthisopenedtext

	text "Wie du meinst."
	done

.IntroText:
	text "Geister sind"
	line "Meister der"
	cont "hinterhältigen"
	cont "Attacke."

	para "Man muss sie"
	line "zuerst treffen!"

	para "Verpasse ihnen"
	line "einen Sucker"
	cont "Punch!"
	done

.QuestionText:
	text "Ich bringe dir"
	line "Sucker Punch bei,"

	para "aber ich will ein"
	line "Silberblatt."
	done

.NoSilverLeaf
	waitbutton
	jumpthisopenedtext

	text "Kein Silberblatt?"
	line "Dann vergiss es."
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "Jetzt kannst du"
	line "Sucker Punch"
	cont "nutzen!"

	para "Greift ein Gegner"
	line "dich an, triffst"
	cont "du zuerst!"
	done

GenericTrainerRuin_maniacSmilte:
	generictrainer RUIN_MANIAC, SMILTE, EVENT_BEAT_RUIN_MANIAC_SMILTE, .SeenText, .BeatenText

	text "Ich höre ein Echo."
	line "In der Nähe gibt"
	cont "es eine tiefere"
	cont "Höhle!"
	para "Vielleicht finde"
	line "ich dort meine"
	cont "große Entdeckung …"
	done

.SeenText:
	text "Ich stehe kurz vor"
	line "einer großen"
	cont "Entdeckung!"
	para "Ich spüre es!"
	done

.BeatenText:
	text "Willst du meine"
	line "Entdeckung"
	cont "stehlen?!"
	done

GenericTrainerSuper_nerdKouta:
	generictrainer SUPER_NERD, KOUTA, EVENT_BEAT_SUPER_NERD_KOUTA, .SeenText, .BeatenText

	text "Selbst die besten"
	line "Pläne können"

	para "manchmal"
	line "scheitern."
	done

.SeenText:
	text "Du kannst mich"
	line "nicht schlagen!"

	para "Ich habe den"
	line "perfekten Plan!"
	done

.BeatenText:
	text "Mein Plan ist"
	line "gescheitert?!"

	para "Zurück an die"
	line "Zeichenbrett…"
	done

TrainerCoupleJoeandjo1:
	trainer COUPLE, JOEANDJO1, EVENT_BEAT_COUPLE_JOE_AND_JO, .SeenText, .BeatenText, 0, .Script, TRAINERPAL_DARK_COUPLE

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "Joe: Wir sind auf"
	line "Geisterjagd, aber"

	para "mir ist nicht"
	line "bange, solange"
	cont "meine Jo bei mir"
	cont "ist!"
	done

.SeenText:
	text "Joe: Ein Geist!"
	line "Bleib nah bei mir,"
	cont "meine liebe Jo!"
	done

.BeatenText:
	text "Joe: Oh. Es war"
	line "nur ein Trainer."
	done

TrainerCoupleJoeandjo2:
	trainer COUPLE, JOEANDJO2, EVENT_BEAT_COUPLE_JOE_AND_JO, .SeenText, .BeatenText, 0, .Script, TRAINERPAL_DARK_COUPLE

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "Jo: Ich hab so"
	line "viel Glück, dass"
	cont "mein wunderbarer"
	para "Joe alle"
	line "gruseligen Geister"
	cont "vertreibt."
	done

.SeenText:
	text "Jo: Eek! Halte"
	line "mich fest, Joe!"
	done

.BeatenText:
	text "Jo: Hast du keine"
	line "Angst?"
	done

GenericTrainerHex_maniacBethany:
	generictrainer HEX_MANIAC, BETHANY, EVENT_BEAT_HEX_MANIAC_BETHANY, .SeenText, .BeatenText

	text "Die"
	line "Angstatmosphäre in"
	cont "dieser Höhle ist"
	cont "herrlich …"
	cont "Fufufufu …"
	done

.SeenText: ; text > text
	text "BUH!"
	done

.BeatenText:
	text "Hab ich dich"
	line "erschreckt?"
	done

GenericTrainerScientistPiotr:
	generictrainer SCIENTIST, PIOTR, EVENT_BEAT_SCIENTIST_PIOTR, .SeenText, .BeatenText

	text "Hier wächst Alge"
	line "und färbt das"

	para "Wasser trübe."
	line "Davor brauchst du"
	cont "keine Angst zu"
	cont "haben! …Oder?"
	done

.SeenText:
	text "Weißt du, warum"
	line "das Wasser hier so"
	cont "dunkel ist?"
	done

.BeatenText:
	text "Gut, ich verrate"
	line "es dir!"
	done
