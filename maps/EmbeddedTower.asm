EmbeddedTower_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  6, 23, ROUTE_47, 6
	warp_event  7, 23, ROUTE_47, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  8,  9, SPRITE_STEVEN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, EmbeddedTowerSteven1Script, EVENT_EMBEDDED_TOWER_STEVEN_1
	object_event  4, 11, SPRITE_STEVEN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, EmbeddedTowerSteven2Script, EVENT_EMBEDDED_TOWER_STEVEN_2

	object_const_def
	const EMBEDDEDTOWER_STEVEN1
	const EMBEDDEDTOWER_STEVEN2

EmbeddedTowerSteven1Script:
	faceplayer
	opentext
	checkevent EVENT_BEAT_STEVEN
	iftruefwd .Beaten
	checkevent EVENT_LISTENED_TO_STEVEN_INTRO
	iftruefwd .HeardIntro
	writetext EmbeddedTowerSteven1IntroText
	waitbutton
	setevent EVENT_LISTENED_TO_STEVEN_INTRO
.HeardIntro
	writetext EmbeddedTowerSteven1TowerText
	waitbutton
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse_jumpopenedtext EmbeddedTowerSteven1NotNowText
	writetext EmbeddedTowerSteven1ChallengeText
	yesorno
	iffalse_jumpopenedtext EmbeddedTowerSteven1NoText
	writetext EmbeddedTowerSteven1YesText
	waitbutton
	closetext
	winlosstext EmbeddedTowerSteven1WinText, 0
	setlasttalked EMBEDDEDTOWER_STEVEN1
	loadtrainer STEVEN, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_STEVEN
	opentext
.Beaten:
	checkevent EVENT_GOT_MUSCLE_BAND_FROM_STEVEN
	iftrue_jumpopenedtext EmbeddedTowerSteven1AfterText
	writetext EmbeddedTowerSteven1ItemText
	waitbutton
	verbosegiveitem MUSCLE_BAND
	iffalse_endtext
	setevent EVENT_GOT_MUSCLE_BAND_FROM_STEVEN
.GotMuscleBand
	jumpopenedtext EmbeddedTowerSteven1AfterText

EmbeddedTowerSteven2Script:
	checkevent EVENT_BEAT_STEVEN
	iftrue_jumptextfaceplayer EmbeddedTowerSteven2AfterText
	faceplayer
	opentext
	writetext EmbeddedTowerSteven2ChallengeText
	yesorno
	iffalse_jumpopenedtext EmbeddedTowerSteven2NoText
	writetext EmbeddedTowerSteven2YesText
	waitbutton
	closetext
	winlosstext EmbeddedTowerSteven2WinText, 0
	setlasttalked EMBEDDEDTOWER_STEVEN2
	loadtrainer STEVEN, 2
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_STEVEN
	opentext
	jumpopenedtext EmbeddedTowerSteven2AfterText

EmbeddedTowerSteven1IntroText:
	text "Hallo! Ich bin"
	line "Steven. Seltene"
	cont "Steine sind meine"
	cont "Leidenschaft."
	para "Ich komme aus der"
	line "Hoenn-Region. Ein"
	cont "schöner Ort,"
	para "mit dem klarsten"
	line "Meer, das man sich"
	cont "vorstellen"
	para "kann."
	para "Du solltest sie"
	line "mal besuchen."
	done

EmbeddedTowerSteven1TowerText:
	text "Steven: Ich bin"
	line "hier auf der Suche"
	cont "nach Steinen für"
	cont "meine Sammlung."
	para "Das ist der"
	line "Embedded Tower."
	para "Er wurde von"
	line "Leuten aus Hoenn"
	cont "erbaut,"
	para "um Meer, Land und"
	line "Himmel zu"
	cont "vereinen."
	done

EmbeddedTowerSteven1NotNowText:
	text "Steven: Deine"
	line "#MON sehen gut"
	cont "aus."

	para "Wenn du die TOP"
	line "VIER besiegen"

	para "kannst, komm"
	line "wieder und kämpfe"
	cont "mit mir."
	done

EmbeddedTowerSteven1ChallengeText:
	text "Steven: Deine"
	line "#MON sehen gut"
	cont "aus."
	para "Da wir beide hier"
	line "sind, warum"
	cont "kämpfen wir nicht?"
	done

EmbeddedTowerSteven1NoText:
EmbeddedTowerSteven2NoText:
	text "Steven: Hmm. Wenn"
	line "du deine Meinung"
	cont "änderst,"

	para "bin ich gleich"
	line "hier."
	done

EmbeddedTowerSteven1YesText:
EmbeddedTowerSteven2YesText:
	text "Steven: Ich will,"
	line "dass du alles"
	cont "gibst!"

	para "Also, zeig was du"
	line "kannst!"
	done

EmbeddedTowerSteven1WinText:
EmbeddedTowerSteven2WinText:
	text "Du bist ein"
	line "wirklich edler"
	cont "#MON-Trainer!"
	done

EmbeddedTowerSteven1ItemText:
	text "Steven:"
	line "Glückwunsch!"
	para "Die Gefühle, die"
	line "du für #MON"
	cont "hast …"
	para "Und die #MON,"
	line "die mit aller"
	para "Kraft auf diese"
	line "Gefühle reagierten"
	cont "…"
	para "Sie wurden eins"
	line "und schufen"
	para "eine noch größere"
	line "Kraft."
	para "So konntest du den"
	line "Sieg erringen!"
	para "Dieses Item wird"
	line "dir sicher helfen."
	done

EmbeddedTowerSteven1AfterText:
	text "Steven: Mögen sich"
	line "unsere Wege wieder"
	cont "kreuzen."
	done

EmbeddedTowerSteven2ChallengeText:
	text "Steven: Wir sehen"
	line "uns wieder,"
	cont "<PLAYER>!"
	para "Ich hab tolle"
	line "Steine für meine"
	cont "Sammlung gefunden."
	para "Was hast du"
	line "gemacht?"
	para "Du hast die TOP"
	line "VIER wieder"
	cont "besiegt? Toll!"
	para "Warum nicht noch"
	line "ein Kampf?"
	done

EmbeddedTowerSteven2AfterText:
	text "Steven: Am Ende"
	line "bist du doch der"
	cont "Stärkste."

	para "Aber ich bereue"
	line "unseren Kampf"
	cont "nicht."

	para "Denn jedes Mal,"
	line "wenn wir kämpfen,"

	para "lerne ich mehr"
	line "über #MON!"
	done
