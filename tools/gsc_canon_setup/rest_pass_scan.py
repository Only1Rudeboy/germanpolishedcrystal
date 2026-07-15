# -*- coding: utf-8 -*-
"""Extreme residual pass: system phrases, EN, width, CAPS place names."""
from pathlib import Path
import re
from collections import defaultdict

ROOT = Path(__file__).resolve().parents[2]
OUT = Path(__file__).resolve().parent

SKIP = {"backup", "text_backup_clamped", "_upstream", "maps_backup"}

# System-like: PLAYER finds/receives item (should be present tense GSC)
FAND_SYS = re.compile(
    r'(?:text|line|cont|para)\s+"(?:<PLAYER>\s*)?fand\b',
    re.I,
)
ERHIELT_SYS = re.compile(
    r'(?:text|line|cont|para)\s+"(?:<PLAYER>\s*)?erhielt\b',
    re.I,
)
# any fand/erhielt in string for review
FAND_ANY = re.compile(r'(?:text|line|cont|para|next|page)\s+"([^"]*\bfand\b[^"]*)"', re.I)
ERHIELT_ANY = re.compile(r'(?:text|line|cont|para|next|page)\s+"([^"]*\berhielt\b[^"]*)"', re.I)
FINDET_OK = re.compile(r'(?:text|line|cont|para)\s+"([^"]*\bfindet\b[^"]*)"', re.I)
ERHALT_OK = re.compile(r'(?:text|line|cont|para)\s+"([^"]*\berhält\b[^"]*)"', re.I)

# Past tense that is likely system (Player + past)
PLAYER_FAND = re.compile(r'<PLAYER>[^"]{0,20}\bfand\b|\bfand\b[^"]{0,30}!', re.I)
PLAYER_ERHIELT = re.compile(r'<PLAYER>[^"]{0,20}\berhielt\b|\berhielt\b[^"]{0,30}!', re.I)

EN_STRONG = re.compile(
    r"\b(I'm|I'll|I've|don't|can't|won't|it's|that's|you're|"
    r"Hello|Welcome|Thank you|Thanks|Please|Sorry\.|Excuse me|"
    r"found a|received a|Research Center|Tourist Center|"
    r"coming soon|work in progress|placeholder|"
    r"New Bark Town|Cherrygrove City|Goldenrod City|Ecruteak City|"
    r"Olivine City|Cianwood City|Mahogany Town|Blackthorn City|"
    r"Sprout Tower|Burned Tower|Tin Tower|Ilex Forest|"
    r"Pallet Town|Viridian City|Pewter City|Cerulean City|"
    r"Vermilion City|Celadon City|Fuchsia City|Saffron City|"
    r"Cinnabar Island|Indigo Plateau|Victory Road)\b",
    re.I,
)
DE_HINT = re.compile(
    r"[äöüÄÖÜß]|"
    r"\b(der|die|das|den|dem|und|ein|eine|einen|ist|sind|mit|von|für|"
    r"nicht|sein|wird|kann|hat|zum|bei|nach|sich|mehr|nur|"
    r"findet|erhält|fand|erhielt|Hallo|Willkommen|Danke|Bitte)\b",
    re.I,
)

# Mixed-case place names that should be CAPS GSC style in signs/dialogue
PLACE_MIXED = re.compile(
    r"\b("
    r"Azalea City|New Bark|Cherrygrove|Goldenrod|Ecruteak|Olivine|"
    r"Cianwood|Mahogany|Blackthorn|Violet City|Pallet Town|"
    r"Viridian|Pewter|Cerulean|Vermilion|Celadon|Fuchsia|Saffron|"
    r"Cinnabar|Lavender Town|Sprout Tower|Burned Tower|Tin Tower|"
    r"Ilex Forest|Slowpoke Well|Ruins of Alph|Lake of Rage|"
    r"Mt\.\s*Mortar|Dragon.s Den|Whirl Islands|"
    r"Neuborkia|Rosalia City|Viola City|Dukatia City|Teak City|"
    r"Oliviana City|Anemonia City|Mahagonia City|Ebenholz City"
    r")\b"
)

STR = re.compile(r'(?:text|line|cont|para|next|page|next1)\s+"([^"]*)"')


def skip(p: Path) -> bool:
    return any(x in p.parts for x in SKIP) or ".bak" in p.name


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


def scan_paths(paths):
    fand, erhielt = [], []
    en, width = [], []
    place = []
    mon_arena = []
    for path in paths:
        if skip(path) or not path.is_file():
            continue
        try:
            t = path.read_text(encoding="utf-8", errors="replace")
        except Exception:
            continue
        rel = str(path.relative_to(ROOT))
        if "#mon-ARENA" in t or "#MON-ARENA" in t:
            mon_arena.append(rel)
        for i, line in enumerate(t.splitlines(), 1):
            if line.lstrip().startswith(";"):
                continue
            m = STR.search(line)
            if not m:
                continue
            s = m.group(1)
            if not s:
                continue
            if disp_len(s) > 18:
                width.append((rel, i, disp_len(s), s[:80]))
            if re.search(r"\bfand\b", s, re.I):
                kind = "SYS?" if (PLAYER_FAND.search(s) or s.strip().endswith("!")) else "narr"
                fand.append((rel, i, kind, s[:90]))
            if re.search(r"\berhielt\b", s, re.I):
                kind = "SYS?" if (PLAYER_ERHIELT.search(s) or s.strip().endswith("!")) else "narr"
                erhielt.append((rel, i, kind, s[:90]))
            if not DE_HINT.search(s) and EN_STRONG.search(s):
                en.append((rel, i, s[:90]))
            # mixed case place (not all caps, not soft-hyphen landmark style)
            for pm in PLACE_MIXED.finditer(s):
                tok = pm.group(1)
                # skip if already CAPS-ish or DE with ¯
                if tok != tok.upper() and "¯" not in tok:
                    # DE title case for city names in dialogue is sometimes OK
                    # flag EN place forms and mixed DE city with space City
                    if re.search(
                        r"(Azalea|New Bark|Cherrygrove|Goldenrod|Ecruteak|Olivine|"
                        r"Cianwood|Mahogany|Blackthorn|Violet City|Pallet|Viridian|"
                        r"Pewter|Cerulean|Vermilion|Celadon|Fuchsia|Saffron|Cinnabar|"
                        r"Lavender|Sprout Tower|Burned Tower|Tin Tower|Ilex|"
                        r"Slowpoke|Ruins of|Lake of|Mt\.|Dragon|Whirl)",
                        tok,
                        re.I,
                    ):
                        place.append((rel, i, tok, s[:80]))

    return {
        "fand": fand,
        "erhielt": erhielt,
        "en": en,
        "width": width,
        "place": place,
        "mon_arena": mon_arena,
    }


def main():
    map_paths = list((ROOT / "maps").glob("*.asm"))
    data_paths = []
    for sub in [
        "data/text",
        "data/phone/text",
        "data/maps",
        "data/trainers",
        "data/battle_tower",
        "data/events",
        "data/items",
        "data/options",
        "data/pc",
        "data/pokemon",
        "data/moves",
        "data/abilities",
        "data/types",
        "data/decorations",
        "data/radio",
        "data/player",
    ]:
        p = ROOT / sub
        if p.is_dir():
            data_paths.extend(p.rglob("*.asm"))
        elif p.is_file():
            data_paths.append(p)
    # mon_menu, natures, characteristics
    for extra in ["data/mon_menu.asm", "data/natures.asm", "data/characteristics.asm", "data/pokedex_bio.asm", "data/credits_strings.asm"]:
        ep = ROOT / extra
        if ep.exists():
            data_paths.append(ep)

    maps = scan_paths(map_paths)
    data = scan_paths(data_paths)

    lines = ["# Rest-Pass Scan (extreme residual)", ""]

    def section(title, d, key, limit=80):
        items = d[key]
        lines.append(f"## {title}: {len(items)}")
        print(f"{title}: {len(items)}")
        for x in items[:limit]:
            lines.append(f"- {x}")
            if len(items) <= 40 or key in ("en", "mon_arena") or (key in ("fand", "erhielt") and "SYS" in str(x)):
                print(" ", x)
        if len(items) > limit:
            lines.append(f"- ... +{len(items)-limit}")
        lines.append("")

    lines.append("# MAPS")
    section("Maps fand", maps, "fand", 100)
    section("Maps erhielt", maps, "erhielt", 50)
    section("Maps EN", maps, "en", 50)
    section("Maps width>18", maps, "width", 40)
    section("Maps place mixed/EN", maps, "place", 40)
    lines.append(f"## Maps #mon-ARENA: {len(maps['mon_arena'])}")
    for x in maps["mon_arena"]:
        lines.append(f"- {x}")
    lines.append("")

    lines.append("# DATA")
    section("Data fand", data, "fand", 50)
    section("Data erhielt", data, "erhielt", 30)
    section("Data EN", data, "en", 40)
    section("Data width>18", data, "width", 40)
    section("Data place mixed/EN", data, "place", 30)

    # Classify fand SYS candidates for auto-patch list
    sys_fand = [x for x in maps["fand"] + data["fand"] if x[2] == "SYS?"]
    sys_erh = [x for x in maps["erhielt"] + data["erhielt"] if x[2] == "SYS?"]
    lines.append("# AUTO-PATCH CANDIDATES (SYS?)")
    lines.append(f"## fand SYS?: {len(sys_fand)}")
    for x in sys_fand:
        lines.append(f"- {x}")
        print("SYS FAND", x)
    lines.append(f"## erhielt SYS?: {len(sys_erh)}")
    for x in sys_erh:
        lines.append(f"- {x}")
        print("SYS ERHIELT", x)

    report = OUT / "_rest_pass_scan.md"
    report.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print("wrote", report)
    print(
        "SUMMARY maps fand", len(maps["fand"]),
        "erhielt", len(maps["erhielt"]),
        "en", len(maps["en"]),
        "w", len(maps["width"]),
        "place", len(maps["place"]),
    )
    print(
        "SUMMARY data fand", len(data["fand"]),
        "erhielt", len(data["erhielt"]),
        "en", len(data["en"]),
        "w", len(data["width"]),
    )


if __name__ == "__main__":
    main()
