CherrygroveCity_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_CHERRYGROVECITY_GUIDE_GENT
	scene_const SCENE_CHERRYGROVECITY_MEET_RIVAL
	scene_const SCENE_CHERRYGROVECITY_NOOP

	def_callbacks
	callback MAPCALLBACK_NEWMAP, CherrygroveCityFlyPoint

	def_warp_events
	warp_event 23,  3, CHERRYGROVE_MART, 2
	warp_event 29,  3, CHERRYGROVE_POKECENTER_1F, 1
	warp_event 17,  7, CHERRYGROVE_GYM_SPEECH_HOUSE, 1
	warp_event 25,  9, GUIDE_GENTS_HOUSE, 1
	warp_event 31, 11, CHERRYGROVE_EVOLUTION_SPEECH_HOUSE, 1

	def_coord_events
	coord_event 33,  7, SCENE_CHERRYGROVECITY_GUIDE_GENT, CherrygroveGuideGentTrigger
	coord_event 33,  6, SCENE_CHERRYGROVECITY_MEET_RIVAL, CherrygroveRivalTriggerNorth
	coord_event 33,  7, SCENE_CHERRYGROVECITY_MEET_RIVAL, CherrygroveRivalTriggerSouth

	def_bg_events
	bg_event 30,  8, BGEVENT_JUMPTEXT, CherrygroveCitySignText
	bg_event 23,  9, BGEVENT_JUMPTEXT, GuideGentsHouseSignText
	bg_event 13,  5, BGEVENT_JUMPTEXT, CherrygroveCityAdvancedTipsSignText
	bg_event 35,  2, BGEVENT_ITEM + NUGGET, EVENT_CHERRYGROVE_CITY_HIDDEN_NUGGET

	def_object_events
	object_event 32,  6, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygroveCityGuideGent, EVENT_GUIDE_GENT_IN_HIS_HOUSE
	object_event 39,  6, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_CHERRYGROVE_CITY
	object_event 25, 13, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 1, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, CherrygroveTeacherText_HaveMapCard, -1
	object_event 23,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CherrygroveYoungsterScript, -1
	object_event  7, 12, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, MysticWaterGuy, -1
	pokemon_event 26, 13, PIDGEY, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BROWN, CherrygrovePidgeyText, -1

	object_const_def
	const CHERRYGROVECITY_GRAMPS
	const CHERRYGROVECITY_RIVAL

CherrygroveCityFlyPoint:
	setflag ENGINE_FLYPOINT_CHERRYGROVE
	endcallback

CherrygroveGuideGentTrigger:
	applymovement PLAYER, GuideGentPlayerMovement
	setlasttalked CHERRYGROVECITY_GRAMPS
CherrygroveCityGuideGent:
	showtextfaceplayer GuideGentIntroText
	playmusic MUSIC_SHOW_ME_AROUND
	follow CHERRYGROVECITY_GRAMPS, PLAYER
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement1
	showtext GuideGentPokeCenterText
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement2
	turnobject PLAYER, UP
	showtext GuideGentMartText
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement3
	turnobject PLAYER, UP
	showtext GuideGentRoute30Text
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement3_5
	turnobject PLAYER, LEFT
	showtext GuideGentAdvancedTipsText
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement4
	turnobject PLAYER, LEFT
	showtext GuideGentSeaText
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement5
	turnobject PLAYER, UP
	pause 60
	turnobject CHERRYGROVECITY_GRAMPS, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext GuideGentGiftText
	promptbutton
	givespecialitem MAP_CARD
	setflag ENGINE_MAP_CARD
	writetext GotMapCardText
	promptbutton
	writetext GuideGentPokegearText
	waitbutton
	closetext
	stopfollow
	playmusic MUSIC_CHERRYGROVE_CITY
	turnobject PLAYER, UP
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement6
	playsound SFX_ENTER_DOOR
	disappear CHERRYGROVECITY_GRAMPS
	clearevent EVENT_GUIDE_GENT_VISIBLE_IN_CHERRYGROVE
	setscene SCENE_CHERRYGROVECITY_NOOP
	waitsfx
	end

CherrygroveRivalTriggerSouth:
	moveobject CHERRYGROVECITY_RIVAL, 39, 7
CherrygroveRivalTriggerNorth:
	turnobject PLAYER, RIGHT
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	pause 15
	appear CHERRYGROVECITY_RIVAL
	applymovement CHERRYGROVECITY_RIVAL, CherrygroveCity_RivalWalksToYou
	turnobject PLAYER, RIGHT
	playmusic MUSIC_RIVAL_ENCOUNTER
	showtext CherrygroveRivalText_Seen
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftruefwd .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftruefwd .Chikorita
	winlosstext RivalCherrygroveWinText, RivalCherrygroveLossText
	setlasttalked CHERRYGROVECITY_RIVAL
	loadtrainer RIVAL0, 3
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	setevent EVENT_RIVAL_CHERRYGROVE_CITY
	reloadmap
	sjumpfwd .FinishRival

.Totodile:
	winlosstext RivalCherrygroveWinText, RivalCherrygroveLossText
	setlasttalked CHERRYGROVECITY_RIVAL
	loadtrainer RIVAL0, 1
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	setevent EVENT_RIVAL_CHERRYGROVE_CITY
	reloadmap
	sjumpfwd .FinishRival

.Chikorita:
	winlosstext RivalCherrygroveWinText, RivalCherrygroveLossText
	setlasttalked CHERRYGROVECITY_RIVAL
	loadtrainer RIVAL0, 2
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	setevent EVENT_RIVAL_CHERRYGROVE_CITY
	reloadmap
.FinishRival:
	special DeleteSavedMusic
	playmusic MUSIC_RIVAL_AFTER
	showtext CherrygroveRivalTextAfter1
	playsound SFX_TACKLE
	applymovement PLAYER, CherrygroveCity_RivalPushesYouOutOfTheWay
	applymovement CHERRYGROVECITY_RIVAL, CherrygroveCity_RivalStartsToLeave
	showemote EMOTE_SHOCK, CHERRYGROVECITY_RIVAL, 15
	applymovement CHERRYGROVECITY_RIVAL, CherrygroveCity_RivalComesBack
	turnobject PLAYER, UP
	showtext CherrygroveRivalTextAfter2
	turnobject PLAYER, LEFT
	applymovement CHERRYGROVECITY_RIVAL, CherrygroveCity_RivalExitsStageLeft
	disappear CHERRYGROVECITY_RIVAL
	special HealParty
	setscene SCENE_CHERRYGROVECITY_NOOP
	playmusic MUSIC_CHERRYGROVE_CITY
	end

CherrygroveYoungsterScript:
	checkflag ENGINE_POKEDEX
	iftrue_jumptextfaceplayer CherrygroveYoungsterText_HavePokedex
	jumpthistextfaceplayer

	text "Das Haus von Mr."
	line "#mon ist noch"
	cont "weiter vorne."
	done

MysticWaterGuy:
	checkevent EVENT_GOT_MYSTIC_WATER_IN_CHERRYGROVE
	iftrue_jumptextfaceplayer MysticWaterGuyTextAfter
	faceplayer
	opentext
	writetext MysticWaterGuyTextBefore
	promptbutton
	verbosegiveitem MYSTIC_WATER
	iffalse_endtext
	setevent EVENT_GOT_MYSTIC_WATER_IN_CHERRYGROVE
	jumpthisopenedtext

MysticWaterGuyTextAfter:
	text "Ich gehe wieder"
	line "zum Fischen."
	done




GuideGentMovement1:
	step_left
	step_left
	step_up
GuideGentPlayerMovement:
	step_left
	turn_head_up
	step_end

GuideGentMovement3:
	step_left
GuideGentMovement2:
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	turn_head_up
	step_end

GuideGentMovement3_5:
	step_left
	step_left
	step_down
	step_left
	turn_head_up
	step_end

GuideGentMovement4:
	step_left
	step_left
	step_left
	step_down
	step_down
	turn_head_left
	step_end

GuideGentMovement5:
	step_down
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_down
	step_down
	step_right
	step_right
	step_right
	step_right
	step_right
	turn_head_up
	step_end

GuideGentMovement6:
	step_up
	step_up
	step_end

CherrygroveCity_RivalWalksToYou:
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

CherrygroveCity_RivalPushesYouOutOfTheWay:
	run_step_down
	turn_head_left
	step_end

CherrygroveCity_RivalExitsStageLeft:
	run_step_left
	run_step_left
	run_step_left
	run_step_up
	run_step_up
CherrygroveCity_RivalStartsToLeave:
	run_step_left
	run_step_left
	step_end

CherrygroveCity_RivalComesBack:
	run_step_right
	turn_head_down
	step_end

GuideGentIntroText:
	text "Du bist doch ein"
	line "Anfänger, oder?"
	para "Das ist o.k.! Es"
	line "ist noch kein"
	cont "Meister vom Himmel"
	cont "gefallen!"
	para "Wenn du willst,"
	line "zeige ich dir ein"
	cont "paar Tricks."
	done

GuideGentPokeCenterText:
	text "Das ist ein"
	line "#mon-Center."
	para "Hier kannst du"
	line "deine #mon"
	cont "heilen."
	para "Das wirst du sehr"
	line "oft brauchen."
	done

GuideGentMartText:
	text "Das ist ein"
	line "#mon-Markt."
	para "Hier gibt es"
	line "Bälle, mit denen"
	cont "du #mon fängst."
	para "Und viele andere"
	line "nützliche Items."
	done

GuideGentRoute30Text:
	text "Zur Route 30 geht"
	line "es hier entlang."

	para "Dort triffst du"
	line "viele Trainer und"
	cont "ihre #mon."
	done




GuideGentAdvancedTipsText:
	text "Erweiterte Tipps!"
	line "Schilder sehen so"
	cont "ungewöhnlich aus."

	para "Sie sind voll"
	line "nützlicher"
	cont "Ratschläge."
	done

GuideGentSeaText:
	text "Wie du sehen"
	line "kannst, befinden"

	para "wir uns hier am"
	line "Meer."

	para "Manche #mon"
	line "findet man nur im"
	cont "Wasser."
	done




GuideGentGiftText:
	text "Hier …"
	para "Das ist mein Haus!"
	line "Danke, dass du mir"
	cont "Gesellschaft"
	cont "geleistet hast."
	para "Lass mich dir ein"
	line "kleines Präsent"
	cont "geben!"
	done




GotMapCardText:
	text "Der #COM von"
	line "<PLAYER> verfügt"
	cont "nun über eine"
	cont "KARTE!"
	done




GuideGentPokegearText:
	text "Der #COM wird"
	line "vielseitiger, wenn"
	cont "du ihn mit MODULEN"
	cont "erweiterst."
	para "Ich wünsche dir"
	line "viel Glück für"
	cont "deine Reise!"
	done




CherrygroveRivalText_Seen:
	text "… … …"
	para "Du hast ein"
	line "#mon aus dem"
	cont "LABOR."
	para "Welch eine"
	line "Verschwendung für"
	cont "einen Schwächling"
	cont "wie dich."
	para "… … …"
	para "Hast du kapiert,"
	line "wovon ich spreche?"
	para "Auch ich habe ein"
	line "gutes #mon."
	para "Ich zeige dir, was"
	line "ich meine!"
	done




RivalCherrygroveWinText:
	text "Hmpf. Bist du"
	line "wenigstens froh"
	cont "über deinen Sieg?"
	done




RivalCherrygroveLossText:
	text "Hmpf. Das war pure"
	line "Zeitverschwendung."
	done




CherrygroveRivalTextAfter1:
	text "… … … … … …"
	para "Du willst wissen,"
	line "wer ich bin?"
	para "Ich werde der"
	line "größte"
	cont "#mon-Trainer"
	cont "der Welt."
	done

CherrygroveRivalTextAfter2:
	text "Ich hab meine"
	line "Trainerkarte …"
	para "Hey! Gib sie"
	line "zurück!"
	para "Ach nein … Du hast"
	line "meinen Namen"
	cont "gesehen …"
	done

CherrygroveTeacherText_HaveMapCard:
	text "Du kannst gehen,"
	line "wohin du willst"
	cont "solange du mit"
	cont "#mon unterwegs"
	cont "bist, wird es"
	cont "immer lustig sein."
	done




CherrygroveYoungsterText_HavePokedex:
	text "Ich habe gegen die"
	line "Trainer auf der"
	cont "Straße gekämpft."
	para "Meine #mon"
	line "haben verloren!"
	para "Ich muss sie rasch"
	line "in ein"
	cont "#mon-CENTER"
	cont "bringen."
	done




MysticWaterGuyTextBefore:
	text "Ich habe ein"
	line "#mon gefangen,"
	cont "das ein Item"
	para "bei sich hatte."
	line "Ich glaube, es war"
	cont "ZAUBERWASSER."
	para "Ich brauche es"
	line "nicht. Möchtest du"
	cont "es haben?"
	done




CherrygrovePidgeyText:
	text "TAUBSI: Gru gru!"
	done
CherrygroveCitySignText:
	text "ROSALIA CITY"

	para "Die Stadt der"
	line "Duftenden Blumen"
	done




GuideGentsHouseSignText:
	text "HAUS DES"
	line "FREMDENFÜHRERs"
	done




CherrygroveCityAdvancedTipsSignText:
	text "Erweiterte Tipps!"
	para "In #mon-Märkten"
	line "bekommst du"
	para "gratis einen"
	line "Premierball, wenn"
	cont "du zehn #BÄLLE"
	cont "kaufst!"
	done
