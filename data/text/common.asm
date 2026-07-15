SECTION "_FruitBearingTreeText", ROMX
_FruitBearingTreeText::
	text "Ein Baum mit"
	line "Früchten."
	done

SECTION "_HeyItsFruitText", ROMX
_HeyItsFruitText::
	text "Hey, das ist"
	line ""
	text_ram wStringBuffer3
	text "!"
	done

SECTION "_ObtainedOneFruitText", ROMX
_ObtainedOneFruitText::
	text "Erhalten:"
	line ""
	text_ram wStringBuffer3
	text "!"
	done

SECTION "_ObtainedTwoFruitText", ROMX
_ObtainedTwoFruitText::
	text "2x erhalten:"
	line ""
	text_ram wStringBuffer3
	text "!"
	done

SECTION "_ObtainedThreeFruitText", ROMX
_ObtainedThreeFruitText::
	text "3x erhalten:"
	line ""
	text_ram wStringBuffer3
	text "!"
	done

SECTION "_FruitPackIsFullText", ROMX
_FruitPackIsFullText::
	text "Aber die Tasche"
	line "ist voll…"
	done

SECTION "_NoApricornBoxText", ROMX
_NoApricornBoxText::
	text "Es gibt nichts, um"
	line "es reinzutun…"
	done

SECTION "_ApricornBoxIsFullText", ROMX
_ApricornBoxIsFullText::
	text "Die Kokonuss-Box"
	line "ist voll…"
	done

SECTION "_PutAwayTheApricornText", ROMX
_PutAwayTheApricornText::
	text "<PLAYER> steckte"
	line ""
	text_ram wStringBuffer3
	text " in die"
	line "Kokonuss-Box."
	done

SECTION "_NothingHereText", ROMX
_NothingHereText::
	text "Hier ist nichts…"
	done

SECTION "_WantToUseMulchText", ROMX
_WantToUseMulchText::
	text "Dünger benutzen?"
	done

SECTION "_UsedMulchText", ROMX
_UsedMulchText::
	text "<PLAYER> nutzte"
	line "Dünger!"

	para "Der Baum wurde"
	line "gedüngt!"
	done

SECTION "_WhichApricornText", ROMX
_WhichApricornText::
	text "Welche Kokonuss"
	line "soll ich nehmen?"
	done

SECTION "_HowManyShouldIMakeText", ROMX
_HowManyShouldIMakeText::
	text "Wie viele soll ich"
	line "machen?"
	done

SECTION "_HowManyDoYouWantToSellText", ROMX
_HowManyDoYouWantToSellText::
	text "Wie viele willst"
	line "du verkaufen?"
	done

SECTION "_RecoveredSomeHPText", ROMX
_RecoveredSomeHPText::
	text_ram wStringBuffer1
	line "erholte "
	text_decimal wCurHPAnimDeltaHP, 2, 3
	text "KP!"
	done

SECTION "_CuredOfPoisonText", ROMX
_CuredOfPoisonText::
	text_ram wStringBuffer1
	line "wurde geheilt"
	cont "von Vergiftung."
	done

SECTION "_RidOfParalysisText", ROMX
_RidOfParalysisText::
	text_ram wStringBuffer1
	line "wurde von der"
	cont "Paralyse befreit."
	done

SECTION "_BurnWasHealedText", ROMX
_BurnWasHealedText::
	text_ram wStringBuffer1
	line "wurde geheilt"
	cont "von Verbrennung."
	done

SECTION "_WasDefrostedText", ROMX
_WasDefrostedText::
	text_ram wStringBuffer1
	line "wurde aufgetaut."
	done

SECTION "_WokeUpText", ROMX
_WokeUpText::
	text_ram wStringBuffer1
	line "wachte auf."
	done

SECTION "_HealthReturnedText", ROMX
_HealthReturnedText::
	text_ram wStringBuffer1
	line "hat wieder KP."
	done

SECTION "_RevitalizedText", ROMX
_RevitalizedText::
	text_ram wStringBuffer1
	line "ist wiederbelebt."
	done

SECTION "_GrewToLevelText", ROMX
_GrewToLevelText::
	text_ram wStringBuffer1
	text " kam auf Level "
	text_decimal wCurPartyLevel, 1, 3
	text "!"
	text_sound SFX_DEX_FANFARE_50_79
	text_promptbutton
	text_end

SECTION "_CameToItsSensesText", ROMX
_CameToItsSensesText::
	text_ram wStringBuffer1
	line "kam wieder zu"
	cont "sich."
	done

SECTION "_OakTimeWokeUpText", ROMX
_OakTimeWokeUpText::
	text "………………………………"
	line "………………………………"

	para "Zzz… Hm? Was…? Du"
	line "hast mich geweckt!"

	para "Schau mal auf die"
	line "Uhr für mich?"
	prompt

SECTION "_OakTimeWhatTimeIsItText", ROMX
_OakTimeWhatTimeIsItText::
	text "Wie spät ist es?"
	done

SECTION "_OakTimeHowManyMinutesText", ROMX
_OakTimeHowManyMinutesText::
	text "Wie viele Minuten?"
	done

SECTION "_OakTimeWhoaText", ROMX
_OakTimeWhoaText::
	text "Huch!"
	done

SECTION "_OakTimeQuestionMarkText", ROMX
_OakTimeQuestionMarkText::
	text "?"
	done

SECTION "_OakTimeOversleptText", ROMX
_OakTimeOversleptText::
; GSC-DE Crystal dump: "! / Ich habe / verschlafen!"
; printed after "Morgen/Tag … 10:00" on same line - only "!" here
	text "!"
	line "Ich habe"
	cont "verschlafen!"
	done

SECTION "_OakTimeYikesText", ROMX
_OakTimeYikesText::
; GSC-DE Crystal dump: "! / Uah! Ich habe / verschlafen!"
	text "!"
	line "Uah! Ich habe"
	cont "verschlafen!"
	done

SECTION "ProfElmNappedText", ROMX
ProfElmNappedText::
; English PC: "I napped for too long!" — GSC-ton (kein „genickert“)
	text "!"
	line "Ich habe zu"
	cont "lange geschlafen!"
	done

SECTION "_OakTimeSoDarkText", ROMX
_OakTimeSoDarkText::
	text "!"
	line "Kein Wunder,"
	cont "dass es so dunkel"
	cont "ist!"
	done

SECTION "_OakTimeWhatDayIsItText", ROMX
_OakTimeWhatDayIsItText::
	text "Welcher Tag ist"
	line "heute?"
	done

SECTION "_OakTimeIsItText", ROMX
_OakTimeIsItText::
	text ", oder?"
	done

SECTION "_NothingToChooseText", ROMX
_NothingToChooseText::
	text "Es gibt nichts zur"
	line "Auswahl."
	prompt

SECTION "_WhichSidePutOnText", ROMX
_WhichSidePutOnText::
	text "Auf welche Seite"
	line "soll es?"
	done

SECTION "_WhichSidePutAwayText", ROMX
_WhichSidePutAwayText::
	text "Von welcher Seite"
	line "wegräumen?"
	done

SECTION "_PutAwayTheDecoText", ROMX
_PutAwayTheDecoText::
	text "Räume"
	line ""
	text_ram wStringBuffer3
	text " weg."
	prompt

SECTION "_NothingToPutAwayText", ROMX
_NothingToPutAwayText::
	text "Es gibt nichts"
	line "wegzuräumen."
	prompt

SECTION "_SetUpTheDecoText", ROMX
_SetUpTheDecoText::
	text "Stelle"
	line ""
	text_ram wStringBuffer3
	text " auf."
	prompt

SECTION "_PutAwayAndSetUpText", ROMX
_PutAwayAndSetUpText::
	text "Räume"
	line ""
	text_ram wStringBuffer3

	para "weg und stelle"
	line ""
	text_ram wStringBuffer4
	text " auf."
	prompt

SECTION "_AlreadySetUpText", ROMX
_AlreadySetUpText::
	text "Das steht schon"
	line "hier."
	prompt

SECTION "_LookTownMapText", ROMX
_LookTownMapText::
	text "Das ist die"
	line "Stadtkarte."
	done

SECTION "_LookPikachuPosterText", ROMX
_LookPikachuPosterText::
	text "Ein Poster von"
	line "niedl. Pikachu."
	done

SECTION "_LookClefairyPosterText", ROMX
_LookClefairyPosterText::
	text "Ein Poster von"
	line "niedlichem Piepi."
	done

SECTION "_LookJigglypuffPosterText", ROMX
_LookJigglypuffPosterText::
	text "Ein Poster von"
	line "niedlichem Marill."
	done

SECTION "_LookAdorableDecoText", ROMX
_LookAdorableDecoText::
	text "Ein niedliches"
	line ""
	text_ram wStringBuffer3
	text "."
	done

SECTION "DecoConsoleText", ROMX
DecoConsoleText::
	text "Ein glänzendes"
	line ""
	text_ram wStringBuffer3
	text "."
	done

SECTION "_LookGiantDecoText", ROMX
_LookGiantDecoText::
	text "Riesenpuppe! So"
	line "flauschig weich."
	done

SECTION "_MomHiHowAreYouText", ROMX
_MomHiHowAreYouText::
	text "Hi, <PLAYER>! Wie"
	line "geht's dir?"
	prompt

SECTION "_MomFoundAnItemText", ROMX
_MomFoundAnItemText::
	text "Ich fand beim"
	line "Einkauf ein Item,"
	prompt

SECTION "_MomBoughtWithYourMoneyText", ROMX
_MomBoughtWithYourMoneyText::
	text "hab's mit deinem"
	line "Geld gekauft."
	prompt

SECTION "_MomItsInPCText", ROMX
_MomItsInPCText::
	text "Es ist in deinem"
	line "PC. Gefällt dir!"
	done

SECTION "_MomFoundADollText", ROMX
_MomFoundADollText::
	text "Beim Einkauf sah"
	line "ich diese süße"
	cont "Puppe, und"
	prompt

SECTION "_MomItsInYourRoomText", ROMX
_MomItsInYourRoomText::
	text "Sie ist in deinem"
	line "Zimmer. Wirst sie"
	cont "lieben!"
	done

SECTION "_MonWasSentToText", ROMX
_MonWasSentToText::
	text_ram wPlayerTrademonSpeciesName
	line "wurde zu "
	text_ram wOTTrademonSenderName
	text ""
	cont "geschickt."
	done

SECTION "_BidsFarewellToMonText", ROMX
_BidsFarewellToMonText::
	text_ram wOTTrademonSenderName
	line "verabschiedet"
	cont "sich von"
	done

SECTION "_MonNameBidsFarewellText", ROMX
_MonNameBidsFarewellText::
	text_ram wOTTrademonSpeciesName
	text "."
	done

SECTION "_TakeGoodCareOfMonText", ROMX
_TakeGoodCareOfMonText::
	text "Pass gut auf"
	line ""
	text_ram wOTTrademonSpeciesName
	text " auf."
	done

SECTION "_ForYourMonSendsText", ROMX
_ForYourMonSendsText::
	text "Für "
	text_ram wPlayerTrademonSenderName
	text "s"
	line ""
	text_ram wPlayerTrademonSpeciesName
	text ","
	done

SECTION "_OTSendsText", ROMX
_OTSendsText::
	text_ram wOTTrademonSenderName
	line "schickt"
	cont ""
	text_ram wOTTrademonSpeciesName
	text "."
	done

SECTION "_WillTradeText", ROMX
_WillTradeText::
	text_ram wOTTrademonSenderName
	line "tauscht "
	text_ram wOTTrademonSpeciesName
	text_end

SECTION "_ForYourMonWillTradeText", ROMX
_ForYourMonWillTradeText::
	text "gegen "
	text_ram wPlayerTrademonSenderName
	text "s"
	line ""
	text_ram wPlayerTrademonSpeciesName
	text "."
	done

; Oak's Pokémon Talk

SECTION "_OPT_IntroText1", ROMX
_OPT_IntroText1::
	line "MARY: PROF. EICHs"
	done

SECTION "_OPT_IntroText2", ROMX
_OPT_IntroText2::
	line "#mon-Talk!"
	done

SECTION "_OPT_IntroText3", ROMX
_OPT_IntroText3::
	line "Mit mir, MARY!"
	done

SECTION "_OPT_OakText1", ROMX
_OPT_OakText1::
	line "Eich: "
	text_ram wMonOrItemNameBuffer
	done

SECTION "_OPT_OakText2", ROMX
_OPT_OakText2::
	line "ist zu sehen bei"
	done

SECTION "_OPT_OakText3", ROMX
_OPT_OakText3::
	line ""
	text_ram wStringBuffer1
	text "."
	done

SECTION "_OPT_MaryText1", ROMX
_OPT_MaryText1::
	line "MARY: "
	text_ram wStringBuffer1
	text " ist"
	done

SECTION "OPT_SweetAdorably", ROMX
OPT_SweetAdorably::
	line "süß und richtig"
	done

SECTION "OPT_WigglySlickly", ROMX
OPT_WigglySlickly::
	line "wibbelig und"
	done

SECTION "OPT_AptlyNamed", ROMX
OPT_AptlyNamed::
	line "treffend benannt"
	done

SECTION "OPT_UndeniablyKindOf", ROMX
OPT_UndeniablyKindOf::
	line "irgendwie schon"
	done

SECTION "OPT_Unbearably", ROMX
OPT_Unbearably::
	line "so, so unfassbar"
	done

SECTION "OPT_WowImpressively", ROMX
OPT_WowImpressively::
	line "wow, beeindruck."
	done

SECTION "OPT_AlmostPoisonously", ROMX
OPT_AlmostPoisonously::
	line "fast schon giftig"
	done

SECTION "OPT_Sensually", ROMX
OPT_Sensually::
	line "ooh, so sinnlich"
	done

SECTION "OPT_Mischievously", ROMX
OPT_Mischievously::
	line "so schelmisch"
	done

SECTION "OPT_Topically", ROMX
OPT_Topically::
	line "so aktuell"
	done

SECTION "OPT_Addictively", ROMX
OPT_Addictively::
	line "echt suchterreg."
	done

SECTION "OPT_LooksInWater", ROMX
OPT_LooksInWater::
	line "im Wasser wirkt"
	done

SECTION "OPT_EvolutionMustBe", ROMX
OPT_EvolutionMustBe::
	line "Entwicklung ist"
	done

SECTION "OPT_Provocatively", ROMX
OPT_Provocatively::
	line "provozierend"
	done

SECTION "OPT_FlippedOut", ROMX
OPT_FlippedOut::
	line "so durchgedreht"
	done

SECTION "OPT_HeartMeltingly", ROMX
OPT_HeartMeltingly::
	line "herzschmelzend"
	done

SECTION "OPT_Cute", ROMX
OPT_Cute::
	line "süß."
	done

SECTION "OPT_Weird", ROMX
OPT_Weird::
	line "seltsam."
	done

SECTION "OPT_Pleasant", ROMX
OPT_Pleasant::
	line "angenehm."
	done

SECTION "OPT_BoldSortOf", ROMX
OPT_BoldSortOf::
	line "irgendwie mutig."
	done

SECTION "OPT_Frightening", ROMX
OPT_Frightening::
	line "furchteinfl."
	done

SECTION "OPT_SuaveDebonair", ROMX
OPT_SuaveDebonair::
	line "schick & lässig!"
	done

SECTION "OPT_Powerful", ROMX
OPT_Powerful::
	line "kraftvoll."
	done

SECTION "OPT_Exciting", ROMX
OPT_Exciting::
	line "aufregend."
	done

SECTION "OPT_Groovy", ROMX
OPT_Groovy::
	line "groovy!"
	done

SECTION "OPT_Inspiring", ROMX
OPT_Inspiring::
	line "inspirierend."
	done

SECTION "OPT_Friendly", ROMX
OPT_Friendly::
	line "freundlich."
	done

SECTION "OPT_HotHotHot", ROMX
OPT_HotHotHot::
	line "heiß, heiß, heiß!"
	done

SECTION "OPT_Stimulating", ROMX
OPT_Stimulating::
	line "anregend."
	done

SECTION "OPT_Guarded", ROMX
OPT_Guarded::
	line "vorsichtig."
	done

SECTION "OPT_Lovely", ROMX
OPT_Lovely::
	line "lieblich."
	done

SECTION "OPT_Speedy", ROMX
OPT_Speedy::
	line "schnell."
	done

SECTION "_OPT_PokemonChannelText", ROMX
_OPT_PokemonChannelText::
	text "#mon"
	done

; Pokémon Music Channel / Pokémusic

SECTION "_BenIntroText1", ROMX
_BenIntroText1::
	line "Ben: #mon-Mus.-"
	done

SECTION "_BenIntroText2", ROMX
_BenIntroText2::
	line "Kanal! ♪"
	done

SECTION "_BenIntroText3", ROMX
_BenIntroText3::
	line "Hier DJ Ben! ♪"
	done

SECTION "_FernIntroText1", ROMX
_FernIntroText1::
	line "Fern: #musik! ♪"
	done

SECTION "_FernIntroText2", ROMX
_FernIntroText2::
	line "Mit DJ Fern! ♪"
	done

SECTION "_BenFernText1", ROMX
_BenFernText1::
	line "Heute ist "
	text_today
	text ","
	done

SECTION "_BenFernText2A", ROMX
_BenFernText2A::
	line "lasst uns zu"
	done

SECTION "_BenFernText2B", ROMX
_BenFernText2B::
	line "entspannt zu"
	done

SECTION "_BenFernText3A", ROMX
_BenFernText3A::
	line "#mon-Marsch!"
	done

SECTION "_BenFernText3B", ROMX
_BenFernText3B::
	line "#mon-Schlaflied"
	done

; Lucky Channel

SECTION "_LC_Text1", ROMX
_LC_Text1::
	line "Reed: Juhu! Wie"
	done

SECTION "_LC_Text2", ROMX
_LC_Text2::
	line "geht's euch so?"
	done

SECTION "_LC_Text3", ROMX
_LC_Text3::
	line "Ob's euch gut geht"
	done

SECTION "_LC_Text4", ROMX
_LC_Text4::
	line "oder mies dran,"
	done

SECTION "_LC_Text5", ROMX
_LC_Text5::
	line "verpasst nicht die"
	done

SECTION "_LC_Text6", ROMX
_LC_Text6::
	line "Glückszahl-Show!"
	done

SECTION "_LC_Text7", ROMX
_LC_Text7::
	line "Die heutige"
	done

SECTION "_LC_Text8", ROMX
_LC_Text8::
	line "Glückszahl ist "
	text_pause
	text_ram wStringBuffer1
	text "!"
	done

SECTION "_LC_Text9", ROMX
_LC_Text9::
	line "Ich sag's nochmal!"
	done

SECTION "_LC_Text10", ROMX
_LC_Text10::
	line "Trefft sie und ab"
	done

SECTION "_LC_Text11", ROMX
_LC_Text11::
	line "zum Radioturm!"
	done

SECTION "_LC_DragText1", ROMX
_LC_DragText1::
	line "…Mich zu wieder-"
	done

SECTION "_LC_DragText2", ROMX
_LC_DragText2::
	line "holen ist zäh…"
	done

; Places and People

SECTION "_PnP_Text1", ROMX
_PnP_Text1::
	line "Orte und Leute!"
	done

SECTION "_PnP_Text2", ROMX
_PnP_Text2::
	line "Präsentiert von"
	done

SECTION "_PnP_Text3", ROMX
_PnP_Text3::
	line "mir, DJ Lily!"
	done

SECTION "_PnP_Text4", ROMX
_PnP_Text4::
	line ""
	text_ram wStringBuffer2
	text " "
	text_ram wStringBuffer1
	done

SECTION "_PnP_cute", ROMX
_PnP_cute::
	line "ist süß."
	done

SECTION "_PnP_lazy", ROMX
_PnP_lazy::
	line "ist etwas faul."
	done

SECTION "_PnP_happy", ROMX
_PnP_happy::
	line "ist immer froh."
	done

SECTION "_PnP_noisy", ROMX
_PnP_noisy::
	line "ist recht laut."
	done

SECTION "_PnP_precocious", ROMX
_PnP_precocious::
	line "ist frühreif."
	done

SECTION "_PnP_bold", ROMX
_PnP_bold::
	line "ist etwas kühn."
	done

SECTION "_PnP_picky", ROMX
_PnP_picky::
	line "ist zu wählerisch!"
	done

SECTION "_PnP_sortofok", ROMX
_PnP_sortofok::
	line "ist so lala."
	done

SECTION "_PnP_soso", ROMX
_PnP_soso::
	line "ist einfach soso."
	done

SECTION "_PnP_great", ROMX
_PnP_great::
	line "ist echt super."
	done

SECTION "_PnP_mytype", ROMX
_PnP_mytype::
	line "ist mein Typ."
	done

SECTION "_PnP_cool", ROMX
_PnP_cool::
	line "ist cool, oder?"
	done

SECTION "_PnP_inspiring", ROMX
_PnP_inspiring::
	line "ist inspirierend!"
	done

SECTION "_PnP_weird", ROMX
_PnP_weird::
	line "ist etwas seltsam."
	done

SECTION "_PnP_rightforme", ROMX
_PnP_rightforme::
	line "passt das zu mir?"
	done

SECTION "_PnP_odd", ROMX
_PnP_odd::
	line "ist echt komisch!"
	done

SECTION "_PnP_Text5", ROMX
_PnP_Text5::
	line ""
	text_ram wStringBuffer1
	done

SECTION "_RocketRadioText1", ROMX
_RocketRadioText1::
	line "… …Ähm, wir sind"
	done

SECTION "_RocketRadioText2", ROMX
_RocketRadioText2::
	line "Team Rocket!"
	done

SECTION "_RocketRadioText3", ROMX
_RocketRadioText3::
	line "Nach drei Jahren"
	done

SECTION "_RocketRadioText4", ROMX
_RocketRadioText4::
	line "Vorbereitung sind"
	done

SECTION "_RocketRadioText5", ROMX
_RocketRadioText5::
	line "wir wieder aus der"
	done

SECTION "_RocketRadioText6", ROMX
_RocketRadioText6::
	line "Asche erstanden!"
	done

SECTION "_RocketRadioText7", ROMX
_RocketRadioText7::
	line "GIOVANNI! "
	text_pause
	text "Kannst du"
	done

SECTION "_RocketRadioText8", ROMX
_RocketRadioText8::
	line "uns hören?"
	text_pause
	text " Wir haben's!"
	done

SECTION "_RocketRadioText9", ROMX
_RocketRadioText9::
	line ""
	text_pause
	text "Wo ist unser Boss?"
	done

SECTION "_RocketRadioText10", ROMX
_RocketRadioText10::
	line ""
	text_pause
	text "Hört er uns zu?"
	done

SECTION "_BuenaRadioText1", ROMX
_BuenaRadioText1::
	line "BUENA: Hier BUENA!"
	done

SECTION "_BuenaRadioText2", ROMX
_BuenaRadioText2::
	line "Heutiges Passwort!"
	done

SECTION "_BuenaRadioText3", ROMX
_BuenaRadioText3::
	line "Mal überlegen… Es"
	done

SECTION "_BuenaRadioText4", ROMX
_BuenaRadioText4::
	line ""
	text_ram wStringBuffer1
	text "!"
	done

SECTION "_BuenaRadioText5", ROMX
_BuenaRadioText5::
	line "Vergiss es nicht!"
	done

SECTION "_BuenaRadioText6", ROMX
_BuenaRadioText6::
	line "Ich bin im Radio-"
	done

SECTION "_BuenaRadioText7", ROMX
_BuenaRadioText7::
	line "turm von Dukatia!"
	done

SECTION "_BuenaRadioMidnightText1", ROMX
_BuenaRadioMidnightText1::
	line "BUENA: Oh je…"
	done

SECTION "_BuenaRadioMidnightText2", ROMX
_BuenaRadioMidnightText2::
	line "Es ist Mitternacht"
	done

SECTION "_BuenaRadioMidnightText3", ROMX
_BuenaRadioMidnightText3::
	line "ich muss aufhören!"
	done

SECTION "_BuenaRadioMidnightText4", ROMX
_BuenaRadioMidnightText4::
	line "Danke fürs"
	done

SECTION "_BuenaRadioMidnightText5", ROMX
_BuenaRadioMidnightText5::
	line "Zuhören bis zum"
	done

SECTION "_BuenaRadioMidnightText6", ROMX
_BuenaRadioMidnightText6::
	line "Schluss! Bleibt"
	done

SECTION "_BuenaRadioMidnightText7", ROMX
_BuenaRadioMidnightText7::
	line "nicht zu lang wach"
	done

SECTION "_BuenaRadioMidnightText8", ROMX
_BuenaRadioMidnightText8::
	line "Von DJ BUENA!"
	done

SECTION "_BuenaRadioMidnightText9", ROMX
_BuenaRadioMidnightText9::
	text "Ich bin dann weg!"
	done

SECTION "_BuenaRadioMidnightText10", ROMX
_BuenaRadioMidnightText10::
	text "…"
	done

SECTION "_BuenaOffTheAirText", ROMX
_BuenaOffTheAirText::
	line ""
	done

SECTION "Text_EnemyUsed", ROMX
Text_EnemyUsed::
; Trainer item use in battle (not mon send-out)
	text "<ENEMY>"
	line "ben. "
	text_ram wMonOrItemNameBuffer
	text "!"
	prompt

SECTION "Text_EnemyUsedOn", ROMX
Text_EnemyUsedOn::
	text "<ENEMY>"
	line "ben. "
	text_ram wMonOrItemNameBuffer
	cont "an "
	text_ram wEnemyMonNickname
	text "!"
	prompt

SECTION "_AskFloorElevatorText", ROMX
_AskFloorElevatorText::
	text "Welches Stockwerk?"
	done

SECTION "_BugCatchingContestTimeUpText", ROMX
_BugCatchingContestTimeUpText::
	text "Ansager: BEEEP!"

	para "Zeit ist um!"
	done

SECTION "_BugCatchingContestIsOverText", ROMX
_BugCatchingContestIsOverText::
	text "Ansager: Der"
	line "Wettbewerb ist"
	cont "vorbei!"
	done

SECTION "_RepelWoreOffText", ROMX
_RepelWoreOffText::
	text "Der Fernhalter hat"
	line "nachgelassen."
	done

SECTION "UseAnotherRepelText", ROMX
UseAnotherRepelText::
	text "Der Fernhalter hat"
	line "nachgelassen."

	para "Noch einen nutzen?"
	done

SECTION "_JustSawSomeRareMonText", ROMX
_JustSawSomeRareMonText::
	text "Ich sah gerade"
	line "ein seltenes"
	cont ""
	text_ram wStringBuffer1
	text " in"
	cont ""
	text_ram wStringBuffer2
	text "."

	para "Ich ruf dich an,"
	line "wenn ich noch eins"
	cont "sehe, O.K.?"
	prompt

SECTION "_SavingRecordText", ROMX
_SavingRecordText::
	text "Speichere Daten…"
	line "Nicht ausschalten!"
	done

SECTION "_NoCoinsText", ROMX
_NoCoinsText::
	text "Du hast keine"
	line "Münzen."
	prompt

SECTION "_NoCoinCaseText", ROMX
_NoCoinCaseText::
	text "Du hast kein"
	line "Münzetui."
	prompt

SECTION "_NPCTradeCableText", ROMX
_NPCTradeCableText::
	text "O.K., verbinde das"
	line "Link-Kabel."
	prompt

SECTION "Text_NPCTraded", ROMX
Text_NPCTraded::
	text "<PLAYER> tauschte"
	line ""
	text_ram wMonOrItemNameBuffer
	text " gegen"
	cont ""
	text_ram wStringBuffer2
	text " ein."
	done

SECTION "_NPCTradeFanfareText", ROMX
_NPCTradeFanfareText::
	text_sound SFX_DEX_FANFARE_80_109
	text_pause
	text_end

SECTION "_NPCTradeIntroText1", ROMX
_NPCTradeIntroText1::
	text "Ich sammle #mon"
	line "Hast du"
	cont ""
	text_ram wStringBuffer1
	text "?"

	para "Willst du gegen"
	line "mein "
	text_ram wStringBuffer2
	text " tauschen?"
	done

SECTION "_NPCTradeCancelText1", ROMX
_NPCTradeCancelText1::
	text "Du willst nicht"
	line "tauschen? Schade…"
	done

SECTION "_NPCTradeWrongText1", ROMX
_NPCTradeWrongText1::
	text "Huch? Das ist kein"
	line ""
	text_ram wStringBuffer1
	text ". Wie"
	line "enttäuschend…"
	done

SECTION "_NPCTradeCompleteText1", ROMX
_NPCTradeCompleteText1::
	text "Juhu! Hab jetzt"
	line ""
	text_ram wStringBuffer1
	text "! Danke!"
	done

SECTION "_NPCTradeAfterText1", ROMX
_NPCTradeAfterText1::
	text "Hi, wie geht's"
	line "meinem alten"
	cont ""
	text_ram wStringBuffer2
	text "?"
	done

SECTION "_NPCTradeIntroText2", ROMX
_NPCTradeIntroText2::
	text "Hi, ich suche"
	line "dieses #mon."

	para "Wenn du"
	line ""
	text_ram wStringBuffer1
	text " hast,"

	para "tauschst du dann"
	line "gegen "
	text_ram wStringBuffer2
	text "?"
	done

SECTION "_NPCTradeCancelText2", ROMX
_NPCTradeCancelText2::
	text "Du hast auch"
	line "keins?"

	para "Menno, das ist"
	line "echt enttäuschend…"
	done

SECTION "_NPCTradeWrongText2", ROMX
_NPCTradeWrongText2::
	text "Du hast kein"
	line ""
	text_ram wStringBuffer1
	text "? Dann ist das"
	line "eben so."
	done

SECTION "_NPCTradeCompleteText2", ROMX
_NPCTradeCompleteText2::
	text "Super! Danke dir!"

	para "Endlich hab ich"
	line ""
	text_ram wStringBuffer1
	text "."
	done

SECTION "_NPCTradeAfterText2", ROMX
_NPCTradeAfterText2::
	text "Hallo! "
	text_ram wMonOrItemNameBuffer
	line "vom Tausch geht"
	cont "es super!"
	done

SECTION "_NPCTradeIntroText3", ROMX
_NPCTradeIntroText3::
	text_ram wMonOrItemNameBuffer
	line "ist süß, aber ich"
	cont "habe keins."

	para "Hast du"
	line ""
	text_ram wStringBuffer1
	text "?"

	para "Willst du gegen"
	line "mein "
	text_ram wStringBuffer2
	text " tauschen?"
	done

SECTION "_NPCTradeCancelText3", ROMX
_NPCTradeCancelText3::
	text "Du willst nicht"
	line "tauschen? Ach je…"
	done

SECTION "_NPCTradeWrongText3", ROMX
_NPCTradeWrongText3::
	text "Das ist kein"
	line ""
	text_ram wStringBuffer1
	text "."

	para "Tausch mit mir,"
	line "wenn du eins hast."
	done

SECTION "_NPCTradeCompleteText3", ROMX
_NPCTradeCompleteText3::
	text "Toll! Danke dir!"
	line "Ich wollte immer"
	cont ""
	text_ram wMonOrItemNameBuffer
	text "!"
	done

SECTION "_NPCTradeAfterText3", ROMX
_NPCTradeAfterText3::
	text "Wie geht's dem"
	line ""
	text_ram wStringBuffer2
	text ", das ich dir gab?"

	para "Dein "
	text_ram wMonOrItemNameBuffer
	line "ist so süß!"
	done

SECTION "_NPCTradeCompleteText4", ROMX
_NPCTradeCompleteText4::
	text "Hä? Was ist los?"
	done

SECTION "_NPCTradeAfterText4", ROMX
_NPCTradeAfterText4::
	text "Tauschen ist so"
	line "seltsam…"

	para "Ich muss noch viel"
	line "darüber lernen."
	done

SECTION "_MomLeavingText1", ROMX
_MomLeavingText1::
	text "Wow, ein süßes"
	line "#mon."

	para "Wo hast du es her?"

	para "…"

	para "Ach, du gehst auf"
	line "ein Abenteuer…"

	para "O.K.! Ich helfe"
	line "auch."

	para "Aber was kann ich"
	line "für dich tun?"

	para "Ich weiß! Ich spar"
	line "dein Geld."

	para "Auf langer Reise"
	line "zählt jedes Geld."

	para "Soll ich dein Geld"
	line "für dich sparen?"
	done

SECTION "_MomLeavingText2", ROMX
_MomLeavingText2::
	text "O.K., ich kümmere"
	line "mich um dein Geld."

	para "………………"
	prompt

SECTION "_MomLeavingText3", ROMX
_MomLeavingText3::
	text "Sei vorsichtig."

	para "#mon sind deine"
	line "Freunde. Ihr müsst"
	cont "als Team arbeiten."

	para "Los, geh schon!"
	done

SECTION "_MomIsThisAboutYourMoneyText", ROMX
_MomIsThisAboutYourMoneyText::
	text "Hallo! Willkommen"
	line "heim! Du strengst"
	cont "dich echt an."

	para "Ich hab dein"
	line "Zimmer aufgeräumt."

	para "Oder geht's um"
	line "dein Geld?"
	done

SECTION "_MomBankWhatDoYouWantToDoText", ROMX
_MomBankWhatDoYouWantToDoText::
	text "Was möchtest du"
	line "tun?"
	done

SECTION "_MomStoreMoneyText", ROMX
_MomStoreMoneyText::
	text "Wie viel willst du"
	line "sparen?"
	done

SECTION "_MomTakeMoneyText", ROMX
_MomTakeMoneyText::
	text "Wie viel willst du"
	line "abheben?"
	done

SECTION "_MomSaveMoneyText", ROMX
_MomSaveMoneyText::
	text "Willst du etwas"
	line "Geld sparen?"
	done

SECTION "_MomHaventSavedThatMuchText", ROMX
_MomHaventSavedThatMuchText::
	text "So viel hast du"
	line "nicht gespart."
	prompt

SECTION "_MomNotEnoughRoomInWalletText", ROMX
_MomNotEnoughRoomInWalletText::
	text "Du kannst nicht so"
	line "viel abheben."
	prompt

SECTION "_MomInsufficientFundsInWalletText", ROMX
_MomInsufficientFundsInWalletText::
	text "So viel hast du"
	line "nicht."
	prompt

SECTION "_MomNotEnoughRoomInBankText", ROMX
_MomNotEnoughRoomInBankText::
	text "Du kannst nicht so"
	line "viel sparen."
	prompt

SECTION "_MomStartSavingMoneyText", ROMX
_MomStartSavingMoneyText::
	text "O.K., ich spare"
	line "dein Geld. Vertrau"
	cont "mir!"

	para "<PLAYER>, bleib am"
	line "Ball!"
	done

SECTION "_MomStoredMoneyText", ROMX
_MomStoredMoneyText::
	text "Dein Geld ist hier"
	line "sicher! Los geht's"
	done

SECTION "_MomTakenMoneyText", ROMX
_MomTakenMoneyText::
	text "<PLAYER>, gib"
	line "nicht auf!"
	done

SECTION "_MomJustDoWhatYouCanText", ROMX
_MomJustDoWhatYouCanText::
	text "Tu einfach, was du"
	line "kannst."
	done

SECTION "_DayCareManIntroText", ROMX
_DayCareManIntroText::
	text "Ich bin der Hüter."
	line "Soll ich ein"
	cont "#mon"
	cont "großziehen?"
	done

SECTION "_DayCareManIntroEggText", ROMX
_DayCareManIntroEggText::
	text "Ich bin der Hüter."
	line "Kennst du dich mit"
	cont "Eiern aus?"

	para "Ich zog mit meiner"
	line "Frau #mon groß."

	para "Wir waren"
	line "geschockt: ein Ei!"

	para "Ist das nicht"
	line "unglaublich?"

	para "Also, soll ich"
	line "#mon"
	cont "großziehen?"
	done

SECTION "_DayCareLadyIntroText", ROMX
_DayCareLadyIntroText::
	text "Ich bin die"
	line "Hüterin."

	para "Soll ich #mon"
	line "für dich"
	cont "großziehen?"
	done

SECTION "_DayCareLadyIntroEggText", ROMX
_DayCareLadyIntroEggText::
	text "Ich bin die"
	line "Hüterin. Kennst du"
	cont "dich mit Eiern"
	cont "aus?"

	para "Mein Mann und ich"
	line "zogen ein paar"
	cont "#mon groß."

	para "Wir waren"
	line "geschockt: ein Ei!"

	para "Wie unglaublich"
	line "ist das denn?"

	para "Soll ich #mon"
	line "für dich"
	cont "großziehen?"
	done

SECTION "_WhatShouldIRaiseText", ROMX
_WhatShouldIRaiseText::
	text "Was soll ich für"
	line "dich großziehen?"
	prompt

SECTION "_OnlyOneMonText", ROMX
_OnlyOneMonText::
	text "Oh? Aber du hast"
	line "nur ein #mon."
	prompt

SECTION "_CantAcceptEggText", ROMX
_CantAcceptEggText::
	text "Schade, aber ich"
	line "nehme kein Ei."
	prompt

SECTION "_RemoveMailText", ROMX
_RemoveMailText::
	text "Entferne die Post,"
	line "bevor du kommst."
	prompt

SECTION "_LastHealthyMonText", ROMX
_LastHealthyMonText::
	text "Wenn du mir das"
	line "gibst, womit"
	cont "kämpfst du dann?"
	prompt

SECTION "_IllRaiseYourMonText", ROMX
_IllRaiseYourMonText::
	text "O.K. Ich ziehe"
	line "dein "
	text_ram wStringBuffer1
	text " groß."
	prompt

SECTION "_ComeBackLaterText", ROMX
_ComeBackLaterText::
	text "Komm später"
	line "wieder."
	done

SECTION "_AreWeGeniusesText", ROMX
_AreWeGeniusesText::
	text "Sind wir nicht"
	line "genial? Willst du"
	cont "dein "
	text_ram wStringBuffer1
	text " sehen?"
	done

SECTION "_YourMonHasGrownText", ROMX
_YourMonHasGrownText::
	text "Dein "
	text_ram wStringBuffer1
	line "ist stark"
	cont "gewachsen."

	para "Sein Level stieg"
	line "um "
	text_decimal wStringBuffer2 + 1, 1, 3
	text "."

	para "Willst du dein"
	line "#mon zurück,"
	cont "kostet es ¥"
	text_decimal wStringBuffer2 + 2, 3, 5
	text "."
	done

SECTION "_PerfectHeresYourMonText", ROMX
_PerfectHeresYourMonText::
	text "Perfekt! Hier ist"
	line "dein #mon."
	prompt

SECTION "_GotBackMonText", ROMX
_GotBackMonText::
	text "<PLAYER> bekam"
	line ""
	text_ram wStringBuffer1
	text " zurück."
	prompt

SECTION "_BackAlreadyText", ROMX
_BackAlreadyText::
	text "Was, schon zurück?"
	line "Dein "
	text_ram wStringBuffer1

	para "braucht noch etwas"
	line "Zeit bei uns."

	para "Willst du dein"
	line "#mon zurück,"
	cont "kostet es ¥100."
	done

SECTION "_HaveNoRoomText", ROMX
_HaveNoRoomText::
	text "Du hast keinen"
	line "Platz dafür."
	prompt

SECTION "_NotEnoughMoneyText", ROMX
_NotEnoughMoneyText::
	text "Du hast nicht"
	line "genug Geld."
	prompt

SECTION "_OhFineThenText", ROMX
_OhFineThenText::
	text "Ach, gut dann."
	prompt

SECTION "_ComeAgainText", ROMX
_ComeAgainText::
	text "Komm wieder."
	done

SECTION "_NotYetText", ROMX
_NotYetText::
	text "Noch nicht…"
	done

SECTION "_FoundAnEggAgainText", ROMX
_FoundAnEggAgainText::
	text "Ah, du bist es!"

	para "Dein #mon hatte"
	line "noch ein Ei!"

	para "Willst du es?"
	done

SECTION "_FoundAnEggText", ROMX
_FoundAnEggText::
	text "Ah, du bist es!"

	para "Wir zogen dein"
	line "#mon groß, und"

	para "waren so"
	line "überrascht!"

	para "Dein #mon hatte"
	line "ein Ei!"

	para "Wir wissen nicht,"
	line "woher es kam, aber"

	para "dein #mon hatte"
	line "es. Willst du es?"
	done

SECTION "_ReceivedEggText", ROMX
_ReceivedEggText::
	text "<PLAYER> erhält"
	line "das Ei!"
	done

SECTION "_TakeGoodCareOfEggText", ROMX
_TakeGoodCareOfEggText::
	text "Pass gut darauf"
	line "auf."
	done

SECTION "_IllKeepItThanksText", ROMX
_IllKeepItThanksText::
	text "Na gut, ich"
	line "behalte es. Danke!"
	done

SECTION "_NoRoomForEggText", ROMX
_NoRoomForEggText::
	text "Kein Platz im Team"
	line "oder in der Box."
	cont "Komm später vorbei"
	done

SECTION "_NameRaterHelloText", ROMX
_NameRaterHelloText::
	text "Hallo, hallo! Ich"
	line "bin der Namensfux."

	para "Ich bewerte die"
	line "Namen von #mon."

	para "Möchtest du, dass"
	line "ich Namen bewerte?"
	done

SECTION "_NameRaterWhichMonText", ROMX
_NameRaterWhichMonText::
	text "Welches #mon"
	line "soll ich den Namen"
	cont "bewerten?"
	prompt

SECTION "_NameRaterBetterNameText", ROMX
_NameRaterBetterNameText::
	text "Hm… "
	text_ram wStringBuffer1
	text "… ist ganz O.K.."

	para "Aber wie wär's mit"
	line "einem besseren"
	cont "Namen?"

	para "Soll ich ihm einen"
	line "besseren geben?"
	done

SECTION "_NameRaterWhatNameText", ROMX
_NameRaterWhatNameText::
	text "Gut. Welchen Namen"
	line "sollen wir ihm"
	cont "denn geben?"
	prompt

SECTION "_NameRaterFinishedText", ROMX
_NameRaterFinishedText::
	text "Das ist ein"
	line "besserer Name!"

	para "Gut gemacht!"
	done

SECTION "_NameRaterComeAgainText", ROMX
_NameRaterComeAgainText::
	text "O.K., dann. Komm"
	line "mal wieder vorbei."
	done

SECTION "_NameRaterPerfectNameText", ROMX
_NameRaterPerfectNameText::
	text "Hm… "
	text_ram wStringBuffer1
	text "? Toller Name! Er"
	line "ist perfekt."

	para "Behandle es"
	line "liebevoll."
	done

SECTION "_NameRaterEggText", ROMX
_NameRaterEggText::
	text "Wow… das ist nur"
	line "ein Ei."
	done

SECTION "_NameRaterSameNameText", ROMX
_NameRaterSameNameText::
	text "Es sieht wohl"
	line "gleich aus,"

	para "aber der neue Name"
	line "ist viel besser!"

	para "Gut gemacht!"
	done

SECTION "_NameRaterNamedText", ROMX
_NameRaterNamedText::
	text "Gut. Dies #mon"
	line "heißt jetzt"
	cont ""
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "Text_Gained", ROMX
Text_Gained::
	text_ram wStringBuffer1
	text " erhält@"
	text_end

SECTION "Text_ABoostedStringBuffer2ExpPoints", ROMX
Text_ABoostedStringBuffer2ExpPoints::
	line "erhöhte"
	cont ""
	text_decimal wStringBuffer2, 3, 6
	text " EP!"
	prompt

SECTION "Text_StringBuffer2ExpPoints", ROMX
Text_StringBuffer2ExpPoints::
	line ""
	text_decimal wStringBuffer2, 3, 6
	text " EP!"
	prompt

SECTION "Text_GoPkmn", ROMX
Text_GoPkmn::
	text "Los! @"
	text_end

SECTION "Text_DoItPkmn", ROMX
Text_DoItPkmn::
	text "Los, @"
	text_end

SECTION "Text_GoForItPkmn", ROMX
Text_GoForItPkmn::
	text "Hau rein, @"
	text_end

SECTION "Text_YourFoesWeakGetmPkmn", ROMX
Text_YourFoesWeakGetmPkmn::
	text "Der Gegner ist"
	line "schwach! Los, @"
	text_end

SECTION "Text_BattleMonNick01", ROMX
Text_BattleMonNick01::
	text_ram wBattleMonNickname
	text "!"
	done

SECTION "Text_BattleMonNickComma", ROMX
Text_BattleMonNickComma::
	text_ram wBattleMonNickname
	text ",@"
	text_end

SECTION "Text_ThatsEnoughComeBack", ROMX
Text_ThatsEnoughComeBack::
	text ", genug!"
	line "Komm zurück!@"
	text_end

SECTION "Text_OKComeBack", ROMX
Text_OKComeBack::
	text ", O.K.!"
	line "Komm zurück!@"
	text_end

SECTION "Text_GoodComeBack", ROMX
Text_GoodComeBack::
	text ", gut! Komm"
	line "zurück!@"
	text_end

SECTION "Text_ComeBack", ROMX
Text_ComeBack::
	text ", komm zurück!"
	done

SECTION "_BootedTMText", ROMX
_BootedTMText::
	text "TM aktiviert."
	done

SECTION "_BootedHMText", ROMX
_BootedHMText::
	text "VM aktiviert."
	done

SECTION "_ContainedMoveText", ROMX
_ContainedMoveText::
	text "Enthielt"
	line ""
	text_ram wStringBuffer2
	text "."

	para "Einem #mon"
	line ""
	text_ram wStringBuffer2
	cont "beibringen?"
	done

SECTION "_TMHMNotCompatibleText", ROMX
_TMHMNotCompatibleText::
	text_ram wStringBuffer2
	text " ist nicht"
	line "kompatibel mit "
	text_ram wStringBuffer1
	text "."

	para "Kann nicht"
	line ""
	text_ram wStringBuffer2
	text " lernen."
	prompt

SECTION "_BadgeRequiredText", ROMX
_BadgeRequiredText::
	text "Schade! Ein neuer"
	line "Orden ist nötig."
	prompt

SECTION "_CantUseItemText", ROMX
_CantUseItemText::
	text "Kann hier nicht"
	line "benutzt werden."
	prompt

SECTION "_UseCutText", ROMX
_UseCutText::
	text_ram wStringBuffer2
	text " setzt"
	line "Zerschneider ein!"
	prompt

SECTION "_CutNothingText", ROMX
_CutNothingText::
	text "Hier gibt's nichts"
	line "zu zerschneiden."
	prompt

SECTION "_AskFlashText", ROMX
_AskFlashText::
	text "Stockfinster hier."
	line "Blitzlicht nutzen?"
	done

SECTION "_BlindingFlashText", ROMX
_BlindingFlashText::
	text "Ein Blitzlicht"
	line "erhellt den Ort!"
	text_promptbutton
	text_end

SECTION "_UsedSurfText", ROMX
_UsedSurfText::
	text_ram wStringBuffer2
	text " setzt Surfer ein!"
	done

SECTION "_CantSurfText", ROMX
_CantSurfText::
	text "Hier kannst du"
	line "nicht surfen."
	prompt

SECTION "_AlreadySurfingText", ROMX
_AlreadySurfingText::
	text "Du surfst schon."
	line ""
	prompt

SECTION "_AskSurfText", ROMX
_AskSurfText::
	text "Das Wasser ist"
	line "ruhig. Surfen?"
	done

SECTION "_UseWaterfallText", ROMX
_UseWaterfallText::
	text_ram wStringBuffer2
	text " setzt Wasserfall"
	line "ein!"
	done

SECTION "_HugeWaterfallText", ROMX
_HugeWaterfallText::
	text "Wow, ein riesiger"
	line "Wasserfall."
	done

SECTION "_AskWaterfallText", ROMX
_AskWaterfallText::
	text "Willst du"
	line "Wasserfall nutzen?"
	done

SECTION "_UseDigText", ROMX
_UseDigText::
	text_ram wStringBuffer2
	text " setzt Graben ein!"
	done

SECTION "_UseEscapeRopeText", ROMX
_UseEscapeRopeText::
	text "<PLAYER> nutzt ein"
	line "Fluchtseil."
	done

SECTION "_CantUseDigText", ROMX
_CantUseDigText::
	text "Kann hier nicht"
	line "benutzt werden."
	done

SECTION "_CantUseTeleportText", ROMX
_CantUseTeleportText::
	text "Kann hier nicht"
	line "benutzt werden."

	para ""
	done

SECTION "_UseStrengthText", ROMX
_UseStrengthText::
	text_ram wStringBuffer2
	text " setzt Stärke ein!"
	done

SECTION "_MoveBoulderText", ROMX
_MoveBoulderText::
	text_ram wStringBuffer1
	text " kann Felsen"
	line "bewegen."
	prompt

SECTION "_AskStrengthText", ROMX
_AskStrengthText::
	text "Ein #mon könnte"
	line "das bewegen."

	para "Stärke benutzen?"
	done

SECTION "_BouldersMoveText", ROMX
_BouldersMoveText::
	text "Felsen können nun"
	line "bewegt werden!"
	done

SECTION "_BouldersMayMoveText", ROMX
_BouldersMayMoveText::
	text "Ein #mon könnte"
	line "das bewegen."
	done

SECTION "_UseWhirlpoolText", ROMX
_UseWhirlpoolText::
	text_ram wStringBuffer2
	text " setzt Whirlpool"
	line "ein!"
	prompt

SECTION "_MayPassWhirlpoolText", ROMX
_MayPassWhirlpoolText::
	text "Ein wilder"
	line "Whirlpool!"

	para "Ein #mon könnte"
	line "hindurchkommen."
	done

SECTION "_AskWhirlpoolText", ROMX
_AskWhirlpoolText::
	text "Ein Whirlpool"
	line "versperrt den Weg."

	para "Whirlpool"
	line "benutzen?"
	done

SECTION "_UseHeadbuttText", ROMX
_UseHeadbuttText::
	text_ram wStringBuffer2
	text " setzt Kopfnuss"
	line "ein!"
	prompt

SECTION "_HeadbuttNothingText", ROMX
_HeadbuttNothingText::
	text "Nö. Nichts…"
	done

SECTION "_AskHeadbuttText", ROMX
_AskHeadbuttText::
	text "Ein #mon könnte"
	line "im Baum sein."

	para "Kopfnuss benutzen?"
	done

SECTION "_UseRockSmashText", ROMX
_UseRockSmashText::
	text_ram wStringBuffer2
	text " setzt"
if DEF(FAITHFUL)
	line "Gesteinshieb ein!"
else
	line "Mauerdurchbr. ein!"
endc
	prompt

SECTION "_MaySmashText", ROMX
_MaySmashText::
	text "Ein #mon könnte"
	line "dies zerbrechen."
	done

SECTION "_AskRockSmashText", ROMX
_AskRockSmashText::
	text "Der Fels sieht"
	line "zerbrechlich aus."

if DEF(FAITHFUL)
	para "Gesteinshieb"
	line "benutzen?"
else
	para "Mauerdurchbr."
	line "benutzen?"
endc
	done

SECTION "_RodBiteText", ROMX
_RodBiteText::
	text "Oh! Ein Biss!"
	prompt

SECTION "_RodNothingText", ROMX
_RodNothingText::
	text "Nicht mal Zupfen!"

	para "Weiter angeln?"
	done

SECTION "_CantGetOffBikeText", ROMX
_CantGetOffBikeText::
	text "Hier kannst du"
	line "nicht absteigen!"
	done

SECTION "_GotOnBikeText", ROMX
_GotOnBikeText::
	text "<PLAYER> stieg auf"
	line "das "
	text_ram wStringBuffer2
	text "."
	done

SECTION "_GotOffBikeText", ROMX
_GotOffBikeText::
	text "<PLAYER> stieg vom"
	line ""
	text_ram wStringBuffer2
	text " ab."
	done

SECTION "_AskCutText", ROMX
_AskCutText::
	text "Dieser Baum kann"
	line "gefällt werden!"

	para "Zerschneider"
	line "benutzen?"
	done

SECTION "_CanCutText", ROMX
_CanCutText::
	text "Dieser Baum kann"
	line "gefällt werden!"
	done

SECTION "_FoundItemText", ROMX
_FoundItemText::
	text "<PLAYER> findet"
	line ""
	text_ram wStringBuffer3
	text "!"
	done

SECTION "_GotTheItemText", ROMX
_GotTheItemText:
	text "<PLAYER> erhält"
	line ""
	text_ram wStringBuffer4
	text "."
	done

SECTION "_ReceivedTheBadgeText", ROMX
_ReceivedTheBadgeText:
	text "<PLAYER> erhält"
	line "den Orden"
	cont ""
	text_ram wStringBuffer4
	text "."
	done

SECTION "WhiteoutText", ROMX
WhiteoutText::
	text "<PLAYER> hat kein"
	line "kampffähiges"
	cont "#mon mehr!"

	para "<PLAYER> fällt"
	line "in Ohnmacht!"
	done

SECTION "WhiteoutToWildText", ROMX
WhiteoutToWildText::
	text "<PLAYER> hat kein"
	line "kampffähiges"
	cont "#mon mehr!"

	para "<PLAYER> geriet in"
	line "Panik und verlor ¥"
	text_decimal hMoneyTemp, 3, 7
	text "…"

	para "……………… ………………"

	para "<PLAYER> wurde"
	line "ohnmächtig!"
	done

SECTION "WhiteoutToTrainerText", ROMX
WhiteoutToTrainerText::
	text "<PLAYER> hat kein"
	line "kampffähiges"
	cont "#mon mehr!"

	para "<PLAYER> zahlte ¥"
	text_decimal hMoneyTemp, 3, 7
	text " an den Sieger…"

	para "……………… ………………"

	para "<PLAYER> wurde"
	line "ohnmächtig!"
	done

SECTION "ForfeitToTrainerText", ROMX
ForfeitToTrainerText::
	text "<PLAYER> gab den"
	line "Kampf auf…"

	para "<PLAYER> zahlte ¥"
	text_decimal hMoneyTemp, 3, 7
	text " an den Sieger…"

	para "……………… ………………"

	para "<PLAYER> wurde"
	line "ohnmächtig!"
	done

SECTION "_PoisonFaintText", ROMX
_PoisonFaintText::
	text_ram wStringBuffer3
	line "wurde vom Gift"
	cont "geheilt!"
	prompt

SECTION "_UseSweetHoneyText", ROMX
_UseSweetHoneyText::
	text "<PLAYER> verteilte"
if DEF(FAITHFUL)
	line "den Honig!"
else
	line "den süßen Honig!"
endc
	done

SECTION "_SweetHoneyNothingText", ROMX
_SweetHoneyNothingText::
	text "Sieht aus, als sei"
	line "hier nichts…"
	done

SECTION "_SquirtbottleNothingText", ROMX
_SquirtbottleNothingText::
	text "<PLAYER> spritzte"
	line "Wasser."

	para "Aber nichts"
	line "geschah…"
	done

SECTION "_UseSacredAshText", ROMX
_UseSacredAshText::
	text "Alle #mon von"
	line "<PLAYER> geheilt!"
	done

SECTION "Text_AnEGGCantHoldAnItem", ROMX
Text_AnEGGCantHoldAnItem::
	text "Ein Ei kann kein"
	line "Item halten."
	prompt

SECTION "_AskThrowAwayText", ROMX
_AskThrowAwayText::
	text "Wie viele"
	line "wegwerfen?"
	done

SECTION "_AskQuantityThrowAwayText", ROMX
_AskQuantityThrowAwayText::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text "× "
	text_ram wStringBuffer2
	text_plural
	line "wegwerfen?"
	done

SECTION "_ThrewAwayText", ROMX
_ThrewAwayText::
	text_ram wStringBuffer2
	text_plural
	line "weggeworfen."
	prompt

SECTION "_OakThisIsntTheTimeText", ROMX
_OakThisIsntTheTimeText::
	text "Eich: <PLAYER>!"
	line "Das ist jetzt"
	cont "nicht der"
	cont "richtige Moment!"
	prompt

SECTION "Text_YouDontHaveAPkmn", ROMX
Text_YouDontHaveAPkmn::
	text "Du hast kein"
	line "#mon!"
	prompt

SECTION "_RegisteredItemText", ROMX
_RegisteredItemText::
	text_ram wStringBuffer2
	line "registriert."
	prompt

SECTION "UnregisteredItemText", ROMX
UnregisteredItemText::
	text_ram wStringBuffer2
	line "nicht mehr"
	cont "registriert."
	prompt

SECTION "_CantRegisterText", ROMX
_CantRegisterText::
	text "Das kann man"
	line "nicht"
	cont "registrieren."
	prompt

SECTION "_AskItemMoveText", ROMX
_AskItemMoveText::
	text "Wohin verschieben?"
	done

SECTION "Text_AreYouABoyOrAreYouAGirl", ROMX
Text_AreYouABoyOrAreYouAGirl::
	text "Welches Foto zeigt"
	line "dein Ausweis?"
	done

SECTION "Text_SoThisIsYou", ROMX
Text_SoThisIsYou::
	text "Das bist also du?"
	done

SECTION "Text_BattleUser", ROMX
Text_BattleUser::
	text "<USER>@"
	text_end

SECTION "_BattleTookSunlightText", ROMX
_BattleTookSunlightText::
	line "tankt Sonnenlicht!"
	prompt

SECTION "_BattleFlewText", ROMX
_BattleFlewText::
	line "flog hoch hinauf!"
	prompt

SECTION "_BattleDugText", ROMX
_BattleDugText::
	line "grub ein Loch!"
	prompt

SECTION "Text_BreedHuh", ROMX
Text_BreedHuh::
	text "Häh?"
	para "@"
	text_end

SECTION "_BreedEggHatchText", ROMX
_BreedEggHatchText::
	text_ram wStringBuffer1
	text " schlüpfte aus dem"
	line "Ei!"
	text_sound SFX_CAUGHT_MON
	text_promptbutton
	text_end

SECTION "_BreedAskNicknameText", ROMX
_BreedAskNicknameText::
	text "Spitznamen geben"
	line "für "
	text_ram wStringBuffer1
	text "?"
	done

SECTION "_LeftWithDayCareLadyText", ROMX
_LeftWithDayCareLadyText::
	text "Es ist "
	text_ram wBreedMon2Nickname
	line ", das bei der"
	cont "Hüterin blieb."
	done

SECTION "_LeftWithDayCareManText", ROMX
_LeftWithDayCareManText::
	text "Es ist "
	text_ram wBreedMon1Nickname
	line ", das beim"
	cont "Hüter blieb."
	done

SECTION "_BreedNoInterestText", ROMX
_BreedNoInterestText::
	text "Kein Interesse an"
	line ""
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "_BreedAppearsToCareForText", ROMX
_BreedAppearsToCareForText::
	text "Scheint"
	line ""
	text_ram wStringBuffer1
	cont "zu mögen."
	prompt

SECTION "_BreedFriendlyText", ROMX
_BreedFriendlyText::
	text "Ist freundlich zu"
	line ""
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "_BreedShowsInterestText", ROMX
_BreedShowsInterestText::
	text "Zeigt Interesse an"
	line ""
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "_EmptyMailboxText", ROMX
_EmptyMailboxText::
	text "Hier gibt es keine"
	line "Post."
	prompt

SECTION "ClearedMailPutAwayText", ROMX
ClearedMailPutAwayText::
	text "Die geleerte Post"
	line "wurde verstaut."
	prompt

SECTION "MailPackFullText", ROMX
MailPackFullText::
	text "Die Tasche ist"
	line "voll."
	prompt

SECTION "MailMessageLostText", ROMX
MailMessageLostText::
	text "Der Text der Post"
	line "geht verloren."
	cont "O.K.?"
	done

SECTION "MailAlreadyHoldingItemText", ROMX
MailAlreadyHoldingItemText::
	text "Es trägt schon ein"
	line "Item."
	prompt

SECTION "MailEggText", ROMX
MailEggText::
	text "Ein Ei kann keine"
	line "Post halten."
	prompt

SECTION "MailMovedFromBoxText", ROMX
MailMovedFromBoxText::
	text "Post wurde aus dem"
	line "Postfach geholt."
	prompt

SECTION "_ReceivedGiftMonText", ROMX
_ReceivedGiftMonText::
	text "<PLAYER> erhält"
	line ""
	text_ram wMonOrItemNameBuffer
	text "!"
	done

SECTION "_EggSentToPCText", ROMX
_EggSentToPCText::
	text "Das Ei wurde an"
	line ""
	text_ram wStringBuffer1
	text " geschickt."
	prompt

SECTION "_PCGottaHavePokemonText", ROMX
_PCGottaHavePokemonText::
	text "Du brauchst ein"
	line "#mon zum Anruf!"
	prompt

SECTION "_ContestCaughtMonText", ROMX
_ContestCaughtMonText::
	text "Gefangen:"
	line ""
	text_ram wStringBuffer1
	text "!"
	prompt

SECTION "_ContestAskSwitchText", ROMX
_ContestAskSwitchText::
	text "#mon wechseln?"
	done

SECTION "_ContestAlreadyCaughtText", ROMX
_ContestAlreadyCaughtText::
	text "Du fingst schon"
	line "ein "
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "ContestJudging_FirstPlaceText", ROMX
ContestJudging_FirstPlaceText::
	text "Der Sieger des"
	line "Käferfängerwettb."
	cont "ist"
	text_pause
	text "…"

	para ""
	text_ram wBugContestWinnerName
	text ","
	line "der ein"
	cont ""
	text_ram wStringBuffer1
	text " fing!@"
	text_end

SECTION "ContestJudging_FirstPlaceScoreText", ROMX
ContestJudging_FirstPlaceScoreText::
	para "Die Gewinnerzahl"
	line "war "
	text_decimal wBugContestFirstPlaceScore, 2, 3
	text " Punkte!"
	prompt

SECTION "ContestJudging_SecondPlaceText", ROMX
ContestJudging_SecondPlaceText::
	text "Zweiter wurde"
	line ""
	text_ram wBugContestWinnerName
	text ","
	para "der ein"
	line ""
	text_ram wStringBuffer1
	text " fing!@"
	text_end

SECTION "ContestJudging_SecondPlaceScoreText", ROMX
ContestJudging_SecondPlaceScoreText::
	para "Die Zahl war "
	text_decimal wBugContestSecondPlaceScore, 2, 3
	line "Punkte!"
	prompt

SECTION "ContestJudging_ThirdPlaceText", ROMX
ContestJudging_ThirdPlaceText::
	text "Dritter wurde"
	line ""
	text_ram wBugContestWinnerName
	text ","
	para "der ein"
	line ""
	text_ram wStringBuffer1
	text " fing!@"
	text_end

SECTION "ContestJudging_ThirdPlaceScoreText", ROMX
ContestJudging_ThirdPlaceScoreText::
	para "Die Zahl war "
	text_decimal wBugContestThirdPlaceScore, 2, 3
	line "Punkte!"
	prompt

SECTION "_MagikarpGuruMeasureText", ROMX
_MagikarpGuruMeasureText::
	text "Lass mich den"
	line "Karpador messen."

	para "…Hm, er misst"
	line ""
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "_KarpGuruRecordText", ROMX
_KarpGuruRecordText::
	text "Aktueller Rekord"
	para ""
	text_ram wStringBuffer1
	text ", gefangen von "
	text_ram wMagikarpRecordHoldersName
	text_promptbutton
	text_end

SECTION "_LuckyNumberMatchPartyText", ROMX
_LuckyNumberMatchPartyText::
	text "Glückwunsch!"

	para "Wir haben einen"
	line "Treffer mit der ID"

	para "von "
	text_ram wStringBuffer2
	text " in deinem Team."
	prompt

SECTION "_LuckyNumberMatchPCText", ROMX
_LuckyNumberMatchPCText::
	text "Glückwunsch!"

	para "Wir haben einen"
	line "Treffer mit der ID"

	para "von "
	text_ram wStringBuffer2
	text " in Box '"
	text_ram wStringBuffer1
	text "'."
	prompt

SECTION "_CaughtAskNicknameText", ROMX
_CaughtAskNicknameText::
	text "Spitznamen für"
	line "erhaltenes"
	cont ""
	text_ram wStringBuffer1
	text "?"
	done

SECTION "_PokecenterPCCantUseText", ROMX
_PokecenterPCCantUseText::
	text "Bzzzt! Du brauchst"
	line "ein #mon dafür!"
	prompt

SECTION "_PlayersPCTurnOnText", ROMX
_PlayersPCTurnOnText::
	text "<PLAYER> schaltete"
	line "den PC ein."
	prompt

SECTION "_PlayersPCAskWhatDoText", ROMX
_PlayersPCAskWhatDoText::
	text "Was möchtest du"
	line "tun?"
	done

SECTION "_PlayersPCHowManyWithdrawText", ROMX
_PlayersPCHowManyWithdrawText::
	text "Wie viele willst"
	line "du mitnehmen?"
	done

SECTION "_PlayersPCWithdrewItemsText", ROMX
_PlayersPCWithdrewItemsText::
	text "Mitgenommen:"
	line ""
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text "× "
	text_ram wStringBuffer2
	text_plural
	text "."
	prompt

SECTION "_PlayersPCNoRoomWithdrawText", ROMX
_PlayersPCNoRoomWithdrawText::
	text "Kein Platz mehr"
	line "im Beutel."
	prompt

SECTION "_PlayersPCNoItemsText", ROMX
_PlayersPCNoItemsText::
	text "Keine Items hier!"
	prompt

SECTION "_PlayersPCCantDepositItemText", ROMX
_PlayersPCCantDepositItemText::
	text "Das kann man"
	line "nicht ablegen."
	prompt

SECTION "_PlayersPCHowManyDepositText", ROMX
_PlayersPCHowManyDepositText::
	text "Wie viele willst"
	line "du ablegen?"
	done

SECTION "_PlayersPCDepositItemsText", ROMX
_PlayersPCDepositItemsText::
	text "Abgelegt:"
	line ""
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text "× "
	text_ram wStringBuffer2
	text_plural
	text "."
	prompt

SECTION "_PlayersPCNoRoomDepositText", ROMX
_PlayersPCNoRoomDepositText::
	text "Kein Platz zum"
	line "Ablegen."
	prompt

SECTION "_PokecenterPCTurnOnText", ROMX
_PokecenterPCTurnOnText::
	text "<PLAYER> schaltete"
	line "den PC ein."
	prompt

SECTION "_PokecenterPCWhoseText", ROMX
_PokecenterPCWhoseText::
	text "Wessen PC"
	line "aufrufen?"
	done

SECTION "_PokecenterBILLsPCText", ROMX
_PokecenterBillsPCText::
	text "Auf BILLs PC"
	line "zugegriffen."

	para "#mon-Lager-"
	line "System geöffnet."
	prompt

SECTION "_PokecenterPlayersPCText", ROMX
_PokecenterPlayersPCText::
	text "Auf deinen PC"
	line "zugegriffen."

	para "Item-Lager-System"
	line "geöffnet."
	prompt

SECTION "_PokecenterOaksPCText", ROMX
_PokecenterOaksPCText::
	text "Auf PROF. EICHs"
	line "PC zugegriffen."

	para "#dex-Bewertung"
	line "geöffnet."
	prompt

SECTION "_PokecenterPCOaksClosedText", ROMX
_PokecenterPCOaksClosedText::
	text "… Verbindung zu…"
	done

SECTION "_OakPCText1", ROMX
_OakPCText1::
	text "Soll ich deinen"
	line "#dex bewerten?"
	done

SECTION "_OakPCText2", ROMX
_OakPCText2::
	text "Aktueller #dex-"
	line "Füllstand:"
	prompt

SECTION "_OakPCText3", ROMX
_OakPCText3::
	text_decimal wTempDexSeen, 2, 3
	text " #mon gesehen"
	line ""
	text_decimal wTempDexOwn, 2, 3
	text " #mon besessen"

	para "PROF. EICHs"
	line "Bewertung:"
	done

SECTION "_OakRating01", ROMX
_OakRating01::
	text "Such #mon in"
	line "Grasgebieten!"
	done

SECTION "_OakRating02", ROMX
_OakRating02::
	text "Gut. Du weißt"
	line "wohl, wie man"
	cont "Bälle benutzt."
	done

SECTION "_OakRating03", ROMX
_OakRating03::
	text "Du wirst immer"
	line "besser."

	para "Aber es liegt noch"
	line "ein Weg vor dir."
	done

SECTION "_OakRating04", ROMX
_OakRating04::
	text "Fülle deinen"
	line "#dex weiter!"

	para "Fang verschiedene"
	line "Arten von #mon!"
	done

SECTION "_OakRating05", ROMX
_OakRating05::
	text "Du gibst dir Mühe,"
	line "das sehe ich."

	para "Dein #dex nimmt"
	line "Gestalt an."
	done

SECTION "_OakRating06", ROMX
_OakRating06::
	text "Manche #mon"
	line "entwickeln sich"
	cont "durch Wachsen,"

	para "andere durch"
	line "Steine."
	done

SECTION "_OakRating07", ROMX
_OakRating07::
	text "Hast du schon eine"
	line "Angel? Damit"

	para "kannst du #mon"
	line "angeln."
	done

SECTION "_OakRating08", ROMX
_OakRating08::
	text "Exzellent! Du"
	line "sammelst wohl"
	cont "gerne Dinge!"
	done

SECTION "_OakRating09", ROMX
_OakRating09::
	text "Manche #mon"
	line "erscheinen nur zu"

	para "bestimmten"
	line "Tageszeiten."
	done

SECTION "_OakRating10", ROMX
_OakRating10::
	text "Dein #dex füllt"
	line "sich. Mach weiter"
	cont "so gute Arbeit!"
	done

SECTION "_OakRating11", ROMX
_OakRating11::
	text "Beeindruckend. Du"
	line "entwickelst"

	para "#mon, statt sie"
	line "nur zu fangen."
	done

SECTION "_OakRating12", ROMX
_OakRating12::
	text "Kennst du KURT"
	line "schon? Seine Bälle"
	cont "sollten helfen."
	done

SECTION "_OakRating13", ROMX
_OakRating13::
	text "Wow. Du fandest"
	line "mehr #mon als"

	para "das letzte"
	line "#dex-Projekt."
	done

SECTION "_OakRating14", ROMX
_OakRating14::
	text "Tauschst du deine"
	line "#mon?"

	para "Allein ist das"
	line "hart zu schaffen!"
	done

SECTION "_OakRating15", ROMX
_OakRating15::
	text "Toll! Schon 200!"
	line "Dein #dex sieht"
	cont "großartig aus!"
	done

SECTION "_OakRating16", ROMX
_OakRating16::
	text "Du fandest so"
	line "viele #mon!"

	para "Du hast meinen"
	line "Studien geholfen!"
	done

SECTION "_OakRating17", ROMX
_OakRating17::
	text "Großartig! Du"
	line "könntest jetzt"

	para "ein #mon-"
	line "Professor sein!"
	done

SECTION "_OakRating18", ROMX
_OakRating18::
	text "Dein #dex ist"
	line "erstaunlich! Du"

	para "bist bereit, Profi"
	line "zu werden!"
	done

SECTION "_OakRating19", ROMX
_OakRating19::
	text "Huch! Ein"
	line "perfekter #dex!"

	para "Davon träumte ich!"
	line "Glückwunsch!"
	done

SECTION "_OakPCText4", ROMX
_OakPCText4::
	text "Verbindung zu"
	line "PROF. EICHs PC"
	cont "beendet."
	done

SECTION "_MemoryGameYeahText", ROMX
_MemoryGameYeahText::
	text " , ja!"
	done

SECTION "_MemoryGameDarnText", ROMX
_MemoryGameDarnText::
	text "Verdammt…"
	done

SECTION "_StartMenuContestEndText", ROMX
_StartMenuContestEndText::
	text "Willst du den"
	line "Wettbewerb"
	cont "beenden?"
	done

SECTION "_ItemsTossOutHowManyText", ROMX
_ItemsTossOutHowManyText::
	text "Wie viele"
	line ""
	text_ram wStringBuffer2
	text_plural
	text " wegwerfen?"
	done

SECTION "_ItemsDiscardedText", ROMX
_ItemsDiscardedText::
	text "Weggeworfen:"
	line ""
	text_ram wStringBuffer1
	text_plural
	text "."
	prompt

SECTION "_ItemsOakWarningText", ROMX
_ItemsOakWarningText::
	text "Eich: <PLAYER>!"
	line "Das ist jetzt"
	cont "nicht der"
	cont "richtige Moment!"
	done

SECTION "_PokemonSwapItemText", ROMX
_PokemonSwapItemText::
	text "Nahm "
	text_ram wStringBuffer1
	line "von "
	text_ram wMonOrItemNameBuffer

	para "und gab"
	line ""
	text_ram wStringBuffer2
	text "."
	prompt

SECTION "_PokemonHoldItemText", ROMX
_PokemonHoldItemText::
	text_ram wMonOrItemNameBuffer
	line "trägt jetzt"
	cont ""
	text_ram wStringBuffer2
	text "."
	prompt

SECTION "_PokemonRemoveMailText", ROMX
_PokemonRemoveMailText::
	text "Nimm zuerst die"
	line "Post weg."
	prompt

SECTION "_PokemonNotHoldingText", ROMX
_PokemonNotHoldingText::
	text_ram wMonOrItemNameBuffer
	line "trägt nichts!"
	prompt

SECTION "_ItemStorageFullText", ROMX
_ItemStorageFullText::
	text "Kein Platz mehr"
	line "im Item-Lager!"
	prompt

SECTION "_PokemonTookItemText", ROMX
_PokemonTookItemText::
	text "Nahm "
	text_ram wStringBuffer1
	line "von "
	text_ram wMonOrItemNameBuffer
	text "."
	prompt

SECTION "_PokemonAskSwapItemText", ROMX
_PokemonAskSwapItemText::
	text_ram wMonOrItemNameBuffer
	line "trägt schon"

	para ""
	text_ram wStringBuffer1
	text "."

	para "Items tauschen?"
	done

SECTION "_ItemCantHeldText", ROMX
_ItemCantHeldText::
	text "Das kann man"
	line "nicht tragen."
	prompt

SECTION "_MailLoseMessageText", ROMX
_MailLoseMessageText::
	text "Die Post verliert"
	line "den Text. O.K.?"
	done

SECTION "_MailDetachedText", ROMX
_MailDetachedText::
	text "Post von"
	line ""
	text_ram wStringBuffer1
	cont "entfernt."
	prompt

SECTION "_MailNoSpaceText", ROMX
_MailNoSpaceText::
	text "Kein Platz, um"
	line "Post zu entfernen."
	prompt

SECTION "_MailAskSendToPCText", ROMX
_MailAskSendToPCText::
	text "Entfernte Post an"
	line "deinen PC senden?"
	done

SECTION "_MailboxFullText", ROMX
_MailboxFullText::
	text "Dein Postfach ist"
	line "voll."
	prompt

SECTION "_MailSentToPCText", ROMX
_MailSentToPCText::
	text "Die Post wurde an"
	line "deinen PC gesandt."
	prompt

SECTION "_PokemonNotEnoughHPText", ROMX
_PokemonNotEnoughHPText::
	text "Nicht genug KP!"
	prompt

SECTION "_MayRegisterItemText", ROMX
_MayRegisterItemText::
	text "Ein Item in deiner"
	line "Tasche kann"

	para "der Select-Taste"
	line "zugewiesen werden."
	done

SECTION "_InitialOptionsText", ROMX
_InitialOptionsText::
	text "Wähle, wie du"
	line "Polished Crystal"
	cont "spielen willst."
	prompt

SECTION "_ElmText1", ROMX
_ElmText1::
	text "Hallo! Tut mir"
	line "leid, dich warten"
	cont "zu lassen!"

if !DEF(DEBUG)
	para "Willkommen in der"
	line "Welt der #mon!"

	para "Ich bin PROF."
	line "LIND."

	para "Man nennt mich den"
	line "#mon-Professor."
endc
	prompt

SECTION "_ElmText2", ROMX
_ElmText2::
	text "Diese Welt wird"
	line "von Kreaturen"
	cont "bewohnt, die wir"
	cont "#mon nennen.@"
	text_end

SECTION "_ElmText4", ROMX
_ElmText4::
	text "Menschen und"
	line "#mon leben"
	cont "zusammen,"

	para "indem sie sich"
	line "unterstützen."

	para "Manche spielen mit"
	line "#mon, manche"
	cont "kämpfen mit ihnen."
	prompt

SECTION "_ElmText5", ROMX
_ElmText5::
	text "Aber wir wissen"
	line "noch nicht alles"
	cont "über #mon."

	para "Es gibt noch viele"
	line "Rätsel zu lösen."

	para "Darum erforsche"
	line "ich #mon"
	cont "täglich."
	prompt

SECTION "_ElmText6", ROMX
_ElmText6::
	text "Sag mir bitte"
	line "deinen Namen."
	prompt

SECTION "_ElmText7", ROMX
_ElmText7::
	text "<PLAYER>, bist du"
	line "bereit?"

if !DEF(DEBUG)
	para "Deine ganz eigene"
	line "#mon-Geschichte"
	cont "beginnt jetzt."

	para "Dich erwarten"
	line "schöne Momente und"
	cont "harte Prüfungen."

	para "Eine Welt voller"
	line "Träume und"

	para "Abenteuer und"
	line "#mon warten auf"
	cont "dich! Los!"
endc

	para "Wir sehen uns"
	line "später!"
	done

SECTION "_WarnVBAText", ROMX
_WarnVBAText::
if !DEF(DEBUG)
	text "Warnung!"

	para "Dieser Game Boy"
	line "Emulator hat Bugs,"

	para "die Polished"
	line "Crystal abstürzen"
	cont "lassen können."

	para "Bitte nutze einen"
	line "genaueren"
	cont "Emulator,"

	para "wie BGB, mGBA oder"
	line "Gambatte."
	prompt
else
	text "Emulator-Test"
	line "fehlgeschlagen."
	prompt
endc

SECTION "_ClockTimeMayBeWrongText", ROMX
_ClockTimeMayBeWrongText::
	text "Die Uhrzeit könnte"
	line "falsch sein."

	para "Bitte stelle die"
	line "Zeit neu ein."
	prompt

SECTION "_ClockSetWithControlPadText", ROMX
_ClockSetWithControlPadText::
	text "Mit dem"
	line "Steuerkreuz"
	cont "einstellen."

	para "Bestätigen: A"
	line "Abbrechen: B"
	done

SECTION "_ClockIsThisOKText", ROMX
_ClockIsThisOKText::
	text "Stimmt das?"
	done

SECTION "_ClockHasResetText", ROMX
_ClockHasResetText::
	text "Die Uhr wurde neu"
	line "gestellt."
	done

SECTION "_LinkTimeoutText", ROMX
_LinkTimeoutText::
	text "Zu viel Zeit ist"
	line "vergangen. Bitte"
	cont "versuch's erneut."
	prompt

SECTION "_LinkTradeCantBattleText", ROMX
_LinkTradeCantBattleText::
	text "Tauschst du das"
	line "#mon, kannst du"
	cont "nicht kämpfen."
	prompt

SECTION "_LinkAbnormalMonText", ROMX
_LinkAbnormalMonText::
	text "Das "
	text_ram wStringBuffer1
	line "deines Freundes"
	cont "scheint anormal!"
	prompt

SECTION "_LinkAskTradeForText", ROMX
_LinkAskTradeForText::
	text "Tausche "
	text_ram wBufferTrademonNickname
	line "gegen "
	text_ram wStringBuffer1
	text "?"
	done

SECTION "_WouldYouLikeToSaveTheGameText", ROMX
_WouldYouLikeToSaveTheGameText::
	text "Möchtest du dein"
	line "Spiel speichern?"
	done

SECTION "_SavedTheGameText", ROMX
_SavedTheGameText::
	text "<PLAYER> speicherte"
	line "das Spiel."
	done

SECTION "_AnotherSaveFileText", ROMX
_AnotherSaveFileText::
	text "Warnung! Es gibt"
	line "einen Spielstand"
	cont "von einem anderen"
	cont "Spiel."

	para "Diesen Spielstand"
	line "überschreiben?"
	done

SECTION "_SaveFileCorruptedText", ROMX
_SaveFileCorruptedText::
	text "Der Spielstand ist"
	line "beschädigt!"
	prompt

SECTION "_GainedItemText", ROMX
_GainedItemText::
	text "<PLAYER> erhält"
	line ""
	text_ram wStringBuffer4
	text "."
	done

SECTION "_GainedMultipleItemsText", ROMX
_GainedMultipleItemsText::
	text "<PLAYER> erhält"
	line ""
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " "
	text_ram wStringBuffer4
	text "."
	done

SECTION "_PutItemInPocketText", ROMX
_PutItemInPocketText::
	; Item + Fach je eigene Zeile (sonst Overflow:
	; "Oranbeere in die Beeren." u.ä. >> 18)
	text "<PLAYER> steckte"
	line ""
	text_ram wStringBuffer1
	line "in die"
	line ""
	text_ram wStringBuffer3
	text "."
	prompt

SECTION "_PocketIsFullText", ROMX
_PocketIsFullText::
	text "Die Tasche"
	line "ist voll…"
	prompt

SECTION "_FoundWingsText", ROMX
_FoundWingsText::
	text "<PLAYER> erhält "
	text_decimal wCurWingQuantity, 1, 2
	line ""
	text_ram wStringBuffer4
	text "."
	done

SECTION "_CongratulationsYourPokemonText", ROMX
_CongratulationsYourPokemonText::
	text "Glückwunsch! Dein"
	line ""
	text_ram wStringBuffer2
	text_end

SECTION "_EvolvedIntoText", ROMX
_EvolvedIntoText::
	para "entwickelt sich zu"
	line ""
	text_ram wStringBuffer1
	text "!"
	done

SECTION "_StoppedEvolvingText", ROMX
_StoppedEvolvingText::
	text "Huch? "
	text_ram wStringBuffer2
	line "hörte auf, sich"
	cont "zu entwickeln!"
	prompt

SECTION "_EvolvingText", ROMX
_EvolvingText::
	text "Was? "
	text_ram wStringBuffer2
	line "entwickelt sich!"
	done

SECTION "_MartHowManyText", ROMX
_MartHowManyText::
	text "Wie viele?"
	done

SECTION "_MartFinalPriceText", ROMX
_MartFinalPriceText::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text "× "
	text_ram wStringBuffer2
	text_plural
	line "kosten ¥"
	text_decimal hMoneyTemp, 3, 7
	text "."
	done

SECTION "_HerbShopLadyIntroText", ROMX
_HerbShopLadyIntroText::
	text "Hallo, Lieber!"

	para "Ich verkaufe"
	line "billige Kräuter."

	para "Sie sind gut, aber"
	line "etwas bitter."

	para "Deinem #mon"
	line "schmecken sie"
	cont "vielleicht nicht."

	para "Hehehehe…"
	done

SECTION "_HerbalLadyFinalPriceText", ROMX
_HerbalLadyFinalPriceText::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " "
	text_ram wStringBuffer2
	text_plural
	line "kosten ¥"
	text_decimal hMoneyTemp, 3, 7
	text "."
	done

SECTION "_HerbalLadyThanksText", ROMX
_HerbalLadyThanksText::
	text "Danke, Lieber!"
	line "Hehehehe…"
	done

SECTION "_HerbalLadyPackFullText", ROMX
_HerbalLadyPackFullText::
	text "Oh? Deine Tasche"
	line "ist voll, Lieber."
	done

SECTION "_HerbalLadyNoMoneyText", ROMX
_HerbalLadyNoMoneyText::
	text "Hehehe… Du hast"
	line "nicht genug Geld."
	done

SECTION "_HerbalLadyComeAgainText", ROMX
_HerbalLadyComeAgainText::
	text "Komm wieder,"
	line "Lieber. Hehehehe…"
	done

SECTION "_BargainShopIntroText", ROMX
_BargainShopIntroText::
	text "Hiya! Willst du"
	line "Schnäppchen sehen?"

	para "Ich verkaufe"
	line "seltene Items, die"

	para "sonst niemand hat"
	line "aber nur je eins."
	done

SECTION "_BargainShopFinalPriceText", ROMX
_BargainShopFinalPriceText::
	text_ram wStringBuffer2
	text " kostet ¥"
	text_decimal hMoneyTemp, 3, 7
	text ". Willst du's?"
	done

SECTION "_BargainShopThanksText", ROMX
_BargainShopThanksText::
	text "Danke."
	done

SECTION "_BargainShopPackFullText", ROMX
_BargainShopPackFullText::
	text "Oh-oh, deine"
	line "Tasche ist voll."
	done

SECTION "_BargainShopSoldOutText", ROMX
_BargainShopSoldOutText::
	text "Das kauftest du"
	line "schon. Ich bin"
	cont "ausverkauft davon."
	done

SECTION "_BargainShopNoFundsText", ROMX
_BargainShopNoFundsText::
	text "Oh-oh, dir fehlt"
	line "das Geld."
	done

SECTION "_BargainShopComeAgainText", ROMX
_BargainShopComeAgainText::
	text "Schau mal wieder"
	line "vorbei."
	done

SECTION "_PharmacyIntroText", ROMX
_PharmacyIntroText::
	text "Brauchst du"
	line "Medizin?"
	done

SECTION "_HowManyText", ROMX
_HowManyText::
	text "Wie viele?"
	done

SECTION "_PharmacyFinalPriceText", ROMX
_PharmacyFinalPriceText::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " "
	text_ram wStringBuffer2
	text_plural
	line "kosten ¥"
	text_decimal hMoneyTemp, 3, 7
	text "."
	done

SECTION "_PharmacyThanksText", ROMX
_PharmacyThanksText::
	text "Vielen Dank!"
	done

SECTION "_PharmacyPackFullText", ROMX
_PharmacyPackFullText::
	text "Du hast keinen"
	line "Platz mehr."
	done

SECTION "_PharmacyNoMoneyText", ROMX
_PharmacyNoMoneyText::
	text "Huch? Das ist"
	line "nicht genug Geld."
	done

SECTION "_PharmacyComeAgainText", ROMX
_PharmacyComeAgainText::
	text "Gut. Bis dann."
	done

SECTION "_MartSellHowManyText", ROMX
_MartSellHowManyText::
	text "Wie viele?"
	done

SECTION "_MartSellPriceText", ROMX
_MartSellPriceText::
	text "Ich zahle dir ¥"
	text_decimal hMoneyTemp, 3, 7
	text "."

	para "Ist das O.K.?"
	done

SECTION "_MartWelcomeText", ROMX
_MartWelcomeText::
	text "Willkommen!"
	line "Was darf es sein?"
	done

SECTION "_MartThanksText", ROMX
_MartThanksText::
	text "Hier, bitte!"
	line "Danke schön!"
	done

SECTION "_MartNoMoneyText", ROMX
_MartNoMoneyText::
	text "Du hast nicht"
	line "genug Geld."
	done

SECTION "_MartPackFullText", ROMX
_MartPackFullText::
	text "Du hast keinen"
	line "Platz mehr!"
	done

SECTION "_MartCantBuyText", ROMX
_MartCantBuyText::
	text "Das kann ich"
	line "nicht gebrauchen."
	prompt

SECTION "_MartComeAgainText", ROMX
_MartComeAgainText::
	text "Komm bald wieder!"
	done

SECTION "_MartAskMoreText", ROMX
_MartAskMoreText::
	text "Kann ich dir noch"
	line "helfen?"
	done

SECTION "_MartBoughtText", ROMX
_MartBoughtText::
	text "¥"
	text_decimal hMoneyTemp, 3, 7
	text " für"
	line ""
	text_ram wStringBuffer2
	text_plural
	text " erhalten."
	done

SECTION "_SlotsBetHowManyCoinsText", ROMX
_SlotsBetHowManyCoinsText::
	text "Wie viele Münzen"
	line "setzen?"
	done

SECTION "TMMartCostsThisMuchText", ROMX
TMMartCostsThisMuchText::
	text_ram wStringBuffer2
	text " "
	text_ram wStringBuffer1
	line "kostet ¥"
	text_decimal hMoneyTemp, 3, 7
	text "."
	done

SECTION "BTMartHowMayIHelpYouText", ROMX
BTMartHowMayIHelpYouText::
	text "Willkommen im"
	line "Tauschservice-"
	cont "Zentrum!"

	para "Du kannst KP gegen"
	line "Preise tauschen."
	done

SECTION "BTMartCostsThisMuchText", ROMX
BTMartCostsThisMuchText::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " "
	text_ram wStringBuffer1
	text_plural
	line "kosten "
	text_decimal hMoneyTemp+1, 2, 4
	text " KP."
	done

SECTION "BTMartInsufficientFundsText", ROMX
BTMartInsufficientFundsText::
	text "Schade, du hast"
	line "nicht genug KP."
	done

SECTION "BTMartBagFullText", ROMX
BTMartBagFullText::
	text "Schade, aber deine"
	line "Tasche ist voll."
	done

SECTION "BTMartComeAgainText", ROMX
BTMartComeAgainText::
	text "Komm jederzeit"
	line "gerne wieder!"
	done

SECTION "_SlotsStartText", ROMX
_SlotsStartText::
	text "Los!"
	done

SECTION "_SlotsNotEnoughCoinsText", ROMX
_SlotsNotEnoughCoinsText::
	text "Nicht genug"
	line "Münzen."
	prompt

SECTION "_SlotsRanOutOfCoinsText", ROMX
_SlotsRanOutOfCoinsText::
	text "Verdammt… Münzen"
	line "ausgegangen…"
	done

SECTION "_SlotsPlayAgainText", ROMX
_SlotsPlayAgainText::
	text "Nochmal spielen?"
	done

SECTION "_SlotsLinedUpText", ROMX
_SlotsLinedUpText::
	text "aufgereiht! Gewann"
	line ""
	text_ram wStringBuffer2
	text " Münzen!"
	done

SECTION "_SlotsDarnText", ROMX
_SlotsDarnText::
	text "Verdammt!"
	done

SECTION "_PhoneWrongNumberText", ROMX
_PhoneWrongNumberText::
	text "Huch? Falsche"
	line "Nummer!"
	done

SECTION "_PhoneClickText", ROMX
_PhoneClickText::
	text "Klick!"
	done

SECTION "_PhoneEllipseText", ROMX
_PhoneEllipseText::
	text "……"
	done

SECTION "_PhoneOutOfAreaText", ROMX
_PhoneOutOfAreaText::
	text "Diese Nummer ist"
	line "außer Reichweite."
	done

SECTION "_PhoneJustTalkToThemText", ROMX
_PhoneJustTalkToThemText::
	text "Sprich einfach mit"
	line "dieser Person!"
	done

SECTION "_PasswordAskResetText", ROMX
_PasswordAskResetText::
	text "Wähle Fortsetzen,"
	line "um Zeit zu setzen."
	prompt

SECTION "_PasswordAskResetClockText", ROMX
_PasswordAskResetClockText::
	text "Uhr zurücksetzen?"
	done

SECTION "_ClearAllSaveDataText", ROMX
_ClearAllSaveDataText::
	text "Alle Spielstände"
	line "löschen?"
	done

SECTION "ResetInitialOptionsText", ROMX
ResetInitialOptionsText::
	text "Anfangsoptionen"
	line "zurücksetzen?"
	done

SECTION "_LearnedMoveText", ROMX
_LearnedMoveText::
	text_ram wMonOrItemNameBuffer
	text " lernte"
	line ""
	text_ram wStringBuffer2
	text "!"
	text_sound SFX_DEX_FANFARE_50_79
	text_promptbutton
	text_end

SECTION "_MoveAskForgetText", ROMX
_MoveAskForgetText::
	text "Welche Attacke"
	next "vergessen?"

	para ""
	done

SECTION "_StopLearningMoveText", ROMX
_StopLearningMoveText::
	text "Erlernen von"
	line ""
	text_ram wStringBuffer2
	text " abbrechen?"
	done

SECTION "_DidNotLearnMoveText", ROMX
_DidNotLearnMoveText::
	text_ram wMonOrItemNameBuffer
	line "lernte"
	cont ""
	text_ram wStringBuffer2
	text " nicht."
	prompt

SECTION "_AskForgetMoveText", ROMX
_AskForgetMoveText::
	text_ram wMonOrItemNameBuffer
	line "will lernen:"
	cont ""
	text_ram wStringBuffer2
	text "!"

	para "Soll dafür eine"
	line "alte Attacke"
	cont "vergessen werden?"
	done

SECTION "Text_MoveForgetCount", ROMX
Text_MoveForgetCount::
	text "1, 2 und…"
	text_pause
	text_end

SECTION "_MoveForgotText", ROMX
_MoveForgotText::
	text " Puff!"
	text_pause

	para ""
	text_ram wMonOrItemNameBuffer
	text " vergaß"
	line ""
	text_ram wStringBuffer1
	text "."

	para "Und…"
	prompt

SECTION "_MoveCantForgetHMText", ROMX
_MoveCantForgetHMText::
	text "VM-Attacken können"
	line "das nicht."
	prompt

SECTION "_CardFlipPlayWithThreeCoinsText", ROMX
_CardFlipPlayWithThreeCoinsText::
	text "Mit drei Münzen"
	line "spielen?"
	done

SECTION "_CardFlipNotEnoughCoinsText", ROMX
_CardFlipNotEnoughCoinsText::
	text "Nicht genug"
	line "Münzen…"
	prompt

SECTION "_CardFlipChooseACardText", ROMX
_CardFlipChooseACardText::
	text "Wähle eine Karte."
	done

SECTION "_CardFlipPlaceYourBetText", ROMX
_CardFlipPlaceYourBetText::
	text "Setze deinen"
	line "Einsatz."
	done

SECTION "_CardFlipPlayAgainText", ROMX
_CardFlipPlayAgainText::
	text "Nochmal spielen?"
	done

SECTION "_CardFlipShuffledText", ROMX
_CardFlipShuffledText::
	text "Die Karten wurden"
	line "gemischt."
	prompt

SECTION "_CardFlipYeahText", ROMX
_CardFlipYeahText::
	text "Ja!"
	done

SECTION "_CardFlipDarnText", ROMX
_CardFlipDarnText::
	text "Verdammt…"
	done

SECTION "_GearTodayText", ROMX
_GearTodayText::
	text_today
	text_end

SECTION "_GearEllipseText", ROMX
_GearEllipseText::
	text "……"
	done

SECTION "_GearOutOfServiceText", ROMX
_GearOutOfServiceText::
	text "Außerhalb des"
	line "Empfangsbereichs."
	prompt

SECTION "_PokegearAskWhoCallText", ROMX
_PokegearAskWhoCallText::
	text "Wen möchtest du"
	line "anrufen?"
	done

SECTION "_PokegearPressButtonText", ROMX
_PokegearPressButtonText::
	text "Drück einen Knopf"
	line "zum Beenden."
	done

SECTION "_PokegearAskDeleteText", ROMX
_PokegearAskDeleteText::
	text "Diese Nummer"
	line "löschen?"
	done

SECTION "_BuenaAskWhichPrizeText", ROMX
_BuenaAskWhichPrizeText::
	text "Du kannst deine"
	line "Punkte einlösen"

	para "für einen tollen"
	line "Preis nach Wahl!"

	para "Welchen Preis"
	line "möchtest du?"
	done

SECTION "_BuenaIsThatRightText", ROMX
_BuenaIsThatRightText::
	text_ram wStringBuffer1
	text "? Ist das richtig?"
	done

SECTION "_BuenaHereYouGoText", ROMX
_BuenaHereYouGoText::
	text "Hier, bitte!"
	done

SECTION "_BuenaNotEnoughPointsText", ROMX
_BuenaNotEnoughPointsText::
	text "Du hast nicht"
	line "genug Punkte."
	done

SECTION "_BuenaNoRoomText", ROMX
_BuenaNoRoomText::
	text "Du hast keinen"
	line "Platz dafür."
	done

SECTION "_BuenaComeAgainText", ROMX
_BuenaComeAgainText::
	text "Oh. Komm bitte"
	line "wieder!"
	done

SECTION "_BallBrokeFreeText", ROMX
_BallBrokeFreeText::
	text "Oh nein! Das"
	line "#mon riss sich"
	cont "los!"
	prompt

SECTION "_BallAppearedCaughtText", ROMX
_BallAppearedCaughtText::
	text "Ohh! Es sah aus,"
	line "als wär's"
	cont "gefangen!"
	prompt

SECTION "_BallAlmostHadItText", ROMX
_BallAlmostHadItText::
	text "Aargh! So knapp!"
	prompt

SECTION "_BallSoCloseText", ROMX
_BallSoCloseText::
	text "Mist! War auch so"
	line "knapp dran!"
	prompt

SECTION "Text_BallCaught", ROMX
Text_BallCaught::
	text "Fang geglückt!"
	line ""
	text_ram wEnemyMonNickname
	cont "wurde gefangen!"
	text_sound SFX_CAUGHT_MON
	text_end

SECTION "Text_Waitbutton_2", ROMX
Text_Waitbutton_2::
	text_promptbutton
	text_end

SECTION "_CurBoxFullText", ROMX
_CurBoxFullText::
	text_ram wStringBuffer1
	text " ist voll."
	prompt

SECTION "_MonSentToPCText", ROMX
_MonSentToPCText::
	text_ram wMonOrItemNameBuffer
	text " wurde"
	line "geschickt an"
	cont ""
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "_NewDexDataText", ROMX
_NewDexDataText::
	text_ram wEnemyMonNickname
	text "s Daten wurden neu"
	line "zum #dex"
	cont "ergänzt."
	text_sound SFX_SLOT_MACHINE_START
	text_promptbutton
	text_end

SECTION "_AskGiveNicknameText", ROMX
_AskGiveNicknameText::
	text "Spitznamen geben"
	line "für "
	text_ram wStringBuffer1
	text "?"
	done

SECTION "_ItemHappinessRoseButStatFellText", ROMX
_ItemHappinessRoseButStatFellText::
	text_ram wStringBuffer1
	text " wurde"
	line "freundlicher."
	para ""
	text_ram wStringBuffer1
	text "s"
	line ""
	text_ram wStringBuffer2
	text " sank!"
	prompt

SECTION "_ItemStatRoseText", ROMX
_ItemStatRoseText::
	text_ram wStringBuffer1
	text "s"
	line ""
	text_ram wStringBuffer2
	text " stieg."
	prompt

SECTION "_ItemCantUseOnMonText", ROMX
_ItemCantUseOnMonText::
	text "Bei diesem #mon"
	line "kann das nicht"
	cont "benutzt werden."
	prompt

SECTION "Text_RepelUsedEarlierIsStillInEffect", ROMX
Text_RepelUsedEarlierIsStillInEffect::
	text "Das zuvor benutzte"
	line "Repel wirkt noch."
	prompt

SECTION "_BlueCardBalanceText", ROMX
_BlueCardBalanceText::
	text "Du hast jetzt"
	line ""
	text_decimal wBlueCardBalance, 1, 2
	text " Punkte."
	done

SECTION "_CoinCaseCountText", ROMX
_CoinCaseCountText::
	text "Münzen:"
	line ""
	text_decimal wCoins, 2, 5
	text_end

SECTION "Text_RaiseThePPOfWhichMove", ROMX
Text_RaiseThePPOfWhichMove::
	text "AP welcher Attacke"
	line "erhöhen?"
	done

SECTION "Text_RestoreThePPOfWhichMove", ROMX
Text_RestoreThePPOfWhichMove::
	text "AP welcher Attacke"
	line "wiederherstellen?"
	done

SECTION "Text_PPIsMaxedOut", ROMX
Text_PPIsMaxedOut::
	text_ram wStringBuffer2
	text " hat maximale AP."
	prompt

SECTION "Text_PPsIncreased", ROMX
Text_PPsIncreased::
	text_ram wStringBuffer2
	text "s AP erhöhten"
	line "sich."
	prompt

SECTION "Text_PPsMaximized", ROMX
Text_PPsMaximized::
	text_ram wStringBuffer2
	text "s AP maximiert."
	prompt

SECTION "_PPRestoredText", ROMX
_PPRestoredText::
	text "AP wurden"
	line "wiederhergestellt."
	prompt

SECTION "_ItemLooksBitterText", ROMX
_ItemLooksBitterText::
	text "Sieht bitter aus…"
	prompt

SECTION "_ItemCantUseOnEggText", ROMX
_ItemCantUseOnEggText::
	text "Das geht nicht bei"
	line "einem Ei."
	prompt

SECTION "_ItemOakWarningText", ROMX
_ItemOakWarningText::
	text "Eich: <PLAYER>!"
	line "Jetzt ist nicht"
	cont "die Zeit dafür!"
	prompt

SECTION "_ItemWontHaveEffectText", ROMX
_ItemWontHaveEffectText::
	text "Das hat keine"
	line "Wirkung."
	prompt

SECTION "_BallBlockedText", ROMX
_BallBlockedText::
	text "Der Trainer"
	line "blockte den Ball!"
	prompt

SECTION "_BallDontBeAThiefText", ROMX
_BallDontBeAThiefText::
	text "Sei kein Dieb!"
	prompt

SECTION "_BallStorageFullText", ROMX
_BallStorageFullText::
	text "Das Depot ist"
	line "voll. Das geht"
	cont "jetzt nicht."
	prompt

SECTION "_BallDatabaseFullText", ROMX
_BallDatabaseFullText::
	text "PC-Datenbank"
	line "überlastet. Bitte"
	cont "Spiel speichern."
	prompt

SECTION "Text_MonIsHiddenFromBall", ROMX
Text_MonIsHiddenFromBall::
	text "Das #mon ist"
	line "nicht zu sehen!"
	prompt

SECTION "Text_MonCantBeCaught", ROMX
Text_MonCantBeCaught::
	text "Das #mon kann"
	line "nicht gefangen"
	cont "werden!"
	prompt

SECTION "_ItemUsedText", ROMX
_ItemUsedText::
	text "<PLAYER> benutzte"
	line ""
	text_ram wStringBuffer2
	text "."
	done

SECTION "_KnowsMoveText", ROMX
_KnowsMoveText::
	text_ram wStringBuffer1
	text " kennt"
	line ""
	text_ram wStringBuffer2
	text "."
	prompt

SECTION "_MoveKnowsOneText", ROMX
_MoveKnowsOneText::
	text "Das #mon kennt"
	line "nur eine Attacke."
	done

SECTION "_AskDeleteMoveText", ROMX
_AskDeleteMoveText::
	text "Oh, "
	text_ram wStringBuffer1
	line "vergessen lassen?"
	done

SECTION "_DeleterForgotMoveText", ROMX
_DeleterForgotMoveText::
	text "Fertig! Dein"
	line "#mon vergaß die"
	cont "Attacke."
	done

SECTION "_DeleterEggText", ROMX
_DeleterEggText::
	text "Ein Ei kennt keine"
	line "Attacken!"
	done

SECTION "_DeleterNoComeAgainText", ROMX
_DeleterNoComeAgainText::
	text "Nein? Besuch mich"
	line "wieder mal."
	done

SECTION "_DeleterAskWhichMoveText", ROMX
_DeleterAskWhichMoveText::
	text "Welche Attacke"
	line "soll es vergessen?"
	prompt

SECTION "_DeleterIntroText", ROMX
_DeleterIntroText::
	text "Ähm… Oh ja, ich"
	line "bin der Vergesser."

	para "Ich lasse #mon"
	line "Attacken"
	cont "vergessen."

	para "Soll ich ein"
	line "#mon vergessen"
	cont "lassen?"
	done

SECTION "_DeleterAskWhichMonText", ROMX
_DeleterAskWhichMonText::
	text "Welches #mon?"
	prompt

SECTION "Text_DSTIsThatOK", ROMX
Text_DSTIsThatOK::
; After PrintHoursMins on same box (time already on line 1)
; Note: "—" maps to battle tile $70 (yellow block) — use ASCII "-" or comma only.
	line "Sommerzeit,"
	cont "stimmt das?"
	done

SECTION "_TimeAskOkayText", ROMX
_TimeAskOkayText::
; Appended after "10:01 AM" via text_asm — keep short for 18-wide wrap.
; EN: ", is that OK?"  DE-Canon-style: "stimmt das?"
	text ""
	line "Stimmt das?"
	done

SECTION "_TimesetAskDSTText", ROMX
_TimesetAskDSTText::
	text "Zur Sommerzeit"
	line "wechseln?"
	done

SECTION "_TimesetDSTText", ROMX
_TimesetDSTText::
	text "Ich stellte die"
	line "Uhr eine Stunde"
	cont "vor."
	prompt

SECTION "_TimesetAskNotDSTText", ROMX
_TimesetAskNotDSTText::
	text "Ist die Sommerzeit"
	line "vorbei?"
	done

SECTION "_TimesetNotDSTText", ROMX
_TimesetNotDSTText::
	text "Ich stellte die"
	line "Uhr eine Stunde"
	cont "zurück."
	prompt

SECTION "_TimesetAskAdjustDSTText", ROMX
_TimesetAskAdjustDSTText::
	text "Willst du die Uhr"
	line "wegen der"

	para "Sommerzeit"
	line "anpassen?"
	done

SECTION "_MomLostGearBookletText", ROMX
_MomLostGearBookletText::
	text "Ich verlor die"
	line "Anleitung für das"
	cont "#Com."

	para "Komm später"
	line "nochmal wieder."
	prompt

SECTION "WonderTradeQuestionText", ROMX
WonderTradeQuestionText::
	text "Möchtest du"
	line "tauschen?"
	done

SECTION "WonderTradePromptText", ROMX
WonderTradePromptText::
	text "Welches #mon"
	line "willst du"
	cont "tauschen?"
	prompt

SECTION "WonderTradeCantTradeSpikyEaredPichuText", ROMX
WonderTradeCantTradeSpikyEaredPichuText::
	text "Dieses Pichu"
	line "scheint durch die"
	cont "Zeit gereist zu"
	cont "sein."

	para "Es zu übertragen"
	line "wäre riskant,"

	para "darum bleibt Pichu"
	line "besser, wo es ist."
	prompt

;SECTION "WonderTradeCantTradeEggText", ROMX
;WonderTradeCantTradeEggText::
;	text "Sorry. We can't"
;	line "accept an Egg."
;	prompt

;SECTION "WonderTradeCantAcceptAbnormalMonText", ROMX
;WonderTradeCantAcceptAbnormalMonText::
;	text "Sorry, but your"
;	line "#mon appears to"
;
;	para "be abnormal. We"
;	line "can't accept it."
;	prompt

SECTION "WonderTradeConfirmText", ROMX
WonderTradeConfirmText::
	text "Zum Tausch"
	line "anbieten:"
	cont ""
	text_ram wStringBuffer1
	text "?"
	done

SECTION "WonderTradeSetupText", ROMX
WonderTradeSetupText::
	text "Suche einen"
	line "Tauschpartner…"
	prompt

SECTION "WonderTradeReadyText", ROMX
WonderTradeReadyText::
	text "Ein Tauschpartner"
	line "wurde gefunden."
	prompt

SECTION "SilphMartIntroText", ROMX
SilphMartIntroText::
	text "Angestellte wie"
	line "ich haben Zugang"
	cont "zu Firmenkram!"

	para "Willst du kaufen?"
	done

SECTION "SilphMartComeAgainText", ROMX
SilphMartComeAgainText::
	text "Komm wieder! Das"
	line "Nebeneinkommen"
	cont "kann ich brauchen."
	done

SECTION "AdventurerMartIntroText", ROMX
AdventurerMartIntroText::
	text "Ich fand seltene"
	line "Items im Ausland!"
	done

SECTION "AdventurerMartComeAgainText", ROMX
AdventurerMartComeAgainText::
	text "Schau wieder"
	line "vorbei!"
	done

SECTION "InformalMartIntroText", ROMX
InformalMartIntroText::
	text "Was gibt's?"
	line "Brauchst du"
	cont "Vorrat?"
	done

SECTION "BazaarMartIntroText", ROMX
BazaarMartIntroText::
	text "Schau dir meine"
	line "Waren an!"
	done

SECTION "AlreadyHaveTMText", ROMX
AlreadyHaveTMText::
	text "Diese TM hast du"
	line "schon."
	done

SECTION "MartPremierBallText", ROMX
MartPremierBallText::
	text "Du bekommst auch"
	line "einen Premierball"
	text_sound SFX_TRANSACTION
	cont "als Bonus dazu."
	done

SECTION "ItemCantBeSelectedText", ROMX
ItemCantBeSelectedText::
	text "Dieses Item kann"
	line "nicht gewählt"
	cont "werden."
	prompt

SECTION "AlreadyInThatBallTextData", ROMX
AlreadyInThatBallTextData::
	text "Dein #mon ist"
	line "schon in dem Ball."
	prompt

SECTION "CantChangeTradedMonBallTextData", ROMX
CantChangeTradedMonBallTextData::
	text "Den Ball eines"
	line "getauschten"
	cont "#mon kannst du"
	cont "nicht ändern."
	prompt
