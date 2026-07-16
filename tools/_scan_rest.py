from pathlib import Path
import re

text_re = re.compile(r'^\t(text|line|cont|para|next)\s+"(.*)"\s*$')
eng = re.compile(
    r"\b(Hello|Welcome|Please|Thank you|Gym Badge|Pokemon|Pokémon|"
    r"What is |You are |I am |don't |can't |Let's |Battle Tower|"
    r"Poison Jab|Skill Swap|Cancel@|Yes@|No@)\b",
    re.I,
)
hits = []
mon_files = []
for f in Path("maps").glob("*.asm"):
    t = f.read_text(encoding="utf-8")
    cm, cM = t.count("#mon"), t.count("#MON")
    if cm > 5 and cm > cM:
        mon_files.append((f.name, cm, cM))
    for i, l in enumerate(t.splitlines(), 1):
        m = text_re.match(l)
        if m and eng.search(m.group(2)):
            hits.append((f.name, i, m.group(2)[:100]))
print("=== EN-ish", len(hits), "===")
for h in hits[:50]:
    print(f"{h[0]}:{h[1]} {h[2]!r}")
print("=== High #mon (top 30) ===")
for x in sorted(mon_files, key=lambda z: -z[1])[:30]:
    print(x)
print("BT", [p.name for p in Path("maps").glob("BattleTower*.asm")])
print("BF", [p.name for p in Path("maps").glob("BattleFactory*.asm")])
print("Uni", len(list(Path("maps").glob("CeladonUniversity*.asm"))))
print("common lines", len(Path("data/text/common.asm").read_text(encoding="utf-8").splitlines()))
# phone scripts location
for p in Path("maps").rglob("*Phone*"):
    print("phone map", p)
for p in Path("engine").rglob("*phone*"):
    print("phone eng", p)
for p in Path("data").rglob("*phone*"):
    print("phone data", p)
