GoldenrodBillsHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 4
	warp_event  3,  7, GOLDENROD_CITY, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 2, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BillsGrandpa, -1
	object_event  5,  3, SPRITE_MATRON, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BillsMom, -1
	object_event  5,  4, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BillsSister, -1

BillsGrandpa:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue_jumptextfaceplayer BillsGrandpaComeAgainText
	checkevent EVENT_GOT_SHINY_STONE_FROM_BILLS_GRANDPA
	iftrue_jumptextfaceplayer BillsGrandpaShownAllThePokemonText
	faceplayer
	opentext
	checkevent EVENT_MET_BILLS_GRANDPA
	iftruefwd .MetGrandpa
	writetext BillsGrandpaIntroText
	promptbutton
	setevent EVENT_MET_BILLS_GRANDPA
.MetGrandpa:
	checkevent EVENT_SHOWED_TOGEPI_TO_BILLS_GRANDPA
	iftrue .ShowedTogepi
	checkevent EVENT_SHOWED_MURKROW_TO_BILLS_GRANDPA
	iftrue .ShowedMurkrow
	checkevent EVENT_SHOWED_ODDISH_TO_BILLS_GRANDPA
	iftrue .ShowedOddish
	checkevent EVENT_SHOWED_JIGGLYPUFF_TO_BILLS_GRANDPA
	iftrue .ShowedJigglypuff
	checkevent EVENT_SHOWED_PICHU_TO_BILLS_GRANDPA
	iftrue .ShowedPichu
	checkevent EVENT_SHOWED_GROWLITHE_TO_BILLS_GRANDPA
	iftrue .ShowedGrowlithe
	checkevent EVENT_SHOWED_STARYU_TO_BILLS_GRANDPA
	iftrue .ShowedStaryu
	checkevent EVENT_SHOWED_BELLSPROUT_TO_BILLS_GRANDPA
	iftrue .ShowedBellsprout
	checkevent EVENT_SHOWED_SNUBBULL_TO_BILLS_GRANDPA
	iftrue .ShowedSnubbull
	writetext BillsGrandpaSnubbullText
	promptbutton
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	scall .ExcitedToSee
	special Special_BillsGrandfather
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	ifnotequal SNUBBULL, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_SNUBBULL_TO_BILLS_GRANDPA
	sjumpfwd .ShowedSnubbull

.GotEverstone:
	writetext BillsGrandpaBellsproutText
	promptbutton
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	scall .ExcitedToSee
	special Special_BillsGrandfather
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	ifnotequal BELLSPROUT, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_BELLSPROUT_TO_BILLS_GRANDPA
	sjumpfwd .ShowedBellsprout

.GotLeafStone:
	writetext BillsGrandpaStaryuText
	promptbutton
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	scall .ExcitedToSee
	special Special_BillsGrandfather
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	ifnotequal STARYU, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_STARYU_TO_BILLS_GRANDPA
	sjumpfwd .ShowedStaryu

.GotWaterStone:
	writetext BillsGrandpaGrowlitheText
	promptbutton
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	scall .ExcitedToSee
	special Special_BillsGrandfather
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	ifnotequal GROWLITHE, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_GROWLITHE_TO_BILLS_GRANDPA
	sjumpfwd .ShowedGrowlithe

.GotFireStone:
	writetext BillsGrandpaPichuText
	promptbutton
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	scall .ExcitedToSee
	special Special_BillsGrandfather
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	ifnotequal PICHU, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_PICHU_TO_BILLS_GRANDPA
	sjumpfwd .ShowedPichu

.GotThunderstone:
	writetext BillsGrandpaJigglypuffText
	promptbutton
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	scall .ExcitedToSee
	special Special_BillsGrandfather
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	ifnotequal JIGGLYPUFF, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_JIGGLYPUFF_TO_BILLS_GRANDPA
	sjumpfwd .ShowedJigglypuff

.GotMoonStone:
	writetext BillsGrandpaOddishText
	promptbutton
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	scall .ExcitedToSee
	special Special_BillsGrandfather
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	ifnotequal ODDISH, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_ODDISH_TO_BILLS_GRANDPA
	sjumpfwd .ShowedOddish

.GotSunStone:
	writetext BillsGrandpaMurkrowText
	promptbutton
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	scall .ExcitedToSee
	special Special_BillsGrandfather
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	ifnotequal MURKROW, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_MURKROW_TO_BILLS_GRANDPA
	sjumpfwd .ShowedMurkrow

.GotDuskStone:
	writetext BillsGrandpaTogepiText
	promptbutton
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	scall .ExcitedToSee
	special Special_BillsGrandfather
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	ifnotequal TOGEPI, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_TOGEPI_TO_BILLS_GRANDPA
	sjumpfwd .ShowedTogepi

.ShowedSnubbull:
	checkevent EVENT_GOT_EVERSTONE_FROM_BILLS_GRANDPA
	iftrue .GotEverstone
	scall .ReceiveItem
	verbosegiveitem EVERSTONE
	iffalse_endtext
	setevent EVENT_GOT_EVERSTONE_FROM_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	endtext

.ShowedBellsprout:
	checkevent EVENT_GOT_LEAF_STONE_FROM_BILLS_GRANDPA
	iftrue .GotLeafStone
	scall .ReceiveItem
	verbosegiveitem LEAF_STONE
	iffalse_endtext
	setevent EVENT_GOT_LEAF_STONE_FROM_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	endtext

.ShowedStaryu:
	checkevent EVENT_GOT_WATER_STONE_FROM_BILLS_GRANDPA
	iftrue .GotWaterStone
	scall .ReceiveItem
	verbosegiveitem WATER_STONE
	iffalse_endtext
	setevent EVENT_GOT_WATER_STONE_FROM_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	endtext

.ShowedGrowlithe:
	checkevent EVENT_GOT_FIRE_STONE_FROM_BILLS_GRANDPA
	iftrue .GotFireStone
	scall .ReceiveItem
	verbosegiveitem FIRE_STONE
	iffalse_endtext
	setevent EVENT_GOT_FIRE_STONE_FROM_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	endtext

.ShowedPichu:
	checkevent EVENT_GOT_THUNDERSTONE_FROM_BILLS_GRANDPA
	iftrue .GotThunderstone
	scall .ReceiveItem
	verbosegiveitem THUNDERSTONE
	iffalse_endtext
	setevent EVENT_GOT_THUNDERSTONE_FROM_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	endtext

.ShowedJigglypuff:
	checkevent EVENT_GOT_MOON_STONE_FROM_BILLS_GRANDPA
	iftrue .GotMoonStone
	scall .ReceiveItem
	verbosegiveitem MOON_STONE
	iffalse_endtext
	setevent EVENT_GOT_MOON_STONE_FROM_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	endtext

.ShowedOddish:
	checkevent EVENT_GOT_SUN_STONE_FROM_BILLS_GRANDPA
	iftrue .GotSunStone
	scall .ReceiveItem
	verbosegiveitem SUN_STONE
	iffalse_endtext
	setevent EVENT_GOT_SUN_STONE_FROM_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	endtext

.ShowedMurkrow:
	checkevent EVENT_GOT_DUSK_STONE_FROM_BILLS_GRANDPA
	iftrue .GotDuskStone
	scall .ReceiveItem
	verbosegiveitem DUSK_STONE
	iffalse_endtext
	setevent EVENT_GOT_DUSK_STONE_FROM_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	endtext

.ShowedTogepi:
	scall .ReceiveItem
	verbosegiveitem SHINY_STONE
	iffalse_endtext
	setevent EVENT_GOT_SHINY_STONE_FROM_BILLS_GRANDPA
	endtext

.ExcitedToSee:
	writetext BillsGrandpaExcitedToSeeText
	promptbutton
	end

.CorrectPokemon:
	writetext BillsGrandpaShownPokemonText
	promptbutton
	end

.ReceiveItem:
	writetext BillsGrandpaTokenOfAppreciationText
	promptbutton
	end

.WrongPokemon:
	jumpthisopenedtext

	; GSC-DE Dump (Kanto-Opa-Dialog, gleicher Wortlaut)
	text "Hm?"

	para "Das ist nicht das"
	line "#MON, von dem"
	cont "ich gehört habe."
	done

BillsMom:
	checkevent EVENT_NEVER_MET_BILL
	iffalse_jumptextfaceplayer BillsMomText_AfterEcruteak
	jumpthistextfaceplayer

	; GSC-DE Dump
	text "Oh, du sammelst"
	line "#MON? Mein Sohn"
	cont "BILL ist ein"
	cont "Experte."

	para "Er wurde gerade in"
	line "das #MON-CENTER"

	para "von TEAK CITY"
	line "gerufen."

	para "Mein Mann ging in"
	line "die SPIELHALLE,"

	para "ohne angerufen"
	line "zu werden…"
	done

BillsSister:
	faceplayer
	opentext
	checkcellnum PHONE_BILL
	iftruefwd .GotBillsNumber
	writetext BillsSisterUsefulNumberText
	askforphonenumber PHONE_BILL
	ifequalfwd $1, .NoRoom
	ifequalfwd $2, .Refused
	waitsfx
	addcellnum PHONE_BILL
	writetext RecordedBillsNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	promptbutton
.GotBillsNumber:
	jumpthisopenedtext

	; GSC-DE Dump
	text "Mein großer Bruder"
	line "BILL hat das"
	cont "PC-#MON-LAGER-"
	cont "UNGS-SYSTEM erfun-"
	cont "den."
	done

.NoRoom:
	writetext BillsSisterPhoneFullText
	promptbutton
.Refused:
	jumpthisopenedtext

	; GSC-DE Dump
	text "Mein Bruder hat"
	line "das PC-#MON-"
	cont "LAGERUNGS-SYSTEM"
	cont "erfunden."

	para "Ich wollte dir ge-"
	line "rade BILLs Nummer"
	cont "geben…"
	done

BillsGrandpaIntroText:
	; Johto-Variante (Dump Kanto: JOHTO; hier KANTO)
	text "Hm? Kennst du"
	line "BILL? Er ist mein"
	cont "Enkel."

	para "Er ist in KANTO."
	line "Er kümmert sich"

	para "um PCs und ich"
	line "passe auf das"
	cont "Haus auf."
	done

BillsGrandpaAskToSeeMonText:
	; GSC-DE Dump
	text "Hast du dieses"
	line "#MON? Darf ich"
	cont "es sehen?"
	done

BillsGrandpaExcitedToSeeText:
	; GSC-DE Dump
	text "Du zeigst es mir?"
	line "Wie lieb von dir!"
	done

BillsGrandpaYouDontHaveItTextText:
	; GSC-DE Dump
	text "Du hast es nicht?"
	line "Das ist schade…"
	done

BillsGrandpaShownPokemonText:
	; GSC-DE Dump
	text "Ah, das ist "
	text_ram wStringBuffer3
	text "?"

	para "Ist das nicht"
	line "niedlich!"
	cont "Das ist nett "
	cont "von dir."
	done

BillsGrandpaTokenOfAppreciationText:
	; GSC-DE Dump
	text "Danke!"

	para "Das ist ein"
	line "Zeichen meiner"
	cont "Anerkennung."
	done

BillsGrandpaComeAgainText:
	; GSC-DE Dump
	text "Besuche mich bitte"
	line "wieder."
	done

BillsGrandpaShownAllThePokemonText:
	; GSC-DE Dump
	text "Danke, dass du mir"
	line "so viele niedliche"
	cont "#MON gezeigt"
	cont "hast."

	para "Ich habe mich"
	line "wirklich amüsiert."

	para "Ich bin froh, dass"
	line "ich das noch"
	cont "erleben durfte."
	done

BillsGrandpaSnubbullText:
	; Johto-Quest (kein 1:1 Dump-Anker)
	text "Mein Enkel BILL"
	line "erzählte mir von"

	para "einem kleinen,"
	line "rosa hundartigen"
	cont "#MON mit blauen"
	cont "Tupfen."
	done

BillsGrandpaTogepiText:
	; Johto-Quest
	text "Kennst du ein"
	line "#MON mit einer"

	para "Schale voller"
	line "roter und blauer"
	cont "Dreiecke?"

	para "Es soll ein Symbol"
	line "für Glück sein."
	done

BillsGrandpaMurkrowText:
	; Johto-Quest
	text "Kennst du ein"
	line "Vogel-#MON mit"

	para "einem krummen"
	line "gelben Schnabel"
	cont "und schwarzem"
	cont "Gefieder?"

	para "Ich hörte, es"
	line "erscheint NACHTs."

	para "Ich würde es gerne"
	line "sehen."
	done

BillsGrandpaOddishText:
	; Dump-nah (Kanto-Variante grün→hier blau/Johto-Liste)
	text "Ach, mein Enkel"
	line "erwähnte ein"

	para "rundes, blaues"
	line "#MON mit"
	cont "Blättern auf dem"
	cont "Kopf."
	done

BillsGrandpaJigglypuffText:
	; Johto-Quest
	text "BILL erzählte mir"
	line "von einem rosa"

	para "#MON mit einer"
	line "hypnotischen"
	cont "Gesangsstimme."
	done

BillsGrandpaBellsproutText:
	; Johto-Quest
	text "Mein Enkel BILL"
	line "erwähnte ein"

	para "grünes #MON,"
	line "das auf seinen"
	cont "Wurzeln läuft."
	done

BillsGrandpaStaryuText:
	; GSC-DE Dump
	text "Kennst du ein"
	line "Wasser-#MON"

	para "mit einer roten"
	line "Kugel im Körper?"

	para "Es sieht aus wie"
	line "ein Stern!"

	para "Ich hörte, es"
	line "taucht NACHTs auf."

	para "Ich würde es gerne"
	line "sehen."
	done

BillsGrandpaGrowlitheText:
	; GSC-DE Dump
	text "BILL erzählte mir"
	line "von einem #MON,"

	para "das seinem Trainer"
	line "gegenüber sehr"
	cont "loyal ist."

	para "Es scheint ein"
	line "guter BRÜLLER zu"
	cont "sein."
	done

BillsGrandpaPichuText:
	; GSC-DE Dump
	text "Kennst du dieses"
	line "sehr beliebte"
	cont "#MON?"

	para "Das #MON, mit"
	line "dem gelben Körper"
	cont "und den roten"
	cont "Wangen."

	para "Ich würde gerne"
	line "sehen, wie es vor"

	para "seiner Entwicklung"
	line "aussieht."
	done

BillsMomText_AfterEcruteak:
	; GSC-DE Dump
	text "Mein Mann war als"
	line "#MANIAC "

	para "bekannt. BILL"
	line "muss nach seinem"
	cont "Vater kommen."
	done

BillsSisterUsefulNumberText:
	; GSC-DE Dump
	text "Bist du ein"
	line "Trainer?"

	para "Ich habe eine"
	line "nützliche Telefon-"
	cont "nummer für dich."
	done

RecordedBillsNumberText:
	; GSC-DE Dump
	text "<PLAYER> speichert"
	line "BILLs Nummer."
	done

BillsSisterPhoneFullText:
	; GSC-DE Dump
	text "Du kannst keine"
	line "Nummern mehr spei-"
	cont "chern."
	done
