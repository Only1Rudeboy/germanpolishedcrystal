# -*- coding: utf-8 -*-
from pathlib import Path

p = Path("data/text/battle.asm")
t = p.read_text(encoding="utf-8")
orig = t

# Exact multi-line replacements (old -> new)
repls = [
# FastAsleep
('''FastAsleepText:
	text "<USER>"
	line "schläft!"
	done''',
'''FastAsleepText:
	; GSC: schläft tief!
	text "<USER>"
	line "schläft tief!"
	done'''),

# FrozenSolid
('''FrozenSolidText:
	text "<USER>"
	line "ist eingefroren!"
	done''',
'''FrozenSolidText:
	; GSC: ist tiefgefroren!
	text "<USER>"
	line "ist tiefgefroren!"
	done'''),

# MustRecharge
('''MustRechargeText:
	text "<USER>"
	line "muss sich erholen!"
	done''',
'''MustRechargeText:
	; GSC: muss sich wieder / aufladen!
	text "<USER>"
	line "muss sich wieder"
	cont "aufladen!"
	done'''),

# GettingPumped
('''GettingPumpedText:
	text_pause
	text "<USER>"
	line "putscht sich auf!"
	prompt''',
'''GettingPumpedText:
	; GSC: pumpt sich auf!
	text_pause
	text "<USER>"
	line "pumpt sich auf!"
	prompt'''),

# LoafingAround
('''LoafingAroundText:
	text_ram wBattleMonNickname
	line "faulenzt herum!"
	prompt''',
'''LoafingAroundText:
	; GSC: faulenzt.
	text_ram wBattleMonNickname
	line "faulenzt."
	prompt'''),

# BeganToNap
('''BeganToNapText:
	text_ram wBattleMonNickname
	line "schläft ein!"
	prompt''',
'''BeganToNapText:
	; GSC: macht ein Nickerchen!
	text_ram wBattleMonNickname
	line "macht ein"
	cont "Nickerchen!"
	prompt'''),

# WontObey
('''WontObeyText:
	text_ram wBattleMonNickname
	line "gehorcht nicht!"
	prompt''',
'''WontObeyText:
	; GSC: ist ungehorsam!
	text_ram wBattleMonNickname
	line "ist ungehorsam!"
	prompt'''),

# TurnedAway
('''TurnedAwayText:
	text_ram wBattleMonNickname
	line "dreht sich um!"
	prompt''',
'''TurnedAwayText:
	; GSC: wendet sich ab!
	text_ram wBattleMonNickname
	line "wendet sich ab!"
	prompt'''),

# IgnoredOrders
('''IgnoredOrdersText:
	text_ram wBattleMonNickname
	line "ignoriert den"
	cont "Befehl!"
	prompt''',
'''IgnoredOrdersText:
	; GSC: ignoriert Befehl!
	text_ram wBattleMonNickname
	line "ignoriert Befehl!"
	prompt'''),

# WentToSleep
('''WentToSleepText:
	text "<USER>"
	line "ist eingeschlafen!"
	done''',
'''WentToSleepText:
	; GSC: schläft ein!
	text "<USER>"
	line "schläft ein!"
	done'''),

# Rested
('''RestedText:
	text "<USER>"
	line "schlief ein und"
	cont "wurde gesund!"
	done''',
'''RestedText:
	; GSC: schläft und erholt sich!
	text "<USER>"
	line "schläft und"
	cont "erholt sich!"
	done'''),

# BecameConfused
('''BecameConfusedText:
	text "<TARGET>"
	line "wurde verwirrt!"
	prompt''',
'''BecameConfusedText:
	; GSC: ist verwirrt!
	text "<TARGET>"
	line "ist verwirrt!"
	prompt'''),

# HurtItself
('''HurtItselfText:
	text "Es verletzt sich"
	line "vor Verwirrung"
	cont "selbst!"
	prompt''',
'''HurtItselfText:
	; GSC: Es hat sich vor Verwirrung selbst verletzt!
	text "Es hat sich vor"
	line "Verwirrung selbst"
	cont "verletzt!"
	prompt'''),

# BellChimed
('''BellChimedText:
	text "Eine Glocke"
	line "läutet!"
	prompt''',
'''BellChimedText:
	; GSC: erklingt!
	text "Eine Glocke"
	line "erklingt!"
	prompt'''),

# Whirlpool/FireSpin trap
('''WhirlpoolTrapText:
	text "<TARGET>"
	line "wurde gefangen!"
	prompt''',
'''WhirlpoolTrapText:
	; GSC: ging in die Falle!
	text "<TARGET>"
	line "ging in die Falle!"
	prompt'''),

('''FireSpinTrapText:
	text "<TARGET>"
	line "wurde gefangen!"
	prompt''',
'''FireSpinTrapText:
	; GSC: ging in die Falle!
	text "<TARGET>"
	line "ging in die Falle!"
	prompt'''),

# HungOn
('''HungOnText:
	text "<TARGET>"
	line "hielt durch mit"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt''',
'''HungOnText:
	; GSC: klammert sich an ITEM!
	text "<TARGET>"
	line "klammert sich an"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt'''),

# Endured
('''EnduredText:
	text "<TARGET>"
	line "hielt stand!"
	prompt''',
'''EnduredText:
	; GSC: AUSDAUER mindert die Attacke!
	text "<TARGET>s"
	line "AUSDAUER mindert"
	cont "die Attacke!"
	prompt'''),

# InLoveWith
('''InLoveWithText:
	text "<USER>"
	line "hat sich in"
	cont "<TARGET>"
	cont "verliebt!"
	prompt''',
'''InLoveWithText:
	; GSC: verliebt sich in TARGET!
	text "<USER>"
	line "verliebt sich in"
	cont "<TARGET>!"
	prompt'''),

# Infatuation
('''InfatuationText:
	text "<USER>"
	line "ist verliebt!"
	cont "Kann nicht"
	cont "angreifen!"
	prompt''',
'''InfatuationText:
	; GSC: ist zu verliebt, um anzugreifen!
	text "<USER>"
	line "ist zu verliebt,"
	cont "um anzugreifen!"
	prompt'''),

# MadeSubstitute family
('''MadeSubstituteText:
	text "<USER>"
	line "stellte ein"
	cont "Abbild her!"
	prompt''',
'''MadeSubstituteText:
	; GSC: DELEGATOR
	text "<USER>"
	line "generiert einen"
	cont "DELEGATOR!"
	prompt'''),

('''HasSubstituteText:
	text "<USER>"
	line "hat schon ein"
	cont "Abbild!"
	prompt''',
'''HasSubstituteText:
	text "<USER>"
	line "hat schon einen"
	cont "DELEGATOR!"
	prompt'''),

('''TooWeakSubText:
	text "Zu schwach für"
	line "ein Abbild!"
	prompt''',
'''TooWeakSubText:
	text "Keine Energie für"
	line "den DELEGATOR!"
	prompt'''),

# Spikes
('''SpikesText:
	text "Stacheln um"
	line "<TARGET>!"
	prompt''',
'''SpikesText:
	; GSC: STACHLER umgibt TARGET!
	text "STACHLER umgibt"
	line "<TARGET>!"
	prompt'''),

# SandstormBrewed
('''SandstormBrewedText:
	text "Ein Sandsturm"
	line "zieht auf!"
	prompt''',
'''SandstormBrewedText:
	; GSC: Ein SANDSTURM entsteht!
	text "Ein SANDSTURM"
	line "entsteht!"
	prompt'''),

# Downpour / Sun
('''DownpourText:
	text "Es regnet!"
	prompt''',
'''DownpourText:
	; GSC: Ein Platzregen setzt ein!
	text "Ein Platzregen"
	line "setzt ein!"
	prompt'''),

('''SunGotBrightText:
	text "Die Sonne brennt!"
	prompt''',
'''SunGotBrightText:
	; GSC: Die Sonne scheint hell!
	text "Die Sonne scheint"
	line "hell!"
	prompt'''),

# BracedItself
('''BracedItselfText:
	text "<USER>"
	line "wappnet sich!"
	prompt''',
'''BracedItselfText:
	; GSC: macht sich bereit!
	text "<USER>"
	line "macht sich bereit!"
	prompt'''),

# FellInLove
('''FellInLoveText:
	text "<TARGET>"
	line "hat sich"
	cont "verliebt!"
	prompt''',
'''FellInLoveText:
	; GSC: verliebt sich!
	text "<TARGET>"
	line "verliebt sich!"
	prompt'''),

# ShedLeechSeed
('''ShedLeechSeedText:
	text "<USER>"
	line "warf Egelsamen"
	cont "ab!"
	prompt''',
'''ShedLeechSeedText:
	; GSC: befreit sich von EGELSAMEN!
	text "<USER>"
	line "befreit sich von"
	cont "EGELSAMEN!"
	prompt'''),

# BlewSpikes
('''BlewSpikesText:
	text "<USER>"
	line "blies Stacheln"
	cont "weg!"
	prompt''',
'''BlewSpikesText:
	; GSC: entfernt STACHLER!
	text "<USER>"
	line "entfernt"
	cont "STACHLER!"
	prompt'''),

# ForesawAttack
('''ForesawAttackText:
	text "<USER>"
	line "ahnt einen Angriff"
	cont "voraus!"
	prompt''',
'''ForesawAttackText:
	; GSC: erahnt Attacke!
	text "<USER>"
	line "erahnt Attacke!"
	prompt'''),

# TheresNoWillToBattle
('''BattleText_TheresNoWillToBattle:
	text "Es will nicht"
	line "kämpfen!"
	prompt''',
'''BattleText_TheresNoWillToBattle:
	; GSC: Es kann nicht kämpfen!
	text "Es kann nicht"
	line "kämpfen!"
	prompt'''),

# ItemsCantBeUsedHere
('''BattleText_ItemsCantBeUsedHere:
	text "Hier keine Items"
	line "benutzbar!"
	prompt''',
'''BattleText_ItemsCantBeUsedHere:
	; GSC
	text "Items können hier"
	line "nicht eingesetzt"
	cont "werden."
	prompt'''),

# TheMoveIsDisabled
('''BattleText_TheMoveIsDisabled:
	text "Die Attacke ist"
	line "gesperrt!"
	prompt''',
'''BattleText_TheMoveIsDisabled:
	; GSC: BLOCKIERT!
	text "Die Attacke ist"
	line "BLOCKIERT!"
	prompt'''),

# Weather ends
('''BattleText_TheRainStopped:
	text "Der Regen hört"
	line "auf!"
	prompt''',
'''BattleText_TheRainStopped:
	; GSC
	text "Es hat aufgehört"
	line "zu regnen."
	prompt'''),

('''BattleText_TheSunlightFaded:
	text "Sonnenlicht"
	line "lässt nach!"
	prompt''',
'''BattleText_TheSunlightFaded:
	; GSC
	text "Das Sonnenlicht"
	line "schwindet."
	prompt'''),

('''BattleText_TheSandstormSubsided:
	text "Sandsturm legt"
	line "sich!"
	prompt''',
'''BattleText_TheSandstormSubsided:
	; GSC
	text "Der SANDSTURM"
	line "lässt nach."
	prompt'''),

# HitNTimes - find pattern
('''HitNTimesText:
	text "Traf "
	text_decimal wPlayerDamageTaken, 1, 1
	text "-mal!"
	prompt''',
'''HitNTimesText:
	; GSC: Erleidet N Treffer!
	text "Erleidet "
	text_decimal wPlayerDamageTaken, 1, 1
	line "Treffer!"
	prompt'''),
]

applied = 0
missed = []
for old, new in repls:
    if old in t:
        t = t.replace(old, new, 1)
        applied += 1
    else:
        # try normalize line endings only first line for debug
        missed.append(old.split('\n')[0][:60])

# Additional flexible replacements for HitNTimes enemy variant and Sub texts
import re

# SubTookDamage / SubFaded - flexible
def try_re(pat, repl, flags=0):
    global t, applied
    n, c = re.subn(pat, repl, t, count=1, flags=flags)
    if c:
        t = n
        applied += 1
        return True
    missed.append(pat[:50] if isinstance(pat, str) else 're')
    return False

# StoleText
try_re(
r'StoleText:\n\ttext "<USER>"\n\tline "stiehlt"\n\tcont ""\n\ttext_ram wStringBuffer1\n\ttext "!"\n\tprompt',
'''StoleText:
	; GSC: raubt ITEM vom Gegner!
	text "<USER>"
	line "raubt "
	text_ram wStringBuffer1
	cont "vom Gegner!"
	prompt'''
)

# DestinyBond
try_re(
r'DestinyBondEffectText:\n\ttext "<USER>"\n\tline "versucht, den"\n\tcont "Gegner mitzu-"\n\tcont "reißen!"\n\tprompt',
'''DestinyBondEffectText:
	; GSC: versucht ein beidseitiges K.O.!
	text "<USER>"
	line "versucht ein"
	cont "beidseitiges"
	cont "K.O.!"
	prompt'''
)

# EvadedText
try_re(
r'EvadedText:\n\ttext "<TARGET>"\n\tline "wich aus!"\n\tprompt',
'''EvadedText:
	; GSC: ist ausgewichen!
	text "<TARGET>"
	line "ist ausgewichen!"
	prompt'''
)

# CoinsScattered
try_re(
r'CoinsScatteredText:\n\ttext "Münzen rollen"\n\tline "überall hin!"\n\tprompt',
'''CoinsScatteredText:
	; GSC
	text "Es liegen überall"
	line "Münzen verstreut!"
	prompt'''
)

# FledFromBattle / FledInFear tense
try_re(
r'FledFromBattleText::\n\ttext "<USER>"\n\tline "floh!"\n\tprompt',
'''FledFromBattleText::
	; GSC: flieht!
	text "<USER>"
	line "flieht!"
	prompt'''
)
try_re(
r'FledInFearText:\n\ttext "<TARGET>"\n\tline "floh vor Angst!"\n\tprompt',
'''FledInFearText:
	; GSC: flieht vor Angst!
	text "<TARGET>"
	line "flieht vor Angst!"
	prompt'''
)

# DraggedOut
try_re(
r'DraggedOutText:\n\ttext "<USER>"\n\tline "wird raus-"\n\tcont "gezogen!"\n\tprompt',
'''DraggedOutText:
	; GSC: wurde auserwählt!
	text "<USER>"
	line "wurde auserwählt!"
	prompt'''
)

# PkmnIsAlreadyOut
try_re(
r'BattleText_PkmnIsAlreadyOut:\n\ttext_ram wBattleMonNickname\n\tline "kämpft schon!"\n\tprompt',
'''BattleText_PkmnIsAlreadyOut:
	; GSC: kämpft bereits.
	text_ram wBattleMonNickname
	line "kämpft bereits."
	prompt'''
)

# PkmnCantBeRecalled
try_re(
r'BattleText_PkmnCantBeRecalled:\n\ttext_ram wBattleMonNickname\n\tline "kann nicht"\n\tcont "zurück!"\n\tprompt',
'''BattleText_PkmnCantBeRecalled:
	; GSC: kann nicht ausgetauscht werden!
	text_ram wBattleMonNickname
	line "kann nicht aus-"
	cont "getauscht werden!"
	prompt'''
)

# Sub texts - Abbild -> DELEGATOR
t2, c = re.subn(r'(SubTookDamageText:\n\ttext ")Abbild fängt("\n\tline "für")', r'\1Der DELEGATOR\2', t, count=1)
if c:
    t = t2
    applied += 1
    t2, c = re.subn(r'(SubTookDamageText:.*?line "für"\n\tcont "<TARGET>"\n\tcont ")ab!(")', r'\1nimmt Schaden für\n\tcont "<TARGET>"\n\tcont "ab!"  ; patched', t, count=1, flags=re.S)
# simpler direct
if 'SubTookDamageText:' in t and 'Abbild fängt' in t:
    t = t.replace(
'''SubTookDamageText:
	text "Abbild fängt"
	line "für"
	cont "<TARGET>"
	cont "ab!"
	prompt''',
'''SubTookDamageText:
	; GSC DELEGATOR
	text "Der DELEGATOR"
	line "nimmt Schaden für"
	cont "<TARGET>!"
	prompt''', 1)
    applied += 1

if 'SubFadedText:' in t and 'Abbild von' in t:
    t = t.replace(
'''SubFadedText:
	text "Abbild von"
	line "<TARGET>"
	cont "verschwindet!"
	prompt''',
'''SubFadedText:
	; GSC DELEGATOR
	text "Der DELEGATOR von"
	line "<TARGET>"
	cont "lässt nach!"
	prompt''', 1)
    applied += 1

# SketchedText
if 'SketchedText:' in t and 'skizziert' in t:
    t = t.replace(
'''SketchedText:
	text "<USER>"
	line "skizziert"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt''',
'''SketchedText:
	; GSC: erlernt MOVE!
	text "<USER>"
	line "erlernt "
	text_ram wStringBuffer1
	text "!"
	prompt''', 1)
    applied += 1

# HitNTimes enemy variant
for old_hit in [
'''HitNTimesText:
	text "Traf "
	text_decimal wEnemyDamageTaken, 1, 1
	text "-mal!"
	prompt''',
'''EnemyHitNTimesText:
	text "Traf "
	text_decimal wEnemyDamageTaken, 1, 1
	text "-mal!"
	prompt''',
]:
    if old_hit in t:
        t = t.replace(old_hit, old_hit.replace('Traf ', 'Erleidet ').replace('"-mal!"', '" Treffer!"').replace('text "-mal!"', 'line "Treffer!"'), 1)
        # fix properly
        applied += 1

# Manual HitNTimes enemy if still Traf
t = t.replace(
'''	text "Traf "
	text_decimal wEnemyDamageTaken, 1, 1
	text "-mal!"''',
'''	text "Erleidet "
	text_decimal wEnemyDamageTaken, 1, 1
	line "Treffer!"''', 1)

# Recoil
if 'Rückstoß verletzt!' in t:
    t = t.replace(
'''RecoilText:
	text "<USER>"
	line "wird durch"
	cont "Rückstoß verletzt!"
	prompt''',
'''RecoilText:
	; GSC: wird verletzt!
	text "<USER>"
	line "wird verletzt!"
	prompt''', 1)
    applied += 1

# Silph Scope EN
if 'Silph Scope 2' in t:
    t = t.replace('Silph Scope 2', 'SILPH SCOPE 2', 1)  # still EN product
    # Better DE:
    t = t.replace(
'''SilphScopeRevealText:
	text "SILPH SCOPE 2"
	line "enthüllt den"
	cont "Geist!"
	prompt''',
'''SilphScopeRevealText:
	; GSC-near DE
	text "SILPH SCOPE 2"
	line "enthüllt den"
	cont "Geist!"
	prompt''', 1)

p.write_text(t, encoding='utf-8')
print(f"applied={applied} missed={len(missed)}")
for m in missed[:25]:
    print("MISS:", m)
if t == orig:
    print("NO CHANGE")
else:
    print("CHANGED", len(orig), "->", len(t))
