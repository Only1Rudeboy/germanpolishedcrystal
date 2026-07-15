# -*- coding: utf-8 -*-
"""Honest gap scan: remaining player-facing text areas beyond maps/species."""
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[2]
OUT = Path(__file__).resolve().parent

SKIP_PARTS = {
    "backup", "text_backup_clamped", "_upstream", "maps_backup",
    "bak_pre", "__pycache__",
}

EN_STRONG = re.compile(
    r"\b(I'm|I'll|I've|don't|can't|won't|it's|that's|there's|you're|"
    r"Hello|Welcome|Thank you|Thanks|Please|Sorry|Excuse me|"
    r"Press |START BUTTON|SELECT BUTTON|"
    r"the user|the foe|the opponent|raises |lowers |boosts |"
    r"An attack|A powerful|This Pokemon|It is said|"
    r"coming soon|work in progress|placeholder|TODO:|"
    r"New Bark|Cherrygrove|Violet City|Azalea|Goldenrod|"
    r"Ecruteak|Olivine|Cianwood|Mahogany|Blackthorn|"
    r"Sprout Tower|Burned Tower|Tin Tower|Ilex Forest|"
    r"Research Center|Tourist Center)\b",
    re.I,
)
DE_HINT = re.compile(
    r"[äöüÄÖÜß]|"
    r"\b(der|die|das|den|dem|des|und|ein|eine|einen|ist|sind|mit|von|für|"
    r"auf|auch|wenn|nicht|sein|seine|wird|kann|hat|zum|zur|bei|nach|"
    r"sich|mehr|nur|durch|Gegner|Schaden|Angriff|Bitte|Danke|Hallo|"
    r"Willkommen|Entschuldigung|Stadt|Route|Turm|Wald|Arena)\b",
    re.I,
)

STR_RE = re.compile(
    r'(?:text|line|cont|para|next|page|next1|li|db|rawchar)\s+"([^"]*)"'
)

# Player-facing data/text hotspots (relative paths)
TARGETS = [
    "data/text/common.asm",
    "data/text/std_text.asm",
    "data/text/battle.asm",
    "data/text/input_chars.asm",
    "data/text/plural_table.asm",
    "data/maps/landmarks.asm",
    "data/maps/map_name_signs.asm",
    "data/trainers/class_names.asm",
    "data/trainers/final_text.asm",
    "data/battle_tower/trainer_text.asm",
    "data/battle_tower/classes.asm",
    "data/battle/stat_names.asm",
    "data/battle/stat_strings.asm",
    "data/options/option_names.asm",
    "data/options/options_descriptions.asm",
    "data/options/initial_option_names.asm",
    "data/options/initial_options_descriptions.asm",
    "data/mon_menu.asm",
    "data/events/badge_names.asm",
    "data/events/pokedex_ratings.asm",
    "data/events/elevator_floors.asm",
    "data/events/npc_trades.asm",
    "data/events/wonder_trade/ot_names.asm",
    "data/decorations/names.asm",
    "data/items/apricorn_names.asm",
    "data/items/pocket_names.asm",
    "data/items/exp_candy_names.asm",
    "data/items/wing_names.asm",
    "data/items/special_names.asm",
    "data/pc/theme_names.asm",
    "data/pc/bad_egg.asm",
    "data/player/default_names.asm",
    "data/pokedex_bio.asm",
    "data/pokemon/unown_words.asm",
    "data/credits_strings.asm",
    "data/copyright.asm",
    "data/radio/pnp_places.asm",
    "data/radio/oaks_pkmn_talk_routes.asm",
    "data/radio/buenas_passwords.asm",
    "data/music_player/song_info.asm",
    "data/music_player/song_origins.asm",
    "data/phone/non_trainer_names.asm",
    "data/natures.asm",
    "data/characteristics.asm",
    "data/abilities/names.asm",
    "data/moves/names.asm",
    "data/pokemon/names.asm",
    "data/types/names.asm",
    "data/items/names.asm",
    "data/items/key_names.asm",
]

# Also scan engine for embedded player strings (text "...")
ENGINE_GLOBS = [
    "engine/menus/**/*.asm",
    "engine/pokemon/**/*.asm",
    "engine/pokegear/**/*.asm",
    "engine/pc/**/*.asm",
    "engine/events/**/*.asm",
    "engine/link/**/*.asm",
    "engine/movie/**/*.asm",
    "engine/printer/**/*.asm",
    "engine/games/**/*.asm",
    "mobile/**/*.asm",
]


def should_skip(path: Path) -> bool:
    return any(p in path.parts for p in SKIP_PARTS) or any(
        x in path.name for x in (".bak", ".o")
    )


def scan_file(path: Path):
    en = []
    try:
        t = path.read_text(encoding="utf-8", errors="replace")
    except Exception as e:
        return [], str(e)
    for i, line in enumerate(t.splitlines(), 1):
        if line.lstrip().startswith(";"):
            continue
        for m in STR_RE.finditer(line):
            s = m.group(1).rstrip("@").strip()
            if not s or len(s) < 3:
                continue
            if DE_HINT.search(s):
                continue
            if EN_STRONG.search(s):
                en.append((i, s[:100]))
    return en, None


def main():
    lines = ["# Full-game gap scan (player-facing)", ""]
    print("=== Data targets ===")
    total = 0
    missing = []
    for rel in TARGETS:
        p = ROOT / rel
        if not p.exists():
            missing.append(rel)
            print("MISSING", rel)
            continue
        en, err = scan_file(p)
        total += len(en)
        status = "CLEAN" if not en else f"EN={len(en)}"
        print(f"{status:10} {rel}")
        lines.append(f"## `{rel}` — {status}")
        for i, s in en[:20]:
            lines.append(f"- L{i}: {s}")
            print(f"  L{i}: {s}")
        if not en:
            lines.append("- (none)")
        lines.append("")

    print("\n=== Engine/mobile embedded strings ===")
    eng_hits = []
    for pattern in ENGINE_GLOBS:
        for path in ROOT.glob(pattern):
            if should_skip(path) or not path.is_file():
                continue
            en, _ = scan_file(path)
            if en:
                rel = str(path.relative_to(ROOT))
                eng_hits.append((rel, en))
                total += len(en)
                print(f"EN={len(en):3} {rel}")
                for i, s in en[:8]:
                    print(f"  L{i}: {s}")

    lines.append("## Engine / mobile EN hits")
    if not eng_hits:
        lines.append("- (none)")
    for rel, en in eng_hits[:40]:
        lines.append(f"### `{rel}` ({len(en)})")
        for i, s in en[:15]:
            lines.append(f"- L{i}: {s}")
    lines.append("")

    # Maps quick residual (sample EN)
    print("\n=== Maps residual EN (strong) ===")
    map_en = 0
    map_samples = []
    for path in sorted((ROOT / "maps").glob("*.asm")):
        en, _ = scan_file(path)
        map_en += len(en)
        for i, s in en[:2]:
            map_samples.append((path.stem, i, s))
    print(f"maps strong EN total strings: {map_en}")
    for x in map_samples[:15]:
        print(" ", x)

    lines.append("## Maps strong-EN residual")
    lines.append(f"- count: {map_en}")
    for stem, i, s in map_samples[:20]:
        lines.append(f"- {stem}:{i} {s}")
    if map_en == 0:
        lines.append("- (none)")
    lines.append("")

    # Known intentional gaps / class C
    lines.append("## Known non-GSC / intentional")
    lines.append("- Polished-only content (Shamouti, Battle Factory, new mons): DE GSC-ton, no Crystal dump")
    lines.append("- Abilities / Natures / Physical-Special split: Gen3+ systems, DE official names")
    lines.append("- Graphics tiles with baked EN (title logo, some UI tiles): not pure text tables")
    lines.append("- Developer credits / music player song titles: often proper nouns EN")
    lines.append("- Debug / FAITHFUL ifdefs / comments: not player-facing")
    lines.append("- Mobile adapter (JP hardware feature): may be incomplete/unused")
    lines.append("")

    lines.insert(2, f"**Strong-EN hits (data targets + engine sample + maps): ~{total + map_en}**")
    lines.insert(3, f"**Missing target files: {len(missing)}**")
    lines.insert(4, "")

    report = OUT / "_full_game_gap_report.md"
    report.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print("wrote", report)
    print("TOTAL_DATA_ENGINE", total, "MAPS", map_en, "MISSING", len(missing))


if __name__ == "__main__":
    main()
