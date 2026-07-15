# -*- coding: utf-8 -*-
"""QC: Pokemon names, dex, moves, abilities, natures, types, items."""
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[2]
OUT = Path(__file__).resolve().parent

EN_WORD = re.compile(
    r"\b(the|and|with|from|that|this|when|which|while|their|they|them|into|over|"
    r"strong|power|attack|defense|special|speed|raises|lowers|boosts|causes|inflicts|"
    r"opponent|user|foe|enemy|damage|chance|status|sleep|poison|burn|paralyz|confus|"
    r"sharply|slightly|greatly|always|never|may|might|will|can|cannot|can't|don't|"
    r"It's|It is|This Pokemon|species|evolves|habitat|Raises|Lowers|Boosts|Inflicts|"
    r"Causes|Prevents|Restores|Heals|Switches|Doubles|Halves|Protects|Increases|"
    r"Decreases|Recoil|flinch|critical|accuracy|evasion)\b",
    re.I,
)
# pure English title-case words common in leftover strings
EN_PHRASE = re.compile(
    r"^(A |An |The |It |Its |This |That |When |If |Raises |Lowers |May |Can |"
    r"An attack|A powerful|The user|The foe|The target)",
    re.I,
)
DE_HINT = re.compile(
    r"[äöüÄÖÜß]|"
    r"\b(der|die|das|und|ein|eine|ist|sind|mit|von|für|auf|auch|wenn|denn|oder|"
    r"nicht|sein|seine|seinen|ihren|wird|werden|kann|hat|den|dem|des|zum|zur|"
    r"bei|nach|sich|sehr|mehr|nur|durch|gegen|hebt|senkt|erhöht|Angriff|"
    r"Verteidigung|Initiative|Spezial|Gegner|Schaden|Chance|Attacke|Treffer|"
    r"Volltreffer|paralys|vergift|verbrenn|einfrier|verwirr|schläft|KP|Runde|"
    r"eigen|eigene|eigenen|steigt|fällt|schützt|verhindert|heilt|stiehlt)\b",
    re.I,
)

STR_PATS = [
    re.compile(r'(?:text|line|cont|para|next|page|next1)\s+"([^"]*)"'),
    re.compile(r'(?:li|db|rawchar)\s+"([^"]*)"'),
]


def extract_strings(text):
    out = []
    for i, line in enumerate(text.splitlines(), 1):
        if line.lstrip().startswith(";"):
            continue
        for pat in STR_PATS:
            for m in pat.finditer(line):
                s = m.group(1)
                if s is not None:
                    out.append((i, s))
    return out


def is_en_suspect(s: str) -> bool:
    clean = s.rstrip("@").strip()
    if not clean or clean in ("?", "???", "-", "---", "↑", "↓", "♂", "♀", ""):
        return False
    # control / tag only
    if re.fullmatch(r"[<X\d\s↑↓@./\-]+", clean):
        return False
    if DE_HINT.search(clean):
        return False
    if EN_WORD.search(clean) or EN_PHRASE.search(clean):
        return True
    # mostly ASCII letters with spaces and common EN patterns
    letters = re.sub(r"[^A-Za-z]", "", clean)
    if len(letters) >= 8 and " " in clean and letters.isascii():
        # if looks like English sentence fragment
        if re.search(r"\b(of|to|for|by|on|in|at|as|or|be|is|are|was|were|has|have|had)\b", clean, re.I):
            return True
    return False


def scan_file(rel: str):
    p = ROOT / rel
    if not p.exists():
        return None, [], f"MISSING {rel}"
    t = p.read_text(encoding="utf-8", errors="replace")
    strs = extract_strings(t)
    en = []
    for i, s in strs:
        if is_en_suspect(s):
            en.append((i, s.rstrip("@")[:90]))
    return strs, en, None


def move_name_overs():
    p = ROOT / "data/moves/names.asm"
    over = []
    for i, line in enumerate(p.read_text(encoding="utf-8").splitlines(), 1):
        m = re.search(r'li\s+"([^"]+)"', line)
        if m and len(m.group(1)) > 12:
            over.append((i, len(m.group(1)), m.group(1)))
    return over


def mon_name_stats():
    p = ROOT / "data/pokemon/names.asm"
    names = []
    for i, line in enumerate(p.read_text(encoding="utf-8").splitlines(), 1):
        m = re.search(r'rawchar\s+"([^"]+)"', line)
        if m:
            core = m.group(1).rstrip("@")
            if core and not core.startswith("?"):
                names.append((i, core, len(core)))
    # flag pure Titlecase English-looking mon names (heuristic)
    # German names are often CAPS all-letter
    en_like = []
    for i, core, L in names:
        # known international same names
        same = {
            "PIKACHU", "RAICHU", "ARBOK", "ZUBAT", "GOLBAT", "PARAS", "ABRA",
            "KADABRA", "ONIX", "DITTO", "EEVEE", "SNORLAX", "ARTICUNO", "ZAPDOS",
            "MOLTRES", "DRATINI", "DRAGONAIR", "DRAGONITE", "MEWTWO", "MEW",
            "PICHU", "TOGEPI", "UNOWN", "WOBBUFFET", "GIRAFARIG", "DUNSPARCE",
            "GLIGAR", "SCIZOR", "SHUCKLE", "HERACROSS", "SNEASEL", "TEDDIURSA",
            "URSARING", "SLUGMA", "MAGCARGO", "SWINUB", "PILOSWINE", "CORSOLA",
            "REMORAID", "OCTILLERY", "DELIBIRD", "MANTINE", "SKARMORY", "HOUNDOUR",
            "HOUNDOOM", "KINGDRA", "PHANPY", "DONPHAN", "PORYGON2", "STANTLER",
            "SMEARGLE", "TYROGUE", "HITMONTOP", "SMOOCHUM", "ELEKID", "MAGBY",
            "MILTANK", "BLISSEY", "RAIKOU", "ENTEI", "SUICUNE", "LARVITAR",
            "PUPITAR", "TYRANITAR", "LUGIA", "CELEBI", "HO-OH", "HOOH",
        }
        up = core.upper()
        if up in same:
            continue
        # if mixed case English common words
        if re.match(r"^[A-Z][a-z]{2,}$", core):
            en_like.append((i, core))
    return names, en_like


def dex_category_en():
    """Species category before @ in dex (db \"Samen@\")."""
    p = ROOT / "data/pokemon/dex_entries.asm"
    cats = []
    en_cats = []
    for i, line in enumerate(p.read_text(encoding="utf-8").splitlines(), 1):
        m = re.search(r'^\s*db\s+"([^"]+)@"', line)
        if m:
            cat = m.group(1)
            cats.append((i, cat))
            if is_en_suspect(cat) or re.match(
                r"^(Seed|Lizard|Flame|Turtle|Bug|Bird|Mouse|Serpent|Poison|Fairy|"
                r"Fox|Balloon|Bat|Weed|Flower|Mushroom|Insect|Mole|Cat|Duck|"
                r"Pig|Monkey|Puppy|Legendary|New|Species)$",
                cat,
                re.I,
            ):
                en_cats.append((i, cat))
    return cats, en_cats


def main():
    files = [
        ("pokemon_names", "data/pokemon/names.asm"),
        ("dex_entries", "data/pokemon/dex_entries.asm"),
        ("move_names", "data/moves/names.asm"),
        ("move_desc", "data/moves/descriptions.asm"),
        ("ability_names", "data/abilities/names.asm"),
        ("ability_desc", "data/abilities/descriptions.asm"),
        ("natures", "data/natures.asm"),
        ("characteristics", "data/characteristics.asm"),
        ("types", "data/types/names.asm"),
        ("item_names", "data/items/names.asm"),
        ("item_key", "data/items/key_names.asm"),
        ("item_desc", "data/items/descriptions.asm"),
    ]

    lines = ["# Species / Moves / Dex / Abilities / Natures QC", ""]
    print("=== EN-suspect scan ===")
    all_en = {}
    for key, rel in files:
        strs, en, err = scan_file(rel)
        if err:
            print(err)
            lines.append(f"- {key}: {err}")
            continue
        all_en[key] = en
        print(f"{key}: strings={len(strs)} en_suspect={len(en)}")
        lines.append(f"## {key} (`{rel}`)")
        lines.append(f"- strings: {len(strs)}")
        lines.append(f"- EN-suspect: {len(en)}")
        for i, s in en[:40]:
            print(f"  L{i}: {s}")
            lines.append(f"  - L{i}: {s}")
        if len(en) > 40:
            lines.append(f"  - ... +{len(en)-40} more")
        lines.append("")

    overs = move_name_overs()
    print(f"\nmove names >12 chars: {len(overs)}")
    lines.append("## move name length >12")
    lines.append(f"- count: {len(overs)}")
    for i, L, n in overs[:40]:
        print(f"  L{i} len={L} {n}")
        lines.append(f"  - L{i} len={L} `{n}`")
    lines.append("")

    names, en_like = mon_name_stats()
    print(f"mon names: {len(names)} titlecase_en_like={len(en_like)}")
    lines.append("## pokemon names")
    lines.append(f"- count: {len(names)}")
    lines.append(f"- TitleCase EN-like: {len(en_like)}")
    for i, n in en_like[:30]:
        lines.append(f"  - L{i}: {n}")
    lines.append("")

    cats, en_cats = dex_category_en()
    print(f"dex categories: {len(cats)} en_cat={len(en_cats)}")
    lines.append("## dex categories (species type line)")
    lines.append(f"- count: {len(cats)}")
    lines.append(f"- EN-suspect: {len(en_cats)}")
    for i, c in en_cats[:40]:
        print(f"  cat L{i}: {c}")
        lines.append(f"  - L{i}: {c}")
    lines.append("")

    # Spot-check: first 5 / mid / last mon names
    lines.append("## mon name samples (first/mid/last)")
    for idx in [0, 1, 2, len(names)//2, -3, -2, -1]:
        if names:
            i, n, L = names[idx]
            lines.append(f"- {n} (len={L})")
            print(f"sample mon: {n}")

    # Summary
    total_en = sum(len(v) for v in all_en.values())
    lines.insert(2, f"**Total EN-suspect across targets: {total_en}**")
    lines.insert(3, f"**Move names over 12: {len(overs)}**")
    lines.insert(4, f"**Dex EN categories: {len(en_cats)}**")
    lines.insert(5, "")

    report = OUT / "_species_qc_report.md"
    report.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print("wrote", report)
    print("TOTAL_EN", total_en, "MOVE_OVER", len(overs), "DEX_CAT_EN", len(en_cats))


if __name__ == "__main__":
    main()
