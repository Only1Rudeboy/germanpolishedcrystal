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
	sdefer EcruteakGymClosed
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

	; GSC-DE Dump (PC: Schattenball statt SPUKBALL)
	text "Das ist Schatten-"
	line "ball."
	para "Er verursacht"
	line "Schaden und ver-"
	cont "ringert die SPE-"
	cont "ZIAL-VERT."
	para "Setze ihn ein,"
	line "wenn er dir ge-"
	cont "fällt."
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

	; GSC-DE Dump
	text "Woher kommen"
	line "#MON?"
	done

GenericTrainerSagePing:
	generictrainer SAGE, PING, EVENT_BEAT_SAGE_PING, SagePingSeenText, SagePingBeatenText

	; GSC-DE Dump
	text "Wir setzen nur"
	line "Geist-#MON ein."
	para "Normal-Attacken"
	line "zeigen bei ihnen"
	cont "keine Wirkung!"
	done

GenericTrainerMediumMartha:
	generictrainer MEDIUM, MARTHA, EVENT_BEAT_MEDIUM_MARTHA, MediumMarthaSeenText, MediumMarthaBeatenText

	; GSC-DE Dump
	text "Wer siegen will,"
	line "wird es auch tun!"
	done

GenericTrainerMediumGrace:
	generictrainer MEDIUM, GRACE, EVENT_BEAT_MEDIUM_GRACE, MediumGraceSeenText, MediumGraceBeatenText

	; GSC-DE Dump
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

	; GSC-DE Dump
	text "Die Trainer hier"
	line "haben geheime Mo-"
	cont "tive."
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
	; GSC-DE Dump
	text "Gut, dass du ge-"
	line "kommen bist."
	para "Hier in TEAK CITY"
	line "werden #MON"
	cont "verehrt."
	para "Man sagt, dass le-"
	line "gendäre #MON"
	para "nur wahrlich star-"
	line "ken Trainern er-"
	cont "scheinen werden."
	para "Ich glaube an die-"
	line "se Legende. Daher"
	para "habe ich mein gan-"
	line "zes Leben lang im"
	para "Geheimen trai-"
	line "niert."
	para "Als Resultat kann"
	line "ich nun Dinge"
	para "sehen, die andere"
	line "nicht sehen kön-"
	cont "nen."
	para "Noch ein wenig…"
	para "Mit ein wenig Mehr"
	line "könnte ich eine"
	para "Zukunft sehen, in"
	line "der ich das legen-"
	cont "däre regenbogen-"
	cont "farbene #MON"
	cont "treffe."
	para "Du könntest mir"
	line "dabei helfen!"
	done

MortyWinLossText:
	; GSC-DE Dump
	text "Ich bin noch nicht"
	line "gut genug…"
	para "Dieser ORDEN soll"
	line "dir gehören."
	done

MortyText_FogBadgeSpeech:
	; GSC-DE Dump: PHANTOMORDEN (engine FOGBADGE)
	text "Durch den PHANTOM-"
	line "ORDEN gehorchen"
	para "dir #MON bis zu"
	line "LV 50."
	para "Außerdem können"
	line "#MON, die SUR-"
	cont "FER beherrschen,"
	para "diesen auch außer-"
	line "halb eines Kampfes"
	cont "einsetzen."
	para "Bitte nimm auch"
	line "dies an."
	done

MortyFightDoneText:
	; GSC-DE Dump
	text "Ich verstehe…"
	para "Deine Reise hat"
	line "dich an die ent-"
	cont "legensten Orte ge-"
	cont "führt."
	para "Du hast viel mehr"
	line "gesehen als ich."
	para "Dafür beneide ich"
	line "dich…"
	done

SageJeffreySeenText:
	; GSC-DE Dump
	text "Ich habe den Früh-"
	line "ling mit meinen"
	para "#MON verbracht."
	line "Dann den Sommer,"
	para "den Herbst und den"
	line "Winter…"
	para "Dann kam wieder"
	line "der Frühling. Wir"
	para "haben viel Zeit"
	line "miteinander ver-"
	cont "bracht."
	done

SageJeffreyBeatenText:
	; GSC-DE Dump
	text "Siege und Nieder-"
	line "lagen - ich hatte"
	cont "beides."
	done

SagePingSeenText:
	; GSC-DE Dump
	text "Hältst du unseren"
	line "#MON stand?"
	done

SagePingBeatenText:
	; GSC-DE Dump
	text "Ah! Gut gemacht!"
	done

MediumMarthaSeenText:
	; GSC-DE Dump
	text "Ich werde siegen!"
	done

MediumMarthaBeatenText:
	; GSC-DE Dump
	text "I-I-Ich habe"
	line "verloren!"
	done

MediumGraceSeenText:
	; GSC-DE Dump
	text "Verwirrt dich un-"
	line "ser unsichtbarer"
	para "Boden? Besiege"
	line "mich und ich gebe"
	cont "dir einen Tipp!"
	done

MediumGraceBeatenText:
	; GSC-DE Dump
	text "W-Was?"
	done

EcruteakGymGuyWinText:
	; GSC-DE Dump
	text "Wow, <PLAYER>."
	line "Du warst großar-"
	cont "tig!"
	para "Vor lauter Angst"
	line "habe ich mich in"
	cont "die Ecke gekauert!"
	done

EcruteakGymClosedText:
	; GSC-DE Dump
	text "JENS, der ARENA-"
	line "LEITER ist nicht"
	cont "hier."
	para "Du musst leider"
	line "wieder gehen."
	para "Hohohoho."
	done



