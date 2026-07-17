OlivineLighthouse3F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 13,  3, OLIVINE_LIGHTHOUSE_4F, 1
	warp_event  5,  3, OLIVINE_LIGHTHOUSE_2F, 2
	warp_event  9,  5, OLIVINE_LIGHTHOUSE_4F, 4
	warp_event 16, 11, OLIVINE_LIGHTHOUSE_2F, 5
	warp_event 17, 11, OLIVINE_LIGHTHOUSE_2F, 6
	warp_event 16,  9, OLIVINE_LIGHTHOUSE_4F, 5
	warp_event 17,  9, OLIVINE_LIGHTHOUSE_4F, 6
	warp_event  8,  3, OLIVINE_LIGHTHOUSE_4F, 7
	warp_event  9,  3, OLIVINE_LIGHTHOUSE_4F, 8

	def_coord_events

	def_bg_events

	def_object_events
	object_event  9, 14, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineLighthouse3FBattleGirlEmy, -1
	object_event  9,  2, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSailorTerrell, -1
	object_event 13,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerGentlemanPreston, EVENT_OLIVINE_LIGHTHOUSE_JASMINE
	object_event  3,  9, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerBird_keeperTheo, -1
	itemball_event  8,  2, ETHER, 1, EVENT_OLIVINE_LIGHTHOUSE_3F_ETHER

	object_const_def
	const OLIVINELIGHTHOUSE3F_COOLTRAINER_F

OlivineLighthouse3FBattleGirlEmy:
	checkevent EVENT_GOT_PROTECT_PADS_FROM_LIGHTHOUSE_LEADER
	iftrue_jumptextfaceplayer .AfterText2
	faceplayer
	checkevent EVENT_BEAT_BATTLE_GIRL_EMY
	iftruefwd .Beaten
	opentext
	checkevent EVENT_BEAT_GENTLEMAN_ALFRED
	iffalse_jumpopenedtext .IntroText
	checkevent EVENT_BEAT_SAILOR_HUEY
	iffalse_jumpopenedtext .IntroText
	checkevent EVENT_BEAT_BIRD_KEEPER_THEO
	iffalse_jumpopenedtext .IntroText
	checkevent EVENT_BEAT_GENTLEMAN_PRESTON
	iffalse_jumpopenedtext .IntroText
	checkevent EVENT_BEAT_SAILOR_TERRELL
	iffalse_jumpopenedtext .IntroText
	checkevent EVENT_BEAT_LASS_CONNIE
	iffalse_jumpopenedtext .IntroText
	checkevent EVENT_BEAT_SAILOR_KENT
	iffalse_jumpopenedtext .IntroText
	checkevent EVENT_BEAT_BIRD_KEEPER_DENIS
	iffalse_jumpopenedtext .IntroText
	checkevent EVENT_BEAT_SAILOR_ERNEST
	iffalse_jumpopenedtext .IntroText
	writetext .QuestionText
	yesorno
	iffalse_jumpopenedtext .RefusedText
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked OLIVINELIGHTHOUSE3F_COOLTRAINER_F
	loadtrainer BATTLE_GIRL, EMY
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BATTLE_GIRL_EMY
.Beaten:
	opentext
	writetext .AfterText1
	promptbutton
	verbosegiveitem PROTECT_PADS
	iffalse_endtext
	setevent EVENT_GOT_PROTECT_PADS_FROM_LIGHTHOUSE_LEADER
	jumpthisopenedtext

.AfterText2:
	text "BRUNO von der TOP"
	line "VIER ist ein"
	cont "Kämpfer wie ich."
	para "So stark wie er"
	line "werden…mein Ziel!"
	done

.IntroText:
	text "Als Kämpferin"
	line "trainiere ich"
	cont "täglich hart."

	para "An dir ist etwas"
	line "Besonderes…"

	para "Kannst du alle"
	line "Trainer in diesem"
	cont "Leuchtturm"
	cont "besiegen?"

	para "Wenn ja, kämpfe"
	line "ich gegen dich!"
	done

.QuestionText:
	text "Du hast also den"
	line "ganzen Turm"
	cont "gemeistert?"
	para "Dann bleibt nur"
	line "noch HARTWIGs"
	cont "Schülerin: ich!"
	para "Bereit zum Kampf?"
	done

.RefusedText:
	text "Dann trainiere ich"
	line "allein weiter …"
	done

.SeenText:
	text "Hinter meinen"
	line "Schutzpolstern"
	cont "greife ich an!"
	cont "Ki-yaah!"
	done

.BeatenText:
	text "Du hast meine"
	line "Verteidigung"
	cont "durchbrochen!"
	done

.AfterText1:
	text "Dein Team ist"
	line "beeindruckend!"
	para "Aber du kannst"
	line "noch stärker"
	cont "werden."
	para "Mit diesen"
	line "Schutzpolstern"
	cont "kannst du"
	para "deinen Gegner"
	line "berühren, ohne"
	cont "Schaden zu nehmen."
	done

TrainerBird_keeperTheo:
	trainer BIRD_KEEPER, THEO, EVENT_BEAT_BIRD_KEEPER_THEO, Bird_keeperTheoSeenText, Bird_keeperTheoBeatenText, 0, Bird_keeperTheoScript

Bird_keeperTheoScript:
	endifjustbattled
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iftrue_jumptextfaceplayer Bird_keeperTheoFinalText
	jumpthistextfaceplayer

	; GSC-DE Dump
	text "Wie, zum Geier,"
	line "bist du hier"
	cont "hochgekommen?"
	para "Ich möchte das"
	line "kranke #MON"
	para "besuchen, aber ich"
	line "schaffe es nicht"
	cont "bis nach oben…"
	done

GenericTrainerGentlemanPreston:
	generictrainer GENTLEMAN, PRESTON, EVENT_BEAT_GENTLEMAN_PRESTON, GentlemanPrestonSeenText, GentlemanPrestonBeatenText

	; GSC-DE Dump
	text "JASMIN trainierte"
	line "früher Gestein-"
	cont "#MON wie ONIX."
	done

GenericTrainerSailorTerrell:
	generictrainer SAILOR, TERRELL, EVENT_BEAT_SAILOR_TERRELL, SailorTerrellSeenText, SailorTerrellBeatenText

	; GSC-DE Dump
	text "Jedes Mal wenn"
	line "ich nach OLIVIANA"
	para "CITY komme, gehe"
	line "ich in die PKMN-"
	para "ARENA. Der #-"
	line "MON-Typ der ARENA-"
	para "LEITERIN hat sich"
	line "geändert, ohne"
	para "dass ich es"
	line "bemerkte."
	done

Bird_keeperTheoSeenText:
	; GSC-DE Dump
	text "Warum bist du"
	line "gekommen? Bist du"
	para "zum Gaffen hier?"
	line "Es ist besser, du"
	cont "gehst!"
	done

Bird_keeperTheoBeatenText:
	; GSC-DE Dump
	text "Du sorgst dich"
	line "wirklich…"
	done

Bird_keeperTheoFinalText:
	; PC + Dump-Ton
	text "Wie zum Geier"
	line "kommt man nach"
	cont "oben?"
	para "Ich hörte, dem"
	line "kranken #MON"
	cont "geht"
	para "es wieder besser,"
	line "aber ich schaffe"
	cont "es nicht nach"
	cont "oben…"
	done

SailorTerrellSeenText:
	; GSC-DE Dump
	text "Matrosen sind"
	line "nett und stark."
	cont "Wie bist du?"
	done






SailorTerrellBeatenText:
	; GSC-DE Dump
	text "Du bist auch nett"
	line "und stark…"
	done






GentlemanPrestonSeenText:
	; GSC-DE Dump
	text "Ich bereise die"
	line "Welt, um meine"
	cont "#MON zu"
	cont "trainieren. Ich"
	cont "möchte mit dir"
	cont "kämpfen."
	done






GentlemanPrestonBeatenText:
	; GSC-DE Dump
	text "…Seufz… Ich muss"
	line "mehr trainieren…"
	done






