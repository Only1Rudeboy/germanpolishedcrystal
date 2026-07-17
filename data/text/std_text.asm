NurseMornText:
	; GSC-DE dump 7218
	text "Guten Morgen!"
	line "Willkommen im"
	cont "#MON-CENTER!"
	done

NurseDayText:
	; GSC-DE dump 7219
	text "Guten Tag!"
	line "Willkommen im"
	cont "#MON-CENTER."
	done

NurseEveText:
	; evening variant (dump nite base)
	text "Guten Abend!"
	line "Willkommen im"
	cont "#MON-CENTER."
	done

NurseNiteText:
	; GSC-DE dump 7220
	text "Guten Abend!"
	line "Du bist spät dran."

	para "Willkommen im"
	line "#MON-CENTER."
	done

PokeComNurseMornText:
	text "Guten Morgen!"

	para "Dies ist das"
	line "#MON-Kommunika-"
	cont "tionscenter - oder"
	cont "#COM-Center."
	done

PokeComNurseDayText:
	text "Hallo!"

	para "Dies ist das"
	line "#MON-Kommunika-"
	cont "tionscenter - oder"
	cont "#COM-Center."
	done

PokeComNurseEveText:
	text "Guten Abend!"

	para "Dies ist das"
	line "#MON-Kommunika-"
	cont "tionscenter - oder"
	cont "#COM-Center."
	done

PokeComNurseNiteText:
	text "Schön, dich noch"
	line "spät zu sehen."

	para "Dies ist das"
	line "#MON-Kommunika-"
	cont "tionscenter - oder"
	cont "#COM-Center."
	done

NurseAskHealText:
	; GSC: Wir heilen deine #MON und machen sie wieder fit!
	text "Wir heilen deine"
	line "#MON und"
	cont "machen sie wieder"
	cont "fit!"

	para "Sollen wir deine"
	line "#MON heilen?"
	done

NurseTrainerStarText:
	text "Wir heilen deine"
	line "#MON und"
	cont "machen sie wieder"
	cont "fit!"

	para "Sollen wir …"

	para "Dieser"
	line "Trainerausweis!"

	para "Diese tolle"
	line "Farbe! Und dieser"
	cont "glänzende Stern!"

	para "Du bist ein"
	line "beeindruckender"
	cont "Trainer."

	para "Bitte, <PLAYER>,"
	line "darf ich deine"
	cont "#MON heilen?"
	done

NurseTheUsualText:
	text "Schön, dich"
	line "wiederzusehen,"
	cont "<PLAYER>!"

	para "Du willst das"
	line "Übliche, oder?"
	done

NurseTakePokemonText:
	; GSC
	text "O.K. Wir benötigen"
	line "deine #MON."
	done

NurseReturnPokemonText:
	; GSC: topfit
	text "Danke! Deine"
	line "#MON sind"
	cont "wieder topfit!"
	done

NurseGoodbyeText:
	; GSC
	text "Komm jederzeit"
	line "wieder vorbei!"
	done

NursePokerusText:
	text "Deine #MON"
	line "scheinen von"
	para "winzigen"
	line "Lebewesen"
	cont "befallen."
	para "Deine #MON sind"
	line "gesund und"
	cont "scheinen fit."
	para "Aber wir können"
	line "dir in einem"
	para "#MON-CENTER"
	line "nicht mehr sagen."
	done

PokeComNursePokerusText:
	text "Deine #MON"
	line "scheinen von"
	para "winzigen"
	line "Lebewesen"
	cont "befallen."
	para "Deine #MON sind"
	line "gesund und"
	cont "scheinen fit."
	para "Aber mehr können"
	line "wir nicht sagen."
	done

DifficultBookshelfText:
	text "Voller"
	line "schwieriger"
	cont "Bücher."
	done

PictureBookshelfText:
	text "Eine ganze"
	line "Sammlung #MON-"
	cont "Bilderbücher!"
	done

MagazineBookshelfText:
	text "#MON-Magazine…"
	line "#MON-Freund,"

	para "#MON-Handbuch,"
	line "#MON-Graph…"
	done

TeamRocketOathText:
	text "Team Rocket Eid"

	para "Stiehl #MON für"
	line "Profit!"

	para "Nutze #MON für"
	line "Profit aus!"

	para "Alle #MON leben"
	line "für den Ruhm von"
	cont "Team Rocket!"
	done

IncenseBurnerText:
	text "Ein Räuchergefäß!"
	done

MerchandiseShelfText:
	text "Viele #MON-"
	line "Artikel!"
	done

TownMapText:
	text "Die Regionskarte."
	done

DiplomaText:
	text "Die Urkunde."
	done

WindowText:
	text "Mein Spiegelbild!"
	line "Sieht gut aus!"
	done

TVText:
	text "Ein Fernseher."
	done

WrongSideText:
	text "Ups, falsche"
	line "Seite."
	done

RadioOffAirText:
	text "Das Radio spielt"
	line "nur Rauschen…"
	done

RefrigeratorText:
	text "Ein Kühlschrank."
	done

SinkText:
	text "Ein Waschbecken."
	done

StoveText:
	text "Ein Herd."
	done

TrashCanText:
	text "Hier ist nichts"
	line "drin…"
	done

PokeCenterSignText:
	; GSC-DE dump 7245-style
	text "Lass deine"
	line "#MON in einem"
	cont "#MON-CENTER"
	cont "heilen!"
	done

MartSignText:
	text "Für alle deine"
	line "#MON-"
	cont "Bedürfnisse"

	para "#MON-MARKT"
	done

ContestResults_ReadyToJudgeText:
	text "Wir bewerten nun"
	line "die #MON, die"
	cont "du gefangen hast."

	para "…… ……"

	para "Wir haben die"
	line "Sieger gewählt!"

	para "Bist du bereit"
	line "dafür?"
	done

ContestResults_PlayerWonAPrizeText:
	text "<PLAYER>, Platz "
	text_ram wStringBuffer3
	cont "gewinnt"
	cont ""
	text_ram wStringBuffer4
	text "!"
	done

ContestResults_JoinUsNextTimeText:
	text "Sei beim nächsten"
	line "Wettbewerb dabei!"
	done

ContestResults_ConsolationPrizeText:
	text "Alle anderen"
	line "bekommen"
	cont ""
	text_ram wStringBuffer4
	cont "als Trostpreis!"
	done

ContestResults_DidNotWinText:
	text "Viel Erfolg beim"
	line "nächsten Mal."
	done

ContestResults_ReturnPartyText:
	text "Wir geben dir das"
	line "#MON zurück,"

	para "das wir hatten."
	line "Hier, bitte!"
	done

ContestResults_PartyFullText:
	text "Dein Team ist"
	line "voll, also wurde"
	cont "das #MON an"
	cont "BILLs PC gesandt."
	done

GymStatue_CityGymText:
	text_ram wStringBuffer3
	line "PKMN-ARENA"

	para "LEITER:"
	line ""
	text_ram wStringBuffer4
	done

GymStatue_WinningTrainersText:
	text "Siegertrainer:"
	line "<RIVAL>"
	done

GymStatue_TwoWinningTrainersText:
	text "Siegertrainer:"
	line "<RIVAL> <PLAYER>"
	done

GymStatue_ThreeWinningTrainersText:
	text "Siegertrainer:"
	line "<RIVAL> <PLAYER>"
	cont "LYRA"
	done

CoinVendor_WelcomeText:
	text "Willkommen in der"
	line "SPIELHALLE."
	done

CoinVendor_NoCoinCaseText:
	text "Brauchst du"
	line "Spielmünzen?"
	para "Oh, du hast"
	line "keinen Münzbeutel"
	cont "für deine Münzen."
	done

CoinVendor_IntroText:
	text "Brauchst du"
	line "Spielmünzen?"

	para "50 Münzen kosten"
	line "¥1000. Willst du"
	cont "welche?"
	done

CoinVendor_Buy50CoinsText:
	text "Danke! Hier: 50"
	line "Münzen."
	done

CoinVendor_Buy500CoinsText:
	text "Danke! Hier sind"
	line "500 Münzen."
	done

CoinVendor_NotEnoughMoneyText:
	text "Du hast nicht"
	line "genug Geld."
	done

CoinVendor_CoinCaseFullText:
	text "Hoppla! Dein"
	line "Münzbeutel ist"
	cont "voll."
	done

CoinVendor_CancelText:
	text "Keine Münzen für"
	line "dich? Komm"
	cont "wieder!"
	done

BugContestPrizeNoRoomText:
	text "Oh? Deine Tasche"
	line "ist voll."
	para "Wir heben es für"
	line "dich auf, komm"
	para "wieder, wenn"
	line "Platz frei ist."
	done

HappinessText3:
	text "Toll! Du und dein"
	line "#MON seid euch"
	cont "sehr nah!"
	done

HappinessText2:
	text "#MON werden"
	line "freundlicher,"

	para "wenn du Zeit mit"
	line "ihnen verbringst."
	done

HappinessText1:
	text "Du hast dein"
	line "#MON nicht"
	cont "gezähmt."
	para "Bist du nicht"
	line "nett, schmollt es."
	done

; GSC-DE: "<PLAYER> speichert" / "NAMEs Nummer."
RegisteredNumber1Text:
	text "<PLAYER> speichert"
	line ""
	text_ram wStringBuffer3
	text "s Nummer."
	done

; GSC-DE: gleiche Formel (m/f)
RegisteredNumber2Text:
	text "<PLAYER> speichert"
	line ""
	text_ram wStringBuffer3
	text "s Nummer."
	done

VendingMachineText:
	text "Ein Automat! Hier"
	line "ist das Menü."
	done

VendingMachineClangText:
	text "Klong!"

	para ""
	text_ram wStringBuffer3
	line "fiel heraus."
	done

VendingMachineScoreText:
	text "Treffer! Ein"
	line "extra"
	cont ""
	text_ram wStringBuffer3
	cont "fiel heraus."
	done

VendingMachineNoMoneyText:
	text "Ups, nicht genug"
	line "Geld…"
	done

VendingMachineNoSpaceText:
	text "Kein Platz mehr"
	line "für Sachen…"
	done

HiddenGrottoText:
	text "Schau! Ein"
	line "schmaler Pfad!"

	para "Willst du ihm"
	line "folgen?"
	done
