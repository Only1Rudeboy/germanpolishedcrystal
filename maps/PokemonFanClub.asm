PokemonFanClub_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4,  7, VERMILION_CITY, 3
	warp_event  5,  7, VERMILION_CITY, 3

	def_coord_events

	def_bg_events
	bg_event  7,  0, BGEVENT_JUMPTEXT, PokemonFanClubListenSignText
	bg_event  9,  0, BGEVENT_JUMPTEXT, PokemonFanClubBraggingSignText
	bg_event  0,  1, BGEVENT_READ, PokemonJournalGreenScript

	def_object_events
	object_event  2,  3, SPRITE_MON_ICON, SPRITEMOVEDATA_STILL, 0, CLEFAIRY, -1, PAL_MON_PINK, OBJECTTYPE_SCRIPT, NO_FORM, ClefairyDollScript, EVENT_VERMILION_FAN_CLUB_DOLL
	object_event  4,  1, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonFanClubChairmanScript, -1
	object_event  6,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, PokemonFanClubReceptionistText, -1
	object_event  2,  4, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonFanClubClefairyGuyScript, -1
	object_event  7,  2, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, PokemonFanClubTeacherText, -1
	pokemon_event  7,  3, ODDISH, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_GREEN, FanClubOddishText, -1

	object_const_def
	const POKEMONFANCLUB_CLEFAIRY_DOLL

PokemonFanClubChairmanScript:
	checkevent EVENT_LISTENED_TO_FAN_CLUB_PRESIDENT
	iftrue_jumptextfaceplayer PokemonFanClubChairmanMoreTalesToTellText
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_FAN_CLUB_PRESIDENT_BUT_BAG_WAS_FULL
	iftruefwd .HeardSpeech
	writetext PokemonFanClubChairmanDidYouVisitToHearAboutMyMonText
	yesorno
	iffalse_jumpopenedtext PokemonFanClubChairmanHowDisappointingText
	writetext PokemonFanClubChairmanRapidashText
	promptbutton
.HeardSpeech:
	writetext PokemonFanClubChairmanIWantYouToHaveThisText
	promptbutton
	verbosegiveitem RARE_CANDY
	iffalse_endtext
	setevent EVENT_LISTENED_TO_FAN_CLUB_PRESIDENT
	jumpthisopenedtext

	text "Das SONDERBONBON"
	line "macht #mon"
	cont "stärker."

	para "Meine #mon"
	line "sollen lieber"

	para "durch ihre Kämpfe"
	line "stärker werden. Du"
	cont "kannst es haben."
	done
PokemonFanClubClefairyGuyScript:
	checkevent EVENT_GOT_LOST_ITEM_FROM_FAN_CLUB
	iftrue_jumptextfaceplayer PokemonFanClubClefairyGuyGoingToGetARealClefairyText
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iffalse_jumptextfaceplayer PokemonFanClubClefairyGuyClefairyIsSoAdorableText
	faceplayer
	opentext
	writetext PokemonFanClubClefairyGuyMakingDoWithADollIFoundText
	checkevent EVENT_MET_COPYCAT_FOUND_OUT_ABOUT_LOST_ITEM
	iftruefwd .FoundClefairyDoll
	waitendtext
.FoundClefairyDoll:
	promptbutton
	writetext PokemonFanClubClefairyGuyTakeThisDollBackToGirlText
	promptbutton
	waitsfx
	disappear POKEMONFANCLUB_CLEFAIRY_DOLL
	verbosegivekeyitem LOST_ITEM
	setevent EVENT_GOT_LOST_ITEM_FROM_FAN_CLUB
	endtext

PokemonJournalGreenScript:
	setflag ENGINE_READ_GREEN_JOURNAL
	jumpthistext

	text "#mon Journal"

	para "Spezial:"
	line "#mon-Trainer"
	cont "Leaf!"

	para "Neben ihrer Stärke"
	line "als Trainerin soll"

	para "Leaf eine"
	line "Faszination für"
	cont "legendäre #mon"
	cont "haben."
	done

ClefairyDollScript:
	jumpthistext

	text "Das ist ein PIEPI!"
	line "Was?"

	para "Ach so! Das ist"
	line "eine #PUPPE von"
	cont "PIEPI."
	done
PokemonFanClubChairmanDidYouVisitToHearAboutMyMonText:
	text "Ich bin der"
	line "VORSITZENDE des"
	cont "#mon-FANCLUB."

	para "Ich habe über 150"
	line "#mon"
	cont "aufgezogen."

	para "Ich bin sehr "
	line "kleinlich, was"
	cont "#mon betrifft."

	para "Bist du extra"
	line "hierher gekommen,"
	cont "um etwas über"
	cont "meine #mon zu"
	cont "erfahren?"
	done


PokemonFanClubChairmanRapidashText:
	text "Sehr schön! Dann"
	line "hör gut zu!"

	para "Also… am liebsten"
	line "habe ich GALLOPA…"

	para "Es ist… süß… lieb…"
	line "klug… anmutig…"
	cont "und… wunderbar…"
	cont "nicht wahr?… Zu"
	cont "sehr… wild… schön…"
	cont "liebenswert …Ich"
	cont "verehre es!"

	para "Knuddle es… wenn…"
	line "es schläft… warm"
	cont "und weich… Oh, und"
	cont "sensationell…"
	cont "großartig… einfach"
	cont "göttlich… Ups! Wie"
	cont "die Zeit vergeht!"
	cont "Ich habe dich zu"
	cont "lange aufgehalten!"
	done


PokemonFanClubChairmanIWantYouToHaveThisText:
	text "Danke, dass du mir"
	line "so lange zugehört"
	cont "hast. Das möchte"
	cont "ich dir geben!"
	done


PokemonFanClubChairmanMoreTalesToTellText:
	text "Hallo, <PLAYER>!"

	para "Besuchst du mich"
	line "wieder wegen"
	cont "meiner #mon?"

	para "Nein? Oh… Ich"
	line "hätte noch so"
	cont "viele Geschichten…"
	done


PokemonFanClubChairmanHowDisappointingText:
	text "Schade…"

	para "Komm wieder, wenn"
	line "du mehr"

	para "Geschichten hören"
	line "möchtest."
	done


PokemonFanClubReceptionistText:
	text "Unser VORSITZENDER"
	line "ist sehr redselig"
	cont "in Bezug auf"
	cont "#mon…"
	done


PokemonFanClubClefairyGuyClefairyIsSoAdorableText:
	text "Ich liebe es, wie"
	line "PIEPI mit seinem"

	para "Finger wackelt,"
	line "wenn es METRONOM"

	para "anwendet."
	line "Entzückend!"
	done


PokemonFanClubClefairyGuyMakingDoWithADollIFoundText:
	text "Ich mag PIEPI,"
	line "aber ich könnte"

	para "nie eines fangen."
	line "Die #PUPPE,"

	para "die ich fand, muss"
	line "mir genügen."
	done


PokemonFanClubClefairyGuyTakeThisDollBackToGirlText:
	text "Ah, jetzt verstehe"
	line "ich. Das Mädchen,"

	para "das diese"
	line "#puppe verloren"
	cont "hat, ist traurig…"

	para "Könntest du dann"
	line "die #PUPPE"

	para "zu diesem armen,"
	line "kleinen Mädchen"
	cont "zurückbringen?"

	para "Eines Tages werde"
	line "ich mich mit einem"

	para "echten PIEPI"
	line "anfreunden. Keine"
	cont "Bange!"
	done


PokemonFanClubClefairyGuyGoingToGetARealClefairyText:
	text "Du wirst schon"
	line "sehen. Ich freunde"

	para "mich noch mit"
	line "einem echten PIEPI"
	cont "an."
	done


PokemonFanClubTeacherText:
	text "Schau dir mein"
	line "süßes LORBLATT an!"

	para "Das Blatt auf"
	line "seinem Kopf ist so"
	cont "goldig!"
	done


FanClubOddishText:
	text "Oddish: Diish!"
	done

PokemonFanClubListenSignText:
	text "Anderen Trainern"
	line "hören wir höflich"
	cont "zu."
	done


PokemonFanClubBraggingSignText:
	text "Wenn jemand"
	line "prahlt, wird"

	para "sofort"
	line "zurückgeprahlt!"
	done


