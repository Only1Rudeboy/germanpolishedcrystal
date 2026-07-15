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

	text "Manchmal lässt es"
	line "den Gegner"
	cont "zurückzucken."
	done

GenericTrainerCamperJerry:
	generictrainer CAMPER, JERRY, EVENT_BEAT_CAMPER_JERRY, CamperJerrySeenText, CamperJerryBeatenText

	text "He, du da! Trainer"
	line "aus JOHTO! ROCKO"
	para "ist stark. Es wird"
	line "dir übel bekommen,"
	para "wenn du ihn nicht"
	line "ernst nimmst."
	done
GenericTrainerHikerEdwin:
	generictrainer HIKER, EDWIN, EVENT_BEAT_HIKER_EDWIN, HikerEdwinSeenText, HikerEdwinBeatenText

	text "Puh… Alles in"
	line "Stücke."
	done

HikerEdwinSeenText:
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

	text "He! Ein CHAMP in"
	line "spe!"
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
	text "Ich bin ROCKO!"
	line "ARENALEITER von"
	cont "MARMORIA CITY!"
	para "Ich glaube an"
	line "Felsen-und"
	cont "Boden-#monihre"
	cont "Härte und"
	cont "Ausdauer!"
	para "Deshalb trainieren"
	line "meine #mon so"
	cont "hart!"
	para "Zeig mir, was du"
	line "kannst!"
	done
BrockWinLossText:
	text "Ich habe"
	line "unterschätzt, wie"
	cont "stark deine"
	cont "#mon sind…"
	para "Als Beweis deiner"
	line "Stärke nimm den"
	cont "FELSORDEN!"
	done
BrockBoulderBadgeText:
	text "Der FELSORDEN"
	line "macht #mon"
	cont "gehorsamer."
	para "Außerdem können"
	line "#mon, die BLITZ"
	cont "kennen, ihn"
	cont "jederzeit nutzen."
	para "Nimm auch diese"
	line "TM. Sie enthält"
	cont "STEINHAGEL!"
	done
BrockFightDoneText:
	text "In der Welt warten"
	line "noch viele starke"
	cont "Trainer."
	para "Trainiere weiter"
	line "-und werde der"
	cont "Größte!"
	done
CamperJerrySeenText:
	text "Die Trainer dieser"
	line "PKMN-ARENA"
	cont "setzen"
	cont "Gestein-#mon"
	cont "ein."
	para "Gestein-#mon"
	line "haben hohe"
	cont "VERT-Werte."
	para "Die Kämpfe können"
	line "sehr lange"
	para "dauern. Bist du"
	line "bereit dafür?"
	done


CamperJerryBeatenText:
	text "Ich muss diese"
	line "Kämpfe gewinnen…"
	done


PewterGymGuyWinText:
	text "He! Ein CHAMP in"
	line "spe!"
	para "Diese PKMN-ARENA"
	line "stellte kein"
	para "Problem für dich"
	line "dar."
	para "Dein Einsatz ist"
	line "wirklich"
	para "beeindruckend. Das"
	line "meine ich ehrlich."
	done
