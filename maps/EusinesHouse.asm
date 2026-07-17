EusinesHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, CELADON_CITY, 14
	warp_event  3,  7, CELADON_CITY, 14

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_EUSINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonEusine, EVENT_EUSINES_HOUSE_EUSINE
	object_event  5,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, EusinesHouseGrampsScript, -1

	object_const_def
	const EUSINESHOUSE_EUSINE

CeladonEusine:
	faceplayer
	opentext
	writetext CeladonEusineText1
	promptbutton
	special SpecialBeastsCheck
	iftruefwd .HoOh
	writetext EusineNoBeastsText
	waitbutton
	closetext
	checkflag ENGINE_PLAYER_CAUGHT_RAIKOU
	iftruefwd .OwnRaikou
	showtext EusineShowsRaikouText
	reanchormap
	pokepic RAIKOU
	cry RAIKOU
	waitbutton
	closepokepic
	setmonval RAIKOU
	special SpecialSeenMon
.OwnRaikou
	checkflag ENGINE_PLAYER_CAUGHT_ENTEI
	iftruefwd .OwnEntei
	showtext EusineShowsEnteiText
	reanchormap
	pokepic ENTEI
	cry ENTEI
	waitbutton
	closepokepic
	setmonval ENTEI
	special SpecialSeenMon
.OwnEntei
	checkflag ENGINE_PLAYER_CAUGHT_SUICUNE
	iftruefwd .OwnSuicune
	showtext EusineShowsSuicuneText
	reanchormap
	pokepic SUICUNE
	cry SUICUNE
	waitbutton
	closepokepic
	setmonval SUICUNE
	special SpecialSeenMon
.OwnSuicune
	jumpthistext

	text "Wenn du auch nur"
	line "eins fängst, hoffe"
	cont "ich, dass du mir"
	cont "Bescheid sagst."
	para "Ich zähle auf"
	line "dich, <PLAYER>!"
	done

.HoOh:
	writetext EusineLeavesCeladonText
	waitbutton
	closetext
	readvar VAR_FACING
	ifnotequal UP, .PathClear
	applymovement PLAYER, .PlayerStepsAsideMovement
.PathClear:
	applymovement EUSINESHOUSE_EUSINE, .EusineLeavesMovement
	disappear EUSINESHOUSE_EUSINE
	playsound SFX_EXIT_BUILDING
	waitsfx
	end

.PlayerStepsAsideMovement:
	step_left
	turn_head_right
	step_end

.EusineLeavesMovement:
	step_down
	step_down
	step_down
	step_down
	step_end

EusinesHouseGrampsScript:
	checkevent EVENT_EUSINES_HOUSE_EUSINE
	iffalse_jumptextfaceplayer EusinesHouseGrampsGrandsonHomeText
	checkevent EVENT_FOUGHT_SUICUNE
	iffalse_jumptextfaceplayer EusinesHouseGrampsEusineSearchingForSuicuneText
	checkevent EVENT_DECO_ABRA_DOLL
	iftrue_jumptextfaceplayer EusinesHouseGrampsEusineTravelingWorldText
	checkevent EVENT_FOUGHT_HO_OH
	iftruefwd .AfterHoOhFight
	jumpthistextfaceplayer

	text "Mein Enkel EUSIN"
	line "ist auf einem"

	para "neuen Abenteuer."
	line "Er ging zum"

	para "ZINNTURM in"
	line "TEAK CITY."
	done

.AfterHoOhFight:
	faceplayer
	opentext
	writetext EusinesHouseGrampsThankYouGiftText
	waitbutton
	writetext ReceivedAbraDollText
	playsound SFX_ITEM
	pause 60
	waitbutton
	writetext AbraDollSentHomeText
	setevent EVENT_DECO_ABRA_DOLL
	waitbutton
	closetext
	end

ReceivedAbraDollText:
	text "<PLAYER> erhält"
	line "ABRA-Puppe."
	done

AbraDollSentHomeText:
	text "ABRA-Puppe wurde"
	line "nach Hause"
	cont "geschickt."
	done

CeladonEusineText1:
	text "EUSIN: Hallo!"
	para "Ich komme gerade"
	line "von meinem"
	cont "Heimatort zurück."
	cont "Es ist schon lange"
	cont "her."
	done
EusineLeavesCeladonText:
	text "<PLAYER>, hast du"
	line "das schon gehört?"

	para "Es gibt neue"
	line "Gerüchte über ein"

	para "regenbogenfarbene"
	line "#MON am"
	cont "ZINNTURM."

	para "Mein Team wurde"
	line "gerade geheilt,"

	para "also geht's jetzt"
	line "nach TEAK CITY."

	para "Wir sehen uns,"
	line "<PLAYER>!"
	done

EusineNoBeastsText:
	text "Ach, übrigens,"
	line "<PLAYER>."
	para "Hast du die"
	line "legendären Bestien"
	cont "gefangen?"
	para "… … … … … …"
	para "O.K. …"
	para "Ich gebe dir meine"
	line "Notizen."
	done

EusineShowsRaikouText:
	text "Das ist RAIKOU:"
	done

EusineShowsEnteiText:
	text "Das ist ENTEI:"
	done

EusineShowsSuicuneText:
	text "Das ist natürlich"
	line "SUICUNE:"
	done


EusinesHouseGrampsGrandsonHomeText:
	text "Mein Enkel ist"
	line "nach Hause"
	cont "gekommen!"

	para "Ich bin"
	line "überglücklich!"
	done

EusinesHouseGrampsEusineSearchingForSuicuneText:
	text "Mein Enkel EUSIN"
	line "ist in JOHTO"
	para "und sucht SUICUNE"
	line "überall."
	para "Ich habe ihm alles"
	line "über die"
	cont "legendären #MON"
	cont "beigebracht!"
	done


EusinesHouseGrampsThankYouGiftText:
	text "Mein Enkel EUSIN"
	line "hat angerufen."

	para "Es geht ihm gut."
	line "Das freut mich!"

	para "Danke, dass du"
	line "nach mir schaust,"
	cont "<PLAYER>!"

	para "Nimm das hier als"
	line "Dankeschön."
	done

EusinesHouseGrampsEusineTravelingWorldText:
	text "EUSIN ist"
	line "unterwegs und"
	cont "bereist die Welt."

	para "Ich bin so stolz"
	line "auf ihn!"
	done
