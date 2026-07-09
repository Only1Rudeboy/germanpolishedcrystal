ViridianGym_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  6, 43, VIRIDIAN_CITY, 1
	warp_event  7, 43, VIRIDIAN_CITY, 1

	def_coord_events

	def_bg_events
	bg_event  4, 41, BGEVENT_READ, ViridianGymStatue
	bg_event  9, 41, BGEVENT_READ, ViridianGymStatue

	def_object_events
	object_event  7,  2, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianGymBlueScript, EVENT_VIRIDIAN_GYM_BLUE
	object_event  8, 41, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianGymGuyScript, EVENT_VIRIDIAN_GYM_BLUE
	object_event  7, 33, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerAceDuoAraandbela1, -1
	object_event  6, 33, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerAceDuoAraandbela2, -1
	object_event  3, 32, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCooltrainerfSalma, -1
	object_event  3, 18, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCooltrainerfBonita, -1
	object_event  6,  8, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerAceDuoElanandida1, -1
	object_event  7,  8, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerAceDuoElanandida2, -1

ViridianGymBlueScript:
	faceplayer
	opentext
	checkflag ENGINE_EARTHBADGE
	iftruefwd .FightDone
	writetext LeaderBlueBeforeText
	waitbutton
	closetext
	winlosstext LeaderBlueWinText, 0
	loadtrainer BLUE, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BLUE
	setevent EVENT_BEAT_ACE_DUO_ARA_AND_BELA
	setevent EVENT_BEAT_COOLTRAINERF_SALMA
	setevent EVENT_BEAT_COOLTRAINERF_BONITA
	setevent EVENT_BEAT_ACE_DUO_ELAN_AND_IDA
	opentext
	givebadge EARTHBADGE, KANTO_REGION
	setevent EVENT_FINAL_BATTLE_WITH_LYRA
.FightDone:
	checkevent EVENT_GOT_TM71_STONE_EDGE
	iftrue_jumpopenedtext LeaderBlueEpilogueText
	writetext LeaderBlueAfterText
	promptbutton
	verbosegivetmhm TM_STONE_EDGE
	setevent EVENT_GOT_TM71_STONE_EDGE
	jumpthisopenedtext

	text "Er enthält"
	line "Stone Edge. Nicht"
	cont "nur für"

	para "Gesteins-#mon,"
	line "verstanden?"

	para "…"

	para "Okay, ich lag"
	line "falsch. Du bist"

	para "echt gut. Du bist"
	line "ein guter"
	line "Trainer."

	para "Mit acht Orden"
	line "aus Kanto kannst"

	para "du die Top Vier"
	line "wieder"
	line "herausfordern."

	para "Die gehen nicht"
	line "leicht mit dir"
	cont "um,"
	cont "der zwei Regionen"
	cont "schlug."

	para "Du kannst mit mir"
	line "im Kampf-Dojo in"

	para "Saffronia montags"
	line "trainieren."

	para "Alle Arenaleiter"
	line "sind dort zum"
	cont "Trainieren."

	para "Ich werde dich"
	line "eines Tages"
	line "schlagen."

	para "Vergiss das"
	line "nicht!"
	done

ViridianGymGuyScript:
	checkevent EVENT_BEAT_BLUE
	iftrue_jumptextfaceplayer ViridianGymGuyWinText
	jumpthistextfaceplayer

	text "He! Ein CHAMP"
	line "in spe!"

	para "Wie läuft es so?"
	line "Du hast wohl"
	cont "gerade eine"
	cont "Glückssträhne."

	para "Der ARENALEITER"
	line "hat den CHAMP"

	para "vor drei Jahren"
	line "besiegt."

	para "Das wird kein"
	line "Kinderspiel!"

	para "Gib alles, was"
	line "du hast!"
	done
GenericTrainerAceDuoAraandbela1:
	generictrainer ACE_DUO, ARAANDBELA1, EVENT_BEAT_ACE_DUO_ARA_AND_BELA, AceDuoAraandbela1SeenText, AceDuoAraandbela1BeatenText

	text "Ara: Ich wäre ein"
	line "ziemlich guter"
	cont "Trainingspartner…"
	done

GenericTrainerAceDuoAraandbela2:
	generictrainer ACE_DUO, ARAANDBELA2, EVENT_BEAT_ACE_DUO_ARA_AND_BELA, AceDuoAraandbela2SeenText, AceDuoAraandbela2BeatenText

	text "Bela: Unsere"
	line "Übungskämpfe"
	line "haben uns nicht"
	cont "darauf"
	cont "vorbereitet."
	done

GenericTrainerCooltrainerfSalma:
	generictrainer COOLTRAINERF, SALMA, EVENT_BEAT_COOLTRAINERF_SALMA, CooltrainerfSalmaSeenText, CooltrainerfSalmaBeatenText

	text "Es gibt viele"
	line "Arenen auf der"
	cont "Welt,"

	para "aber diese hier"
	line "mag ich"
	cont "besonders!"
	done

GenericTrainerCooltrainerfBonita:
	generictrainer COOLTRAINERF, BONITA, EVENT_BEAT_COOLTRAINERF_BONITA, CooltrainerfBonitaSeenText, CooltrainerfBonitaBeatenText

	text "Du hast wohl noch"
	line "einiges an"
	cont "Energie übrig."
	done

GenericTrainerAceDuoElanandida1:
	generictrainer ACE_DUO, ELANANDIDA1, EVENT_BEAT_ACE_DUO_ELAN_AND_IDA, AceDuoElanandida1SeenText, AceDuoElanandida1BeatenText

	text "Elan: Du bist"
	line "stärker als"
	cont "erwartet!"
	done

GenericTrainerAceDuoElanandida2:
	generictrainer ACE_DUO, ELANANDIDA2, EVENT_BEAT_ACE_DUO_ELAN_AND_IDA, AceDuoElanandida2SeenText, AceDuoElanandida2BeatenText

	text "Ida: Nur Stärke"
	line "allein reicht"
	cont "nicht aus."

	para "Strategie ist"
	line "auch wichtig!"
	done

ViridianGymStatue:
	gettrainername BLUE, 1, STRING_BUFFER_4
	checkflag ENGINE_EARTHBADGE
	iftruefwd .Beaten
	jumpstd gymstatue1
.Beaten:
	jumpstd gymstatue2

LeaderBlueBeforeText:
	text "BLAU: He! Hast du"
	line "es endlich"
	cont "hierher"
	cont "geschafft?"

	para "Auf den ZINNOBER-"
	line "INSELN war mir"

	para "nicht danach,"
	line "aber"
	line "jetzt können wir"
	cont "kämpfen."

	para "…"

	para "Willst du etwa"
	line "behaupten, du"

	para "hättest alle"
	line "ARENALEITER in"
	cont "JOHTO besiegt?"

	para "He! Dann müssen"
	line "die ARENALEITER"
	cont "in"
	cont "JOHTO ziemliche"
	cont "Jammerlappen"
	cont "sein."

	para "Aber - nur"
	line "keine Bange."

	para "Ich werde dir"
	line "sofort sagen, ob"

	para "du ein guter"
	line "Kämpfer bist."

	para "Fertig, JOHTO-"
	line "CHAMP?"
	done




LeaderBlueWinText:
	text "BLAU: Was?"

	para "Wie zum Teufel"
	line "konnte ich gegen"
	cont "dich verlieren?"

	para "…"

	para "Also gut…"
	line "Hier, nimm das -"
	cont "es ist der"
	cont "ERDORDEN."
	done




LeaderBlueAfterText:
	text "BLAU: …"

	para "In Ordnung. Ich"
	line "hatte Unrecht. Du"

	para "bist nicht aus"
	line "Watte, sondern"
	cont "ein"
	cont "guter Trainer."

	para "Aber eines Tages"
	line "werde ich dich"

	para "besiegen. Ich"
	line "vergesse dich"
	cont "nicht!"
	done




LeaderBlueEpilogueText:
	text "BLAU: Hör gut zu."

	para "Es bekommt dir"
	line "besser, nicht zu"
	cont "verlieren, bis"
	cont "ich"
	cont "dich besiegt"
	cont "habe!"
	cont "Klar?"
	done




ViridianGymGuyWinText:
	text "Junge, Junge! Du"
	line "bist sehr stark…"

	para "Das war"
	line "vielleicht"
	line "ein erfrischender"

	para "Kampf. Er hat mir"
	line "Tränen in die"
	cont "Augen getrieben."
	done
AceDuoAraandbela1SeenText:
	text "Ara: Komm schon,"
	line "kämpf gegen uns"
	cont "und sieh selbst!"
	done

AceDuoAraandbela1BeatenText:
	text "Ara: Wir wurden"
	line "getäuscht!"
	done

AceDuoAraandbela2SeenText:
	text "Bela: Komm schon,"
	line "kämpf gegen uns"
	cont "und sieh selbst!"
	done

AceDuoAraandbela2BeatenText:
	text "Bela: Wir wurden"
	line "getäuscht!"
	done

CooltrainerfSalmaSeenText:
	text "Was meinst du?"

	para "So eine wunder-"
	line "bare Arena hast"
	cont "du"
	cont "noch nie gesehen,"
	cont "oder?"
	done

CooltrainerfSalmaBeatenText:
	text "Egal!"
	done

CooltrainerfBonitaSeenText:
	text "Wenn du dich im"
	line "Raum umsiehst,"
	line "wird dir doch"

	para "auch schwindelig,"
	line "oder?"
	done

CooltrainerfBonitaBeatenText:
	text "All meine #mon…"

	para "Alle schwindelig"
	line "und ohnmächtig…"
	done

AceDuoElanandida1SeenText:
	text "Elan: Na gut,"
	line "fangen wir den"
	cont "Kampf an!"
	done

AceDuoElanandida1BeatenText:
	text "Elan: Das ist"
	line "überraschend."
	done

AceDuoElanandida2SeenText:
	text "Ida: Ich bin Ida!"
	line "Neben mir ist"
	line "Elan!"

	para "Zusammen sind"
	line "wir ein"
	line "Ass-Duo!"
	done

AceDuoElanandida2BeatenText:
	text "Ida: Wow. Du bist"
	line "echt etwas Beson-"
	cont "deres."
	done
