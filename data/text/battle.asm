BattleText::

LinkBattleErrorText::
	text "Es gab einen"
	line "Verbindungsfehler."

	para "Das Spiel wird neu"
	line "gestartet."
	prompt

BattleText_PlayerPickedUpPayDayMoney:
	text "<PLAYER>"
	line "hebt ¥"
	text_decimal wPayDayMoney, 3, 6
	text " auf!"
	prompt

; DE-Canon (Kristall): "Ein wildes" / "NAME!"
WildPokemonAppearedText:
	text "Ein wildes"
	line ""
	stop_compressing_text
	text_ram wEnemyMonNickname
	text "!"
	prompt

LegendaryAppearedText:
	text_ram wEnemyMonNickname
	text "!"
	prompt

GhostAppearedText:
	text "Ein Geist"
	line "erscheint!"
	prompt

SilphScopeRevealText:
	text "Silph Scope 2"
	line "enthüllt den"
	cont "Geist!"
	prompt

; GSC-DE: "Das gefangene" / "NAME" / "greift an!"
HookedPokemonAttackedText:
	text "Das gefangene"
	line ""
	text_ram wEnemyMonNickname
	cont "greift an!"
	prompt

; GSC-DE: "fällt vom Baum!"
PokemonFellFromTreeText:
	text_ram wEnemyMonNickname
	line "fällt vom Baum!"
	prompt

WantsToBattleText::
	text "<ENEMY>"
	line "möchte kämpfen!"
	prompt

WantToBattleText::
	text "<ENEMY>"
	line "möchten kämpfen!"
	prompt

; GSC-DE: "Das wilde" / "NAME" / "ist geflohen!"
BattleText_WildFled:
	text "Das wilde"
	line ""
	stop_compressing_text ; fallthrough
BattleText_LegendaryFled:
	text_ram wEnemyMonNickname
	cont "ist geflohen!"
	prompt

; GSC-DE: "Gegn. NAME" / "ist geflohen!"
BattleText_EnemyFled:
	text "Gegn. "
	text_ram wEnemyMonNickname
	line "ist geflohen!"
	prompt

BattleText_EnemyCantEscape:
	text "<USER>"
	line "kommt nicht"
	cont "davon!"
	prompt

if DEF(DEBUG)
DealtXDamageText:
	text "Verursacht "
	text_decimal wCurDamage, 2, 5
	text " Schaden vor Wurf."
	prompt
endc

; GSC-DE: "Das Gift schadet" / "<USER>!"
HurtByPoisonText:
	text "Das Gift schadet"
	line "<USER>!"
	done

; GSC-DE: "Die Verbrennung" / "schadet" / "<USER>!"
HurtByBurnText:
	text "Die Verbrennung"
	line "schadet"
	cont "<USER>!"
	done

; GSC-DE: "Die EGELSAMEN-" / "ATTACKE schadet" / "<USER>!"
LeechSeedSapsText:
	text "Die EGELSAMEN-"
	line "ATTACKE schadet"
	cont "<USER>!"
	prompt

; GSC-DE: "FLUCH schadet" / "<USER>!"
HurtByCurseText:
	text "FLUCH schadet"
	line "<USER>!"
	prompt

; GSC-DE: "SANDSTURM trifft" / "<USER>!"
SandstormHitsText:
	text "SANDSTURM trifft"
	line "<USER>!"
	prompt

HailHitsText:
	text "Hagel trifft"
	line "<USER>!"
	prompt

; GSC-DE: "<USER>:" / "ABGESANG steht bei" / "N!"
PerishCountText:
	text "<USER>:"
	line "ABGESANG steht bei"
	cont ""
	text_decimal wTextDecimalByte, 1, 1
	text "!"
	prompt

; (z.B. Liquid Ooze / 10%-Schaden; GSC-nah)
BattleText_UserLostSomeOfItsHP:
	text "<USER>"
	line "hat KP verloren!"
	prompt

BattleText_PickedUpItem:
	text "<USER>"
	line "hebt"
	cont ""
	text_ram wStringBuffer2
	text " auf!"
	prompt

BattleText_UserRecoveredWithItem:
	text "<USER>"
	line "erholt sich mit"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

BattleText_UserAteItem:
	text "<USER>"
	line "isst"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

BattleText_UserHurtByItem:
	text "<USER>"
	line "wurde verletzt"
	cont "durch"
	cont ""
	text_ram wStringBuffer1
	text "."
	prompt

BattleText_UserItemLetItMoveFirst::
	text ""
	text_ram wStringBuffer1
	line "von"
	cont "<USER>"
	cont "macht es"
	cont "schneller!"
	prompt

BattleText_UserRecoveredPPUsing:
	text "<USER>"
	line "stellte AP von"
	cont ""
	text_ram wStringBuffer2
	cont "wieder her mit"
	cont ""
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
	cont ""
	text_ram wStringBuffer2
	cont "von"
	cont "<USER>!"
	prompt

BattleText_ItemHarshlyLowered:
	text "Das "
	text_ram wStringBuffer1
	line "senkte stark"
	cont ""
	text_ram wStringBuffer2
	cont "von"
	cont "<USER>!"
	prompt

BattleText_ItemSeverelyLowered:
	text "Das "
	text_ram wStringBuffer1
	line "senkte heftig"
	cont ""
	text_ram wStringBuffer2
	cont "von"
	cont "<USER>!"
	prompt

BattleText_ItemRaised:
	text "Das "
	text_ram wStringBuffer1
	line "erhöhte"
	cont ""
	text_ram wStringBuffer2
	cont "von"
	cont "<USER>!"
	prompt

BattleText_ItemSharplyRaised:
	text "Das "
	text_ram wStringBuffer1
	line "erhöhte stark"
	cont ""
	text_ram wStringBuffer2
	cont "von"
	cont "<USER>!"
	prompt

BattleText_ItemDrasticallyRaised:
	text "Das "
	text_ram wStringBuffer1
	line "erhöhte heftig"
	cont ""
	text_ram wStringBuffer2
	cont "von"
	cont "<USER>!"
	prompt

BattleText_ItemRaisedCrit:
	text "<USER>"
	line "putscht sich auf"
	cont "mit "
	text_ram wStringBuffer1
	text "!"
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
	text "Weißnebel von"
	line ""
	text_ram wStringBuffer1
	cont "verschwindet!"
	prompt

BattleText_SafeguardFaded:
	text "Bodyguard von"
	line ""
	text_ram wStringBuffer1
	cont "verschwindet!"
	prompt

BattleText_LightScreenFell:
	text "Lichtschild von"
	line ""
	text_ram wStringBuffer1
	cont "fällt!"
	prompt

BattleText_ReflectFaded:
	text "Reflektor von"
	line ""
	text_ram wStringBuffer1
	cont "verschwindet!"
	prompt

BattleText_TheRainStopped:
	text "Der Regen hört"
	line "auf!"
	prompt

BattleText_TheSunlightFaded:
	text "Sonnenlicht"
	line "lässt nach!"
	prompt

BattleText_TheSandstormSubsided:
	text "Sandsturm legt"
	line "sich!"
	prompt

BattleText_TheHailStopped:
	text "Der Hagel hört"
	line "auf!"
	prompt

; GSC-DE: "Gegn. NAME" / "wurde besiegt!"
BattleText_EnemyPkmnFainted:
	text "Gegn. "
	text_ram wEnemyMonNickname
	line "wurde besiegt!"
	prompt

GotMoneyForWinningText:
	text "<PLAYER>"
	line "erhält ¥"
	text_decimal wBattleReward, 3, 6
	text "!"
	prompt

BattleText_EnemyWasDefeated:
	text "<ENEMY>"
	line "wurde besiegt!"
	prompt

BattleText_EnemyWereDefeated:
	text "<ENEMY>"
	line "wurden besiegt!"
	prompt

; GSC-DE: "Spielt Remis gegen" / "<ENEMY>!"
TiedAgainstText:
	text "Spielt Remis gegen"
	line "<ENEMY>!"
	prompt

; GSC-DE: erhält + schickt einen Teil nach Hause
SentSomeToMomText:
	text "<PLAYER>"
	line "erhält ¥"
	text_decimal wBattleReward, 3, 6
	text " und schickt"
	cont "einen Teil nach"
	cont "Hause!"
	prompt

SentHalfToMomText:
	text "Die Hälfte wurde"
	line "nach Hause"
	cont "geschickt!"
	prompt

SentAllToMomText:
	text "Alles wurde nach"
	line "Hause geschickt!"
	prompt

BattleText_PkmnFainted:
	text_ram wBattleMonNickname
	line "wurde besiegt!"
	prompt

BattleText_UseNextMon:
	text "Nächstes #MON"
	line "einsetzen?"
	done

; GSC-DE: "Verlor gegen" / "<ENEMY>!"
LostAgainstText:
	text "Verlor gegen"
	line "<ENEMY>!"
	prompt

BattleText_EnemyIsAboutToUseWillPlayerSwitchPkmn:
	text "<ENEMY>"
	line "setzt gleich"
	cont ""
	text_ram wEnemyMonNickname
	text " ein."

	para "Möchtest du dein"
	line "#MON wechseln?"
	done

BattleText_EnemyAreAboutToUseWillPlayerSwitchPkmn:
	text "<ENEMY>"
	line "setzen gleich"
	cont ""
	text_ram wEnemyMonNickname
	text " ein."

	para "Möchtest du dein"
	line "#MON wechseln?"
	done

BattleText_EnemyIsAboutToSwitchWillPlayerSwitchPkmn:
	text "<ENEMY>"
	line "wechselt gleich"
	cont "das #MON."

	para "Möchtest du dein"
	line "#MON wechseln?"
	done

BattleText_EnemyAreAboutToSwitchWillPlayerSwitchPkmn:
	text "<ENEMY>"
	line "wechseln gleich"
	cont "das #MON."

	para "Möchtest du dein"
	line "#MON wechseln?"
	done

BattleText_EnemySentOut:
	text "<ENEMY>"
	line "setzt"
	cont ""
	text_ram wEnemyMonNickname
	text " ein!"
	done

BattleText_TheresNoWillToBattle:
	text "Es will nicht"
	line "kämpfen!"
	prompt

; GSC-DE: "Ein EI kann" / "nicht kämpfen!"
BattleText_AnEGGCantBattle:
	text "Ein EI kann"
	line "nicht kämpfen!"
	prompt

; GSC-DE: "Flucht unmöglich!"
BattleText_CantEscape:
	text "Flucht unmöglich!"
	prompt

BattleText_AskForfeitTrainerBattle:
	text "Kampf aufgeben?"
	done

; GSC-DE: "Du bist entkommen!"
BattleText_GotAwaySafely:
	text "Du bist entkommen!"
	prompt

; GSC-DE: floh durch den Einsatz von ITEM
BattleText_UserFledUsingAStringBuffer1:
	text "<USER>"
	line "floh durch"
	cont "den Einsatz von"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

; GSC-DE: "STACHLER schadet" / "<USER>!"
BattleText_UserHurtBySpikes:
	text "STACHLER schadet"
	line "<USER>!"
	prompt

RecoveredUsingText:
	text "<USER>"
	line "erholt sich mit"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

AirBalloonPoppedText:
	text "Ballon von"
	line "<TARGET>"
	cont "platzte!"
	prompt

BattleText_UsersStringBuffer1Activated:
	text ""
	text_ram wStringBuffer1
	line "von"
	cont "<USER>"
	cont "aktiviert!"
	prompt

BattleText_ItemsCantBeUsedHere:
	text "Hier keine Items"
	line "benutzbar!"
	prompt

BattleText_PkmnIsAlreadyOut:
	text_ram wBattleMonNickname
	line "kämpft schon!"
	prompt

BattleText_PkmnCantBeRecalled:
	text_ram wBattleMonNickname
	line "kann nicht"
	cont "zurück!"
	prompt

BattleText_PkmnCantBeRecalledAbility:
	text ""
	text_ram wStringBuffer1
	line "von"
	cont ""
	text_ram wEnemyMonNickname
	cont "verhindert Flucht!"
	prompt

BattleText_TheresNoPPLeftForThisMove:
	text "Keine AP mehr"
	line "für die Attacke!"
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
	text "<USER>"
	line "kann nur"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

BattleText_ItemPreventsStatusMoves: ; assault vest
	text "Das "
	text_ram wStringBuffer1
	line "verhindert"
	cont "Statusattacken!"
	prompt

BattleText_TheMoveIsDisabled:
	text "Attacke ist"
	line "gesperrt!"
	prompt

BattleText_PkmnHasNoMovesLeft:
	text_ram wBattleMonNickname
	line "hat keine Attacken"
	cont "mehr!"
	done

BattleText_UserEncoreEnded:
	text "Zugabe von"
	line "<USER>"
	cont "endet!"
	prompt

BattleText_StringBuffer1GrewToLevel:
	text_ram wStringBuffer1
	line "erreicht"
	cont "Level "
	text_decimal wCurPartyLevel, 1, 3
	text "!"
	text_sound SFX_DEX_FANFARE_50_79
	text_end

BattleText_WildPkmnIsEating:
	text "Das wilde"
	line ""
	text_ram wEnemyMonNickname
	cont "frisst!"
	prompt

BattleText_WildPkmnIsAngry:
	text "Das wilde"
	line ""
	text_ram wEnemyMonNickname
	cont "ist wütend!"
	prompt

BattleText_ThrewRock:
	text "<PLAYER> wirft"
	line "einen Stein!"
	prompt

BattleText_ThrewBait:
	text "<PLAYER> wirft"
	line "einen Köder!"
	prompt

FastAsleepText:
	text "<USER>"
	line "schläft!"
	done

WokeUpText:
	text "<USER>"
	line "ist aufgewacht!"
	prompt

WasFrozenText:
	text "<TARGET>"
	line "wurde eingefroren!"
	prompt

FrozenSolidText:
	text "<USER>"
	line "ist eingefroren!"
	done

FlinchedText:
	text "<USER>"
	line "schreckt zurück!"
	prompt

MustRechargeText:
	text "<USER>"
	line "muss sich erholen!"
	prompt

DisabledNoMoreText:
	text "Attacke von"
	line "<USER>"
	cont "ist nicht mehr"
	cont "gesperrt!"
	prompt

IsConfusedText:
	text "<USER>"
	line "ist verwirrt!"
	prompt

HurtItselfText:
	text "Es verletzt sich"
	line "vor Verwirrung"
	cont "selbst!"
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
	line "wurde vor"
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
	line "von"
	cont "<USER>"
	cont "umschlungen!"
	prompt

HungOnText:
	text "<TARGET>"
	line "hielt durch mit"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

EnduredText:
	text "<TARGET>"
	line "hielt stand!"
	prompt

InLoveWithText:
	text "<USER>"
	line "hat sich in"
	cont "<TARGET>"
	cont "verliebt!"
	prompt

InfatuationText:
	text "<USER>"
	line "ist verliebt!"
	cont "Kann nicht"
	cont "angreifen!"
	prompt

NoLongerInfatuatedText:
	text "<USER>"
	line "ist nicht mehr"
	cont "verliebt!"
	prompt

ObliviousPreventedDestinyKnot:
	text ""
	text_ram wStringBuffer1
	line "von"
	cont "<USER>"
	cont "verhindert"
	cont "Verliebtheit"
	cont "durch "
	text_ram wStringBuffer2
	text "!"
	prompt

DestinyKnotInfatuatedUser:
	text ""
	text_ram wStringBuffer1
	line "von"
	cont "<TARGET>"

	para "verliebte"
	line "<USER>!"
	prompt

DisabledMoveText:
	text ""
	text_ram wStringBuffer1
	line "von"
	cont "<USER>"
	cont "ist gesperrt!"
	prompt

UsedMoveText:
; GSC-DE canon: "NAME" / "ben. ATTACKE!"  (or "Gegn. NAME" via <USER>)
	text "<USER>"
	line "ben. "
	text_ram wStringBuffer2
	text "!"
	done

UsedMoveInsteadText:
	text "<USER>"
	line "ben. "
	text_ram wStringBuffer2
	text "!"
	done

LoafingAroundText:
	text_ram wBattleMonNickname
	line "faulenzt herum!"
	prompt

BeganToNapText:
	text_ram wBattleMonNickname
	line "schläft ein!"
	prompt

WontObeyText:
	text_ram wBattleMonNickname
	line "gehorcht nicht!"
	prompt

TurnedAwayText:
	text_ram wBattleMonNickname
	line "dreht sich um!"
	prompt

IgnoredOrdersText:
	text_ram wBattleMonNickname
	line "ignoriert den"
	cont "Befehl!"
	prompt

IgnoredSleepingText:
	text_ram wBattleMonNickname
	line "schläft und"
	cont "gehorcht nicht!"
	prompt

NoPPLeftText:
	text "Keine AP mehr"
	line "für die Attacke!"
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
	line "ist eingeschlafen!"
	done

RestedText:
	text "<USER>"
	line "schlief ein und"
	cont "wurde gesund!"
	done

; GSC-DE: "<USER>" / "erholt sich!"
RegainedHealthText:
	text "<USER>"
	line "erholt sich!"
	prompt

IsHurtText:
	text "<USER>"
	line "wird verletzt!"
	prompt

IsTormentedText:
	text "<USER>"
	line "wird gefoltert!"
	prompt

; GSC-DE: "<USER>s" / "Attacke ging" / "daneben!"
AttackMissedText:
	text "<USER>s"
	line "Attacke ging"
	cont "daneben!"
	prompt

; GSC-DE: macht weiter und fällt hin
CrashedText:
	text "<USER>"
	line "macht weiter und"
	cont "fällt hin!"
	prompt

; GSC-DE: "Es hat keine" / "Wirkung!"  /  "…auf TARGET"
UnaffectedText:
	text "<TARGET>"
	line "ist unversehrt!"
	prompt

DoesntAffectText:
	text "Es hat keine"
	line "Wirkung auf"
	cont "<TARGET>!"
	prompt

CriticalHitText:
	text "Volltreffer!"
	prompt

ExtremelyEffectiveText:
	text "Die Attacke ist"
	line "sehr effektiv!"
	prompt

; GSC-DE: "Die Attacke ist" / "sehr effektiv!"
SuperEffectiveText:
	text "Die Attacke ist"
	line "sehr effektiv!"
	prompt

; GSC-DE: "Die Attacke ist" / "nicht sehr" / "effektiv…"
NotVeryEffectiveText:
	text "Die Attacke ist"
	line "nicht sehr"
	cont "effektiv…"
	prompt

MostlyIneffectiveText:
	text "Die Attacke ist"
	line "kaum effektiv…"
	prompt

; GSC-DE: K.O. für beide TARGET, USER
TookDownWithItText:
	text "K.O. für beide"
	line "<TARGET>,"
	cont "<USER>!"
	prompt

; GSC-DE: verfällt in RASEREI
RageBuildingText:
	text "<USER>"
	line "verfällt in"
	cont "RASEREI!"
	prompt

; GSC-DE: setzt ZUGABE ein
GotAnEncoreText:
	text "<TARGET>"
	line "setzt"
	cont "ZUGABE ein!"
	prompt

SharedPainText:
	text "Die Kämpfer"
	line "teilen den"
	cont "Schmerz!"
	prompt

SwappedAbilitiesText:
	text "Die Kämpfer"
	line "tauschten die"
	cont "Fähigkeiten!"
	prompt

SwappedItemsText:
	text "Die Kämpfer"
	line "tauschten die"
	cont "Items!"
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
	line "skizziert"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

DestinyBondEffectText:
	text "<USER>"
	line "versucht, den"
	cont "Gegner mitzu-"
	cont "reißen!"
	prompt

BellChimedText:
	text "Eine Glocke"
	line "läutet!"
	prompt

; GSC-DE: schläft / schläft bereits
FellAsleepText:
	text "<TARGET>"
	line "schläft!"
	prompt

AlreadyAsleepText:
	text "<TARGET>"
	line "schläft bereits!"
	prompt

WasPoisonedText:
	text "<TARGET>"
	line "wurde vergiftet!"
	prompt

; GSC-DE: ist schwer vergiftet
BadlyPoisonedText:
	text "<TARGET>"
	line "ist schwer"
	cont "vergiftet!"
	prompt

AlreadyPoisonedText:
	text "<TARGET>"
	line "ist bereits"
	cont "vergiftet!"
	prompt

; GSC-DE: "<TARGET>" / "hat KP verloren!"
; (nicht "KP von … abgesaugt!" — overflow mit Gegn. NAME)
SuckedHealthText:
	text "<TARGET>"
	line "hat KP verloren!"
	prompt

; GSC-DE: "<TARGET>s" / "Traum gefressen!"
DreamEatenText:
	text "<TARGET>s"
	line "Traum gefressen!"
	prompt

; GSC-DE: brennt!
WasBurnedText:
	text "<TARGET>"
	line "brennt!"
	prompt

AlreadyBurnedText:
	text "<TARGET>"
	line "ist schon"
	cont "verbrannt!"
	prompt

WontRiseAnymoreText:
	text ""
	text_ram wStringBuffer2
	line "von"
	cont "<USER>"
	cont "steigt nicht"
	cont "weiter!"
	prompt

WontDropAnymoreText:
	text ""
	text_ram wStringBuffer2
	line "von"
	cont "<USER>"
	cont "sinkt nicht"
	cont "weiter!"
	prompt

StatRoseText:
	text ""
	text_ram wStringBuffer2
	line "von"
	cont "<USER>"
	cont "steigt!"
	prompt

StatRoseSharplyText:
	text ""
	text_ram wStringBuffer2
	line "von"
	cont "<USER>"
	cont "steigt stark!"
	prompt

StatRoseDrasticallyText:
	text ""
	text_ram wStringBuffer2
	line "von"
	cont "<USER>"
	cont "steigt enorm!"
	prompt

StatFellText:
	text ""
	text_ram wStringBuffer2
	line "von"
	cont "<USER>"
	cont "sinkt!"
	prompt

StatHarshlyFellText:
	text ""
	text_ram wStringBuffer2
	line "von"
	cont "<USER>"
	cont "sinkt stark!"
	prompt

StatSeverelyFellText:
	text ""
	text_ram wStringBuffer2
	line "von"
	cont "<USER>"
	cont "sinkt enorm!"
	prompt

FledFromBattleText::
	text "<USER>"
	line "floh!"
	prompt

FledInFearText:
	text "<TARGET>"
	line "floh vor Angst!"
	prompt

HitNTimesText:
	text "Traf "
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text "-mal!"
	prompt

MistText:
	text "Team von"
	line "<USER>"
	cont "im Weißnebel!"
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
	line "wird durch"
	cont "Weißnebel"
	cont "geschützt!"
	prompt

GettingPumpedText:
	text_pause
	text "<USER>"
	line "putscht sich auf!"
	prompt

RecoilText:
	text "<USER>"
	line "wird durch"
	cont "Rückstoß verletzt!"
	prompt

MadeSubstituteText:
	text "<USER>"
	line "stellte ein"
	cont "Abbild her!"
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
	text "Abbild fängt"
	line "für"
	cont "<TARGET>"
	cont "ab!"
	prompt

SubFadedText:
	text "Abbild von"
	line "<TARGET>"
	cont "verschwindet!"
	prompt

WasSeededText:
	text "<TARGET>"
	line "wurde bepflanzt!"
	prompt

EvadedText:
	text "<TARGET>"
	line "wich aus!"
	prompt

WasDisabledText:
	text ""
	text_ram wStringBuffer2
	line "von"
	cont "<TARGET>"
	cont "wurde gesperrt!"
	prompt

CoinsScatteredText:
	text "Münzen rollen"
	line "überall hin!"
	prompt

TransformedTypeText:
	text "<USER>"
	line "wurde zum"
	cont ""
	text_ram wStringBuffer1
	text "-Typ!"
	prompt

EliminatedStatsText:
	text "Alle Werte"
	line "neutralisiert!"
	prompt

TransformedText:
	text "<USER>"
	line "verwandelt sich"
	cont "in "
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
	text "Sp.Vert. von"
	line "<USER>"
	cont "steigt!"
	prompt

ReflectEffectText:
	text "Verteidigung"
	line "von"
	cont "<USER>"
	cont "steigt!"
	prompt

; GSC-DE: "Nichts geschieht."
NothingHappenedText:
	text "Nichts geschieht."
	prompt

ButItFailedText:
	text "Es schlug fehl!"
	prompt

DidntAffectText:
	text "Es hat keine"
	line "Wirkung auf"
	cont "<TARGET>!"
	prompt

; GSC-DE: "Die KP von" / "<USER>" / "wurden ganz" / "aufgefüllt!"
HPIsFullText:
	text "Die KP von"
	line "<USER>"

	para "wurden ganz"
	line "aufgefüllt!"
	prompt

DraggedOutText:
	text "<USER>"
	line "wird raus-"
	cont "gezogen!"
	prompt

; GSC-DE: ist paralysiert! (ohne Evtl.-Zusatz — Platz)
ParalyzedText:
	text "<TARGET>"
	line "ist paralysiert!"
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
	line "heilt Werte mit"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

CuredInfatuationWithItem:
	text "<USER>"
	line "heilte Verliebt-"
	cont "heit mit"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

CuredEncoreWithItem:
	text "<USER>"
	line "heilte Zugabe"
	cont "mit"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

CuredDisableWithItem:
	text "<USER>"
	line "heilte Blockade"
	cont "mit"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

StoleText:
	text "<USER>"
	line "stiehlt"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

KnockedOffItemText:
	text "<USER>"
	line "schlägt"
	cont ""
	text_ram wStringBuffer1
	text " weg!"
	prompt

CantEscapeNowText:
	text "<TARGET>"
	line "kann nicht"
	cont "fliehen!"
	prompt

; GSC-DE: wurde aufgetaut
WasDefrostedText:
	text "<USER>"
	line "wurde aufgetaut!"
	prompt

; GSC-DE: zieht sich KP ab und belegt TARGET mit einem FLUCH
PutACurseText:
	text "<USER>"
	line "zieht sich KP ab"

	para "und belegt"
	line "<TARGET>"
	cont "mit einem FLUCH!"
	prompt

; GSC-DE: schützt sich selbst
ProtectedItselfText:
	text "<USER>"
	line "schützt sich"
	cont "selbst!"
	prompt

ProtectingItselfText:
	text "<TARGET>"
	line "schützt sich!"
	done

SpikesText:
	text "Stacheln um"
	line "<TARGET>!"
	prompt

ToxicSpikesText:
	text "Giftstacheln"
	line "liegen um"
	cont "<TARGET>!"
	prompt

IdentifiedText:
	text "<USER>"
	line "identifiziert"
	cont "<TARGET>!"
	prompt

StartPerishSongText:
	text "Beide #MON in"
	line "3 Runden K.O.!"
	prompt

StartPerishBodyText:
	text "Beide #MON in"
	line "3 Runden K.O.!"
	prompt

SandstormBrewedText:
	text "Ein Sandsturm"
	line "zieht auf!"
	prompt

HailStartedText:
	text "Es hagelt!"
	prompt

BracedItselfText:
	text "<USER>"
	line "wappnet sich!"
	prompt

FellInLoveText:
	text "<TARGET>"
	line "hat sich"
	cont "verliebt!"
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
	text "Intensität "
	text_decimal wTextDecimalByte, 1, 2
	text "!"
	prompt

ReleasedByText:
	text "<USER>"
	line "wurde befreit"
	cont "von"
	cont "<TARGET>!"
	prompt

ShedLeechSeedText:
	text "<USER>"
	line "warf Egelsamen"
	cont "ab!"
	prompt

BlewSpikesText:
	text "<USER>"
	line "blies Stacheln"
	cont "weg!"
	prompt

BlewToxicSpikesText:
	text "<USER>"
	line "blies Gift-"
	cont "stacheln weg!"
	prompt

DownpourText:
	text "Es regnet!"
	prompt

SunGotBrightText:
	text "Die Sonne brennt!"
	prompt

BellyDrumText:
	text "<USER>"
	line "senkt die KP und"
	cont "maximiert den"
	cont "Angriff!"
	prompt

BellyDrumContraryText:
	text "<USER>"
	line "senkt die KP und"
	cont "minimiert den"
	cont "Angriff!"
	prompt

ForesawAttackText:
	text "<USER>"
	line "ahnt einen Angriff"
	cont "voraus!"
	prompt

IgnoredOrders2Text:
	text "<USER>"
	line "beachtet den"
	cont "Befehl nicht!"
	prompt

BecameHealthyText:
	text "<USER>"
	line "wurde gesund!"
	prompt

PlayerAffectionEndureText:
	text "<USER>"
	line "hielt durch,"
	cont "damit"

	para "<PLAYER>"
	line "nicht traurig"
	cont "wird!"
	prompt

EnemyAffectionEndureText:
	text "<USER>"
	line "hielt durch,"
	cont "damit"

	para "<ENEMY>"
	line "nicht traurig"
	cont "wird!"
	prompt

PlayerAffectionEvasionText:
	text "<USER>"
	line "wich der"
	cont "Attacke aus"

	para "dank Ruf von"
	line "<PLAYER>!"
	prompt

EnemyAffectionEvasionText:
	text "<USER>"
	line "wich der"
	cont "Attacke aus"

	para "dank Ruf von"
	line "<ENEMY>!"
	prompt

PlayerAffectionSelfCureText:
	text "<USER>"
	line "wurde gesund,"
	cont "damit"

	para "<PLAYER>"
	line "sich nicht"
	cont "sorgt!"
	prompt

EnemyAffectionSelfCureText:
	text "<USER>"
	line "wurde gesund,"
	cont "damit"

	para "<ENEMY>"
	line "sich nicht"
	cont "sorgt!"
	prompt

AffectionCriticalText: ; same for both player and enemy
	text "<USER>"
	line "landete einen"
	cont "Volltreffer, um"

	para "gelobt zu werden!"
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
	; not "<TARGET>s" (EN possessive + overflow with Gegn.)
	text "<TARGET>"
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
	line "übt Druck aus!"
	prompt

NotifyMoldBreaker:
	text "<USER>"
	line "durchbricht"
	cont "Fähigkeiten!"
	prompt

NotifyUnnerve:
	text "<TARGET>"
	line "ist zu nervös"
	cont "für Beeren!"
	prompt

NotifyNeutralizingGas:
	text "Neutrogas füllt"
	line "das Gebiet!"
	prompt

FriskedItemText:
	text "<USER>"
	line "spioniert aus"

	para "und findet"
	line ""
	text_ram wStringBuffer1
	text "!"
	prompt

PickedItemText:
	text "<USER>"
	line "hebt"
	cont ""
	text_ram wStringBuffer1
	text " auf!"
	prompt

HarvestedItemText:
	text "<USER>"
	line "erntet"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

FirePoweredUpText:
	; "von Gegn. NAME" overflows 18 — keep mon name on its own line
	text "Feuer-Attacken"
	line "von"
	cont "<USER>"
	cont "sind stärker!"
	prompt

AngerPointMaximizedAttackText:
	text "<USER>"
	line "maximiert den"
	cont "Angriff!"
	prompt

CannotUseText:
	text "<TARGET>"
	line "kann"
	cont ""
	text_ram wStringBuffer1
	cont "nicht nutzen!"
	prompt

ShudderedText:
; since the ability works with the opponent move data,
; it is on the opponent turn mostly
	text "<TARGET>"
	line "schauderte!"
	prompt

ForewarnText:
	; "Gegn. NAME" already uses up to 16 tiles — never put "hat …" on same line.
	; GSC 2-line box: Gegn. POKEMON / hat FÄHIGKEIT!
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
	text "Item von"
	line "<TARGET>"
	cont "kann man nicht"
	cont "stehlen!"
	prompt

SuckedUpOozeText:
	text "<USER>"
	line "saugte die zähe"
	cont "Flüssigkeit auf!"
	prompt

BattleText_EnemyWithdrew::
	text "<ENEMY>"
	line "ruft"
	cont ""
	text_ram wEnemyMonNickname
	text " zurück!"
	prompt

BattleText_WentBackToPlayer:
	text "<USER>"
	line "geht zu <PLAYER>"
	cont "zurück!"
	prompt

BattleText_WentBackToEnemy:
	text "<USER>"
	line "geht zu"
	cont "<ENEMY>"
	cont "zurück!"
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
	line "#MON!"
	prompt

FalknerFinalPkmnText:
	text "Der Wind ist"
	line "endlich bei uns!"
	prompt

BugsyFinalPkmnText:
	text "Auch wenn's mein"
	line "letztes #MON"
	cont "ist,"

	para "Käfer-#MON sind"
	line "zäh!"
	prompt

WhitneyFinalPkmnText:
	text "H-he! Nur noch"
	line "eins? Aber…"

	para "Ich verlier nicht,"
	line "hörst du?"
	prompt

MortyFinalPkmnText:
	text "Ich glaube noch an"
	line "uns!"
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
	text "Hmpf… Du bist ein"
	line "guter Trainer."
	prompt

ClairFinalPkmnText:
	text "Nur noch #MON?"
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
	text "Ah ha ha! Es"
	line "juckt!"
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
	line "passiert? Ich weiß"
	cont "es schon."
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

	para "Wir hauen dich um!"
	prompt

RedFinalPkmnText: ; text > text
LeafFinalPkmnText:
	text "………………"
	prompt

Rival1_1FinalPkmnText:
	text "…Hmpf! Nicht"
	line "schlecht für einen"
	cont "Schwächl."
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
	text "Hey, hey! Warum so"
	line "ernst?"
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
	line "nicht nach KANTO,"
	cont "nur um anzugeben…"
	prompt

Rival2_2FinalPkmnText:
	text "Warum?! Ich hab"
	line "noch eins übrig!"
	prompt

Lyra1_1FinalPkmnText:
	text "Du hattest wohl"
	line "noch nie einen"
	cont "#MON-Kampf,"
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
	text "O.K.! Zeit für"
	line "mein letztes"
	cont "#MON!"
	prompt

Lyra1_4FinalPkmnText:
	text "Ob ich gewinne"
	line "oder verliere, das"
	cont "war Spaß!"
	prompt

Lyra2_1FinalPkmnText:
	text "Du hast mich auf"
	line "mein letztes"
	cont "#MON gebracht…"
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
	text "Was? Verlier ich"
	line "etwa?"
	prompt

Petrel2FinalPkmnText:
	text "Hey, du bist gut!"
	prompt

Archer1FinalPkmnText:
	text "Du darfst nicht im"
	line "Weg stehen, bevor"

	para "GIOVANNI zu uns"
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
	text "Mein #MON ist"
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
	line "Aber wir sind noch"
	cont "nicht fertig!"
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
	text "Toll!"
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
	text "Dein Talent… ist"
	line "echt."
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
	text "Du bist gut! Keine"
	line "Frage!"
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
	line "heiß, ja!"
	prompt

PiersFinalPkmnText:
	text "Ich mach keine"
	line "Zugaben, klar?"

	para "Keine Songs… Keine"
	line "Attacken… Keine"
	cont "#MON!"
	prompt

LarryFinalPkmnText:
	text "Ich liefere immer"
	line "meine besten"
	cont "Ergebnisse,"

	para "wenn's drauf"
	line "ankommt."
	prompt

BillFinalPkmnText:
	text "Yeehah! Was für"
	line "ein Kampf!"
	prompt

YellowFinalPkmnText:
	text "Mein letztes"
	line "#MON… Leih mir"
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

