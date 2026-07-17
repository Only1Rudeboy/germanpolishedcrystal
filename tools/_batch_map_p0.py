# -*- coding: utf-8 -*-
import re
from pathlib import Path

def fix_dialogue_file(path: Path, replacements):
    raw = path.read_text(encoding="utf-8")
    new_lines = []
    changed = False
    for line in raw.splitlines(keepends=True):
        if line.strip().startswith(";"):
            new_lines.append(line)
            continue
        if re.search(r'(text|line|cont|para|next)\s+"', line) or (line.count('"') >= 2 and any(x in line for x in ("text", "line", "cont", "para", "next", "db "))):
            nl = line
            for a, b in replacements:
                if a in nl:
                    nl = nl.replace(a, b)
            if nl != line:
                changed = True
            new_lines.append(nl)
        else:
            new_lines.append(line)
    if changed:
        path.write_text("".join(new_lines), encoding="utf-8")
    return changed

jobs = {
    "AzaleaMart.asm": [
        ("als Azaleas", "als AZALEAs"),
        ("Sympabälle", "SYMPABÄLLE"),
        ("Turbobälle", "TURBOBÄLLE"),
    ],
    "VioletCity.asm": [
        ("Knofensa ist", "KNOFENSA ist"),
    ],
    "DarkCaveVioletEntrance.asm": [
        ("Ursaring hat", "URSARING hat"),
    ],
    "EcruteakPokeCenter1F.asm": [
        ("Entei einmal", "ENTEI einmal"),
        ("Entei", "ENTEI"),
    ],
    "IlexForest.asm": [
        ("vermisst! Celebi", "vermisst! CELEBI"),
        ("als Celebi", "als CELEBI"),
        (" Celebi", " CELEBI"),
    ],
    "BellchimeTrail.asm": [
        ("Suicune gegen-", "SUICUNE gegen-"),
        (" Suicune", " SUICUNE"),
    ],
    "EusinesHouse.asm": [
        ("sucht Suicune", "sucht SUICUNE"),
        (" Suicune", " SUICUNE"),
    ],
    "OlivineLighthouse4F.asm": [
        ("Anemonia-Apotheke", "ANEMONIA-Apotheke"),
    ],
    "RuinsOfAlphResearchCenter.asm": [
        ("Center gebaut", "CENTER gebaut"),
    ],
    "AzaleaPokeCenter1F.asm": [
        ("Leiter KAI!", "ARENALEITER KAI!"),
        ("Agatha, einem", "AGATHA, einem"),
    ],
    "VioletPokeCenter1F.asm": [
        ("Spezial: Leiter", "Spezial:"),
        ('"FALK!"', '"ARENALEITER FALK!"'),
    ],
    "MahoganyPokeCenter1F.asm": [
        ("Spezial: Leiter", "Spezial:"),
        ('"NORBERT!"', '"ARENALEITER NORBERT!"'),
    ],
    "BlackthornPokeCenter1F.asm": [
        ("Leiterin SANDRA!", "ARENALEITERIN SANDRA!"),
    ],
    "VioletOutskirts.asm": [
        ("Viola Friedhof", "VIOLA-FRIEDHOF"),
    ],
    "Route30BerrySpeechHouse.asm": [
        # "DUKATIA" + next line "City." -> ensure
        ('line "City."', 'line "CITY."'),
        ('cont "City."', 'cont "CITY."'),
    ],
}

# Unown in all alph chambers
for f in Path("maps").glob("*.asm"):
    if "Unown" in f.read_text(encoding="utf-8", errors="replace"):
        jobs[f.name] = jobs.get(f.name, []) + [
            ("Unown-Schrift", "ICOGNITO-Schrift"),
            # only replace Unown in dialogue carefully - do Unown- first then remaining Unown in quotes
        ]

changed = []
for name, reps in jobs.items():
    path = Path("maps") / name
    if not path.exists():
        print("missing", name)
        continue
    if fix_dialogue_file(path, reps):
        changed.append(name)
        print("ok", name)

# Second pass: Unown alone in dialogue strings
for f in Path("maps").glob("RuinsOfAlph*.asm"):
    raw = f.read_text(encoding="utf-8")
    new_lines = []
    ch = False
    for line in raw.splitlines(keepends=True):
        if re.search(r'(text|line|cont|para|next)\s+"', line) and "Unown" in line:
            nl = line.replace("Unown-Schrift", "ICOGNITO-Schrift")
            # replace Unown word not part of ICOGNITO
            nl2 = re.sub(r'(?<![A-Z])Unown', 'ICOGNITO', nl)
            if nl2 != line:
                ch = True
            new_lines.append(nl2)
        else:
            new_lines.append(line)
    if ch:
        f.write_text("".join(new_lines), encoding="utf-8")
        print("Unown", f.name)

print("done", changed)
