# -*- coding: utf-8 -*-
"""Batch 0+1: inventory + scan Johto town maps for GSC-canon issues."""
from pathlib import Path
import re
from collections import defaultdict

ROOT = Path(__file__).resolve().parents[2]
MAPS = ROOT / "maps"
OUT = Path(__file__).resolve().parent

PREFIXES = [
    "NewBark",
    "PlayersHouse",
    "PlayersNeighbors",
    "Elms",
    "Lyras",
    "Cherrygrove",
    "GuideGents",
    "Violet",
    "Earls",
    "SproutTower",
    "Azalea",
    "Kurts",
    "Charcoal",
    "SlowpokeWell",
    "IlexForest",
    "Goldenrod",
    "RadioTower",
    "Ecruteak",
    "DanceTheatre",
    "BurnedTower",
    "TinTower",
    "Bellchime",
    "Olivine",
    "Cianwood",
    "Manias",
    "Mahogany",
    "Blackthorn",
    "MoveDeleters",
    "DragonsDen",
    "DragonShrine",
]

EN_RE = re.compile(
    r"\b(I'm|I'll|I've|don't|can't|won't|it's|that's|there's|you're|we're|they're|"
    r"Hello|Welcome|Thank you|Thanks|Please|Sorry|Excuse|"
    r"found a|received a|Really\?|Something|Everyone|Everything|"
    r"because|always|never|maybe|already|however|although)\b",
    re.I,
)
EN_PURE = re.compile(
    r"^(It's|It is|You |Your |The |This |That |I |I'm |Hello|Welcome|Thank|Please|Sorry|Found |Received )",
    re.I,
)


def main():
    batch1 = []
    for f in sorted(MAPS.glob("*.asm")):
        name = f.stem
        if any(name.startswith(p) for p in PREFIXES):
            batch1.append(name)
    batch1 = sorted(set(batch1))
    (OUT / "_batch1_maps.txt").write_text("\n".join(batch1) + "\n", encoding="utf-8")

    en_hits = []
    width_issues = []
    sign_issues = []
    stats = defaultdict(int)

    for name in batch1:
        path = MAPS / f"{name}.asm"
        t = path.read_text(encoding="utf-8")
        stats["maps"] += 1
        cls = "A"
        if any(
            x in name
            for x in [
                "AdvancedTips",
                "Museum",
                "Harbor",
                "DestinyKnot",
                "CherishBall",
                "NetBall",
                "Honey",
                "Band",
                "Shrine",
            ]
        ):
            cls = "B"

        strings = re.findall(r'(?:text|line|cont|para|next|page)\s+"([^"]*)"', t)
        stats["strings"] += len(strings)

        for i, line in enumerate(t.splitlines(), 1):
            m = re.search(r'(?:text|line|cont|para|next|page)\s+"([^"]*)"', line)
            if not m:
                continue
            s = m.group(1)
            if not s:
                continue
            # width
            raw = s[:-1] if s.endswith("@") else s
            disp = raw.replace("#mon", "XXXXXXX").replace("#MON", "XXXXXXX")
            if len(disp) > 18:
                width_issues.append((name, i, len(disp), s[:60]))
                stats["width"] += 1
            # EN
            if re.search(r"[äöüÄÖÜß]", s):
                continue
            if re.search(
                r"\b(ich|du|der|die|das|und|nicht|ein|eine|ist|mit|von|für|auf|auch|was|wie|wir|ihr|sie|mein|dein)\b",
                s,
                re.I,
            ):
                continue
            if EN_PURE.search(s) or EN_RE.search(s):
                en_hits.append((name, i, s[:90], cls))
                stats["en"] += 1

        for sm in re.finditer(r"^(\w*(?:Sign|SignText)\w*):\s*$", t, re.M):
            stats["signs"] += 1
            label = sm.group(1)
            rest = t[sm.end() :]
            block_m = re.search(r"(.*?)\n\tdone", rest, re.S)
            if not block_m:
                continue
            block = block_m.group(1)
            if "#mon-ARENA" in block or "#MON-ARENA" in block:
                sign_issues.append((name, label, "ARENA_FORM"))
                stats["drift"] += 1

    city_checks = [
        ("NewBarkTown", "NEUBORKIA", "Wind der"),
        ("CherrygroveCity", "ROSALIA CITY", "Duftenden Blumen"),
        ("VioletCity", "VIOLA CITY", "Nostalgie"),
        ("AzaleaTown", "AZALEA CITY", "Harmonie"),
        ("AzaleaTown", "PKMN-ARENA", "KAI"),
        ("AzaleaTown", "FLEGMON", "REGEN"),
        ("GoldenrodCity", "DUKATIA CITY", "festliche"),
        ("GoldenrodCity", "PKMN-ARENA", "BIANKA"),
        ("EcruteakCity", "TEAK CITY", "JENS"),
        ("OlivineCity", "OLIVIANA CITY", "Tor zu"),
        ("OlivineCity", "PKMN-ARENA", "JASMIN"),
        ("CianwoodCity", "ANEMONIA CITY", "HARTWIG"),
        ("MahoganyTown", "MAHAGONIA CITY", "Ninja"),
        ("MahoganyTown", "PKMN-ARENA", "NORBERT"),
        ("BlackthornCity", "EBENHOLZ CITY", "Bergen"),
        ("BlackthornCity", "PKMN-ARENA", "SANDRA"),
        ("NewBarkTown", "LIND-#mon-LABOR", None),
        ("VioletCity", "KNOFENSA-TURM", None),
    ]
    check_results = []
    for mapname, must, must2 in city_checks:
        path = MAPS / f"{mapname}.asm"
        if not path.exists():
            check_results.append((mapname, must, "MISSING_FILE"))
            continue
        t = path.read_text(encoding="utf-8")
        ok1 = must in t
        ok2 = must2 is None or must2 in t
        status = "MATCH" if ok1 and ok2 else "DRIFT"
        check_results.append((mapname, must, status, ok1, ok2))
        stats["city_match" if status == "MATCH" else "city_drift"] += 1

    lines = [
        "# Batch 0+1 Report — GSC Canon Maps",
        "",
        "## Setup (0)",
        "- Glossar: tools/gsc_canon_setup/GLOSSAR.md",
        "- Klassen: A=GSC, B=GSC+PC, C=PC-only",
        "- Regeln: nur DRIFT/EN patchen; MATCH unberührt",
        "",
        "## Batch 1 scope",
        f"- Maps: {len(batch1)}",
        f"- Text strings (approx): {stats['strings']}",
        f"- Sign labels: {stats['signs']}",
        "",
        "## City sign / gym checks",
    ]
    for row in check_results:
        lines.append(f"- {row}")
    lines += ["", f"## EN candidates: {len(en_hits)}"]
    for h in en_hits:
        lines.append(f"- {h[0]}:{h[1]} [{h[3]}] {h[2]}")
    lines += ["", f"## Width >18 (#mon=7): {len(width_issues)}"]
    for w in width_issues[:40]:
        lines.append(f"- {w[0]}:{w[1]} len={w[2]} {w[3]!r}")
    if len(width_issues) > 40:
        lines.append(f"- ... +{len(width_issues) - 40} more")
    lines += ["", f"## Sign issues: {len(sign_issues)}"]
    for s in sign_issues:
        lines.append(f"- {s}")
    lines += ["", "## Stats"]
    for k, v in sorted(stats.items()):
        lines.append(f"- {k}: {v}")

    report = OUT / "_batch1_report.md"
    report.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(f"maps={len(batch1)} en={len(en_hits)} width={len(width_issues)} signs_issue={len(sign_issues)}")
    print(f"city_match={stats['city_match']} city_drift={stats['city_drift']}")
    print("wrote", report)
    for h in en_hits:
        print("EN", h[0], h[1], h[2])


if __name__ == "__main__":
    main()
