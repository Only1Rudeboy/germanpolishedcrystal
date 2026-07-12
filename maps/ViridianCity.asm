ViridianCity_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, ViridianCityFlyPoint

	def_warp_events
	warp_event 32,  7, VIRIDIAN_GYM, 1
	warp_event 21,  5, VIRIDIAN_NICKNAME_SPEECH_HOUSE, 1
	warp_event 23, 15, TRAINER_HOUSE_1F, 1
	warp_event 29, 19, VIRIDIAN_MART, 2
	warp_event 23, 25, VIRIDIAN_POKECENTER_1F, 1
	warp_event 20, 33, ROUTE_1_VIRIDIAN_GATE, 1
	warp_event 21, 33, ROUTE_1_VIRIDIAN_GATE, 2
	warp_event 21,  9, VIRIDIAN_SCHOOL_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 17, 17, BGEVENT_JUMPTEXT, ViridianCitySignText
	bg_event 27,  7, BGEVENT_JUMPTEXT, ViridianGymSignText
	bg_event 19,  1, BGEVENT_JUMPTEXT, ViridianCityTrainerTips1Text
	bg_event 21, 29, BGEVENT_JUMPTEXT, ViridianCityTrainerTips2Text
	bg_event 21, 15, BGEVENT_JUMPTEXT, TrainerHouseSignText

	def_object_events
	object_event 18,  5, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 2, 2, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianCityCoffeeGramps, -1
	object_event 32,  8, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianCityGrampsNearGym, EVENT_BLUE_IN_CINNABAR
	object_event 30,  8, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianCityGrampsNearGym, EVENT_VIRIDIAN_GYM_BLUE
	object_event  6, 23, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianCityDreamEaterFisher, -1
	object_event 17, 21, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 3, 3, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, ViridianCityYoungsterText, -1
	object_event 31, 23, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WANDER, 1, 2, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, ViridianCityYoungster2Text, -1
	cuttree_event 14,  4, EVENT_VIRIDIAN_CITY_CUT_TREE_1
	cuttree_event  8, 22, EVENT_VIRIDIAN_CITY_CUT_TREE_2

ViridianCityFlyPoint:
	setflag ENGINE_FLYPOINT_VIRIDIAN
	endcallback

ViridianCityCoffeeGramps:
	faceplayer
	opentext
	writetext ViridianCityCoffeeGrampsQuestionText
	yesorno
	iffalse_jumpopenedtext ViridianCityCoffeeGrampsDoubtedText
	jumpthisopenedtext

	text "Gut, gut. Ja, ich"
	line "war früher schon"

	para "etwas Besonderes,"
	line "das kannst du mir"
	cont "glauben!"
	done






ViridianCityGrampsNearGym:
	checkevent EVENT_BLUE_IN_CINNABAR
	iftrue_jumptextfaceplayer ViridianCityGrampsNearGymBlueReturnedText
	jumpthistextfaceplayer

	text "Diese ARENA hatte"
	line "bis vor kurzem"
	cont "keinen"
	cont "ARENALEITER."

	para "Ein junger Mann"
	line "aus ALABASTIA"

	para "wurde der neue"
	line "LEITER, aber er"
	cont "ist oft unterwegs."
	done






ViridianCityDreamEaterFisher:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_DREAM_EATER_INTRO
	iftruefwd ViridianCityTutorDreamEaterScript
	writetext ViridianCityDreamEaterFisherText
	waitbutton
	setevent EVENT_LISTENED_TO_DREAM_EATER_INTRO
ViridianCityTutorDreamEaterScript:
	writetext Text_ViridianCityTutorDreamEater
	waitbutton
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	writetext Text_ViridianCityTutorQuestion
	yesorno
	iffalsefwd .TutorRefused
	setval DREAM_EATER
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpopenedtext Text_ViridianCityTutorRefused

.NoSilverLeaf
	jumpthisopenedtext

	text "Du hast keine"
	line "Silberblätter…"
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "Sieh nur! Dein"
	line "#mon hat"
	cont "Traumfresser"
	cont "gelernt!"

	para "…Zzzzz…"
	done

ViridianCityCoffeeGrampsQuestionText:
	text "He, Kurzbein! Ich"
	line "hatte gerade einen"

	para "doppelten Espresso"
	line "und ich bin total"
	cont "aufgedreht!"

	para "Ich brauche jetzt"
	line "jemanden zum"
	cont "Reden, und zwar"
	cont "dich!"

	para "Man sieht es mir"
	line "jetzt vielleicht"

	para "nicht mehr an,"
	line "aber ich war ein"
	cont "Experte im Fangen"
	cont "von #mon."

	para "Glaubst du mir?"
	done






ViridianCityCoffeeGrampsDoubtedText:
	text "Was? Du kleiner"
	line "Frechdachs!"

	para "Wenn ich etwas"
	line "jünger wäre, würde"

	para "ich dir schon das"
	line "eine oder andere"
	cont "zeigen! Grummel."
	done






ViridianCityGrampsNearGymBlueReturnedText:
	text "Wirst du den"
	line "ARENALEITER"
	cont "herausfordern?"

	para "Viel Glück! Du"
	line "wirst es brauchen."
	done






ViridianCityDreamEaterFisherText:
	text "Gähn!"

	para "Ich bin wohl in"
	line "der Sonne"
	cont "eingeschlafen."

	para "…Ich hatte diesen"
	line "Traum von einem"

	para "TRAUMATO, das"
	line "meinen Traum"

	para "fressen wollte."
	line "Das ist doch"

	para "merkwürdig, nicht"
	line "wahr?"

	para "Nanu! Was ist das?"

	para "Wo ist diese TM"
	line "hergekommen?"

	para "Unheimlich! Hier,"
	line "du kannst die TM"
	cont "behalten."
	done






Text_ViridianCityTutorDreamEater:
	text "Ich bringe deinem"
	line "#mon bei,"
	cont "Träume zu fressen."

	para "Dafür will ich nur"
	line "ein Silberblatt."
	done


Text_ViridianCityTutorQuestion:
	text "Soll ich deinem"
	line "#mon"
	cont "Traumfresser"
	cont "beibringen?"
	done

Text_ViridianCityTutorRefused: ; text > text
	text "OK…"
	done


ViridianCityYoungsterText:
	text "Ich habe gehört,"
	line "dass man viele"

	para "Items im VERTANIA-"
	line "WALD findet."
	done






ViridianCityYoungster2Text:
	text "Der Anführer von"
	line "TEAM ROCKET war"

	para "hier eine Zeit"
	line "lang Arenaleiter,"

	para "doch vor drei"
	line "Jahren verschwand"
	cont "er eines Tages."

	para "Er war sowieso"
	line "selten in der"
	cont "Arena…"
	done

ViridianCitySignText:
	text "VERTANIA CITY"

	para "Das Immergrüne"
	line "Paradies"
	done






ViridianGymSignText:
	text "#mon-ARENA von"
	line "VERTANIA CITY"
	cont "LEITUNG: …"

	para "Der Rest des Tex-"
	line "tes ist unlesbar…"
	done






ViridianCityTrainerTips1Text:
	text "Trainer-Tipps"

	para "Fang #mon und"
	line "erweitere deine"
	cont "Sammlung!"

	para "Je mehr du hast,"
	line "desto leichter"
	cont "wird der Kampf!"
	done

ViridianCityTrainerTips2Text:
	text "Trainer-Tipps"

	para "Die Welt ist"
	line "riesig groß!"

	para "Lauf nicht nur"
	line "herum oder nutze"
	cont "FLIEGEN — schau"
	cont "dich um!"

	para "Du findest neue,"
	line "aufregende Dinge!"
	done

TrainerHouseSignText:
	text "TRAINER-HAUS"

	para "Der Club, in dem"
	line "Top-Trainer"
	cont "kämpfen"
	done






