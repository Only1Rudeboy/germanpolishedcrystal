#!/usr/bin/env python3
import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
ENG = re.compile(
    r'^\s+text "(?:'
    r"The |You |Your |You're |I'm |It's |What |This |That |How |Why |"
    r"Please |Welcome to |Hello |Hi[,! ]|Oh[,! ]|Yes[,! ]|No[,! ]|"
    r"Pokemon |Pokémon |trainer |battle |fight |catch |"
    r"We're |They're |There's |Here's |Got |Get |"
    r"[A-Z][a-z]+ (?:is|are|was|were|have|has|will|can't|don't) )"
)

max_en = int(sys.argv[1]) if len(sys.argv) > 1 else 2
d = json.loads((ROOT / "translation_progress.json").read_text(encoding="utf-8"))
for status in ("open", "partial"):
    fs = sorted(
        [f for f in d["files"] if f["status"] == status and f["eng_lines"] <= max_en],
        key=lambda x: (x["eng_lines"], x["file"]),
    )
    for f in fs:
        p = ROOT / "maps" / f["file"]
        lines = p.read_text(encoding="utf-8", errors="replace").splitlines()
        hits = [(i + 1, l.strip()) for i, l in enumerate(lines) if ENG.search(l)]
        if hits:
            tag = "ref" if f["ref_available"] else "pc"
            print(f"{f['eng_lines']} EN | {f['file']} | {tag}")
            for ln, txt in hits[:5]:
                print(f"   L{ln}: {txt[:90]}")