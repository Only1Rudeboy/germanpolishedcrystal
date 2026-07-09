AzaleaTown_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_AZALEATOWN_NOOP
	scene_const SCENE_AZALEATOWN_RIVAL_BATTLE
	scene_const SCENE_AZALEATOWN_CELEBI_EVENT

	def_callbacks
	callback MAPCALLBACK_NEWMAP, AzaleaTownFlypointCallback
	callback MAPCALLBACK_TILES, AzaleaTownRainScript

	def_warp_events
	warp_event 15,  9, AZALEA_POKECENTER_1F, 1
	warp_event 21, 13, CHARCOAL_KILN, 1
	warp_event 21,  5, AZALEA_MART, 2
	warp_event  9,  5, KURTS_HOUSE, 1
	warp_event 10, 15, AZALEA_GYM, 1
	warp_event 31,  7, SLOWPOKE_WELL_ENTRANCE, 1
	warp_event  2, 10, ILEX_FOREST_AZALEA_GATE, 3
	warp_event  2, 11, ILEX_FOREST_AZALEA_GATE, 4

	def_coord_events
	coord_event  5, 10, SCENE_AZALEATOWN_RIVAL_BATTLE, AzaleaTownRivalBattleTrigger1
	coord_event  5, 11, SCENE_AZALEATOWN_RIVAL_BATTLE, AzaleaTownRivalBattleTrigger2
	coord_event  9,  6, SCENE_AZALEATOWN_CELEBI_EVENT, AzaleaTown_CelebiTrigger

	def_bg_events
	bg_event 19,  9, BGEVENT_JUMPTEXT, AzaleaTownSignText
	bg_event 10,  9, BGEVENT_JUMPTEXT, KurtsHouseSignText
	bg_event 14, 15, BGEVENT_JUMPTEXT, AzaleaGymSignText
	bg_event 29,  8, BGEVENT_JUMPTEXT, SlowpokeWellSignText
	bg_event 19, 13, BGEVENT_JUMPTEXT, CharcoalKilnSignText
	bg_event  3,  9, BGEVENT_JUMPTEXT, AzaleaTownIlexForestSignText
	bg_event 29, 14, BGEVENT_JUMPTEXT, AzaleaTownAdvancedTipsSignText
	bg_event 31,  6, BGEVENT_ITEM + FULL_HEAL, EVENT_AZALEA_TOWN_HIDDEN_FULL_HEAL

	def_object_events
	object_event 11, 10, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_AZALEA_TOWN
	object_event  6,  5, SPRITE_KURT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownKurtScript, EVENT_AZALEA_TOWN_KURT
	object_event 21,  9, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 2, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownGrampsScript, -1
	object_event 15, 13, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AzaleaTownTeacherScript, -1
	object_event  7,  9, SPRITE_CAMPER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, AzaleaTownYoungsterText, -1
	object_event 31,  9, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, AzaleaTownRocket1Text, EVENT_AZALEA_TOWN_SLOWPOKETAIL_ROCKET
	object_event 10, 16, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, AzaleaTownRocket2Text, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event  8, 17, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, SLOWPOKE, -1, PAL_MON_PINK, OBJECTTYPE_SCRIPT, PLAIN_FORM, AzaleaTownSlowpokeScript, EVENT_AZALEA_TOWN_SLOWPOKES
	object_event 18,  9, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, SLOWPOKE, -1, PAL_MON_PINK, OBJECTTYPE_SCRIPT, PLAIN_FORM, AzaleaTownSlowpokeScript, EVENT_AZALEA_TOWN_SLOWPOKES
	object_event 30,  9, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, SLOWPOKE, -1, PAL_MON_PINK, OBJECTTYPE_SCRIPT, PLAIN_FORM, AzaleaTownSlowpokeScript, EVENT_AZALEA_TOWN_SLOWPOKES
	object_event 15, 15, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, SLOWPOKE, -1, PAL_MON_PINK, OBJECTTYPE_SCRIPT, PLAIN_FORM, AzaleaTownSlowpokeScript, EVENT_AZALEA_TOWN_SLOWPOKES
	pokemon_event 14, 12, WOOPER, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BLUE, AzaleaTownWoosterText, EVENT_SLOWPOKE_WELL_SLOWPOKES
	pokemon_event 14, 12, QUAGSIRE, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BLUE, AzaleaTownWoosterText, EVENT_AZALEA_TOWN_SLOWPOKES
	fruittree_event  8,  2, FRUITTREE_AZALEA_TOWN, WHT_APRICORN, PAL_NPC_ENV_WHITE

	object_const_def
	const AZALEATOWN_RIVAL
	const AZALEATOWN_KURT

AzaleaTownFlypointCallback:
	setflag ENGINE_FLYPOINT_AZALEA
	endcallback

AzaleaTownRainScript:
	special Special_GetOvercastIndex
	ifequalfwd AZALEA_OVERCAST, .rain
	changemapblocks AzaleaTown_BlockData
	endcallback

.rain
	changemapblocks AzaleaTownRaining_BlockData
	endcallback

AzaleaTownRivalBattleTrigger1:
	moveobject AZALEATOWN_RIVAL, 11, 11
AzaleaTownRivalBattleTrigger2:
	turnobject PLAYER, RIGHT
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	pause 15
	appear AZALEATOWN_RIVAL
	applymovement AZALEATOWN_RIVAL, .ApproachMovement
	faceobject AZALEATOWN_RIVAL, PLAYER
	faceobject PLAYER, AZALEATOWN_RIVAL
	playmusic MUSIC_RIVAL_ENCOUNTER
	showtext .SeenText
	setevent EVENT_RIVAL_AZALEA_TOWN
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftruefwd .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftruefwd .Chikorita
	winlosstext .WinText, .LossText
	setlasttalked AZALEATOWN_RIVAL
	loadtrainer RIVAL1, RIVAL1_6
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjumpfwd .AfterBattle

.Totodile:
	winlosstext .WinText, .LossText
	setlasttalked AZALEATOWN_RIVAL
	loadtrainer RIVAL1, RIVAL1_4
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjumpfwd .AfterBattle

.Chikorita:
	winlosstext .WinText, .LossText
	setlasttalked AZALEATOWN_RIVAL
	loadtrainer RIVAL1, RIVAL1_5
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	; fallthrough

.AfterBattle:
	special DeleteSavedMusic
	playmusic MUSIC_RIVAL_AFTER
	showtext .AfterText
	turnobject PLAYER, LEFT
	applymovement AZALEATOWN_RIVAL, .ExitMovement
	playsound SFX_EXIT_BUILDING
	disappear AZALEATOWN_RIVAL
	setmapscene ROUTE_34, SCENE_ROUTE34_LYRA_DAYCARE
	setscene SCENE_AZALEATOWN_NOOP
	waitsfx
	playmapmusic
	end

.SeenText:
	text "…Sag mir mal"
	line "etwas."

	para "Stimmt es, dass"
	line "Team Rocket"
	cont "zurückkam?"

	para "Was? Du hast sie"
	line "besiegt? Ha! Hör"
	cont "auf zu lügen."

	para "Du meinst das"
	line "ernst? Dann zeig"
	cont "mir, was du kannst."
	done

.WinText:
	text "…Pah! Nutzlose"
	line "#mon!"

	para "Hör zu. Du hast"
	line "nur gewonnen,"

	para "weil meine #mon"
	line "schwach waren."
	done

.LossText:
	text "…Pah! Ich wusste"
	line "dass du lügst."
	done

.AfterText:
	text "Ich hasse"
	line "Schwäche."

	para "#mon, Trainer -"
	line "es ist egal, wer"
	cont "oder was."

	para "Ich werde stark"
	line "und lösche die"
	cont "Schwachen aus."

	para "Das gilt auch für"
	line "Team Rocket."

	para "Sie geben groß an"
	line "in der Gruppe."

	para "Doch allein sind"
	line "sie schwach."

	para "Ich hasse sie"
	line "alle."

	para "Geh mir aus dem"
	line "Weg. Ein"

	para "Schwächling wie du"
	line "lenkt nur ab."
	done

.ApproachMovement:
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

.ExitMovement:
	step_left
	step_left
	step_left
	step_end

AzaleaTown_CelebiTrigger:
	applymovement PLAYER, .WalkOutOfKurtsHouseMovement
	opentext
	writethistext
		text "Der Steineichen-"
		line "wald ist unruhig!"

		para "Was ist los?"
		done
	promptbutton
	turnobject AZALEATOWN_KURT, RIGHT
	writethistext
		text "<PLAYER>, hier"
		line "ist dein GS-Ball"
		cont "zurück!"
		done
	promptbutton
	writetext AzaleaTownKurtText
	waitbutton
	verbosegivekeyitem GS_BALL
	turnobject AZALEATOWN_KURT, LEFT
	setflag ENGINE_HAVE_EXAMINED_GS_BALL
	clearevent EVENT_ILEX_FOREST_LASS
	setevent EVENT_ROUTE_34_ILEX_FOREST_GATE_LASS
	setscene SCENE_AZALEATOWN_NOOP
	endtext

.WalkOutOfKurtsHouseMovement:
	step_left
	step_left
	step_up
	turn_head_left
	step_end

AzaleaTownSignText:
	text "Azalea City"
	line "Wo Mensch und"

	para "#mon in"
	line "Harmonie leben"
	done

KurtsHouseSignText:
	text "Kurts Haus"
	done

AzaleaGymSignText:
	text "Azalea City"
	line "#mon-Arena"
	cont "Leiter: Kai"

	para "Das wandelnde"
	line "Käfer-#mon-"
	cont "Lexikon"
	done

SlowpokeWellSignText:
	text "Flegmon-Brunnen"

	para "Auch bekannt als"
	line "Regenmacher-"
	cont "Brunnen."

	para "Man glaubt, ein"
	line "Gähnen von Flegmon"
	cont "bringt Regen."

	para "Aufzeichnungen"
	line "zeigen: Ein Gähnen"

	para "beendete vor 400"
	line "Jahren eine Dürre."
	done

CharcoalKilnSignText:
	text "Kohlenmeiler"
	done

AzaleaTownIlexForestSignText:
	text "Steineichenwald"

	para "Betritt ihn durchs"
	line "Tor."
	done

AzaleaTownAdvancedTipsSignText:
	text "Profi-Tipps!"

	para "Der Wechsel-"
	line "Kampfstil zeigt"
	cont "dir, welches #mon"

	para "der Gegner als"
	line "Nächstes schickt,"

	para "aber der"
	line "Vorhersage-Stil"
	cont "zeigt das nicht!"
	done

AzaleaTownGrampsScript:
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iftrue_jumptextfaceplayer .Text2
	jumpthistextfaceplayer

	text "Die Flegmon sind"
	line "aus der Stadt"
	cont "verschwunden…"

	para "Ich hörte, ihre"
	line "Schwänze werden"
	cont "irgendwo verkauft."
	done

.Text2:
	text "Die Flegmon sind"
	line "zurück."

	para "Typisch für sie -"
	line "sie haben wohl nur"

	para "irgendwo"
	line "rumgetrödelt."
	done

AzaleaTownTeacherScript:
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iffalse_jumptextfaceplayer .Text1
	checkevent EVENT_GOT_CLEAR_AMULET_IN_AZALEA
	iftrue_jumptextfaceplayer .Text2
	faceplayer
	opentext
	writetext .Text3
	promptbutton
	verbosegiveitem CLEAR_AMULET
	iffalse_endtext
	setevent EVENT_GOT_CLEAR_AMULET_IN_AZALEA
	jumpthisopenedtext

.Text2:
	text "Er hat sich"
	line "verändert, aber"

	para "für mich bleibt er"
	line "immer mein"
	cont "kleiner Wooster."
	done

.Text1:
	text "Seit die Flegmon"
	line "verschwanden, hat"
	cont "es nicht geregnet."

	para "Mein armer Wooster"
	line "kommt bei diesem"
	cont "Wetter nicht klar…"
	done

.Text3:
	text "In einem"
	line "plötzlichen Regen"
	cont "ist er entwickelt!"

	para "Oh? Du hast die"
	line "Flegmon zurück-"
	cont "gebracht?"

	para "Sie brachten den"
	line "Regen mit!"

	para "Vielen, vielen"
	line "Dank!"

	para "Bitte nimm das,"
	line "du hast's verdient!"
	done

AzaleaTownWoosterText:
	text "Wooster: Gugyoo…"
	done

AzaleaTownYoungsterText:
	text "Schneide durch"
	line "Azalea und du bist"
	cont "im Steineichenwald."

	para "Aber diese dünnen"
	line "Bäume machen das"
	cont "unmöglich."

	para "Das #mon vom"
	line "Kohlenmann kann"
	cont "Bäume zerschneiden."
	done

AzaleaTownRocket1Text:
	text "Da reinzugehen ist"
	line "gefährlich, drum"
	cont "halte ich Wache."

	para "Bin ich nicht ein"
	line "guter Samariter?"
	done

AzaleaTownRocket2Text:
	text "Kennst du den"
	line "Flegmonschwanz? Er"
	cont "soll lecker sein!"

	para "Bist du nicht froh,"
	line "dass ich's dir"
	cont "gesagt hab?"
	done

AzaleaTownSlowpokeScript:
	opentext
	writethistext
		text "Flegmon: …"

		para "…… …… ……"
		done
	pause 60
	writethistext
		text "…… ……Gähn?"
		done
	cry SLOWPOKE
	waitendtext

AzaleaTownKurtScript:
	showtextfaceplayer AzaleaTownKurtText
	turnobject LAST_TALKED, LEFT
	end

AzaleaTownKurtText:
	text "Könntest du"
	line "nachsehen, warum"
	cont "der Steineichen-"
	cont "wald so unruhig"
	cont "ist?"
	done
