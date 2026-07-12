GoldenrodGym_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_GOLDENRODGYM_NOOP
	scene_const SCENE_GOLDENRODGYM_WHITNEY_STOPS_CRYING

	def_callbacks

	def_warp_events
	warp_event  2, 17, GOLDENROD_CITY, 1
	warp_event  3, 17, GOLDENROD_CITY, 1

	def_coord_events
	coord_event  8,  5, SCENE_GOLDENRODGYM_WHITNEY_STOPS_CRYING, WhitneyCriesScript

	def_bg_events
	bg_event  1, 15, BGEVENT_READ, GoldenrodGymStatue
	bg_event  4, 15, BGEVENT_READ, GoldenrodGymStatue

	def_object_events
	object_event  9,  6, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSrandjrJoandcath1, -1
	object_event  8,  3, SPRITE_WHITNEY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodGymWhitneyScript, -1
	object_event  9, 13, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_DARK_BLUE, OBJECTTYPE_TRAINER, 4, TrainerLassCathy, -1
	object_event  9,  7, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSrandjrJoandcath2, -1
	object_event  0,  2, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBeautyVictoria, -1
	object_event 19,  5, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerBeautySamantha, -1
	object_event  5, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodGymGuyScript, -1

	object_const_def
	const GOLDENRODGYM_LASS2

GoldenrodGymWhitneyScript:
	faceplayer
	checkevent EVENT_BEAT_WHITNEY
	iftruefwd .FightDone
	showtext WhitneyBeforeText
	winlosstext WhitneyShouldntBeSoSeriousText, 0
	loadtrainer WHITNEY, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_WHITNEY
	setevent EVENT_MADE_WHITNEY_CRY
	setscene SCENE_GOLDENRODGYM_WHITNEY_STOPS_CRYING
	setevent EVENT_BEAT_BEAUTY_VICTORIA
	setevent EVENT_BEAT_BEAUTY_SAMANTHA
	setevent EVENT_BEAT_LASS_CATHY
	setevent EVENT_BEAT_SR_AND_JR_JO_AND_CATH
.FightDone:
	opentext
	checkevent EVENT_MADE_WHITNEY_CRY
	iffalsefwd .StoppedCrying
	jumpthisopenedtext

	text "Waaaaah!"

	para "Waaaaah!"

	para "…Schnüff, japs…"
	line "…Du bist gemein!"
	done
.StoppedCrying:
	checkevent EVENT_GOT_TM45_ATTRACT
	iftrue_jumpopenedtext WhitneyGoodCryText
	checkflag ENGINE_PLAINBADGE
	iftruefwd .GotPlainBadge
	writetext WhitneyWhatDoYouWantText
	promptbutton
	waitsfx
	givebadge PLAINBADGE, JOHTO_REGION
.GotPlainBadge:
	writetext WhitneyPlainBadgeText
	promptbutton
	verbosegivetmhm TM_ATTRACT
	setevent EVENT_GOT_TM45_ATTRACT
	jumpthisopenedtext

	text "Es ist ANZIEHUNG!"
	line "Es bringt den"

	para "Charme eines"
	line "#mon voll zur"
	cont "Geltung."

	para "Passt das nicht"
	line "perfekt zu einem"
	cont "süßen Ding wie"
	cont "mir? ♥"
	done

TrainerLassCathy:
	trainer LASS, CATHY, EVENT_BEAT_LASS_CATHY, LassCathySeenText, LassCathyBeatenText, 0, .Script, TRAINERPAL_DARK_LASS

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "Denken meine"
	line "#mon, dass ich"
	cont "niedlich bin?"
	done
WhitneyCriesScript:
	showemote EMOTE_SHOCK, GOLDENRODGYM_LASS2, 15
	applymovement GOLDENRODGYM_LASS2, JoWalksUpMovement
	turnobject PLAYER, DOWN
	showtext JoWhitneyCriesText
	applymovement GOLDENRODGYM_LASS2, JoWalksAwayMovement
	setscene SCENE_GOLDENRODGYM_NOOP
	clearevent EVENT_MADE_WHITNEY_CRY
	end

GenericTrainerSrandjrJoandcath1:
	generictrainer SR_AND_JR, JOANDCATH1, EVENT_BEAT_SR_AND_JR_JO_AND_CATH, SrandjrJoandcath1SeenText, SrandjrJoandcath1BeatenText

	text "Jo: Ich helfe"
	line "meiner Junior"
	cont "Cath,"

	para "einen Orden von"
	line "BIANKA zu holen."

	para "Sie wird langsam"
	line "besser."
	done

GenericTrainerSrandjrJoandcath2:
	generictrainer SR_AND_JR, JOANDCATH2, EVENT_BEAT_SR_AND_JR_JO_AND_CATH, SrandjrJoandcath2SeenText, SrandjrJoandcath2BeatenText

	text "Cath: Ich verliere"
	line "immer gegen"
	cont "BIANKA."

	para "Das ist"
	line "deprimierend."

	para "Schon gut! Wenn"
	line "ich verliere,"

	para "versuche ich es"
	line "beim nächsten Mal"
	cont "nochmal!"
	done

GenericTrainerBeautyVictoria:
	generictrainer BEAUTY, VICTORIA, EVENT_BEAT_BEAUTY_VICTORIA, BeautyVictoriaSeenText, BeautyVictoriaBeatenText

	text "Wow, du musst gut"
	line "sein, wenn du es"
	cont "schaffst, mich zu"
	cont "schlagen. Mach"
	cont "weiter so!"
	done
GenericTrainerBeautySamantha:
	generictrainer BEAUTY, SAMANTHA, EVENT_BEAT_BEAUTY_SAMANTHA, BeautySamanthaSeenText, BeautySamanthaBeatenText

	text "Ich habe MAUZI"
	line "die"
	cont "unterschiedlich-"
	cont "sten Attacken"
	cont "bei-"
	cont "gebracht…"
	done
GoldenrodGymGuyScript:
	checkevent EVENT_BEAT_WHITNEY
	iftrue_jumptextfaceplayer GoldenrodGymGuyWinText
	jumpthistextfaceplayer

	text "Yo! Zukünftiger"
	line "Champion!"

	para "Diese ARENA ist"
	line "die Heimat von"
	cont "Normal-Trainern."

	para "Ich empfehle dir,"
	line "Kampf-#mon"
	cont "einzusetzen."

	para "Aber Vorsicht—"
	line "Fee-#mon"

	para "widerstehen Kampf-"
	line "Attacken,"

	para "und die setzen wir"
	line "hier auch ein!"
	done

GoldenrodGymStatue:
	gettrainername WHITNEY, 1, STRING_BUFFER_4
	checkflag ENGINE_PLAINBADGE
	iftruefwd .Beaten
	jumpstd gymstatue1
.Beaten:
	readvar VAR_BADGES
	ifgreater 10, .LyraToo
	jumpstd gymstatue2
.LyraToo
	jumpstd gymstatue3

JoWalksUpMovement:
	step_left
	turn_head_up
	step_end

JoWalksAwayMovement:
	step_right
	turn_head_left
	step_end

WhitneyBeforeText:
	text "Ich bin BIANKA!"

	para "Jeder hat sich für"
	line "#mon"
	cont "interessiert, also"
	cont "musste ich"
	cont "mitmachen!"

	para "#mon sind"
	line "superniedlich!"

	para "Willst du kämpfen?"
	line "Sei gewarnt, ich"
	cont "bin gut!"
	done





WhitneyShouldntBeSoSeriousText:
	text "Schluchz…"

	para "…Waaaaaaah! Du"
	line "bist gemein!"

	para "Du solltest nicht"
	line "so ernst sein! Du,"
	cont "du Kind, du!"
	done





WhitneyWhatDoYouWantText:
	text "…Schnüff…"

	para "Was? Was willst"
	line "du? Einen ORDEN?"

	para "Oh, stimmt, ich"
	line "vergaß. Hier ist"
	cont "der BASISORDEN."
	done





WhitneyPlainBadgeText:
	text "Mit Hilfe des BA-"
	line "SISORDENs können"

	para "deine #mon"
	line "STÄRKE auch"
	cont "außerhalb eines"
	cont "Kampfes einsetzen."

	para "Außerdem erhöht er"
	line "die INIT deiner"
	cont "#mon."

	para "Oh, das hier"
	line "kannst du auch"
	cont "haben!"
	done





WhitneyGoodCryText:
	text "Ah, die Flennerei"
	line "hat gut getan! Be-"

	para "suche mich mal"
	line "wieder! Tschüssi!"
	done





LassCathySeenText:
	text "Lass dich nicht"
	line "von dem netten"

	para "Äußeren meiner"
	line "#mon täuschen."

	para "Sie können dich"
	line "platt machen."
	done
LassCathyBeatenText:
	text "Verflixt… Ich"
	line "dachte, du wärest"
	cont "schwach…"
	done
SrandjrJoandcath1SeenText:
	text "Jo: Wenn du BIANKA"
	line "willst,"

	para "musst du erst an"
	line "mir vorbei!"

	para "Cath, klang das"
	line "cool?"
	done
SrandjrJoandcath1BeatenText:
	text "Jo: Verlieren ist"
	line "gar nicht cool!"
	done
SrandjrJoandcath2SeenText:
	text "Cath: Ich will"
	line "BIANKA besiegen,"

	para "aber erst kämpfen"
	line "wir gegen dich!"
	done
SrandjrJoandcath2BeatenText:
	text "Cath: Oh nein,"
	line "nein, nein!"
	done
JoWhitneyCriesText:
	text "Ach nein. Du hast"
	line "BIANKA zum Weinen"
	cont "gebracht."

	para "Keine Sorge. Sie"
	line "beruhigt sich bald"

	para "wieder. Sie weint"
	line "immer, wenn sie"
	cont "verloren hat."
	done
BeautyVictoriaSeenText:
	text "Ach, du musst wohl"
	line "noch etwas"

	para "wachsen! Ich mag"
	line "dich, aber ich"

	para "werde mich nicht"
	line "zurückhalten!"
	done





BeautyVictoriaBeatenText:
	text "Mal sehen… Ups,"
	line "schon vorbei?"
	done





BeautySamanthaSeenText:
	text "Schlag ordentlich"
	line "zu, sonst werde"
	cont "ich es tun!"
	done





BeautySamanthaBeatenText:
	text "Nein! Oh, MAUZI,"
	line "es tut mir leid!"
	done





GoldenrodGymGuyWinText:
	text "Du hast gewonnen?"
	line "Toll! Ich war"
	cont "damit beschäftigt,"
	cont "die hübschen Damen"
	cont "hier zu bewundern."
	done
