MurkySwamp_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  7, 35, STORMY_BEACH, 1
	warp_event  8, 35, STORMY_BEACH, 2
	warp_event 36,  5, UNION_CAVE_B1F_SOUTH, 3

	def_coord_events

	def_bg_events
	bg_event 20, 10, BGEVENT_ITEM + MULCH, EVENT_MURKY_SWAMP_HIDDEN_MULCH
	bg_event  2, 30, BGEVENT_ITEM + X_SP_DEF, EVENT_MURKY_SWAMP_HIDDEN_X_SP_DEF
	bg_event  5, 23, BGEVENT_ITEM + BIG_MUSHROOM, EVENT_MURKY_SWAMP_HIDDEN_BIG_MUSHROOM
	bg_event 40, 33, BGEVENT_ITEM + TINYMUSHROOM, EVENT_MURKY_SWAMP_HIDDEN_TINYMUSHROOM

	def_object_events
	object_event  6,  2, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, URSALUNA, -1, PAL_MON_RED, OBJECTTYPE_SCRIPT, URSALUNA_BLOODMOON_FORM, MurkySwampBloodmoonUrsaluna, EVENT_MURKY_SWAMP_BLOODMOON_URSALUNA
	object_event 40, 26, SPRITE_CHERYL, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, MurkySwampCherylScript, EVENT_MURKY_SWAMP_CHERYL
	object_event 17, 31, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, MurkySwampNurseBeatriceScript, -1
	object_event 22, 20, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerBug_catcherOscar, -1
	object_event 25, 33, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerLassAbigail, -1
	object_event  8, 13, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerPokemaniacEnzo, -1
	object_event 37, 17, SPRITE_HEX_MANIAC, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerHex_maniacMatilda, -1
	object_event  6, 22, SPRITE_FIREBREATHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerFirebreatherOleg, -1
	object_event  4, 33, SPRITE_POKEMANIAC, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, MurkySwampPokemaniacText, -1
	itemball_event 22, 13, FULL_HEAL, 1, EVENT_MURKY_SWAMP_FULL_HEAL
	itemball_event 14,  9, BIG_MUSHROOM, 1, EVENT_MURKY_SWAMP_BIG_MUSHROOM
	itemball_event 43, 23, TOXIC_ORB, 1, EVENT_MURKY_SWAMP_TOXIC_ORB
	itemball_event 14, 34, MULCH, 1, EVENT_MURKY_SWAMP_MULCH
	cuttree_event  2, 14, EVENT_MURKY_SWAMP_CUT_TREE_1
	cuttree_event  6, 19, EVENT_MURKY_SWAMP_CUT_TREE_2

	object_const_def
	const MURKYSWAMP_BLOODMOON_URSALUNA
	const MURKYSWAMP_CHERYL
	const MURKYSWAMP_NURSE

MurkySwampCherylScript:
	faceplayer
	checkevent EVENT_BEAT_CHERYL
	iftruefwd .Beaten
	opentext
	writetext .ChallengeText
	yesorno
	iffalse_jumpopenedtext .NoText
	writetext .YesText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked MURKYSWAMP_CHERYL
	loadtrainer CHERYL, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CHERYL
.Beaten
	opentext
	writetext .ItemText
	promptbutton
	verbosegiveitem POWER_WEIGHT
	iffalse_endtext
	writetext .GoodbyeText
	waitbutton
	closetext
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear MURKYSWAMP_CHERYL
	pause 15
	special Special_FadeInQuickly
	clearevent EVENT_BATTLE_TOWER_CHERYL
	end

.ChallengeText:
	text "Hallo, ich heiße"
	line "Cheryl."
	cont "Und du bist…?"

	para "O.K., du heißt"
	line "<PLAYER>."

	para "Ich freue mich"
	line "wirklich, dich"
	cont "kennenzulernen."

	para "Ich habe Angst"
	line "vor"
	line "den Geistern im"
	cont "Sumpf, also wie"

	para "wäre es mit einem"
	line "Kampf, um sie zu"
	cont "vertreiben?"
	done

.YesText:
	text "Ich warne dich,"
	line "meine #mon sind"
	cont "ziemlich wild."
	done

.NoText:
	text "Ach, aber meine"
	line "#mon wollten"
	cont "so gern kämpfen…"
	done

.BeatenText:
	text "Die richtige"
	line "Balance aus An-"
	cont "griff und Vertei-"
	cont "digung…"

	para "Das ist nicht"
	line "leicht."
	done

.ItemText:
	text "Danke,"
	line "<PLAYER>!"

	para "Jetzt komme ich"
	line "sicher durch den"
	cont "Sumpf."

	para "Er erinnert mich"
	line "an einen fernen"
	cont "Wald…"

	para "Oh, das ist mein"
	line "Dankeschön."

	para "Bitte nimm es!"
	done

.GoodbyeText:
	text "Ich gehe zum"
	line "DUELLTURM bei"
	cont "OLIVIANA CITY."

	para "Hast du davon"
	line "gehört?"

	para "Vielleicht sehen"
	line "wir uns dort"
	cont "wieder!"

	para "Tschüss!"
	done

MurkySwampNurseBeatriceScript:
	faceplayer
	checkevent EVENT_BEAT_NURSE_BEATRICE
	iftruefwd .Beaten
	showtext .SeenText
	winlosstext .BeatenText, 0
	setlasttalked MURKYSWAMP_NURSE
	loadtrainer NURSE, BEATRICE
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_NURSE_BEATRICE
.Beaten
	showtext .AfterText
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	playmusic MUSIC_HEAL
	special HealParty
	pause 60
	special Special_FadeInQuickly
	special RestartMapMusic
	jumpthistext

	text "Alles wieder"
	line "in Ordnung!"
	done

.SeenText:
	text "Ich bin eine"
	line "Schwester!"

	line "Besiege mich und"
	cont "ich heile deine"
	cont "#mon!"
	done

.BeatenText:
	text "Aber zuerst muss"
	line "ich meine eigenen"
	cont "#mon heilen…"
	done

.AfterText:
	text "Ich bin hier, um"
	line "#mon wieder"

	para "gesund zu machen—"
	line "das ist mein"
	cont "Ziel!"
	done

MurkySwampBloodmoonUrsaluna:
	faceplayer
	opentext
	writetext BloodmoonUrsalunaText
	cry URSALUNA
	pause 15
	closetext
	loadwildmon URSALUNA, URSALUNA_BLOODMOON_FORM, 60
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd .GotLevel
	loadwildmon URSALUNA, URSALUNA_BLOODMOON_FORM, 30
.GotLevel
	loadvar VAR_BATTLETYPE, BATTLETYPE_NEVER_SHINY
	startbattle
	disappear MURKYSWAMP_BLOODMOON_URSALUNA
	setevent EVENT_MURKY_SWAMP_BLOODMOON_URSALUNA
	reloadmapafterbattle
	special CheckBattleCaughtResult
	iffalsefwd .end
	setflag ENGINE_PLAYER_CAUGHT_BLOODMOON_URSALUNA
.end
	end

BloodmoonUrsalunaText:
	text "Wa-gaaah!"
	done

GenericTrainerBug_catcherOscar:
	generictrainer BUG_CATCHER, OSCAR, EVENT_BEAT_BUG_CATCHER_OSCAR, .SeenText, .BeatenText

	text "Ich bin hierher-"
	line "gekommen, um"
	cont "Käfer"
	cont "zu finden!"

	para "Niemand warnte"
	line "mich vor"
	cont "Geistern!"
	done

.SeenText:
	text "G-g-g-Geist!"
	done

.BeatenText:
	text "Hol mich hier"
	line "raus!"
	done

GenericTrainerHex_maniacMatilda:
	generictrainer HEX_MANIAC, MATILDA, EVENT_BEAT_HEX_MANIAC_MATILDA, .SeenText, .BeatenText

	text "So geh ich in die"
	line "Bäume hinein,"

	para "um Verstand zu"
	line "verlieren und"
	cont "meine Seele zu"
	cont "finden."
	done

.SeenText:
	text "In Dunkelheit,"
	line "weit und tief,"

	para "biete ich dir"
	line "ewigen Schlaf"
	cont "an."
	done

.BeatenText:
	text "Fufufufu…"
	done

GenericTrainerFirebreatherOleg:
	generictrainer FIREBREATHER, OLEG, EVENT_BEAT_FIREBREATHER_OLEG, .SeenText, .BeatenText

	text "Ohne Feuer ist es"
	line "kalt und dunkel…"
	done

.SeenText:
	text "Ich möchte ein"
	line "Feuer machen…"
	cont "aber"

	para "zündet es das"
	line "Sumpfgas und"
	cont "explodiert alles?"

	para "Zu riskant!"
	done

.BeatenText:
	text "Ich wagte es und"
	line "verlor!"
	done

GenericTrainerLassAbigail:
	generictrainer LASS, ABIGAIL, EVENT_BEAT_LASS_ABIGAIL, .SeenText, .BeatenText

	text "Das Gerücht:"
	line "Eine seltsame"
	cont "rote Kugel,"

	para "leuchtet wie ein"
	line "Blutmond."

	para "Das klingt"
	line "gruselig."
	done

.SeenText:
	text "Die Leute haben"
	line "Angst, tief in"
	cont "den Sumpf zu"
	cont "gehen."
	done

.BeatenText:
	text "Eek!"
	done

GenericTrainerPokemaniacEnzo:
	generictrainer POKEMANIAC, ENZO, EVENT_BEAT_POKEMANIAC_ENZO, .SeenText, .BeatenText

	text "Ich glaube nicht,"
	line "dass Nebulak so"

	para "ein rotes Licht"
	line "machen kann wie"
	cont "das, was ich sah."

	para "Was könnte es"
	line "sein?"
	done

.SeenText
	text "Ich sah ein"
	line "seltsa-"
	line "mes rotes Licht"

	para "in den Bäumen,"
	line "als"
	line "ich seltene #mon"
	cont "suchte!"
	done

.BeatenText
	text "Du hast nichts"
	line "zu befürchten."
	done

MurkySwampPokemaniacText:
	text "So nah an der"
	line "Küste wird das"

	para "Land mit Wasser"
	line "durchtränkt."

	para "Aber die seltenen"
	line "#mon hier"

	para "machen die Erkun-"
	line "dung lohnenswert!"
	done
