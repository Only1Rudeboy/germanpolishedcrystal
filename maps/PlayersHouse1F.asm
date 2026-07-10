PlayersHouse1F_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_PLAYERSHOUSE1F_MEET_MOM
	scene_const SCENE_PLAYERSHOUSE1F_NOOP

	def_callbacks

	def_warp_events
	warp_event  8,  7, NEW_BARK_TOWN, 2
	warp_event  9,  7, NEW_BARK_TOWN, 2
	warp_event 11,  0, PLAYERS_HOUSE_2F, 1

	def_coord_events
	coord_event 10,  4, SCENE_PLAYERSHOUSE1F_MEET_MOM, MomTrigger1
	coord_event 11,  4, SCENE_PLAYERSHOUSE1F_MEET_MOM, MomTrigger2
	coord_event  9,  1, SCENE_PLAYERSHOUSE1F_MEET_MOM, MomTrigger3
	coord_event  9,  2, SCENE_PLAYERSHOUSE1F_MEET_MOM, MomTrigger4

	def_bg_events
	bg_event  1,  1, BGEVENT_JUMPTEXT, PlayersHouse1FFridgeText
	bg_event  2,  1, BGEVENT_JUMPTEXT, PlayersHouse1FSinkText
	bg_event  3,  1, BGEVENT_JUMPTEXT, PlayersHouse1FStoveText
	bg_event  6,  1, BGEVENT_UP, PlayersHouse1FTVScript

	def_object_events
	object_event  9,  4, SPRITE_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_1
	object_event  3,  2, SPRITE_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, (1 << MORN), 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  9,  4, SPRITE_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, (1 << DAY), 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  6,  3, SPRITE_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, (1 << EVE), 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  1,  2, SPRITE_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, (1 << NITE), 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  6,  4, SPRITE_MATRON, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NeighborScript, EVENT_PLAYERS_HOUSE_1F_NEIGHBOR

	object_const_def
	const PLAYERSHOUSE1F_MOM1

MomTrigger1:
	playmusic MUSIC_MOM
	showemote EMOTE_SHOCK, PLAYERSHOUSE1F_MOM1, 15
	turnobject PLAYERSHOUSE1F_MOM1, RIGHT
	turnobject PLAYER, LEFT
	sjumpfwd MomEventScript

MomTrigger2:
	playmusic MUSIC_MOM
	showemote EMOTE_SHOCK, PLAYERSHOUSE1F_MOM1, 15
	turnobject PLAYERSHOUSE1F_MOM1, RIGHT
	applyonemovement PLAYER, slow_step_left
	sjumpfwd MomEventScript

MomTrigger3:
	playmusic MUSIC_MOM
	showemote EMOTE_SHOCK, PLAYERSHOUSE1F_MOM1, 15
	turnobject PLAYERSHOUSE1F_MOM1, UP
	applymovement PLAYER, .two_steps_down
	sjumpfwd MomEventScript

.two_steps_down
	step_down
	step_down
	step_end

MomTrigger4:
	playmusic MUSIC_MOM
	showemote EMOTE_SHOCK, PLAYERSHOUSE1F_MOM1, 15
	turnobject PLAYERSHOUSE1F_MOM1, UP
	applyonemovement PLAYER, slow_step_down
MomEventScript:
	opentext
	writetext MomIntroText
	promptbutton
	givespecialitem POKEGEAR
	setflag ENGINE_POKEGEAR
	setflag ENGINE_PHONE_CARD
	addcellnum PHONE_MOM
	setscene SCENE_PLAYERSHOUSE1F_NOOP
	setevent EVENT_PLAYERS_HOUSE_MOM_1
	clearevent EVENT_PLAYERS_HOUSE_MOM_2
	writetext MomPokegearText
	promptbutton
	special Special_SetDayOfWeek
.InitialSetDSTFlag:
	writetext MomDSTText
	yesorno
	iffalsefwd .NotDST
	special Special_InitialSetDSTFlag
	yesorno
	iffalse .InitialSetDSTFlag
	sjumpfwd .InitializedDSTFlag
.NotDST:
	special Special_InitialClearDSTFlag
	yesorno
	iffalse .InitialSetDSTFlag
.InitializedDSTFlag:
	writetext MomRunningShoesText
	yesorno
	iftruefwd .NoInstructions
	writetext MomInstructionsText
	promptbutton
.NoInstructions:
	writetext MomOutroText
	waitbutton
	closetext
	turnobject PLAYERSHOUSE1F_MOM1, LEFT
	special RestartMapMusic
	end

PlayersHouse1FFridgeText:
	text "Mal sehen, was"
	line "im Kühlschrank"
	cont "zu finden ist…"

	para "TAFELWASSER"
	line "und leckere"
	cont "LIMONADE!"
	done





PlayersHouse1FSinkText:
	text "Die Spüle ist"
	line "fleckenlos rein,"
	cont "so wie es Mama"
	cont "mag."
	done





PlayersHouse1FStoveText:
	text "Mamas"
	line "Spezialität!"

	para "ZINNOBER-VULKAN-"
	line "BURGER!"
	done





PlayersHouse1FTVScript:
	jumpthistext

	text "Es läuft ein"
	line "Film im TV."

	para "Die Sterne"
	line "leuchten und"
	cont "zwei Jungen"
	cont "fahren Zug…"

	para "Ich sollte mich"
	line "auch in Bewegung"
	cont "setzen!"
	done
MomScript:
	faceplayer
	checkscene
	iffalsefwd .MomEvent
	opentext
	checkevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	iftrue_jumpopenedtext MomDoItText
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iftruefwd .BankOfMom
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftruefwd .FirstTimeBanking
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue_jumpopenedtext MomErrandText
	jumpthisopenedtext

	text "PROF. LIND"
	line "wartet auf dich."

	para "Beeil dich,"
	line "Schatz!"
	done


.FirstTimeBanking:
	setevent EVENT_FIRST_TIME_BANKING_WITH_MOM
.BankOfMom:
	setevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	special Special_BankOfMom
	waitendtext

.MomEvent:
	playmusic MUSIC_MOM
	sjump MomEventScript

MomIntroText:
if DEF(DEBUG)
	text "Vergiss nicht,"
	line "dein Debug-Radio"
	cont "zu nutzen!"
	done
else
	text "Ach, <PLAYER>!"
	line "Du bist wach."

	para "Deine Freundin"
	line "LYRA"
	line "war gerade hier."

	para "Sie sagte, unser"
	line "Nachbar, PROF."

	para "LIND, sucht"
	line "nach dir."

	para "Oh! Fast hätte"
	line "ich es"
	cont "vergessen! Dein"

	para "#Com ist"
	line "von der Repa-"
	cont "ratur"
	cont "zurück."

	para "Hier, bitte"
	line "sehr!"
	done

endc

MomPokegearText:
	text "PokéCom, dein"
	line "wichtigstes"
	cont "Gerät."

	para "Ein wichtiges"
	line "Gerät auf deinem"
	cont "Trainer-Pfad."

	para "Oh, der Wochen-"
	line "tag ist noch"
	cont "nicht"
	cont "eingestellt."

	para "Das darfst du"
	line "nicht vergessen!"
	done
MomDSTText:
	text "Haben wir"
	line "Sommerzeit?"
	done
MomRunningShoesText:
	text "Komm nach Hause,"
	line "um die Uhr auf"
	cont "Sommerzeit"
	cont "einzustellen."

	para "Weißt du"
	line "übrigens, wie"
	cont "man die"

	para "neuen Laufschuhe"
	line "benutzt?"
	done

MomInstructionsText:
	text "Ich lese die"
	line "Anleitung vor."

	para "Halte die"
	line "B-Taste"
	cont "gedrückt,"
	cont "um zu"

	para "laufen--drinnen"
	line "und draußen."

	para "Oder nutze die"
	line "Option, um immer"

	para "zu laufen, und"
	line "halte B zum"
	cont "Gehen."
	done

MomOutroText:
	text "Praktisch, oder?"
	done

MomErrandText:
	text "Wie lautete"
	line "Prof.Linds"
	cont "Auftrag?"

	para "…"

	para "Das klingt nach"
	line "einer wahren He-"
	cont "rausforderung."

	para "Aber du kannst"
	line "stolz darauf"
	cont "sein,"
	cont "dass sich die"
	cont "Leu-"
	cont "te auf dich ver-"
	cont "lassen!"
	done
MomDoItText:
	text "<PLAYER>, du"
	line "schaffst es!"

	para "Ich werde dir"
	line "immer zur Seite"
	cont "stehen!"
	done
NeighborScript:
	faceplayer
	opentext
	checktime 1 << MORN
	iftruefwd .MornScript
	checktime 1 << DAY
	iftruefwd .DayScript
	checktime (1 << EVE) | (1 << NITE)
	iftruefwd .NiteScript

.MornScript:
	writetext .MornIntroText
	promptbutton
	sjumpfwd .Main

.DayScript:
	writetext .DayIntroText
	promptbutton
	sjumpfwd .Main

.NiteScript:
	writetext .NiteIntroText
	promptbutton
	; fallthrough

.Main:
	writetext .NeighborText
	waitbutton
	closetext
	turnobject LAST_TALKED, RIGHT
	end

.MornIntroText:
	text "Guten Morgen,"
	line "<PLAYER>!"

	para "Ich bin zu"
	line "Besuch!"
	done
.DayIntroText:
	text "Hallo, <PLAYER>!"
	line "Ich bin zu"
	cont "Besuch!"
	done
.NiteIntroText:
	text "Guten Abend,"
	line "<PLAYER>!"

	para "Ich bin zu"
	line "Besuch!"
	done
.NeighborText:
	text "<PLAYER>, hast"
	line "du schon gehört?"

	para "Meine Tochter"
	line "will"
	line "unbedingt PROF."

	para "LINDs Assis-"
	line "tentin werden."

	para "Sie liebt #mon"
	line "von ganzem"
	cont "Herzen!"
	done