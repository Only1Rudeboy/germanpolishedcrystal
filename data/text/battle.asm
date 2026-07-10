BattleText::

LinkBattleErrorText::
	text "Es gab einen"
	line "Verbindungsfehler."

	para "Das Spiel wird"
	line "neu gestartet."
	prompt

BattleText_PlayerPickedUpPayDayMoney:
	text "<PLAYER> hob auf:"
	line "¥"
	text_decimal wPayDayMoney, 3, 6
	text "!"
	prompt

WildPokemonAppearedText:
	text "Ein wildes "
	stop_compressing_text ; fallthrough
LegendaryAppearedText:
	text_ram wEnemyMonNickname
	line "erschien!"
	prompt

GhostAppearedText:
	text "Ein Geist"
	line "erschien!"
	prompt

SilphScopeRevealText:
	text "SilphScope2"
	line "enthüllte die"
	cont "Identität des"
	cont "Geistes!"
	prompt

HookedPokemonAttackedText:
	text "Das angeköderte"
	line ""
	text_ram wEnemyMonNickname
	cont "griff an!"
	prompt

PokemonFellFromTreeText:
	text_ram wEnemyMonNickname
	text " fiel"
	line "aus dem Baum!"
	prompt

WantsToBattleText::
	text "<ENEMY>"
	line "will kämpfen!"
	prompt

WantToBattleText::
	text "<ENEMY>"
	line "wollen kämpfen!"
	prompt

BattleText_WildFled:
	text "Wildes "
	stop_compressing_text ; fallthrough
BattleText_LegendaryFled:
	text_ram wEnemyMonNickname
	line "floh!"
	prompt

BattleText_EnemyFled:
	text "Gegner "
	text_ram wEnemyMonNickname
	line "floh!"
	prompt

BattleText_EnemyCantEscape:
	text "<USER>"
	line "kommt nicht weg!"
	prompt

if DEF(DEBUG)
DealtXDamageText:
	text "Verursacht "
	text_decimal wCurDamage, 2, 5
	text " Schaden"
	line "vor Wurf."
	prompt
endc

HurtByPoisonText:
	text "<USER>"
	line "wird vergiftet!"
	done

HurtByBurnText:
	text "<USER>"
	line "leidet an Verbr.!"
	done

LeechSeedSapsText:
	text "Egelsamen saugt"
	line "an <USER>!"
	prompt

HurtByCurseText:
	text "<USER>"
	line "leidet am Fluch!"
	prompt

SandstormHitsText:
	text "<USER>"
	line "wird vom"
	cont "Sandsturm"
	cont "gebeutelt!"
	prompt

HailHitsText:
	text "<USER>"
	line "wird vom Hagel"
	cont "gebeutelt!"
	prompt

PerishCountText:
	text "<USER>s"
	line "Untergang in "
	text_decimal wTextDecimalByte, 1, 1
	text "!"
	prompt

BattleText_UserLostSomeOfItsHP:
	text "<USER>"
	line "verlor etwas KP!"
	prompt

BattleText_PickedUpItem:
	; assumes player (enemy might overflow text-wise)
	text "<USER>"
	line "hob "
	text_ram wStringBuffer2
	text " auf."
	prompt

BattleText_UserRecoveredWithItem:
	text "<USER>"
	line "erholte sich mit"
	cont ""
	text_ram wStringBuffer1
	text "."
	prompt

BattleText_UserAteItem:
	text "<USER>"
	line "aß "
	text_ram wStringBuffer1
	text "!"
	prompt

BattleText_UserHurtByItem:
	text "<USER>"
	line "wurde verletzt"
	cont "durch "
	text_ram wStringBuffer1
	text "."
	prompt

BattleText_UserItemLetItMoveFirst::
	text "<USER>s"
	line ""
	text_ram wStringBuffer1
	text " ließ es"
	cont "zuerst handeln."
	prompt

BattleText_UserRecoveredPPUsing:
	text "<USER>"
	line "stellte AP von"
	cont ""
	text_ram wStringBuffer2
	text " wieder her"
	cont "mit "
	text_ram wStringBuffer1
	text "!"
	prompt

BrokeLightScreenText:
	text "<USER>"
	line "zerstörte den"
	cont "Lichtschild des"
	cont "Ziels!"
	prompt

BrokeReflectText:
	text "<USER>"
	line "zerstörte den"
	cont "Reflektor des"
	cont "Ziels!"
	prompt

BattleText_ItemLowered:
	text "Das "
	text_ram wStringBuffer1
	line "senkte"
	cont "<USER>s"
	cont ""
	text_ram wStringBuffer2
	text "!"
	prompt

BattleText_ItemHarshlyLowered:
	text "Das "
	text_ram wStringBuffer1
	line "senkte stark"
	cont "<USER>s"
	cont ""
	text_ram wStringBuffer2
	text "!"
	prompt

BattleText_ItemSeverelyLowered:
	text "Das "
	text_ram wStringBuffer1
	line "senkte enorm"
	cont "<USER>s"
	cont ""
	text_ram wStringBuffer2
	text "!"
	prompt

BattleText_ItemRaised:
	text "Das "
	text_ram wStringBuffer1
	line "erhöhte"
	cont "<USER>s"
	cont ""
	text_ram wStringBuffer2
	text "!"
	prompt

BattleText_ItemSharplyRaised:
	text "Das "
	text_ram wStringBuffer1
	line "erhöhte stark"
	cont "<USER>s"
	cont ""
	text_ram wStringBuffer2
	text "!"
	prompt

BattleText_ItemDrasticallyRaised:
	text "Das "
	text_ram wStringBuffer1
	line "erhöhte enorm"
	cont "<USER>s"
	cont ""
	text_ram wStringBuffer2
	text "!"
	prompt

BattleText_ItemRaisedCrit:
	text "<USER>"
	line "nutzte "
	text_ram wStringBuffer1
	cont "zum Aufputschen!"
	prompt

BattleText_MegaSolCharged:
	text "<USER>"
	line "wurde aufgeladen!"
	prompt

BattleText_UserChargedWithItem:
	text "<USER>"
	line "lud sich auf"
	cont "mit "
	text_ram wStringBuffer1
	text "!"
	prompt

BattleText_UsersFutureSightMissed:
; used when Future Sight can't hit anything because there was
; no target (so <TARGET> is undefined)
	text "Die Zukunftssicht"
	line "traf ein!"

	para "Doch sie schlug"
	line "fehl!"
	prompt

BattleText_TargetWasHitByFutureSight:
	text "<TARGET>"
	line "traf die"
	cont "Zukunftssicht!"
	prompt

BattleText_MistFaded:
	text_ram wStringBuffer1
	text "s Nebelschutz"
	line "verschwand!"
	prompt

BattleText_SafeguardFaded:
	text_ram wStringBuffer1
	text "s Bodyguard"
	line "verschwand!"
	prompt

BattleText_LightScreenFell:
	text_ram wStringBuffer1
	text "s Lichtschild"
	line "fiel!"
	prompt

BattleText_ReflectFaded:
	text_ram wStringBuffer1
	text "s Reflektor"
	line "verschwand!"
	prompt

BattleText_TheRainStopped:
	text "Der Regen hörte"
	line "auf."
	prompt

BattleText_TheSunlightFaded:
	text "Das Sonnenlicht"
	line "verblasste."
	prompt

BattleText_TheSandstormSubsided:
	text "Der Sandsturm"
	line "legte sich."
	prompt

BattleText_TheHailStopped:
	text "Der Hagel hörte"
	line "auf."
	prompt

BattleText_EnemyPkmnFainted:
	text "Gegner "
	text_ram wEnemyMonNickname
	line "wurde besiegt!"
	prompt

GotMoneyForWinningText:
	text "<PLAYER>"
	line "¥"
	text_decimal wBattleReward, 3, 6
	text " Preisgeld!"
	prompt

BattleText_EnemyWasDefeated:
	text "<ENEMY>"
	line "wurde besiegt!"
	prompt

BattleText_EnemyWereDefeated:
	text "<ENEMY>"
	line "wurden besiegt!"
	prompt

TiedAgainstText:
	text "Unentschieden"
	line "gegen <ENEMY>!"
	prompt

SentSomeToMomText:
	text "<PLAYER>"
	line "¥"
	text_decimal wBattleReward, 3, 6
	text " Preisgeld!"
	cont "Etwas an Mama"
	cont "geschickt!"
	prompt

SentHalfToMomText:
	text "Hälfte an Mama"
	line "geschickt!"
	prompt

SentAllToMomText:
	text "Alles an Mama"
	line "geschickt!"
	prompt

BattleText_PkmnFainted:
	text_ram wBattleMonNickname
	line "wurde besiegt!"
	prompt

BattleText_UseNextMon:
	text "Nächstes #mon"
	line "einsetzen?"
	done

LostAgainstText:
	text "Verloren gegen"
	line "<ENEMY>!"
	prompt

BattleText_EnemyIsAboutToUseWillPlayerSwitchPkmn:
	text "<ENEMY>"
	line "setzt gleich"
	cont ""
	text_ram wEnemyMonNickname
	text " ein."

	para "#mon"
	line "wechseln?"
	done

BattleText_EnemyAreAboutToUseWillPlayerSwitchPkmn:
	text "<ENEMY>"
	line "setzen gleich"
	cont ""
	text_ram wEnemyMonNickname
	text " ein."

	para "#mon"
	line "wechseln?"
	done

BattleText_EnemyIsAboutToSwitchWillPlayerSwitchPkmn:
	text "<ENEMY>"
	line "wechselt gleich"
	cont "das #mon."

	para "#mon"
	line "wechseln?"
	done

BattleText_EnemyAreAboutToSwitchWillPlayerSwitchPkmn:
	text "<ENEMY>"
	line "wechseln gleich"
	cont "das #mon."

	para "#mon"
	line "wechseln?"
	done

BattleText_EnemySentOut:
	text "<ENEMY>"
	line "setzt ein:"
	cont ""
	text_ram wEnemyMonNickname
	text "!"
	done

BattleText_TheresNoWillToBattle:
	text "Kein Kampfeswille"
	line "vorhanden!"
	prompt

BattleText_AnEGGCantBattle:
	text "Ein Ei kann nicht"
	line "kämpfen!"
	prompt

BattleText_CantEscape:
	text "Kann nicht"
	line "fliehen!"
	prompt

BattleText_AskForfeitTrainerBattle:
	text "Willst du wirklich"
	line "aufgeben?"
	done

BattleText_GotAwaySafely:
	text "Erfolgreich"
	line "geflohen!"
	prompt

BattleText_UserFledUsingAStringBuffer1:
	text "<USER>"
	line "floh mit"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

BattleText_UserHurtBySpikes:
	text "<USER> leidet"
	line "an Stacheln!"
	prompt

RecoveredUsingText:
	text "<USER>"
	line "erholte sich mit"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

AirBalloonPoppedText:
	text "<TARGET>s"
	line "Ballon"
	cont "platzte!"
	prompt

BattleText_UsersStringBuffer1Activated:
	text "<USER>s"
	line ""
	text_ram wStringBuffer1
	cont "aktiviert!"
	prompt

BattleText_ItemsCantBeUsedHere:
	text "Items gehen hier"
	line "nicht."
	prompt

BattleText_PkmnIsAlreadyOut:
	text_ram wBattleMonNickname
	line "ist schon im"
	cont "Kampf."
	prompt

BattleText_PkmnCantBeRecalled:
	text_ram wBattleMonNickname
	line "kann nicht"
	cont "zurückgerufen"
	cont "werden!"
	prompt

BattleText_PkmnCantBeRecalledAbility:
	text_ram wEnemyMonNickname
	text "s"
	line ""
	text_ram wStringBuffer1
	cont "verhindert Flucht!"
	prompt

BattleText_TheresNoPPLeftForThisMove:
	text "Keine AP mehr für"
	line "diese Attacke!"
	prompt

BattleText_ItemOnlyAllowsMove: ; choice items
	text "Das "
	text_ram wStringBuffer1
	line "erlaubt nur"
	cont ""
	text_ram wStringBuffer2
	text "!"
	prompt

BattleText_MonCanOnlyUseMove:
	text "<USER> kann"
	line "nur"
	cont ""
	text_ram wStringBuffer1
	text " nutzen!"
	prompt

BattleText_ItemPreventsStatusMoves: ; assault vest
	text "Das "
	text_ram wStringBuffer1
	line "verhindert"
	cont "Statusattacken!"
	prompt

BattleText_TheMoveIsDisabled:
	text "Die Attacke ist"
	line "blockiert!"
	prompt

BattleText_PkmnHasNoMovesLeft:
	text_ram wBattleMonNickname
	line "hat keine Attacken"
	cont "mehr!"
	done

BattleText_UserEncoreEnded:
	text "<USER>s"
	line "Zugabe endete!"
	prompt

BattleText_StringBuffer1GrewToLevel:
	text_ram wStringBuffer1
	text " erreichte"
	line "Level "
	text_decimal wCurPartyLevel, 1, 3
	text "!"
	text_sound SFX_DEX_FANFARE_50_79
	text_end

BattleText_WildPkmnIsEating:
	text "Wildes "
	text_ram wEnemyMonNickname
	line "isst!"
	prompt

BattleText_WildPkmnIsAngry:
	text "Wildes "
	text_ram wEnemyMonNickname
	line "ist wütend!"
	prompt

BattleText_ThrewRock:
	text "<PLAYER> warf"
	line "einen Stein."
	prompt

BattleText_ThrewBait:
	text "<PLAYER> warf"
	line "einen Köder."
	prompt

FastAsleepText:
	text "<USER>"
	line "schläft tief!"
	done

WokeUpText:
	text "<USER>"
	line "wachte auf!"
	prompt

WasFrozenText:
	text "<TARGET>"
	line "fror komplett ein!"
	prompt

FrozenSolidText:
	text "<USER>"
	line "ist eingefroren!"
	done

FlinchedText:
	text "<USER>"
	line "schreckte zurück!"
	prompt

MustRechargeText:
	text "<USER>"
	line "muss sich erholen!"
	prompt

DisabledNoMoreText:
	text "<USER>"
	line "ist nicht mehr"
	cont "blockiert!"
	prompt

IsConfusedText:
	text "<USER>"
	line "ist verwirrt!"
	prompt

HurtItselfText:
	text "Verletzte sich"
	line "vor Verwirrung!"
	prompt

ConfusedNoMoreText:
	text "<USER>"
	line "ist nicht mehr"
	cont "verwirrt!"
	prompt

BecameConfusedText:
	text "<TARGET>"
	line "wurde verwirrt!"
	prompt

BecameConfusedDueToFatigueText:
	text "<TARGET>"
	line "wurde vor lauter"
	cont "Erschöpfung"
	cont "verwirrt!"
	prompt

AlreadyConfusedText:
	text "<TARGET>"
	line "ist schon"
	cont "verwirrt!"
	prompt

BattleText_UsersHurtByStringBuffer1:
	text "<USER>"
	line "leidet an"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

BattleText_UserWasReleasedFromStringBuffer1:
	text "<USER>"
	line "wurde befreit von"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

WhirlpoolTrapText:
	text "<TARGET>"
	line "wurde gefangen!"
	prompt

FireSpinTrapText:
	text "<TARGET>"
	line "wurde gefangen!"
	prompt

WrappedByText:
	text "<TARGET>"
	line "wurde umschlungen"
	cont "von <USER>!"
	prompt

HungOnText:
	text "<TARGET>"
	line "hielt durch dank"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

EnduredText:
	text "<TARGET>"
	line "hielt dem Treffer"
	cont "stand!"
	prompt

InLoveWithText:
	text "<USER>"
	line "ist verliebt in"
	cont "<TARGET>!"
	prompt

InfatuationText:
	text "<USER>s"
	line "Verliebtheit"
	cont "verhinderte den"
	cont "Angriff!"
	prompt

NoLongerInfatuatedText:
	text "<USER>s"
	line "Verliebtheit"
	cont "endete!"
	prompt

ObliviousPreventedDestinyKnot:
	text "<USER>s"
	line ""
	text_ram wStringBuffer1
	cont "verhindert"
	cont "Verliebtheit"
	cont "durch "
	text_ram wStringBuffer2
	text "!"
	prompt

DestinyKnotInfatuatedUser:
	text "<TARGET>s"
	line ""
	text_ram wStringBuffer1
	cont "verliebte"

	para "<USER>!"
	prompt

DisabledMoveText:
	text "<USER>s"
	line ""
	text_ram wStringBuffer1
	cont "ist blockiert!"
	prompt

UsedMoveText:
	text "<USER>"
	line "setzt "
	text_ram wStringBuffer2
	text " ein!"
	done

UsedMoveInsteadText:
	text "<USER>"
	line "setzt"
	cont ""
	text_ram wStringBuffer2
	cont "stattdessen ein!"
	done

LoafingAroundText:
	text_ram wBattleMonNickname
	line "faulenzt herum."
	prompt

BeganToNapText:
	text_ram wBattleMonNickname
	line "hält Nickerchen!"
	prompt

WontObeyText:
	text_ram wBattleMonNickname
	line "gehorcht nicht!"
	prompt

TurnedAwayText:
	text_ram wBattleMonNickname
	line "wandte sich ab!"
	prompt

IgnoredOrdersText:
	text_ram wBattleMonNickname
	line "ignorierte Befehl!"
	prompt

IgnoredSleepingText:
	text_ram wBattleMonNickname
	line "schläft und"
	cont "ignoriert Befehle!"
	prompt

NoPPLeftText:
	text "Aber keine AP"
	line "mehr übrig!"
	prompt

HasNoPPLeftText:
	text "<USER>"
	line "hat keine AP mehr"
	cont "für"
	cont ""
	text_ram wStringBuffer2
	text "!"
	prompt

WentToSleepText:
	text "<USER>"
	line "schlief ein!"
	done

RestedText:
	text "<USER>"
	line "schlief ein und"
	cont "wurde gesund!"
	done

RegainedHealthText:
	text "<USER>"
	line "wurde gesund!"
	prompt

IsHurtText:
	text "<USER>"
	line "ist verletzt!"
	prompt

IsTormentedText:
	text "<USER>"
	line "wird gequält!"
	prompt

AttackMissedText:
	text "<USER>s"
	line "Angriff verfehlt!"
	prompt

CrashedText:
	text "<USER>"
	line "ging weiter und"
	cont "prallte auf!"
	prompt

UnaffectedText:
	text "<TARGET>"
	line "bleibt unberührt!"
	prompt

DoesntAffectText:
	text "Wirkt nicht bei"
	line "<TARGET>!"
	prompt

CriticalHitText:
	text "Ein Volltreffer!"
	prompt

ExtremelyEffectiveText:
	text "Es ist extrem"
	line "effektiv!"
	prompt

SuperEffectiveText:
	text "Es ist sehr"
	line "effektiv!"
	prompt

NotVeryEffectiveText:
	text "Es ist nicht sehr"
	line "effektiv…"
	prompt

MostlyIneffectiveText:
	text "Es ist kaum"
	line "effektiv…"
	prompt

TookDownWithItText:
	text "<TARGET>s"
	line "Bindung riss"

	para "<USER>"
	line "mit sich!"
	prompt

RageBuildingText:
	text "<USER>s"
	line "Wut wächst!"
	prompt

GotAnEncoreText:
	text "<TARGET>"
	line "bekam eine Zugabe!"
	prompt

SharedPainText:
	text "Die Kämpfer"
	line "teilten Schmerz!"
	prompt

SwappedAbilitiesText:
	text "Die Kämpfer"
	line "tauschten"
	cont "Fähigkeiten!"
	prompt

SwappedItemsText:
	text "Die Kämpfer"
	line "tauschten Items!"
	prompt

ChangeIntoTypeText:
	text "In welchen Typ"
	line "wechseln?"
	prompt

InvalidTypeChangeText:
	text "Diesen Typ kannst"
	line "du nicht wählen!"
	prompt

SketchedText:
	text "<USER>"
	line "skizzierte"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

DestinyBondEffectText:
	text "<USER> will"
	line "den Gegner mit"
	cont "sich reißen!"
	prompt

BellChimedText:
	text "Eine Glocke"
	line "erklang!"
	prompt

FellAsleepText:
	text "<TARGET>"
	line "schlief ein!"
	prompt

AlreadyAsleepText:
	text "<TARGET>"
	line "schläft schon!"
	prompt

WasPoisonedText:
	text "<TARGET>"
	line "wurde vergiftet!"
	prompt

BadlyPoisonedText:
	text "<TARGET>"
	line "wurde übel"
	cont "vergiftet!"
	prompt

AlreadyPoisonedText:
	text "<TARGET>"
	line "ist schon"
	cont "vergiftet!"
	prompt

SuckedHealthText:
	text "Saugte KP von"
	line "<TARGET>!"
	prompt

DreamEatenText:
	text "<TARGET>s"
	line "Traum wurde"
	cont "gefressen!"
	prompt

WasBurnedText:
	text "<TARGET>"
	line "wurde verbrannt!"
	prompt

AlreadyBurnedText:
	text "<TARGET>"
	line "ist schon"
	cont "verbrannt!"
	prompt

WontRiseAnymoreText:
	text "<USER>s"
	line ""
	text_ram wStringBuffer2
	cont "steigt nicht"
	cont "weiter!"
	prompt

WontDropAnymoreText:
	text "<USER>s"
	line ""
	text_ram wStringBuffer2
	cont "sinkt nicht"
	cont "weiter!"
	prompt

StatRoseText:
	text "<USER>s"
	line ""
	text_ram wStringBuffer2
	cont "stieg!"
	prompt

StatRoseSharplyText:
	text "<USER>s"
	line ""
	text_ram wStringBuffer2
	cont "stieg stark!"
	prompt

StatRoseDrasticallyText:
	text "<USER>s"
	line ""
	text_ram wStringBuffer2
	cont "stieg enorm!"
	prompt

StatFellText:
	text "<USER>s"
	line ""
	text_ram wStringBuffer2
	cont "sank!"
	prompt

StatHarshlyFellText:
	text "<USER>s"
	line ""
	text_ram wStringBuffer2
	cont "sank stark!"
	prompt

StatSeverelyFellText:
	text "<USER>s"
	line ""
	text_ram wStringBuffer2
	cont "sank enorm!"
	prompt

FledFromBattleText::
	text "<USER>"
	line "floh aus dem"
	cont "Kampf!"
	prompt

FledInFearText:
	text "<TARGET>"
	line "floh aus Angst!"
	prompt

HitNTimesText:
	text "Traf "
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " mal!"
	prompt

MistText:
	text "<USER>s"
	line "Team im Nebel!"
	prompt

ProtectedByItemText:
	text "<TARGET>"
	line "wird geschützt"
	cont "durch"
	cont ""
	text_ram wStringBuffer1
	text "."
	prompt

ProtectedByMistText:
	text "<TARGET>"
	line "wird durch Nebel"
	cont "geschützt."
	prompt

GettingPumpedText:
	text_pause
	text "<USER>"
	line "wird aufgeputscht!"
	prompt

RecoilText:
	text "<USER>"
	line "erleidet Rückstoß!"
	prompt

MadeSubstituteText:
	text "<USER>"
	line "erschuf ein"
	cont "Abbild!"
	prompt

HasSubstituteText:
	text "<USER>"
	line "hat schon ein"
	cont "Abbild!"
	prompt

TooWeakSubText:
	text "Zu schwach für"
	line "ein Abbild!"
	prompt

SubTookDamageText:
	text "Das Abbild nahm"
	line "Schaden für"
	cont "<TARGET>!"
	prompt

SubFadedText:
	text "<TARGET>s"
	line "Abbild verschwand!"
	prompt

WasSeededText:
	text "<TARGET>"
	line "wurde besät!"
	prompt

EvadedText:
	text "<TARGET>"
	line "wich dem Angriff"
	cont "aus!"
	prompt

WasDisabledText:
	text "<TARGET>s"
	line ""
	text_ram wStringBuffer2
	cont "wurde blockiert!"
	prompt

CoinsScatteredText:
	text "Münzen verstreuten"
	line "sich überall!"
	prompt

TransformedTypeText:
	text "<USER>"
	line "wurde zum"
	cont ""
	text_ram wStringBuffer1
	text "-Typ!"
	prompt

EliminatedStatsText:
	text "Alle Statuswerte"
	line "wurden neutral!"
	prompt

TransformedText:
	text "<USER>"
	line "verwandelte sich"
	cont "in"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

TrickRoomText:
	text "<USER>"
	line "verzerrte die"
	cont "Dimensionen!"
	prompt

TrickRoomEndedText:
	text "Die verzerrten"
	line "Dimensionen"

	para "kehrten zur"
	line "Normalität zurück!"
	prompt

LightScreenEffectText:
	text "<USER>s"
	line "SpVert. stieg!"
	prompt

ReflectEffectText:
	text "<USER>s"
	line "Verteidigung"
	cont "stieg!"
	prompt

NothingHappenedText:
	text "Aber nichts"
	line "geschah."
	prompt

ButItFailedText:
	text "Doch es schlug"
	line "fehl!"
	prompt

DidntAffectText:
	text "Wirkte nicht bei"
	line "<TARGET>!"
	prompt

HPIsFullText:
	text "<USER>s"
	line "KP sind voll!"
	prompt

DraggedOutText:
	text "<USER>"
	line "wurde"
	cont "herausgezogen!"
	prompt

ParalyzedText:
	text "<TARGET>"
	line "ist paralysiert!"
	cont "Evtl. kein Angriff"
	prompt

FullyParalyzedText:
	text "<USER>"
	line "ist paralysiert!"
	done

AlreadyParalyzedText:
	text "<TARGET>"
	line "ist schon"
	cont "paralysiert!"
	prompt

ProtectedByText:
	text "<TARGET>"
	line "wird geschützt"
	cont "durch"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

RegainedStatsWithItem:
	text "<USER>"
	line "erholte Werte"
	cont "mit "
	text_ram wStringBuffer1
	text "!"
	prompt

CuredInfatuationWithItem:
	text "<USER> heilte"
	line "Verliebtheit"
	cont "mit "
	text_ram wStringBuffer1
	text "!"
	prompt

CuredEncoreWithItem:
	text "<USER>"
	line "heilte Zugabe"
	cont "mit "
	text_ram wStringBuffer1
	text "!"
	prompt

CuredDisableWithItem:
	text "<USER>"
	line "heilte Blockade"
	cont "mit "
	text_ram wStringBuffer1
	text "!"
	prompt

StoleText:
	text "<USER>"
	line "stahl "
	text_ram wStringBuffer1
	cont "vom Gegner!"
	prompt

KnockedOffItemText:
	text "<USER>"
	line "schlug"
	cont ""
	text_ram wStringBuffer1
	text " weg!"
	prompt

CantEscapeNowText:
	text "<TARGET>"
	line "kann jetzt nicht"
	cont "fliehen!"
	prompt

WasDefrostedText:
	text "<USER>"
	line "taute auf!"
	prompt

PutACurseText:
	text "<USER>"
	line "senkte die eigenen"
	cont "KP und verfluchte"

	para ""
	line "<TARGET>!"
	prompt

ProtectedItselfText:
	text "<USER>"
	line "schützte sich!"
	prompt

ProtectingItselfText:
	text "<TARGET>"
	line "schützt sich!"
	done

SpikesText:
	text "Stacheln verteilt"
	line "um"
	cont "<TARGET>!"
	prompt

ToxicSpikesText:
	text "Gift-Stacheln"
	line "verteilt um"
	cont "<TARGET>!"
	prompt

IdentifiedText:
	text "<USER>"
	line "identifizierte"
	cont "<TARGET>!"
	prompt

StartPerishSongText:
	text "Zuhörende #mon"
	line "werden in 3 Zügen"
	cont "besiegt!"
	prompt

StartPerishBodyText:
	text "Beide #mon"
	line "werden in 3 Zügen"
	cont "besiegt!"
	prompt

SandstormBrewedText:
	text "Ein Sandsturm"
	line "braute sich"
	cont "zusammen!"
	prompt

HailStartedText:
	text "Es begann zu"
	line "hageln!"
	prompt

BracedItselfText:
	text "<USER>"
	line "wappnete sich!"
	prompt

FellInLoveText:
	text "<TARGET>"
	line "verliebte sich!"
	prompt

CoveredByVeilText:
	text "<USER>"
	line "ist von einem"
	cont "Schleier bedeckt!"
	prompt

SafeguardProtectText:
	text "<TARGET>"
	line "wird durch"
	cont "Bodyguard"
	cont "geschützt!"
	prompt

MagnitudeText:
	text "Ausmaß "
	text_decimal wTextDecimalByte, 1, 2
	text "!"
	prompt

ReleasedByText:
	text "<USER>"
	line "wurde befreit von"
	cont "<TARGET>!"
	prompt

ShedLeechSeedText:
	text "<USER>"
	line "warf Egelsamen ab!"
	prompt

BlewSpikesText:
	text "<USER>"
	line "blies"
	cont "Stacheln weg!"
	prompt

BlewToxicSpikesText:
	text "<USER>"
	line "blies Gift-"
	cont "Stacheln weg!"
	prompt

DownpourText:
	text "Es begann zu"
	line "regnen!"
	prompt

SunGotBrightText:
	text "Das Sonnenlicht"
	line "wurde grell!"
	prompt

BellyDrumText:
	text "<USER>"
	line "senkte KP und"
	cont "maximierte Angr.!"
	prompt

BellyDrumContraryText:
	text "<USER>"
	line "senkte KP und"
	cont "minimierte Angr.!"
	prompt

ForesawAttackText:
	text "<USER>"
	line "ahnte einen"
	cont "Angriff voraus!"
	prompt

IgnoredOrders2Text:
	text "<USER>"
	line "ignorierte Befehl!"
	prompt

BecameHealthyText:
	text "<USER>"
	line "wurde gesund!"
	prompt

PlayerAffectionEndureText:
	text "<USER>"
	line "hielt durch, damit"

	para "<PLAYER> nicht"
	line "traurig wird!"
	prompt

EnemyAffectionEndureText:
	text "<USER>"
	line "hielt durch, damit"

	para "<ENEMY> nicht"
	line "traurig wird!"
	prompt

PlayerAffectionEvasionText:
	text "<USER>"
	line "wich der Attacke"
	cont "aus"

	para "dank <PLAYER>s"
	line "Ruf!"
	prompt

EnemyAffectionEvasionText:
	text "<USER>"
	line "wich der Attacke"
	cont "aus"

	para "dank <ENEMY>s"
	line "Ruf!"
	prompt

PlayerAffectionSelfCureText:
	text "<USER>"
	line "wurde gesund,"
	cont "damit"

	para "<PLAYER>"
	line "sich nicht sorgt!"
	prompt

EnemyAffectionSelfCureText:
	text "<USER>"
	line "wurde gesund,"
	cont "damit"

	para "<ENEMY>"
	line "sich nicht sorgt!"
	prompt

AffectionCriticalText: ; same for both player and enemy
	text "<USER>"
	line "landete einen"
	cont "Volltreffer, um"

	para "gelobt zu werden!"
	line ""
	prompt

NotifyAirBalloonText:
	text "<USER>"
	line "schwebt dank"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

TraceActivationText:
	text "<USER>"
	line "kopierte"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

BattleText_IntimidateResisted:
	text "<TARGET>s"
	line ""
	text_ram wStringBuffer1

	para "schützt vor"
	line "Erschrecken!"
	prompt

NotifyCloudNine:
	text "Das Wetter wurde"
	line "unterdrückt!"
	prompt

NotifyPressure:
	text "<USER>"
	line "übt seinen"
	cont "Druck aus!"
	prompt

NotifyMoldBreaker:
	text "<USER>"
	line "bricht die Form!"
	prompt

NotifyUnnerve:
	text "<TARGET>"
	line "hat zu viel Angst"
	cont "für Beeren!"
	prompt

NotifyNeutralizingGas:
	text "Neutrogas erfüllte"
	line "das Gebiet!"
	prompt

FriskedItemText:
	text "<USER>"
	line "durchsuchte den"
	cont "Gegner"

	para "und fand"
	line ""
	text_ram wStringBuffer1
	text "!"
	prompt

PickedItemText:
	text "<USER>"
	line "hob"
	cont ""
	text_ram wStringBuffer1
	text " auf!"
	prompt

HarvestedItemText:
	text "<USER>"
	line "erntete"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

FirePoweredUpText:
	text "<USER>s"
	line "Feuer-Attacken"
	cont "wurden verstärkt!"
	prompt

AngerPointMaximizedAttackText:
	text "<USER>"
	line "maximierte Angr.!"
	prompt

CannotUseText:
	text "<TARGET>"
	line "kann"
	cont ""
	text_ram wStringBuffer1
	text " nicht"
	cont "nutzen!"
	prompt

ShudderedText:
; since the ability works with the opponent move data,
; it is on the opponent turn mostly
	text "<TARGET>"
	line "schauderte!"
	prompt

ForewarnText:
	text "<TARGET>"
	line "hat "
	text_ram wStringBuffer1
	text "!"
	prompt

BouncedBackText:
	text "<USER>"
	line "prallte"
	cont ""
	text_ram wStringBuffer1
	text " ab!"
	prompt

ItemCantBeStolenText:
	text "<TARGET>s"
	line "Item kann nicht"
	cont "gestohlen werden!"
	prompt

SuckedUpOozeText:
	text "<USER>"
	line "sog die zähe"
	cont "Flüssigkeit auf!"
	prompt

BattleText_EnemyWithdrew::
	text "<ENEMY>"
	line "rief"
	cont ""
	text_ram wEnemyMonNickname
	text " zurück!"
	prompt

BattleText_WentBackToPlayer:
	text "<USER>"
	line "kehrte zu"
	cont "<PLAYER> zurück!"
	prompt

BattleText_WentBackToEnemy:
	text "<USER>"
	line "kehrte zurück zu"
	cont "<ENEMY>!"
	prompt

ScaredText:
	text "<USER>"
	line "hat zu viel Angst!"
	prompt

GetOutText:
	text "Geist: Raus…"
	line "Raus…"
	prompt

CalFinalPkmnText:
CarrieFinalPkmnText:
JackyFinalPkmnText:
EunaFinalPkmnText:
	text "Ich hab noch ein"
	line "#mon!"
	prompt

FalknerFinalPkmnText:
	text "Der Wind ist"
	line "endlich bei uns!"
	prompt

BugsyFinalPkmnText:
	text "Auch wenn's mein"
	line "letztes #mon"
	cont "ist,"

	para "Käfer-#mon sind"
	line "zäh!"
	prompt

WhitneyFinalPkmnText:
	text "H-he! Nur noch"
	line "eins? Aber…"

	para "Ich verlier nicht,"
	line "hörst du?"
	prompt

MortyFinalPkmnText:
	text "Ich glaube noch"
	line "an uns!"
	prompt

ChuckFinalPkmnText:
	text "Wir haben noch"
	line "nicht verloren!"
	prompt

JasmineFinalPkmnText:
	text "Gut gehärteter"
	line "Stahl hält bis"
	cont "zuletzt durch!"
	prompt

PryceFinalPkmnText:
	text "Humph… Du bist ein"
	line "guter Trainer."
	prompt

ClairFinalPkmnText:
	text "Nur noch #mon?"
	line "Jetzt beginnt der"
	cont "wahre Kampf!"
	prompt

WillFinalPkmnText:
	text "Psycho-Trainer"
	line "geben nicht auf,"
	cont "bis null!"
	prompt

KogaFinalPkmnText:
	text "Fwahaha! Auf"
	line "dieses hier"

	para "hab ich von Anfang"
	line "an gebaut!"
	prompt

BrunoFinalPkmnText:
	text "Kämpfe so hart du"
	line "kannst, bis du"
	cont "umfällst!"
	prompt

KarenFinalPkmnText:
	text "Das ist noch lange"
	line "keine ausweglose"
	cont "Lage!"
	prompt

ChampionFinalPkmnText:
	text "Na gut! Ich dachte"
	line "nie, dass das"
	cont "passiert!"
	prompt

BrockFinalPkmnText:
	text "Ah ha ha!"
	line "Es juckt!"
	prompt

MistyFinalPkmnText:
	text "Hmm… Du bist"
	line "ziemlich gut…"
	prompt

LtSurgeFinalPkmnText:
	text "Noch nicht vorbei."
	line "Es fängt gerade"
	cont "erst an!"
	prompt

ErikaFinalPkmnText:
	text "Sei nicht sanft zu"
	line "mir. Gib mir alles"
	cont "was du hast!"
	prompt

JanineFinalPkmnText:
	text "Du hast eine tolle"
	line "Kampftechnik!"
	prompt

SabrinaFinalPkmnText:
	text "Was danach"
	line "passiert?"
	cont "Ich weiß es schon."
	prompt

BlaineFinalPkmnText:
	text "Ich zeig dir den"
	line "Geist meiner"
	cont "Höhlen-Arena!"
	prompt

BlueFinalPkmnText:
	text "Heh heh heh…"
	line "Darauf bist du"
	cont "nicht vorbereitet."

	para "Wir hauen dich"
	line "um!"
	prompt

RedFinalPkmnText: ; text > text
LeafFinalPkmnText:
	text "………………"
	prompt

Rival1_1FinalPkmnText:
	text "…Humph!"
	line "Nicht schlecht für"
	cont "einen Schwächl."
	prompt

Rival1_2FinalPkmnText:
	text "Du hast echt"
	line "Nerven, hier"
	cont "aufzukreuzen…"
	prompt

Rival1_3FinalPkmnText:
	text "Aus Verzweiflung"
	line "können Schwache"

	para "manchmal gut"
	line "zurückschlagen."
	prompt

Rival1_4FinalPkmnText:
	text "Hey, hey!"
	line "Warum so ernst?"
	prompt

Rival1_5FinalPkmnText:
	text "Aha. Scheint, es"
	line "war nicht nur"
	cont "Glück,"

	para "das dich hierher"
	line "gebracht hat."
	prompt

Rival2_1FinalPkmnText:
	text "Aha. Du kamst"
	line "nicht nach Kanto,"
	cont "nur um anzugeben…"
	prompt

Rival2_2FinalPkmnText:
	text "Warum?! Ich hab"
	line "noch eins übrig!"
	prompt

Lyra1_1FinalPkmnText:
	text "Du hattest wohl"
	line "noch nie einen"
	cont "#mon-Kampf,"
	cont "oder?"

	para "Ich könnt's"
	line "erklären, aber du"

	para "lernst mehr durch"
	line "Erfahrung."

	para "Gib dein Bestes,"
	line "<PLAYER>!"
	prompt

Lyra1_2FinalPkmnText:
	text "Du lernst schnell,"
	line "<PLAYER>!"
	prompt

Lyra1_3FinalPkmnText:
	text "OK! Zeit für mein"
	line "letztes #mon!"
	prompt

Lyra1_4FinalPkmnText:
	text "Ob ich gewinne"
	line "oder verliere,"
	cont "das war Spaß!"
	prompt

Lyra2_1FinalPkmnText:
	text "Du hast mich auf"
	line "mein letztes"
	cont "#mon gebracht…"
	prompt

Proton1FinalPkmnText:
	text "Echt, du verfolgst"
	line "mich bis hierher?"
	prompt

Proton2FinalPkmnText:
	text "Überall, wo wir"
	line "hingehen, ist"
	cont "jemand dagegen…"
	prompt

Petrel1FinalPkmnText:
	text "Was? Verlier"
	line "ich etwa?"
	prompt

Petrel2FinalPkmnText:
	text "Hey, du bist gut!"
	prompt

Archer1FinalPkmnText:
	text "Du darfst nicht im"
	line "Weg stehen, bevor"

	para "Giovanni zu uns"
	line "zurückkehrt!"
	prompt

Archer2FinalPkmnText:
	text "Ah, du bist"
	line "wirklich stark,"
	cont "aber… ich frage"
	cont "mich…"
	prompt

Ariana1FinalPkmnText:
	text "Wa… Was… Warum"
	line "bist du so stark?!"
	prompt

Ariana2FinalPkmnText:
	text "Hey, was glaubst"
	line "du, was du da"
	cont "tust?!"
	prompt

Giovanni1FinalPkmnText:
	text "Mein #mon ist"
	line "unbesiegbar!"
	prompt

Giovanni2FinalPkmnText:
	text "Sag nicht, so ein"
	line "unerfahrenes Kind"

	para "kann wirklich so"
	line "stark sein!"
	prompt

ProfOakFinalPkmnText:
	text "Hm! Exzellent!"
	line "Aber wir sind"
	cont "noch nicht fertig!"
	prompt

ProfElmFinalPkmnText:
	text "Es ist fast"
	line "vorbei…"
	prompt

ProfIvyFinalPkmnText:
	text "Ich bin unten,"
	line "aber nicht raus!"
	prompt

MysticalManFinalPkmnText:
	text "Zeit für ein"
	line "dramat. Comeback!"
	prompt

KarateKingFinalPkmnText:
	text "Yaaarggh!"
	prompt

PalmerFinalPkmnText:
	text "Bravo!"
	prompt

ThortonFinalPkmnText:
	text "Wow!"
	prompt

JessieJamesFinalPkmnText:
	text "Wir haben eine"
	line "stolze Tradition"
	cont "des Scheiterns!"
	prompt

LoreleiFinalPkmnText:
	text "Du hast nur einen"
	line "Vorgeschmack!"
	prompt

AgathaFinalPkmnText:
	text "Denk nicht, du"
	line "hast gewonnen,"
	cont "Kind!"
	prompt

StevenFinalPkmnText:
	text "Ich wusste, du"
	line "bist stark…"
	prompt

CynthiaFinalPkmnText:
	text "Ich lass es noch"
	line "nicht enden!"
	prompt

InverFinalPkmnText:
	text "Du bekommst den"
	line "Dreh raus!"
	prompt

CherylFinalPkmnText:
	text "Ich komm mit"
	line "Heilen nicht nach…"
	prompt

RileyFinalPkmnText:
	text "Dein Team! Ich"
	line "spür deine Aura!"
	prompt

BuckFinalPkmnText:
	text "Jetzt aber! Es ist"
	line "eine brandheiße"
	cont "Situation!"
	prompt

MarleyFinalPkmnText:
	text "…Meine Zeit mit"
	line "dir neigt sich dem"
	cont "Ende zu."
	prompt

MiraFinalPkmnText:
	text "Oh nein! Du bist"
	line "zu viel für mich!"
	prompt

AnabelFinalPkmnText:
	text "Dein Talent…"
	line "ist echt."
	prompt

DarachFinalPkmnText:
	text "Mein letzter"
	line "Stand! Allez!"
	prompt

CaitlinFinalPkmnText:
	text "Auch jetzt sollte"
	line "ich cool und"
	cont "gefasst bleiben…"
	prompt

CandelaFinalPkmnText:
	text "Bis zum Schluss!"
	line "Wie aufregend!"
	prompt

BlancheFinalPkmnText:
	text "Ich bin bisher"
	line "wirklich beeindr."
	prompt

SparkFinalPkmnText:
	text "Du bist gut!"
	line "Keine Frage!"
	prompt

FlanneryFinalPkmnText:
	text "Ähm… was soll ich"
	line "jetzt nur tun?"
	prompt

MayleneFinalPkmnText:
	text "Das ist nicht das"
	line "Ende, mein Freund!"
	prompt

MarlonFinalPkmnText:
	text "Awww, Mann…"

	para "Ich weiß, ich bin"
	line "fast fertig, aber"
	cont "voll aufgedreht!"
	prompt

ValerieFinalPkmnText:
	text "Oh je…"
	prompt

KukuiFinalPkmnText:
	text "Meine Seele brennt"
	line "heiß, yeah!"
	prompt

PiersFinalPkmnText:
	text "Ich mach keine"
	line "Zugaben, klar?"

	para "Keine Songs…"
	line "Keine Attacken…"
	cont "Keine #mon!"
	prompt

LarryFinalPkmnText:
	text "Ich liefere immer"
	line "meine besten"
	cont "Ergebnisse,"

	para "wenn's drauf"
	line "ankommt."
	prompt

BillFinalPkmnText:
	text "Yeehah!"
	line "Was für ein Kampf!"
	prompt

YellowFinalPkmnText:
	text "Mein letztes"
	line "#mon… Leih mir"
	cont "deine Kraft!"
	prompt

WalkerFinalPkmnText:
	text "Wir fliegen noch!"
	prompt

ImakuniFinalPkmnText:
	text "Ich renn weg!"
	line "…Geht nicht?"
	prompt

LawrenceFinalPkmnText:
	text "Undenkbar!"
	prompt

ReiFinalPkmnText:
	text "Ich bin noch nicht"
	line "fertig."
	prompt
