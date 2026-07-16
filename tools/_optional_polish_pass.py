from pathlib import Path
import re

# 1) phone live #mon -> #MON
n = 0
for f in Path("data/phone/text").glob("*.asm"):
    if "backup" in str(f):
        continue
    t = f.read_text(encoding="utf-8")
    nt = re.sub(r"#mon(?![A-Za-zÄÖÜäöü])", "#MON", t)
    if nt != t:
        f.write_text(nt, encoding="utf-8")
        c = len(re.findall(r"#mon(?![A-Za-z])", t)) - len(re.findall(r"#mon(?![A-Za-z])", nt))
        n += max(c, 0)
        print("phone", f.name)
print("phone mon pass done, approx replacements done")

# 2) Sorry in maps
for path, a, b in [
    ("maps/RadioTower2F.asm", "BUENA: Sorry…", "BUENA: Tut mir Leid…"),
    ("maps/SeafoamGym.asm", "Sorry, Kumpel!", "Tut mir Leid, Kumpel!"),
    ("maps/TeamRocketBaseB2F.asm", "Sorry, <PLAYER>.", "Tut mir Leid, <PLAYER>."),
]:
    p = Path(path)
    t = p.read_text(encoding="utf-8")
    if a in t:
        p.write_text(t.replace(a, b), encoding="utf-8")
        print("sorry fixed", path)
    else:
        # try ascii-ish
        print("sorry miss", path)

# 3) DimCave CAPS place names
dim_fixes = [
    ("Azuria-Kap", "AZURIA-KAP"),
    ("im Kraftwerk", "im KRAFTWERK"),
    ("das Kraftwerk", "das KRAFTWERK"),
    ("Kraftwerk zu", "KRAFTWERK zu"),
    ("Kraftwerk.", "KRAFTWERK."),
    ("mit Energie!", "mit Energie!"),  # keep
    ("ganz\n\tcont \"Kanto ", "ganz\n\tcont \"KANTO "),
    ('cont "Kanto mit', 'cont "KANTO mit'),
    ('line "Kanto', 'line "KANTO'),
]
for f in Path("maps").glob("DimCave*.asm"):
    t = f.read_text(encoding="utf-8")
    nt = t
    for a, b in dim_fixes:
        nt = nt.replace(a, b)
    # also lowercase kanto in text strings
    nt2 = []
    for line in nt.splitlines(keepends=True):
        if re.match(r'^\t(text|line|cont|para)\s+"', line):
            line = line.replace("Kanto", "KANTO").replace("Johto", "JOHTO")
        nt2.append(line)
    nt = "".join(nt2)
    if nt != t:
        f.write_text(nt, encoding="utf-8")
        print("dimcave caps", f.name)

# 4) CliffEdge / Yellow forest CAPS
for path in [
    "maps/CliffEdgeGate.asm",
    "maps/CliffCave.asm",
    "maps/YellowForest.asm",
]:
    p = Path(path)
    if not p.exists():
        continue
    t = p.read_text(encoding="utf-8")
    nt = t.replace("Gelben Wald", "GELBEN WALD").replace("Gelbe Wald", "GELBE WALD")
    nt = nt.replace("Gelber Wald", "GELBER WALD")
    # reception text
    nt = nt.replace('text "Der Gelbe Wald ist"', 'text "Der GELBE WALD ist"')
    nt = nt.replace("Im Gelben Wald", "Im GELBEN WALD")
    if nt != t:
        p.write_text(nt, encoding="utf-8")
        print("yellow forest caps", path)

# 5) FarawayIsland small polish ORANIA already CAPS
p = Path("maps/FarawayIsland.asm")
if p.exists():
    t = p.read_text(encoding="utf-8")
    nt = t
    # ensure MEW caps if lowercase
    for line_pat in []:
        pass
    if "#mon" in nt:
        nt = re.sub(r"#mon(?![A-Za-z])", "#MON", nt)
    if nt != t:
        p.write_text(nt, encoding="utf-8")
        print("faraway")

# 6) Cinnabar volcano KANTO CAPS in text
for f in Path("maps").glob("CinnabarVolcano*.asm"):
    t = f.read_text(encoding="utf-8")
    lines = []
    changed = False
    for line in t.splitlines(keepends=True):
        if re.match(r'^\t(text|line|cont|para)\s+"', line):
            nl = line.replace("Kanto", "KANTO").replace("Johto", "JOHTO")
            if nl != line:
                changed = True
            line = nl
        lines.append(line)
    if changed:
        f.write_text("".join(lines), encoding="utf-8")
        print("volcano", f.name)

# 7) elm phone Sorry
p = Path("data/phone/text/elm.asm")
if p.exists():
    t = p.read_text(encoding="utf-8")
    nt = t.replace("Sorry für die", "Entschuldigung für die")
    nt = nt.replace("Sorry, dass ich", "Entschuldigung, dass ich")
    if nt != t:
        p.write_text(nt, encoding="utf-8")
        print("elm sorry")

print("done")
