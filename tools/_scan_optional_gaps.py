"""Scan remaining EN / PC-only rough spots for optional polish."""
from pathlib import Path
import re

text_re = re.compile(r'^\t(text|line|cont|para|next)\s+"(.*)"\s*$')
db_re = re.compile(r'^\tdb\s+"(.*)"')
# Clear English leftovers (avoid German false friends)
eng = re.compile(
    r"\b("
    r"Hello|Welcome|Please|Thank you|Thanks|Sorry|"
    r"Pokemon|Pokémon|"
    r"the |and |you |your |with |from |this |that |"
    r"don't|can't|won't|it's|I'm|you're|"
    r"Battle Tower|Battle Factory|Gym Leader|Elite Four|"
    r"Item ball|received |found |obtained |"
    r"Cancel@|Yes@|No@|OK@|Okay@|"
    r"Poison Jab|Earth Power|Hyper Voice|Seed Bomb|Rock Slide|"
    r"Skill Swap|Protect|Focus Blast"
    r")\b",
    re.I,
)

# PC-only-ish map name prefixes
pc_only = re.compile(
    r"^(Shamouti|Valencia|Faraway|Navel|Murcott|Pummelo|Kumquat|Tarroco|"
    r"Hamlin|Kinnow|Mandarin|Ascorbia|Butwal|CeladonUniversity|"
    r"BattleTower|BattleFactory|DimCave|Eagulou|Sinjoh|"
    r"Hollys|HollysHalt|CherrygroveBay|GoldenrodHarbor|"
    r"YellowForest|CliffEdge|CliffCave|SafariZone|"
    r"CinnabarVolcano|CeruleanCave|Dim|Haunted|Scary|"
    r"HomeDecor|Hotel|WarehouseEntrance)\w*\.asm$",
    re.I,
)

def scan_dir(root: Path, label: str, limit=40):
    hits = []
    mon_low = 0
    for f in root.rglob("*.asm"):
        try:
            lines = f.read_text(encoding="utf-8").splitlines()
        except Exception:
            continue
        for i, line in enumerate(lines, 1):
            m = text_re.match(line) or db_re.match(line)
            if not m:
                continue
            s = m.group(1) if db_re.match(line) else m.group(2)
            if "#mon" in s and "#MON" not in s.replace("#mon", ""):
                # count token #mon
                if re.search(r"#mon(?![A-Za-z])", s):
                    mon_low += 1
            if eng.search(s):
                # skip pure place-like CAPS dumps
                if re.fullmatch(r"[A-ZÄÖÜ0-9 \-#./]+", s):
                    continue
                hits.append((str(f.relative_to(Path("."))), i, s[:100]))
    print(f"\n=== {label}: EN-ish {len(hits)}, #mon tokens ~{mon_low} ===")
    for h in hits[:limit]:
        print(f"{h[0]}:{h[1]} {h[2]!r}")
    return hits

Path(".").exists()
print("cwd maps?", Path("maps").exists())
hits_maps = scan_dir(Path("maps"), "maps", 60)
hits_data = scan_dir(Path("data/text"), "data/text", 30)
hits_phone = scan_dir(Path("data/phone"), "data/phone", 30)

# PC-only maps still with many English-ish or zero GSC-DE Dump markers
print("\n=== PC-ish maps without GSC-DE Dump comment (sample) ===")
n = 0
for f in sorted(Path("maps").glob("*.asm")):
    if not pc_only.match(f.name) and not any(
        x in f.name
        for x in (
            "Shamouti",
            "Valencia",
            "BattleTower",
            "BattleFactory",
            "CeladonUniversity",
            "YellowForest",
            "DimCave",
            "Eagulou",
            "Sinjoh",
            "Haunted",
            "Warehouse",
            "Faraway",
            "Navel",
            "Hollys",
        )
    ):
        continue
    t = f.read_text(encoding="utf-8")
    texts = sum(1 for line in t.splitlines() if text_re.match(line))
    if texts < 3:
        continue
    has_dump = "GSC-DE Dump" in t or "GSC-DE" in t
    en_count = 0
    for line in t.splitlines():
        m = text_re.match(line)
        if m and eng.search(m.group(2)):
            en_count += 1
    if en_count or not has_dump:
        print(f"{f.name}: texts~{texts} en={en_count} dump_tag={has_dump}")
        n += 1
        if n >= 40:
            break

# PLAY_G / semicolon
print("\n=== structural ===")
pg = list(Path(".").rglob("*.asm"))
pg_hits = []
semi = []
for f in pg:
    if "tools" in str(f) or ".git" in str(f):
        continue
    try:
        t = f.read_text(encoding="utf-8")
    except Exception:
        continue
    if "<PLAY_G>" in t:
        pg_hits.append(str(f))
print("PLAY_G files", len(pg_hits), pg_hits[:15])
