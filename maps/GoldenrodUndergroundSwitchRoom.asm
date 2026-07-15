GoldenrodUndergroundSwitchRoom_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_GOLDENRODUNDERGROUNDSWITCHROOM_RIVAL_BATTLE
	scene_const SCENE_GOLDENRODUNDERGROUNDSWITCHROOM_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, GoldenrodUndergroundSwitchRoomUpdateDoorPositions

	def_warp_events
	warp_event 28,  2, GOLDENROD_UNDERGROUND, 6
	warp_event 27,  8, GOLDENROD_UNDERGROUND_WAREHOUSE, 1
	warp_event 28,  8, GOLDENROD_UNDERGROUND_WAREHOUSE, 2

	def_coord_events
	coord_event 23,  1, SCENE_GOLDENRODUNDERGROUNDSWITCHROOM_RIVAL_BATTLE, UndergroundRivalTrigger1
	coord_event 23,  2, SCENE_GOLDENRODUNDERGROUNDSWITCHROOM_RIVAL_BATTLE, UndergroundRivalTrigger2
	coord_event 23,  3, SCENE_GOLDENRODUNDERGROUNDSWITCHROOM_RIVAL_BATTLE, UndergroundRivalTrigger3

	def_bg_events
	bg_event 11,  4, BGEVENT_UP, RedSwitchScript
	bg_event 10,  4, BGEVENT_UP, GreenSwitchScript
	bg_event  9,  4, BGEVENT_UP, BlueSwitchScript
	bg_event 25,  8, BGEVENT_UP, EmergencySwitchScript
	bg_event 16,  6, BGEVENT_ITEM + MAX_POTION, EVENT_GOLDENROD_UNDERGROUND_SWITCH_ROOM_HIDDEN_MAX_POTION
	bg_event  3,  2, BGEVENT_ITEM + REVIVE, EVENT_GOLDENROD_UNDERGROUND_SWITCH_ROOM_HIDDEN_REVIVE

	def_object_events
	object_event 28,  2, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_GOLDENROD_UNDERGROUND
	object_event  9, 10, SPRITE_BURGLAR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerBurglarDuncan, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  3,  6, SPRITE_BURGLAR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerBurglarOrson, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 20,  5, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerGruntM13, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 18,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerGruntM11, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  5,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerGruntM25, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 24,  9, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerGruntF3, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	itemball_event  4, 10, SMOKE_BALL, 1, EVENT_GOLDENROD_UNDERGROUND_SWITCH_ROOM_SMOKE_BALL
	itemball_event 10,  2, FULL_HEAL, 1, EVENT_GOLDENROD_UNDERGROUND_SWITCH_ROOM_FULL_HEAL

	object_const_def
	const GOLDENRODUNDERGROUNDSWITCHROOM_RIVAL

DEF ugdoor_n = 0

MACRO ugdoor_def
;\1: colors
;\2: x coord
;\3: y coord
;\4: closed block id
;\5: open block id
;...
	DEF ugdoor_n += 1
	DEF UGDOOR_{d:ugdoor_n}_COLORS EQUS " \1 "
	DEF UGDOOR_{d:ugdoor_n}_SIZE EQU (_NARG - 1) / 4
	for i, UGDOOR_{d:ugdoor_n}_SIZE
		DEF UGDOOR_{d:ugdoor_n}_X_{d:i}      EQU \2
		DEF UGDOOR_{d:ugdoor_n}_Y_{d:i}      EQU \3
		DEF UGDOOR_{d:ugdoor_n}_CLOSED_{d:i} EQU \4
		DEF UGDOOR_{d:ugdoor_n}_OPEN_{d:i}   EQU \5
		shift 4
	endr
ENDM

	;          color(s),    x,  y, closed, open,  x,  y, closed, open ; id
	ugdoor_def RED,        16,  4,    $51,  $62                       ;  1
	ugdoor_def GREEN,       4,  4,    $41,  $60                       ;  2
	ugdoor_def BLUE GREEN,  4,  8,    $49,  $61                       ;  3
	ugdoor_def BLUE RED,   10,  8,    $51,  $62                       ;  4
	ugdoor_def GREEN RED,  16,  8,    $41,  $60                       ;  5
	ugdoor_def BLUE RED,   12,  4,    $5a,  $5b, 12,  6,    $4e,  $4f ;  6
	ugdoor_def BLUE GREEN,  6,  4,    $42,  $43,  6,  6,    $46,  $47 ;  7
	ugdoor_def GREEN,      18,  8,    $42,  $43, 18, 10,    $46,  $47 ;  8
	ugdoor_def GREEN RED,  12,  8,    $52,  $53, 12, 10,    $56,  $57 ;  9
	ugdoor_def BLUE RED,    6,  8,    $4a,  $4b,  6, 10,    $4e,  $4f ; 10
	ugdoor_def EMERGENCY,  20,  8,    $5c,  $64, 22,  8,    $5d,  $18 ; 11

MACRO changeugdoor
;\1: ugdoor id
;\2: state (CLOSED or OPEN)
	DEF n = \1
	for i, UGDOOR_{d:n}_SIZE
		changeblock UGDOOR_{d:n}_X_{d:i}, UGDOOR_{d:n}_Y_{d:i}, UGDOOR_{d:n}_\2_{d:i}
	endr
ENDM

MACRO toggleugdoors
;\1: color
	for n, 1, ugdoor_n + 1
		if STRFIND(#UGDOOR_{d:n}_COLORS, " \1 ") != -1
			toggleevent EVENT_DOOR_{d:n}_OPEN
		endc
	endr
ENDM

GoldenrodUndergroundSwitchRoomUpdateDoorPositions:
for n, 1, ugdoor_n + 1
	checkevent EVENT_DOOR_{d:n}_OPEN
	iffalsefwd .door_{d:n}_closed
	changeugdoor n, OPEN
.door_{d:n}_closed
endr
	endcallback

UndergroundRivalTrigger1:
	scall UndergroundRivalAppearScript
	scall UndergroundRivalBattleScript1
	sjumpfwd UndergroundRivalDisappear1Script

UndergroundRivalTrigger2:
	scall UndergroundRivalAppearScript
	scall UndergroundRivalBattleScript2
	sjumpfwd UndergroundRivalDisappear2Script

UndergroundRivalTrigger3:
	scall UndergroundRivalAppearScript
	scall UndergroundRivalBattleScript1
UndergroundRivalDisappear1Script:
	applyonemovement GOLDENRODUNDERGROUNDSWITCHROOM_RIVAL, step_right
UndergroundRivalDisappear2Script:
	applymovement GOLDENRODUNDERGROUNDSWITCHROOM_RIVAL, UndergroundRivalRetreatMovement
	playsound SFX_EXIT_BUILDING
	disappear GOLDENRODUNDERGROUNDSWITCHROOM_RIVAL
	setscene SCENE_GOLDENRODUNDERGROUNDSWITCHROOM_NOOP
	waitsfx
	playmapmusic
	end

UndergroundRivalAppearScript:
	turnobject PLAYER, RIGHT
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	pause 15
	playsound SFX_EXIT_BUILDING
	appear GOLDENRODUNDERGROUNDSWITCHROOM_RIVAL
	waitsfx
	applymovement GOLDENRODUNDERGROUNDSWITCHROOM_RIVAL, UndergroundRivalApproachMovement
	end

UndergroundRivalBattleScript1:
	applyonemovement GOLDENRODUNDERGROUNDSWITCHROOM_RIVAL, step_left
UndergroundRivalBattleScript2:
	faceobject PLAYER, GOLDENRODUNDERGROUNDSWITCHROOM_RIVAL
	setlasttalked GOLDENRODUNDERGROUNDSWITCHROOM_RIVAL
	faceplayer
	checkevent EVENT_RIVAL_BURNED_TOWER
	iftruefwd .Continue
	setevent EVENT_RIVAL_BURNED_TOWER
	setmapscene BURNED_TOWER_1F, SCENE_BURNEDTOWER1F_RIVAL_BATTLE
.Continue:
	playmusic MUSIC_RIVAL_ENCOUNTER
	showtext UndergroundRivalBeforeText
	setevent EVENT_RIVAL_GOLDENROD_UNDERGROUND
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftruefwd .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftruefwd .Chikorita
	winlosstext UndergroundRivalWinText, UndergroundRivalLossText
	loadtrainer RIVAL1, RIVAL1_12
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjumpfwd .FinishRivalBattle

.Totodile:
	winlosstext UndergroundRivalWinText, UndergroundRivalLossText
	setlasttalked GOLDENRODUNDERGROUNDSWITCHROOM_RIVAL
	loadtrainer RIVAL1, RIVAL1_10
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjumpfwd .FinishRivalBattle

.Chikorita:
	winlosstext UndergroundRivalWinText, UndergroundRivalLossText
	setlasttalked GOLDENRODUNDERGROUNDSWITCHROOM_RIVAL
	loadtrainer RIVAL1, RIVAL1_11
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	; fallthrough

.FinishRivalBattle:
	special DeleteSavedMusic
	playmusic MUSIC_RIVAL_AFTER
	jumpthistext

	text "… Ich verstehe es"
	line "nicht …"
	para "Ist es wahr, was"
	line "dieser SIEGFRIED"
	cont "erzählt?"
	para "Dass ich meine"
	line "#mon nicht"
	cont "richtig behandle?"
	para "Liebe …"
	para "Vertrauen …"
	para "Fehlt mir das"
	line "wirklich?"
	para "Verhindern diese"
	line "Mängel, dass ich"
	cont "gewinne?"
	para "Ich … ich verstehe"
	line "es nicht."
	para "Aber es wird hier"
	line "nicht enden."
	para "Nicht jetzt. Nicht"
	line "deswegen."
	para "Ich werde meinen"
	line "Traum, der"
	cont "weltbeste"
	cont "#mon-Trainer zu"
	cont "sein, nicht"
	cont "aufgeben!"
	done
GenericTrainerGruntM11:
	generictrainer GRUNTM, 11, EVENT_BEAT_ROCKET_GRUNTM_11, GruntM11SeenText, GruntM11BeatenText

	text "Ich bin auch"
	line "verwirrt… Der"
	cont "grüne"
	para "Schalter muss als"
	line "letztes gedrückt"
	cont "werden, aber…"
	done

GenericTrainerGruntM25:
	generictrainer GRUNTM, 25, EVENT_BEAT_ROCKET_GRUNTM_25, GruntM25SeenText, GruntM25BeatenText

	text "Also gut. Ein"
	line "Tipp!"
	para "Drückst du einen"
	line "Farb-Schalter,"
	para "öffnen oder"
	line "schließen sich die"
	cont "Jalousien in"
	cont "dieser Farbe."
	done

GenericTrainerBurglarDuncan:
	generictrainer BURGLAR, DUNCAN, EVENT_BEAT_BURGLAR_DUNCAN, BurglarDuncanSeenText, BurglarDuncanBeatenText

	text "Stehlen und"
	line "Hehlen! Das ist"
	cont "die Basis aller"
	cont "Verbrechen!"
	done
GenericTrainerBurglarOrson:
	generictrainer BURGLAR, ORSON, EVENT_BEAT_BURGLAR_ORSON, BurglarOrsonSeenText, BurglarOrsonBeatenText

	text "UNTERGRUND"
	line "LAGERHAUS?"

	para "Warum möchtest du"
	line "dorthin?"

	para "Da unten wirst du"
	line "nichts finden."
	done
GenericTrainerGruntM13:
	generictrainer GRUNTM, 13, EVENT_BEAT_ROCKET_GRUNTM_13, GruntM13SeenText, GruntM13BeatenText

	text "Durch deine Venen"
	line "fließt wohl Eis,"
	cont "da du TEAM ROCKET"
	cont "nicht für bare"
	cont "Münze nimmst."
	done
GenericTrainerGruntF3:
	generictrainer GRUNTF, 3, EVENT_BEAT_ROCKET_GRUNTF_3, GruntF3SeenText, GruntF3BeatenText

	text "Geh nur! Verlaufe"
	line "dich! Dann wirst"
	cont "du feststellen,"
	cont "dass es mir egal"
	cont "ist!"
	done
RedSwitchScript:
	opentext
	writetext SwitchRoomText_RedSwitch
	yesorno
	iffalse_endtext
	toggleugdoors RED
	sjumpfwd GoldenrodUndergroundSwitchRoom_UpdateDoors

GreenSwitchScript:
	opentext
	writetext SwitchRoomText_GreenSwitch
	yesorno
	iffalse_endtext
	toggleugdoors GREEN
	sjumpfwd GoldenrodUndergroundSwitchRoom_UpdateDoors

BlueSwitchScript:
	opentext
	writetext SwitchRoomText_BlueSwitch
	yesorno
	iffalse_endtext
	toggleugdoors BLUE
	sjumpfwd GoldenrodUndergroundSwitchRoom_UpdateDoors

EmergencySwitchScript:
	opentext
	writetext SwitchRoomText_EmergencySwitch
	yesorno
	iffalse_endtext
	toggleugdoors EMERGENCY
GoldenrodUndergroundSwitchRoom_UpdateDoors:
	playsound SFX_ENTER_DOOR
for n, 1, ugdoor_n + 1
	checkevent EVENT_DOOR_{d:n}_OPEN
	iffalsefwd .door_{d:n}_closed
	changeugdoor n, OPEN
	sjumpfwd .door_{d:n}_done
.door_{d:n}_closed
	changeugdoor n, CLOSED
.door_{d:n}_done
endr
	refreshmap
	endtext

UndergroundRivalApproachMovement:
	step_left
	step_left
	step_left
	step_left
	step_end

UndergroundRivalRetreatMovement:
	step_right
	step_right
	step_right
	step_right
	step_end

UndergroundRivalBeforeText:
	text "Stehen bleiben!"
	para "Ich sah dich und"
	line "bin dir gefolgt."
	para "Hör auf, mir"
	line "nachzustellen, ich"
	para "muss mich um TEAM"
	line "ROCKET kümmern."
	para "… Moment. Du hast"
	line "mich schon"
	cont "besiegt, oder?"
	para "Das war nur Dusel."
	para "Ich begleiche"
	line "meine Rechnungen!"
	done
UndergroundRivalWinText:
	text "… Warum … Warum"
	line "habe ich verloren?"
	para "Ich habe die"
	line "stärksten #mon"
	cont "zusammengetragen."
	para "Ich habe mich so"
	line "angestrengt."
	para "Warum habe ich"
	line "bloß verloren?"
	done
UndergroundRivalLossText:
	text "Hm. Das ist meine"
	line "wahre Stärke, du"
	cont "Schwächling."

	para "TEAM ROCKET wird"
	line "dank mir nur noch"
	cont "Geschichte sein."

	para "Ich werde diesen"
	line "SIEGFRIED wie"
	cont "einen Wurm"
	cont "zertreten."
	done
GruntM11SeenText:
	text "Öffne einen"
	line "Rollladen und ein"
	cont "anderer schließt."

	para "Ich wette, du"
	line "kommst nicht so"
	cont "weit, wie du es"
	cont "dir vorstellst!"
	done
GruntM11BeatenText:
	text "Verflixt! Meine"
	line "Unentschlossenheit"
	cont "war mein Ruin!"
	done
GruntM25SeenText:
	text "Uff!"

	para "Wir sind von den"
	line "Rollläden"
	cont "verwirrt!"

	para "Ich verrate dir"
	line "ein Geheimnis,"
	cont "wenn du mich"
	cont "besiegst!"
	done
GruntM25BeatenText:
	text "Arghh… Ich hab's"
	line "vermasselt."
	done
BurglarDuncanSeenText:
	text "Wirf deine Goodies"
	line "herüber!"
	done
BurglarDuncanBeatenText:
	text "Gnade!"
	done
BurglarOrsonSeenText:
	text "Sie haben das"
	line "Projekt"
	cont "abgebrochen, noch"
	cont "ehe sie fertig"
	cont "waren."
	para "Ich suche nach"
	line "Überresten der"
	cont "Beute."
	done
BurglarOrsonBeatenText:
	text "Das ist zu viel!"
	done
GruntM13SeenText:
	text "Es ist mir egal,"
	line "wenn du dich"
	cont "verläufst."

	para "Du tauchst hier"
	line "auf! Du bist nur"
	cont "ein Opfer!"
	done
GruntM13BeatenText:
	text "Urk! Du glaubst,"
	line "du bist cool, häh?"
	done
GruntF3SeenText:
	text "Hast du dich"
	line "verirrt? Nein, das"
	cont "kann nicht sein."
	para "Es ist keine Angst"
	line "in deinem Blick."
	para "Ich zeige dir"
	line "etwas, das dir"
	cont "Angst macht!"
	done
GruntF3BeatenText:
	text "Wie konntest du?"
	done
SwitchRoomText_RedSwitch:
	text "Roten Schalter"
	line "drücken?"
	done

SwitchRoomText_GreenSwitch:
	text "Grünen Schalter"
	line "drücken?"
	done

SwitchRoomText_BlueSwitch:
	text "Blauen Schalter"
	line "drücken?"
	done

SwitchRoomText_EmergencySwitch:
	text "Notfall-Schalter"
	line "drücken?"
	done
