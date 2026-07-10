IcePathB3F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  5, ICE_PATH_B2F_MAHOGANY_SIDE, 2
	warp_event 15,  5, ICE_PATH_B2F_BLACKTHORN_SIDE, 2

	def_coord_events

	def_bg_events
	bg_event 16,  3, BGEVENT_JUMPTEXT, Text_IcePathB3FIceRock

	def_object_events
	object_event 10,  3, SPRITE_LORELEI, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, LoreleiScript, -1
	itemball_event  5,  7, NEVERMELTICE, 1, EVENT_ICE_PATH_B3F_NEVERMELTICE
	smashrock_event  6, 6

	object_const_def
	const ICEPATHB3F_LORELEI

LoreleiScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd LoreleiRematchScript
	checkevent EVENT_BEAT_LORELEI
	iftruefwd LoreleiAfterScript
	checkevent EVENT_INTRODUCED_LORELEI
	iftruefwd LoreleiAfterIntroScript
	writetext LoreleiIntroText
	waitbutton
	setevent EVENT_INTRODUCED_LORELEI
LoreleiAfterIntroScript:
	writetext LoreleiAfterIntroText
	yesorno
	iffalse_jumpopenedtext LoreleiNoBattleText
	writetext LoreleiSeenText
	waitbutton
	closetext
	winlosstext LoreleiBeatenText, 0
	setlasttalked ICEPATHB3F_LORELEI
	loadtrainer LORELEI, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_LORELEI
	opentext
	writetext LoreleiRewardText
	promptbutton
	verbosegiveitem ICY_ROCK
	iffalsefwd LoreleiAfterScript
	setevent EVENT_GOT_ICY_ROCK_FROM_LORELEI
LoreleiAfterScript:
	readvar VAR_BADGES
	ifequalfwd NUM_JOHTO_BADGES, .AllEightBadges
	writetext LoreleiOneMoreBadgeText
	sjumpfwd .Finish

.AllEightBadges:
	writetext LoreleiAllBadgesText
.Finish
	promptbutton
	jumpthisopenedtext

	text "Wenn du sie"
	line "besiegst, triff"
	cont "mich hier für"
	cont "ein Rematch."
	done

LoreleiRematchScript:
	checkevent EVENT_BEAT_LORELEI_AGAIN
	iffalsefwd .DoRematch
	checkevent EVENT_GOT_ICY_ROCK_FROM_LORELEI
	iftrue_jumpopenedtext LoreleiRematchAfterText
	opentext
	sjumpfwd LoreleiGiveIcyRock
.DoRematch:
	checkevent EVENT_INTRODUCED_LORELEI
	iftruefwd LoreleiReintroductionScript
	writetext LoreleiIntroText
	waitbutton
	setevent EVENT_INTRODUCED_LORELEI
LoreleiAfterRematchIntroScript:
	writetext LoreleiRematchSeenText
	waitbutton
	closetext
	winlosstext LoreleiRematchBeatenText, 0
	setlasttalked ICEPATHB3F_LORELEI
	loadtrainer LORELEI, 3
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_LORELEI_AGAIN
	opentext
	checkevent EVENT_GOT_ICY_ROCK_FROM_LORELEI
	iftrue_jumpopenedtext LoreleiRematchAfterText
LoreleiGiveIcyRock:
	writetext LoreleiRewardText
	promptbutton
	verbosegiveitem ICY_ROCK
	iffalse_jumpopenedtext LoreleiRematchAfterText
	setevent EVENT_GOT_ICY_ROCK_FROM_LORELEI
	jumpthisopenedtext

LoreleiRematchAfterText:
	text "Deine Reise ist"
	line "noch nicht"
	cont "vorbei."

	para "Du kannst in"
	line "Kanto"
	line "mehr Orden"
	cont "sammeln,"

	para "neue #mon-Arten"
	line "fangen,"

	para "dich und dein"
	line "Team"
	line "verbessern."

	para "Ein #mon-"
	line "Meister zu werden"
	cont "ist Lebensarbeit."
	done

LoreleiReintroductionScript:
	writetext LoreleiRematchIntroAgainText
	waitbutton
	sjump LoreleiAfterRematchIntroScript

Text_IcePathB3FIceRock:
	text "Der Felsbrocken"
	line "ist"
	line "mit Eis"
	cont "überzogen."

	para "Er ist eiskalt"
	line "zum Anfassen."
	done

LoreleiIntroText:
	text "Lorelei: Hallo"
	line "da, Trainer."
	cont "Ich bin Lorelei."

	para "Siehst du den"
	line "eisigen Fels"
	cont "dort drüben?"

	para "Er sendet eine"
	line "Energie aus, die"
	line "ich in"
	cont "Kanto noch"
	cont "nie sah."

	para "Als Expertin für"
	line "Eis-#mon musste"
	cont "ich das unter-"
	cont "suchen."

	para "Was machst du"
	line "denn hier?"
	done

LoreleiAfterIntroText:
	text "Lorelei: Du"
	line "nimmst an der"

	para "#mon-Liga-"
	line "Herausforderung"
	cont "teil. Wie"
	cont "ironisch."

	para "Soll ich dein"
	line "Können testen?"
	done

LoreleiNoBattleText:
	text "Wenn du mir nicht"
	line "standhalten"

	para "kannst, wirst du"
	line "den CHAMP nie"
	cont "besiegen."
	done

LoreleiSeenText:
	text "Hahaha! Mach dich"
	line "bereit, ganz"
	cont "eingefroren zu"
	cont "werden!"
	done

LoreleiBeatenText:
	text "Du bist besser,"
	line "als ich dachte!"
	done

LoreleiRewardText:
	text "Du weißt, wie man"
	line "mit Eis-#mon"
	cont "umgeht."

	para "Dann kannst du"
	line "das hier nutzen."
	done

LoreleiRematchIntroAgainText:
	text "Lorelei: Hallo"
	line "wieder,"
	cont "<PLAYER>."
	done

LoreleiRematchSeenText:
	text "Du hast also"
	line "die Top Vier"

	para "besiegt? Ich"
	line "hoffe, Melanie"
	cont "hast du auch"
	cont "besiegt."

	para "…………Du bist der"
	line "neue CHAMP."
	cont "Beeindruckend."

	para "Dann muss ich"
	line "mich nicht"
	cont "zurückhalten!"
	done

LoreleiRematchBeatenText:
	text "Wie man es vom"
	line "CHAMP erwartet!"
	done

LoreleiOneMoreBadgeText:
	text "Geh nur weiter."
	line "Mit einem Orden"

	para "mehr kannst du"
	line "die #mon-Liga"
	cont "herausfordern."
	done

LoreleiAllBadgesText:
	text "Geh nur weiter."
	line "Du hast genug"
	cont "Orden,"

	para "um die #mon-"
	line "Liga"
	cont "herausfordern."
	done
