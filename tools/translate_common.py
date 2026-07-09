#!/usr/bin/env python3
"""Apply German translations to data/text/common.asm (Polished Crystal DE hack)."""
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
COMMON = ROOT / "data" / "text" / "common.asm"

# Body text only (lines after label::). ASM structure preserved per label.
TRANSLATIONS: dict[str, str] = {}

def T(label: str, body: str) -> None:
    TRANSLATIONS[label] = body.strip("\n") + "\n"

# --- Fruit / Apricorn / Items ---
T("_FruitBearingTreeText", '''
	text "Es ist ein"
	line "Obstbaum."
	done''')

T("_HeyItsFruitText", '''
	text "Hey! Das ist"
	line ""
	text_ram wStringBuffer3
	text "!"
	done''')

T("_ObtainedOneFruitText", '''
	text "Du erhältst"
	line "eine "
	text_ram wStringBuffer3
	text "!"
	done''')

T("_ObtainedTwoFruitText", '''
	text "Du erhältst zwei"
	line ""
	text_ram wStringBuffer3
	text "!"
	done''')

T("_ObtainedThreeFruitText", '''
	text "Du erhältst drei"
	line ""
	text_ram wStringBuffer3
	text "!"
	done''')

T("_FruitPackIsFullText", '''
	text "Aber deine Tasche"
	line "ist voll…"
	done''')

T("_NoApricornBoxText", '''
	text "Aber du hast nichts,"
	line "wo du es hinein-"
	cont "legen kannst…"
	done''')

T("_ApricornBoxIsFullText", '''
	text "Aber die Aprikoko-"
	line "Box ist voll…"
	done''')

T("_PutAwayTheApricornText", '''
	text "<PLAYER> legt"
	line ""
	text_ram wStringBuffer3
	text " in"
	cont "die Aprikoko-Box."
	done''')

T("_NothingHereText", '''
	text "Hier ist"
	line "nichts…"
	done''')

T("_WantToUseMulchText", '''
	text "Mulch benutzen?"
	done''')

T("_UsedMulchText", '''
	text "<PLAYER> benutzt"
	line "Mulch!"

	para "Der Baum wurde"
	line "gedüngt!"
	done''')

T("_WhichApricornText", '''
	text "Welche Aprikoko"
	line "soll ich nehmen?"
	done''')

T("_HowManyShouldIMakeText", '''
	text "Wie viele soll ich"
	line "herstellen?"
	done''')

T("_HowManyDoYouWantToSellText", '''
	text "Wie viele willst"
	line "du verkaufen?"
	done''')

T("_RecoveredSomeHPText", '''
	text_ram wStringBuffer1
	line "erholt "
	text_decimal wCurHPAnimDeltaHP, 2, 3
	text " KP!"
	done''')

T("_CuredOfPoisonText", '''
	text_ram wStringBuffer1
	text " ist"
	line "nicht mehr"
	cont "vergiftet."
	done''')

T("_RidOfParalysisText", '''
	text_ram wStringBuffer1
	text " ist"
	line "nicht mehr"
	cont "paralysiert."
	done''')

T("_BurnWasHealedText", '''
	text_ram wStringBuffer1
	text "s"
	line "Verbrennung"
	cont "wurde geheilt."
	done''')

T("_WasDefrostedText", '''
	text_ram wStringBuffer1
	line "wurde aufgetaut."
	done''')

T("_WokeUpText", '''
	text_ram wStringBuffer1
	line "ist aufgewacht."
	done''')

T("_HealthReturnedText", '''
	text_ram wStringBuffer1
	text " ist"
	line "wieder fit."
	done''')

T("_RevitalizedText", '''
	text_ram wStringBuffer1
	line "ist wieder fit."
	done''')

T("_GrewToLevelText", '''
	text_ram wStringBuffer1
	text " erreicht"
	line "Level "
	text_decimal wCurPartyLevel, 1, 3
	text "!"
	text_sound SFX_DEX_FANFARE_50_79
	text_promptbutton
	text_end''')

T("_CameToItsSensesText", '''
	text_ram wStringBuffer1
	text " kommt"
	line "wieder zu sich."
	done''')

T("_OakTimeWokeUpText", '''
	text "………………………………"
	line "………………………………"

	para "Zzz… Hm? Was…?"
	line "Du hast mich auf-"
	cont "geweckt! Kannst du"

	para "mir sagen, wie"
	line "spät es ist?"
	prompt''')

T("_OakTimeWhatTimeIsItText", '''
	text "Wie spät ist es?"
	done''')

T("_OakTimeHowManyMinutesText", '''
	text "Wie viele Minuten?"
	done''')

T("_OakTimeWhoaText", '''
	text "Wow!"
	done''')

T("_OakTimeQuestionMarkText", '''
	text "?"
	done''')

T("_OakTimeOversleptText", '''
	text "!"
	line "Ich habe"
	cont "verschlafen!"
	done''')

T("_OakTimeYikesText", '''
	text "!"
	line "Uah! Ich habe"
	cont "verschlafen!"
	done''')

T("ProfElmNappedText", '''
	text "!"
	line "Ich habe zu"
	cont "lange geschlafen!"
	done''')

T("_OakTimeSoDarkText", '''
	text "!"
	line "Kein Wunder, dass"
	cont "es so dunkel ist!"
	done''')

T("_OakTimeWhatDayIsItText", '''
	text "Welcher Tag ist"
	line "heute?"
	done''')

T("_OakTimeIsItText", '''
	text ", oder?"
	done''')

T("_NothingToChooseText", '''
	text "Es gibt nichts"
	line "zum Auswählen."
	prompt''')

T("_WhichSidePutOnText", '''
	text "Auf welcher Seite"
	line "willst du sie"
	cont "ablegen?"
	done''')

T("_WhichSidePutAwayText", '''
	text "Welche Seite"
	line "willst du ablegen?"
	done''')

T("_PutAwayTheDecoText", '''
	text_ram wStringBuffer3
	text_start
	line "ablegen."
	prompt''')

T("_NothingToPutAwayText", '''
	text "Hier ist nichts"
	line "zum Ablegen."
	prompt''')

T("_SetUpTheDecoText", '''
	text "Dekoriere dein"
	line "Zimmer mit"

	para ""
	text_ram wStringBuffer3
	text "."
	prompt''')

T("_PutAwayAndSetUpText", '''
	text "Entferne"
	line ""
	text_ram wStringBuffer3

	para "und dekoriere mit"
	line ""
	text_ram wStringBuffer4
	text "."
	prompt''')

T("_AlreadySetUpText", '''
	text "Das ist schon"
	line "in deinem Zimmer."
	prompt''')

T("_LookTownMapText", '''
	text "Das ist die Karte."
	done''')

T("_LookPikachuPosterText", '''
	text "Das ist ein Poster"
	line "eines niedlichen"
	cont "Pikachu."
	done''')

T("_LookClefairyPosterText", '''
	text "Das ist ein Poster"
	line "eines niedlichen"
	cont "Piepi."
	done''')

T("_LookJigglypuffPosterText", '''
	text "Das ist ein Poster"
	line "eines niedlichen"
	cont "Marill."
	done''')

T("_LookAdorableDecoText", '''
	text "Sehr bezaubernd:"
	line ""
	text_ram wStringBuffer3
	text "."
	done''')

T("DecoConsoleText", '''
	text "Das ist ein"
	line "glänzendes "
	text_ram wStringBuffer3
	text "."
	done''')

T("_LookGiantDecoText", '''
	text "Eine Riesenpuppe!"
	line "Sie ist flauschig"
	cont "und weich."
	done''')

T("_MomHiHowAreYouText", '''
	text "Hi, <PLAYER>!"
	line "Wie geht es dir?"
	prompt''')

T("_MomFoundAnItemText", '''
	text "Ich habe beim"
	line "Einkaufen ein"
	cont "nützliches Item"
	cont "gefunden und"
	prompt''')

T("_MomBoughtWithYourMoneyText", '''
	text "ich habe es von"
	line "deinem Geld"
	cont "gekauft!"
	prompt''')

T("_MomItsInPCText", '''
	text "Es ist in deinem"
	line "PC. Es wird dir"
	cont "gefallen!"
	done''')

T("_MomFoundADollText", '''
	text "Beim Einkaufen"
	line "heute habe ich"
	cont "eine tolle Puppe"
	cont "gesehen und"
	prompt''')

T("_MomItsInYourRoomText", '''
	text "Sie ist in deinem"
	line "Zimmer. Du wirst"
	cont "sie lieben!"
	done''')

T("_MonWasSentToText", '''
	text_ram wPlayerTrademonSpeciesName
	text " ge-"
	line "sendet an "
	text_ram wOTTrademonSenderName
	text "."
	done''')

T("_BidsFarewellToMonText", '''
	text_ram wOTTrademonSenderName
	text " ver-"
	line "abschiedet sich von"
	done''')

T("_MonNameBidsFarewellText", '''
	text_ram wOTTrademonSpeciesName
	text "."
	done''')

T("_TakeGoodCareOfMonText", '''
	text "Kümmere dich um"
	line ""
	text_ram wOTTrademonSpeciesName
	text "."
	done''')

T("_ForYourMonSendsText", '''
	text "Für "
	text_ram wPlayerTrademonSenderName
	text "s"
	line ""
	text_ram wPlayerTrademonSpeciesName
	text ","
	done''')

T("_OTSendsText", '''
	text_ram wOTTrademonSenderName
	text " überträgt"
	line ""
	text_ram wOTTrademonSpeciesName
	text "."
	done''')

T("_WillTradeText", '''
	text_ram wOTTrademonSenderName
	text " tauscht"
	line ""
	text_ram wOTTrademonSpeciesName
	text_end''')

T("_ForYourMonWillTradeText", '''
	text "gegen "
	text_ram wPlayerTrademonSenderName
	text "s"
	line ""
	text_ram wPlayerTrademonSpeciesName
	text "."
	done''')

# Oak's Pokémon Talk
T("_OPT_IntroText1", '''
	line "Mary: Prof.Oaks"
	done''')

T("_OPT_IntroText2", '''
	line "#mon-Talk!"
	done''')

T("_OPT_IntroText3", '''
	line "Mit Mary!"
	done''')

T("_OPT_OakText1", '''
	line "Oak: "
	text_ram wMonOrItemNameBuffer
	done''')

T("_OPT_OakText2", '''
	line "wurde gesehen in"
	done''')

T("_OPT_OakText3", '''
	line ""
	text_ram wStringBuffer1
	text "."
	done''')

T("_OPT_MaryText1", '''
	line "Mary: "
	text_ram wStringBuffer1
	text " –"
	done''')

T("OPT_SweetAdorably", '''
	line "wie bezaubernd."
	done''')

T("OPT_WigglySlickly", '''
	line "wie smart."
	done''')

T("OPT_AptlyNamed", '''
	line "wie reizend."
	done''')

T("OPT_UndeniablyKindOf", '''
	line "wie freundlich."
	done''')

T("OPT_Unbearably", '''
	line "nicht zu ertragen…"
	done''')

T("OPT_WowImpressively", '''
	line "wow, faszinierend."
	done''')

T("OPT_AlmostPoisonously", '''
	line "fast giftig."
	done''')

T("OPT_Sensually", '''
	line "wie einfühlsam."
	done''')

T("OPT_Mischievously", '''
	line "so schelmisch."
	done''')

T("OPT_Topically", '''
	line "sehr aktuell."
	done''')

T("OPT_Addictively", '''
	line "suchterregend."
	done''')

T("OPT_LooksInWater", '''
	line "schaut ins Wasser."
	done''')

T("OPT_EvolutionMustBe", '''
	line "Entwicklung, ja."
	done''')

T("OPT_Provocatively", '''
	line "wie provozierend."
	done''')

T("OPT_FlippedOut", '''
	line "wie ausgeflippt."
	done''')

T("OPT_HeartMeltingly", '''
	line "wie wunderbar."
	done''')

T("OPT_Cute", '''
	line "wie niedlich."
	done''')

T("OPT_Weird", '''
	line "wie verrückt."
	done''')

T("OPT_Pleasant", '''
	line "wie angenehm."
	done''')

T("OPT_BoldSortOf", '''
	line "wie dreist."
	done''')

T("OPT_Frightening", '''
	line "furchterregend."
	done''')

T("OPT_SuaveDebonair", '''
	line "wie weltmännisch!"
	done''')

T("OPT_Powerful", '''
	line "wie stark."
	done''')

T("OPT_Exciting", '''
	line "wie aufregend."
	done''')

T("OPT_Groovy", '''
	line "jetzt!"
	done''')

T("OPT_Inspiring", '''
	line "wie inspirierend."
	done''')

T("OPT_Friendly", '''
	line "wie freundlich."
	done''')

T("OPT_HotHotHot", '''
	line "wie interessant!"
	done''')

T("OPT_Stimulating", '''
	line "wie anregend."
	done''')

T("OPT_Guarded", '''
	line "gut geschützt."
	done''')

T("OPT_Lovely", '''
	line "wie lieblich."
	done''')

T("OPT_Speedy", '''
	line "wie rasant."
	done''')

T("_OPT_PokemonChannelText", '''
	text "#mon"
	done''')

# Music channel
T("_BenIntroText1", '''
	line "Ben: #mon-Musik-"
	done''')

T("_BenIntroText2", '''
	line "programm!"
	done''')

T("_BenIntroText3", '''
	line "Ich bin's, DJ Ben!"
	done''')

T("_FernIntroText1", '''
	line "Fern: #musik!"
	done''')

T("_FernIntroText2", '''
	line "Mit DJ Fern!"
	done''')

T("_BenFernText1", '''
	line "Es ist "
	text_today
	text "!"
	done''')

T("_BenFernText2A", '''
	line "also mach mit beim"
	done''')

T("_BenFernText2B", '''
	line "also entspann dich"
	done''')

T("_BenFernText3A", '''
	line "#mon-Marsch!"
	done''')

T("_BenFernText3B", '''
	line "#mon-Schlaflied!"
	done''')

# Lucky Channel
T("_LC_Text1", '''
	line "Reed: Yeah! Wie"
	done''')

T("_LC_Text2", '''
	line "geht es euch nun?"
	done''')

T("_LC_Text3", '''
	line "Geht es gut, oder"
	done''')

T("_LC_Text4", '''
	line "geht es nicht,"
	done''')

T("_LC_Text5", '''
	line "die Glückszahl-"
	done''')

T("_LC_Text6", '''
	line "show ist Pflicht!"
	done''')

T("_LC_Text7", '''
	line "Die Glückszahl ist"
	done''')

T("_LC_Text8", '''
	line ""
	text_pause
	text_ram wStringBuffer1
	text "!"
	done''')

T("_LC_Text9", '''
	line "Ich wiederhole!"
	done''')

T("_LC_Text10", '''
	line "Gewonnen? Kommt"
	done''')

T("_LC_Text11", '''
	line "zum Radioturm!"
	done''')

T("_LC_DragText1", '''
	line "…Die Wiederholung"
	done''')

T("_LC_DragText2", '''
	line "verzögert alles…"
	done''')

# Places and People
T("_PnP_Text1", '''
	line "Orte und Personen!"
	done''')

T("_PnP_Text2", '''
	line "Moderiert von"
	done''')

T("_PnP_Text3", '''
	line "DJ Lily!"
	done''')

T("_PnP_Text4", '''
	line ""
	text_ram wStringBuffer2
	text " "
	text_ram wStringBuffer1
	done''')

T("_PnP_cute", '''
	line "ist niedlich."
	done''')

T("_PnP_lazy", '''
	line "ist etwas faul."
	done''')

T("_PnP_happy", '''
	line "ist immer heiter."
	done''')

T("_PnP_noisy", '''
	line "ist ziemlich laut."
	done''')

T("_PnP_precocious", '''
	line "ist frühreif."
	done''')

T("_PnP_bold", '''
	line "ist wohl dreist."
	done''')

T("_PnP_picky", '''
	line "ist zu wählerisch!"
	done''')

T("_PnP_sortofok", '''
	line "ist O.K."
	done''')

T("_PnP_soso", '''
	line "geht so."
	done''')

T("_PnP_great", '''
	line "ist großartig."
	done''')

T("_PnP_mytype", '''
	line "ist mein Typ."
	done''')

T("_PnP_cool", '''
	line "ist so cool, oder?"
	done''')

T("_PnP_inspiring", '''
	line "ist inspirierend!"
	done''')

T("_PnP_weird", '''
	line "ist verrückt."
	done''')

T("_PnP_rightforme", '''
	line "ist genau richtig?"
	done''')

T("_PnP_odd", '''
	line "ist merkwürdig!"
	done''')

T("_PnP_Text5", '''
	line ""
	text_ram wStringBuffer1
	done''')

# Rocket Radio
T("_RocketRadioText1", '''
	line "… …Ähm, wir sind"
	done''')

T("_RocketRadioText2", '''
	line "Team Rocket!"
	done''')

T("_RocketRadioText3", '''
	line "Nach drei Jahren"
	done''')

T("_RocketRadioText4", '''
	line "Vorbereitung sind"
	done''')

T("_RocketRadioText5", '''
	line "wir bereit für"
	done''')

T("_RocketRadioText6", '''
	line "unser Comeback!"
	done''')

T("_RocketRadioText7", '''
	line "Giovanni! "
	text_pause
	text "Hörst"
	done''')

T("_RocketRadioText8", '''
	line "du uns? Geschafft!"
	done''')

T("_RocketRadioText9", '''
	line ""
	text_pause
	text "Wo ist unser Boss?"
	done''')

T("_RocketRadioText10", '''
	line ""
	text_pause
	text "Hört er zu?"
	done''')

# Buena Radio
T("_BuenaRadioText1", '''
	line "Buena: Buena hier!"
	done''')

T("_BuenaRadioText2", '''
	line "Heutiges Passwort!"
	done''')

T("_BuenaRadioText3", '''
	line "Moment… es lautet"
	done''')

T("_BuenaRadioText4", '''
	line ""
	text_ram wStringBuffer1
	text "!"
	done''')

T("_BuenaRadioText5", '''
	line "Vergiss es nicht!"
	done''')

T("_BuenaRadioText6", '''
	line "Ich bin im Radio-"
	done''')

T("_BuenaRadioText7", '''
	line "turm von Goldenrod!"
	done''')

T("_BuenaRadioMidnightText1", '''
	line "Buena: Oh, es ist…"
	done''')

T("_BuenaRadioMidnightText2", '''
	line "Mitternacht!"
	done''')

T("_BuenaRadioMidnightText3", '''
	line "Ich muss aufhören!"
	done''')

T("_BuenaRadioMidnightText4", '''
	line "Danke, Zuhörer!"
	done''')

T("_BuenaRadioMidnightText5", '''
	line "Das Ende naht!"
	done''')

T("_BuenaRadioMidnightText6", '''
	line "Bleib nicht zu"
	done''')

T("_BuenaRadioMidnightText7", '''
	line "lange auf! Euer"
	done''')

T("_BuenaRadioMidnightText8", '''
	line "DJ Buena!"
	done''')

T("_BuenaRadioMidnightText9", '''
	text "Ich muss weg!"
	done''')

T("_BuenaRadioMidnightText10", '''
	text "…"
	done''')

T("_BuenaOffTheAirText", '''
	line ""
	done''')

T("Text_EnemyUsed", '''
	text "<ENEMY>"
	line "setzt "
	text_ram wMonOrItemNameBuffer
	text " ein!"
	prompt''')

T("Text_EnemyUsedOn", '''
	text "<ENEMY>"
	line "setzt "
	text_ram wMonOrItemNameBuffer
	cont "bei "
	text_ram wEnemyMonNickname
	text " ein!"
	prompt''')

T("_AskFloorElevatorText", '''
	text "Welcher Stock?"
	done''')

T("_BugCatchingContestTimeUpText", '''
	text "Sprecher: BIEP!"

	para "Die Zeit ist um!"
	done''')

T("_BugCatchingContestIsOverText", '''
	text "Sprecher: Der"
	line "Wettkampf ist"
	cont "vorbei!"
	done''')

T("_RepelWoreOffText", '''
	text "Schutz wirkt"
	line "nicht mehr."
	done''')

T("UseAnotherRepelText", '''
	text "Schutz wirkt"
	line "nicht mehr."

	para "Noch einen"
	line "benutzen?"
	done''')

T("_JustSawSomeRareMonText", '''
	text "Ich sah seltene"
	line ""
	text_ram wStringBuffer1
	text " bei"
	cont ""
	text_ram wStringBuffer2
	text "."

	para "Ich rufe an, wenn"
	line "ich ein anderes"
	cont "seltenes #mon"
	cont "sehe, in Ordnung?"
	prompt''')

T("_SavingRecordText", '''
	text "Speichern…"
	line "Nicht ausschalten!"
	done''')

T("_NoCoinsText", '''
	text "Du hast keine"
	line "Münzen."
	prompt''')

T("_NoCoinCaseText", '''
	text "Du hast keinen"
	line "Münzkorb."
	prompt''')

T("_NPCTradeCableText", '''
	text "O.K., benutze das"
	line "Game Link-Kabel."
	prompt''')

T("Text_NPCTraded", '''
	text "<PLAYER> tauscht"
	line ""
	text_ram wMonOrItemNameBuffer
	text " gegen"
	cont ""
	text_ram wStringBuffer2
	text "."
	done''')

T("_NPCTradeIntroText1", '''
	text "Ich sammle #mon."
	line "Hast du ein"
	cont ""
	text_ram wStringBuffer1
	text "?"

	para "Möchtest du es"
	line "gegen mein"
	cont ""
	text_ram wStringBuffer2
	text " tauschen?"
	done''')

T("_NPCTradeCancelText1", '''
	text "Du möchtest nicht"
	line "tauschen? Schade…"
	done''')

T("_NPCTradeWrongText1", '''
	text "Häh? Das ist kein"
	line ""
	text_ram wStringBuffer1
	text "."
	cont "Wie enttäuschend…"
	done''')

T("_NPCTradeCompleteText1", '''
	text "Yo! Ich habe mir"
	line ""
	text_ram wStringBuffer1
	text " besorgt!"
	cont "Danke!"
	done''')

T("_NPCTradeAfterText1", '''
	text "Hi, wie geht es"
	line "meinem "
	text_ram wStringBuffer2
	text "?"
	done''')

T("_NPCTradeIntroText2", '''
	text "Hi, ich suche"
	line "ein #mon."

	para "Wenn du ein"
	line ""
	text_ram wStringBuffer1
	text " hast,"

	para "tauschst du es"
	line "gegen mein"
	cont ""
	text_ram wStringBuffer2
	text "?"
	done''')

T("_NPCTradeCancelText2", '''
	text "Du hast auch"
	line "keines?"

	para "Das ist wirklich"
	line "enttäuschend…"
	done''')

T("_NPCTradeWrongText2", '''
	text "Du hast kein"
	line ""
	text_ram wStringBuffer1
	text "? Das"
	cont "ist schade, na ja."
	done''')

T("_NPCTradeCompleteText2", '''
	text "Großartig! Danke!"

	para "Endlich habe ich"
	line "ein "
	text_ram wStringBuffer1
	text "."
	done''')

T("_NPCTradeAfterText2", '''
	text "Dem "
	text_ram wMonOrItemNameBuffer
	text ","
	line "das du mit mir"
	cont "getauscht hast,"
	cont "geht es gut!"
	done''')

T("_NPCTradeIntroText3", '''
	text_ram wMonOrItemNameBuffer
	text " ist"
	line "niedlich, aber ich"

	para "habe keines. Hast"
	line "du ein "
	text_ram wStringBuffer1
	text "?"

	para "Möchtest du es"
	line "gegen mein"
	cont ""
	text_ram wStringBuffer2
	text " tauschen?"
	done''')

T("_NPCTradeCancelText3", '''
	text "Du möchtest nicht"
	line "tauschen? Schade…"
	done''')

T("_NPCTradeWrongText3", '''
	text "Das ist kein"
	line ""
	text_ram wStringBuffer1
	text "."

	para "Komm wieder, wenn"
	line "du tauschen"
	cont "möchtest."
	done''')

T("_NPCTradeCompleteText3", '''
	text "Danke! Ich wollte"
	line "immer schon ein"
	cont ""
	text_ram wMonOrItemNameBuffer
	text "!"
	done''')

T("_NPCTradeAfterText3", '''
	text "Wie geht es dem"
	line "getauschten"
	cont ""
	text_ram wStringBuffer2
	text "?"

	para "Dein "
	text_ram wMonOrItemNameBuffer
	text " ist"
	line "so niedlich!"
	done''')

T("_NPCTradeCompleteText4", '''
	text "Was ist passiert?"
	done''')

T("_NPCTradeAfterText4", '''
	text "Tauschen ist"
	line "seltsam…"

	para "Ich muss noch viel"
	line "darüber lernen."
	done''')

# --- Mom / Bank ---
T("_MomLeavingText1", '''
	text "Das ist ein nied-"
	line "liches #mon."

	para "Wo hast du es"
	line "her?"

	para "…"

	para "Du beginnst also"
	line "ein Abenteuer…"

	para "O.K.! Auch ich"
	line "werde dir helfen."

	para "Aber was kann ich"
	line "für dich tun?"

	para "Ich weiß! Ich"
	line "werde für dich"
	cont "sparen."

	para "Auf einer langen"
	line "Reise ist Geld"
	cont "sehr wichtig."

	para "Soll ich dein"
	line "Geld sparen?"
	done''')

T("_MomLeavingText2", '''
	text "O.K., ich verwalte"
	line "deine Ersparnisse."

	para "………………"
	prompt''')

T("_MomLeavingText3", '''
	text "Sei auf der Hut."

	para "#mon sind"
	line "deine Kameraden."
	cont "Ihr müsst als Team"
	cont "auftreten."

	para "Also mach's gut!"
	done''')

T("_MomIsThisAboutYourMoneyText", '''
	text "Hi! Willkommen!"
	line "Ich sehe, du"
	cont "bemühst dich sehr."

	para "Ich habe dein"
	line "Zimmer aufgeräumt."

	para "Geht es um"
	line "dein Geld?"
	done''')

T("_MomBankWhatDoYouWantToDoText", '''
	text "Was möchtest du"
	line "tun?"
	done''')

T("_MomStoreMoneyText", '''
	text "Wie viel möchtest"
	line "du sparen?"
	done''')

T("_MomTakeMoneyText", '''
	text "Wie viel möchtest"
	line "du abheben?"
	done''')

T("_MomSaveMoneyText", '''
	text "Möchtest du Geld"
	line "sparen?"
	done''')

T("_MomHaventSavedThatMuchText", '''
	text "So viel hast du"
	line "nicht gespart."
	prompt''')

T("_MomNotEnoughRoomInWalletText", '''
	text "So viel kannst du"
	line "nicht mitnehmen."
	prompt''')

T("_MomInsufficientFundsInWalletText", '''
	text "So viel hast du"
	line "nicht dabei."
	prompt''')

T("_MomNotEnoughRoomInBankText", '''
	text "So viel kannst du"
	line "nicht sparen."
	prompt''')

T("_MomStartSavingMoneyText", '''
	text "O.K., ich spare"
	line "für dich. Verlass"
	cont "dich auf mich!"

	para "<PLAYER>, gib"
	line "nicht auf!"
	done''')

T("_MomStoredMoneyText", '''
	text "Dein Geld ist"
	line "sicher! Los geht's!"
	done''')

T("_MomTakenMoneyText", '''
	text "<PLAYER>, gib"
	line "nicht auf!"
	done''')

T("_MomJustDoWhatYouCanText", '''
	text "Mach einfach,"
	line "was du kannst."
	done''')

# --- Day Care ---
T("_DayCareManIntroText", '''
	text "Ich bin der Pension-"
	line "sleiter. Soll ich"
	cont "ein #mon auf-"
	cont "ziehen?"
	done''')

T("_DayCareManIntroEggText", '''
	text "Ich bin der Pension-"
	line "sleiter. Kennst du"
	cont "Eier?"

	para "Ich habe #mon"
	line "mit meiner Frau"
	cont "gezüchtet."

	para "Plötzlich hatten"
	line "wir ein Ei!"

	para "Unglaublich, oder?"

	para "Soll ich ein"
	line "#mon aufziehen?"
	done''')

T("_DayCareLadyIntroText", '''
	text "Ich bin die"
	line "Pensionsleiterin."

	para "Soll ich ein"
	line "#mon für dich"
	cont "aufziehen?"
	done''')

T("_DayCareLadyIntroEggText", '''
	text "Ich bin die"
	line "Pensionsleiterin."
	cont "Kennst du Eier?"

	para "Mein Mann und ich"
	line "haben #mon"
	cont "gezüchtet."

	para "Plötzlich hatten"
	line "wir ein Ei!"

	para "Wie konnte das"
	line "passieren?"

	para "Soll ich ein"
	line "#mon aufziehen?"
	done''')

T("_WhatShouldIRaiseText", '''
	text "Welches #mon"
	line "soll ich nehmen?"
	prompt''')

T("_OnlyOneMonText", '''
	text "Oh? Du hast nur"
	line "ein #mon."
	prompt''')

T("_CantAcceptEggText", '''
	text "Sorry, ein Ei"
	line "kann ich nicht"
	cont "annehmen."
	prompt''')

T("_RemoveMailText", '''
	text "Entferne zuerst"
	line "den Brief."
	prompt''')

T("_LastHealthyMonText", '''
	text "Wenn du mir das"
	line "gibst, womit"
	cont "willst du kämpfen?"
	prompt''')

T("_IllRaiseYourMonText", '''
	text "O.K. Ich ziehe"
	line ""
	text_ram wStringBuffer1
	text " auf."
	prompt''')

T("_ComeBackLaterText", '''
	text "Hol es später"
	line "wieder ab."
	done''')

T("_AreWeGeniusesText", '''
	text "Sind wir nicht"
	line "genial? Willst du"
	cont ""
	text_ram wStringBuffer1
	text " sehen?"
	done''')

T("_YourMonHasGrownText", '''
	text "Dein "
	text_ram wStringBuffer1
	line "ist gewachsen."

	para "Sein Level stieg"
	line "um "
	text_decimal wStringBuffer2 + 1, 1, 3
	text "."

	para "Willst du es"
	line "zurück, kostet es"
	cont "¥"
	text_decimal wStringBuffer2 + 2, 3, 5
	text "."
	done''')

T("_PerfectHeresYourMonText", '''
	text "Perfekt! Hier ist"
	line "dein #mon."
	prompt''')

T("_GotBackMonText", '''
	text "<PLAYER> erhält"
	line ""
	text_ram wStringBuffer1
	text " zurück."
	prompt''')

T("_BackAlreadyText", '''
	text "Häh? Schon wieder"
	line "da? Dein "
	text_ram wStringBuffer1

	para "braucht noch etwas"
	line "Zeit bei uns."

	para "Willst du es"
	line "zurück, kostet es"
	cont "¥100."
	done''')

T("_HaveNoRoomText", '''
	text "Du hast keinen"
	line "Platz dafür."
	prompt''')

T("_NotEnoughMoneyText", '''
	text "Du hast nicht"
	line "genug Geld."
	prompt''')

T("_OhFineThenText", '''
	text "Na gut."
	prompt''')

T("_ComeAgainText", '''
	text "Komm wieder."
	done''')

T("_NotYetText", '''
	text "Noch nicht…"
	done''')

T("_FoundAnEggAgainText", '''
	text "Ah, du bist es!"

	para "Dein #mon hatte"
	line "wieder ein Ei!"

	para "Willst du es?"
	done''')

T("_FoundAnEggText", '''
	text "Ah, du bist es!"

	para "Wir haben dein"
	line "#mon aufgezogen"

	para "und waren total"
	line "überrascht!"

	para "Dein #mon hatte"
	line "ein Ei!"

	para "Wir wissen nicht,"
	line "wie es dorthin"

	para "kam, aber dein"
	line "#mon hatte es."
	cont "Willst du es?"
	done''')

T("_ReceivedEggText", '''
	text "<PLAYER> erhält"
	line "das Ei!"
	done''')

T("_TakeGoodCareOfEggText", '''
	text "Kümmere dich gut"
	line "darum."
	done''')

T("_IllKeepItThanksText", '''
	text "Dann behalte ich"
	line "es. Danke!"
	done''')

T("_NoRoomForEggText", '''
	text "Kein Platz im"
	line "Team oder in der"
	cont "Box. Komm später"
	cont "wieder."
	done''')

# --- Name Rater ---
T("_NameRaterHelloText", '''
	text "Hallo! Ich bin der"
	line "Namen-Bewerter."

	para "Ich bewerte die"
	line "Namen von #mon."

	para "Soll ich einen"
	line "Namen bewerten?"
	done''')

T("_NameRaterWhichMonText", '''
	text "Welchen Spitz-"
	line "namen soll ich"
	cont "bewerten?"
	prompt''')

T("_NameRaterBetterNameText", '''
	text "Hm… "
	text_ram wStringBuffer1
	text "…"
	line "Ein ganz guter"
	cont "Name."

	para "Aber wie wäre ein"
	line "etwas besserer"
	cont "Spitzname?"

	para "Soll ich einen"
	line "neuen Namen geben?"
	done''')

T("_NameRaterWhatNameText", '''
	text "O.K. Welchen Namen"
	line "soll es sein?"
	prompt''')

T("_NameRaterFinishedText", '''
	text "Dieser Name ist"
	line "besser!"

	para "Gut gemacht!"
	done''')

T("_NameRaterComeAgainText", '''
	text "O.K. Komm wieder,"
	line "wenn du willst."
	done''')

T("_NameRaterPerfectNameText", '''
	text "Hm… "
	text_ram wStringBuffer1
	text "?"
	line "Ein tadelloser"
	cont "Name!"

	para "Kümmere dich gut"
	line "um "
	text_ram wStringBuffer1
	text "."
	done''')

T("_NameRaterEggText", '''
	text "Wow… Das ist nur"
	line "ein Ei."
	done''')

T("_NameRaterSameNameText", '''
	text "Er sieht genauso"
	line "aus wie vorher,"

	para "aber der neue Name"
	line "ist viel besser!"

	para "Gut gemacht!"
	done''')

T("_NameRaterNamedText", '''
	text "O.K. Dieses #mon"
	line "heißt jetzt "
	text_ram wStringBuffer1
	text "."
	prompt''')

# --- Battle commands / EXP ---
T("Text_Gained", '''
	text_ram wStringBuffer1
	text " erhält@"
	text_end''')

T("Text_ABoostedStringBuffer2ExpPoints", '''
	line "spezielle "
	cont ""
	text_decimal wStringBuffer2, 3, 6
	text " EP!"
	prompt''')

T("Text_StringBuffer2ExpPoints", '''
	line ""
	text_decimal wStringBuffer2, 3, 6
	text " EP!"
	prompt''')

T("Text_GoPkmn", '''
	text "Los! @"
	text_end''')

T("Text_DoItPkmn", '''
	text "Los! @"
	text_end''')

T("Text_GoForItPkmn", '''
	text "Los,"
	line "@"
	text_end''')

T("Text_YourFoesWeakGetmPkmn", '''
	text "Mach es fertig!"
	line "Los, @"
	text_end''')

T("Text_BattleMonNick01", '''
	text_ram wBattleMonNickname
	text "!"
	done''')

T("Text_BattleMonNickComma", '''
	text_ram wBattleMonNickname
	text ",@"
	text_end''')

T("Text_ThatsEnoughComeBack", '''
	text " genug!"
	line "Komm zurück!@"
	text_end''')

T("Text_OKComeBack", '''
	text " O.K.!"
	line "Komm zurück!@"
	text_end''')

T("Text_GoodComeBack", '''
	text " super!"
	line "Komm zurück!@"
	text_end''')

T("Text_ComeBack", '''
	text " komm"
	line "zurück!"
	done''')

# --- TM/VM ---
T("_BootedTMText", '''
	text "TM aktiviert."
	done''')

T("_BootedHMText", '''
	text "VM aktiviert."
	done''')

T("_ContainedMoveText", '''
	text "Sie enthält"
	line ""
	text_ram wStringBuffer2
	text "."

	para ""
	text_ram wStringBuffer2
	line "einem #mon"
	cont "beibringen?"
	done''')

T("_TMHMNotCompatibleText", '''
	text_ram wStringBuffer2
	text " ist"
	line "nicht kompatibel"
	cont "mit "
	text_ram wStringBuffer1
	text "."

	para "Es kann "
	text_ram wStringBuffer2
	line "nicht erlernen."
	prompt''')

T("_BadgeRequiredText", '''
	text "Du brauchst einen"
	line "neuen Orden."
	prompt''')

T("_CantUseItemText", '''
	text "Das kann hier"
	line "nicht benutzt"
	cont "werden."
	prompt''')

# --- Field moves ---
T("_UseCutText", '''
	text_ram wStringBuffer2
	text " setzt"
	line "Zerschneider ein!"
	prompt''')

T("_CutNothingText", '''
	text "Hier kann man"
	line "nichts schneiden."
	prompt''')

T("_AskFlashText", '''
	text "Es ist stock-"
	line "dunkel. Blitz"
	cont "benutzen?"
	done''')

T("_BlindingFlashText", '''
	text "Ein gleißender"
	line "Blitz erhellt"
	cont "das Gebiet!"
	text_promptbutton
	text_end''')

T("_UsedSurfText", '''
	text_ram wStringBuffer2
	text " setzt"
	line "Surfer ein!"
	done''')

T("_CantSurfText", '''
	text "Surfer kann hier"
	line "nicht eingesetzt"
	cont "werden."
	prompt''')

T("_AlreadySurfingText", '''
	text "Surfer ist bereits"
	line "eingesetzt."
	prompt''')

T("_AskSurfText", '''
	text "Die See ist ruhig."
	line "Surfer einsetzen?"
	done''')

T("_UseWaterfallText", '''
	text_ram wStringBuffer2
	text " setzt"
	line "Kaskade ein!"
	done''')

T("_HugeWaterfallText", '''
	text "Wow, das ist ein"
	line "großer Wasserfall."
	done''')

T("_AskWaterfallText", '''
	text "Kaskade einsetzen?"
	done''')

T("_UseDigText", '''
	text_ram wStringBuffer2
	text " setzt"
	line "Schaufler ein!"
	done''')

T("_UseEscapeRopeText", '''
	text "<PLAYER> benutzt"
	line "Fluchtseil."
	done''')

T("_CantUseDigText", '''
	text "Das kann hier"
	line "nicht eingesetzt"
	cont "werden."
	done''')

T("_CantUseTeleportText", '''
	text "Das kann hier"
	line "nicht eingesetzt"
	cont "werden."

	para ""
	done''')

T("_UseStrengthText", '''
	text_ram wStringBuffer2
	text " setzt"
	line "Stärke ein!"
	done''')

T("_MoveBoulderText", '''
	text_ram wStringBuffer1
	text " kann"
	line "Felsen bewegen."
	prompt''')

T("_AskStrengthText", '''
	text "Ein #mon könnte"
	line "das bewegen."

	para "Stärke einsetzen?"
	done''')

T("_BouldersMoveText", '''
	text "Du kannst jetzt"
	line "Felsen bewegen!"
	done''')

T("_BouldersMayMoveText", '''
	text "Ein #mon könnte"
	line "das bewegen."
	done''')

T("_UseWhirlpoolText", '''
	text_ram wStringBuffer2
	text " setzt"
	line "Strudel ein!"
	prompt''')

T("_MayPassWhirlpoolText", '''
	text "Das ist ein"
	line "teuflischer"
	cont "Strudel!"

	para "Ein #mon könnte"
	line "ihn durchqueren."
	done''')

T("_AskWhirlpoolText", '''
	text "Ein Strudel ist"
	line "im Weg."

	para "Strudel einsetzen?"
	done''')

T("_UseHeadbuttText", '''
	text_ram wStringBuffer2
	text " setzt"
	line "Kopfnuss ein!"
	prompt''')

T("_HeadbuttNothingText", '''
	text "Nein. Nichts…"
	done''')

T("_AskHeadbuttText", '''
	text "Vielleicht steckt"
	line "ein #mon im Baum."

	para "Kopfnuss ein-"
	line "setzen?"
	done''')

T("_UseRockSmashText", '''
	text_ram wStringBuffer2
	text " setzt"
if DEF(FAITHFUL)
	line "Rock Smash ein!"
else
	line "Brick Break ein!"
endc
	prompt''')

T("_MaySmashText", '''
	text "Ein #mon könnte"
	line "das zerbrechen."
	done''')

T("_AskRockSmashText", '''
	text "Dieser Fels sieht"
	line "zerbrechlich aus."

if DEF(FAITHFUL)
	para "Rock Smash"
	line "einsetzen?"
else
	para "Brick Break"
	line "einsetzen?"
endc
	done''')

T("_RodBiteText", '''
	text "Uah!"
	line "Da hat etwas"
	cont "angebissen!"
	prompt''')

T("_RodNothingText", '''
	text "Nicht einmal"
	line "angeknabbert!"

	para "Weiter angeln?"
	done''')

T("_CantGetOffBikeText", '''
	text "Du kannst hier"
	line "nicht absteigen!"
	done''')

T("_GotOnBikeText", '''
	text "<PLAYER> steigt"
	line "aufs "
	text_ram wStringBuffer2
	text "."
	done''')

T("_GotOffBikeText", '''
	text "<PLAYER> steigt"
	line "vom "
	text_ram wStringBuffer2
	text " ab."
	done''')

T("_AskCutText", '''
	text "Hier kann man"
	line "Zerschneider"
	cont "einsetzen!"

	para "Zerschneider"
	line "benutzen?"
	done''')

T("_CanCutText", '''
	text "Hier kann man"
	line "Zerschneider"
	cont "einsetzen!"
	done''')

T("_FoundItemText", '''
	text "<PLAYER> findet"
	line ""
	text_ram wStringBuffer3
	text "!"
	done''')

T("_GotTheItemText", '''
	text "<PLAYER> erhält"
	line ""
	text_ram wStringBuffer4
	text "."
	done''')

T("_ReceivedTheBadgeText", '''
	text "<PLAYER> erhält"
	line "den "
	text_ram wStringBuffer4
	text "-Orden."
	done''')

# --- Whiteout ---
T("WhiteoutText", '''
	text "<PLAYER> hat kein"
	line "kampffähiges"
	cont "#mon mehr!"

	para "<PLAYER> ist"
	line "kampfunfähig!"
	done''')

T("WhiteoutToWildText", '''
	text "<PLAYER> hat kein"
	line "kampffähiges"
	cont "#mon mehr!"

	para "<PLAYER> gerät in"
	line "Panik und verliert"
	cont "¥"
	text_decimal hMoneyTemp, 3, 7
	text "…"

	para "………………"
	line "………………"

	para "<PLAYER> ist"
	line "kampfunfähig!"
	done''')

T("WhiteoutToTrainerText", '''
	text "<PLAYER> hat kein"
	line "kampffähiges"
	cont "#mon mehr!"

	para "<PLAYER> zahlt"
	line "¥"
	text_decimal hMoneyTemp, 3, 7
	text " an den"
	cont "Sieger…"

	para "………………"
	line "………………"

	para "<PLAYER> ist"
	line "kampfunfähig!"
	done''')

T("ForfeitToTrainerText", '''
	text "<PLAYER> gibt den"
	line "Kampf auf…"

	para "<PLAYER> zahlt"
	line "¥"
	text_decimal hMoneyTemp, 3, 7
	text " an den"
	cont "Sieger…"

	para "………………"
	line "………………"

	para "<PLAYER> ist"
	line "kampfunfähig!"
	done''')

T("_PoisonFaintText", '''
	text_ram wStringBuffer3
	line "erholt sich von"
	cont "der Vergiftung!"
	prompt''')

T("_UseSweetHoneyText", '''
	text "<PLAYER> streicht"
if DEF(FAITHFUL)
	line "Honig auf!"
else
	line "Süßhonig auf!"
endc
	done''')

T("_SweetHoneyNothingText", '''
	text "Hier scheint"
	line "nichts zu sein…"
	done''')

T("_SquirtbottleNothingText", '''
	text "<PLAYER>"
	line "verspritzt Wasser."

	para "Nichts geschieht…"
	done''')

T("_UseSacredAshText", '''
	text "Die #mon von"
	line "<PLAYER> wurden"
	cont "geheilt!"
	done''')

T("Text_AnEGGCantHoldAnItem", '''
	text "Ein Ei kann kein"
	line "Item tragen."
	prompt''')

T("_AskThrowAwayText", '''
	text "Wie viele"
	line "wegwerfen?"
	done''')

T("_AskQuantityThrowAwayText", '''
	text ""
	text_decimal wItemQuantityChangeBuffer, 1, 2
	line " "
	text_ram wStringBuffer2
	text_plural
	text " wegwerfen?"
	done''')

T("_ThrewAwayText", '''
	text ""
	text_ram wStringBuffer2
	text_plural
	line "weggeworfen."
	prompt''')

T("_OakThisIsntTheTimeText", '''
	text "Oak: <PLAYER>!"
	line "Jetzt ist nicht"
	cont "der richtige"
	cont "Zeitpunkt!"
	prompt''')

T("Text_YouDontHaveAPkmn", '''
	text "Du hast kein"
	line "#mon!"
	prompt''')

T("_RegisteredItemText", '''
	text ""
	text_ram wStringBuffer2
	text " wurde"
	line "eingetragen."
	prompt''')

T("UnregisteredItemText", '''
	text ""
	text_ram wStringBuffer2
	text " wurde"
	line "abgemeldet."
	prompt''')

T("_CantRegisterText", '''
	text "Dieses Item kann"
	line "nicht eingetragen"
	cont "werden."
	prompt''')

T("_AskItemMoveText", '''
	text "Wohin soll es?"
	done''')

T("Text_AreYouABoyOrAreYouAGirl", '''
	text "Welches Foto ist"
	line "auf deiner"
	cont "Trainerkarte?"
	done''')

T("Text_SoThisIsYou", '''
	text "Das bist du?"
	done''')

T("Text_BattleUser", '''
	text "<USER>@"
	text_end''')

T("_BattleTookSunlightText", '''
	line "badet im Licht!"
	prompt''')

T("_BattleFlewText", '''
	line "fliegt empor!"
	prompt''')

T("_BattleDugText", '''
	line "gräbt ein Loch!"
	prompt''')

T("Text_BreedHuh", '''
	text "Huch?"
	para "@"
	text_end''')

T("_BreedEggHatchText", '''
	text_ram wStringBuffer1
	text " schlüpft"
	line "aus dem Ei!"
	text_sound SFX_CAUGHT_MON
	text_promptbutton
	text_end''')

T("_BreedAskNicknameText", '''
	text "Möchtest du "
	text_ram wStringBuffer1
	line "einen Spitznamen"
	cont "geben?"
	done''')

T("_LeftWithDayCareLadyText", '''
	text ""
	text_ram wBreedMon2Nickname
	text " hast du der"
	line "Pensionsleiterin"
	cont "anvertraut."
	done''')

T("_LeftWithDayCareManText", '''
	text ""
	text_ram wBreedMon1Nickname
	text " hast du dem"
	line "Pensionsleiter"
	cont "anvertraut."
	done''')

T("_BreedNoInterestText", '''
	text "Kein Interesse an"
	line ""
	text_ram wStringBuffer1
	text "."
	prompt''')

T("_BreedAppearsToCareForText", '''
	text "Es kümmert sich um"
	line ""
	text_ram wStringBuffer1
	text "."
	prompt''')

T("_BreedFriendlyText", '''
	text "Es ist freundlich"
	line "zu "
	text_ram wStringBuffer1
	text "."
	prompt''')

T("_BreedShowsInterestText", '''
	text "Es zeigt Interesse"
	line "an "
	text_ram wStringBuffer1
	text "."
	prompt''')

# --- Mail ---
T("_EmptyMailboxText", '''
	text "Hier sind keine"
	line "Briefe."
	prompt''')

T("ClearedMailPutAwayText", '''
	text "Der leere Brief"
	line "wurde eingesteckt."
	prompt''')

T("MailPackFullText", '''
	text "Deine Tasche"
	line "ist voll."
	prompt''')

T("MailMessageLostText", '''
	text "Der Briefinhalt"
	line "wird gelöscht."
	cont "Einverstanden?"
	done''')

T("MailAlreadyHoldingItemText", '''
	text "Es trägt schon"
	line "ein Item."
	prompt''')

T("MailEggText", '''
	text "Ein Ei kann keinen"
	line "Brief tragen."
	prompt''')

T("MailMovedFromBoxText", '''
	text "Der Brief wurde"
	line "aus dem Brief-"
	cont "kasten entfernt."
	prompt''')

T("_ReceivedGiftMonText", '''
	text "<PLAYER> erhält"
	line ""
	text_ram wMonOrItemNameBuffer
	text "!"
	done''')

T("_EggSentToPCText", '''
	text "Das Ei wurde nach"
	line ""
	text_ram wStringBuffer1
	text " geschickt."
	prompt''')

T("_PCGottaHavePokemonText", '''
	text "Du brauchst #mon,"
	line "um das zu nutzen!"
	prompt''')

T("_ContestCaughtMonText", '''
	text ""
	text_ram wStringBuffer1
	text " wurde"
	line "gefangen!"
	prompt''')

T("_ContestAskSwitchText", '''
	text "#mon tauschen?"
	done''')

T("_ContestAlreadyCaughtText", '''
	text "Du hast schon ein"
	line ""
	text_ram wStringBuffer1
	text " gefangen."
	prompt''')

T("ContestJudging_FirstPlaceText", '''
	text "Der Gewinner des"
	line "Käferturniers ist"
	text_pause
	text "…"

	para ""
	text_ram wBugContestWinnerName
	text ","
	line "mit einem"
	cont ""
	text_ram wStringBuffer1
	text "!@"
	text_end''')

T("ContestJudging_FirstPlaceScoreText", '''
	para "Mit "
	text_decimal wBugContestFirstPlaceScore, 2, 3
	text " Punkten!"
	prompt''')

T("ContestJudging_SecondPlaceText", '''
	text "Zweiter wurde"
	line ""
	text_ram wBugContestWinnerName
	text ","
	para "mit einem"
	line ""
	text_ram wStringBuffer1
	text "!@"
	text_end''')

T("ContestJudging_SecondPlaceScoreText", '''
	para "Die Punktzahl:"
	line ""
	text_decimal wBugContestSecondPlaceScore, 2, 3
	text " Punkte!"
	prompt''')

T("ContestJudging_ThirdPlaceText", '''
	text "Dritter wurde"
	line ""
	text_ram wBugContestWinnerName
	text ","
	para "mit einem"
	line ""
	text_ram wStringBuffer1
	text "!@"
	text_end''')

T("ContestJudging_ThirdPlaceScoreText", '''
	para "Mit "
	text_decimal wBugContestThirdPlaceScore, 2, 3
	text " Punkten!"
	prompt''')

T("_MagikarpGuruMeasureText", '''
	text "Lass mich dein"
	line "Karpador messen."

	para "…Hm, es ist"
	line ""
	text_ram wStringBuffer1
	text "."
	prompt''')

T("_KarpGuruRecordText", '''
	text "Aktueller Rekord"
	para ""
	text_ram wStringBuffer1
	text " gefangen von"
	line ""
	text_ram wMagikarpRecordHoldersName
	text_promptbutton
	text_end''')

T("_LuckyNumberMatchPartyText", '''
	text "Glückwunsch!"

	para "Die ID-Nummer von"
	line ""
	text_ram wStringBuffer2
	text " in deinem Team"
	cont "stimmt überein."
	prompt''')

T("_LuckyNumberMatchPCText", '''
	text "Glückwunsch!"

	para "Die ID-Nummer von"
	line ""
	text_ram wStringBuffer2
	text " in Box"
	line "„"
	text_ram wStringBuffer1
	text "" stimmt."
	prompt''')

T("_CaughtAskNicknameText", '''
	text "Möchtest du "
	text_ram wStringBuffer1
	line "einen Spitznamen"
	cont "geben?"
	done''')

T("_PokecenterPCCantUseText", '''
	text "Nur ein #mon"
	line "kann das nutzen!"
	prompt''')

T("_PlayersPCTurnOnText", '''
	text "<PLAYER> schaltet"
	line "den PC ein."
	prompt''')

T("_PlayersPCAskWhatDoText", '''
	text "Was möchtest du"
	line "tun?"
	done''')

T("_PlayersPCHowManyWithdrawText", '''
	text "Wie viele"
	line "mitnehmen?"
	done''')

T("_PlayersPCWithdrewItemsText", '''
	text ""
	text_decimal wItemQuantityChangeBuffer, 1, 2
	line " "
	text_ram wStringBuffer2
	text_plural
	text " mitgenommen."
	prompt''')

T("_PlayersPCNoRoomWithdrawText", '''
	text "Kein Platz für"
	line "mehr Items."
	prompt''')

T("_PlayersPCNoItemsText", '''
	text "Keine Items hier!"
	prompt''')

T("_PlayersPCCantDepositItemText", '''
	text "Dieses Item kann"
	line "nicht abgelegt"
	cont "werden."
	prompt''')

T("_PlayersPCHowManyDepositText", '''
	text "Wie viele"
	line "ablegen?"
	done''')

T("_PlayersPCDepositItemsText", '''
	text ""
	text_decimal wItemQuantityChangeBuffer, 1, 2
	line " "
	text_ram wStringBuffer2
	text_plural
	text " abgelegt."
	prompt''')

T("_PlayersPCNoRoomDepositText", '''
	text "Kein Platz für"
	line "mehr Items."
	prompt''')

T("_PokecenterPCTurnOnText", '''
	text "<PLAYER> schaltet"
	line "den PC ein."
	prompt''')

T("_PokecenterPCWhoseText", '''
	text "Zugriff auf"
	line "wessen PC?"
	done''')

T("_PokecenterBillsPCText", '''
	text "Bills PC"
	line "verbunden."

	para "#mon-Lager"
	line "geöffnet."
	prompt''')

T("_PokecenterPlayersPCText", '''
	text "Dein PC"
	line "verbunden."

	para "Item-Lager"
	line "geöffnet."
	prompt''')

T("_PokecenterOaksPCText", '''
	text "Prof.Oaks PC"
	line "verbunden."

	para "#dex-Bewertung"
	line "geöffnet."
	prompt''')

T("_PokecenterPCOaksClosedText", '''
	text "…"
	line "Verbindung beendet…"
	done''')

T("_OakPCText1", '''
	text "Soll dein #dex"
	line "bewertet werden?"
	done''')

T("_OakPCText2", '''
	text "In deinem #dex"
	line "steht:"
	prompt''')

T("_OakPCText3", '''
	text_decimal wTempDexSeen, 2, 3
	text " #mon gesehen"
	line ""
	text_decimal wTempDexOwn, 2, 3
	text " #mon gefangen"

	para "Prof.Oaks"
	line "Bewertung:"
	done''')

T("_OakRating01", '''
	text "Suche im hohen"
	line "Gras nach #mon!"
	done''')

T("_OakRating02", '''
	text "Gut. Du kannst mit"
	line "#bällen umgehen."
	done''')

T("_OakRating03", '''
	text "Du wirst besser,"
	line "hast aber noch"

	para "einen langen Weg"
	line "vor dir."
	done''')

T("_OakRating04", '''
	text "Vervollständige"
	line "den #dex. Fange"

	para "verschiedene"
	line "#mon!"
	done''')

T("_OakRating05", '''
	text "Du gibst dir Mühe."
	line "Dein #dex wird"

	para "immer besser."
	done''')

T("_OakRating06", '''
	text "Manche #mon"
	line "entwickeln sich"

	para "durch Level,"
	line "andere brauchen"
	cont "Steine."
	done''')

T("_OakRating07", '''
	text "Hast du eine Angel?"
	line "Damit fängst du"
	cont "#mon."
	done''')

T("_OakRating08", '''
	text "Sehr gut! Sammeln"
	line "macht dir Spaß!"
	done''')

T("_OakRating09", '''
	text "Manche #mon gibt"
	line "es nur zu"

	para "bestimmten Tages-"
	line "zeiten."
	done''')

T("_OakRating10", '''
	text "Es wird besser."
	line "Mach weiter so!"
	done''')

T("_OakRating11", '''
	text "Beeindruckend."
	line "Du trainierst"

	para "deine #mon,"
	line "nicht nur fangen."
	done''')

T("_OakRating12", '''
	text "Hast du Kurt schon"
	line "getroffen? Seine"
	cont "Bälle helfen dir."
	done''')

T("_OakRating13", '''
	text "Wow. Du hast mehr"
	line "#mon als die"

	para "letzte #dex-"
	line "Forschungsgruppe."
	done''')

T("_OakRating14", '''
	text "Tauschst du deine"
	line "#mon?"

	para "Allein ist das"
	line "sehr schwer!"
	done''')

T("_OakRating15", '''
	text "Wow! 200 #mon!"
	line "Dein #dex sieht"
	cont "großartig aus!"
	done''')

T("_OakRating16", '''
	text "So viele #mon!"
	line "Du hast mir sehr"
	cont "geholfen!"
	done''')

T("_OakRating17", '''
	text "Fantastisch! Du"
	line "könntest #mon-"
	cont "Professor werden!"
	done''')

T("_OakRating18", '''
	text "Dein #dex ist"
	line "wahnsinn! Du wirst"

	para "noch zum Profi!"
	done''')

T("_OakRating19", '''
	text "Boah! Ein perfekter"
	line "#dex! Davon hab"

	para "ich geträumt!"
	line "Gratulation!"
	done''')

T("_OakPCText4", '''
	text "Verbindung zu"
	line "Prof.Oaks PC"
	cont "beendet."
	done''')

T("_MemoryGameYeahText", '''
	text "!"
	done''')

T("_MemoryGameDarnText", '''
	text "Mist…"
	done''')

T("_StartMenuContestEndText", '''
	text "Wettkampf beenden?"
	done''')

# --- Items / Bag ---
T("_ItemsTossOutHowManyText", '''
	text "Wie viele "
	text_ram wStringBuffer2
	text_plural
	line "wegwerfen?"
	done''')

T("_ItemsDiscardedText", '''
	text ""
	text_ram wStringBuffer1
	text_plural
	line "weggeworfen."
	prompt''')

T("_ItemsOakWarningText", '''
	text "Oak: <PLAYER>!"
	line "Jetzt ist nicht"
	cont "der richtige"
	cont "Zeitpunkt!"
	done''')

T("_PokemonSwapItemText", '''
	text "Nimmt "
	text_ram wStringBuffer1
	text " von"
	line ""
	text_ram wMonOrItemNameBuffer
	text " und"

	para "gibt ihm "
	text_ram wStringBuffer2
	text "."
	prompt''')

T("_PokemonHoldItemText", '''
	text ""
	text_ram wMonOrItemNameBuffer
	line "trägt jetzt "
	text_ram wStringBuffer2
	text "."
	prompt''')

T("_PokemonRemoveMailText", '''
	text "Entferne zuerst"
	line "den Brief."
	prompt''')

T("_PokemonNotHoldingText", '''
	text_ram wMonOrItemNameBuffer
	text " trägt"
	line "kein Item."
	prompt''')

T("_ItemStorageFullText", '''
	text "Item-Lager voll."
	prompt''')

T("_PokemonTookItemText", '''
	text "Nimmt "
	text_ram wStringBuffer1
	line "von "
	text_ram wMonOrItemNameBuffer
	text "."
	prompt''')

T("_PokemonAskSwapItemText", '''
	text_ram wMonOrItemNameBuffer
	text " trägt"
	line "schon "

	para ""
	text_ram wStringBuffer1
	text "."
	line "Items tauschen?"
	done''')

T("_ItemCantHeldText", '''
	text "Dieses Item kann"
	line "nicht getragen"
	cont "werden."
	prompt''')

T("_MailLoseMessageText", '''
	text "Der Briefinhalt"
	line "wird gelöscht."
	cont "Einverstanden?"
	done''')

T("_MailDetachedText", '''
	text "Brief entfernt von"
	line ""
	text_ram wStringBuffer1
	text "."
	prompt''')

T("_MailNoSpaceText", '''
	text "Kein Platz für"
	line "den Brief."
	prompt''')

T("_MailAskSendToPCText", '''
	text "Brief an den PC"
	line "schicken?"
	done''')

T("_MailboxFullText", '''
	text "Dein Briefkasten"
	line "ist voll."
	prompt''')

T("_MailSentToPCText", '''
	text "Der Brief wurde"
	line "an den PC"
	cont "geschickt."
	prompt''')

T("_PokemonNotEnoughHPText", '''
	text "Nicht genug KP!"
	prompt''')

T("_MayRegisterItemText", '''
	text "Ein Item in der"
	line "Tasche kann auf"

	para "Select registriert"
	line "werden."
	done''')

T("_InitialOptionsText", '''
	text "Wähle, wie du"
	line "Polished Crystal"
	cont "spielen möchtest."
	prompt''')

T("_ElmText1", '''
	text "Hallo! Sorry, dass"
	line "du warten musstest!"

if !DEF(DEBUG)
	para "Willkommen in der"
	line "Welt der #mon!"

	para "Ich bin Elm."

	para "Man nennt mich den"
	line "#mon-Professor."
endc
	prompt''')

T("_ElmText2", '''
	text "Diese Welt wird"
	line "von Wesen be-"
	cont "wohnt, die wir"
	cont "#mon nennen.@"
	text_end''')

T("_ElmText4", '''
	text "Menschen und #mon"
	line "leben zusammen"

	para "und unterstützen"
	line "sich gegenseitig."

	para "Manche spielen mit"
	line "#mon, manche"
	cont "kämpfen mit ihnen."
	prompt''')

T("_ElmText5", '''
	text "Aber wir wissen"
	line "nicht alles über"
	cont "#mon."

	para "Es gibt noch viele"
	line "Geheimnisse."

	para "Deshalb studiere"
	line "ich #mon täglich."
	prompt''')

T("_ElmText6", '''
	text "Wie heißt du?"
	prompt''')

T("_ElmText7", '''
	text "<PLAYER>, bist du"
	line "bereit?"

if !DEF(DEBUG)
	para "Dein eigenes"
	line "#mon-Abenteuer"
	cont "beginnt jetzt."

	para "Tolle Zeiten und"
	line "harte Prüfungen"

	para "warten auf dich."

	para "Eine Welt voller"
	line "Träume und #-"
	cont "mon-Abenteuer!"

	para "Los geht's!"
endc

	para "Wir sehen uns!"
	done''')

T("_WarnVBAText", '''
if !DEF(DEBUG)
	text "Warnung!"

	para "Dieser Game Boy-"
	line "Emulator hat Bugs,"

	para "die Polished"
	line "Crystal abstürzen"
	cont "lassen können."

	para "Bitte nutze einen"
	line "genaueren Emulator,"

	para "z. B. BGB, mGBA"
	line "oder Gambatte."
	prompt
else
	text "Emulator-Test"
	line "fehlgeschlagen."
	prompt
endc''')

T("_ClockTimeMayBeWrongText", '''
	text "Die Uhr könnte"
	line "falsch sein."

	para "Bitte stelle die"
	line "Zeit neu ein."
	prompt''')

T("_ClockSetWithControlPadText", '''
	text "Mit dem Steuerkreuz"
	line "einstellen."

	para "Bestätigen: A"
	line "Abbrechen:  B"
	done''')

T("_ClockIsThisOKText", '''
	text "Einverstanden?"
	done''')

T("_ClockHasResetText", '''
	text "Die Uhr wurde"
	line "korrigiert."
	done''')

T("_LinkTimeoutText", '''
	text "Zu viel Zeit"
	line "vergangen. Versuch"
	cont "es noch einmal."
	prompt''')

T("_LinkTradeCantBattleText", '''
	text "Wenn du dieses"
	line "#mon tauschst,"

	para "kannst du nicht"
	line "mehr kämpfen."
	prompt''')

T("_LinkAbnormalMonText", '''
	text "Das "
	text_ram wStringBuffer1
	line "deines Freundes"

	para "scheint nicht in"
	line "Ordnung zu sein!"
	prompt''')

T("_LinkAskTradeForText", '''
	text ""
	text_ram wBufferTrademonNickname
	text " gegen"
	line ""
	text_ram wStringBuffer1
	text " tauschen?"
	done''')

T("_WouldYouLikeToSaveTheGameText", '''
	text "Spiel speichern?"
	done''')

T("_SavedTheGameText", '''
	text "<PLAYER> hat das"
	line "Spiel gespeichert."
	done''')

T("_AnotherSaveFileText", '''
	text "Warnung! Es gibt"
	line "einen Spielstand"

	para "eines anderen"
	line "Spiels."

	para "Überschreiben?"
	done''')

T("_SaveFileCorruptedText", '''
	text "Der Spielstand"
	line "ist beschädigt!"
	prompt''')

T("_GainedItemText", '''
	text "<PLAYER> erhält"
	line ""
	text_ram wStringBuffer4
	text "."
	done''')

T("_GainedMultipleItemsText", '''
	text "<PLAYER> erhält"
	line ""
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " "
	text_ram wStringBuffer4
	text "."
	done''')

T("_PutItemInPocketText", '''
	text "<PLAYER> legt"
	line ""
	text_ram wStringBuffer1
	text " in"
	cont ""
	text_ram wStringBuffer3
	text "."
	prompt''')

T("_PocketIsFullText", '''
	text ""
	text_ram wStringBuffer3
	text " ist"
	line "voll…"
	prompt''')

T("_FoundWingsText", '''
	text "<PLAYER> erhält "
	text_decimal wCurWingQuantity, 1, 2
	line ""
	text_ram wStringBuffer4
	text "."
	done''')

T("_CongratulationsYourPokemonText", '''
	text "Glückwunsch!"
	line "Dein "
	text_ram wStringBuffer2
	text_end''')

T("_EvolvedIntoText", '''
	para "wurde zu"
	line ""
	text_ram wStringBuffer1
	text "!"
	done''')

T("_StoppedEvolvingText", '''
	text "Hmm? "
	text_ram wStringBuffer2
	line "hört auf sich zu"
	cont "entwickeln!"
	prompt''')

T("_EvolvingText", '''
	text "Was? "
	text_ram wStringBuffer2
	line "entwickelt sich!"
	done''')

# --- Shops / Mart ---
T("_MartHowManyText", '''
	text "Wie viele?"
	done''')

T("_MartFinalPriceText", '''
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " "
	text_ram wStringBuffer2
	text_plural
	line "kosten ¥"
	text_decimal hMoneyTemp, 3, 7
	text "."
	done''')

T("_HerbShopLadyIntroText", '''
	text "Hallo,"

	para "ich verkaufe"
	line "preiswerte"
	cont "Kräutermedizin."

	para "Sie wirkt, ist"
	line "aber bitter."

	para "Deine #mon"
	line "mögen sie nicht."

	para "Hihihihi…"
	done''')

T("_HerbalLadyFinalPriceText", '''
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " "
	text_ram wStringBuffer2
	text_plural
	line "kosten ¥"
	text_decimal hMoneyTemp, 3, 7
	text "."
	done''')

T("_HerbalLadyThanksText", '''
	text "Danke, Kleiner."
	line "Hihihihi…"
	done''')

T("_HerbalLadyPackFullText", '''
	text "Oh? Deine Tasche"
	line "ist voll."
	done''')

T("_HerbalLadyNoMoneyText", '''
	text "Hihihi… Du hast"
	line "nicht genug Geld."
	done''')

T("_HerbalLadyComeAgainText", '''
	text "Besuche mich"
	line "wieder. Hihihihi…"
	done''')

T("_BargainShopIntroText", '''
	text "Heh! Interesse an"
	line "Schnäppchen?"

	para "Ich verkaufe"
	line "seltene Items,"

	para "aber nur je ein"
	line "Exemplar."
	done''')

T("_BargainShopFinalPriceText", '''
	text_ram wStringBuffer2
	text " kostet"
	line "¥"
	text_decimal hMoneyTemp, 3, 7
	text ". Kaufen?"
	done''')

T("_BargainShopThanksText", '''
	text "Danke."
	done''')

T("_BargainShopPackFullText", '''
	text "Uhh, deine Tasche"
	line "ist voll."
	done''')

T("_BargainShopSoldOutText", '''
	text "Das hast du schon."
	line "Alles ausverkauft."
	done''')

T("_BargainShopNoFundsText", '''
	text "Uhh, du bist knapp"
	line "bei Kasse."
	done''')

T("_BargainShopComeAgainText", '''
	text "Schau mal wieder"
	line "vorbei."
	done''')

T("_PharmacyIntroText", '''
	text "Was ist? Brauchst"
	line "du Medizin?"
	done''')

T("_HowManyText", '''
	text "Wie viele?"
	done''')

T("_PharmacyFinalPriceText", '''
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " "
	text_ram wStringBuffer2
	text_plural
	line "kosten ¥"
	text_decimal hMoneyTemp, 3, 7
	text "."
	done''')

T("_PharmacyThanksText", '''
	text "Vielen Dank!"
	done''')

T("_PharmacyPackFullText", '''
	text "Du hast keinen"
	line "Platz mehr."
	done''')

T("_PharmacyNoMoneyText", '''
	text "Das reicht nicht"
	line "an Geld."
	done''')

T("_PharmacyComeAgainText", '''
	text "In Ordnung."
	line "Bis die Tage."
	done''')

T("_MartSellHowManyText", '''
	text "Wie viele?"
	done''')

T("_MartSellPriceText", '''
	text "Ich zahle dir"
	line "¥"
	text_decimal hMoneyTemp, 3, 7
	text "."

	para "Reicht das?"
	done''')

T("_MartWelcomeText", '''
	text "Willkommen! Womit"
	line "kann ich dienen?"
	done''')

T("_MartThanksText", '''
	text "Hier, bitte."
	line "Danke schön!"
	done''')

T("_MartNoMoneyText", '''
	text "Du hast nicht"
	line "genug Geld."
	done''')

T("_MartPackFullText", '''
	text "Du kannst keine"
	line "weiteren Items"
	cont "mehr tragen."
	done''')

T("_MartCantBuyText", '''
	text "Das kann ich dir"
	line "nicht abkaufen."
	prompt''')

T("_MartComeAgainText", '''
	text "Komm wieder!"
	done''')

T("_MartAskMoreText", '''
	text "Kann ich noch"
	line "etwas tun?"
	done''')

T("_MartBoughtText", '''
	text "Erhält ¥"
	text_decimal hMoneyTemp, 3, 7
	text " für"
	line ""
	text_ram wStringBuffer2
	text_plural
	text "."
	done''')

T("_SlotsBetHowManyCoinsText", '''
	text "Wie viel setzen?"
	done''')

T("TMMartCostsThisMuchText", '''
	text_ram wStringBuffer2
	text " "
	text_ram wStringBuffer1
	line "kostet ¥"
	text_decimal hMoneyTemp, 3, 7
	text "."
	done''')

T("BTMartHowMayIHelpYouText", '''
	text "Willkommen in der"
	line "Tausch-Ecke!"

	para "Tausche BP gegen"
	line "Preise."
	done''')

T("BTMartCostsThisMuchText", '''
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " "
	text_ram wStringBuffer1
	text_plural
	line "kosten "
	text_decimal hMoneyTemp+1, 2, 4
	text " BP."
	done''')

T("BTMartInsufficientFundsText", '''
	text "Du hast nicht"
	line "genug BP."
	done''')

T("BTMartBagFullText", '''
	text "Deine Tasche ist"
	line "voll."
	done''')

T("BTMartComeAgainText", '''
	text "Komm jederzeit"
	line "wieder!"
	done''')

T("_SlotsStartText", '''
	text "Start!"
	done''')

T("_SlotsNotEnoughCoinsText", '''
	text "Nicht genug"
	line "Münzen."
	prompt''')

T("_SlotsRanOutOfCoinsText", '''
	text "Mist… Keine"
	line "Münzen mehr…"
	done''')

T("_SlotsPlayAgainText", '''
	text "Noch einmal?"
	done''')

T("_SlotsLinedUpText", '''
	text "Bingo!"
	line ""
	text_ram wStringBuffer2
	text " Münzen"
	cont "gewonnen!"
	done''')

T("_SlotsDarnText", '''
	text "Mist!"
	done''')

T("_PhoneWrongNumberText", '''
	text "Äh? Falsche"
	line "Nummer!"
	done''')

T("_PhoneClickText", '''
	text "Klick!"
	done''')

T("_PhoneEllipseText", '''
	text "……"
	done''')

T("_PhoneOutOfAreaText", '''
	text "Die Nummer ist"
	line "außerhalb des"
	cont "Funknetzes."
	done''')

T("_PhoneJustTalkToThemText", '''
	text "Such die Person"
	line "einfach auf!"
	done''')

T("_PasswordAskResetText", '''
	text "Weiter wählen, um"
	line "die Zeit zu setzen."
	prompt''')

T("_PasswordAskResetClockText", '''
	text "Uhr neu stellen?"
	done''')

T("_ClearAllSaveDataText", '''
	text "Spielstand"
	line "löschen?"
	done''')

T("ResetInitialOptionsText", '''
	text "Startoptionen"
	line "zurücksetzen?"
	done''')

T("_LearnedMoveText", '''
	text_ram wMonOrItemNameBuffer
	text " erlernt"
	line ""
	text_ram wStringBuffer2
	text "!"
	text_sound SFX_DEX_FANFARE_50_79
	text_promptbutton
	text_end''')

T("_MoveAskForgetText", '''
	text "Welche Attacke"
	next "vergessen?"

	para ""
	done''')

T("_StopLearningMoveText", '''
	text ""
	text_ram wStringBuffer2
	text " nicht"
	line "erlernen?"
	done''')

T("_DidNotLearnMoveText", '''
	text_ram wMonOrItemNameBuffer
	line "hat "
	text_ram wStringBuffer2
	text " nicht"
	cont "erlernt."
	prompt''')

T("_AskForgetMoveText", '''
	text_ram wMonOrItemNameBuffer
	text " will"
	line ""
	text_ram wStringBuffer2
	text " erlernen!"

	para "Eine alte Attacke"
	line "dafür vergessen?"
	done''')

T("Text_MoveForgetCount", '''
	text "1, 2 und…"
	text_pause
	text_end''')

T("_MoveForgotText", '''
	text " Schwupp!"
	text_pause

	para ""
	text_ram wMonOrItemNameBuffer
	text " hat"
	line ""
	text_ram wStringBuffer1
	text " vergessen."

	para "Und…"
	prompt''')

T("_MoveCantForgetHMText", '''
	text "VM-Attacken können"
	line "nicht vergessen"
	cont "werden."
	prompt''')

T("_CardFlipPlayWithThreeCoinsText", '''
	text "Mit drei Münzen"
	line "spielen?"
	done''')

T("_CardFlipNotEnoughCoinsText", '''
	text "Nicht genug"
	line "Münzen…"
	prompt''')

T("_CardFlipChooseACardText", '''
	text "Zieh eine Karte."
	done''')

T("_CardFlipPlaceYourBetText", '''
	text "Worauf setzen?"
	done''')

T("_CardFlipPlayAgainText", '''
	text "Noch einmal?"
	done''')

T("_CardFlipShuffledText", '''
	text "Die Karten wurden"
	line "gemischt."
	prompt''')

T("_CardFlipYeahText", '''
	text "Yoh!"
	done''')

T("_CardFlipDarnText", '''
	text "Mist…"
	done''')

# --- Pokegear / Buena / Balls / Items ---
T("_GearOutOfServiceText", '''
	text "Du bist außerhalb"
	line "des Service-"
	cont "gebiets."
	prompt''')

T("_PokegearAskWhoCallText", '''
	text "Wen möchtest du"
	line "anrufen?"
	done''')

T("_PokegearPressButtonText", '''
	text "Drücke eine Taste"
	line "zum Beenden."
	done''')

T("_PokegearAskDeleteText", '''
	text "Gespeicherte"
	line "Nummer löschen?"
	done''')

T("_BuenaAskWhichPrizeText", '''
	text "Tausche Punkte"
	line "gegen Preise!"

	para "Welchen Preis"
	line "möchtest du?"
	done''')

T("_BuenaIsThatRightText", '''
	text_ram wStringBuffer1
	text "?"
	line "Stimmt das?"
	done''')

T("_BuenaHereYouGoText", '''
	text "Bitte schön!"
	done''')

T("_BuenaNotEnoughPointsText", '''
	text "Nicht genug"
	line "Punkte."
	done''')

T("_BuenaNoRoomText", '''
	text "Kein Platz dafür."
	done''')

T("_BuenaComeAgainText", '''
	text "Oh. Komm wieder!"
	done''')

T("_BallBrokeFreeText", '''
	text "Mist! Das #mon"
	line "hat sich befreit!"
	prompt''')

T("_BallAppearedCaughtText", '''
	text "Fast hätte es"
	line "geklappt!"
	prompt''')

T("_BallAlmostHadItText", '''
	text "Mist!"
	line "Das war knapp!"
	prompt''')

T("_BallSoCloseText", '''
	text "Verflixt! Es"
	line "hätte beinahe"
	cont "geklappt!"
	prompt''')

T("Text_BallCaught", '''
	text "Toll! "
	text_ram wEnemyMonNickname
	line "wurde gefangen!"
	text_sound SFX_CAUGHT_MON
	text_end''')

T("Text_Waitbutton_2", '''
	text_promptbutton
	text_end''')

T("_CurBoxFullText", '''
	text_ram wStringBuffer1
	text " ist voll."
	prompt''')

T("_MonSentToPCText", '''
	text_ram wMonOrItemNameBuffer
	text " wurde"
	line "nach "
	text_ram wStringBuffer1
	text " geschickt."
	prompt''')

T("_NewDexDataText", '''
	text_ram wEnemyMonNickname
	text " wurde"
	line "im #dex"
	cont "eingetragen."
	text_sound SFX_SLOT_MACHINE_START
	text_promptbutton
	text_end''')

T("_AskGiveNicknameText", '''
	text "Möchtest du "
	text_ram wStringBuffer1
	line "einen Spitznamen"
	cont "geben?"
	done''')

T("_ItemHappinessRoseButStatFellText", '''
	text_ram wStringBuffer1
	text " wurde"
	line "freundlicher."

	para ""
	text_ram wStringBuffer1
	text "s Basis-"
	line ""
	text_ram wStringBuffer2
	text " sank!"
	prompt''')

T("_ItemStatRoseText", '''
	text_ram wStringBuffer1
	text "s"
	line ""
	text_ram wStringBuffer2
	text " stieg."
	prompt''')

T("_ItemCantUseOnMonText", '''
	text "Das geht bei"
	line "diesem #mon"
	cont "nicht."
	prompt''')

T("Text_RepelUsedEarlierIsStillInEffect", '''
	text "Schutz wirkt noch."
	prompt''')

T("_BlueCardBalanceText", '''
	text "Du hast jetzt"
	line ""
	text_decimal wBlueCardBalance, 1, 2
	text " Punkte."
	done''')

T("_CoinCaseCountText", '''
	text "Münzen:"
	line ""
	text_decimal wCoins, 2, 5
	text_end''')

T("Text_RaiseThePPOfWhichMove", '''
	text "AP von welcher"
	line "Attacke erhöhen?"
	done''')

T("Text_RestoreThePPOfWhichMove", '''
	text "AP von welcher"
	line "Attacke auffüllen?"
	done''')

T("Text_PPIsMaxedOut", '''
	text_ram wStringBuffer2
	text "s AP"
	line "sind voll."
	prompt''')

T("Text_PPsIncreased", '''
	text_ram wStringBuffer2
	text "s AP"
	line "wurden erhöht."
	prompt''')

T("Text_PPsMaximized", '''
	text_ram wStringBuffer2
	text "s AP"
	line "sind maximal."
	prompt''')

T("_PPRestoredText", '''
	text "AP aufgefüllt."
	prompt''')

T("_ItemLooksBitterText", '''
	text "Das ist bitter…"
	prompt''')

T("_ItemCantUseOnEggText", '''
	text "Ein Ei kann das"
	line "nicht benutzen."
	prompt''')

T("_ItemOakWarningText", '''
	text "Oak: <PLAYER>!"
	line "Jetzt ist nicht"
	cont "der richtige"
	cont "Zeitpunkt!"
	prompt''')

T("_ItemWontHaveEffectText", '''
	text "Das hätte keinen"
	line "Effekt."
	prompt''')

T("_BallBlockedText", '''
	text "Der Trainer hat"
	line "den Ball"
	cont "abgeblockt!"
	prompt''')

T("_BallDontBeAThiefText", '''
	text "Sei kein Dieb!"
	prompt''')

T("_BallStorageFullText", '''
	text "Das Lager ist voll."
	line "Geht gerade nicht."
	prompt''')

T("_BallDatabaseFullText", '''
	text "Die PC-Datenbank"
	line "ist überlastet."

	para "Bitte speichere"
	line "das Spiel."
	prompt''')

T("Text_MonIsHiddenFromBall", '''
	text "Das #mon ist"
	line "nicht sichtbar!"
	prompt''')

T("Text_MonCantBeCaught", '''
	text "Das #mon kann"
	line "nicht gefangen"
	cont "werden!"
	prompt''')

T("_ItemUsedText", '''
	text "<PLAYER> setzt"
	line ""
	text_ram wStringBuffer2
	text " ein."
	done''')

T("_KnowsMoveText", '''
	text_ram wStringBuffer1
	text " kennt"
	line ""
	text_ram wStringBuffer2
	text "."
	prompt''')

T("_MoveKnowsOneText", '''
	text "Dieses #mon kennt"
	line "nur eine Attacke."
	done''')

T("_AskDeleteMoveText", '''
	text ""
	text_ram wStringBuffer1
	text " ver-"
	line "gessen?"
	done''')

T("_DeleterForgotMoveText", '''
	text "Dein #mon hat"
	line "die Attacke"
	cont "vergessen."
	done''')

T("_DeleterEggText", '''
	text "Ein Ei kennt"
	line "keine Attacken!"
	done''')

T("_DeleterNoComeAgainText", '''
	text "Nein? Komm wieder."
	done''')

T("_DeleterAskWhichMoveText", '''
	text "Welche Attacke"
	line "vergessen?"
	prompt''')

T("_DeleterIntroText", '''
	text "Ähm… Ich bin der"
	line "Attacken-Verlerner."

	para "Ich kann #mon"
	line "Attacken vergessen"
	cont "lassen."

	para "Soll ein #mon"
	line "eine Attacke"
	cont "vergessen?"
	done''')

T("_DeleterAskWhichMonText", '''
	text "Welches #mon?"
	prompt''')

T("Text_DSTIsThatOK", '''
	text " Sommerzeit,"
	line "einverstanden?"
	done''')

T("_TimeAskOkayText", '''
	text ","
	line "einverstanden?"
	done''')

T("_TimesetAskDSTText", '''
	text "Auf Sommerzeit"
	line "umstellen?"
	done''')

T("_TimesetDSTText", '''
	text "Die Uhr wurde um"
	line "eine Stunde"
	cont "vorgestellt."
	prompt''')

T("_TimesetAskNotDSTText", '''
	text "Ist die Sommerzeit"
	line "vorbei?"
	done''')

T("_TimesetNotDSTText", '''
	text "Die Uhr wurde um"
	line "eine Stunde"
	cont "zurückgestellt."
	prompt''')

T("_TimesetAskAdjustDSTText", '''
	text "Uhr für Sommerzeit"
	line "anpassen?"
	done''')

T("_MomLostGearBookletText", '''
	text "Ich habe die"
	line "Anleitung zum"
	cont "#gear verloren."

	para "Komm später"
	line "wieder."
	prompt''')

T("WonderTradeQuestionText", '''
	text "Möchtest du"
	line "tauschen?"
	done''')

T("WonderTradePromptText", '''
	text "Welches #mon"
	line "willst du tauschen?"
	prompt''')

T("WonderTradeCantTradeSpikyEaredPichuText", '''
	text "Dieses Pichu hat"
	line "die Zeit bereist."

	para "Ein Tausch wäre"
	line "riskant,"

	para "Pichu sollte am"
	line "besten hier"
	cont "bleiben."
	prompt''')

T("WonderTradeConfirmText", '''
	text ""
	text_ram wStringBuffer1
	text " zum"
	line "Tausch anbieten?"
	done''')

T("WonderTradeSetupText", '''
	text "Suche Tausch-"
	line "partner…"
	prompt''')

T("WonderTradeReadyText", '''
	text "Tauschpartner"
	line "gefunden."
	prompt''')

T("SilphMartIntroText", '''
	text "Als Mitarbeiter"
	line "kriege ich Firmen-"
	cont "ware!"

	para "Willst du welche?"
	done''')

T("SilphMartComeAgainText", '''
	text "Komm wieder! Ich"
	line "kann das Geld"
	cont "gebrauchen."
	done''')

T("AdventurerMartIntroText", '''
	text "Ich habe seltene"
	line "Items mitgebracht!"
	done''')

T("AdventurerMartComeAgainText", '''
	text "Komm wieder!"
	done''')

T("InformalMartIntroText", '''
	text "Was ist? Brauchst"
	line "du was?"
	done''')

T("BazaarMartIntroText", '''
	text "Schau dir mein"
	line "Angebot an!"
	done''')

T("AlreadyHaveTMText", '''
	text "Diese TM hast du"
	line "schon."
	done''')

T("MartPremierBallText", '''
	text "Du bekommst auch"
	line "einen Premier Ball"
	text_sound SFX_TRANSACTION
	cont "als Bonus."
	done''')

T("ItemCantBeSelectedText", '''
	text "Dieses Item kann"
	line "nicht gewählt"
	cont "werden."
	prompt''')

T("AlreadyInThatBallTextData", '''
	text "Dein #mon ist"
	line "schon in diesem"
	cont "Ball."
	prompt''')

T("CantChangeTradedMonBallTextData", '''
	text "Der Ball eines"
	line "getauschten #mon"
	cont "lässt sich nicht"
	cont "ändern."
	prompt''')


def apply_translations(content: str) -> str:
    missing = []
    for label, body in TRANSLATIONS.items():
        pattern = rf"({re.escape(label)}::\n)(.*?)(?=\nSECTION |\Z)"
        m = re.search(pattern, content, re.DOTALL)
        if not m:
            missing.append(label)
            continue
        replacement = m.group(1) + body
        content = content[:m.start()] + replacement + content[m.end():]
    if missing:
        print(f"WARNING: {len(missing)} labels not found:", file=sys.stderr)
        for lbl in missing[:20]:
            print(f"  - {lbl}", file=sys.stderr)
        if len(missing) > 20:
            print(f"  ... and {len(missing) - 20} more", file=sys.stderr)
    return content


def main() -> None:
    content = COMMON.read_text(encoding="utf-8")
    out = apply_translations(content)
    COMMON.write_text(out, encoding="utf-8", newline="\n")
    print(f"Applied {len(TRANSLATIONS)} translations to {COMMON}")


if __name__ == "__main__":
    main()