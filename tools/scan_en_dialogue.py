#!/usr/bin/env python3
"""Scan all dialog strings (text/line/cont/para) for English remnants."""
import re
from collections import defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
DIRS = [ROOT / "maps", ROOT / "data", ROOT / "text"]

STR = re.compile(r'(?:text|line|cont|para|next|page)\s+"([^"]*)"')
# Strong English indicators
EN = re.compile(
    r"(?:"
    r"\b(?:the|you|your|you're|you've|i'm|it's|what|this|that|how|why|"
    r"please|welcome|hello|goodbye|sorry|thanks|thank you|"
    r"pokemon|trainer|battle|fight|catch|"
    r"we're|they're|there's|here's|don't|can't|won't|didn't|"
    r"let's|gonna|gotta|yeah|okay|right now|"
    r"my |wild |played the|is reported|having tea|"
    r"bright blue|middle name|grand-|sup,|"
    r"choose |pick |select |defeat |beat all|"
    r"clerk:|greetings)\b|"
    r"^[A-Z][a-z]+ (?:is|are|was|were|have|has|will|can|don't) )",
    re.I,
)
# Allowed English (attack names, brands, etc.) — keep short
GERMAN = re.compile(
    r"(?:"
    r"[äöüßÄÖÜ]|"
    r"\b(?:ich|du|der|die|das|und|ist|sind|habe|hast|haben|nicht|eine|ein|einem|"
    r"mit|für|auch|wird|kann|will|willst|schon|aber|oder|wenn|dass|noch|nur|sehr|"
    r"hier|dort|mein|dein|sein|uns|euch|man|tipps|profi|tut mir|entschuldigung|"
    r"hoffentlich|alles was|egal was|nummer|angeln|hasst|fischer|tasche|"
    r"besiegt|kämpfe|kämpf|trainer|#mon|#bälle|spezial|journal|orden|arena)\b"
    r")",
    re.I,
)
STRONG_EN = re.compile(
    r"\b(?:the |you |your |you're|you've|welcome|hello|goodbye|please|"
    r"special feature|advanced tips|looked into|people use|i can |i will |"
    r"i have |i am |i made |don't |can't |won't |where i |want to |"
    r"have seen|have noticed|all aboard|my son|my grand|editor:|reported|"
    r"rumor has|said to|joined the|from the|into the|out of|get from|"
    r"will teach|nothing beats|fire-type|capture|stylers|electric fence|"
    r"silence bridge|out of order|chief engineer|appointment)\b",
    re.I,
)

by_file: dict[str, list[tuple[int, str]]] = defaultdict(list)
total = 0

for base in DIRS:
    if not base.exists():
        continue
    for path in sorted(base.rglob("*.asm")):
        rel = str(path.relative_to(ROOT)).replace("\\", "/")
        if rel == "data/credits_strings.asm":
            continue
        for i, raw in enumerate(path.read_text(encoding="utf-8", errors="replace").splitlines(), 1):
            m = STR.search(raw)
            if not m:
                continue
            s = m.group(1)
            if not s.strip():
                continue
            if not EN.search(s):
                continue
            low = s.lower()
            # German false positives
            if re.search(r"\bthe\w", low):  # theoretisch etc.
                continue
            if "wetter" in low or "wächter" in low:
                continue
            if GERMAN.search(s) and not STRONG_EN.search(s):
                continue
            by_file[rel].append((i, s[:90]))
            total += 1

out = ROOT / "tools" / "en_dialogue_report.txt"
lines = [f"English dialog hits: {total}", f"Files affected: {len(by_file)}", ""]
ranked = sorted(by_file.items(), key=lambda x: -len(x[1]))
for rel, hits in ranked:
    lines.append(f"=== {rel} ({len(hits)}) ===")
    for ln, s in hits[:8]:
        lines.append(f"  L{ln}: {s}")
    if len(hits) > 8:
        lines.append(f"  ... +{len(hits) - 8} more")
    lines.append("")

out.write_text("\n".join(lines), encoding="utf-8")
print(f"English dialog hits: {total} in {len(by_file)} files")
print(f"Report: {out}")
print("\nTop 15 files:")
for rel, hits in ranked[:15]:
    print(f"  {rel}: {len(hits)}")