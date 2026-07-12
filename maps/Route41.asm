Route41_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 13, 17, WHIRL_ISLAND_NW, 1
	warp_event 37, 19, WHIRL_ISLAND_NE, 1
	warp_event 13, 37, WHIRL_ISLAND_SW, 1
	warp_event 37, 45, WHIRL_ISLAND_SE, 1

	def_coord_events

	def_bg_events
	bg_event  9, 35, BGEVENT_ITEM + MAX_ETHER, EVENT_ROUTE_41_HIDDEN_MAX_ETHER

	def_object_events
	object_event 57, 14, SPRITE_MARLON, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route41MarlonScript, -1
	object_event 32,  6, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmermCharlie, -1
	object_event 46,  8, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmermGeorge, -1
	object_event 20, 26, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmermBerke, -1
	object_event 32, 30, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmermKirk, -1
	object_event 19, 46, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmermMathew, -1
	object_event 57, 24, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmermLewis, -1
	object_event 17,  4, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmerfKaylee, -1
	object_event 23, 19, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmerfSusie, -1
	object_event 27, 34, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmerfDenise, -1
	object_event 44, 28, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSwimmerfKara, -1
	object_event  9, 50, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSwimmerfWendy, -1
	itemball_event 56, 12, SILVER_LEAF, 1, EVENT_ROUTE_41_SILVER_LEAF

	object_const_def
	const ROUTE41_MARLON

Route41MarlonScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MARLON_AGAIN
	iftruefwd .Beaten
	checkevent EVENT_BEAT_MARLON
	iffalsefwd .NotYetBattled
	writetext .RematchText
	sjumpfwd .Battle
.NotYetBattled
	checkevent EVENT_INTRODUCED_MARLON
	iftruefwd .Introduced1
	writetext .IntroText
	waitbutton
	setevent EVENT_INTRODUCED_MARLON
.Introduced1
	writetext .ChallengeText
.Battle
	yesorno
	iffalse_jumpopenedtext .RefusedText
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked ROUTE41_MARLON
	checkevent EVENT_BEAT_ELITE_FOUR_AGAIN
	iftruefwd .Rematch2
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd .Rematch1
	loadtrainer MARLON, 1
	sjumpfwd .StartBattle
.Rematch1
	loadtrainer MARLON, 2
	sjumpfwd .StartBattle
.Rematch2
	loadtrainer MARLON, 3
.StartBattle
	startbattle
	reloadmapafterbattle
	opentext
.Beaten:
	writetext .AfterText
	waitbutton
	closetext
	setevent EVENT_BEAT_MARLON
	setevent EVENT_BEAT_MARLON_AGAIN
	end

.IntroText:
	text "Marlon: Uihaa!"

	para "Hey, du bist"
	line "<PLAYER>!"

	para "Ich bin Marlon,"
	line "Mann des Meeres!"

	para "Meine #mon und"
	line "ich schwammen aus"
	cont "der EINALL-REGION"
	cont "her!"
	done

.ChallengeText:
	text "Du siehst stark"
	line "aus! Mist!"

	para "Wir sollten"
	line "unbedingt kämpfen!"
	done

.RematchText:
	text "Ohoho! Hey,"
	line "<PLAYER>!"

	para "Also treffe ich"
	line "dich wieder!"

	para "Du wirst"
	line "weggefegt, ganz"
	cont "sicher!"
	done

.RefusedText:
	text "Ach, Mann!"
	done

.SeenText:
	text "Alles klar, los"
	line "geht's!"
	done

.BeatenText:
	text "Du hast das total"
	line "gerockt!"

	para "Du beherrschst das"
	line "Trainer-Ding!"
	done

.AfterText:
	text "Du siehst nicht"
	line "nur stark aus, du"
	cont "bist auch echt"
	cont "stark!"

	para "Eh, ich wurde auch"
	line "weggefegt!"
	done

GenericTrainerSwimmerfKaylee:
	generictrainer SWIMMERF, KAYLEE, EVENT_BEAT_SWIMMERF_KAYLEE, SwimmerfKayleeSeenText, SwimmerfKayleeBeatenText

	text "Tief versteckt auf"
	line "den STRUDEL-"
	cont "INSELN soll ein"
	cont "großes #mon"
	cont "leben."

	para "Was für ein #-"
	line "MON das wohl ist?"
	done
GenericTrainerSwimmerfSusie:
	generictrainer SWIMMERF, SUSIE, EVENT_BEAT_SWIMMERF_SUSIE, SwimmerfSusieSeenText, SwimmerfSusieBeatenText

	text "Gab es da nicht"
	line "einmal einen Hit,"
	cont "der von einem"
	cont "Jungen handelte,"
	cont "der auf einem"
	cont "LAPRAS ritt?"
	done
GenericTrainerSwimmerfDenise:
	generictrainer SWIMMERF, DENISE, EVENT_BEAT_SWIMMERF_DENISE, SwimmerfDeniseSeenText, SwimmerfDeniseBeatenText

	text "Ein Sonnenbrand"
	line "ist sehr schlecht"
	cont "für die Haut."

	para "Aber ich benutze"
	line "keine Sonnencreme."

	para "Ich möchte das"
	line "Wasser nicht"
	cont "verschmutzen."
	done
GenericTrainerSwimmerfKara:
	generictrainer SWIMMERF, KARA, EVENT_BEAT_SWIMMERF_KARA, SwimmerfKaraSeenText, SwimmerfKaraBeatenText

	text "Ich habe tief aus"
	line "dem Inneren der"
	cont "STRUDELINSELN ein"
	cont "Brüllen gehört."
	done
GenericTrainerSwimmerfWendy:
	generictrainer SWIMMERF, WENDY, EVENT_BEAT_SWIMMERF_WENDY, SwimmerfWendySeenText, SwimmerfWendyBeatenText

	text "In der Gruppe"
	line "fangen STERNDU an"
	cont "zu leuchten."

	para "Das ist"
	line "wunderschön und"
	cont "beängstigend"
	cont "zugleich."
	done
GenericTrainerSwimmermCharlie:
	generictrainer SWIMMERM, CHARLIE, EVENT_BEAT_SWIMMERM_CHARLIE, SwimmermCharlieSeenText, SwimmermCharlieBeatenText

	text "Ist es nicht sehr"
	line "entspannend, sich"
	cont "auf dem Wasser"
	cont "treiben zu lassen?"
	done
GenericTrainerSwimmermGeorge:
	generictrainer SWIMMERM, GEORGE, EVENT_BEAT_SWIMMERM_GEORGE, SwimmermGeorgeSeenText, SwimmermGeorgeBeatenText

	text "ANEMONIA CITY ist"
	line "noch so weit weg."

	para "Aber der Rückweg"
	line "nach OLIVIANA CITY"
	cont "ist auch nicht"
	cont "viel kürzer."

	para "Was soll ich tun?"
	done
GenericTrainerSwimmermBerke:
	generictrainer SWIMMERM, BERKE, EVENT_BEAT_SWIMMERM_BERKE, SwimmermBerkeSeenText, SwimmermBerkeBeatenText

	text "Die Nacht war"
	line "dunkel und ein"
	cont "Sturm wütete…"

	para "Da sah ich dieses"
	line "riesige #mon"
	cont "über den Inseln"
	cont "aufsteigen."

	para "Aus seinen"
	line "silbernen Flügeln"
	cont "fielen ein paar"
	cont "Federn."
	done
GenericTrainerSwimmermKirk:
	generictrainer SWIMMERM, KIRK, EVENT_BEAT_SWIMMERM_KIRK, SwimmermKirkSeenText, SwimmermKirkBeatenText

	text "Die Strömung ist"
	line "zu stark. Ich kann"
	cont "die Insel nicht"
	cont "erreichen."
	done
GenericTrainerSwimmermMathew:
	generictrainer SWIMMERM, MATHEW, EVENT_BEAT_SWIMMERM_MATHEW, SwimmermMathewSeenText, SwimmermMathewBeatenText

	text "Ein Geheimnis der"
	line "STRUDELINSELN…"

	para "Es ist kohlraben-"
	line "schwarz darinnen!"
	done
GenericTrainerSwimmermLewis:
	generictrainer SWIMMERM, LEWIS, EVENT_BEAT_SWIMMERM_LEWIS, SwimmermLewisSeenText, SwimmermLewisBeatenText

	text "Ohne Wissen und"
	line "Erfahrung"

	para "verläufst du dich"
	line "im Wasser leicht."
	done

SwimmermCharlieSeenText:
	text "Das Wasser ist"
	line "schön warm. Ich"
	cont "bin also sehr"
	cont "locker und gelenk."

	para "Natürlich trete"
	line "ich gegen dich an!"
	done




SwimmermCharlieBeatenText:
	text "Oje! Ich habe eine"
	line "Gänsehaut!"
	done




SwimmermGeorgeSeenText:
	text "Ich bin etwas"
	line "müde. Wenn ich"
	cont "gewinne, leihst du"
	cont "mir dein #mon."
	done




SwimmermGeorgeBeatenText:
	text "Keuch, japs…"
	done




SwimmermBerkeSeenText:
	text "Siehst du diese"
	line "Inseln, die von"
	cont "den Strudeln"
	cont "blockiert werden?"

	para "Dort gibt es"
	line "bestimmt ein"
	cont "Geheimnis!"
	done




SwimmermBerkeBeatenText:
	text "Was ist das"
	line "Geheimnis deiner"
	cont "Stärke?"
	done




SwimmermKirkSeenText:
	text "Hier gibt es hohe"
	line "Wellen."

	para "Das macht dich"
	line "schnell müde."
	done




SwimmermKirkBeatenText:
	text "Ich bin besiegt!"
	done




SwimmermMathewSeenText:
	text "Suchst du die"
	line "Geheimnisse der"
	cont "STRUDELINSELN?"
	done




SwimmermMathewBeatenText:
	text "Ach. Du hast viel"
	line "Ausdauer!"
	done




SwimmermLewisSeenText:
	text "Im Meer fühle ich"
	line "mich wie zu Hause!"
	done

SwimmermLewisBeatenText:
	text "Besiegt--in meiner"
	line "Heimat?"
	done

SwimmerfKayleeSeenText:
	text "Ich bin auf dem"
	line "Weg zu den"
	cont "STRUDELINSELN."

	para "Ich gehe mit"
	line "meinen Kameraden"
	cont "auf"
	cont "Erkundungsreise."
	done




SwimmerfKayleeBeatenText:
	text "Ist es so richtig?"
	done




SwimmerfSusieSeenText:
	text "Du gleitest so"
	line "elegant auf deinem"
	cont "#mon dahin."
	done




SwimmerfSusieBeatenText:
	text "Ich bin"
	line "geschlagen…"
	done




SwimmerfDeniseSeenText:
	text "Das Wetter ist so"
	line "herrlich. Ich bin"
	cont "richtig benommen!"
	done




SwimmerfDeniseBeatenText:
	text "Ohhh!"
	done




SwimmerfKaraSeenText:
	text "Wenn du eine Pause"
	line "brauchst, dann"
	cont "halte deinen Kopf"
	cont "über Wasser und"
	cont "paddle mit den"
	cont "Füßen."

	para "Auf diese Weise"
	line "legst du eine"

	para "Ruhepause ein und"
	line "sammelst Energie."
	done




SwimmerfKaraBeatenText:
	text "Ach! Du bist aus-"
	line "geruhter als ich."
	done




SwimmerfWendySeenText:
	text "NACHTs sammeln"
	line "sich STERNDU nahe"
	cont "der"
	cont "Wasseroberfläche."
	done




SwimmerfWendyBeatenText:
	text "Oje…"
	done




