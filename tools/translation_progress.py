#!/usr/bin/env python3
"""Estimate German translation progress from dialogue scan."""
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
DIRS = [ROOT / "maps", ROOT / "data", ROOT / "text"]
STR = re.compile(r'(?:text|line|cont|para|next|page)\s+"([^"]*)"')
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


def is_en_hit(s: str) -> bool:
    if not EN.search(s):
        return False
    low = s.lower()
    if re.search(r"\bthe\w", low):
        return False
    if "wetter" in low or "wächter" in low:
        return False
    if GERMAN.search(s) and not STRONG_EN.search(s):
        return False
    return True


def is_trainer_loanword(s: str) -> bool:
    if not re.search(r"\btrainer\b", s, re.I):
        return False
    return not re.search(
        r"\b(?:the|you|your|hello|please|welcome|battle|catch|sorry|what|this|that|how|why|don't|can't|won't|let's|yeah|okay|my |wild )\b",
        s,
        re.I,
    )


total = 0
en = 0
loanword = 0
for base in DIRS:
    if not base.exists():
        continue
    for path in base.rglob("*.asm"):
        rel = str(path.relative_to(ROOT)).replace("\\", "/")
        if rel == "data/credits_strings.asm":
            continue
        for raw in path.read_text(encoding="utf-8", errors="replace").splitlines():
            m = STR.search(raw)
            if not m:
                continue
            s = m.group(1)
            if not s.strip():
                continue
            total += 1
            if is_en_hit(s):
                en += 1
                if is_trainer_loanword(s):
                    loanword += 1

clean = total - en
adj_en = en - loanword
print(f"Total dialog strings: {total}")
print(f"EN-flagged (scanner): {en}")
print(f"Likely German loanwords (Trainer): {loanword}")
print(f"Estimated real EN remaining: ~{adj_en}")
print(f"Progress (scanner): {clean / total * 100:.1f}%")
print(f"Progress (adjusted): {(total - adj_en) / total * 100:.1f}%")