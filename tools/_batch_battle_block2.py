# -*- coding: utf-8 -*-
"""Block 2: Battle GSC remaining + careful overflow-safe formulas."""
from pathlib import Path

p = Path("data/text/battle.asm")
t = p.read_text(encoding="utf-8")
orig = t

repls = [
# Light Screen / Reflect effects GSC
('''LightScreenEffectText:
	text "Sp.Vert. von"
	line "<USER>"
	cont "steigt!"
	prompt''',
'''LightScreenEffectText:
	; GSC: USER's SPEZ. VER steigt!
	text "<USER>s"
	line "SPEZ. VER steigt!"
	prompt'''),

('''ReflectEffectText:
	text "Verteidigung"
	line "von"
	cont "<USER>"
	cont "steigt!"
	prompt''',
'''ReflectEffectText:
	; GSC: Die VERT von USER steigt!
	text "Die VERT von"
	line "<USER>"
	cont "steigt!"
	prompt'''),

# Screen fades
('''BattleText_LightScreenFell:
	text "Lichtschild von"
	line ""
	text_ram wStringBuffer1
	cont "fällt!"
	prompt''',
'''BattleText_LightScreenFell:
	; GSC: NAME / LICHTSCHILD / schwindet!
	text_ram wStringBuffer1
	line "LICHTSCHILD"
	cont "schwindet!"
	prompt'''),

('''BattleText_ReflectFaded:
	text "Reflektor von"
	line ""
	text_ram wStringBuffer1
	cont "verschwindet!"
	prompt''',
'''BattleText_ReflectFaded:
	; GSC
	text_ram wStringBuffer1
	line "REFLEKTOR"
	cont "schwindet!"
	prompt'''),

('''BattleText_SafeguardFaded:
	text "Bodyguard von"
	line ""
	text_ram wStringBuffer1
	cont "verschwindet!"
	prompt''',
'''BattleText_SafeguardFaded:
	; GSC: Der BODYGUARD von NAME schwindet!
	text "Der BODYGUARD von"
	line ""
	text_ram wStringBuffer1
	cont "schwindet!"
	prompt'''),

# Mist
('''MistText:
	text "Team von"
	line "<USER>"
	cont "im Weißnebel!"
	prompt''',
'''MistText:
	; GSC: USER's ist von WEISSNEBEL umgeben!
	text "<USER>s"
	line "ist von"
	cont "WEISSNEBEL"
	cont "umgeben!"
	prompt'''),

('''ProtectedByMistText:
	text "<TARGET>"
	line "wird durch"
	cont "Weißnebel"
	cont "geschützt!"
	prompt''',
'''ProtectedByMistText:
	; GSC: WEISSNEBEL schützt TARGET (split for Gegn.)
	text "WEISSNEBEL schützt"
	line "<TARGET>."
	prompt'''),

# Safeguard
('''SafeguardProtectText:
	text "<TARGET>"
	line "wird durch"
	cont "Bodyguard"
	cont "geschützt!"
	prompt''',
'''SafeguardProtectText:
	; GSC: wird von BODYGUARD beschützt!
	text "<TARGET>"
	line "wird von BODYGUARD"
	cont "beschützt!"
	prompt'''),

('''CoveredByVeilText:
	text "<USER>"
	line "ist von einem"
	cont "Schleier bedeckt!"
	prompt''',
'''CoveredByVeilText:
	; GSC: wird verschleiert!
	text "<USER>"
	line "wird verschleiert!"
	prompt'''),

# Belly Drum
('''BellyDrumText:
	text "<USER>"
	line "senkt die KP und"
	cont "maximiert den"
	cont "Angriff!"
	prompt''',
'''BellyDrumText:
	; GSC
	text "<USER>"
	line "zieht sich KP ab,"
	cont "um den ANGRIFFS-"
	cont "WERT zu erhöhen!"
	prompt'''),

# Transform
('''TransformedText:
	text "<USER>"
	line "verwandelt sich"
	cont "in "
	text_ram wStringBuffer1
	text "!"
	prompt''',
'''TransformedText:
	; GSC: ben. VERWANDLER und wird zu X!
	text "<USER>"
	line "ben. VERWANDLER"
	cont "und wird zu"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt'''),

('''TransformedTypeText:
	text "<USER>"
	line "wurde zum"
	cont ""
	text_ram wStringBuffer1
	text "-Typ!"
	prompt''',
'''TransformedTypeText:
	; GSC: wird zu einem #MON des Typs X!
	text "<USER>"
	line "wird zu einem"
	cont "#MON des Typs"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt'''),

# Perish
('''StartPerishSongText:
	text "Beide #MON in"
	line "3 Runden K.O.!"
	prompt''',
'''StartPerishSongText:
	; GSC
	text "Beide #MON"
	line "werden in 3 Runden"
	cont "K.O. gehen!"
	prompt'''),

('''StartPerishBodyText:
	text "Beide #MON in"
	line "3 Runden K.O.!"
	prompt''',
'''StartPerishBodyText:
	text "Beide #MON"
	line "werden in 3 Runden"
	cont "K.O. gehen!"
	prompt'''),

# Protect damage
('''ProtectingItselfText:
	text "<TARGET>"
	line "schützt sich!"
	done''',
'''ProtectingItselfText:
	; GSC: Der Schutz wendet Schaden ab von TARGET!
	text "Der Schutz wendet"
	line "Schaden ab von"
	cont "<TARGET>!"
	done'''),

# Disable suite
('''DisabledNoMoreText:
	text "Attacke von"
	line "<USER>"
	cont "ist nicht mehr"
	cont "gesperrt!"
	prompt''',
'''DisabledNoMoreText:
	; GSC: wird nicht mehr blockiert!
	text "<USER>"
	line "wird nicht"
	cont "mehr blockiert!"
	prompt'''),

('''WasDisabledText:
	text ""
	text_ram wStringBuffer2
	line "von"
	cont "<TARGET>"
	cont "wurde gesperrt!"
	prompt''',
'''WasDisabledText:
	; GSC: wird blockiert!
	text ""
	text_ram wStringBuffer2
	line "von"
	cont "<TARGET>"
	cont "wird blockiert!"
	prompt'''),

('''DisabledMoveText:
	text ""
	text_ram wStringBuffer1
	line "von"
	cont "<USER>"
	cont "ist gesperrt!"
	prompt''',
'''DisabledMoveText:
	; GSC: wird BLOCKIERT!
	text "<USER>s"
	line ""
	text_ram wStringBuffer1
	cont "wird BLOCKIERT!"
	prompt'''),

# Item activated
('''BattleText_UsersStringBuffer1Activated:
	text ""
	text_ram wStringBuffer1
	line "von"
	cont "<USER>"
	cont "aktiviert!"
	prompt''',
'''BattleText_UsersStringBuffer1Activated:
	; GSC: USER's ITEM aktiviert!
	text "<USER>s"
	line ""
	text_ram wStringBuffer1
	cont "aktiviert!"
	prompt'''),

# Wild eating
('''BattleText_WildPkmnIsEating:
	text "Das wilde"
	line ""
	text_ram wEnemyMonNickname
	cont "frisst!"
	prompt''',
'''BattleText_WildPkmnIsEating:
	; GSC: Wildes NAME frisst!
	text "Wildes "
	text_ram wEnemyMonNickname
	line "frisst!"
	prompt'''),

('''BattleText_WildPkmnIsAngry:
	text "Das wilde"
	line ""
	text_ram wEnemyMonNickname
	cont "ist wütend!"
	prompt''',
'''BattleText_WildPkmnIsAngry:
	; GSC: Wildes NAME ist wütend!
	text "Wildes "
	text_ram wEnemyMonNickname
	line "ist wütend!"
	prompt'''),

# Level up
('''BattleText_StringBuffer1GrewToLevel:
	text_ram wStringBuffer1
	line "erreicht"
	cont "Level "
	text_decimal wCurPartyLevel, 1, 3
	text "!"
	text_sound SFX_DEX_FANFARE_50_79
	text_end''',
'''BattleText_StringBuffer1GrewToLevel:
	; GSC: erreicht LV N!
	text_ram wStringBuffer1
	line "erreicht LV "
	text_decimal wCurPartyLevel, 1, 3
	text "!"
	text_sound SFX_DEX_FANFARE_50_79
	text_end'''),

# Encore end
('''BattleText_UserEncoreEnded:
	text "Zugabe von"
	line "<USER>"
	cont "endet!"
	prompt''',
'''BattleText_UserEncoreEnded:
	; GSC: ZUGABE hört auf!
	text "<USER>s"
	line "ZUGABE hört auf!"
	prompt'''),

# Stat caps
('''WontRiseAnymoreText:
	text ""
	text_ram wStringBuffer2
	line "von"
	cont "<USER>"
	cont "steigt nicht"
	cont "weiter!"
	prompt''',
'''WontRiseAnymoreText:
	; GSC: steigt nicht mehr!
	text ""
	text_ram wStringBuffer2
	line "von"
	cont "<USER>"
	cont "steigt nicht mehr!"
	prompt'''),

('''WontDropAnymoreText:
	text ""
	text_ram wStringBuffer2
	line "von"
	cont "<USER>"
	cont "sinkt nicht"
	cont "weiter!"
	prompt''',
'''WontDropAnymoreText:
	; GSC: sinkt nicht mehr!
	text ""
	text_ram wStringBuffer2
	line "von"
	cont "<USER>"
	cont "sinkt nicht mehr!"
	prompt'''),

# Future Sight
('''BattleText_TargetWasHitByFutureSight:
	text "<TARGET>"
	line "traf die"
	cont "Zukunftssicht!"
	prompt''',
'''BattleText_TargetWasHitByFutureSight:
	; GSC-near: SEHER trifft TARGET (grammar fix)
	text "<TARGET>"
	line "wurde von SEHER"
	cont "getroffen!"
	prompt'''),

('''BattleText_UsersFutureSightMissed:
; used when Future Sight can't hit anything because there was
; no target (so <TARGET> is undefined)
	text "Die Zukunftssicht"
	line "traf ein!"

	para "Doch sie schlug"
	line "fehl!"
	prompt''',
'''BattleText_UsersFutureSightMissed:
; used when Future Sight can't hit anything because there was
; no target (so <TARGET> is undefined)
	; GSC-near SEHER
	text "SEHER schlug"
	line "fehl!"
	prompt'''),

# Eliminated stats
('''EliminatedStatsText:
	text "Alle Werte"
	line "neutralisiert!"
	prompt''',
'''EliminatedStatsText:
	; GSC
	text "Alle Status-"
	line "änderungen werden"
	cont "aufgehoben!"
	prompt'''),

# ProtectedBy item
('''ProtectedByText:
	text "<TARGET>"
	line "wird geschützt"
	cont "durch"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt''',
'''ProtectedByText:
	; GSC: geschützt durch ITEM!
	text "<TARGET>"
	line "geschützt durch"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt'''),
]

# Brick break screen text if present
import re
# LightScreen break by brick break - search
for m in re.finditer(r'BrokeLightScreenText:.*?prompt', t, re.S):
    print("FOUND", m.group(0)[:200])

applied = 0
missed = []
for old, new in repls:
    if old in t:
        t = t.replace(old, new, 1)
        applied += 1
    else:
        missed.append(old.split('\n')[0])

# Brick break / putscht item charge
if 'putscht sich auf' in t:
    t = t.replace(
'''	line "putscht sich auf"
	cont "mit"
''',
'''	line "pumpt sich auf"
	cont "mit"
''')
    applied += 1

# Heal Bell encore line if "heilte Zugabe"
if 'heilte Zugabe' in t:
    t = t.replace('heilte Zugabe', 'heilte ZUGABE')
    applied += 1

p.write_text(t, encoding='utf-8')
print(f"applied={applied} missed={len(missed)}")
for m in missed:
    print("MISS", m)
print("changed", t != orig)
