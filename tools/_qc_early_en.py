from pathlib import Path
import re

text_re = re.compile(r'^\t(text|line|cont|para|next)\s+"(.*)"\s*$')
early = re.compile(
    r"^(NewBark|PlayersHouse|ElmsLab|ElmsHouse|Route29|Route30|Route31|Route32|Route33|"
    r"Cherrygrove|Violet|Sprout|MrPokemon|Azalea|Slowpoke|Charcoal|Kurt|Ilex|"
    r"UnionCave|DayCare|Route34)",
    re.I,
)
# real English leakage (not DE false friends)
eng = re.compile(
    r"\b(Hello|Welcome|Please|Thank you|Gym Badge|Zephyr|Hive Badge|Plain Badge|"
    r"Fog Badge|Storm Badge|Mineral Badge|Glacier|Rising|Pokemon|Pokémon|"
    r"Professor Elm|New Bark|Cherrygrove|Violet City|Azalea Town|"
    r"I am |You are |What is |Let's |don't |can't |won't )\b",
    re.I,
)

hits = []
for f in Path("maps").glob("*.asm"):
    if not early.match(f.name):
        continue
    for i, line in enumerate(f.read_text(encoding="utf-8").splitlines(), 1):
        m = text_re.match(line)
        if not m:
            continue
        s = m.group(2)
        if eng.search(s):
            hits.append((f.name, i, s))

print("english-ish", len(hits))
for h in hits:
    print(f"{h[0]}:{h[1]} {h[2]!r}")

# mon casing summary
print("\n#MON vs #mon (early key files)")
for name in [
    "ElmsLab.asm",
    "PlayersHouse1F.asm",
    "NewBarkTown.asm",
    "CherrygroveCity.asm",
    "VioletCity.asm",
    "VioletGym.asm",
    "AzaleaTown.asm",
    "AzaleaGym.asm",
    "Route29.asm",
    "Route30.asm",
    "Route31.asm",
    "Route32.asm",
]:
    t = Path("maps", name).read_text(encoding="utf-8")
    print(f"{name:22} #MON={t.count('#MON'):3} #mon={t.count('#mon'):3}")
