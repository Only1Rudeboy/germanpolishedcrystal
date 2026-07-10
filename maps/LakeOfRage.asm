LakeOfRage_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, LakeOfRageFlyPoint
	callback MAPCALLBACK_OBJECTS, LakeOfRageWesleyAndEngineer
	callback MAPCALLBACK_TILES, LakeOfRageFloodScript

	def_warp_events
	warp_event  7,  3, LAKE_OF_RAGE_HIDDEN_POWER_HOUSE, 1
	warp_event 27, 31, LAKE_OF_RAGE_MAGIKARP_HOUSE, 1
	warp_event 10, 28, HIDDEN_TREE_GROTTO, 1

	def_coord_events

	def_bg_events
	bg_event 21, 27, BGEVENT_JUMPTEXT, LakeOfRageSignText
	bg_event  3, 26, BGEVENT_JUMPTEXT, LakeOfRageAdvancedTipsSignText
	bg_event 25, 31, BGEVENT_READ, LakeOfRageFishingGuruSign
	bg_event  4,  4, BGEVENT_ITEM + RARE_CANDY, EVENT_LAKE_OF_RAGE_HIDDEN_RARE_CANDY
	bg_event 35,  5, BGEVENT_ITEM + MAX_POTION, EVENT_LAKE_OF_RAGE_HIDDEN_MAX_POTION
	bg_event 11, 28, BGEVENT_ITEM + FULL_RESTORE, EVENT_LAKE_OF_RAGE_HIDDEN_FULL_RESTORE
	bg_event 10, 27, BGEVENT_JUMPSTD, treegrotto, HIDDENGROTTO_LAKE_OF_RAGE
	bg_event 11, 27, BGEVENT_JUMPSTD, treegrotto, HIDDENGROTTO_LAKE_OF_RAGE

	def_object_events
	object_event 21, 28, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRageLanceScript, EVENT_LAKE_OF_RAGE_LANCE
	object_event 18, 22, SPRITE_BIG_GYARADOS, SPRITEMOVEDATA_BIG_GYARADOS, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRageRedGyaradosScript, EVENT_LAKE_OF_RAGE_RED_GYARADOS
	object_event  4,  4, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, WesleyScript, EVENT_LAKE_OF_RAGE_WESLEY_OF_WEDNESDAY
	object_event 20, 29, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, LakeOfRageEngineerText, EVENT_LAKE_OF_RAGE_CIVILIANS
	object_event  4, 15, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCooltrainermAaron, EVENT_LAKE_OF_RAGE_CIVILIANS
	object_event 36,  7, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 0, GenericTrainerCooltrainerfLois, EVENT_LAKE_OF_RAGE_CIVILIANS
	object_event 30, 23, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFisherAndre, EVENT_LAKE_OF_RAGE_CIVILIANS
	object_event 24, 26, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFisherRaymond, EVENT_LAKE_OF_RAGE_CIVILIANS
	object_event 20, 26, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRageGrampsScript, -1
	object_event 36, 13, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, LakeOfRageSuperNerdText, -1
	object_event 25, 29, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, LakeOfRageCooltrainerFText, -1
	itemball_event 13,  2, ELIXIR, 1, EVENT_LAKE_OF_RAGE_ELIXIR
	itemball_event  7, 10, MAX_REVIVE, 1, EVENT_LAKE_OF_RAGE_MAX_REVIVE
	tmhmball_event 35,  2, TM_SUBSTITUTE, EVENT_LAKE_OF_RAGE_TM_SUBSTITUTE
	cuttree_event 18,  9, EVENT_LAKE_OF_RAGE_CUT_TREE_1
	cuttree_event 11, 12, EVENT_LAKE_OF_RAGE_CUT_TREE_2
	cuttree_event  5, 14, EVENT_LAKE_OF_RAGE_CUT_TREE_3
	cuttree_event  6, 21, EVENT_LAKE_OF_RAGE_CUT_TREE_4
	cuttree_event 23,  4, EVENT_LAKE_OF_RAGE_CUT_TREE_5

	object_const_def
	const LAKEOFRAGE_LANCE
	const LAKEOFRAGE_RED_GYARADOS
	const LAKEOFRAGE_WESLEY

LakeOfRageFlyPoint:
	setflag ENGINE_FLYPOINT_LAKE_OF_RAGE
	endcallback

LakeOfRageWesleyAndEngineer:
	checkevent EVENT_LAKE_OF_RAGE_CIVILIANS
	iftruefwd .NoEngineer
	moveobject LAKEOFRAGE_LANCE, 18, 29
.NoEngineer
	readvar VAR_WEEKDAY
	ifequalfwd WEDNESDAY, .WesleyAppears
	disappear LAKEOFRAGE_WESLEY
	endcallback

.WesleyAppears:
	appear LAKEOFRAGE_WESLEY
	endcallback

LakeOfRageFloodScript:
	special Special_GetOvercastIndex
	ifequalfwd LAKE_OF_RAGE_OVERCAST, .flood
	changemapblocks LakeOfRage_BlockData
	endcallback

.flood
	changemapblocks LakeOfRageFlooded_BlockData
	endcallback

LakeOfRageSignText:
	text "SEE DES ZORNS,"
	line "auch bekannt als"
	cont "GARADOS-SEE"
	done





LakeOfRageAdvancedTipsSignText:
	text "Profi-Tipps!"

	para "Kraftreserve kann"
	line "jeden Typ anneh-"
if DEF(FAITHFUL)
	cont "men, außer dem"
else
	cont "men, sogar dem"
endc

	para "neu entdeckten"
	line "Fee-Typ!"
	done

LakeOfRageFishingGuruSign:
	opentext
	writetext .Text
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftruefwd .Continue
	waitendtext

.Continue:
	promptbutton
	special Special_MagikarpHouseSign
	endtext

.Text:

	text "HAUS DES PROFI-"
	line "ANGLERs"
	done
LakeOfRageLanceScript:
	checkevent EVENT_REFUSED_TO_HELP_LANCE_AT_LAKE_OF_RAGE
	iftruefwd .AskForHelpAgain
	opentext
	writetext .OverheardText
	promptbutton
	faceplayer
	writetext .IntroText
	yesorno
	iffalsefwd .Refused
.Agreed:
	writetext .YesText
	waitbutton
	closetext
	playsound SFX_WARP_TO
	applyonemovement LAKEOFRAGE_LANCE, teleport_from
	disappear LAKEOFRAGE_LANCE
	clearevent EVENT_MAHOGANY_MART_LANCE_AND_DRAGONITE
	setevent EVENT_DECIDED_TO_HELP_LANCE
	setmapscene MAHOGANY_MART_1F, SCENE_MAHOGANYMART1F_LANCE_UNCOVERS_STAIRS
	end

.Refused:
	setevent EVENT_REFUSED_TO_HELP_LANCE_AT_LAKE_OF_RAGE
	jumpthisopenedtext

	text "Oh… Solltest du"
	line "deine Meinung"
	cont "ändern, dann hilf"
	cont "mir bitte."
	done
.AskForHelpAgain:
	faceplayer
	opentext
	writetext .QuestionText
	yesorno
	iffalse .Refused
	sjump .Agreed

.OverheardText:
	text "Dieser See ist"
	line "voller GARADOS."
	cont "Aber sonst gibt es"
	cont "hier nichts…"

	para "Die KARPADOR"
	line "werden also"
	cont "gezwungen, sich zu"
	cont "entwickeln…"
	done
.IntroText:
	text "Bist du wegen der"
	line "Gerüchte hier?"

	para "Du bist <PLAYER>?"
	line "Ich bin SIEGFRIED,"

	para "ein Trainer wie"
	line "du."

	para "Ich hörte einige"
	line "Gerüchte. Also kam"

	para "ich hierher, um"
	line "einige"
	cont "Nachforschungen"
	cont "anzustellen…"

	para "Ich habe gesehen,"
	line "wie du kämpfst,"
	cont "<PLAYER>."

	para "Man kann sagen,"
	line "dass du ein"
	cont "Trainer von"
	cont "bemerkenswertem"
	cont "Format bist."

	para "Würdest du mir bei"
	line "meinen"
	cont "Nachforschungen"
	cont "helfen?"
	done
.YesText:
	text "SIEGFRIED:"
	line "Exzellent!"

	para "Es sieht so aus,"
	line "als würde jemand"

	para "die KARPADOR im"
	line "SEE zwingen, sich"
	cont "zu entwickeln."

	para "Die Ursache ist"
	line "das mysteriöse"

	para "Radiosignal aus"
	line "MAHAGONIA CITY."

	para "Ich werde auf dich"
	line "warten, <PLAYER>."
	done
.QuestionText:
	text "SIEGFRIED: Na?"
	line "Wirst du mir"
	cont "helfen?"
	done
LakeOfRageEngineerText:
	text "Ich bin"
	line "Stadtplaner."

	para "Ich habe große"
	line "Pläne für diesen"
	cont "Ort, warte nur!"

	para "Es ist der"
	line "perfekte Platz für"
	cont "mein nächstes"
	cont "Projekt."
	done

LakeOfRageRedGyaradosScript:
	opentext
	writetext .GyaradosText
	cry GYARADOS
	pause 15
	closetext
	loadwildmon GYARADOS, GYARADOS_RED_FORM, 35
	loadvar VAR_BATTLETYPE, BATTLETYPE_NEVER_SHINY
	startbattle
	ifequalfwd $1, .Continue
	disappear LAKEOFRAGE_RED_GYARADOS
.Continue:
	reloadmapafterbattle
	opentext
	givekeyitem RED_SCALE
	waitsfx
	writetext .RedScaleText
	special ShowKeyItemIcon
	playsound SFX_KEY_ITEM
	waitbutton
	keyitemnotify
	closetext
	appear LAKEOFRAGE_LANCE
	end

.GyaradosText:
	text "GARADOS: Gashaa!"
	done
.RedScaleText:
	text "<PLAYER> found Red"
	line "Scale."
	done

WesleyScript:
	checkevent EVENT_GOT_BLACK_BELT_FROM_WESLEY
	iftrue_jumptextfaceplayer .WednesdayText
	readvar VAR_WEEKDAY
	ifnotequal WEDNESDAY, .NotWednesday
	faceplayer
	opentext
	checkevent EVENT_MET_WESLEY_OF_WEDNESDAY
	iftruefwd .MetWesley
	writetext .MeetText
	promptbutton
	setevent EVENT_MET_WESLEY_OF_WEDNESDAY
.MetWesley:
	writetext .GivesGiftText
	promptbutton
	verbosegiveitem BLACK_BELT
	iffalse_endtext
	setevent EVENT_GOT_BLACK_BELT_FROM_WESLEY
	jumpthisopenedtext

	text "Wesley: Der"
	line "Schwarzgurt"

	para "verstärkt die"
	line "Kraft von Kampf-"
	cont "Attacken."
	done

.NotWednesday:
	jumpthisopenedtext

	text "MITKO: Heute ist"
	line "nicht Mittwoch."
	cont "Wie schade."
	done
.MeetText:
	text "MITKO: Na, wie"
	line "geht es dir?"

	para "Ich bin MITKO von"
	line "Mittwoch. Soll"

	para "heißen, heute ist"
	line "Mittwoch."
	done
.GivesGiftText:
	text "Freut mich, dich"
	line "kennen zu lernen."
	cont "Nimm dir bitte ein"
	cont "Souvenir."
	done
.WednesdayText:
	text "MITKO: Da du mich"
	line "gefunden hast,"

	para "musst du meine"
	line "Brüder und"
	cont "Schwestern"
	cont "getroffen haben."

	para "Oder hattest du"
	line "einfach nur Glück?"
	done
GenericTrainerCooltrainermAaron:
	generictrainer COOLTRAINERM, AARON, EVENT_BEAT_COOLTRAINERM_AARON, .SeenText, .BeatenText

	text "#mon und ihre"
	line "Trainer werden"
	cont "durch ständiges"
	cont "Kämpfen immer"
	cont "stärker."
	done
.SeenText:

	text "Trifft ein Trainer"
	line "auf einen anderen,"

	para "so muss er ihn"
	line "herausfordern."

	para "Das ist unsere"
	line "Bestimmung."
	done

.BeatenText:

	text "Wow… Toller Kampf!"
	done

GenericTrainerCooltrainerfLois:
	generictrainer COOLTRAINERF, LOIS, EVENT_BEAT_COOLTRAINERF_LOIS, .SeenText, .BeatenText

	text "Stell dir vor, ich"
	line "habe ein rosa"
	cont "SMETTBO gesehen!"
	done
.SeenText:
	text "Was geschah mit"
	line "dem roten GARADOS?"

	para "Es ist fort?"

	para "Oh, dann bin ich"
	line "umsonst"
	cont "hergekommen."

	para "Ich weiß was! Lass"
	line "uns kämpfen!"
	done
.BeatenText:
	text "Der war gut!"
	done
GenericTrainerFisherAndre:
	generictrainer FISHER, ANDRE, EVENT_BEAT_FISHER_ANDRE, FisherAndreSeenText, FisherAndreBeatenText

	text "Ich werde mich als"
	line "Angler beweisen."
	cont "Ich werde tagein,"
	cont "tagaus #mon"
	cont "fangen."
	done
FisherAndreSeenText:
	text "Lass die #mon,"
	line "die ich gerade"
	cont "gefangen habe,"
	cont "kämpfen!"
	done





FisherAndreBeatenText:
	text "Ich mag zwar ein"
	line "guter Angler sein,"

	para "aber als Trainer"
	line "habe ich versagt…"
	done





GenericTrainerFisherRaymond:
	generictrainer FISHER, RAYMOND, EVENT_BEAT_FISHER_RAYMOND, FisherRaymondSeenText, FisherRaymondBeatenText

	text "Warum kann ich"
	line "keine guten"
	cont "#mon fangen?"
	done
FisherRaymondSeenText:
	text "Ich kann tun, was"
	line "ich will. Ich"
	cont "fange immer nur"
	cont "die gleichen"
	cont "#mon…"
	done





FisherRaymondBeatenText:
	text "Meine Schnur hat"
	line "sich verheddert…"
	done





LakeOfRageGrampsScript:
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue_jumptextfaceplayer .Text2
	jumpthistextfaceplayer

	text "Die GARADOS sind"
	line "wütend!"

	para "Das ist ein böses"
	line "Omen!"
	done

.Text2:
	text "Haha! Die KARPA-"
	line "DOR beißen!"
	done
LakeOfRageSuperNerdText:
	text "Ich habe gehört,"
	line "dieser See"
	cont "entstand durch"
	cont "wütende GARADOS."

	para "Ich frage mich, ob"
	line "da eine Verbindung"

	para "zu der momentanen"
	line "Situation besteht!"
	done





LakeOfRageCooltrainerFText:
	text "Täuschen mich"
	line "meine Augen? Ich"
	cont "sah"

	para "ein rotes GARADOS"
	line "im SEE…"

	para "Aber ich dachte,"
	line "GARADOS sind blau!"
	done





