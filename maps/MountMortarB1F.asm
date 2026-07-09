MountMortarB1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  3, MOUNT_MORTAR_1F_INSIDE, 5
	warp_event 19, 29, MOUNT_MORTAR_1F_OUTSIDE, 7

	def_coord_events

	def_bg_events
	bg_event  4,  6, BGEVENT_ITEM + MAX_REVIVE, EVENT_MOUNT_MORTAR_B1F_HIDDEN_MAX_REVIVE

	def_object_events
	object_event 11, 31, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, MountMortarB1FHikerScript, -1
	object_event 16,  4, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, MountMortarB1FKiyoScript, -1
	strengthboulder_event  9, 10
	itemball_event 29, 12, HYPER_POTION, 1, EVENT_MOUNT_MORTAR_B1F_HYPER_POTION
	itemball_event  4, 16, CARBOS, 1, EVENT_MOUNT_MORTAR_B1F_CARBOS
	itemball_event 34, 24, PROTECTOR, 1, EVENT_MOUNT_MORTAR_B1F_PROTECTOR
	itemball_event 32,  3, MAX_ETHER, 1, EVENT_MOUNT_MORTAR_B1F_MAX_ETHER
	itemball_event 21, 26, PP_UP, 1, EVENT_MOUNT_MORTAR_B1F_PP_UP

MountMortarB1FHikerScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_DEFENSE_CURL_INTRO
	iftruefwd MountMortarB1FTutorDefenseCurlScript
	writetext MountMortarB1FHikerText
	waitbutton
	setevent EVENT_LISTENED_TO_DEFENSE_CURL_INTRO
MountMortarB1FTutorDefenseCurlScript:
	writetext Text_MountMortarB1FTutorDefenseCurl
	waitbutton
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	writetext Text_MountMortarB1FTutorQuestion
	yesorno
	iffalsefwd .TutorRefused
	setval DEFENSE_CURL
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpthisopenedtext

	text "Ich warte genau"
	line "hier"
	line "auf dich."
	done

.NoSilverLeaf
	jumpthisopenedtext

	text "Schade, du hast"
	line "kein"
	cont "Silberblatt."
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "So! Jetzt kann"
	line "dein #mon"
	cont "EINIGLER!"
	done

MountMortarB1FKiyoScript:
	checkevent EVENT_GOT_TYROGUE_FROM_KIYO
	iftrue_jumptextfaceplayer MountMortarB1FKiyoGotTyrogueText
	faceplayer
	checkevent EVENT_BEAT_KIYO
	iftruefwd .BeatKiyo
	showtext MountMortarB1FKiyoIntroText
	winlosstext MountMortarB1FKiyoWinText, 0
	loadtrainer KARATE_KING, KIYO
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_KIYO
.BeatKiyo:
	opentext
	writetext MountMortarB1FTyrogueRewardText
	promptbutton
	waitsfx
	givepoke TYROGUE, PLAIN_FORM, 10, NO_ITEM, PREMIER_BALL
	iffalse_jumpopenedtext MountMortarB1FKiyoFullPartyAndBoxText
	setevent EVENT_GOT_TYROGUE_FROM_KIYO
	jumpthisopenedtext

MountMortarB1FKiyoGotTyrogueText:
	text "RABAUZ ist ein"
	line "Kampf-#mon."

	para "Es entwickelt"
	line "sich"
	line "zu einem"
	cont "stärkeren"
	cont "#mon."

	para "Arbeite so hart"
	line "weiter. Ich werde"
	cont "auch weiterhin"
	cont "trainieren."

	para "Lebe wohl!"
	done



MountMortarB1FHikerText:
	text "Mein #mon hat"
if DEF(FAITHFUL)
	line "Felsbrecher auf"
else
	line "Durchbruch auf"
endc

	para "einen Felsen"
	line "eingesetzt, aber"

	para "er blieb ganz."
	line "Es war ein"
	cont "Georok, das"
	cont "EINIGLER nutzte!"
	done

Text_MountMortarB1FTutorDefenseCurl:
	text "Ich bringe deinem"
	line "#mon"

	para "EINIGLER bei —"
	line "für ein"
	cont "Silberblatt."
	done


Text_MountMortarB1FTutorQuestion:
	text "Soll ich deinem"
	line "#mon"
	cont "EINIGLER"
	cont "beibringen?"
	done



MountMortarB1FKiyoIntroText:
	text "Heh!"

	para "Ich bin der"
	line "KARATE-MEISTER!"

	para "Ich trainiere"
	line "hier"
	line "allein im"
	cont "Dunkeln!"

	para "Du!"
	line "Kämpfe mit mir!"

	para "Arggh!"
	done



MountMortarB1FKiyoWinText:
	text "Waaaarggh!"
	line "Ich wurde"
	cont "besiegt!"
	done



MountMortarB1FTyrogueRewardText:
	text "Ich… ich bin am"
	line "Boden zerstört…"

	para "Ich habe nicht"
	line "gut"
	line "genug trainiert…"

	para "Eine Niederlage"
	line "ist nun mal eine"
	cont "Niederlage. Das"
	cont "gebe ich zu."

	para "Als Beweis für"
	line "deinen Sieg gebe"

	para "ich dir dieses"
	line "seltene Kampf-"
	cont "#mon."
	done



MountMortarB1FKiyoFullPartyAndBoxText:
	text "Kein Platz im"
	line "Team oder in der"
	line "Box!"
	done
