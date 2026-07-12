VioletGym_MapScriptHeader:
	def_scene_scripts
	scene_script VioletGymFalknerAwayScene, SCENE_VIOLETGYM_FALKNER_AWAY
	scene_const SCENE_VIOLETGYM_NOOP

	def_callbacks

	def_warp_events
	warp_event  4, 17, VIOLET_CITY, 2
	warp_event  5, 17, VIOLET_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, VioletGymStatue
	bg_event  6, 15, BGEVENT_READ, VioletGymStatue

	def_object_events
	object_event  4, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_DARK_CAVE_FALKNER
	object_event  5,  2, SPRITE_FALKNER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletGymFalknerScript, EVENT_VIOLET_GYM_FALKNER
	object_event  7,  7, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_LEFT, 0, 2, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBird_keeperRod, EVENT_VIOLET_GYM_FALKNER
	object_event  2, 11, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 2, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBird_keeperAbe, EVENT_VIOLET_GYM_FALKNER
	object_event  7, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VioletGymGuyScript, EVENT_VIOLET_GYM_FALKNER

	object_const_def
	const VIOLETGYM_GYM_GUY2

VioletGymFalknerAwayScene:
	sdefer .Script
	end

.Script:
	showemote EMOTE_SHOCK, VIOLETGYM_GYM_GUY2, 15
	applyonemovement VIOLETGYM_GYM_GUY2, step_down
	showtext VioletGymGuyFalknerAwayText
	turnobject PLAYER, DOWN
	warpcheck
	warpsound
	newloadmap MAPSETUP_DOOR
	end

VioletGymFalknerScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_FALKNER
	iftruefwd .FightDone
	writetext FalknerIntroText
	waitbutton
	closetext
	winlosstext FalknerWinLossText, 0
	loadtrainer FALKNER, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_FALKNER
	opentext
	givebadge ZEPHYRBADGE, JOHTO_REGION
.FightDone:
	checkevent EVENT_GOT_TM31_ROOST
	iftrue_jumpopenedtext FalknerFightDoneText
	setevent EVENT_BEAT_BIRD_KEEPER_ROD
	setevent EVENT_BEAT_BIRD_KEEPER_ABE
	setmapscene ELMS_LAB, SCENE_ELMSLAB_NOOP
	specialphonecall SPECIALCALL_ASSISTANT
	writetext FalknerZephyrBadgeText
	promptbutton
	verbosegivetmhm TM_ROOST
	setevent EVENT_GOT_TM31_ROOST
	jumpthisopenedtext

	text "Mit einer VM kann"
	line "ein #mon sofort"

	para "eine neue Attacke"
	line "lernen."

	para "Eine VM kannst du"
	line "so oft nutzen, wie"
	cont "du willst."

	para "VM51 enthält"
	line "Roost."

	para "Es landet am Boden"
	line "und stellt die"
	cont "Hälfte der max KP"
	cont "wieder her."
	done

GenericTrainerBird_keeperRod:
	generictrainer BIRD_KEEPER, ROD, EVENT_BEAT_BIRD_KEEPER_ROD, Bird_keeperRodSeenText, Bird_keeperRodBeatenText

	text "FALKs Fähigkeiten"
	line "sind"
	cont "unübertrefflich!"

	para "Du solltest dich"
	line "nicht"
	cont "überschätzen, nur"
	cont "weil du mich"
	cont "geschlagen hast!"
	done
GenericTrainerBird_keeperAbe:
	generictrainer BIRD_KEEPER, ABE, EVENT_BEAT_BIRD_KEEPER_ABE, Bird_keeperAbeSeenText, Bird_keeperAbeBeatenText

	text "Das ist peinlich!"
	line "Von einem Anfänger"
	cont "besiegt…"
	done
VioletGymGuyScript:
	checkevent EVENT_BEAT_FALKNER
	iftrue_jumptextfaceplayer VioletGymGuyWinText
	jumpthistextfaceplayer

	text "Hey! Zwar bin ich"
	line "kein Trainer, aber"
	cont "ich kann dir gute"
	cont "Tipps geben!"

	para "Glaube mir! Wenn"
	line "du es tust,"

	para "kann dein Traum"
	line "von der"
	cont "Meisterschaft in"
	cont "Erfüllung gehen."

	para "Du glaubst mir?"
	line "Dann pass auf!"

	para "Typ Pflanze ist"
	line "schwach gegen Typ"

	para "Flug. Das solltest"
	line "du dir merken."
	done
VioletGymStatue:
	gettrainername FALKNER, 1, STRING_BUFFER_4
	checkflag ENGINE_ZEPHYRBADGE
	iftruefwd .Beaten
	jumpstd gymstatue1
.Beaten:
	readvar VAR_BADGES
	ifgreater 8, .LyraToo
	jumpstd gymstatue2
.LyraToo
	jumpstd gymstatue3

FalknerIntroText:
	text "Ich bin FALK, der"
	line "ARENALEITER von"
	cont "VIOLA CITY!"

	para "Man sagt, dass man"
	line "die Flügel von"

	para "Flug-#mon mit"
	line "einem elektrischen"

	para "Blitz stutzen"
	line "kann…"

	para "So etwas werde ich"
	line "niemals zulassen!"

	para "Ich werde dich die"
	line "wahre Kraft der"

	para "Flug-#mon"
	line "spüren lassen!"
	done



FalknerWinLossText:
	text "…Verflixt! Mein"
	line "Vater hat Flug-"
	cont "#mon geliebt…"

	para "Also gut. Nimm"
	line "dies!"

	para "Es ist der"
	line "offizielle"
	cont "FLÜGELORDEN der"
	cont "#mon LIGA."
	done



FalknerZephyrBadgeText:
	text "Der FLÜGELORDEN"
	line "stärkt den ANGR-"
	cont "Wert deiner"
	cont "#mon."

	para "Außerdem können"
	line "deine #mon"

	para "jederzeit BLITZ"
	line "einsetzen."

	para "Hier - ich habe"
	line "noch etwas für"
	cont "dich."
	done



FalknerFightDoneText:
	text "In so mancher"
	line "Stadt warten noch"
	cont "ARENEN auf dich."

	para "Du solltest dein"
	line "Können in diesen"
	cont "ARENEN beweisen."

	para "Ich werde noch"
	line "härter trainieren,"

	para "um der größte Vo-"
	line "gel-Experte aller"
	cont "Zeiten zu werden!"
	done



Bird_keeperRodSeenText:
	text "Das Motto lautet:"
	line "Courage!"

	para "Sie alle hier üben"
	line "Tag und Nacht,"

	para "um Vogel-Meister-"
	line "Trainer zu werden."

	para "Komm schon!"
	done
Bird_keeperRodBeatenText:
	text "Gaaah!"
	done
Bird_keeperAbeSeenText:
	text "Lass mich"
	line "herausfinden, ob"
	cont "du gut genug bist,"
	cont "um gegen FALK"
	cont "anzutreten!"
	done
Bird_keeperAbeBeatenText:
	text "Das kann nicht"
	line "wahr sein!"
	done
VioletGymGuyWinText:
	text "Netter Kampf! Mach"
	line "weiter so und bald"

	para "schon wirst du der"
	line "CHAMP sein!"
	done
VioletGymGuyFalknerAwayText:
	text "Hey! Du kannst"
	line "FALK gerade nicht"
	cont "herausfordern."

	para "Er ist in der"
	line "DUNKELHÖHLE und"
	cont "bändigt einen"

	para "URSARING, das"
	line "einen jungen"
	cont "Trainer"
	cont "angegriffen hat."

	para "Komm später"
	line "wieder."
	done
