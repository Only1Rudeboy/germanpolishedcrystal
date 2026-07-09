#!/usr/bin/env python3
import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
ENG = re.compile(
    r'^\s+text "(?:'
    r"The |You |Your |You're |I'm |It's |What |This |That |How |Why |"
    r"Please |Welcome to |Hello |Hi[,! ]|Oh[,! ]|Yes[,! ]|No[,! ]|"
    r"Pokemon |Pokémon |trainer |battle |fight |catch |"
    r"We're |They're |There's |Here's |Got |Get |My |"
    r"[A-Z][a-z]+ (?:is|are|was|were|have|has|will|can't|don't) )"
)

d = json.loads((ROOT / "translation_progress.json").read_text(encoding="utf-8"))
for f in sorted(
    [x for x in d["files"] if x["status"] == "partial"],
    key=lambda x: -x["eng_lines"],
):
    lines = (ROOT / "maps" / f["file"]).read_text(encoding="utf-8").splitlines()
    hits = [(i + 1, l.strip()) for i, l in enumerate(lines) if ENG.search(l)]
    print(f"=== {f['file']} ({len(hits)} hits) ===")
    for ln, txt in hits:
        print(f"  L{ln}: {txt[:100]}")
    print()