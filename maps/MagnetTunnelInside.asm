MagnetTunnelInside_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, MagnetTunnelInsideTileCallback

	def_warp_events
	warp_event  5, 19, MAGNET_TUNNEL_WEST, 1
	warp_event 43,  3, MAGNET_TUNNEL_EAST, 1
	warp_event 27,  3, MAGNET_TUNNEL_INSIDE, 4
	warp_event 27, 31, MAGNET_TUNNEL_INSIDE, 3
	warp_event 34,  5, MAGNET_TUNNEL_INSIDE, 6
	warp_event 34, 33, MAGNET_TUNNEL_INSIDE, 5

	def_coord_events

	def_bg_events
	bg_event  6, 10, BGEVENT_UP, MagnetTunnelInsideMachine1
	bg_event  7, 10, BGEVENT_UP, MagnetTunnelInsideMachine1
	bg_event 22, 21, BGEVENT_UP, MagnetTunnelInsideMachine2
	bg_event 23, 21, BGEVENT_UP, MagnetTunnelInsideMachine2
	bg_event 20,  8, BGEVENT_UP, MagnetTunnelInsideMachine3
	bg_event 21,  8, BGEVENT_UP, MagnetTunnelInsideMachine3
	bg_event 34,  8, BGEVENT_UP, MagnetTunnelInsideMachine4
	bg_event 35,  8, BGEVENT_UP, MagnetTunnelInsideMachine4
	bg_event 38, 30, BGEVENT_ITEM + METAL_POWDER, EVENT_MAGNET_TUNNEL_HIDDEN_METAL_POWDER

	def_object_events
	object_event  3, 10, SPRITE_N64, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_COPY_BG_GRAY, OBJECTTYPE_COMMAND, jumptext, MagnetTunnelInsideLodestoneText, EVENT_MAGNET_TUNNEL_LODESTONE_1
	object_event 20, 23, SPRITE_N64, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_COPY_BG_GRAY, OBJECTTYPE_COMMAND, jumptext, MagnetTunnelInsideLodestoneText, EVENT_MAGNET_TUNNEL_LODESTONE_2
	object_event 20,  5, SPRITE_N64, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_COPY_BG_GRAY, OBJECTTYPE_COMMAND, jumptext, MagnetTunnelInsideLodestoneText, EVENT_MAGNET_TUNNEL_LODESTONE_3
	object_event 35,  5, SPRITE_N64, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_COPY_BG_GRAY, OBJECTTYPE_COMMAND, jumptext, MagnetTunnelInsideLodestoneText, EVENT_MAGNET_TUNNEL_LODESTONE_4
	object_event 11, 20, SPRITE_ENGINEER, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, MagnetTunnelInsideEngineerText1, -1
	object_event  8, 13, SPRITE_ENGINEER, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, MagnetTunnelInsideEngineerText2, -1
	object_event 32, 21, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, MagnetTunnelInsideScientistText, -1
	object_event 22,  8, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerEngineerGraden, -1
	object_event 31, 12, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerEngineerGustav, -1
	object_event 24, 23, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerEngineerNicolas, -1
	tmhmball_event 19, 21, TM_GYRO_BALL, EVENT_MAGNET_TUNNEL_TM_GYRO_BALL

	object_const_def
	const MAGNETTUNNELINSIDE_STONE_1
	const MAGNETTUNNELINSIDE_STONE_2
	const MAGNETTUNNELINSIDE_STONE_3
	const MAGNETTUNNELINSIDE_STONE_4

MagnetTunnelInsideTileCallback:
	checkevent EVENT_MAGNET_TUNNEL_LODESTONE_1
	iffalsefwd .NoMachine1
	changeblock 6, 10, $6b
	changeblock 6, 8, $6d
.NoMachine1
	checkevent EVENT_MAGNET_TUNNEL_LODESTONE_2
	iffalsefwd .NoMachine2
	changeblock 22, 20, $66
.NoMachine2
	checkevent EVENT_MAGNET_TUNNEL_LODESTONE_3
	iffalsefwd .NoMachine3
	changeblock 20, 8, $6b
	changeblock 20, 6, $6f
.NoMachine3
	checkevent EVENT_MAGNET_TUNNEL_LODESTONE_IN_PIT
	iffalsefwd .NoPit
	changeblock 34, 8, $70
	changeblock 34, 4, $68
	endcallback
.NoPit
	checkevent EVENT_MAGNET_TUNNEL_LODESTONE_4
	iffalsefwd .NoMachine4
	changeblock 34, 8, $36
	changeblock 34, 6, $35
.NoMachine4
	endcallback

MagnetTunnelInsideMachine1:
	checkevent EVENT_MAGNET_TUNNEL_LODESTONE_1
	iftrue_jumptextfaceplayer MagnetTunnelInsideMachineText3
	opentext
	writetext MagnetTunnelInsideMachineText1
	yesorno
	iffalse_endtext
	playsound SFX_GLASS_TING
	changeblock 6, 10, $6b
	refreshmap
	writetext MagnetTunnelInsideMachineText2
	waitbutton
	closetext
	playsound SFX_THUNDERSHOCK
	earthquake 15
	applymovement MAGNETTUNNELINSIDE_STONE_1, .StoneMovement
	playsound SFX_THUNDERSHOCK
	earthquake 15
	playsound SFX_STRENGTH
	changeblock 6, 8, $6d
	refreshmap
	disappear MAGNETTUNNELINSIDE_STONE_1
	end

.StoneMovement:
	fix_facing
	slow_slide_step_up
	slow_slide_step_right
	slow_slide_step_right
	slow_slide_step_right
	remove_fixed_facing
	step_end

MagnetTunnelInsideMachine2:
	checkevent EVENT_MAGNET_TUNNEL_LODESTONE_2
	iftrue_jumptextfaceplayer MagnetTunnelInsideMachineText3
	opentext
	writetext MagnetTunnelInsideMachineText1
	yesorno
	iffalse_endtext
	playsound SFX_GLASS_TING
	changeblock 22, 20, $67
	refreshmap
	writetext MagnetTunnelInsideMachineText2
	waitbutton
	closetext
	playsound SFX_THUNDERSHOCK
	earthquake 15
	applymovement MAGNETTUNNELINSIDE_STONE_2, .StoneMovement
	playsound SFX_THUNDERSHOCK
	earthquake 15
	playsound SFX_STRENGTH
	changeblock 22, 20, $66
	refreshmap
	disappear MAGNETTUNNELINSIDE_STONE_2
	end

.StoneMovement:
	fix_facing
	slow_slide_step_up
	slow_slide_step_up
	slow_slide_step_up
	slow_slide_step_right
	slow_slide_step_right
	remove_fixed_facing
	step_end

MagnetTunnelInsideMachine3:
	checkevent EVENT_MAGNET_TUNNEL_LODESTONE_3
	iftrue_jumptextfaceplayer MagnetTunnelInsideMachineText3
	opentext
	writetext MagnetTunnelInsideMachineText1
	yesorno
	iffalse_endtext
	playsound SFX_GLASS_TING
	changeblock 20, 8, $6b
	refreshmap
	writetext MagnetTunnelInsideMachineText2
	waitbutton
	closetext
	playsound SFX_THUNDERSHOCK
	earthquake 15
	applymovement MAGNETTUNNELINSIDE_STONE_3, .StoneMovement
	playsound SFX_THUNDERSHOCK
	earthquake 15
	playsound SFX_STRENGTH
	changeblock 20, 6, $6f
	refreshmap
	disappear MAGNETTUNNELINSIDE_STONE_3
	end

.StoneMovement:
	fix_facing
	slow_slide_step_down
	slow_slide_step_down
	remove_fixed_facing
	step_end

MagnetTunnelInsideMachine4:
	checkevent EVENT_MAGNET_TUNNEL_LODESTONE_4
	iftruefwd .MachineOn
	opentext
	writetext MagnetTunnelInsideMachineText1
	yesorno
	iffalse_endtext
	playsound SFX_GLASS_TING
	changeblock 34, 8, $36
	refreshmap
	writetext MagnetTunnelInsideMachineText2
	waitbutton
	closetext
	playsound SFX_THUNDERSHOCK
	earthquake 15
	applymovement MAGNETTUNNELINSIDE_STONE_4, .StoneMovement1
	playsound SFX_THUNDERSHOCK
	earthquake 15
	playsound SFX_STRENGTH
	changeblock 34, 6, $35
	refreshmap
	disappear MAGNETTUNNELINSIDE_STONE_4
	scall MagnetTunnelAlarmSounds
	showemote EMOTE_QUESTION, PLAYER, 15
	showtext MagnetTunnelInsideMachineText4
	end

.StoneMovement1:
	fix_facing
	slow_slide_step_down
	slow_slide_step_down
	slow_slide_step_left
	remove_fixed_facing
	step_end

.MachineOn:
	checkevent EVENT_MAGNET_TUNNEL_LODESTONE_IN_PIT
	iftrue_jumptext MagnetTunnelInsideMachineText7
	scall MagnetTunnelAlarmSounds
	opentext
	writetext MagnetTunnelInsideMachineText5
	yesorno
	iffalse_endtext
	playsound SFX_GLASS_TING
	writetext MagnetTunnelInsideMachineText6
	waitbutton
	closetext
	changeblock 34, 8, $70
	changeblock 34, 6, $34
	refreshmap
	moveobject MAGNETTUNNELINSIDE_STONE_4, 34, 7
	appear MAGNETTUNNELINSIDE_STONE_4
	playsound SFX_EMBER
	earthquake 15
	applymovement MAGNETTUNNELINSIDE_STONE_4, .StoneMovement2
	playsound SFX_STRENGTH
	earthquake 15
	changeblock 34, 4, $68
	refreshmap
	disappear MAGNETTUNNELINSIDE_STONE_4
	setevent EVENT_MAGNET_TUNNEL_LODESTONE_IN_PIT
	end

.StoneMovement2:
	fix_facing
	slide_step_up
	slide_step_up
	remove_fixed_facing
	step_end

MagnetTunnelAlarmSounds:
	waitsfx
	special SaveMusic
	playmusic MUSIC_NONE
	pause 10
	playsound SFX_LICK
	pause 10
	playsound SFX_LICK
	pause 10
	playsound SFX_LICK
	pause 10
	playsound SFX_LICK
	pause 10
	playsound SFX_LICK
	waitsfx
	special RestoreMusic
	end

MagnetTunnelInsideMachineText1:
	text "Die Maschine ist"
	line "ausgeschaltet."

	para "Einschalten?"
	done

MagnetTunnelInsideMachineText2:
	text "Ping! Die Maschine"
	line "ist an."
	done

MagnetTunnelInsideMachineText3:
	text "Die Maschine läuft"
	line "reibungslos."
	done

MagnetTunnelInsideMachineText4:
	text "Huh?! Etwas stimmt"
	line "nicht!"
	done

MagnetTunnelInsideMachineText5:
	text "Diese Maschine"
	line "läuft nicht"
	cont "richtig!"
	para "Mehrere"
	line "WARNUNGmeldungen"
	cont "flackern"
	para "über den kleinen"
	line "Bildschirm und"
	para "ein Brandgeruch"
	line "liegt in der Luft."
	para "Den Not-Aus-Knopf"
	line "drücken?"
	done

MagnetTunnelInsideMachineText6:
	text "Ding! Die Maschine"
	line "ist aus."
	done

MagnetTunnelInsideMachineText7:
	text "Um die Maschine"
	line "hängt der leichte"

	para "Geruch von"
	line "geschmolzenem"

	para "Plastik… Sie"
	line "scheint kaputt."
	done

MagnetTunnelInsideLodestoneText:
	text "Der Magnetstein"
	line "ist glatt und"
	cont "warm."

	para "Er hat eine"
	line "leichte statische"
	cont "Aura."
	done

MagnetTunnelInsideEngineerText1:
	text "Der Magnetstein"
	line "hier erzeugt ein"
	cont "starkes"
	cont "Magnetfeld."
	para "Wir mussten"
	line "Spezialausrüstung"
	cont "holen,"
	para "um den Tunnel bis"
	line "zur Frist des"
	cont "Vorarbeiters"
	cont "fertig zu stellen."
	para "Unser Team stand"
	line "unter großem"
	cont "Druck, pünktlich"
	cont "zu liefern."
	done

MagnetTunnelInsideEngineerText2:
	text "Seit wir mit dem"
	line "Tunnelbau begonnen"
	para "haben, hat sich"
	line "die Zahl wilder"
	cont "Elektro-"
	para "#mon hier mehr"
	line "als verdoppelt."
	done

MagnetTunnelInsideScientistText:
	text "Jeden Tag kommen"
	line "mehr Magnetilo und"
	cont "machen Ärger."
	para "Der Vorarbeiter"
	line "meint, sie werden"
	para "vom Magnetstein"
	line "angezogen."
	para "Aber warum?"
	done

GenericTrainerEngineerGraden:
	generictrainer ENGINEER, GRADEN, EVENT_BEAT_ENGINEER_GRADEN, .SeenText, .BeatenText

	text "Ich bin der"
	line "Vorarbeiter hier."

	para "Wir haben diesen"
	line "Tunnel gegraben,"

	para "um eine Strecke"
	line "für den neuen"
	cont "Magnetzug zu"
	cont "schaffen, aber…"

	para "Ich hätte nicht"
	line "gedacht, dass der"
	cont "Magnetstein so"
	cont "viel Ärger macht!"
	done

.SeenText:
	text "Bewunderst du"
	line "unser Werk?"

	para "Haha! Bewundere"
	line "das!"
	done

.BeatenText:
	text "Haha! Du hast Mut."
	line "Das gefällt mir!"
	done

GenericTrainerEngineerGustav:
	generictrainer ENGINEER, GUSTAV, EVENT_BEAT_ENGINEER_GUSTAV, .SeenText, .BeatenText

	text "Ich hab versucht,"
	line "sie zu reparieren,"
	cont "aber es nützt"
	para "nichts … Ich finde"
	line "einfach nicht"
	cont "heraus, was los"
	cont "ist!"
	para "Wenn ich sie"
	line "wieder anschalte,"
	cont "könnte"
	para "die Maschine"
	line "durchbrennen und"
	cont "kaputt sein …"
	done

.SeenText:
	text "Zurückbleiben!"

	para "Diese Maschine"
	line "spinnt!"
	done

.BeatenText:
	text "Durchgebrannt! Wie"
	line "eine Sicherung …"
	done

GenericTrainerEngineerNicolas:
	generictrainer ENGINEER, NICOLAS, EVENT_BEAT_ENGINEER_NICOLAS, .SeenText, .BeatenText

	text "Die Dinger"
	line "erzeugen"
	cont "ernsthafte"
	cont "Spannung!"
	para "Wenn sie an sind,"
	line "entsteht ein"
	para "extrem starkes"
	line "Magnetfeld."
	para "Also Vorsicht hier"
	line "drin, klar?"
	done

.SeenText:
	text "Hey! Vorsicht bei"
	line "der Ausrüstung!"
	done

.BeatenText:
	text "Abschaltung!"
	done
