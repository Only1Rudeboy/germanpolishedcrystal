CeladonCity_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, CeladonCityFlyPoint

	def_warp_events
	warp_event  8,  9, CELADON_DEPT_STORE_1F, 1
	warp_event 20,  9, CELADON_MANSION_1F, 1
	warp_event 20,  3, CELADON_MANSION_1F, 3
	warp_event 21,  3, CELADON_MANSION_1F, 3
	warp_event 33,  9, CELADON_POKECENTER_1F, 1
	warp_event 22, 19, CELADON_GAME_CORNER, 1
	warp_event 27, 19, CELADON_GAME_CORNER_PRIZE_ROOM, 1
	warp_event 14, 29, CELADON_GYM, 1
	warp_event 25, 29, CELADON_CAFE, 1
	warp_event 29, 29, CELADON_CHIEF_HOUSE, 1
	warp_event 35, 29, CELADON_HOTEL_1F, 1
	warp_event 13,  9, CELADON_HOME_DECOR_STORE_1F, 1
	warp_event  4, 29, CELADON_UNIVERSITY_1F, 1
	warp_event 29,  9, EUSINES_HOUSE, 1
	warp_event 33, 19, CELADON_OLD_MAN_SPEECH_HOUSE, 1
	warp_event 37, 19, CELADON_DEVELOPMENT_SPEECH_HOUSE, 1
	warp_event  9,  9, CELADON_DEPT_STORE_1F, 2
	warp_event 23, 19, CELADON_GAME_CORNER, 2
	warp_event  5, 29, CELADON_UNIVERSITY_1F, 2

	def_coord_events

	def_bg_events
	bg_event 11, 18, BGEVENT_JUMPTEXT, CeladonCitySignText
	bg_event 15, 31, BGEVENT_JUMPTEXT, CeladonGymSignText
	bg_event  3, 31, BGEVENT_JUMPTEXT, CeladonUniversitySignText
	bg_event 10,  9, BGEVENT_JUMPTEXT, CeladonCityDeptStoreSignText
	bg_event 14,  9, BGEVENT_JUMPTEXT, CeladonCityHomeDecorStoreSignText
	bg_event 17,  9, BGEVENT_JUMPTEXT, CeladonCityMansionSignText
	bg_event 21, 21, BGEVENT_JUMPTEXT, CeladonCityGameCornerSignText
	bg_event 27, 21, BGEVENT_JUMPTEXT, CeladonCityPrizeExchangeSignText
	bg_event 23, 29, BGEVENT_JUMPTEXT, CeladonCityCafeSignText
	bg_event 33, 29, BGEVENT_JUMPTEXT, CeladonCityHotelSignText
	bg_event 33, 21, BGEVENT_JUMPTEXT, CeladonCityTrainerTips1Text
	bg_event 21, 15, BGEVENT_JUMPTEXT, CeladonCityTrainerTips2Text
	bg_event 41, 21, BGEVENT_ITEM + PP_UP, EVENT_CELADON_CITY_HIDDEN_PP_UP

	def_object_events
	object_event  4, 15, SPRITE_RICH_BOY, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonCityScript, -1
	object_event 30, 11, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonCityFisherText, -1
	pokemon_event 31, 11, POLIWRATH, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BLUE, CeladonCityPoliwrathText, -1
	object_event 24, 24, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonCityTeacher1Text, -1
	object_event 17, 16, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonCityGramps1Text, -1
	object_event 12, 31, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonCityGramps2Text, -1
	object_event 22, 13, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonCityYoungster1Text, -1
	object_event 27, 32, SPRITE_CAMPER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonCityYoungster2Text, -1
	object_event 12, 13, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 2, 2, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonCityTeacher2Text, -1
	object_event 10, 22, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonCityLassText_PCC, -1
	object_event 45, 10, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_SNORLAX, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_7_SNORLAX
	object_event 35, 23, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonCityLassText, -1
	itemball_event 39,  7, MAX_ETHER, 1, EVENT_CELADON_CITY_MAX_ETHER
	cuttree_event 32, 34, EVENT_CELADON_CITY_CUT_TREE

CeladonCityFlyPoint:
	setflag ENGINE_FLYPOINT_CELADON
	endcallback

CeladonCityScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_SWAGGER_INTRO
	iftruefwd CeladonCityTutorSwaggerScript
	writetext CeladonCityRichBoyText
	waitbutton
	setevent EVENT_LISTENED_TO_SWAGGER_INTRO
CeladonCityTutorSwaggerScript:
	writetext Text_CeladonCityTutorSwagger
	waitbutton
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	writetext Text_CeladonCityTutorQuestion
	yesorno
	iffalsefwd .TutorRefused
	setval SWAGGER
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpthisopenedtext

	text "Dann leb wohl!"
	done

.NoSilverLeaf
	jumpthisopenedtext

	text "…Du hast kein"
	line "Silberblatt? Wie"
	cont "schade."
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "Siehe da! Dein"
	line "#mon hat"
	cont "Angeberei gelernt!"
	done

CeladonCityRichBoyText:
	text "Ist mein Anzug"
	line "nicht blendend?"

	para "Er lässt alle"
	line "Köpfe drehen, wenn"
	cont "ich"

	para "die Straße"
	line "entlangstolziere!"

	para "Die Leute lieben"
	line "mich!"

	para "Ich bin heute"
	line "großzügig"
	cont "gestimmt."
	done

Text_CeladonCityTutorSwagger:
	text "Ich lehre dein"
	line "#mon Angeberei"
	cont "wie ich, nur für"

	para "ein Silberblatt."
	done


Text_CeladonCityTutorQuestion:
	text "Möchtest du, dass"
	line "ich deinem #mon"
	cont "Angeberei"

	para "beibringe?"
	done



CeladonCityFisherText:
	text "Dieser Quappo ist"
	line "mein Partner."

	para "Er war früher"
	line "Sanft, aber die"
	cont "Verwalterin im"

	para "Wohnkomplex hier"
	line "braute uns Tee mit"
	cont "einem"

	para "Minzblatt, das ihn"
	line "froher machte!"
	done

CeladonCityPoliwrathText:
	text "Quappo: Quaak!"
	done

CeladonCityTeacher1Text:
	text "Ich hab schon"
	line "wieder an den"
	cont "Automaten"

	para "verloren…"

	para "Wir Mädchen zocken"
	line "jetzt auch an den"
	cont "Automaten."

	para "Du solltest sie"
	line "dir auch mal"
	cont "ansehen."
	done

CeladonCityGramps1Text:
	text "Sleimok tauchen in"
	line "letzter Zeit auf."

	para "Siehst du den"
	line "Teich vor dem"
	cont "Haus? Dort leben"

	para "jetzt Sleimok."

	para "Woher kommen die"
	line "bloß? Das ist ein"
	cont "ernstes Problem…"
	done

CeladonCityGramps2Text:
	text "Nihihi! Diese"
	line "Arena ist toll!"

	para "Nur Mädchen dürfen"
	line "hier rein!"
	done

CeladonCityYoungster1Text:
	text "Willst du ein"
	line "Geheimnis wissen?"

	para "Der Prismania-"
	line "Wohnkomplex hat"
	cont "eine versteckte"

	para "Hintertür."
	done

CeladonCityYoungster2Text:
	text "Das Restaurant"
	line "dort veranstaltet"
	cont "einen Fress-"

	para "wettbewerb."

	para "Diesmal ist eine"
	line "Teilnehmerin aus"
	cont "der Sinnoh-Region"

	para "dabei."

	para "Ihr zuzusehen"
	line "macht mich schon"
	cont "vom Anschauen"

	para "satt…"
	done

CeladonCityTeacher2Text:
	text "Prismanias"
	line "Kaufhaus hat die"
	cont "größte und beste"

	para "Auswahl an Waren."

	para "Wenn du's dort"
	line "nicht bekommst,"
	cont "bekommst du's"

	para "nirgends."

	para "Puh… ich klinge"
	line "wie eine"
	cont "Verkäuferin."
	done

CeladonCityLassText_PCC:
	text "Ich liebe es, von"
	line "hohen Gebäuden"
	cont "umgeben zu sein!"

	para "Stimmt es, dass"
	line "das #mon-Center"
	cont "in Dukatia City"

	para "viel größer gebaut"
	line "wurde?"

	para "Das ist so toll!"
	line "Ich wünschte, wir"
	cont "hätten sowas auch"

	para "in Kanto…"
	done

CeladonCityLassText:
	text "#mon werden als"
	line "Preise in der"
	cont "Spielhalle"

	para "angeboten."

	para "Die armen Wesen…"
	done

CeladonCitySignText:
	text "Prismania City"

	para "Die Stadt der"
	line "Regenbogenträume"
	done

CeladonGymSignText:
	text "Prismania City"
	line "#mon-Arena"
	cont "Leiterin: Erika"

	para "Die naturliebende"
	line "Prinzessin"
	done

CeladonUniversitySignText:
	text "Prismania-"
	line "Universität"

	para "“Wachstum durch"
	line "Lernen”"
	done

CeladonCityDeptStoreSignText:
	text "Finde alles, was"
	line "du brauchst - im"
	cont "Prismania-"
	cont "Kaufhaus!"
	done

CeladonCityHomeDecorStoreSignText:
	text "Prismania-Kaufhaus"
	line "Wohndeko-"
	cont "Abteilung"
	done

CeladonCityMansionSignText:
	text "Prismania-"
	line "Wohnkomplex"
	done

CeladonCityGameCornerSignText:
	text "Der Spielplatz für"
	line "alle-- Prismanias"

	para "Spielhalle"
	done

CeladonCityPrizeExchangeSignText:
	text "Münzen gegen"
	line "Preise!"
	cont "Preisetausch"
	done

CeladonCityCafeSignText:
	text "Prismania-Diner"

	para "Heute den ganzen"
	line "Tag"
	cont "Fresswettbewerb!"
	done

CeladonCityHotelSignText:
	text "Prismania-Hotel"

	para "Entspann dich in"
	line "unserem Pool!"
	done

CeladonCityTrainerTips1Text:
	text "Trainer-Tipps"

if DEF(FAITHFUL)
	para "Schutzplus"
else
	para "Schutzplus"
endc
	line "schützt #mon"

	para "vor Statuswerte-"
	line "Senkungen."

	para "Kauf deine Items"
	line "im Prismania-"
	cont "Kaufhaus!"
	done

CeladonCityTrainerTips2Text:
	text "Trainer-Tipps"

	para "Evoli ist ein"
	line "#mon voller"
	cont "Potenzial."

	para "Probier es an"
	line "vielen Orten, zu"
	cont "verschiedenen"

	para "Zeiten und mit"
	line "Entwicklungs-"
	cont "steinen."
	done
