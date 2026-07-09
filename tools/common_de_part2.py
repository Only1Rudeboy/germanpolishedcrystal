#!/usr/bin/env python3
"""German translations for data/text/common.asm (part 2)."""

def register(T):
    """Register all remaining common.asm labels (after _NPCTradeAfterText4)."""
    count = 0
    T('_MomLeavingText1', '''
	text "Wow, das ist ein"
	line "niedliches #mon."

	para "Wo hast du es"
	line "her?"

	para "…"

	para "Du beginnst also"
	line "ein Abenteuer…"

	para "OK!"
	line "Ich helfe dir auch."

	para "Aber was kann ich"
	line "für dich tun?"

	para "Ich weiß! Ich spare"
	line "Geld für dich."

	para "Auf einer langen"
	line "Reise ist Geld"
	cont "wichtig."

	para "Soll ich dein"
	line "Geld sparen?"
	done
''')
    count += 1
    T('_MomLeavingText2', '''
	text "OK, ich kümmere"
	line "mich um dein Geld."

	para "………………"
	prompt
''')
    count += 1
    T('_MomLeavingText3', '''
	text "Sei vorsichtig."

	para "#mon sind deine"
	line "Freunde. Ihr müsst"
	cont "als Team arbeiten."

	para "Also mach's gut!"
	done
''')
    count += 1
    T('_MomIsThisAboutYourMoneyText', '''
	text "Hi! Willkommen"
	line "zuhause! Du gibst"
	cont "dich echt Mühe."

	para "Ich habe dein"
	line "Zimmer aufgeräumt."

	para "Oder geht es um"
	line "dein Geld?"
	done
''')
    count += 1
    T('_MomBankWhatDoYouWantToDoText', '''
	text "Was möchtest du"
	line "tun?"
	done
''')
    count += 1
    T('_MomStoreMoneyText', '''
	text "Wie viel möchtest"
	line "du sparen?"
	done
''')
    count += 1
    T('_MomTakeMoneyText', '''
	text "Wie viel möchtest"
	line "du mitnehmen?"
	done
''')
    count += 1
    T('_MomSaveMoneyText', '''
	text "Möchtest du Geld"
	line "sparen?"
	done
''')
    count += 1
    T('_MomHaventSavedThatMuchText', '''
	text "So viel hast du"
	line "nicht gespart."
	prompt
''')
    count += 1
    T('_MomNotEnoughRoomInWalletText', '''
	text "So viel kannst du"
	line "nicht mitnehmen."
	prompt
''')
    count += 1
    T('_MomInsufficientFundsInWalletText', '''
	text "So viel hast du"
	line "nicht."
	prompt
''')
    count += 1
    T('_MomNotEnoughRoomInBankText', '''
	text "So viel kannst du"
	line "nicht sparen."
	prompt
''')
    count += 1
    T('_MomStartSavingMoneyText', '''
	text "OK, ich spare dein"
	line "Geld. Vertrau mir!"

	para "<PLAYER>, bleib"
	line "dran!"
	done
''')
    count += 1
    T('_MomStoredMoneyText', '''
	text "Dein Geld ist hier"
	line "sicher! Los geht's!"
	done
''')
    count += 1
    T('_MomTakenMoneyText', '''
	text "<PLAYER>, gib"
	line "nicht auf!"
	done
''')
    count += 1
    T('_MomJustDoWhatYouCanText', '''
	text "Gib einfach dein"
	line "Bestes."
	done
''')
    count += 1
    T('_DayCareManIntroText', '''
	text "Ich bin der Pension-"
	line "sleiter. Soll ich"
	cont "ein #mon für dich"
	cont "aufziehen?"
	done
''')
    count += 1
    T('_DayCareManIntroEggText', '''
	text "Ich bin der Pension-"
	line "sleiter. Kennst du"
	cont "dich mit Eiern aus?"

	para "Ich habe #mon mit"
	line "meiner Frau"
	cont "aufgezogen."

	para "Wir waren schockiert,"
	line "als wir ein Ei"
	cont "fanden!"

	para "Ist das nicht"
	line "unglaublich?"

	para "Soll ich ein #mon"
	line "für dich aufziehen?"
	done
''')
    count += 1
    T('_DayCareLadyIntroText', '''
	text "Ich bin die Pension-"
	line "sleiterin."

	para "Soll ich ein #mon"
	line "für dich aufziehen?"
	done
''')
    count += 1
    T('_DayCareLadyIntroEggText', '''
	text "Ich bin die Pension-"
	line "sleiterin. Kennst du"
	cont "dich mit Eiern aus?"

	para "Mein Mann und ich"
	line "haben #mon"
	cont "aufgezogen."

	para "Wir waren schockiert,"
	line "als wir ein Ei"
	cont "fanden!"

	para "Ist das nicht"
	line "unglaublich?"

	para "Soll ich ein #mon"
	line "für dich aufziehen?"
	done
''')
    count += 1
    T('_WhatShouldIRaiseText', '''
	text "Welches soll ich"
	line "aufziehen?"
	prompt
''')
    count += 1
    T('_OnlyOneMonText', '''
	text "Oh? Aber du hast"
	line "nur ein #mon."
	prompt
''')
    count += 1
    T('_CantAcceptEggText', '''
	text "Tut mir leid, aber"
	line "ich kann kein Ei"
	cont "annehmen."
	prompt
''')
    count += 1
    T('_RemoveMailText', '''
	text "Entferne den Brief,"
	line "bevor du mich"
	cont "aufsuchst."
	prompt
''')
    count += 1
    T('_LastHealthyMonText', '''
	text "Wenn du mir das"
	line "gibst, womit"
	cont "kämpfst du dann?"
	prompt
''')
    count += 1
    T('_IllRaiseYourMonText', '''
	text "OK. Ich kümmere"
	line "mich um dein "
	text_ram wStringBuffer1
	text "."
	prompt
''')
    count += 1
    T('_ComeBackLaterText', '''
	text "Komm später wieder,"
	line "um es abzuholen."
	done
''')
    count += 1
    T('_AreWeGeniusesText', '''
	text "Sind wir Genies"
	line "oder was? Möchtest"
	cont "du dein "
	text_ram wStringBuffer1
	text " sehen?"
	done
''')
    count += 1
    T('_YourMonHasGrownText', '''
	text "Dein "
	text_ram wStringBuffer1
	line "ist gewachsen."

	para "Sein Level stieg"
	line "um "
	text_decimal wStringBuffer2 + 1, 1, 3
	text "."

	para "Wenn du dein"
	line "#mon zurück"
	cont "haben willst,"
	cont "kostet es ¥"
	text_decimal wStringBuffer2 + 2, 3, 5
	text "."
	done
''')
    count += 1
    T('_PerfectHeresYourMonText', '''
	text "Perfekt! Hier ist"
	line "dein #mon."
	prompt
''')
    count += 1
    T('_GotBackMonText', '''
	text "<PLAYER> erhält"
	line ""
	text_ram wStringBuffer1
	text " zurück."
	prompt
''')
    count += 1
    T('_BackAlreadyText', '''
	text "Huch? Schon zurück?"
	line "Dein "
	text_ram wStringBuffer1

	para "braucht noch ein"
	line "wenig Zeit bei uns."

	para "Wenn du dein"
	line "#mon zurück"
	cont "haben willst,"
	cont "kostet es ¥100."
	done
''')
    count += 1
    T('_HaveNoRoomText', '''
	text "Du hast keinen"
	line "Platz dafür."
	prompt
''')
    count += 1
    T('_NotEnoughMoneyText', '''
	text "Du hast nicht"
	line "genug Geld."
	prompt
''')
    count += 1
    T('_OhFineThenText', '''
	text "Na gut."
	prompt
''')
    count += 1
    T('_ComeAgainText', '''
	text "Komm wieder."
	done
''')
    count += 1
    T('_NotYetText', '''
	text "Noch nicht…"
	done
''')
    count += 1
    T('_FoundAnEggAgainText', '''
	text "Ah, du bist es!"

	para "Dein #mon hatte"
	line "wieder ein Ei!"

	para "Möchtest du es?"
	done
''')
    count += 1
    T('_FoundAnEggText', '''
	text "Ah, du bist es!"

	para "Wir haben dein"
	line "#mon aufgezogen"

	para "und waren total"
	line "erstaunt!"

	para "Dein #mon hatte"
	line "ein Ei!"

	para "Wir wissen nicht,"
	line "wie es dahin kam,"

	para "aber dein #mon"
	line "hatte es. Möchtest"
	cont "du es?"
	done
''')
    count += 1
    T('_ReceivedEggText', '''
	text "<PLAYER> erhält"
	line "das Ei!"
	done
''')
    count += 1
    T('_TakeGoodCareOfEggText', '''
	text "Pass gut darauf"
	line "auf."
	done
''')
    count += 1
    T('_IllKeepItThanksText', '''
	text "Gut, ich behalte"
	line "es. Danke!"
	done
''')
    count += 1
    T('_NoRoomForEggText', '''
	text "Du hast keinen Platz"
	line "im Team oder in"
	cont "deiner Box."
	cont "Komm später wieder."
	done
''')
    count += 1
    T('_NameRaterHelloText', '''
	text "Hallo, hallo! Ich"
	line "bin der Namen-"
	cont "bewerter."

	para "Ich bewerte die"
	line "Namen von #mon."

	para "Soll ich Namen"
	line "bewerten?"
	done
''')
    count += 1
    T('_NameRaterWhichMonText', '''
	text "Welchen #mon-"
	line "Spitznamen soll"
	cont "ich bewerten?"
	prompt
''')
    count += 1
    T('_NameRaterBetterNameText', '''
	text "Hm… "
	text_ram wStringBuffer1
	text "…"
	line "Das ist ein ganz"
	cont "ordentlicher Name."

	para "Aber wie wäre es"
	line "mit einem etwas"
	cont "besseren Spitz-"
	cont "namen?"

	para "Soll ich ihm einen"
	line "besseren Namen"
	cont "geben?"
	done
''')
    count += 1
    T('_NameRaterWhatNameText', '''
	text "Also gut. Welchen"
	line "Namen sollen wir"
	cont "ihm geben?"
	prompt
''')
    count += 1
    T('_NameRaterFinishedText', '''
	text "Das ist ein besserer"
	line "Name als vorher!"

	para "Gut gemacht!"
	done
''')
    count += 1
    T('_NameRaterComeAgainText', '''
	text "OK. Komm wieder,"
	line "wenn du magst."
	done
''')
    count += 1
    T('_NameRaterPerfectNameText', '''
	text "Hm… "
	text_ram wStringBuffer1
	text "?"
	line "Was für ein toller"
	cont "Name! Perfekt."

	para "Behandle "
	text_ram wStringBuffer1
	line "mit viel Liebe."
	done
''')
    count += 1
    T('_NameRaterEggText', '''
	text "Wow… Das ist nur"
	line "ein Ei."
	done
''')
    count += 1
    T('_NameRaterSameNameText', '''
	text "Er sieht genauso"
	line "aus wie vorher,"

	para "aber der neue Name"
	line "ist viel besser!"

	para "Gut gemacht!"
	done
''')
    count += 1
    T('_NameRaterNamedText', '''
	text "Also gut. Dieses"
	line "#mon heißt jetzt"
	cont ""
	text_ram wStringBuffer1
	text "."
	prompt
''')
    count += 1
    T('Text_Gained', '''
	text_ram wStringBuffer1
	text " erhält@"
	text_end
''')
    count += 1
    T('Text_ABoostedStringBuffer2ExpPoints', '''
	line "spezielle"
	cont ""
	text_decimal wStringBuffer2, 3, 6
	text " EP!"
	prompt
''')
    count += 1
    T('Text_StringBuffer2ExpPoints', '''
	line ""
	text_decimal wStringBuffer2, 3, 6
	text " EP!"
	prompt
''')
    count += 1
    T('Text_GoPkmn', '''
	text "Los! @"
	text_end
''')
    count += 1
    T('Text_DoItPkmn', '''
	text "Los! @"
	text_end
''')
    count += 1
    T('Text_GoForItPkmn', '''
	text "Los,"
	line "@"
	text_end
''')
    count += 1
    T('Text_YourFoesWeakGetmPkmn', '''
	text "Der Gegner ist"
	line "schwach! Los, @"
	text_end
''')
    count += 1
    T('Text_BattleMonNick01', '''
	text_ram wBattleMonNickname
	text "!"
	done
''')
    count += 1
    T('Text_BattleMonNickComma', '''
	text_ram wBattleMonNickname
	text ",@"
	text_end
''')
    count += 1
    T('Text_ThatsEnoughComeBack', '''
	text " genug!"
	line "Komm zurück!@"
	text_end
''')
    count += 1
    T('Text_OKComeBack', '''
	text " OK!"
	line "Komm zurück!@"
	text_end
''')
    count += 1
    T('Text_GoodComeBack', '''
	text " super!"
	line "Komm zurück!@"
	text_end
''')
    count += 1
    T('Text_ComeBack', '''
	text " komm"
	line "zurück!"
	done
''')
    count += 1
    T('_BootedTMText', '''
	text "TM aktiviert."
	done
''')
    count += 1
    T('_BootedHMText', '''
	text "VM aktiviert."
	done
''')
    count += 1
    T('_ContainedMoveText', '''
	text "Sie enthält"
	line ""
	text_ram wStringBuffer2
	text "."

	para ""
	text_ram wStringBuffer2
	line "einem #mon"
	cont "beibringen?"
	done
''')
    count += 1
    T('_TMHMNotCompatibleText', '''
	text_ram wStringBuffer2
	text " ist nicht"
	line "kompatibel mit "
	text_ram wStringBuffer1
	text "."

	para "Es kann "
	text_ram wStringBuffer2
	line "nicht erlernen."
	prompt
''')
    count += 1
    T('_BadgeRequiredText', '''
	text "Tut mir leid! Du"
	line "brauchst einen neuen"
	cont "Orden."
	prompt
''')
    count += 1
    T('_CantUseItemText', '''
	text "Das kann hier nicht"
	line "benutzt werden."
	prompt
''')
    count += 1
    T('_UseCutText', '''
	text_ram wStringBuffer2
	text " setzt"
	line "Zerschneider ein!"
	prompt
''')
    count += 1
    T('_CutNothingText', '''
	text "Hier gibt es nichts"
	line "zum Zerschneiden."
	prompt
''')
    count += 1
    T('_AskFlashText', '''
	text "Es ist stockdunkel."
	line "Blitz einsetzen?"
	done
''')
    count += 1
    T('_BlindingFlashText', '''
	text "Ein gleißender Blitz"
	line "erhellt das Gebiet!"
	text_promptbutton
	text_end
''')
    count += 1
    T('_UsedSurfText', '''
	text_ram wStringBuffer2
	text " setzt"
	line "Surfer ein!"
	done
''')
    count += 1
    T('_CantSurfText', '''
	text "Surfer kann hier"
	line "nicht eingesetzt"
	cont "werden."
	prompt
''')
    count += 1
    T('_AlreadySurfingText', '''
	text "Surfer ist bereits"
	line "eingesetzt."
	prompt
''')
    count += 1
    T('_AskSurfText', '''
	text "Das Wasser ist ruhig."
	line "Surfer einsetzen?"
	done
''')
    count += 1
    T('_UseWaterfallText', '''
	text_ram wStringBuffer2
	text " setzt"
	line "Kaskade ein!"
	done
''')
    count += 1
    T('_HugeWaterfallText', '''
	text "Wow, das ist ein"
	line "großer Wasserfall."
	done
''')
    count += 1
    T('_AskWaterfallText', '''
	text "Möchtest du Kaskade"
	line "einsetzen?"
	done
''')
    count += 1
    T('_UseDigText', '''
	text_ram wStringBuffer2
	text " setzt"
	line "Schaufler ein!"
	done
''')
    count += 1
    T('_UseEscapeRopeText', '''
	text "<PLAYER> benutzt"
	line "ein Fluchtseil."
	done
''')
    count += 1
    T('_CantUseDigText', '''
	text "Das kann hier nicht"
	line "benutzt werden."
	done
''')
    count += 1
    T('_CantUseTeleportText', '''
	text "Das kann hier nicht"
	line "benutzt werden."

	para ""
	done
''')
    count += 1
    T('_UseStrengthText', '''
	text_ram wStringBuffer2
	text " setzt"
	line "Stärke ein!"
	done
''')
    count += 1
    T('_MoveBoulderText', '''
	text_ram wStringBuffer1
	text " kann"
	line "Felsen bewegen."
	prompt
''')
    count += 1
    T('_AskStrengthText', '''
	text "Ein #mon könnte"
	line "das vielleicht"
	cont "bewegen."

	para "Stärke einsetzen?"
	done
''')
    count += 1
    T('_BouldersMoveText', '''
	text "Felsen können jetzt"
	line "bewegt werden!"
	done
''')
    count += 1
    T('_BouldersMayMoveText', '''
	text "Ein #mon könnte"
	line "das vielleicht"
	cont "bewegen."
	done
''')
    count += 1
    T('_UseWhirlpoolText', '''
	text_ram wStringBuffer2
	text " setzt"
	line "Strudel ein!"
	prompt
''')
    count += 1
    T('_MayPassWhirlpoolText', '''
	text "Das ist ein"
	line "furchtbarer Strudel!"

	para "Ein #mon könnte"
	line "ihn durchqueren."
	done
''')
    count += 1
    T('_AskWhirlpoolText', '''
	text "Ein Strudel ist im"
	line "Weg."

	para "Strudel einsetzen?"
	done
''')
    count += 1
    T('_UseHeadbuttText', '''
	text_ram wStringBuffer2
	text " setzt"
	line "Kopfnuss ein!"
	prompt
''')
    count += 1
    T('_HeadbuttNothingText', '''
	text "Nein. Nichts…"
	done
''')
    count += 1
    T('_AskHeadbuttText', '''
	text "Vielleicht steckt"
	line "ein #mon in"
	cont "diesem Baum."

	para "Kopfnuss einsetzen?"
	done
''')
    count += 1
    T('_UseRockSmashText', '''
	text_ram wStringBuffer2
	text " setzt"
if DEF(FAITHFUL)
	line "Steinschlag ein!"
else
	line "Brick Break ein!"
endc
	prompt
''')
    count += 1
    T('_MaySmashText', '''
	text "Vielleicht kann ein"
	line "#mon das"
	cont "zerbrechen."
	done
''')
    count += 1
    T('_AskRockSmashText', '''
	text "Dieser Fels sieht"
	line "zerbrechlich aus."

if DEF(FAITHFUL)
	para "Steinschlag"
	line "einsetzen?"
else
	para "Brick Break"
	line "einsetzen?"
endc
	done
''')
    count += 1
    T('_RodBiteText', '''
	text "Oh!"
	line "Ein Biss!"
	prompt
''')
    count += 1
    T('_RodNothingText', '''
	text "Nicht einmal"
	line "angeknabbert!"

	para "Weiter angeln?"
	done
''')
    count += 1
    T('_CantGetOffBikeText', '''
	text "Du kannst hier nicht"
	line "absteigen!"
	done
''')
    count += 1
    T('_GotOnBikeText', '''
	text "<PLAYER> steigt auf"
	line "das "
	text_ram wStringBuffer2
	text "."
	done
''')
    count += 1
    T('_GotOffBikeText', '''
	text "<PLAYER> steigt vom"
	line ""
	text_ram wStringBuffer2
	text " ab."
	done
''')
    count += 1
    T('_AskCutText', '''
	text "Dieser Baum kann"
	line "zerschnitten werden!"

	para "Zerschneider"
	line "einsetzen?"
	done
''')
    count += 1
    T('_CanCutText', '''
	text "Dieser Baum kann"
	line "zerschnitten werden!"
	done
''')
    count += 1
    T('_FoundItemText', '''
	text "<PLAYER> findet"
	line ""
	text_ram wStringBuffer3
	text "!"
	done
''')
    count += 1
    T('WhiteoutText', '''
	text "<PLAYER> hat kein"
	line "kampffähiges"
	cont "#mon mehr!"

	para "<PLAYER> ist"
	line "kampfunfähig!"
	done
''')
    count += 1
    T('WhiteoutToWildText', '''
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
	done
''')
    count += 1
    T('WhiteoutToTrainerText', '''
	text "<PLAYER> hat kein"
	line "kampffähiges"
	cont "#mon mehr!"

	para "<PLAYER> zahlt ¥"
	text_decimal hMoneyTemp, 3, 7
	text " an den"
	cont "Sieger…"

	para "………………"
	line "………………"

	para "<PLAYER> ist"
	line "kampfunfähig!"
	done
''')
    count += 1
    T('ForfeitToTrainerText', '''
	text "<PLAYER> gibt den"
	line "Kampf auf…"

	para "<PLAYER> zahlt ¥"
	text_decimal hMoneyTemp, 3, 7
	text " an den"
	cont "Sieger…"

	para "………………"
	line "………………"

	para "<PLAYER> ist"
	line "kampfunfähig!"
	done
''')
    count += 1
    T('_PoisonFaintText', '''
	text_ram wStringBuffer3
	line "hat sich von der"
	cont "Vergiftung erholt!"
	prompt
''')
    count += 1
    T('_UseSweetHoneyText', '''
	text "<PLAYER> verteilt"
if DEF(FAITHFUL)
	line "den Honig!"
else
	line "den süßen Honig!"
endc
	done
''')
    count += 1
    T('_SweetHoneyNothingText', '''
	text "Hier scheint nichts"
	line "zu sein…"
	done
''')
    count += 1
    T('_SquirtbottleNothingText', '''
	text "<PLAYER> versprüht"
	line "Wasser."

	para "Aber nichts"
	line "geschieht…"
	done
''')
    count += 1
    T('_UseSacredAshText', '''
	text "Die #mon von"
	line "<PLAYER> wurden"
	cont "alle geheilt!"
	done
''')
    count += 1
    T('Text_AnEGGCantHoldAnItem', '''
	text "Ein Ei kann kein"
	line "Item tragen."
	prompt
''')
    count += 1
    T('_AskThrowAwayText', '''
	text "Wie viele"
	line "wegwerfen?"
	done
''')
    count += 1
    T('_AskQuantityThrowAwayText', '''
	text "Wegwerfen: "
	text_decimal wItemQuantityChangeBuffer, 1, 2
	line ""
	text_ram wStringBuffer2
	text_plural
	text "?"
	done
''')
    count += 1
    T('_ThrewAwayText', '''
	text "Weggeworfen:"
	line ""
	text_ram wStringBuffer2
	text_plural
	text "."
	prompt
''')
    count += 1
    T('_OakThisIsntTheTimeText', '''
	text "Oak: <PLAYER>!"
	line "Jetzt ist nicht"
	cont "der richtige"
	cont "Zeitpunkt dafür!"
	prompt
''')
    count += 1
    T('Text_YouDontHaveAPkmn', '''
	text "Du hast kein"
	line "#mon!"
	prompt
''')
    count += 1
    T('_RegisteredItemText', '''
	text "Eingetragen:"
	line ""
	text_ram wStringBuffer2
	text "."
	prompt
''')
    count += 1
    T('UnregisteredItemText', '''
	text "Eintragung"
	line "aufgehoben:"
	cont ""
	text_ram wStringBuffer2
	text "."
	prompt
''')
    count += 1
    T('_CantRegisterText', '''
	text "Du kannst dieses"
	line "Item nicht"
	cont "eintragen."
	prompt
''')
    count += 1
    T('_AskItemMoveText', '''
	text "Wohin soll das"
	line "verschoben werden?"
	done
''')
    count += 1
    T('Text_AreYouABoyOrAreYouAGirl', '''
	text "Welches Foto ist"
	line "auf deinem Trainer"
	cont "Pass?"
	done
''')
    count += 1
    T('Text_SoThisIsYou', '''
	text "Das bist also du?"
	done
''')
    count += 1
    T('Text_BattleUser', '''
	text "<USER>@"
	text_end
''')
    count += 1
    T('_BattleTookSunlightText', '''
	line "nimmt Sonnenlicht"
	cont "auf!"
	prompt
''')
    count += 1
    T('_BattleFlewText', '''
	line "fliegt empor!"
	prompt
''')
    count += 1
    T('_BattleDugText', '''
	line "gräbt ein Loch!"
	prompt
''')
    count += 1
    T('Text_BreedHuh', '''
	text "Huch?"
	para "@"
	text_end
''')
    count += 1
    T('_BreedEggHatchText', '''
	text_ram wStringBuffer1
	text " schlüpft"
	line "aus dem Ei!"
	text_sound SFX_CAUGHT_MON
	text_promptbutton
	text_end
''')
    count += 1
    T('_BreedAskNicknameText', '''
	text "Möchtest du"
	line ""
	text_ram wStringBuffer1
	text " einen"
	cont "Spitznamen geben?"
	done
''')
    count += 1
    T('_LeftWithDayCareLadyText', '''
	text ""
	text_ram wBreedMon2Nickname
	line "hast du der"
	cont "Pensionsleiterin"
	cont "anvertraut."
	done
''')
    count += 1
    T('_LeftWithDayCareManText', '''
	text ""
	text_ram wBreedMon1Nickname
	line "hast du dem"
	cont "Pensionsleiter"
	cont "anvertraut."
	done
''')
    count += 1
    T('_BreedNoInterestText', '''
	text "Es hat kein"
	line "Interesse an "
	text_ram wStringBuffer1
	text "."
	prompt
''')
    count += 1
    T('_BreedAppearsToCareForText', '''
	text "Es kümmert sich um"
	line ""
	text_ram wStringBuffer1
	text "."
	prompt
''')
    count += 1
    T('_BreedFriendlyText', '''
	text "Es ist freundlich"
	line "zu "
	text_ram wStringBuffer1
	text "."
	prompt
''')
    count += 1
    T('_BreedShowsInterestText', '''
	text "Es zeigt Interesse"
	line "an "
	text_ram wStringBuffer1
	text "."
	prompt
''')
    count += 1
    T('_EmptyMailboxText', '''
	text "Hier sind keine"
	line "Briefe."
	prompt
''')
    count += 1
    T('ClearedMailPutAwayText', '''
	text "Der leere Brief"
	line "wurde eingepackt."
	prompt
''')
    count += 1
    T('MailPackFullText', '''
	text "Die Tasche ist voll."
	prompt
''')
    count += 1
    T('MailMessageLostText', '''
	text "Der Inhalt des"
	line "Briefes geht"
	cont "verloren. OK?"
	done
''')
    count += 1
    T('MailAlreadyHoldingItemText', '''
	text "Es trägt schon"
	line "ein Item."
	prompt
''')
    count += 1
    T('MailEggText', '''
	text "Ein Ei kann keinen"
	line "Brief tragen."
	prompt
''')
    count += 1
    T('MailMovedFromBoxText', '''
	text "Der Brief wurde"
	line "aus dem Briefkasten"
	cont "entfernt."
	prompt
''')
    count += 1
    T('_ReceivedGiftMonText', '''
	text "<PLAYER> erhält"
	line ""
	text_ram wMonOrItemNameBuffer
	text "!"
	done
''')
    count += 1
    T('_EggSentToPCText', '''
	text "Das Ei wurde nach"
	line ""
	text_ram wStringBuffer1
	text " geschickt."
	prompt
''')
    count += 1
    T('_PCGottaHavePokemonText', '''
	text "Du brauchst #mon,"
	line "um anzurufen!"
	prompt
''')
    count += 1
    T('_ContestCaughtMonText', '''
	text ""
	text_ram wStringBuffer1
	text " gefangen!"
	prompt
''')
    count += 1
    T('_ContestAskSwitchText', '''
	text "#mon tauschen?"
	done
''')
    count += 1
    T('_ContestAlreadyCaughtText', '''
	text "Du hast schon ein"
	line ""
	text_ram wStringBuffer1
	text " gefangen."
	prompt
''')
    count += 1
    T('ContestJudging_FirstPlaceText', '''
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
	text_end
''')
    count += 1
    T('ContestJudging_FirstPlaceScoreText', '''
	para "Die Punktzahl war"
	line ""
	text_decimal wBugContestFirstPlaceScore, 2, 3
	text " Punkte!"
	prompt
''')
    count += 1
    T('ContestJudging_SecondPlaceText', '''
	text "Zweiter wurde"
	line ""
	text_ram wBugContestWinnerName
	text ","
	para "mit einem"
	line ""
	text_ram wStringBuffer1
	text "!@"
	text_end
''')
    count += 1
    T('ContestJudging_SecondPlaceScoreText', '''
	para "Die Punktzahl war"
	line ""
	text_decimal wBugContestSecondPlaceScore, 2, 3
	text " Punkte!"
	prompt
''')
    count += 1
    T('ContestJudging_ThirdPlaceText', '''
	text "Dritter wurde"
	line ""
	text_ram wBugContestWinnerName
	text ","
	para "mit einem"
	line ""
	text_ram wStringBuffer1
	text "!@"
	text_end
''')
    count += 1
    T('ContestJudging_ThirdPlaceScoreText', '''
	para "Die Punktzahl war"
	line ""
	text_decimal wBugContestThirdPlaceScore, 2, 3
	text " Punkte!"
	prompt
''')
    count += 1
    T('_MagikarpGuruMeasureText', '''
	text "Lass mich deinen"
	line "Karpador messen."

	para "…Hm, er ist"
	line ""
	text_ram wStringBuffer1
	text " groß."
	prompt
''')
    count += 1
    T('_KarpGuruRecordText', '''
	text "Aktueller Rekord"
	para ""
	text_ram wStringBuffer1
	text " gefangen von"
	line ""
	text_ram wMagikarpRecordHoldersName
	text_promptbutton
	text_end
''')
    count += 1
    T('_LuckyNumberMatchPartyText', '''
	text "Glückwunsch!"

	para "Die ID-Nummer von"
	line ""
	text_ram wStringBuffer2
	text " in deinem Team"
	cont "stimmt überein."
	prompt
''')
    count += 1
    T('_LuckyNumberMatchPCText', '''
	text "Glückwunsch!"

	para "Die ID-Nummer von"
	line ""
	text_ram wStringBuffer2
	text " in Box"
	line "„"
	text_ram wStringBuffer1
	text ""."
	prompt
''')
    count += 1
    T('_CaughtAskNicknameText', '''
	text "Möchtest du dem"
	line ""
	text_ram wStringBuffer1
	text ", das du"
	cont "erhalten hast,"
	cont "einen Spitznamen"
	cont "geben?"
	done
''')
    count += 1
    T('_PokecenterPCCantUseText', '''
	text "Bzzzzt! Du brauchst"
	line "ein #mon, um das"
	cont "zu benutzen!"
	prompt
''')
    count += 1
    T('_PlayersPCTurnOnText', '''
	text "<PLAYER> schaltet"
	line "den PC ein."
	prompt
''')
    count += 1
    T('_PlayersPCAskWhatDoText', '''
	text "Was möchtest du"
	line "tun?"
	done
''')
    count += 1
    T('_PlayersPCHowManyWithdrawText', '''
	text "Wie viele möchtest"
	line "du mitnehmen?"
	done
''')
    count += 1
    T('_PlayersPCWithdrewItemsText', '''
	text "Mitgenommen: "
	text_decimal wItemQuantityChangeBuffer, 1, 2
	line ""
	text_ram wStringBuffer2
	text_plural
	text "."
	prompt
''')
    count += 1
    T('_PlayersPCNoRoomWithdrawText', '''
	text "Du kannst keine"
	line "weiteren Items"
	cont "mehr tragen."
	prompt
''')
    count += 1
    T('_PlayersPCNoItemsText', '''
	text "Keine Items hier!"
	prompt
''')
    count += 1
    T('_PlayersPCCantDepositItemText', '''
	text "Dieses Item kann"
	line "nicht abgelegt"
	cont "werden."
	prompt
''')
    count += 1
    T('_PlayersPCHowManyDepositText', '''
	text "Wie viele möchtest"
	line "du ablegen?"
	done
''')
    count += 1
    T('_PlayersPCDepositItemsText', '''
	text "Abgelegt: "
	text_decimal wItemQuantityChangeBuffer, 1, 2
	line ""
	text_ram wStringBuffer2
	text_plural
	text "."
	prompt
''')
    count += 1
    T('_PlayersPCNoRoomDepositText', '''
	text "Es ist kein Platz"
	line "für weitere Items."
	prompt
''')
    count += 1
    T('_PokecenterPCTurnOnText', '''
	text "<PLAYER> schaltet"
	line "den PC ein."
	prompt
''')
    count += 1
    T('_PokecenterPCWhoseText', '''
	text "Auf wessen PC"
	line "zugreifen?"
	done
''')
    count += 1
    T('_PokecenterBillsPCText', '''
	text "Bills PC"
	line "geöffnet."

	para "#mon-Lager-"
	line "System geöffnet."
	prompt
''')
    count += 1
    T('_PokecenterPlayersPCText', '''
	text "Eigener PC"
	line "geöffnet."

	para "Item-Lager-"
	line "System geöffnet."
	prompt
''')
    count += 1
    T('_PokecenterOaksPCText', '''
	text "Prof.Oaks PC"
	line "geöffnet."

	para "#dex-Bewertungs-"
	line "System geöffnet."
	prompt
''')
    count += 1
    T('_PokecenterPCOaksClosedText', '''
	text "…"
	line "Verbindung beendet…"
	done
''')
    count += 1
    T('_OakPCText1', '''
	text "Soll dein #dex"
	line "bewertet werden?"
	done
''')
    count += 1
    T('_OakPCText2', '''
	text "Aktueller #dex-"
	line "Fortschritt:"
	prompt
''')
    count += 1
    T('_OakPCText3', '''
	text_decimal wTempDexSeen, 2, 3
	text " #mon gesehen"
	line ""
	text_decimal wTempDexOwn, 2, 3
	text " #mon gefangen"

	para "Prof.Oaks"
	line "Bewertung:"
	done
''')
    count += 1
    T('_OakRating01', '''
	text "Suche in hohem Gras"
	line "nach #mon!"
	done
''')
    count += 1
    T('_OakRating02', '''
	text "Gut. Du kannst mit"
	line "#bällen umgehen."
	done
''')
    count += 1
    T('_OakRating03', '''
	text "Du wirst immer"
	line "besser."

	para "Aber du hast noch"
	line "einen langen Weg"
	cont "vor dir."
	done
''')
    count += 1
    T('_OakRating04', '''
	text "Fülle deinen #dex."
	line "Fange verschiedene"
	cont "#mon!"
	done
''')
    count += 1
    T('_OakRating05', '''
	text "Du gibst dir Mühe."
	line "Dein #dex wird"
	cont "immer besser."
	done
''')
    count += 1
    T('_OakRating06', '''
	text "Manche #mon"
	line "wachsen,"

	para "andere brauchen"
	line "Steine."
	done
''')
    count += 1
    T('_OakRating07', '''
	text "Hast du eine Angel?"
	line "Damit kannst du"
	cont "#mon fangen."
	done
''')
    count += 1
    T('_OakRating08', '''
	text "Sehr gut! Sammeln"
	line "macht dir Spaß!"
	done
''')
    count += 1
    T('_OakRating09', '''
	text "Manche #mon"
	line "erscheinen nur zu"

	para "bestimmten Tages-"
	line "zeiten."
	done
''')
    count += 1
    T('_OakRating10', '''
	text "Dein #dex wird"
	line "immer voller."
	cont "Weiter so!"
	done
''')
    count += 1
    T('_OakRating11', '''
	text "Beeindruckend. Du"
	line "entwickelst #mon,"

	para "nicht nur fängst"
	line "sie."
	done
''')
    count += 1
    T('_OakRating12', '''
	text "Hast du Kurt schon"
	line "getroffen? Seine"
	cont "Bälle helfen dir."
	done
''')
    count += 1
    T('_OakRating13', '''
	text "Wow. Du hast mehr"
	line "#mon gefunden als"

	para "die letzte #dex-"
	line "Forschungsgruppe."
	done
''')
    count += 1
    T('_OakRating14', '''
	text "Tauschst du deine"
	line "#mon?"

	para "Allein ist das"
	line "schwer!"
	done
''')
    count += 1
    T('_OakRating15', '''
	text "Wow! 200 #mon!"
	line "Dein #dex sieht"
	cont "großartig aus!"
	done
''')
    count += 1
    T('_OakRating16', '''
	text "Du hast so viele"
	line "#mon gefunden!"

	para "Du hilfst meiner"
	line "Forschung sehr!"
	done
''')
    count += 1
    T('_OakRating17', '''
	text "Großartig! Du"
	line "könntest gleich"

	para "#mon-Professor"
	line "werden!"
	done
''')
    count += 1
    T('_OakRating18', '''
	text "Dein #dex ist"
	line "fantastisch! Du"

	para "bist bereit fürs"
	line "Profiliga!"
	done
''')
    count += 1
    T('_OakRating19', '''
	text "Wow! Ein perfekter"
	line "#dex! Davon"

	para "habe ich geträumt!"
	line "Glückwunsch!"
	done
''')
    count += 1
    T('_OakPCText4', '''
	text "Die Verbindung zu"
	line "Prof.Oaks PC wurde"
	cont "getrennt."
	done
''')
    count += 1
    T('_MemoryGameYeahText', '''
	text " , ja!"
	done
''')
    count += 1
    T('_MemoryGameDarnText', '''
	text "Mist…"
	done
''')
    count += 1
    T('_StartMenuContestEndText', '''
	text "Möchtest du den"
	line "Wettkampf beenden?"
	done
''')
    count += 1
    T('_ItemsTossOutHowManyText', '''
	text "Wie viele"
	line ""
	text_ram wStringBuffer2
	text_plural
	text " wegwerfen?"
	done
''')
    count += 1
    T('_ItemsDiscardedText', '''
	text "Weggeworfen:"
	line ""
	text_ram wStringBuffer1
	text_plural
	text "."
	prompt
''')
    count += 1
    T('_ItemsOakWarningText', '''
	text "Oak: <PLAYER>!"
	line "Jetzt ist nicht"
	cont "der richtige"
	cont "Zeitpunkt dafür!"
	done
''')
    count += 1
    T('_PokemonSwapItemText', '''
	text "Nimmt "
	text_ram wStringBuffer1
	text " von"
	line ""
	text_ram wMonOrItemNameBuffer
	text " und"

	para "gibt ihm"
	line ""
	text_ram wStringBuffer2
	text "."
	prompt
''')
    count += 1
    T('_PokemonHoldItemText', '''
	text ""
	text_ram wMonOrItemNameBuffer
	line "trägt jetzt "
	text_ram wStringBuffer2
	text "."
	prompt
''')
    count += 1
    T('_PokemonRemoveMailText', '''
	text "Entferne zuerst den"
	line "Brief."
	prompt
''')
    count += 1
    T('_PokemonNotHoldingText', '''
	text_ram wMonOrItemNameBuffer
	text " trägt"
	line "nichts."
	prompt
''')
    count += 1
    T('_ItemStorageFullText', '''
	text "Item-Lager voll."
	prompt
''')
    count += 1
    T('_PokemonTookItemText', '''
	text "Nimmt "
	text_ram wStringBuffer1
	line "von "
	text_ram wMonOrItemNameBuffer
	text "."
	prompt
''')
    count += 1
    T('_PokemonAskSwapItemText', '''
	text_ram wMonOrItemNameBuffer
	text " trägt"
	line "schon"

	para ""
	text_ram wStringBuffer1
	text "."
	line "Items tauschen?"
	done
''')
    count += 1
    T('_ItemCantHeldText', '''
	text "Dieses Item kann"
	line "nicht getragen"
	cont "werden."
	prompt
''')
    count += 1
    T('_MailLoseMessageText', '''
	text "Der Inhalt des"
	line "Briefes geht"
	cont "verloren. OK?"
	done
''')
    count += 1
    T('_MailDetachedText', '''
	text "Brief entfernt von"
	line ""
	text_ram wStringBuffer1
	text "."
	prompt
''')
    count += 1
    T('_MailNoSpaceText', '''
	text "Kein Platz zum"
	line "Entfernen des"
	cont "Briefes."
	prompt
''')
    count += 1
    T('_MailAskSendToPCText', '''
	text "Entfernten Brief"
	line "an den PC senden?"
	done
''')
    count += 1
    T('_MailboxFullText', '''
	text "Der Briefkasten"
	line "am PC ist voll."
	prompt
''')
    count += 1
    T('_MailSentToPCText', '''
	text "Der Brief wurde"
	line "an den PC gesendet."
	prompt
''')
    count += 1
    T('_PokemonNotEnoughHPText', '''
	text "Nicht genug KP!"
	prompt
''')
    count += 1
    T('_MayRegisterItemText', '''
	text "Ein Item in deiner"
	line "Tasche kann"

	para "für den Select-"
	line "Knopf eingetragen"
	cont "werden."
	done
''')
    count += 1
    T('_InitialOptionsText', '''
	text "Bitte wähle, wie du"
	line "Polished Crystal"
	cont "spielen möchtest."
	prompt
''')
    count += 1
    T('_ElmText1', '''
	text "Hallo! Tut mir leid,"
	line "dass du warten"
	cont "musstest!"

if !DEF(DEBUG)
	para "Willkommen in der"
	line "Welt der #mon!"

	para "Ich heiße Elm."

	para "Man nennt mich den"
	line "#mon-Professor."
endc
	prompt
''')
    count += 1
    T('_ElmText2', '''
	text "Diese Welt wird"
	line "von Lebewesen"
	cont "bewohnt, die wir"
	cont "#mon nennen.@"
	text_end
''')
    count += 1
    T('_ElmText4', '''
	text "Menschen und #mon"
	line "leben zusammen und"

	para "unterstützen sich"
	line "gegenseitig."

	para "Manche spielen mit"
	line "#mon, manche"
	cont "kämpfen mit ihnen."
	prompt
''')
    count += 1
    T('_ElmText5', '''
	text "Aber wir wissen"
	line "noch nicht alles"
	cont "über #mon."

	para "Es gibt noch viele"
	line "Rätsel zu lösen."

	para "Deshalb studiere"
	line "ich #mon jeden Tag."
	prompt
''')
    count += 1
    T('_ElmText6', '''
	text "Bitte sag mir"
	line "deinen Namen."
	prompt
''')
    count += 1
    T('_ElmText7', '''
	text "<PLAYER>, bist du"
	line "bereit?"

if !DEF(DEBUG)
	para "Deine eigene"
	line "#mon-Geschichte"
	cont "beginnt gleich."

	para "Tolle Zeiten und"
	line "harte Prüfungen"

	para "warten auf dich."

	para "Eine Welt voller"
	line "Träume und"

	para "Abenteuer mit"
	line "#mon! Los geht's!"
endc

	para "Wir sehen uns"
	line "später!"
	done
''')
    count += 1
    T('_WarnVBAText', '''
if !DEF(DEBUG)
	text "Warnung!"

	para "Dieser Game-Boy-"
	line "Emulator hat Bugs,"

	para "die Polished"
	line "Crystal abstürzen"
	cont "lassen können."

	para "Bitte benutze einen"
	line "genaueren Emulator,"

	para "z. B. BGB, mGBA"
	line "oder Gambatte."
	prompt
else
	text "Emulator-Test"
	line "fehlgeschlagen."
	prompt
endc
''')
    count += 1
    T('_ClockTimeMayBeWrongText', '''
	text "Die Uhrzeit könnte"
	line "falsch sein."

	para "Bitte stelle die"
	line "Zeit neu ein."
	prompt
''')
    count += 1
    T('_ClockSetWithControlPadText', '''
	text "Mit dem Steuerkreuz"
	line "einstellen."

	para "Bestätigen: A-Knopf"
	line "Abbrechen: B-Knopf"
	done
''')
    count += 1
    T('_ClockIsThisOKText', '''
	text "Einverstanden?"
	done
''')
    count += 1
    T('_ClockHasResetText', '''
	text "Die Uhr wurde"
	line "zurückgesetzt."
	done
''')
    count += 1
    T('_LinkTimeoutText', '''
	text "Es ist zu viel Zeit"
	line "vergangen. Versuch"
	cont "es noch einmal."
	prompt
''')
    count += 1
    T('_LinkTradeCantBattleText', '''
	text "Wenn du dieses"
	line "#mon tauschst,"
	cont "kannst du nicht"
	cont "mehr kämpfen."
	prompt
''')
    count += 1
    T('_LinkAbnormalMonText', '''
	text "Das "
	text_ram wStringBuffer1
	text " deines"
	line "Freundes scheint"
	cont "nicht in Ordnung!"
	prompt
''')
    count += 1
    T('_LinkAskTradeForText', '''
	text ""
	text_ram wBufferTrademonNickname
	line " gegen "
	text_ram wStringBuffer1
	text "?"
	done
''')
    count += 1
    T('_WouldYouLikeToSaveTheGameText', '''
	text "Möchtest du das"
	line "Spiel speichern?"
	done
''')
    count += 1
    T('_SavedTheGameText', '''
	text "<PLAYER> hat das"
	line "Spiel gespeichert."
	done
''')
    count += 1
    T('_AnotherSaveFileText', '''
	text "Warnung! Es gibt"
	line "einen Spielstand"
	cont "eines anderen"
	cont "Spiels."

	para "Diesen Spielstand"
	line "überschreiben?"
	done
''')
    count += 1
    T('_SaveFileCorruptedText', '''
	text "Der Spielstand ist"
	line "beschädigt!"
	prompt
''')
    count += 1
    T('_GainedItemText', '''
	text "<PLAYER> erhält"
	line ""
	text_ram wStringBuffer4
	text "."
	done
''')
    count += 1
    T('_GainedMultipleItemsText', '''
	text "<PLAYER> erhält"
	line ""
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " "
	text_ram wStringBuffer4
	text "."
	done
''')
    count += 1
    T('_PutItemInPocketText', '''
	text "<PLAYER> packt"
	line ""
	text_ram wStringBuffer1
	text " in"
	cont "die "
	text_ram wStringBuffer3
	text "."
	prompt
''')
    count += 1
    T('_PocketIsFullText', '''
	text "Die "
	text_ram wStringBuffer3
	line "ist voll…"
	prompt
''')
    count += 1
    T('_FoundWingsText', '''
	text "<PLAYER> erhält "
	text_decimal wCurWingQuantity, 1, 2
	line ""
	text_ram wStringBuffer4
	text "."
	done
''')
    count += 1
    T('_CongratulationsYourPokemonText', '''
	text "Glückwunsch!"
	line "Dein "
	text_ram wStringBuffer2
	text_end
''')
    count += 1
    T('_EvolvedIntoText', '''
	para "entwickelte sich"
	line "zu "
	text_ram wStringBuffer1
	text "!"
	done
''')
    count += 1
    T('_StoppedEvolvingText', '''
	text "Huch? "
	text_ram wStringBuffer2
	line "hörte auf sich zu"
	cont "entwickeln!"
	prompt
''')
    count += 1
    T('_EvolvingText', '''
	text "Was? "
	text_ram wStringBuffer2
	line "entwickelt sich!"
	done
''')
    count += 1
    T('_MartHowManyText', '''
	text "Wie viele?"
	done
''')
    count += 1
    T('_MartFinalPriceText', '''
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " "
	text_ram wStringBuffer2
	text_plural
	line "kosten ¥"
	text_decimal hMoneyTemp, 3, 7
	text "."
	done
''')
    count += 1
    T('_HerbShopLadyIntroText', '''
	text "Hallo, Liebes."

	para "Ich verkaufe"
	line "günstige Kräuter-"
	cont "medizin."

	para "Sie wirkt, ist aber"
	line "etwas bitter."

	para "Deine #mon mögen"
	line "sie vielleicht"
	cont "nicht."

	para "Hihihi…"
	done
''')
    count += 1
    T('_HerbalLadyFinalPriceText', '''
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " "
	text_ram wStringBuffer2
	text_plural
	line "kosten ¥"
	text_decimal hMoneyTemp, 3, 7
	text "."
	done
''')
    count += 1
    T('_HerbalLadyThanksText', '''
	text "Danke, Liebes."
	line "Hihihi…"
	done
''')
    count += 1
    T('_HerbalLadyPackFullText', '''
	text "Oh? Deine Tasche"
	line "ist voll, Liebes."
	done
''')
    count += 1
    T('_HerbalLadyNoMoneyText', '''
	text "Hihihi… Du hast"
	line "nicht genug Geld."
	done
''')
    count += 1
    T('_HerbalLadyComeAgainText', '''
	text "Komm wieder,"
	line "Liebes. Hihihi…"
	done
''')
    count += 1
    T('_BargainShopIntroText', '''
	text "He! Interesse an"
	line "Schnäppchen?"

	para "Ich verkaufe"
	line "seltene Items,"

	para "aber nur eins von"
	line "jedem."
	done
''')
    count += 1
    T('_BargainShopFinalPriceText', '''
	text_ram wStringBuffer2
	text " kostet"
	line "¥"
	text_decimal hMoneyTemp, 3, 7
	text ". Kaufen?"
	done
''')
    count += 1
    T('_BargainShopThanksText', '''
	text "Danke."
	done
''')
    count += 1
    T('_BargainShopPackFullText', '''
	text "Oh-oh, deine Tasche"
	line "ist voll."
	done
''')
    count += 1
    T('_BargainShopSoldOutText', '''
	text "Das hast du schon"
	line "gekauft. Ausver-"
	cont "kauft."
	done
''')
    count += 1
    T('_BargainShopNoFundsText', '''
	text "Oh-oh, du hast zu"
	line "wenig Geld."
	done
''')
    count += 1
    T('_BargainShopComeAgainText', '''
	text "Schau mal wieder"
	line "vorbei."
	done
''')
    count += 1
    T('_PharmacyIntroText', '''
	text "Was gibt's? Brauchst"
	line "du Medizin?"
	done
''')
    count += 1
    T('_HowManyText', '''
	text "Wie viele?"
	done
''')
    count += 1
    T('_PharmacyFinalPriceText', '''
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " "
	text_ram wStringBuffer2
	text_plural
	line "kosten ¥"
	text_decimal hMoneyTemp, 3, 7
	text "."
	done
''')
    count += 1
    T('_PharmacyThanksText', '''
	text "Danke schön!"
	done
''')
    count += 1
    T('_PharmacyPackFullText', '''
	text "Du hast keinen"
	line "Platz mehr."
	done
''')
    count += 1
    T('_PharmacyNoMoneyText', '''
	text "Huch? Das reicht"
	line "nicht."
	done
''')
    count += 1
    T('_PharmacyComeAgainText', '''
	text "In Ordnung."
	line "Bis bald."
	done
''')
    count += 1
    T('_MartSellHowManyText', '''
	text "Wie viele?"
	done
''')
    count += 1
    T('_MartSellPriceText', '''
	text "Ich zahle dir"
	line "¥"
	text_decimal hMoneyTemp, 3, 7
	text "."

	para "Einverstanden?"
	done
''')
    count += 1
    T('_MartWelcomeText', '''
	text "Willkommen! Womit"
	line "kann ich helfen?"
	done
''')
    count += 1
    T('_MartThanksText', '''
	text "Bitte schön."
	line "Danke!"
	done
''')
    count += 1
    T('_MartNoMoneyText', '''
	text "Du hast nicht"
	line "genug Geld."
	done
''')
    count += 1
    T('_MartPackFullText', '''
	text "Du kannst keine"
	line "weiteren Items"
	cont "mehr tragen."
	done
''')
    count += 1
    T('_MartCantBuyText', '''
	text "Tut mir leid, das"
	line "kaufe ich nicht."
	prompt
''')
    count += 1
    T('_MartComeAgainText', '''
	text "Komm wieder!"
	done
''')
    count += 1
    T('_MartAskMoreText', '''
	text "Kann ich noch"
	line "etwas für dich tun?"
	done
''')
    count += 1
    T('_MartBoughtText', '''
	text "Erhält ¥"
	text_decimal hMoneyTemp, 3, 7
	text " für"
	line ""
	text_ram wStringBuffer2
	text_plural
	text "."
	done
''')
    count += 1
    T('_SlotsBetHowManyCoinsText', '''
	text "Wie viele Münzen"
	line "setzen?"
	done
''')
    count += 1
    T('TMMartCostsThisMuchText', '''
	text_ram wStringBuffer2
	text " "
	text_ram wStringBuffer1
	line "kostet ¥"
	text_decimal hMoneyTemp, 3, 7
	text "."
	done
''')
    count += 1
    T('BTMartHowMayIHelpYouText', '''
	text "Willkommen in der"
	line "Tausch-Ecke!"

	para "Du kannst BP gegen"
	line "Preise tauschen."
	done
''')
    count += 1
    T('BTMartCostsThisMuchText', '''
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " "
	text_ram wStringBuffer1
	text_plural
	line "kosten "
	text_decimal hMoneyTemp+1, 2, 4
	text " BP."
	done
''')
    count += 1
    T('BTMartInsufficientFundsText', '''
	text "Tut mir leid, du"
	line "hast nicht genug"
	cont "BP."
	done
''')
    count += 1
    T('BTMartBagFullText', '''
	text "Tut mir leid, deine"
	line "Tasche ist voll."
	done
''')
    count += 1
    T('BTMartComeAgainText', '''
	text "Komm jederzeit"
	line "wieder!"
	done
''')
    count += 1
    T('_SlotsStartText', '''
	text "Start!"
	done
''')
    count += 1
    T('_SlotsNotEnoughCoinsText', '''
	text "Nicht genug"
	line "Münzen."
	prompt
''')
    count += 1
    T('_SlotsRanOutOfCoinsText', '''
	text "Mist… Keine"
	line "Münzen mehr…"
	done
''')
    count += 1
    T('_SlotsPlayAgainText', '''
	text "Noch einmal?"
	done
''')
    count += 1
    T('_SlotsLinedUpText', '''
	text "Treffer!"
	line "Gewonnen: "
	text_ram wStringBuffer2
	text " Münzen!"
	done
''')
    count += 1
    T('_SlotsDarnText', '''
	text "Mist!"
	done
''')
    count += 1
    T('_PhoneWrongNumberText', '''
	text "Huch? Falsche"
	line "Nummer!"
	done
''')
    count += 1
    T('_PhoneClickText', '''
	text "Klick!"
	done
''')
    count += 1
    T('_PhoneEllipseText', '''
	text "……"
	done
''')
    count += 1
    T('_PhoneOutOfAreaText', '''
	text "Diese Nummer ist"
	line "außerhalb des"
	cont "Netzes."
	done
''')
    count += 1
    T('_PhoneJustTalkToThemText', '''
	text "Sprich einfach"
	line "persönlich mit"
	cont "der Person!"
	done
''')
    count += 1
    T('_PasswordAskResetText', '''
	text "Wähle Fortfahren,"
	line "um die Zeit"
	cont "einzustellen."
	prompt
''')
    count += 1
    T('_PasswordAskResetClockText', '''
	text "Uhr zurücksetzen?"
	done
''')
    count += 1
    T('_ClearAllSaveDataText', '''
	text "Spielstand"
	line "löschen?"
	done
''')
    count += 1
    T('ResetInitialOptionsText', '''
	text "Startoptionen"
	line "zurücksetzen?"
	done
''')
    count += 1
    T('_LearnedMoveText', '''
	text_ram wMonOrItemNameBuffer
	text " erlernt"
	line ""
	text_ram wStringBuffer2
	text "!"
	text_sound SFX_DEX_FANFARE_50_79
	text_promptbutton
	text_end
''')
    count += 1
    T('_MoveAskForgetText', '''
	text "Welche Attacke"
	next "soll vergessen"
	cont "werden?"

	para ""
	done
''')
    count += 1
    T('_StopLearningMoveText', '''
	text ""
	text_ram wStringBuffer2
	line "nicht erlernen?"
	done
''')
    count += 1
    T('_DidNotLearnMoveText', '''
	text_ram wMonOrItemNameBuffer
	line "hat "
	text_ram wStringBuffer2
	text " nicht"
	cont "erlernt."
	prompt
''')
    count += 1
    T('_AskForgetMoveText', '''
	text_ram wMonOrItemNameBuffer
	line "möchte "
	text_ram wStringBuffer2
	text " erlernen!"

	para "Soll eine alte"
	line "Attacke für "
	text_ram wStringBuffer2
	text " vergessen"
	cont "werden?"
	done
''')
    count += 1
    T('Text_MoveForgetCount', '''
	text "1, 2 und…"
	text_pause
	text_end
''')
    count += 1
    T('_MoveForgotText', '''
	text " Schwupp!"
	text_pause

	para ""
	text_ram wMonOrItemNameBuffer
	text " hat"
	line ""
	text_ram wStringBuffer1
	text " vergessen."

	para "Und…"
	prompt
''')
    count += 1
    T('_MoveCantForgetHMText', '''
	text "VM-Attacken können"
	line "jetzt nicht"
	cont "vergessen werden."
	prompt
''')
    count += 1
    T('_CardFlipPlayWithThreeCoinsText', '''
	text "Mit drei Münzen"
	line "spielen?"
	done
''')
    count += 1
    T('_CardFlipNotEnoughCoinsText', '''
	text "Nicht genug"
	line "Münzen…"
	prompt
''')
    count += 1
    T('_CardFlipChooseACardText', '''
	text "Wähle eine Karte."
	done
''')
    count += 1
    T('_CardFlipPlaceYourBetText', '''
	text "Setze deinen Einsatz."
	done
''')
    count += 1
    T('_CardFlipPlayAgainText', '''
	text "Noch einmal"
	line "spielen?"
	done
''')
    count += 1
    T('_CardFlipShuffledText', '''
	text "Die Karten wurden"
	line "gemischt."
	prompt
''')
    count += 1
    T('_CardFlipYeahText', '''
	text "Ja!"
	done
''')
    count += 1
    T('_CardFlipDarnText', '''
	text "Mist…"
	done
''')
    count += 1
    T('_GearTodayText', '''
	text_today
	text_end
''')
    count += 1
    T('_GearEllipseText', '''
	text "……"
	done
''')
    count += 1
    T('_GearOutOfServiceText', '''
	text "Du bist außerhalb"
	line "des Netzgebiets."
	prompt
''')
    count += 1
    T('_PokegearAskWhoCallText', '''
	text "Wen möchtest du"
	line "anrufen?"
	done
''')
    count += 1
    T('_PokegearPressButtonText', '''
	text "Drücke eine Taste,"
	line "um zu beenden."
	done
''')
    count += 1
    T('_PokegearAskDeleteText', '''
	text "Gespeicherte"
	line "Nummer löschen?"
	done
''')
    count += 1
    T('_BuenaAskWhichPrizeText', '''
	text "Du kannst deine"
	line "gesammelten Punkte"

	para "gegen tolle Preise"
	line "eintauschen!"

	para "Welchen Preis"
	line "möchtest du?"
	done
''')
    count += 1
    T('_BuenaIsThatRightText', '''
	text_ram wStringBuffer1
	text "?"
	line "Ist das richtig?"
	done
''')
    count += 1
    T('_BuenaHereYouGoText', '''
	text "Bitte schön!"
	done
''')
    count += 1
    T('_BuenaNotEnoughPointsText', '''
	text "Du hast nicht"
	line "genug Punkte."
	done
''')
    count += 1
    T('_BuenaNoRoomText', '''
	text "Du hast keinen"
	line "Platz dafür."
	done
''')
    count += 1
    T('_BuenaComeAgainText', '''
	text "Oh. Komm bitte"
	line "wieder!"
	done
''')
    count += 1
    T('_BallBrokeFreeText', '''
	text "Oh nein! Das #mon"
	line "hat sich befreit!"
	prompt
''')
    count += 1
    T('_BallAppearedCaughtText', '''
	text "Mist! Es sah so"
	line "aus, als wäre es"
	cont "gefangen!"
	prompt
''')
    count += 1
    T('_BallAlmostHadItText', '''
	text "Verdammt!"
	line "Fast geschafft!"
	prompt
''')
    count += 1
    T('_BallSoCloseText', '''
	text "Mist! Es war so"
	line "knapp!"
	prompt
''')
    count += 1
    T('Text_BallCaught', '''
	text "Toll! "
	text_ram wEnemyMonNickname
	line "wurde gefangen!"
	text_sound SFX_CAUGHT_MON
	text_end
''')
    count += 1
    T('Text_Waitbutton_2', '''
	text_promptbutton
	text_end
''')
    count += 1
    T('_CurBoxFullText', '''
	text_ram wStringBuffer1
	text " ist voll."
	prompt
''')
    count += 1
    T('_MonSentToPCText', '''
	text_ram wMonOrItemNameBuffer
	text " wurde nach"
	line ""
	text_ram wStringBuffer1
	text " geschickt."
	prompt
''')
    count += 1
    T('_NewDexDataText', '''
	text_ram wEnemyMonNickname
	text " wurde neu in"
	line "den #dex"
	cont "eingetragen."
	text_sound SFX_SLOT_MACHINE_START
	text_promptbutton
	text_end
''')
    count += 1
    T('_AskGiveNicknameText', '''
	text "Möchtest du"
	line ""
	text_ram wStringBuffer1
	text " einen"
	cont "Spitznamen geben?"
	done
''')
    count += 1
    T('_ItemHappinessRoseButStatFellText', '''
	text_ram wStringBuffer1
	text " wurde"
	line "freundlicher."
	para ""
	text_ram wStringBuffer1
	text "s Basis-"
	line ""
	text_ram wStringBuffer2
	text " sank!"
	prompt
''')
    count += 1
    T('_ItemStatRoseText', '''
	text_ram wStringBuffer1
	text "s"
	line ""
	text_ram wStringBuffer2
	text " stieg."
	prompt
''')
    count += 1
    T('_ItemCantUseOnMonText', '''
	text "Das kann bei diesem"
	line "#mon nicht"
	cont "benutzt werden."
	prompt
''')
    count += 1
    T('Text_RepelUsedEarlierIsStillInEffect', '''
	text "Der frühere Schutz"
	line "wirkt noch."
	prompt
''')
    count += 1
    T('_BlueCardBalanceText', '''
	text "Du hast jetzt"
	line ""
	text_decimal wBlueCardBalance, 1, 2
	text " Punkte."
	done
''')
    count += 1
    T('_CoinCaseCountText', '''
	text "Münzen:"
	line ""
	text_decimal wCoins, 2, 5
	text_end
''')
    count += 1
    T('Text_RaiseThePPOfWhichMove', '''
	text "AP welcher Attacke"
	line "erhöhen?"
	done
''')
    count += 1
    T('Text_RestoreThePPOfWhichMove', '''
	text "AP welcher Attacke"
	line "auffüllen?"
	done
''')
    count += 1
    T('Text_PPIsMaxedOut', '''
	text_ram wStringBuffer2
	text "s AP sind"
	line "bereits voll."
	prompt
''')
    count += 1
    T('Text_PPsIncreased', '''
	text_ram wStringBuffer2
	text "s AP"
	line "wurden erhöht."
	prompt
''')
    count += 1
    T('Text_PPsMaximized', '''
	text_ram wStringBuffer2
	text "s AP wurden"
	line "maximiert."
	prompt
''')
    count += 1
    T('_PPRestoredText', '''
	text "AP aufgefüllt."
	prompt
''')
    count += 1
    T('_ItemLooksBitterText', '''
	text "Das sieht bitter"
	line "aus…"
	prompt
''')
    count += 1
    T('_ItemCantUseOnEggText', '''
	text "Das kann bei einem"
	line "Ei nicht benutzt"
	cont "werden."
	prompt
''')
    count += 1
    T('_ItemOakWarningText', '''
	text "Oak: <PLAYER>!"
	line "Jetzt ist nicht"
	cont "der richtige"
	cont "Zeitpunkt dafür!"
	prompt
''')
    count += 1
    T('_ItemWontHaveEffectText', '''
	text "Das hätte keinen"
	line "Effekt."
	prompt
''')
    count += 1
    T('_BallBlockedText', '''
	text "Der Trainer hat"
	line "den Ball geblockt!"
	prompt
''')
    count += 1
    T('_BallDontBeAThiefText', '''
	text "Sei kein Dieb!"
	prompt
''')
    count += 1
    T('_BallStorageFullText', '''
	text "Das Lager-System"
	line "ist voll. Das geht"
	cont "jetzt nicht."
	prompt
''')
    count += 1
    T('_BallDatabaseFullText', '''
	text "Die PC-Datenbank"
	line "ist überlastet."
	cont "Bitte speichere."
	prompt
''')
    count += 1
    T('Text_MonIsHiddenFromBall', '''
	text "Das #mon ist"
	line "nicht sichtbar!"
	prompt
''')
    count += 1
    T('Text_MonCantBeCaught', '''
	text "Das #mon kann"
	line "nicht gefangen"
	cont "werden!"
	prompt
''')
    count += 1
    T('_ItemUsedText', '''
	text "<PLAYER> benutzt"
	line ""
	text_ram wStringBuffer2
	text "."
	done
''')
    count += 1
    T('_KnowsMoveText', '''
	text_ram wStringBuffer1
	text " kennt"
	line ""
	text_ram wStringBuffer2
	text "."
	prompt
''')
    count += 1
    T('_MoveKnowsOneText', '''
	text "Dieses #mon kennt"
	line "nur eine Attacke."
	done
''')
    count += 1
    T('_AskDeleteMoveText', '''
	text ""
	text_ram wStringBuffer1
	line "vergessen?"
	done
''')
    count += 1
    T('_DeleterForgotMoveText', '''
	text "Fertig! Dein #mon"
	line "hat die Attacke"
	cont "vergessen."
	done
''')
    count += 1
    T('_DeleterEggText', '''
	text "Ein Ei kennt keine"
	line "Attacken!"
	done
''')
    count += 1
    T('_DeleterNoComeAgainText', '''
	text "Nein? Komm wieder,"
	line "wenn du magst."
	done
''')
    count += 1
    T('_DeleterAskWhichMoveText', '''
	text "Welche Attacke soll"
	line "vergessen werden?"
	prompt
''')
    count += 1
    T('_DeleterIntroText', '''
	text "Ähm… Oh ja, ich bin"
	line "der Attacken-"
	cont "verlerner."

	para "Ich kann #mon"
	line "Attacken vergessen"
	cont "lassen."

	para "Soll ein #mon"
	line "eine Attacke"
	cont "vergessen?"
	done
''')
    count += 1
    T('_DeleterAskWhichMonText', '''
	text "Welches #mon?"
	prompt
''')
    count += 1
    T('Text_DSTIsThatOK', '''
	text " MESZ,"
	line "einverstanden?"
	done
''')
    count += 1
    T('_TimeAskOkayText', '''
	text ","
	line "einverstanden?"
	done
''')
    count += 1
    T('_TimesetAskDSTText', '''
	text "Auf Sommerzeit"
	line "umstellen?"
	done
''')
    count += 1
    T('_TimesetDSTText', '''
	text "Die Uhr wurde um"
	line "eine Stunde"
	cont "vorgestellt."
	prompt
''')
    count += 1
    T('_TimesetAskNotDSTText', '''
	text "Ist die Sommerzeit"
	line "vorbei?"
	done
''')
    count += 1
    T('_TimesetNotDSTText', '''
	text "Die Uhr wurde um"
	line "eine Stunde"
	cont "zurückgestellt."
	prompt
''')
    count += 1
    T('_TimesetAskAdjustDSTText', '''
	text "Uhr für Sommerzeit"
	line "anpassen?"
	done
''')
    count += 1
    T('_MomLostGearBookletText', '''
	text "Ich habe die"
	line "Anleitung zum"
	cont "#gear verloren."

	para "Komm später wieder."
	prompt
''')
    count += 1
    T('WonderTradeQuestionText', '''
	text "Möchtest du"
	line "tauschen?"
	done
''')
    count += 1
    T('WonderTradePromptText', '''
	text "Welches #mon"
	line "möchtest du"
	cont "tauschen?"
	prompt
''')
    count += 1
    T('WonderTradeCantTradeSpikyEaredPichuText', '''
	text "Dieses Pichu scheint"
	line "durch die Zeit"
	cont "gereist zu sein."

	para "Ein Transfer wäre"
	line "riskant,"

	para "also bleibt Pichu"
	line "am besten, wo es"
	cont "ist."
	prompt
''')
    count += 1
    T('WonderTradeConfirmText', '''
	text "Zum Tausch"
	line "anbieten:"
	cont ""
	text_ram wStringBuffer1
	text "?"
	done
''')
    count += 1
    T('WonderTradeSetupText', '''
	text "Suche Tausch-"
	line "partner…"
	prompt
''')
    count += 1
    T('WonderTradeReadyText', '''
	text "Tauschpartner"
	line "gefunden."
	prompt
''')
    count += 1
    T('SilphMartIntroText', '''
	text "Als Angestellter"
	line "habe ich Zugang zu"
	cont "Firmenware!"

	para "Möchtest du etwas"
	line "kaufen?"
	done
''')
    count += 1
    T('SilphMartComeAgainText', '''
	text "Komm wieder! Ich"
	line "kann das Geld"
	cont "gebrauchen."
	done
''')
    count += 1
    T('AdventurerMartIntroText', '''
	text "Ich habe im"
	line "Ausland seltene"
	cont "Items gefunden!"
	done
''')
    count += 1
    T('AdventurerMartComeAgainText', '''
	text "Schau wieder vorbei!"
	done
''')
    count += 1
    T('InformalMartIntroText', '''
	text "Was gibt's? Brauchst"
	line "du Vorräte?"
	done
''')
    count += 1
    T('BazaarMartIntroText', '''
	text "Schau dir mein"
	line "Angebot an!"
	done
''')
    count += 1
    T('AlreadyHaveTMText', '''
	text "Diese TM hast du"
	line "schon."
	done
''')
    count += 1
    T('MartPremierBallText', '''
	text "Du erhältst auch"
	line "einen Premierball"
	text_sound SFX_TRANSACTION
	cont "als Bonus."
	done
''')
    count += 1
    T('ItemCantBeSelectedText', '''
	text "Dieses Item kann"
	line "nicht gewählt"
	cont "werden."
	prompt
''')
    count += 1
    T('AlreadyInThatBallTextData', '''
	text "Dein #mon ist"
	line "schon in diesem"
	cont "Ball."
	prompt
''')
    count += 1
    T('CantChangeTradedMonBallTextData', '''
	text "Du kannst den Ball"
	line "eines getauschten"
	cont "#mon nicht"
	cont "ändern."
	prompt
''')
    count += 1
    return count


if __name__ == "__main__":
    def _T(label, body):
        pass
    n = register(_T)
    print(f"Registered {n} labels")
