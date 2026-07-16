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
	; GSC-DE Dump 6776
	text "EBENHOLZ CITY"

	para "Ein ruhiger Ort in"
	line "den Bergen"
	done

BlackthornGymSignText:
	; GSC-DE Dump 6777
	text "PKMN-ARENA von"
	line "EBENHOLZ CITY"

	para "LEITUNG: SANDRA"
	line "Die gesegnete Dra-"
	cont "chen-#MON-"
	cont "Trainerin"
	done

MoveDeletersHouseSignText:
	; GSC-DE Dump 6778
	text "HAUS DES ATTACKEN-"
	line "VERLERNERs"
	done

DragonDensSignText:
	; GSC-DE Dump 6779
	text "DRACHENHÖHLE"
	line "GERADEAUS"
	done

BlackthornCityTrainerTipsText:
	; GSC-DE Dump 6780
	text "TIPPS FÜR TRAINER"

	para "Ein #MON, das"
	line "eine WUNDERBEERE"

	para "trägt, kann von"
	line "sich aus Status-"
	cont "veränderungen hei-"
	cont "len."
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

	; GSC-DE Dump 6772
	text "SAMSON: …"

	para "BANNSTICKER…"

	para "Geist-Attacken"
	line "werden stärker…"

	para "Es ist geradezu"
	line "beängstigend…"
	done

.NotSaturday:
	jumpthistextfaceplayer

	; GSC-DE Dump 6774
	text "SAMSON: Heute ist"
	line "nicht Samstag…"
	done

.MeetText:
	; GSC-DE Dump 6770
	text "SAMSON: …"

	para "Heute ist Samstag…"

	para "Ich bin SAMSON von"
	line "Samstag…"
	done

.GivesGiftText:
	; GSC-DE Dump 6771
	text "Du kannst das"
	line "haben…"
	done

.SaturdayText:
	; GSC-DE Dump 6773
	text "SAMSON: …"

	para "Wir sehen uns an"
	line "einem anderen"
	cont "Samstag wieder…"

	para "Aber ich werde"
	line "dann keine Ge-"
	cont "schenke mehr"
	cont "haben…"
	done

BlackthornDragonTamer1Script:
	checkevent EVENT_BEAT_CLAIR
	iftrue_jumptextfaceplayer .ClairIsBeatenText
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue_jumptextfaceplayer .ClairIsInText
	jumpthistextfaceplayer

	; GSC-DE Dump 6761
	text "Tut mir Leid."

	para "SANDRA, unsere"
	line "ARENALEITERIN,"

	para "ist in die"
	line "DRACHENHÖHLE"

	para "hinter der PKMN-"
	line "ARENA gegangen."

	para "Ich weiß nicht,"
	line "wann sie wieder-"
	cont "kommt."
	done

.ClairIsInText:
	; GSC-DE Dump 6762
	text "SANDRA, unsere"
	line "ARENALEITERIN,"
	cont "erwartet dich."

	para "Für einen gewöhn-"
	line "lichen Trainer"

	para "ist es jedoch un-"
	line "möglich zu siegen."
	done

.ClairIsBeatenText:
	; GSC-DE Dump 6763
	text "Du hast SANDRA"
	line "besiegt?"

	para "Wie erstaunlich!"

	para "Soweit ich weiß,"
	line "hat sie bis jetzt"

	para "nur gegen"
	line "SIEGFRIED"
	cont "verloren."
	done

BlackthornBlackbeltScript:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue_jumptextfaceplayer .Text2
	jumpthistextfaceplayer

	; GSC-DE Dump 6766
	text "Mein Radio ist im"
	line "Eimer. Seit kurzem"
	cont "empfange ich nur"
	cont "dieses eigenartige"
	cont "Signal."
	done

.Text2:
	; GSC-DE Dump 6767
	text "Aruuu! Stimmen in"
	line "meinem Kopf!"

	para "Häh? Ich höre"
	line "Radio!"
	done

BlackthornGramps1Text:
	; GSC-DE Dump 6764
	text "Nein. Nur auser-"
	line "wählte Trainer"

	para "dürfen hier"
	line "trainieren."
	cont "Gehe hinfort."
	done

BlackthornGramps2Text:
	; GSC-DE Dump 6765
	text "Wenn SANDRA es dir"
	line "gestattet, dann"

	para "wird auch ihr Opa"
	line "- unser MEISTER -"
	cont "zustimmen."

	para "Tritt ein."
	done

BlackthornLassText:
	; GSC-DE Dump 6768
	text "Willst du, dass"
	line "deine #MON ei-"
	cont "nige Attacken ver-"
	cont "gessen?"
	done

BlackthornYoungsterText:
	; GSC-DE Dump 6769
	text "Alle Drachen-"
	line "meister kommen aus"
	cont "EBENHOLZ CITY."
	done

BlackthornCooltrainerF1Text:
	; GSC-DE Dump 6775 (Eispfad, Osten)
	text "Wow, du bist über"
	line "den EISPFAD gekom-"
	cont "men?"

	para "Du musst ein rich-"
	line "tiger Heißsporn"
	cont "sein!"
	done

BlackthornCooltrainerF2Text:
	; PC-only (Fee-Typ)
	text "Der Fee-Typ wurde"
	line "erst kürzlich"
	cont "entdeckt."

	para "Er schaltet"
	line "Drachen-Typen"
	cont "komplett aus."
	done

BlackthornDragonTamer2Text:
	; PC-only
	text "Als unsere ARENA-"
	line "LEITERIN noch ein"
	cont "junges Mädchen"

	para "war, trainierte"
	line "sie ständig in der"
	cont "DRACHENHÖHLE."
	done

BlackthornDragonTamer3Text:
	; PC-only
	text "EBENHOLZ CITY ist"
	line "die Heimat vieler"
	cont "berühmter"

	para "Drachenbändiger,"
	line "wie SIEGFRIED."

	para "Er ist der Cousin"
	line "unserer ARENA-"
	cont "LEITERIN!"
	done
