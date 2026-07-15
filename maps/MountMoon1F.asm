MountMoon1F_MapScriptHeader:
	def_scene_scripts
	scene_script MountMoon1FRivalBattleScene, SCENE_MOUNTMOON1F_RIVAL_BATTLE
	scene_const SCENE_MOUNTMOON1F_NOOP

	def_callbacks

	def_warp_events
	warp_event 11, 23, ROUTE_3, 1
	warp_event 22, 12, MOUNT_MOON_B1F, 1
	warp_event 11,  9, MOUNT_MOON_B1F, 2
	warp_event  4,  4, MOUNT_MOON_B1F, 3

	def_coord_events

	def_bg_events
	bg_event  2, 17, BGEVENT_ITEM + RARE_CANDY, EVENT_MOUNT_MOON_1F_HIDDEN_RARE_CANDY
	bg_event 12, 16, BGEVENT_ITEM + FULL_RESTORE, EVENT_MOUNT_MOON_1F_HIDDEN_FULL_RESTORE

	def_object_events
	object_event 10, 19, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MT_MOON_RIVAL
	object_event  4, 18, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerBugManiacKenta, -1
	object_event 11, 14, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerLassMiriam, -1
	object_event 20, 21, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSuperNerdJovan, -1
	object_event 27, 14, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBugManiacRobby, -1
	object_event 20,  2, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerLassIris, -1
	object_event  5,  5, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerHikerMarcos, -1
	itemball_event  3,  2, REVIVE, 1, EVENT_MOUNT_MOON_1F_REVIVE
	itemball_event  2, 20, X_ACCURACY, 1, EVENT_MOUNT_MOON_1F_X_ACCURACY
	itemball_event 16, 22, CALCIUM, 1, EVENT_MOUNT_MOON_1F_CALCIUM

	object_const_def
	const MOUNTMOON1F_RIVAL

MountMoon1FRivalBattleScene:
	sdefer .RivalBattle
	end

.RivalBattle:
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	pause 15
	applymovement MOUNTMOON1F_RIVAL, MountMoon1FRivalMovementBefore
	turnobject PLAYER, LEFT
	playmusic MUSIC_RIVAL_ENCOUNTER
	showtext MountMoonRivalTextBefore
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftruefwd .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftruefwd .Chikorita
	winlosstext MountMoonRivalTextWin, MountMoonRivalTextLoss
	setlasttalked MOUNTMOON1F_RIVAL
	loadtrainer RIVAL2, 3
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjumpfwd .FinishBattle

.Totodile:
	winlosstext MountMoonRivalTextWin, MountMoonRivalTextLoss
	setlasttalked MOUNTMOON1F_RIVAL
	loadtrainer RIVAL2, 1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjumpfwd .FinishBattle

.Chikorita:
	winlosstext MountMoonRivalTextWin, MountMoonRivalTextLoss
	setlasttalked MOUNTMOON1F_RIVAL
	loadtrainer RIVAL2, 2
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	; fallthrough

.FinishBattle:
	special DeleteSavedMusic
	playmusic MUSIC_RIVAL_AFTER
	showtext MountMoonRivalTextAfter
	applymovement PLAYER, MountMoon1FPlayerMovement
	applymovement MOUNTMOON1F_RIVAL, MountMoon1FRivalMovementAfter
	disappear MOUNTMOON1F_RIVAL
	playsound SFX_EXIT_BUILDING
	waitsfx
	setscene SCENE_MOUNTMOON1F_NOOP
	setevent EVENT_BEAT_RIVAL_IN_MT_MOON
	playmapmusic
	end

GenericTrainerBugManiacKenta:
	generictrainer BUG_MANIAC, KENTA, EVENT_BEAT_BUG_MANIAC_KENTA, BugManiacKentaSeenText, BugManiacKentaBeatenText

	text "Team Rocket hat"
	line "hier früher"
	cont "herumgelungert."
	para "Ich frage mich, ob"
	line "der rothaarige"
	cont "Junge damit etwas"
	cont "zu tun hat."
	done

GenericTrainerLassMiriam:
	generictrainer LASS, MIRIAM, EVENT_BEAT_LASS_MIRIAM, LassMiriamSeenText, LassMiriamBeatenText

	text "Der Mondberg ist"
	line "groß, aber du"
	cont "gewöhnst dich bald"
	cont "dran."
	done

GenericTrainerSuperNerdJovan:
	generictrainer SUPER_NERD, JOVAN, EVENT_BEAT_SUPER_NERD_JOVAN, SuperNerdJovanSeenText, SuperNerdJovanBeatenText

	text "Ich habe noch"
	line "keine stärkeren"
	cont "#mon gefunden."

	para "Wo könnten sie"
	line "wohl sein?"
	done

GenericTrainerBugManiacRobby:
	generictrainer BUG_MANIAC, ROBBY, EVENT_BEAT_BUG_MANIAC_ROBBY, BugManiacRobbySeenText, BugManiacRobbyBeatenText

	text "Früher fing ich"
	line "nur Käfer-#mon"
	cont "als Hobby,"

	para "aber jetzt sind"
	line "sie mein ganzer"
	cont "Stolz."
	done

GenericTrainerLassIris:
	generictrainer LASS, IRIS, EVENT_BEAT_LASS_IRIS, LassIrisSeenText, LassIrisBeatenText

	text "Ich komme jeden"
	line "Tag her, um ein"
	cont "Piepi zu fangen,"

	para "aber ich hab noch"
	line "keins gesehen…"
	done

GenericTrainerHikerMarcos:
	generictrainer HIKER, MARCOS, EVENT_BEAT_HIKER_MARCOS, HikerMarcosSeenText, HikerMarcosBeatenText

	text "Vor langer Zeit"
	line "wurde ich von"
	cont "einem Kind wie dir"
	cont "geschlagen."
	done

MountMoon1FRivalMovementBefore:
	step_down
	step_down
	step_down
	step_down
	turn_head_right
	step_end

MountMoon1FPlayerMovement:
	slow_step_up
	turn_head_down
	step_end

MountMoon1FRivalMovementAfter:
	step_right
	turn_head_down
	step_end

MountMoonRivalTextBefore:
	text "…… …… ……"

	para "Es ist eine Weile"
	line "her, <PLAYER>."

	para "…Seit ich gegen"
	line "dich verlor,"

	para "hab ich überlegt,"
	line "was meinen #mon"
	cont "fehlte…"

	para "Und wir fanden"
	line "eine Antwort."

	para "<PLAYER>, jetzt"
	line "zeigen wir dir,"
	cont "was wir können!"
	done

MountMoonRivalTextWin:
	text "…… …… ……"

	para "Ich dachte, ich"
	line "hätte meine"
	cont "#mon bestens"

	para "trainiert…"

	para "…Aber es reichte"
	line "trotzdem nicht…"
	done

MountMoonRivalTextAfter:
	text "… … … … … …"
	para "… Du hast fair und"
	line "ehrlich gewonnen."
	para "Ich geb's zu. Aber"
	line "das ist nicht das"
	cont "Ende."
	para "Nach mehr Training"
	line "in der"
	cont "Drachenhöhle …"
	para "werde ich der"
	line "größte"
	cont "#mon-Trainer"
	cont "aller Zeiten."
	para "Denn diese hier"
	line "stehen hinter mir."
	para "… Hör zu, <PLAYER>."
	para "Eines Tages werde"
	line "ich dir"
	para "beweisen, wie gut"
	line "ich bin, indem ich"
	cont "dich schlage."
	done

MountMoonRivalTextLoss:
	text "… … … … … …"
	para "Ich habe meine"
	line "Schuld bei dir"
	cont "beglichen."
	para "Mit meinen #mon"
	line "werde ich den"
	para "Champ schlagen und"
	line "der größte Trainer"
	cont "der Welt werden."
	done

BugManiacKentaSeenText:
	text "Ich sah einen"
	line "rothaarigen Jungen"
	cont "hier"
	para "trainieren. Hast"
	line "du gegen ihn"
	cont "gekämpft?"
	done

BugManiacKentaBeatenText:
	text "Du hast mich"
	line "erwischt!"
	done

LassMiriamSeenText:
	text "Als ich jünger"
	line "war, hab ich mich"

	para "hier immer"
	line "verlaufen."
	done

LassMiriamBeatenText:
	text "Ach! Ich hab"
	line "verloren!"
	done

SuperNerdJovanSeenText:
	text "Was! Schleich dich"
	line "nicht an mich her!"
	done

SuperNerdJovanBeatenText:
	text "Meine #mon"
	line "machen nicht mit!"
	done

BugManiacRobbySeenText:
	text "Du musst durch"
	line "diese Höhle,"

	para "um nach AZURIA"
	line "CITY zu kommen."
	done

BugManiacRobbyBeatenText:
	text "Ich habe verloren"
	line "…"
	done
LassIrisSeenText:
	text "Hast du ein Piepi"
	line "gesehen?"

	para "Die sind so süß!"
	done

LassIrisBeatenText:
	text "Das ging so"
	line "schnell…"
	done

HikerMarcosSeenText:
	text "Kinder wie du"
	line "sollten sich"

	para "hier im Dunkeln"
	line "nicht rumtreiben."
	done

HikerMarcosBeatenText:
	text "Wah! Du bist"
	line "stark!"
	done
