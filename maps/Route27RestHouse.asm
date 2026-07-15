Route27RestHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, ROUTE_27, 1
	warp_event  3,  7, ROUTE_27, 1

	def_coord_events

	def_bg_events
	bg_event  7,  1, BGEVENT_JUMPSTD, difficultbookshelf

	def_object_events
	object_event  2,  4, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Route27RestHouseGranny, -1

Route27RestHouseGranny:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_SKILL_SWAP_INTRO
	iftruefwd .HeardIntro
	writetext .IntroText
	setevent EVENT_LISTENED_TO_SKILL_SWAP_INTRO
	sjumpfwd .Continue
.HeardIntro
	writetext .HeardIntroText
.Continue
	promptbutton
	special GetFirstPokemonHappiness
	ifgreater FRIEND_BALL_HAPPINESS - 1, .Loyal
	jumpthisopenedtext

	text "Falls es dir nicht"
	line "mehr Vertrauen"
	para "schenkt, wird es"
	line "schwer für dich."
	para "Vertrauen ist der"
	line "Bund zwischen"
	cont "#mon und den"
	cont "Trainern."
	done
.Loyal:
	writetext .QuestionText
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	yesorno
	iffalsefwd .TutorRefused
	setval SKILL_SWAP
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpopenedtext .RefusedText

.NoSilverLeaf
	waitbutton
	jumpthisopenedtext

	text "Du hast kein"
	line "Silberblatt"
	cont "gefunden…"
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "Skill Swap ist"
	line "eine Attacke,"
	para "die deine"
	line "Fähigkeit mit der"
	cont "deines Gegners"
	cont "tauscht."
	para "Nur für erfahrene"
	line "Trainer!"
	para "Nutze sie, wenn du"
	line "dich traust. Viel"
	cont "Glück!"
	done

.IntroText:
	text "Wohin geht die"
	line "Reise mit #mon?"
	para "Zur #mon-Liga?"
	para "Sind deine #mon"
	line "treu genug für den"
	cont "Sieg?"
	para "Mal sehen …"
	done

.HeardIntroText:
	text "Lass mich deine"
	line "#mon sehen…"
	done

.QuestionText:
	text "Ah! Dein #mon"
	line "vertraut dir sehr."
	para "Schön, einen guten"
	line "Trainer zu sehen."
	para "Ich kann ihm meine"
	line "Geheimtechnik"
	cont "Skill Swap"
	cont "beibringen."
	para "Wenn du willst,"
	line "natürlich."
	done

.RefusedText:
	text "Viel Glück auf"
	line "deiner Reise."
	done
