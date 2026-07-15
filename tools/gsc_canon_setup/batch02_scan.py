# -*- coding: utf-8 -*-
"""Batch 2: Johto routes + story dungeons — inventory + scan."""
from pathlib import Path
import re
from collections import defaultdict

ROOT = Path(__file__).resolve().parents[2]
MAPS = ROOT / "maps"
OUT = Path(__file__).resolve().parent

# Batch 1 prefixes (exclude)
B1_PREFIXES = [
    "NewBark", "PlayersHouse", "PlayersNeighbors", "Elms", "Lyras",
    "Cherrygrove", "GuideGents", "Violet", "Earls", "SproutTower",
    "Azalea", "Kurts", "Charcoal", "SlowpokeWell", "IlexForest",
    "Goldenrod", "RadioTower", "Ecruteak", "DanceTheatre", "BurnedTower",
    "TinTower", "Bellchime", "Olivine", "Cianwood", "Manias", "Mahogany",
    "Blackthorn", "MoveDeleters", "DragonsDen", "DragonShrine",
]

# Batch 2: Johto routes 29-46 + gates + remaining Johto dungeons/story
B2_INCLUDE_PREFIXES = [
    "Route29", "Route30", "Route31", "Route32", "Route33", "Route34",
    "Route35", "Route36", "Route37", "Route38", "Route39", "Route40",
    "Route41", "Route42", "Route43", "Route44", "Route45", "Route46",
    "Route47", "Route48",  # polished may have extra
    "RuinsOfAlph", "UnionCave", "DarkCave", "WhirlIsland",
    "MtMortar", "IcePath", "LakeOfRage", "TeamRocketBase",
    "NationalPark", "CliffCave", "CliffEdge", "EmbeddedTower",
    "YellowForest", "QuietCave", "DimCave", "ScaryCave",
    "CherrygroveBay",  # if not already in b1 - actually bay was b1 related
    "MountMoon",  # kanto - skip for batch2
]

# Explicit Johto dungeon / story maps that may not match prefix cleanly
B2_EXTRA = [
    "RuinsOfAlphOutside", "RuinsOfAlphInnerChamber", "RuinsOfAlphResearchCenter",
    "RuinsOfAlphHoOhChamber", "RuinsOfAlphKabutoChamber", "RuinsOfAlphOmanyteChamber",
    "RuinsOfAlphAerodactylChamber", "RuinsOfAlphEntranceChamber",
    "RuinsOfAlphHoOhItemRoom", "RuinsOfAlphKabutoItemRoom",
    "RuinsOfAlphOmanyteItemRoom", "RuinsOfAlphAerodactylItemRoom",
    "RuinsOfAlphHoOhWordRoom", "RuinsOfAlphKabutoWordRoom",
    "RuinsOfAlphOmanyteWordRoom", "RuinsOfAlphAerodactylWordRoom",
    "UnionCave1F", "UnionCaveB1F", "UnionCaveB1FNorth", "UnionCaveB1FSouth", "UnionCaveB2F",
    "DarkCaveVioletEntrance", "DarkCaveBlackthornEntrance",
    "WhirlIslandNW", "WhirlIslandNE", "WhirlIslandSW", "WhirlIslandSE",
    "WhirlIslandB1F", "WhirlIslandB2F", "WhirlIslandLugiaChamber", "WhirlIslandCave",
    "MtMortar1FOutside", "MtMortar1FInside", "MtMortar2FInside", "MtMortarB1F",
    "IcePath1F", "IcePathB1F", "IcePathB2FMahoganySide", "IcePathB2FBlackthornSide", "IcePathB3F",
    "LakeOfRage", "LakeOfRageHiddenPowerHouse", "LakeOfRageMagikarpHouse",
    "TeamRocketBaseB1F", "TeamRocketBaseB2F", "TeamRocketBaseB3F",
    "NationalPark", "NationalParkBugContest",
    "TohjoFalls", "VictoryRoad1F", "VictoryRoad2F", "VictoryRoad3F",
    "IndigoPlateau", "IndigoPlateauPokecenter1F", "WillsRoom", "KogasRoom", "BrunosRoom", "KarensRoom", "LancesRoom", "HallOfFame",
    "SilverCaveOutside", "SilverCaveRoom1", "SilverCaveRoom2", "SilverCaveRoom3", "SilverCaveItemRooms", "SilverCavePokecenter1F",
    "FastShip1F", "FastShipB1F", "FastShipCabins_NNW_NNE_NE", "FastShipCabins_SE_SSE_CaptainsCabin", "FastShipCabins_SW_SSW_NW",
    "OlivinePort", "VermilionPort",  # ports used for journey
    "SafariZone*",  # if johto safari extras
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


def disp_len(s: str) -> int:
    s = s[:-1] if s.endswith("@") else s
    s = s.replace("#mon", "XXXXXXX").replace("#MON", "XXXXXXX")
    s = re.sub(r"<PLAYER>", "X" * 7, s)
    s = re.sub(r"<PLAY_G>", "X" * 7, s)
    s = re.sub(r"<RIVAL>", "X" * 7, s)
    s = re.sub(r"<LV>", "99", s)
    s = re.sub(r"<PK><MN>", "XXXX", s)
    s = re.sub(r"<PKMN>", "XXXX", s)
    s = re.sub(r"\{d:[^}]+\}", "99", s)
    s = re.sub(r"<[^>]+>", "X", s)
    return len(s)


def in_batch1(name: str) -> bool:
    return any(name.startswith(p) for p in B1_PREFIXES)


def collect_batch2() -> list[str]:
    names = set()
    for f in MAPS.glob("*.asm"):
        name = f.stem
        if in_batch1(name):
            # keep only if clearly route/gate not pure town (Route* already not b1 prefix except Ilex)
            if not name.startswith("Route") and "Gate" not in name:
                continue
        if any(name.startswith(p) for p in B2_INCLUDE_PREFIXES):
            names.add(name)
        if name in B2_EXTRA:
            names.add(name)
        # gates between johto routes
        if re.match(r"Route\d+", name) and int(re.match(r"Route(\d+)", name).group(1)) <= 48:
            names.add(name)
        if "Gate" in name and re.search(
            r"Route(2[9]|3[0-9]|4[0-8])|Ilex|Goldenrod|Ecruteak|Mahogany|Blackthorn|Olivine|Violet|Azalea|Cherrygrove",
            name,
        ):
            names.add(name)
    # drop pure Kanto if accidentally included (Route1-28 without 2-digit 29+)
    filtered = []
    for n in sorted(names):
        m = re.match(r"Route(\d+)", n)
        if m and int(m.group(1)) < 29 and "Gate" not in n:
            # keep Tohjo etc separately
            if int(m.group(1)) not in ():  # routes 1-28 = kanto batch3/4
                continue
        filtered.append(n)
    return sorted(set(filtered))


def main():
    batch2 = collect_batch2()
    # Also add remaining Johto story from explicit list that exist
    for extra in B2_EXTRA:
        if "*" in extra:
            continue
        if (MAPS / f"{extra}.asm").exists():
            batch2.append(extra)
    batch2 = sorted(set(batch2))
    (OUT / "_batch2_maps.txt").write_text("\n".join(batch2) + "\n", encoding="utf-8")

    en_hits = []
    width_issues = []
    arena_issues = []
    stats = defaultdict(int)

    for name in batch2:
        path = MAPS / f"{name}.asm"
        if not path.exists():
            continue
        t = path.read_text(encoding="utf-8")
        stats["maps"] += 1
        strings = re.findall(r'(?:text|line|cont|para|next|page)\s+"([^"]*)"', t)
        stats["strings"] += len(strings)

        for i, line in enumerate(t.splitlines(), 1):
            m = re.search(r'(?:text|line|cont|para|next|page)\s+"([^"]*)"', line)
            if not m:
                continue
            s = m.group(1)
            if not s:
                continue
            if disp_len(s) > 18:
                width_issues.append((name, i, disp_len(s), s[:70]))
                stats["width"] += 1
            if re.search(r"[äöüÄÖÜß]", s):
                continue
            if re.search(
                r"\b(ich|du|der|die|das|und|nicht|ein|eine|ist|mit|von|für|auf|auch|was|wie|wir|ihr|sie|mein|dein|hier|dort|noch|schon|aber|oder|wenn|denn)\b",
                s,
                re.I,
            ):
                continue
            if EN_PURE.search(s) or EN_RE.search(s):
                en_hits.append((name, i, s[:90]))
                stats["en"] += 1

        if "#mon-ARENA" in t or "#MON-ARENA" in t:
            arena_issues.append(name)
            stats["arena"] += 1

    # Content checks for known GSC route signs / landmarks
    content_checks = [
        ("Route29", "ROUTE 29", None),
        ("Route30", "ROUTE 30", None),
        ("Route31", "ROUTE 31", None),
        ("Route32", "ROUTE 32", None),
        ("Route34", "ROUTE 34", None),
        ("Route36", "ROUTE 36", None),
        ("Route38", "ROUTE 38", None),
        ("Route42", "ROUTE 42", None),
        ("Route45", "ROUTE 45", None),
        ("LakeOfRage", "SEE DES ZORNS", None),
        ("NationalPark", "NATIONALPARK", None),
        ("RuinsOfAlphOutside", "ALPH-RUINEN", None),
        ("UnionCave1F", None, None),  # just exists
        ("DarkCaveVioletEntrance", None, None),
        ("TeamRocketBaseB1F", "TEAM ROCKET", None),
        ("IcePath1F", None, None),
        ("MtMortar1FOutside", None, None),
        ("TohjoFalls", None, None),
    ]
    checks = []
    for mapname, must, must2 in content_checks:
        # find first matching file
        path = MAPS / f"{mapname}.asm"
        if not path.exists():
            # try prefix match
            matches = list(MAPS.glob(f"{mapname}*.asm"))
            if not matches:
                checks.append((mapname, "MISSING"))
                continue
            path = matches[0]
            mapname = path.stem
        t = path.read_text(encoding="utf-8")
        if must is None:
            checks.append((mapname, "EXISTS"))
            continue
        ok = must in t and (must2 is None or must2 in t)
        checks.append((mapname, "MATCH" if ok else "DRIFT", must))

    lines = [
        "# Batch 2 Report — Johto Routes + Story Dungeons",
        "",
        f"## Scope: {len(batch2)} maps",
        f"- Text strings: {stats['strings']}",
        f"- EN candidates: {len(en_hits)}",
        f"- Width >18 (display): {len(width_issues)}",
        f"- #mon-ARENA leftovers: {len(arena_issues)}",
        "",
        "## Content checks",
    ]
    for c in checks:
        lines.append(f"- {c}")
    lines += ["", "## EN hits"]
    for h in en_hits:
        lines.append(f"- {h[0]}:{h[1]} {h[2]}")
    if not en_hits:
        lines.append("- (none)")
    lines += ["", "## Width issues"]
    for w in width_issues:
        lines.append(f"- {w[0]}:{w[1]} L={w[2]} {w[3]!r}")
    if not width_issues:
        lines.append("- (none)")
    lines += ["", "## Arena form issues"]
    for a in arena_issues:
        lines.append(f"- {a}")
    if not arena_issues:
        lines.append("- (none)")

    report = OUT / "_batch2_report.md"
    report.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(f"maps={len(batch2)} en={len(en_hits)} width={len(width_issues)} arena={len(arena_issues)}")
    for h in en_hits:
        print("EN", h[0], h[1], h[2])
    for w in width_issues:
        print("W", w[0], w[1], w[2], w[3])
    print("wrote", report)


if __name__ == "__main__":
    main()
