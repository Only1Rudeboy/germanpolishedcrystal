# -*- coding: utf-8 -*-
"""Batch 3: Kanto cities + gyms + related buildings — thorough scan."""
from pathlib import Path
import re
from collections import defaultdict

ROOT = Path(__file__).resolve().parents[2]
MAPS = ROOT / "maps"
OUT = Path(__file__).resolve().parent

# Comprehensive Kanto city / interior prefixes
CITY_STARTS = (
    "PalletTown", "RedsHouse", "BluesHouse", "OaksLab",
    "Viridian", "Pewter", "Cerulean", "Vermilion", "Lavender",
    "Celadon", "Fuchsia", "Saffron", "Cinnabar", "Indigo",
    "SilphCo", "FightingDojo", "Copycats", "MrFujis", "MrPsychics",
    "PokemonTower", "PokemonMansion", "SafariZone", "Seafoam",
    "WillsRoom", "KogasRoom", "BrunosRoom", "KarensRoom", "LancesRoom",
    "HallOfFame", "LavRadio", "NameRatersHouse", "BillsHouse",
    "DayCare", "Underground", "PowerPlant", "DiglettsCave",
    "MtMoon", "RockTunnel", "CeruleanCave",
)

# Exclude pure Johto already done (if any overlap)
EXCLUDE = set()

EN_RE = re.compile(
    r"\b(I'm|I'll|I've|don't|can't|won't|it's|that's|there's|you're|we're|they're|"
    r"Hello|Welcome|Thank you|Thanks|Please|Sorry|Excuse|"
    r"found a|received a|Really\?|Something|Everyone|Everything|"
    r"because|always|never|maybe|already|however|although|"
    r"Research Center|PROF\.SILKTREE|It's a photo)\b",
    re.I,
)
EN_PURE = re.compile(
    r"^(It's|It is|You |Your |The |This |That |I |I'm |Hello|Welcome|Thank|Please|Sorry|Found |Received )",
    re.I,
)
DE_HINT = re.compile(
    r"\b(ich|du|der|die|das|und|nicht|ein|eine|ist|sind|mit|von|für|auf|auch|was|wie|"
    r"wir|ihr|sie|mein|dein|hier|dort|noch|schon|aber|oder|wenn|denn|dass|sehr|mehr|"
    r"nur|zum|zur|bei|nach|kann|muss|soll|will|habe|hast|hat|den|dem|des|kein|alle|"
    r"dieser|diese|über|unter|man|mir|dir|ihm|uns|euch|dich|sich)\b",
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


def collect() -> list[str]:
    names = []
    for f in sorted(MAPS.glob("*.asm")):
        n = f.stem
        if any(n.startswith(p) for p in CITY_STARTS):
            names.append(n)
    return names


def main():
    batch = collect()
    (OUT / "_batch3_maps.txt").write_text("\n".join(batch) + "\n", encoding="utf-8")

    en_hits = []
    width_issues = []
    arena_form = []
    gym_blocks = {}
    city_sign_blocks = {}
    stats = defaultdict(int)

    for name in batch:
        path = MAPS / f"{name}.asm"
        t = path.read_text(encoding="utf-8")
        stats["maps"] += 1
        stats["strings"] += len(
            re.findall(r'(?:text|line|cont|para|next|page)\s+"([^"]*)"', t)
        )

        if "#mon-ARENA" in t or "#MON-ARENA" in t:
            arena_form.append(name)

        for i, line in enumerate(t.splitlines(), 1):
            m = re.search(r'(?:text|line|cont|para|next|page)\s+"([^"]*)"', line)
            if not m:
                continue
            s = m.group(1)
            if not s:
                continue
            if disp_len(s) > 18:
                width_issues.append((name, i, disp_len(s), s[:80]))
            if re.search(r"[äöüÄÖÜß]", s):
                continue
            if DE_HINT.search(s):
                continue
            if EN_PURE.search(s) or EN_RE.search(s):
                en_hits.append((name, i, s[:100]))

        # collect gym/city sign text blocks
        for sm in re.finditer(
            r"^(\w*(?:GymSign|CitySign|TownSign|IslandSign|SignText|Sign)\w*):\s*$",
            t,
            re.M,
        ):
            label = sm.group(1)
            rest = t[sm.end() :]
            bm = re.search(r"(.*?)\n\tdone", rest, re.S)
            if not bm:
                continue
            block = bm.group(1)
            key = f"{name}.{label}"
            if "Gym" in label or "ARENA" in block:
                gym_blocks[key] = block
            if any(
                x in label
                for x in ("CitySign", "TownSign", "IslandSign", "CitySignText", "TownSignText")
            ) or re.search(
                r'(VERTANIA|MARMORIA|AZURIA|ORANIA|LAVANDIA|PRISMANIA|FUCHSANIA|SAFFRONIA|ZINNOBER|ALABASTIA)',
                block,
            ):
                city_sign_blocks[key] = block

    # Expected GSC gym content
    gsc_gym = {
        "ViridianCity": ("VERTANIA CITY", "LEITUNG", None),  # unreadable end
        "PewterCity": ("MARMORIA CITY", "ROCKO", "Felsenharte"),
        "CeruleanCity": ("AZURIA CITY", "MISTY", "Meerjungfrau"),
        "VermilionCity": ("ORANIA CITY", "MAJOR BOB", "Blitzschnelle"),
        "CeladonCity": ("PRISMANIA CITY", "ERIKA", "Prinzessin"),
        "FuchsiaCity": ("FUCHSANIA CITY", "JANINA", "Ninja"),
        "SaffronCity": ("SAFFRONIA CITY", "SABRINA", "Psycho"),
        "CinnabarIsland": ("ZINNOBER", None, None),  # gym destroyed text varies
    }
    gsc_city = {
        "PalletTown": ("ALABASTIA", None),
        "ViridianCity": ("VERTANIA CITY", "Immergrüne"),
        "PewterCity": ("MARMORIA CITY", "Steingraue"),
        "CeruleanCity": ("AZURIA CITY", "Aura"),
        "VermilionCity": ("ORANIA CITY", "Sonnenuntergang"),
        "LavenderTown": ("LAVANDIA", None),
        "CeladonCity": ("PRISMANIA CITY", "Regenbogen"),
        "FuchsiaCity": ("FUCHSANIA CITY", "Rosarote"),
        "SaffronCity": ("SAFFRONIA CITY", "Golden"),
        "CinnabarIsland": ("ZINNOBER", None),
    }

    gym_results = []
    for city, (cityname, leader, slogan_bit) in gsc_gym.items():
        path = MAPS / f"{city}.asm"
        if not path.exists():
            gym_results.append((city, "MISSING_FILE"))
            continue
        t = path.read_text(encoding="utf-8")
        # find gym sign block
        m = re.search(r"(\w*GymSign\w*):(.*?)\n\tdone", t, re.S)
        if not m:
            gym_results.append((city, "NO_GYM_SIGN"))
            continue
        block = m.group(2)
        issues = []
        if "PKMN-ARENA" not in block and "ARENA" not in block:
            issues.append("no ARENA")
        if cityname not in block and cityname.replace(" CITY", "") not in block:
            # Cinnabar special
            if city != "CinnabarIsland":
                issues.append(f"missing {cityname}")
        if leader and leader not in block:
            issues.append(f"missing {leader}")
        if slogan_bit and slogan_bit not in block:
            issues.append(f"slogan? {slogan_bit}")
        if "#mon-ARENA" in block or "#mon-Arena" in block:
            issues.append("wrong ARENA form")
        gym_results.append((city, m.group(1), "MATCH" if not issues else "DRIFT", issues, block[:200]))

    city_results = []
    for city, (cityname, bit) in gsc_city.items():
        path = MAPS / f"{city}.asm"
        if not path.exists():
            city_results.append((city, "MISSING"))
            continue
        t = path.read_text(encoding="utf-8")
        # main city/town sign
        m = re.search(
            r"(\w*(?:City|Town|Island)Sign\w*):(.*?)\n\tdone", t, re.S
        )
        if not m:
            # try any sign with city name
            if cityname in t:
                city_results.append((city, "HAS_NAME", "partial"))
            else:
                city_results.append((city, "NO_SIGN", cityname))
            continue
        block = m.group(2)
        issues = []
        if cityname not in block and cityname not in t:
            issues.append(f"missing {cityname}")
        if bit and bit not in block and bit not in t:
            issues.append(f"slogan bit {bit}")
        city_results.append((city, m.group(1), "MATCH" if not issues else "DRIFT", issues, block[:180]))

    lines = [
        "# Batch 3 Report — Kanto Cities + Gyms (+ buildings)",
        "",
        f"## Scope: {len(batch)} maps",
        f"- EN: {len(en_hits)}",
        f"- Width>18: {len(width_issues)}",
        f"- #mon-ARENA files: {len(arena_form)}",
        "",
        "## Gym sign checks (GSC)",
    ]
    for g in gym_results:
        lines.append(f"- {g[:4] if len(g)>4 else g}")
        if len(g) > 4 and g[2] == "DRIFT":
            lines.append(f"  block: {g[4]!r}")
    lines += ["", "## City slogan checks (GSC)"]
    for c in city_results:
        lines.append(f"- {c[:4] if len(c)>4 else c}")
        if len(c) > 4 and c[2] == "DRIFT":
            lines.append(f"  block: {c[4]!r}")
    lines += ["", "## EN hits (all)"]
    for h in en_hits:
        lines.append(f"- {h[0]}:{h[1]} {h[2]}")
    if not en_hits:
        lines.append("- (none)")
    lines += ["", "## Width issues (all)"]
    for w in width_issues:
        lines.append(f"- {w[0]}:{w[1]} L={w[2]} {w[3]!r}")
    if not width_issues:
        lines.append("- (none)")
    lines += ["", "## Arena form leftovers"]
    for a in arena_form:
        lines.append(f"- {a}")
    if not arena_form:
        lines.append("- (none)")
    lines += ["", "## All gym/city sign blocks found"]
    for k, b in sorted(gym_blocks.items()):
        flat = re.sub(r"\s+", " ", b)
        lines.append(f"- {k}: {flat[:120]}")
    for k, b in sorted(city_sign_blocks.items()):
        flat = re.sub(r"\s+", " ", b)
        lines.append(f"- {k}: {flat[:120]}")

    report = OUT / "_batch3_report.md"
    report.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(f"maps={len(batch)} en={len(en_hits)} width={len(width_issues)} arena={len(arena_form)}")
    for g in gym_results:
        print("GYM", g[0], g[2] if len(g) > 2 else g)
    for c in city_results:
        print("CITY", c[0], c[2] if len(c) > 2 else c)
    for h in en_hits:
        print("EN", h[0], h[1], h[2])
    for w in width_issues:
        print("W", w[0], w[1], w[2], w[3])
    print("wrote", report)


if __name__ == "__main__":
    main()
