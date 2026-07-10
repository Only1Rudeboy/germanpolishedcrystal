ManiasHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, CIANWOOD_CITY, 1
	warp_event  3,  7, CIANWOOD_CITY, 1

	def_coord_events

	def_bg_events
	bg_event  5,  1, BGEVENT_JUMPSTD, radio2
	bg_event  7,  1, BGEVENT_JUMPSTD, picturebookshelf

	def_object_events
	object_event  2,  4, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ManiaScript, -1

ManiaScript:
	faceplayer
	opentext
	checkevent EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM
	iftruefwd .default_postevent
	checkevent EVENT_GOT_SHUCKIE
	iftruefwd .alreadyhaveshuckie
	writetext ManiaText_AskLookAfterShuckie
	yesorno
	iffalsefwd .refusetotakeshuckie
	givepoke SHUCKLE, MALE | PLAIN_FORM, 25, BERRY_JUICE, NET_BALL, POISON_JAB, ShuckieName, ShuckieOTName, KIRK_SHUCKIE_ID
	iffalse_jumpopenedtext ManiaText_PartyAndBoxFull
	writetext ManiaText_TakeCareOfShuckie
	promptbutton
	waitsfx
	writetext ManiaText_GotShuckie
	playsound SFX_KEY_ITEM
	waitsfx
	ifequalfwd 1, .shuckieinparty
	special Special_CurBoxFullCheck
	iffalsefwd .BoxNotFull
	farwritetext _CurBoxFullText
.BoxNotFull
	special GetCurBoxName
	writetext ManiaText_ShuckieSentToPC
	promptbutton
.shuckieinparty
	closetext
	setevent EVENT_GOT_SHUCKIE
	setflag ENGINE_GOT_SHUCKIE_TODAY
	end

.alreadyhaveshuckie
	checkflag ENGINE_GOT_SHUCKIE_TODAY
	iffalsefwd .returnshuckie
	jumpopenedtext ManiaText_TakeCareOfShuckie

.refusetotakeshuckie
	jumpthisopenedtext

	text "Ach nein… was soll"
	line "ich nur tun, wenn"
	cont "er zurückkommt?"
	done

.returnshuckie
	writetext ManiaText_CanIHaveMyMonBack
	yesorno
	iffalsefwd .refused
	special ReturnShuckie
	ifequalfwd $0, .wrong
	ifequalfwd $1, .refused
	ifequalfwd $3, .superhappy
	ifequalfwd $4, .default_postevent
	writetext ManiaText_ThankYou
	waitbutton
	closetext
	setevent EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM
	end

.wrong
	jumpthisopenedtext

	text "Hey, du hast mein"
	line "#mon gar nicht"
	cont "dabei!"
	done

.superhappy
	writetext ManiaText_ShuckieLikesYou
	waitbutton
	closetext
	setevent EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM
	end

.refused
	jumpthisopenedtext

	text "Ach, nein, nein…"
	line "das ist so, als"
	cont "würde man beraubt."
	done

.nothingleft
	jumpthisopenedtext

	text "Wenn ich mein"
	line "#mon zurück-"
	cont "nehme, wer soll"
	cont "für dich kämpfen?"
	done

.default_postevent
	jumpthisopenedtext

	text "Für #mon ist es"
	line "das höchste"

	para "Glück, wenn sie"
	line "bei jemandem sein"

	para "dürfen, der sie"
	line "gut behandelt."
	done

ShuckieName:
	rawchar "Shuckie@"

ShuckieOTName:
	rawchar "Kirk@"

ManiaText_AskLookAfterShuckie:
	text "Ich… ich bin"
	line "schockiert!"

	para "Ein Junge in"
	line "deinem Alter mit"

	para "stechenden Augen"
	line "und langen Haaren"
	cont "kam hier rein."

	para "Er hat mich"
	line "gezwungen, ihm"
	cont "meine"
	cont "preisgekrönten"
	cont "#mon zu geben!"

	para "Ich habe zwar noch"
	line "eines übrig, aber"
	cont "was soll ich tun,"
	cont "wenn er"
	cont "zurückkommt?"

	para "Du siehst stark"
	line "aus. Würdest du"

	para "auf mein #mon"
	line "aufpassen?"
	done
ManiaText_TakeCareOfShuckie:
	text "Ach, ich danke"
	line "dir!"

	para "Bitte pass gut"
	line "darauf auf!"
	done
ManiaText_GotShuckie:
	text "<PLAYER> erhält"
	line "ein #mon."
	done
ManiaText_ShuckieSentToPC:
	text "Das #mon wurde"
	line "nach "
	text_ram wStringBuffer1
	text " geschickt."
	done

ManiaText_PartyAndBoxFull:
	text "Dein #mon-Team"
	line "und die Box sind"
	cont "voll."
	done


ManiaText_CanIHaveMyMonBack:
	text "Hallo! Wie geht es"
	line "meinem #mon?"

	para "Ich glaube, ich"
	line "bin jetzt sicher."
	cont "Kann ich es zurück"
	cont "haben?"
	done




ManiaText_ThankYou:
	text "Danke!"
	done




ManiaText_ShuckieLikesYou:
	text "Mein #mon"
	line "scheint dich zu"
	cont "mögen."

	para "Na gut, dann"
	line "sollst du es"
	cont "behalten. Aber"
	cont "versprich mir, es"
	cont "gut zu behandeln."
	done
