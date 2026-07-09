#!/usr/bin/env python3
import re
from collections import defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
DIRS = [ROOT / "maps", ROOT / "data"]
STR = re.compile(r'(?:text|line|cont|para|next|page)\s+"([^"]*)"')
EN_WORDS = re.compile(
    r"\b(the|you|your|i can|i will|i am|i made|i have|it's|what|welcome|hello|"
    r"goodbye|looked|people|special feature|advanced tips|all aboard|my son|"
    r"my grand|don't|can't|where i|how could|editor:|reported|rumor has|said to|"
    r"be a fan|joined the|to battle|from the|into the|out of|get from|"
    r"want to learn|will teach|have seen|have noticed|sure\?|ready to|thank you)\b",
    re.I,
)
GERMAN = re.compile(
    r"\b(der|die|das|und|ich|du|ist|sind|habe|nicht|eine|ein|mit|für|auch|"
    r"wird|kann|will|schon|aber|oder|wenn|dass|noch|nur|sehr|hier|dort|mein|"
    r"dein|trainer|#mon|tipps|profi|tut mir|entschuldigung)\b",
    re.I,
)
hits = []
for base in DIRS:
    if not base.exists():
        continue
    for path in sorted(base.rglob("*.asm")):
        if "_upstream" in str(path):
            continue
        rel = str(path.relative_to(ROOT)).replace("\\", "/")
        for i, raw in enumerate(path.read_text(encoding="utf-8", errors="replace").splitlines(), 1):
            m = STR.search(raw)
            if not m:
                continue
            s = m.group(1)
            if EN_WORDS.search(s) and not GERMAN.search(s):
                hits.append((rel, i, s[:90]))
            elif re.match(r"^[A-Z][a-z]+ (is|are|was|were|have|has|will|can|don)", s):
                if not GERMAN.search(s):
                    hits.append((rel, i, s[:90]))

by = defaultdict(list)
for h in hits:
    by[h[0]].append(h)
out = ROOT / "tools" / "real_en_report.txt"
lines = [f"Likely real EN lines: {len(hits)}", f"Files: {len(by)}", ""]
for rel in sorted(by, key=lambda x: -len(by[x])):
    lines.append(f"=== {rel} ({len(by[rel])}) ===")
    for _, ln, s in by[rel]:
        lines.append(f"  L{ln}: {s}")
    lines.append("")
out.write_text("\n".join(lines), encoding="utf-8")
print(f"Likely real EN: {len(hits)} in {len(by)} files")
print(f"Report: {out}")
for rel in sorted(by, key=lambda x: -len(by[x]))[:25]:
    print(f"  {rel}: {len(by[rel])}")