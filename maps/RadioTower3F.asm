RadioTower3F_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, CardKeyShutterCallback

	def_warp_events
	warp_event  0,  0, RADIO_TOWER_2F, 1
	warp_event  7,  0, RADIO_TOWER_4F, 2
	warp_event 17,  0, RADIO_TOWER_4F, 4

	def_coord_events

	def_bg_events
	bg_event  3,  0, BGEVENT_JUMPTEXT, RadioTower3FPersonnelSignText
	bg_event  9,  0, BGEVENT_JUMPTEXT, RadioTower3FPokemonMusicSignText
	bg_event 14,  2, BGEVENT_UP, CardKeySlotScript

	def_object_events
	object_event  7,  4, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, RadioTower3FSuperNerdText, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event  3,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower3FGymGuideScript, -1
	object_event 11,  3, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower3FCooltrainerFScript, -1
	object_event  5,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerGruntM7, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  6,  2, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerGruntM8, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 16,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerGruntM9, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  9,  6, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerRocketScientistMarc, EVENT_RADIO_TOWER_ROCKET_TAKEOVER

CardKeyShutterCallback:
	checkevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	iftruefwd .Change
	endcallback

.Change:
	changeblock 14, 2, $2a
	changeblock 14, 4, $1
	endcallback

RadioTower3FGymGuideScript:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue_jumptextfaceplayer RadioTower3FGymGuideText
	jumpthistextfaceplayer

	; GSC-DE Dump
	text "Für Trainer sind"
	line "#MON wie"
	cont "Lebenspartner."
	para "Es ist schreck-"
	line "lich, wie TEAM"
	para "ROCKET versucht,"
	line "alle #MON zu"
	cont "kontrollieren."
	done

RadioTower3FCooltrainerFScript:
	checkevent EVENT_GOT_GBC_SOUNDS_FROM_RADIO_TOWER
	iftrue_jumptextfaceplayer RadioTower3FCooltrainerFYouWereMarvelousText
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftruefwd .NoRockets
	checkevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	iftrue_jumptextfaceplayer RadioTower3FCooltrainerFIsDirectorSafeText
	jumpthistextfaceplayer

	; GSC-DE Dump
	text "Der Anführer von"
	line "TEAM ROCKET hat"
	cont "sich selbst"
	cont "eingeschlossen."
	para "Aber der INTENDANT"
	line "besitzt einen"
	cont "Schlüssel."
	para "Du findest ihn"
	line "im vierten Stock."
	para "Bitte rette ihn!"
	done

.NoRockets:
	faceplayer
	opentext
	writetext RadioTower3FCooltrainerFYoureMyHeroText
	promptbutton
	verbosegivekeyitem GBC_SOUNDS
	iffalse_endtext
	writetext RadioTower3FCooltrainerFItsAGBCSoundsText
	waitbutton
	closetext
	setevent EVENT_GOT_GBC_SOUNDS_FROM_RADIO_TOWER
	end

GenericTrainerGruntM7:
	generictrainer GRUNTM, 7, EVENT_BEAT_ROCKET_GRUNTM_7, GruntM7SeenText, GruntM7BeatenText

	; GSC-DE Dump
	text "Ich bin meinen"
	line "Pflichten nicht"
	cont "nachgekommen…"
	para "Ich werde dafür"
	line "bezahlen müssen…"
	done

GenericTrainerGruntM8:
	generictrainer GRUNTM, 8, EVENT_BEAT_ROCKET_GRUNTM_8, GruntM8SeenText, GruntM8BeatenText

	; GSC-DE Dump
	text "Verlieren macht"
	line "mich mürrisch!"
	para "Mist! Ich hasse"
	line "unfähige #MON!"
	done

GenericTrainerGruntM9:
	generictrainer GRUNTM, 9, EVENT_BEAT_ROCKET_GRUNTM_9, GruntM9SeenText, GruntM9BeatenText

	; GSC-DE Dump
	text "Was?! Du bist an"
	line "unseren Männern im"
	cont "UNTERGRUND"
	cont "vorbeigekommen?"
	para "Wie hast du das"
	line "fertiggebracht?"
	done

GenericTrainerRocketScientistMarc:
	generictrainer ROCKET_SCIENTIST, MARC, EVENT_BEAT_ROCKET_SCIENTIST_MARC, RocketScientistMarcSeenText, RocketScientistMarcBeatenText

	; GSC-DE Dump
	text "Huahahaha…"
	para "Ich kann Signale"
	line "jeder Stärke von"
	cont "hier aussenden."
	done

CardKeySlotScript::
	opentext
	writetext RadioTower3FCardKeySlotText
	waitbutton
	checkevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	iftruefwd .UsedCardKey
	checkkeyitem CARD_KEY
	iftruefwd .HaveCardKey
.UsedCardKey:
	endtext

.HaveCardKey:
	writetext InsertedTheCardKeyText
	waitbutton
	setevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	playsound SFX_ENTER_DOOR
	changeblock 14, 2, $2a
	changeblock 14, 4, $1
	refreshmap
	closetext
	waitsfx
	end

RadioTower3FSuperNerdText:
	; GSC-DE Dump
	text "Wir haben die Rufe"
	line "von allen bekann-"
	cont "ten #MON auf"
	para "Tonband."
	line "Es sind zirka 200."
	done

RadioTower3FGymGuideText:
	; GSC-DE Dump
	text "Bei uns gibt"
	line "es rund um die Uhr"
	para "Unterhaltungs-"
	line "sendungen."
	para "Ich versuche"
	line "auch, rund um die"
	cont "Uhr zu arbeiten!"
	done

RadioTower3FCooltrainerFIsDirectorSafeText:
	; GSC-DE Dump
	text "Hast du den"
	line "INTENDANTEN"
	cont "retten können?"
	done

RadioTower3FCooltrainerFYoureMyHeroText:
	; GSC-DE Dump
	text "Danke!"
	line "Du bist mein Held!"
	para "Dies ist ein"
	line "Zeichen meiner"
	cont "Wertschätzung."
	done

RadioTower3FCooltrainerFItsAGBCSoundsText:
	; PC-only (GBC Sounds)
	text "Das sind GBC"
	line "Sounds."
	para "Voller Songs, die"
	line "du überall"
	para "hören kannst,"
	line "sogar im Kampf."
	para "Spezialfunktionen"
	line "für Tonhöhe und"
	para "Tempo - die"
	line "Steuerung ist"
	para "etwas knifflig."
	para "Probiere einfach"
	line "herum!"
	done

RadioTower3FCooltrainerFYouWereMarvelousText:
	; GSC-DE Dump
	text "Du warst einfach"
	line "traumhaft!"
	done

GruntM7SeenText:
	; GSC-DE Dump
	text "Mir wurden strikte"
	line "Befehle erteilt."
	para "Ich soll jeden,"
	line "der TEAM ROCKET"
	cont "herausfordert,"
	cont "pulverisieren!"
	done

GruntM7BeatenText:
	; GSC-DE Dump
	text "Was?!"
	done

GruntM8SeenText:
	; GSC-DE Dump
	text "Es ist ein tolles"
	line "Gefühl, #MON"
	cont "für Verbrechen"
	cont "einzusetzen."
	done

GruntM8BeatenText:
	; GSC-DE Dump
	text "Machst du Witze?"
	done

GruntM9SeenText:
	; GSC-DE Dump
	text "Warum hat sich der"
	line "Rollladen geöff-"
	cont "net? Hast du etwas"
	cont "damit zu tun?"
	done

GruntM9BeatenText:
	; GSC-DE Dump
	text "Ich bin erledigt!"
	done

RocketScientistMarcSeenText:
	; GSC-DE Dump
	text "Was macht ein"
	line "fremdes Kind hier?"
	para "Wer bist du?"
	done

RocketScientistMarcBeatenText:
	; GSC-DE Dump
	text "Ts! Ich habe"
	line "dich nicht"
	cont "ernst genommen!"
	done

RadioTower3FCardKeySlotText:
	; GSC-DE Dump
	text "Dies ist der"
	line "Schlitz für"
	cont "den TÜRÖFFNER."
	done

InsertedTheCardKeyText:
	; GSC-DE Dump
	text "<PLAYER> benutzt"
	line "den TÜRÖFFNER."
	done

RadioTower3FPersonnelSignText:
	; GSC-DE Dump
	text "2S PERSONAL"
	done

RadioTower3FPokemonMusicSignText:
	; GSC-DE Dump
	text "#MON-MUSIK mit"
	line "DJ BEN"
	done
