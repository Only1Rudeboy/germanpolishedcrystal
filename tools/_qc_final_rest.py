from pathlib import Path
import re

# Fix residual PLAY_G anywhere in maps/data/engine
fixed_pg = []
for root in ("maps", "data", "engine"):
    for f in Path(root).rglob("*.asm"):
        t = f.read_text(encoding="utf-8")
        if "<PLAY_G>" in t:
            f.write_text(t.replace("<PLAY_G>", "<PLAYER>"), encoding="utf-8")
            fixed_pg.append(str(f))

# Fix known glue artifacts
fixes = {
    "maps/Route14.asm": [("#monkampf", "#MON-Kampf")],
    "maps/Route43.asm": [("#mondas", "#MON das")],
}
for path, pairs in fixes.items():
    p = Path(path)
    if not p.exists():
        continue
    t = p.read_text(encoding="utf-8")
    nt = t
    for a, b in pairs:
        nt = nt.replace(a, b)
    if nt != t:
        p.write_text(nt, encoding="utf-8")
        print("fixed glue", path)

# Count remaining #mon tokens in quoted strings
pat = re.compile(r'"(?:[^"\\]|\\.)*#mon(?:[^A-Za-zÄÖÜäöü"]|")')
rem = 0
for f in Path("maps").glob("*.asm"):
    rem += len(pat.findall(f.read_text(encoding="utf-8")))
print("remaining #mon-ish in maps quotes ~", rem)
print("PLAY_G fixed", len(fixed_pg), fixed_pg[:10])

# semicolon in text
text_re = re.compile(r'^\t(text|line|cont|para|next)\s+"(.*)"\s*$')
semi = []
for f in Path("maps").glob("*.asm"):
    for i, line in enumerate(f.read_text(encoding="utf-8").splitlines(), 1):
        m = text_re.match(line)
        if m and ";" in m.group(2):
            semi.append(f"{f}:{i}")
print("SEMI maps", len(semi), semi[:10])
