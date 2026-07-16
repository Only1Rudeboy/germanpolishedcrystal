PewterGym_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4, 13, PEWTER_CITY, 2
	warp_event  5, 13, PEWTER_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  2, 11, BGEVENT_READ, PewterGymStatue
	bg_event  7, 11, BGEVENT_READ, PewterGymStatue

	def_object_events
	object_event  5,  1, SPRITE_BROCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterGymBrockScript, -1
	object_event  2,  7, SPRITE_CAMPER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerCamperJerry, -1
	object_event  7,  5, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerHikerEdwin, -1
	object_event  6, 11, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, PewterGymGuyScript, -1

PewterGymBrockScript:
	faceplayer
	opentext
	checkflag ENGINE_BOULDERBADGE
	iftruefwd .FightDone
	writetext BrockIntroText
	waitbutton
	closetext
	winlosstext BrockWinLossText, 0
	loadtrainer BROCK, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BROCK
	setevent EVENT_BEAT_CAMPER_JERRY
	setevent EVENT_BEAT_HIKER_EDWIN
	opentext
	givebadge BOULDERBADGE, KANTO_REGION
	callstd kantopostgymevents
.FightDone:
	checkevent EVENT_GOT_TM48_ROCK_SLIDE
	iftrue_jumpopenedtext BrockFightDoneText
	writetext BrockBoulderBadgeText
	promptbutton
	verbosegivetmhm TM_ROCK_SLIDE
	setevent EVENT_GOT_TM48_ROCK_SLIDE
	jumpthisopenedtext

	; PC: TM48 Steinhagel
	text "Manchmal lässt es"
	line "den Gegner"
	cont "zurückzucken."
	done

GenericTrainerCamperJerry:
	generictrainer CAMPER, JERRY, EVENT_BEAT_CAMPER_JERRY, CamperJerrySeenText, CamperJerryBeatenText

	; GSC-DE Dump
	text "He, du da! Trainer"
	line "aus JOHTO! ROCKO"
	para "ist stark. Es wird"
	line "dir übel bekommen,"
	para "wenn du ihn nicht"
	line "ernst nimmst."
	done
GenericTrainerHikerEdwin:
	generictrainer HIKER, EDWIN, EVENT_BEAT_HIKER_EDWIN, HikerEdwinSeenText, HikerEdwinBeatenText

	; PC-only
	text "Puh… Alles in"
	line "Stücke."
	done

HikerEdwinSeenText:
	; PC-only
	text "Ich wollte mir die"
	line "ARENA ansehen."
	done
HikerEdwinBeatenText:
	text "…"
	done

PewterGymGuyScript:
	checkevent EVENT_BEAT_BROCK
	iftrue_jumptextfaceplayer PewterGymGuyWinText
	jumpthistextfaceplayer

	; GSC-DE Dump
	text "He! Ein CHAMP"
	line "in spe!"
	para "Das ist cool!"
	line "Kämpfst du gegen"
	para "die ARENALEITER in"
	line "KANTO?"
	para "Sie sind stark und"
	line "ambitioniert, wie"
	para "die ARENALEITER in"
	line "JOHTO."
	done
PewterGymStatue:
	gettrainername BROCK, 1, STRING_BUFFER_4
	checkflag ENGINE_BOULDERBADGE
	iftruefwd .Beaten
	jumpstd gymstatue1
.Beaten:
	jumpstd gymstatue2

BrockIntroText:
	; GSC-DE Dump
	text "ROCKO: Wow, es"
	line "kommt nicht oft"
	para "vor, dass wir von"
	line "einem Heraus-"
	cont "forderer aus JOHTO"
	cont "besucht werden."
	para "Ich bin ROCKO, der"
	line "ARENALEITER von"
	para "MARMORIA. Ich habe"
	line "mich auf Gestein-"
	cont "#MON"
	cont "spezialisiert."
	para "Meine #MON sind"
	line "gegen die meisten"
	para "physischen Atta-"
	line "cken immun. Es"
	cont "wird dir schwer"
	para "fallen, ihnen"
	line "Schaden zuzufügen."
	cont "Na los!"
	done
BrockWinLossText:
	; GSC-DE Dump
	text "ROCKO: Die mäch-"
	line "tigen Attacken"
	cont "deiner #MON"
	cont "haben meine"
	cont "felsenfeste"
	cont "Verteidigung"
	cont "überwunden…"
	para "Du bist stärker,"
	line "als ich dachte…"
	para "Komm - Nimm dir"
	line "diesen ORDEN."
	done
BrockBoulderBadgeText:
	; GSC-DE Dump (<PLAYER>→<PLAYER>)
	text "ROCKO: Danke,"
	line "<PLAYER>. Es war"
	para "eine Freude, gegen"
	line "dich zu kämpfen."
	para "Auch wenn ich ein"
	line "bisschen beleidigt"
	cont "bin."
	para "Dieser FELSORDEN"
	line "wird deine #-"
	cont "MON noch stärker"
	cont "machen."
	done
BrockFightDoneText:
	; GSC-DE Dump
	text "ROCKO: Die Welt"
	line "ist groß. Es gibt"
	para "immer noch viele"
	line "starke Trainer wie"
	cont "dich."
	para "Warte nur ab. Ich"
	line "werde auch noch"
	cont "viel stärker."
	done
CamperJerrySeenText:
	; GSC-DE Dump
	text "Die Trainer dieser"
	line "PKMN-ARENA setzen"
	cont "Gestein-#MON"
	cont "ein."
	para "Gestein-#MON"
	line "haben hohe"
	cont "VERT-Werte."
	para "Die Kämpfe können"
	line "sehr lange"
	para "dauern. Bist du"
	line "bereit dafür?"
	done


CamperJerryBeatenText:
	; GSC-DE Dump
	text "Ich muss diese"
	line "Kämpfe gewinnen…"
	done


PewterGymGuyWinText:
	; GSC-DE Dump
	text "He! Ein CHAMP"
	line "in spe!"
	para "Diese PKMN-ARENA"
	line "stellte kein"
	para "Problem für dich"
	line "dar."
	para "Dein Einsatz"
	line "ist wirklich"
	para "beeindruckend. Das"
	line "meine ich ehrlich."
	done
