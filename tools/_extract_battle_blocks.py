# -*- coding: utf-8 -*-
from pathlib import Path
import re
t = Path("data/text/battle.asm").read_text(encoding="utf-8")
labels = [
"LightScreenEffectText","ReflectEffectText","BattleText_LightScreenFell",
"BattleText_ReflectFaded","BattleText_SafeguardFaded","MistText","ProtectedByMistText",
"SafeguardProtectText","CoveredByVeilText","BellyDrumText","TransformedText","TransformedTypeText",
"StartPerishSongText","StartPerishBodyText","ProtectingItselfText","DisabledNoMoreText",
"WasDisabledText","DisabledMoveText","BattleText_UsersStringBuffer1Activated",
"BattleText_WildPkmnIsEating","BattleText_WildPkmnIsAngry","BattleText_StringBuffer1GrewToLevel",
"BattleText_UserEncoreEnded","WontRiseAnymoreText","WontDropAnymoreText",
"BattleText_UsersFutureSightMissed","BattleText_TargetWasHitByFutureSight",
"FlinchedText","EliminatedStatsText","ProtectedByText","RecoilText",
"StatRoseText","StatRoseSharplyText","StatFellText"
]
for lab in labels:
    m = re.search(rf'^{lab}:\n(?:.*\n){{1,12}}?\t(?:prompt|done)', t, re.M)
    if m:
        print("====", lab, "====")
        print(m.group(0))
        print()
    else:
        # broader
        m2 = re.search(rf'^{lab}:\n(?:\t.*\n){{1,15}}', t, re.M)
        print("====", lab, "====")
        print(m2.group(0) if m2 else "NOT FOUND")
        print()
