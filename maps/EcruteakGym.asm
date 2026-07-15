EcruteakGym_MapScriptHeader:
	def_scene_scripts
	scene_script EcruteakGymForcedToLeaveScene, SCENE_ECRUTEAKGYM_FORCED_TO_LEAVE
	scene_const SCENE_ECRUTEAKGYM_NOOP

	def_callbacks

	def_warp_events
	warp_event  4, 21, ECRUTEAK_CITY, 10
	warp_event  5, 21, ECRUTEAK_CITY, 10
	warp_event  4, 18, ECRUTEAK_GYM, 4
	warp_event  2,  4, ECRUTEAK_GYM, 3
	warp_event  3,  4, ECRUTEAK_GYM, 3
	warp_event  4,  4, ECRUTEAK_GYM, 3
	warp_event  6,  4, ECRUTEAK_GYM, 3
	warp_event  7,  4, ECRUTEAK_GYM, 3
	warp_event  4,  5, ECRUTEAK_GYM, 3
	warp_event  2,  6, ECRUTEAK_GYM, 3
	warp_event  3,  6, ECRUTEAK_GYM, 3
	warp_event  4,  6, ECRUTEAK_GYM, 3
	warp_event  5,  6, ECRUTEAK_GYM, 3
	warp_event  7,  6, ECRUTEAK_GYM, 3
	warp_event  5,  7, ECRUTEAK_GYM, 3
	warp_event  7,  7, ECRUTEAK_GYM, 3
	warp_event  2,  8, ECRUTEAK_GYM, 3
	warp_event  3,  8, ECRUTEAK_GYM, 3
	warp_event  4,  8, ECRUTEAK_GYM, 3
	warp_event  5,  8, ECRUTEAK_GYM, 3
	warp_event  7,  8, ECRUTEAK_GYM, 3
	warp_event  7,  9, ECRUTEAK_GYM, 3
	warp_event  2, 10, ECRUTEAK_GYM, 3
	warp_event  4, 10, ECRUTEAK_GYM, 3
	warp_event  5, 10, ECRUTEAK_GYM, 3
	warp_event  6, 10, ECRUTEAK_GYM, 3
	warp_event  7, 10, ECRUTEAK_GYM, 3
	warp_event  2, 11, ECRUTEAK_GYM, 3
	warp_event  4, 11, ECRUTEAK_GYM, 3
	warp_event  2, 12, ECRUTEAK_GYM, 3
	warp_event  4, 12, ECRUTEAK_GYM, 3
	warp_event  5, 12, ECRUTEAK_GYM, 3
	warp_event  6, 12, ECRUTEAK_GYM, 3
	warp_event  7, 12, ECRUTEAK_GYM, 3
	warp_event  2, 13, ECRUTEAK_GYM, 3
	warp_event  2, 14, ECRUTEAK_GYM, 3
	warp_event  3, 14, ECRUTEAK_GYM, 3
	warp_event  4, 14, ECRUTEAK_GYM, 3
	warp_event  5, 14, ECRUTEAK_GYM, 3
	warp_event  7, 14, ECRUTEAK_GYM, 3
	warp_event  5, 15, ECRUTEAK_GYM, 3
	warp_event  7, 15, ECRUTEAK_GYM, 3
	warp_event  2, 16, ECRUTEAK_GYM, 3
	warp_event  3, 16, ECRUTEAK_GYM, 3
	warp_event  4, 16, ECRUTEAK_GYM, 3
	warp_event  5, 16, ECRUTEAK_GYM, 3
	warp_event  7, 16, ECRUTEAK_GYM, 3
	warp_event  2, 17, ECRUTEAK_GYM, 3
	warp_event  7, 17, ECRUTEAK_GYM, 3

	def_coord_events

	def_bg_events
	bg_event  3, 19, BGEVENT_READ, EcruteakGymStatue
	bg_event  6, 19, BGEVENT_READ, EcruteakGymStatue

	def_object_events
	object_event  4, 18, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ECRUTEAK_GYM_GRAMPS
	object_event  5,  1, SPRITE_MORTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakGymMortyScript, -1
	object_event  2,  9, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSageJeffrey, -1
	object_event  3, 17, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSagePing, -1
	object_event  7,  5, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerMediumMartha, -1
	object_event  7, 13, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerMediumGrace, -1
	object_event  7, 19, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakGymGuyScript, -1

	object_const_def
	const ECRUTEAKGYM_GRAMPS

EcruteakGymForcedToLeaveScene:
	end



EcruteakGymMortyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MORTY
	iftruefwd .FightDone
	writetext MortyIntroText
	waitbutton
	closetext
	winlosstext MortyWinLossText, 0
	loadtrainer MORTY, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_MORTY
	opentext
	givebadge FOGBADGE, JOHTO_REGION
	setmapscene ECRUTEAK_HOUSE, SCENE_ECRUTEAKHOUSE_NOOP
	setevent EVENT_RANG_CLEAR_BELL_1
	setevent EVENT_RANG_CLEAR_BELL_2
.FightDone:
	checkevent EVENT_GOT_TM30_SHADOW_BALL
	iftrue_jumpopenedtext MortyFightDoneText
	setevent EVENT_BEAT_SAGE_JEFFREY
	setevent EVENT_BEAT_SAGE_PING
	setevent EVENT_BEAT_MEDIUM_MARTHA
	setevent EVENT_BEAT_MEDIUM_GRACE
	writetext MortyText_FogBadgeSpeech
	promptbutton
	verbosegivetmhm TM_SHADOW_BALL
	setevent EVENT_GOT_TM30_SHADOW_BALL
	jumpthisopenedtext

	text "Schattenball."
	line "Verursacht Schaden"
	cont "und kann die"
	cont "Spezial-Vert."
	cont "senken."

	para "Nutze es, wenn es"
	line "dir gefällt."
	done

EcruteakGymClosed:
	applyonemovement PLAYER, step_up
	applyonemovement ECRUTEAKGYM_GRAMPS, slow_step_down
	showtext EcruteakGymClosedText
	follow PLAYER, ECRUTEAKGYM_GRAMPS
	applymovement PLAYER, EcruteakGymPlayerSlowStepDownMovement
	stopfollow
	warpcheck
	warpsound
	newloadmap MAPSETUP_DOOR
	end



GenericTrainerSageJeffrey:
	generictrainer SAGE, JEFFREY, EVENT_BEAT_SAGE_JEFFREY, SageJeffreySeenText, SageJeffreyBeatenText

	text "Woher kommen"
	line "#mon?"
	done

GenericTrainerSagePing:
	generictrainer SAGE, PING, EVENT_BEAT_SAGE_PING, SagePingSeenText, SagePingBeatenText

	text "Wir setzen nur"
	line "Geist-#mon ein."

	para "Normal-Attacken"
	line "zeigen bei ihnen"
	cont "keine Wirkung!"
	done

GenericTrainerMediumMartha:
	generictrainer MEDIUM, MARTHA, EVENT_BEAT_MEDIUM_MARTHA, MediumMarthaSeenText, MediumMarthaBeatenText

	text "Wer siegen will,"
	line "wird es auch tun!"
	done

GenericTrainerMediumGrace:
	generictrainer MEDIUM, GRACE, EVENT_BEAT_MEDIUM_GRACE, MediumGraceSeenText, MediumGraceBeatenText

	text "Gut, ich verrate"
	line "dir das Geheimnis"

	para "des unsichtbaren"
	line "Bodens."

	para "Der Weg liegt vor"
	line "unseren Augen!"
	done

EcruteakGymGuyScript:
	checkevent EVENT_BEAT_MORTY
	iftrue_jumptextfaceplayer EcruteakGymGuyWinText
	jumpthistextfaceplayer

	text "Die Trainer hier"
	line "haben geheime"
	cont "Motive."

	para "Gewinnst du, so"
	line "verraten sie dir"

	para "vielleicht ein"
	line "paar Geheimnisse"
	cont "über TEAK CITY."
	done
EcruteakGymStatue:
	gettrainername MORTY, 1, STRING_BUFFER_4
	checkflag ENGINE_FOGBADGE
	iftruefwd .Beaten
	jumpstd gymstatue1
.Beaten:
	readvar VAR_BADGES
	ifgreater 11, .LyraToo
	jumpstd gymstatue2
.LyraToo
	jumpstd gymstatue3

EcruteakGymPlayerSlowStepDownMovement:
	fix_facing
	slow_step_down
	remove_fixed_facing
	step_end

MortyIntroText:
	text "Gut, dass du"
	line "gekommen bist."
	para "Hier in TEAK CITY"
	line "werden #mon"
	cont "verehrt."
	para "Man sagt,"
	line "legendäre #mon"
	cont "erscheinen nur"
	cont "wirklich starken"
	cont "Trainern."
	para "Ich glaube an"
	line "diese Legende."
	cont "Deshalb trainiere"
	cont "ich seit jeher im"
	cont "Geheimen."
	para "Als Resultat sehe"
	line "ich Dinge, die"
	cont "andere nicht sehen"
	cont "können."
	para "Noch ein wenig…"
	para "Mit etwas mehr"
	line "Kraft sehe ich"
	cont "vielleicht eine"
	cont "Zukunft, in der"
	cont "ich dem"
	cont "regenbogenfarbenen"
	cont "#mon begegne."
	para "Du könntest mir"
	line "dabei helfen!"
	done
MortyWinLossText:
	text "Ich bin noch nicht"
	line "gut genug…"
	para "Dieser ORDEN soll"
	line "dir gehören."
	done
MortyText_FogBadgeSpeech:
	text "Durch den"
	line "NEBELORDEN"
	cont "gehorchen dir"
	cont "#mon bis LV 50."
	para "Außerdem können"
	line "#mon, die"
	cont "SURFER"
	cont "beherrschen, ihn"
	cont "auch außerhalb des"
	cont "Kampfs einsetzen."
	para "Bitte nimm auch"
	line "dies an."
	done
MortyFightDoneText:
	text "Ich verstehe…"
	para "Deine Reise hat"
	line "dich an die"
	cont "entlegensten Orte"
	cont "geführt."
	para "Du hast viel mehr"
	line "gesehen als ich."
	para "Dafür beneide ich"
	line "dich…"
	done
SageJeffreySeenText:
	text "Ich habe den"
	line "Frühling mit"
	cont "meinen"
	para "#mon verbracht."
	line "Dann den Sommer,"
	para "den Herbst und den"
	line "Winter …"
	para "Dann kam wieder"
	line "der Frühling. Wir"
	para "haben viel Zeit"
	line "miteinander"
	cont "verbracht."
	done



SageJeffreyBeatenText:
	text "Siege und"
	line "Niederlagen - ich"
	cont "hatte beides."
	done



SagePingSeenText:
	text "Hältst du unseren"
	line "#mon stand?"
	done



SagePingBeatenText:
	text "Ah! Gut gemacht!"
	done



MediumMarthaSeenText:
	text "Ich werde siegen!"
	done



MediumMarthaBeatenText:
	text "I-I-Ich habe"
	line "verloren!"
	done



MediumGraceSeenText:
	text "Verwirrt dich"
	line "unser unsichtbarer"
	para "Boden? Besiege"
	line "mich und ich gebe"
	cont "dir einen Tipp!"
	done



MediumGraceBeatenText:
	text "W-Was?"
	done



EcruteakGymGuyWinText:
	text "Wow, <PLAYER>. Du"
	line "warst großartig!"
	para "Vor lauter Angst"
	line "habe ich mich in"
	cont "die Ecke gekauert!"
	done
EcruteakGymClosedText:
	text "JENS, der"
	line "ARENA-LEITER ist"
	cont "nicht hier."
	para "Du musst leider"
	line "wieder gehen."
	para "Hohohoho."
	done



