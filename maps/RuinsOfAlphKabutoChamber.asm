RuinsOfAlphKabutoChamber_MapScriptHeader:
	def_scene_scripts
	scene_script RuinsOfAlphKabutoChamberCheckWallScene, SCENE_RUINSOFALPHKABUTOCHAMBER_CHECK_WALL
	scene_const SCENE_RUINSOFALPHKABUTOCHAMBER_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, RuinsofAlphKabutoChamberHiddenDoorsCallback

	def_warp_events
	warp_event  3,  9, RUINS_OF_ALPH_OUTSIDE, 2
	warp_event  4,  9, RUINS_OF_ALPH_OUTSIDE, 2
	warp_event  3,  3, RUINS_OF_ALPH_INNER_CHAMBER, 4
	warp_event  4,  3, RUINS_OF_ALPH_INNER_CHAMBER, 5
	warp_event  4,  0, RUINS_OF_ALPH_KABUTO_ITEM_ROOM, 1

	def_coord_events

	def_bg_events
	bg_event  2,  3, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event  5,  3, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event  3,  2, BGEVENT_UP, MapRuinsofAlphKabutoChamberSignpost2Script
	bg_event  4,  2, BGEVENT_UP, MapRuinsofAlphKabutoChamberSignpost3Script
	bg_event  3,  0, BGEVENT_UP, MapRuinsofAlphKabutoChamberSignpost4Script
	bg_event  4,  0, BGEVENT_UP, MapRuinsofAlphKabutoChamberSignpost5Script

	def_object_events
	object_event  5,  5, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, RuinsOfAlphKabutoChamberReceptionistText, EVENT_RUINS_OF_ALPH_KABUTO_CHAMBER_RECEPTIONIST
	object_event  3,  1, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphKabutoChamberScientistScript, -1

RuinsOfAlphKabutoChamberCheckWallScene:
	checkevent EVENT_WALL_OPENED_IN_KABUTO_CHAMBER
	iffalsefwd .End
	sdefer RuinsofAlphKabutoChamberWallOpenScript
.End
	end

RuinsofAlphKabutoChamberHiddenDoorsCallback:
	checkevent EVENT_WALL_OPENED_IN_KABUTO_CHAMBER
	iftruefwd .WallOpen
	changeblock 4, 0, $24
.WallOpen:
	checkevent EVENT_SOLVED_KABUTO_PUZZLE
	iffalsefwd .FloorClosed
	endcallback

.FloorClosed:
	changeblock 2, 2, $1
	changeblock 4, 2, $2
	endcallback

RuinsofAlphKabutoChamberWallOpenScript:
	pause 30
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 20
	pause 30
	playsound SFX_STRENGTH
	changeblock 4, 0, $25
	refreshmap
	earthquake 50
	setscene SCENE_RUINSOFALPHKABUTOCHAMBER_NOOP
	endtext

MapRuinsofAlphKabutoChamberSignpost2Script:
	reanchormap
	setval $0
	special Special_UnownPuzzle
	closetext
	iftruefwd .PuzzleComplete
	end

.PuzzleComplete:
	setevent EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
	setevent EVENT_SOLVED_KABUTO_PUZZLE
	setflag ENGINE_UNLOCKED_UNOWNS_A_TO_J
	setevent EVENT_RUINS_OF_ALPH_KABUTO_CHAMBER_RECEPTIONIST
	setmapscene RUINS_OF_ALPH_INNER_CHAMBER, SCENE_RUINSOFALPHINNERCHAMBER_STRANGE_PRESENCE
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 15
	changeblock 2, 2, $14
	changeblock 4, 2, $15
	refreshmap
	playsound SFX_STRENGTH
	earthquake 80
	applyonemovement PLAYER, skyfall_top
	playsound SFX_KINESIS
	waitsfx
	pause 20
	warpcheck
	end

RuinsOfAlphKabutoChamberScientistScript:
	readvar VAR_UNOWNCOUNT
	ifequalfwd NUM_UNOWN, .AllUnownCaught
	checkevent EVENT_WALL_OPENED_IN_KABUTO_CHAMBER
	iftrue_jumptextfaceplayer RuinsOfAlphKabutoChamberScientistHoleText
	faceplayer
	opentext
	checkevent EVENT_SOLVED_KABUTO_PUZZLE
	iffalsefwd .PuzzleIncomplete
	writetext RuinsOfAlphKabutoChamberScientistTremorText
	promptbutton
.PuzzleIncomplete:
	writetext RuinsOfAlphKabutoChamberScientistCrypticText
	waitbutton
	closetext
	turnobject LAST_TALKED, UP
	end

.AllUnownCaught:
	jumptextfaceplayer RuinsOfAlphResearchCenterScientist1Text_GotAllUnown

MapRuinsofAlphKabutoChamberSignpost3Script:
	opentext
	unowntypeface
	writetext RuinsOfAlphKabutoChamberDescriptionText
	waitbutton
	closetext
	restoretypeface
	special RefreshSprites
	end

MapRuinsofAlphKabutoChamberSignpost5Script:
	checkevent EVENT_WALL_OPENED_IN_KABUTO_CHAMBER
	iftrue_jumptext RuinsOfAlphAerodactylChamberWallHoleText
MapRuinsofAlphKabutoChamberSignpost4Script:
	opentext
	checkevent EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	iftruefwd .unsolved
	writetext RuinsOfAlphChambersItsUnownText
	sjumpfwd .unownwords
.unsolved
	writetext RuinsOfAlphAerodactylChamberWallPatternLeftText
.unownwords
	setval $0
	special Special_DisplayUnownWords
	endtext

RuinsOfAlphKabutoChamberReceptionistText:
	text "Willkommen in"
	line "diesem Raum."

	para "Hier gibt es ver-"
	line "schiebbare Plat-"
	cont "ten, die ein #-"
	cont "MON darstellen,"

	para "das aus der Antike"
	line "stammt."

	para "Verschiebe die"
	line "Platten so, dass"
	cont "ein Bild entsteht."

	para "Rechts findest du"
	line "eine Beschreibung"
	cont "des #mon."

	para "Die Forscher im"
	line "Hintergrund"
	cont "untersuchen neu"
	cont "entdeckte Muster."
	done


RuinsOfAlphKabutoChamberScientistCrypticText:
	text "Neulich sind"
	line "seltsame Muster"
	cont "aufgetaucht."

	para "Es ist merkwürdig."
	line "Vor kurzem waren"
	cont "sie noch nicht da…"

	para "Wirf einen Blick"
	line "auf die Wände."
	done


RuinsOfAlphKabutoChamberScientistHoleText:
	text "Ah! Hier ist noch"
	line "ein großes Loch!"

	para "Es ist groß genug,"
	line "um durchzugehen!"
	done


RuinsOfAlphKabutoChamberScientistTremorText:
	text "Das Beben war"
	line "Furcht erregend!"

	para "Aber die Wand hier"
	line "macht mir mehr"
	cont "Sorgen…"
	done



RuinsOfAlphKabutoChamberUnusedText: ; unreferenced
	text "Die Muster an der"
	line "Wand sind"
	cont "tatsächlich Worte!"

	para "Und die"
	line "verschiebbaren"
	cont "Steinplatten"

	para "scheinen ein"
	line "Signal zu sein."

	para "Ich glaube sie"
	line "veranlassen"
	cont "#mon sich zu"
	cont "zeigen, aber das"
	cont "ist noch nicht"
	cont "sicher…"
	done


RuinsOfAlphKabutoChamberDescriptionText:
	text "Ein #mon, das"
	line "sich am Meeres-"
	cont "grund versteckte"

	para "und mit seinen"
	line "Augen auf dem"

	para "Rücken die"
	line "Umgebung genau"
	cont "beobachtete."
	done


