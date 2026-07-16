SlowpokeWellB1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 17, 15, SLOWPOKE_WELL_ENTRANCE, 2
	warp_event  7, 11, SLOWPOKE_WELL_B2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_PROTON, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerProton2, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event 15,  7, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerGruntM29, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event  5,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerGruntM2, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event 10,  4, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerGruntF1, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event  0, 17, SPRITE_KURT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, end, NULL, EVENT_SLOWPOKE_WELL_KURT
	object_event  7,  4, SPRITE_SLOWPOKETAIL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FSlowpokeWithMailScript, EVENT_SLOWPOKE_WELL_SLOWPOKES
	object_event  6,  2, SPRITE_SLOWPOKETAIL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FTaillessSlowpokeScript, EVENT_SLOWPOKE_WELL_SLOWPOKES
	strengthboulder_event  3, 2
	itemball_event 10,  3, SUPER_POTION, 1, EVENT_SLOWPOKE_WELL_B1F_SUPER_POTION

	object_const_def
	const SLOWPOKEWELLB1F_PROTON
	const SLOWPOKEWELLB1F_ROCKET1
	const SLOWPOKEWELLB1F_ROCKET2
	const SLOWPOKEWELLB1F_ROCKET_GIRL
	const SLOWPOKEWELLB1F_KURT

GenericTrainerGruntM29:
	generictrainer GRUNTM, 29, EVENT_BEAT_ROCKET_GRUNTM_29, GruntM29SeenText, GruntM29BeatenText

	text "Klar haben wir den"
	line "FLEGMON die"
	para "RUTEN abgetrennt"
	line "und dann verkauft."
	para "Wir wollen nur"
	line "Profit machen."
	para "Genau! Wir sind"
	line "TEAM ROCKET und"
	para "für Geld machen"
	line "wir alles!"
	done

TrainerProton2:
	trainer PROTON, PROTON2, EVENT_BEAT_PROTON_2, Proton2SeenText, Proton2BeatenText, 0, Proton2Script

Proton2Script:
	showtext TrainerProton2WhenTalkText
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear SLOWPOKEWELLB1F_PROTON
	disappear SLOWPOKEWELLB1F_ROCKET1
	disappear SLOWPOKEWELLB1F_ROCKET2
	disappear SLOWPOKEWELLB1F_ROCKET_GIRL
	pause 15
	special Special_FadeInQuickly
	disappear SLOWPOKEWELLB1F_KURT
	moveobject SLOWPOKEWELLB1F_KURT, 11, 6
	appear SLOWPOKEWELLB1F_KURT
	applymovement SLOWPOKEWELLB1F_KURT, KurtSlowpokeWellVictoryMovementData
	turnobject PLAYER, RIGHT
	showtext KurtLeaveSlowpokeWellText
	setevent EVENT_CLEARED_SLOWPOKE_WELL
	setmapscene ILEX_FOREST, SCENE_ILEXFOREST_NOOP
	clearevent EVENT_ILEX_FOREST_APPRENTICE
	clearevent EVENT_ILEX_FOREST_FARFETCHD
	setevent EVENT_CHARCOAL_KILN_FARFETCH_D
	setevent EVENT_CHARCOAL_KILN_APPRENTICE
	setevent EVENT_SLOWPOKE_WELL_SLOWPOKES
	setevent EVENT_SLOWPOKE_WELL_KURT
	clearevent EVENT_AZALEA_TOWN_SLOWPOKES
	clearevent EVENT_KURTS_HOUSE_SLOWPOKE
	clearevent EVENT_KURTS_HOUSE_KURT_1
	special FadeOutPalettes
	special HealParty
	pause 15
	warp KURTS_HOUSE, 3, 3
	end

GenericTrainerGruntM2:
	generictrainer GRUNTM, 2, EVENT_BEAT_ROCKET_GRUNTM_2, GruntM2SeenText, GruntM2BeatenText

	text "Wir brauchen das"
	line "Geld, aber mit"
	cont "FLEGMONRUTEN?"

	para "Manchmal ist es"
	line "hart, ein ROCKET"
	cont "RÜPEL zu sein!"
	done

GenericTrainerGruntF1:
	generictrainer GRUNTF, 1, EVENT_BEAT_ROCKET_GRUNTF_1, GruntF1SeenText, GruntF1BeatenText

	text "FLEGMONRUTEN"
	line "wachsen schnell"
	cont "nach!"
	para "Was ist falsch"
	line "daran, sie zu"
	cont "verkaufen?"
	done

SlowpokeWellB1FSlowpokeWithMailScript:
	faceplayer
	opentext
	cry SLOWPOKE
	writetext SlowpokeWellB1FSlowpokeWithMailText
	yesorno
	iftrue_jumpopenedtext SlowpokeWellB1FSlowpokeMailText
	endtext

SlowpokeWellB1FTaillessSlowpokeScript:
	showcrytext SlowpokeWellB1FTaillessSlowpokeText, SLOWPOKE
	end

KurtSlowpokeWellVictoryMovementData:
	step_left
	step_left
	step_left
	step_left
	step_up
	step_sleep_8
	step_sleep_8
	step_sleep_8
	step_left
	step_up
	step_up
	step_sleep_8
	step_sleep_8
	step_sleep_8
	turn_head_left
	step_end

KurtLeaveSlowpokeWellText:
	text "KURT: Weiter so,"
	line "<PLAYER>!"
	para "TEAM ROCKET ist"
	line "abgehauen."
	para "Meinem Rücken geht"
	line "es schon besser."
	cont "Lass uns gehen."
	done








GruntM29SeenText:
	text "Mist! Ich stand da"
	line "oben Wache, als"
	cont "ein Verrückter"
	cont "vorbeikam und mich"
	cont "anschrie."
	para "Ich bin so"
	line "erschrocken, dass"
	cont "ich hier hinunter"
	cont "gefallen bin."
	para "Ich glaube, ich"
	line "lasse meine Wut"
	cont "an dir aus!"
	done








GruntM29BeatenText:
	text "Arrgh! Heute ist"
	line "NICHT mein Tag!"
	done








Proton2SeenText:
	text "Was willst du?"
	para "Ich bin als der"
	line "grausamste Typ bei"
	cont "TEAM ROCKET"
	cont "bekannt …"
	para "Wenn du unsere"
	line "Arbeit störst,"
	cont "gibt es keine"
	cont "Gnade!"
	done

Proton2BeatenText:
	text "Für heute war es"
	line "O.K., aber beim"
	cont "nächsten Mal wird"
	cont "alles anders!"
	done
TrainerProton2WhenTalkText:
	; GSC-DE Dump
	text "Yeah, TEAM ROCKET"
	line "wurde vor drei"
	cont "Jahren zer-"
	cont "schlagen."
	para "Aber wir haben"
	line "unsere Arbeit im"
	cont "Untergrund"
	cont "fortgesetzt."
	para "Nun kannst du"
	line "zusehen, wie wir"
	cont "für Unruhe sorgen!"
	done
GruntM2SeenText:
	; GSC-DE Dump
	text "Wir sollen auf-"
	line "hören, den"
	cont "FLEGMON ihre"
	cont "RUTEN abzutrennen?"
	para "Wenn wir auf dich"
	line "hören würden, wäre"
	cont "der Ruf von TEAM"
	cont "ROCKET ruiniert!"
	done


GruntM2BeatenText:
	; GSC-DE Dump
	text "Du bist…"
	line "zu stark…"
	done








GruntF1SeenText:
	; GSC-DE Dump
	text "Wir sollen auf-"
	line "hören, den"
	cont "FLEGMON ihre"
	cont "RUTEN abzutrennen?"
	para "Ja, versuche, uns"
	line "alle zu besiegen!"
	done








GruntF1BeatenText:
	text "Du vorlautes Balg!"
	done








SlowpokeWellB1FSlowpokeWithMailText:
	text "Ein FLEGMON mit"
	line "abgetrennter RUTE"
	cont "…"
	para "Huh? Es trägt"
	line "einen BRIEF. BRIEF"
	cont "lesen?"
	done








SlowpokeWellB1FSlowpokeMailText:
	text "<PLAYER> liest den"
	line "BRIEF."
	para "Sei so lieb und"
	line "kümmere dich bitte"
	cont "um Opa und das"
	cont "FLEGMON."
	para "Danke, Papa"
	done








SlowpokeWellB1FTaillessSlowpokeText:
	text "Ein FLEGMON mit"
	line "abgetrennter RUTE"
	cont "…"
	done








