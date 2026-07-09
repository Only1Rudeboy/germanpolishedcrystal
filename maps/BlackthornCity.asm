BlackthornCity_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, BlackthornCityFlypointCallback
	callback MAPCALLBACK_OBJECTS, BlackthornCitySantosCallback

	def_warp_events
	warp_event 18, 11, BLACKTHORN_GYM_1F, 1
	warp_event 13, 21, BLACKTHORN_DRAGON_SPEECH_HOUSE, 1
	warp_event 29, 23, BLACKTHORN_EMYS_HOUSE, 1
	warp_event 15, 29, BLACKTHORN_MART, 2
	warp_event 21, 29, BLACKTHORN_POKECENTER_1F, 1
	warp_event  9, 29, MOVE_DELETERS_HOUSE, 1
	warp_event 36,  9, ICE_PATH_1F, 2
	warp_event 20,  1, DRAGONS_DEN_1F, 1

	def_coord_events

	def_bg_events
	bg_event 34, 24, BGEVENT_JUMPTEXT, BlackthornCitySignText
	bg_event 17, 13, BGEVENT_JUMPTEXT, BlackthornGymSignText
	bg_event  7, 29, BGEVENT_JUMPTEXT, MoveDeletersHouseSignText
	bg_event 21,  3, BGEVENT_JUMPTEXT, DragonDensSignText
	bg_event  9, 19, BGEVENT_JUMPTEXT, BlackthornCityTrainerTipsText

	def_object_events
	object_event 22, 20, SPRITE_PSYCHIC, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, SantosScript, EVENT_BLACKTHORN_CITY_SANTOS_OF_SATURDAY
	object_event 18, 12, SPRITE_DRAGON_TAMER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornDragonTamer1Script, EVENT_BLACKTHORN_CITY_DRAGON_TAMER_BLOCKS_GYM
	object_event 19, 12, SPRITE_DRAGON_TAMER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornDragonTamer1Script, EVENT_BLACKTHORN_CITY_DRAGON_TAMER_DOES_NOT_BLOCK_GYM
	object_event 24, 31, SPRITE_BLACK_BELT, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornBlackbeltScript, -1
	object_event 20,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, BlackthornGramps1Text, EVENT_BLACKTHORN_CITY_GRAMPS_BLOCKS_DRAGONS_DEN
	object_event 21,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, BlackthornGramps2Text, EVENT_BLACKTHORN_CITY_GRAMPS_NOT_BLOCKING_DRAGONS_DEN
	object_event  9, 25, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, BlackthornLassText, -1
	object_event 13, 15, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, BlackthornYoungsterText, -1
	object_event 35, 19, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, BlackthornCooltrainerF1Text, -1
	object_event  3, 29, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_COMMAND, jumptextfaceplayer, BlackthornCooltrainerF2Text, -1
	object_event 31, 26, SPRITE_DRAGON_TAMER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, (1 << MORN) | (1 << DAY), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, BlackthornDragonTamer2Text, -1
	object_event 27, 25, SPRITE_DRAGON_TAMER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, (1 << EVE) | (1 << NITE), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, BlackthornDragonTamer3Text, -1

	object_const_def
	const BLACKTHORNCITY_SANTOS

BlackthornCityFlypointCallback:
	setflag ENGINE_FLYPOINT_BLACKTHORN
	endcallback

BlackthornCitySantosCallback:
	readvar VAR_WEEKDAY
	ifequalfwd SATURDAY, .SantosAppears
	disappear BLACKTHORNCITY_SANTOS
	endcallback

.SantosAppears:
	appear BLACKTHORNCITY_SANTOS
	endcallback

BlackthornCitySignText:
	text "Ebenholz City"

	para "Ein ruhiger"
	line "Bergrückzugsort"
	done

BlackthornGymSignText:
	text "Ebenholz City"
	line "#mon-Arena"
	cont "Leiterin: Sandra"

	para "Die Gesegnete"
	line "Nutzerin von"
	cont "Drachen-#mon"
	done

MoveDeletersHouseSignText:
	text "Haus des"
	line "Attacken-"
	cont "Verlerners"
	done

DragonDensSignText:
	text "Drachenhöhle"
	line "Voraus"
	done

BlackthornCityTrainerTipsText:
	text "Trainer-Tipps"

	para "Ein #mon mit"
	line "einer Prunus-"
	cont "beere heilt sich"

	para "selbst von jedem"
	line "Status-Problem."
	done

SantosScript:
	checkevent EVENT_GOT_SPELL_TAG_FROM_SANTOS
	iftrue_jumptextfaceplayer .SaturdayText
	readvar VAR_WEEKDAY
	ifnotequal SATURDAY, .NotSaturday
	faceplayer
	opentext
	checkevent EVENT_MET_SANTOS_OF_SATURDAY
	iftruefwd .MetSantos
	writetext .MeetText
	promptbutton
	setevent EVENT_MET_SANTOS_OF_SATURDAY
.MetSantos:
	writetext .GivesGiftText
	promptbutton
	verbosegiveitem SPELL_TAG
	iffalse_endtext
	setevent EVENT_GOT_SPELL_TAG_FROM_SANTOS
	jumpthisopenedtext

	text "Santos: …"

	para "Bannsticker…"

	para "Geister-Attacken"
	line "werden stärker…"

	para "Er wird dich"
	line "erschrecken…"
	done

.NotSaturday:
	jumpthistextfaceplayer

	text "Santos: Heute ist"
	line "nicht Samstag…"
	done

.MeetText:
	text "Santos: …"

	para "Es ist Samstag…"

	para "Ich bin Santos"
	line "vom Samstag…"
	done

.GivesGiftText:
	text "Das kannst du"
	line "haben…"
	done

.SaturdayText:
	text "Santos: …"

	para "Bis zum nächsten"
	line "Samstag…"

	para "Ich hab keine"
	line "Geschenke mehr…"
	done

BlackthornDragonTamer1Script:
	checkevent EVENT_BEAT_CLAIR
	iftrue_jumptextfaceplayer .ClairIsBeatenText
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue_jumptextfaceplayer .ClairIsInText
	jumpthistextfaceplayer

	text "Es tut mir leid."

	para "Clair, unsere"
	line "Arenaleiterin,"
	cont "betrat die"

	para "Drachenhöhle"
	line "hinter der Arena."

	para "Ich weiß nicht,"
	line "wann unsere"
	cont "Leiterin"

	para "zurückkommt."
	done

.ClairIsInText:
	text "Clair, unsere"
	line "Arenaleiterin,"
	cont "wartet auf dich."

	para "Doch für einen"
	line "gewöhnlichen"
	cont "Trainer wäre ein"

	para "Sieg unmöglich."
	done

.ClairIsBeatenText:
	text "Du hast Clair"
	line "besiegt?"

	para "Das ist"
	line "erstaunlich!"

	para "Ich hörte noch"
	line "nie, dass sie"
	cont "außer gegen ihren"

	para "Cousin Siegfried"
	line "verlor."
	done

BlackthornBlackbeltScript:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue_jumptextfaceplayer .Text2
	jumpthistextfaceplayer

	text "Ist mein Radio"
	line "kaputt? Ich"
	cont "empfange nur noch"

	para "dieses komische"
	line "Signal."
	done

.Text2:
	text "Aroo! Stimmen in"
	line "meinem Kopf!"

	para "Hä? Ich hör ja"
	line "nur Radio!"
	done

BlackthornGramps1Text:
	text "Nein. Nur"
	line "auserwählte"
	cont "Trainer dürfen"

	para "hier trainieren."

	para "Bitte geh."
	done

BlackthornGramps2Text:
	text "Wenn Clair es"
	line "erlaubt, erlaubt"
	cont "es auch ihr"

	para "Großvater--"
	line "unser Meister."

	para "Du darfst"
	line "eintreten."
	done

BlackthornLassText:
	text "Wirst du deinem"
	line "#mon Attacken"
	cont "vergessen lassen?"
	done

BlackthornYoungsterText:
	text "Alle Drachen-"
	line "meister stammen"
	cont "aus Ebenholz City."
	done

BlackthornCooltrainerF1Text:
	text "Wow, du kamst"
	line "durch den"
	cont "Eispfad?"

	para "Du musst ein"
	line "echter Ass-"
	cont "Trainer sein!"
	done

BlackthornCooltrainerF2Text:
	text "Der Feen-Typ"
	line "wurde erst"
	cont "kürzlich entdeckt."

	para "Er schaltet"
	line "Drachen-Typen"
	cont "komplett aus."
	done

BlackthornDragonTamer2Text:
	text "Als unsere"
	line "Arenaleiterin"
	cont "noch ein junges"

	para "Mädchen war,"
	line "trainierte sie"
	cont "ständig in der"

	para "Drachenhöhle."
	done

BlackthornDragonTamer3Text:
	text "Ebenholz City ist"
	line "die Heimat"
	cont "vieler berühmter"

	para "Drachenbändiger,"
	line "wie Siegfried."

	para "Er ist der Cousin"
	line "unserer"
	cont "Arenaleiterin,"

	para "weißt du!"
	done
