from pathlib import Path
import re

targets = list(Path("maps").glob("Shamouti*.asm")) + list(Path("maps").glob("DimCave*.asm"))
targets += [
    Path("maps/CliffCave.asm"),
    Path("maps/Route40BattleTowerGate.asm"),
    Path("maps/FarawayIsland.asm"),
    Path("maps/NavelRockOutside.asm"),
    Path("maps/NavelRockRoof.asm"),
    Path("maps/CherrygroveBay.asm"),
    Path("maps/GoldenrodHarbor.asm"),
]
for f in targets:
    if not f.exists():
        continue
    t = f.read_text(encoding="utf-8")
    lines = []
    ch = False
    for line in t.splitlines(keepends=True):
        if re.match(r'^\t(text|line|cont|para)\s+"', line):
            nl = line.replace("Kanto", "KANTO").replace("Johto", "JOHTO")
            nl = re.sub(r"#mon(?![A-Za-z])", "#MON", nl)
            if nl != line:
                ch = True
            line = nl
        lines.append(line)
    if ch:
        f.write_text("".join(lines), encoding="utf-8")
        print("caps", f.name)
print("done")
