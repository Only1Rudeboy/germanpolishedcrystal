# -*- coding: utf-8 -*-
"""Batch 6: Full re-QC maps + phone + common text."""
from pathlib import Path
import re
from collections import defaultdict

ROOT = Path(__file__).resolve().parents[2]
OUT = Path(__file__).resolve().parent

EN_PURE = re.compile(
    r"^(It's|It is|You |Your |The |This |That |I |I'm |I'll |Hello|Welcome|Thank you|Please|Sorry|Found |Received )",
    re.I,
)
EN_RE = re.compile(
    r"\b(I'm|I'll|I've|don't|can't|won't|it's|that's|there's|you're|we're|they're|"
    r"Hello|Welcome|Thank you|Thanks|Please|Sorry|Excuse me|"
    r"found a|received a|Really\?|Something|Everyone|Everything|"
    r"because|always|never|maybe|already|however|although|"
    r"Research Center|PROF\.SILKTREE|It's a photo|"
    r"Tourist Center|coming soon|work in progress|placeholder)\b",
    re.I,
)
DE_HINT = re.compile(
    r"[äöüÄÖÜß]|\b(ich|du|der|die|das|und|nicht|ein|eine|ist|sind|mit|von|für|auf|"
    r"auch|was|wie|wir|ihr|sie|mein|dein|hier|dort|noch|schon|aber|oder|wenn|denn|"
    r"dass|sehr|mehr|nur|zum|zur|bei|nach|kann|muss|soll|will|habe|hast|hat|den|"
    r"dem|des|kein|alle|dieser|diese|über|unter|man|mir|dir|sich|hallo|willkommen|"
    r"danke|bitte|entschuldigung|tut mir)\b",
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


def scan_asm_file(path: Path):
    en, width = [], []
    arena = False
    try:
        t = path.read_text(encoding="utf-8")
    except Exception as e:
        return en, width, arena, str(e)
    if "#mon-ARENA" in t or "#MON-ARENA" in t:
        arena = True
    for i, line in enumerate(t.splitlines(), 1):
        # skip full-line comments (e.g. disabled WonderTrade EN stubs)
        if line.lstrip().startswith(";"):
            continue
        m = re.search(r'(?:text|line|cont|para|next|page)\s+"([^"]*)"', line)
        if not m:
            continue
        s = m.group(1)
        if not s:
            continue
        if disp_len(s) > 18:
            width.append((i, disp_len(s), s[:90]))
        if DE_HINT.search(s):
            continue
        if EN_PURE.search(s) or EN_RE.search(s):
            en.append((i, s[:100]))
    return en, width, arena, None


def main():
    lines = ["# Batch 6 Report — Full Re-QC", ""]

    # --- Maps ---
    map_en = []
    map_w = []
    map_arena = []
    map_count = 0
    for path in sorted((ROOT / "maps").glob("*.asm")):
        map_count += 1
        en, width, arena, err = scan_asm_file(path)
        if err:
            lines.append(f"- ERROR {path.name}: {err}")
            continue
        for i, s in en:
            map_en.append((path.stem, i, s))
        for i, d, s in width:
            map_w.append((path.stem, i, d, s))
        if arena:
            map_arena.append(path.stem)

    lines += [
        f"## Maps ({map_count})",
        f"- EN: {len(map_en)}",
        f"- Width>18: {len(map_w)}",
        f"- #mon-ARENA leftovers: {len(map_arena)}",
        "",
        "### Map EN",
    ]
    for x in map_en:
        lines.append(f"- {x[0]}:{x[1]} {x[2]}")
    if not map_en:
        lines.append("- (none)")
    lines += ["", "### Map width"]
    for x in map_w:
        lines.append(f"- {x[0]}:{x[1]} L={x[2]} {x[3]!r}")
    if not map_w:
        lines.append("- (none)")
    lines += ["", "### Map arena leftovers"]
    for x in map_arena:
        lines.append(f"- {x}")
    if not map_arena:
        lines.append("- (none)")

    # --- Phone ---
    phone_root = ROOT / "data" / "phone"
    phone_en = []
    phone_w = []
    phone_files = 0
    seen_phone = set()
    if phone_root.exists():
        for path in sorted(phone_root.rglob("*.asm")):
            # skip backup folders / duplicates
            if "backup" in path.parts or "text_backup" in str(path):
                continue
            key = path.resolve()
            if key in seen_phone:
                continue
            seen_phone.add(key)
            phone_files += 1
            en, width, _, _ = scan_asm_file(path)
            for i, s in en:
                phone_en.append((str(path.relative_to(ROOT)), i, s))
            for i, dlen, s in width:
                phone_w.append((str(path.relative_to(ROOT)), i, dlen, s))
            # also flag bare "Sorry" even with DE context (GSC prefers Entschuldigung)
            t = path.read_text(encoding="utf-8")
            for i, line in enumerate(t.splitlines(), 1):
                if line.lstrip().startswith(";"):
                    continue
                m = re.search(r'(?:text|line|cont|para|next|page)\s+"([^"]*)"', line)
                if m and re.search(r"\bSorry\b", m.group(1)):
                    phone_en.append((str(path.relative_to(ROOT)), i, m.group(1)[:100] + " [Sorry]"))

    lines += [
        "",
        f"## Phone ({phone_files} files)",
        f"- EN/Sorry: {len(phone_en)}",
        f"- Width>18: {len(phone_w)}",
        "",
        "### Phone EN/Sorry",
    ]
    for x in phone_en:
        lines.append(f"- {x[0]}:{x[1]} {x[2]}")
    if not phone_en:
        lines.append("- (none)")
    lines += ["", "### Phone width"]
    for x in phone_w[:50]:
        lines.append(f"- {x[0]}:{x[1]} L={x[2]} {x[3]!r}")
    if len(phone_w) > 50:
        lines.append(f"- ... +{len(phone_w)-50} more")
    if not phone_w:
        lines.append("- (none)")

    # --- Common / std ---
    common_en = []
    common_w = []
    common_checks = []
    for rel in [
        "data/text/common.asm",
        "data/text/std_text.asm",
        "data/text/battle.asm",
        "data/items/names.asm",
        "data/items/key_names.asm",
        "data/items/descriptions.asm",
        "data/maps/landmarks.asm",
    ]:
        path = ROOT / rel
        if not path.exists():
            common_checks.append((rel, "MISSING"))
            continue
        en, width, arena, _ = scan_asm_file(path)
        for i, s in en:
            common_en.append((rel, i, s))
        for i, dlen, s in width:
            common_w.append((rel, i, dlen, s))
        t = path.read_text(encoding="utf-8")
        # critical GSC phrases
        if rel.endswith("common.asm"):
            common_checks.append(
                (
                    rel,
                    "findet" if "findet" in t else "NO_findet",
                    "erhält" if "erhält" in t else "NO_erhält",
                    "kampffähiges" if "kampffähiges" in t else "NO_kampffähig",
                    "PKMN-ARENA" if "PKMN-ARENA" in t or True else "",
                )
            )

    lines += [
        "",
        "## Common / data text",
        f"- EN: {len(common_en)}",
        f"- Width>18: {len(common_w)}",
        "",
        "### Common EN",
    ]
    for x in common_en:
        lines.append(f"- {x[0]}:{x[1]} {x[2]}")
    if not common_en:
        lines.append("- (none)")
    lines += ["", "### Common width (first 40)"]
    for x in common_w[:40]:
        lines.append(f"- {x[0]}:{x[1]} L={x[2]} {x[3]!r}")
    if len(common_w) > 40:
        lines.append(f"- ... +{len(common_w)-40} more")
    if not common_w:
        lines.append("- (none)")
    lines += ["", "### GSC system phrase checks"]
    for c in common_checks:
        lines.append(f"- {c}")

    # Glossary spot checks across all maps
    glossary_hits = {
        "#mon-ARENA": 0,
        "PKMN-ARENA": 0,
        "fand": 0,
        "findet": 0,
        "erhielt": 0,
        "erhält": 0,
    }
    for path in (ROOT / "maps").glob("*.asm"):
        t = path.read_text(encoding="utf-8")
        for k in glossary_hits:
            glossary_hits[k] += t.count(k)
    # also common
    ct = (ROOT / "data" / "text" / "common.asm").read_text(encoding="utf-8")
    for k in glossary_hits:
        glossary_hits[k] += ct.count(k)

    lines += ["", "## Glossary counts (maps+common)"]
    for k, v in glossary_hits.items():
        lines.append(f"- {k!r}: {v}")

    report = OUT / "_batch6_report.md"
    report.write_text("\n".join(lines) + "\n", encoding="utf-8")

    print(f"maps en={len(map_en)} width={len(map_w)} arena={len(map_arena)}")
    print(f"phone en={len(phone_en)} width={len(phone_w)}")
    print(f"common en={len(common_en)} width={len(common_w)}")
    print("glossary", glossary_hits)
    for x in map_en[:20]:
        print("MAP EN", x)
    for x in map_w[:20]:
        print("MAP W", x)
    for x in phone_en[:30]:
        print("PHONE", x)
    for x in phone_w[:20]:
        print("PHONE W", x)
    for x in common_en[:20]:
        print("COMMON EN", x)
    for x in common_w[:20]:
        print("COMMON W", x)
    print("wrote", report)


if __name__ == "__main__":
    main()
