Route19BeachHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, ROUTE_19, 2
	warp_event  3,  7, ROUTE_19, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route19BeachHouseVictorScript, -1
	object_event  6,  4, SPRITE_SURFING_PIKACHU, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route19BeachHouseSurfingPikachuScript, -1

	object_const_def
	const ROUTE19BEACHHOUSE_VICTOR

Route19BeachHouseVictorScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_VICTOR
	iftruefwd .AfterScript
	writetext .GreetingText
	waitbutton
	special CheckForSurfingPikachu
	iffalsefwd .NoPikachu
	writetext .ChallengeText
	yesorno
	iffalsefwd .NoBattle
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked ROUTE19BEACHHOUSE_VICTOR
	loadtrainer VICTOR, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_VICTOR
	opentext
.AfterScript:
	jumpopenedtext .AfterText

.NoPikachu:
	jumpthisopenedtext

	text "Du kannst es"
	line "auch!"
	line "Los, finde ein"

	para "Surf-Pikachu!"

	para "Zeig mir, dass du"
	line "Surfen genauso"
	cont "liebst wie ich!"
	done

.NoBattle:
	jumpopenedtext .NoBattleText

.GreetingText:
	text "Hey, Kumpel!"
	line "Ich bin Victor."

	para "Ich liebe Surfen,"
	line "und Puka auch."
	cont "Das ist mein"
	cont "Pikachu!"
	done

.ChallengeText:
	text "Whoa!"

	para "Dein Pikachu kann"
	line "Surfen! Ich bin"
	cont "also nicht"
	cont "allein…"

	para "Super! Du hast"
	line "dir"
	line "einen Surf-Kampf"

	para "mit mir und Puka"
	line "verdient!"

	para "Willst du es"
	line "versuchen?"
	done

.SeenText:
	text "Das Meer vereint"
	line "alle Surfer!"
	cont "Los geht's!"
	done

.BeatenText:
	text "Ich wusste, dass"
	line "du es schaffst!"
	done

.AfterText:
	text "Ich habe gehört,"
	line "dass manche"
	cont "Pikachu"

	para "in Johto Surfen"
	line "selbst gelernt"
	cont "haben."

	para "Vielleicht kommt"
	line "meins von dort."

	para "Ich fand Puka vor"
	line "Jahren angespült"
	cont "am Strand, und"
	cont "seit"

	para "dem sind wir"
	line "Partner."
	done


.NoBattleText:
	text "Schade. Komm"
	line "jeder-"
	line "zeit zum Surfen!"
	done

Route19BeachHouseSurfingPikachuScript:
	faceplayer
	showcrytext .Text, PIKACHU
	end

.Text:
	text "Puka: Pi-kaa!"
	done