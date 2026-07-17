# -*- coding: utf-8 -*-
from pathlib import Path
import re

# High-signal English tokens that shouldn't appear in DE dialogue
EN_PATTERNS = [
    r'\bthe\b', r'\band\b', r'\byou\b', r'\byour\b', r'\bwith\b', r'\bfrom\b',
    r'\bthis\b', r'\bthat\b', r'\bhave\b', r'\bwill\b', r'\bcan\b', r'\bbattle\b',
    r'\btrainer\b', r'\bpokemon\b', r'\bPokémon\b', r'\bgym\b', r'\bcity\b',
    r'\broute\b', r'\bhello\b', r'\bthanks\b', r'\bplease\b', r'\bsorry\b',
    r'\bwait\b', r'\bcome\b', r'\bgo\b', r'\blet\'s\b', r'\bOK!\b',
    r'\bStrange\b', r'\bRival\b', r'\bboy\b', r'\bBOY\b',
    r'\breceived\b', r'\bgot\b', r'\bfled\b', r'\bused\b',
    r'\bHealth\b', r'\bAttack\b', r'\bDefense\b', r'\bSpeed\b',
    r'\bItem\b', r'\bBag\b', r'\bSave\b', r'\bOption\b',
    r'\bWhat\?', r'\bHow\?', r'\bWhy\?', r'\bWho\?',
    r'"[A-Za-z]{4,}"',  # quoted English-looking
]

# Exclude comments and pure identifiers carefully - scan text strings only
text_re = re.compile(r'(?:text|line|cont|para|next|rawchar|db\s+|li\s+)\s+"([^"]*)"')

roots = [
    Path('data/text'),
    Path('data/items'),
    Path('data/phone'),
    Path('data/trainers'),
    Path('maps'),
    Path('engine/menus'),
    Path('engine/pokemon'),
    Path('engine/events'),
]

hits = []
for root in roots:
    if not root.exists():
        continue
    for p in root.rglob('*.asm'):
        if 'backup' in str(p).lower() or '__pycache__' in str(p):
            continue
        try:
            t = p.read_text(encoding='utf-8', errors='replace')
        except Exception:
            continue
        for i, line in enumerate(t.splitlines(), 1):
            if line.strip().startswith(';'):
                continue
            for m in text_re.finditer(line):
                s = m.group(1)
                # skip pure symbols
                if not re.search(r'[A-Za-z]{3,}', s):
                    continue
                # skip if mostly German umlauts/words heuristics - flag English patterns
                for pat in EN_PATTERNS:
                    if re.search(pat, s, re.I):
                        # filter false positives common in DE
                        if re.search(r'\b(und|der|die|das|ich|du|ein|eine|mit|von|auf|für|ist|nicht|auch|noch|nur|wie|was|hier|dort|mein|dein)\b', s, re.I):
                            # still flag if clear English token present
                            if not re.search(r'\b(the|and|you|your|with|from|this|that|have|will|battle|trainer|gym|route|hello|thanks|please|sorry|received|fled|used|Health|Attack|Defense|Speed|Bag|Save|Option|Strange|Rival)\b', s, re.I):
                                continue
                        hits.append((str(p), i, s, pat))
                        break

# dedupe by file+line
seen = set()
out = []
for h in hits:
    k = (h[0], h[1])
    if k in seen:
        continue
    seen.add(k)
    out.append(h)

print(f"TOTAL_HITS {len(out)}")
for p,i,s,pat in out[:80]:
    print(f"{p}:{i}: [{pat}] {s}")
