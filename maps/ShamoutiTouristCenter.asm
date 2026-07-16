ShamoutiTouristCenter_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, SHAMOUTI_ISLAND, 4
	warp_event  3,  7, SHAMOUTI_ISLAND, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_LARRY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, LarryScript, -1

	object_const_def
	const SHAMOUTITOURISTCENTER_LARRY

LarryScript:
	faceplayer
	checkevent EVENT_BEAT_LARRY
	iftruefwd .After
	opentext
	checkevent EVENT_INTRODUCED_LARRY
	iftruefwd .Introduced
	writetext .IntroText
	sjumpfwd .Question
.Introduced
	writetext .RematchText
.Question
	yesorno
	iffalse_jumpopenedtext .RefusedText
	writetext .SeenText
	waitbutton
	closetext
	setevent EVENT_INTRODUCED_LARRY
	winlosstext .BeatenText, 0
	setlasttalked SHAMOUTITOURISTCENTER_LARRY
	checkevent EVENT_BEAT_ELITE_FOUR_AGAIN
	iftruefwd .Rematch
	loadtrainer LARRY, 1
	sjumpfwd .StartBattle
.Rematch
	loadtrainer LARRY, 2
.StartBattle
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_LARRY
.After
	opentext
	checkevent EVENT_GOT_SWEET_HONEY_FROM_LARRY
	iftruefwd .Done
	writetext .RewardText
	promptbutton
	verbosegiveitem SWEET_HONEY
	iffalse_endtext
	setevent EVENT_GOT_SWEET_HONEY_FROM_LARRY
.Done
	jumpthisopenedtext

	text "Jetzt muss ich"
	line "wieder arbeiten."

	para "Verzeih bitte."
	done

.RewardText:
	text "Für mich ist das"
	line "Beste am Reisen"

	para "die lokalen"
	line "Speisen."

	para "Das Restaurant"
	line "nebenan macht"

	para "ein himmlisches"
	line "Dessert"
if DEF(FAITHFUL)
	cont "mit Honig."
else
	cont "mit süßem"
	cont "Honig."
endc

	para "Ich teile etwas"
	line "mit dir."
	done

.IntroText:
	text "Hallo. Ich bin"
	line "Larry."

	para "Mein Chef hat mich"
	line "geschäftlich"
	cont "hierher geschickt,"

	para "aber ich nutze die"
	line "Zeit zum Genießen."

	para "Ich aß gerade im"
	line "Oasis-Restaurant"
	cont "im Hotel."

	para "Das machte Lust"
	line "auf einen noch"
	cont "härteren Kampf."

	para "Willst du mit?"
	done

.RematchText:
	text "Hallo wieder,"
	line "<PLAYER>."

	para "Du hast mich schon"
	line "besiegt--dieser"

	para "Kampf wird wohl"
	line "keinen großen"
	cont "Eindruck machen."

	para "Trotzdem--sollen"
	line "wir?"
	done

.SeenText:
	text "Ich, Larry, stehe"
	line "zu deinen Diens-"
	cont "ten."
	done

.BeatenText:
	text "Gut, ich hab"
	line "genug…"
	done

.RefusedText:
	text "Vielleicht ein"
	line "anderes Mal, wenn"
	cont "es passt."
	done
