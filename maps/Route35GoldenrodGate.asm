Route35GoldenrodGate_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4,  0, ROUTE_35, 1
	warp_event  5,  0, ROUTE_35, 2
	warp_event  4,  7, GOLDENROD_CITY, 12
	warp_event  5,  7, GOLDENROD_CITY, 12

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RandyScript, -1
	object_event  6,  4, SPRITE_BREEDER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Route35GoldenrodGatePokefanFScript, -1
	object_event  3,  2, SPRITE_FAT_GUY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route35GoldenrodGateFisherText, -1

RandyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HP_UP_FROM_RANDY
	iftruefwd .gothpup
	checkevent EVENT_GAVE_KENYA
	iftruefwd .questcomplete
	checkevent EVENT_GOT_KENYA
	iftruefwd .alreadyhavekenya
	writetext Route35GoldenrodGateRandyAskTakeThisMonToMyFriendText
	yesorno
	iffalsefwd .refused
	readvar VAR_PARTYCOUNT
	ifequalfwd PARTY_LENGTH, .partyfull
	writetext Route35GoldenrodGateRandyThanksText
	promptbutton
	waitsfx
	writetext Route35GoldenrodGatePlayerReceivedAMonWithMailText
	playsound SFX_KEY_ITEM
	waitsfx
	givepoke SPEAROW, FEMALE | PLAIN_FORM, 10, NO_ITEM, NET_BALL, NO_MOVE, GiftSpearowName, GiftSpearowOTName, 01001
	givepokemail GiftSpearowMail
	setevent EVENT_GOT_KENYA
.alreadyhavekenya
	jumpthisopenedtext

	text "Du darfst ihn le-"
	line "sen, aber"
	cont "verliere"
	cont "ihn nicht!"
	cont "ROUTE 31!"

	para "Stimmt! Ein"
	line "merkwürdiger"
	cont "Baum hat die"
	cont "Straße blockiert."

	para "Ich frage mich,"
	line "ob die Straße"
	cont "jetzt frei ist."
	done

.partyfull
	jumpthisopenedtext

	text "Du kannst kein"
	line "weiteres #mon"
	cont "mehr tragen…"
	done

.refused
	jumpthisopenedtext

	text "Oh… Dann"
	line "geht das in"
	cont "Ordnung…"
	done

.questcomplete
	writetext Route35GoldenrodGateRandySomethingForYourTroubleText
	promptbutton
	verbosegiveitem HP_UP
	iffalsefwd .bagfull
	setevent EVENT_GOT_HP_UP_FROM_RANDY
.gothpup
	writetext Route35GoldenrodGateRandyMyPalWasSnoozingRightText
	waitbutton
.bagfull
	endtext

GiftSpearowMail:
	db   FLOWER_MAIL
	setcharmap no_ngrams
	db   "Dark Cave leads"
	next "to another road@"
	setcharmap default

GiftSpearowName:
	rawchar "Kenya@"

GiftSpearowOTName:
	rawchar "Randy@"

Route35GoldenrodGatePokefanFScript:
	faceplayer
	opentext
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftruefwd .aftersudowoodo
	jumpthisopenedtext

	text "Ein merkwürdiger"
	line "Baum blockiert"
	cont "die Straße."

	para "Er wackelt, wenn"
	line "man mit ihm"
	cont "spricht."

	para "Ich hörte, er"
	line "wurde wild, als"

	para "jemand ihn mit"
	line "einer SCHIGGY-"
	cont "KANNE gegossen"
	cont "hat."
	done

.aftersudowoodo
	jumpthisopenedtext

	text "Ich mag das #-"
	line "MON-Schlaflied,"
	cont "das im Radio"
	cont "gespielt wird."
	done

Route35GoldenrodGateRandyAskTakeThisMonToMyFriendText:
	text "Entschuldige,"
	line "bitte!"
	cont "Könntest du mir"
	cont "einen Gefallen"
	cont "tun?"

	para "Könntest du"
	line "dieses"
	line "#mon, das einen"
	cont "BRIEF trägt,"
	cont "zu meinem Freund"
	cont "bringen?"

	para "Du findest ihn"
	line "auf ROUTE 31."
	done


Route35GoldenrodGateRandyThanksText:
	text "Das würdest du"
	line "tun? Super!"
	cont "Vielen Dank!"

	para "Mein Freund ist"
	line "ein Flegel!"
	cont "Er schläft die"
	cont "ganze Zeit."

	para "Du wirst ihn"
	line "sofort erkennen!"
	done


Route35GoldenrodGatePlayerReceivedAMonWithMailText:
	text "<PLAYER> hat ein"
	line "#mon, das einen"

	para "BRIEF trägt,"
	line "erhalten."
	done


Route35GoldenrodGateRandySomethingForYourTroubleText:
	text "Ich danke dir!"
	line "Du hast die"
	cont "Lieferung für"
	cont "mich"
	cont "erledigt!"

	para "Ich habe hier"
	line "etwas für dich"
	cont "wegen der Un-"
	cont "annehmlichkeiten!"
	done


Route35GoldenrodGateRandyMyPalWasSnoozingRightText:
	text "Mein Freund hat"
	line "geschlafen, nicht"
	cont "wahr? Na, was"
	cont "habe ich dir"
	cont "gesagt?"
	done


Route35GoldenrodGateFisherText:
	text "Ich frage mich,"
	line "wie viele Arten"

	para "von #mon es"
	line "wohl geben mag."

	para "Vor drei Jahren"
	line "hat PROF. EICH"

	para "verlautbart, dass"
	line "es 150 verschie-"
	cont "dene Arten geben"
	cont "soll."
	done


