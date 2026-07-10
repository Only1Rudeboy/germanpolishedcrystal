#!/usr/bin/env python3
"""Translate Polished Crystal map dialogue using DE Crystal reference maps."""
from __future__ import annotations

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
MAPS = ROOT / "maps"
GER_REF = Path(r"C:\Users\Rudeboy\Downloads\pokecrystal-mobile-ger-maps\maps")
PRET_REF = Path(r"C:\Users\Rudeboy\Downloads\pokecrystal-pret-maps\maps")

TEXT_LINE = re.compile(r"^(\s*)((?:text|line|cont|para)\s+\".*\")$", re.MULTILINE)
TEXT_START = re.compile(r'^\s*text\s+"', re.MULTILINE)
DONE_LINE = re.compile(r"^(\s*)done\s*$", re.MULTILINE)
LABEL = re.compile(r"^(\.?[A-Za-z_][A-Za-z0-9_]*):$", re.MULTILINE)
ENGLISH_HINT = re.compile(
    r"\b(the|you|your|what|wait|hello|wild|it's|i'm|my |good |come |have |will |this |that |with |from |hey!)\b",
    re.I,
)

# Polished-specific labels / blocks not in DE Crystal (body only, no label line).
sys.path.insert(0, str(Path(__file__).resolve().parent))
from maps_de_overrides import (  # noqa: E402
    INLINE_OVERRIDES,
    OVERRIDES_BY_FILE,
    OVERRIDES_BY_LABEL,
)


def adapt_de(body: str) -> str:
    repl = [
        ("#COM", "#gear"),
        ("#GEAR", "#gear"),
        ("#MON", "#mon"),
        ("#DEX", "#dex"),
        ("<PLAY_G>", "<PLAYER>"),
        ("PROF. LIND", "Prof.Lind"),
        ("PROF.LIND", "Prof.Lind"),
        ("Prof.Elm", "Prof.Lind"),
        ("PROF.ELM", "Prof.Lind"),
        ("ELM #MON", "LIND-#mon"),
        ("Elm #mon", "LIND-#mon"),
        ("ELM #mon", "LIND-#mon"),
        ("LIND-#MON", "LIND-#mon"),
        ("NEW BARK TOWN", "Neuborkia"),
        ("New Bark Town", "Neuborkia"),
        ("ELM'S HOUSE", "Prof.Linds Haus"),
        ("Elm's House", "Prof.Linds Haus"),
        ("LYRA'S HOUSE", "Lyras Haus"),
        ("Lyra's House", "Lyras Haus"),
        ("Gym Badges", "Orden"),
        ("Gym Badge", "Orden"),
        ("#mon League", "#mon-Liga"),
        ("#MON League", "#mon-Liga"),
        ("Pokémon League", "#mon-Liga"),
        ("Pokemon League", "#mon-Liga"),
        ("League Champion", "Liga-Champion"),
        ("trainer", "Trainer"),
    ]
    out = body
    for a, b in repl:
        out = out.replace(a, b)
    return out


def normalize_block(body: str) -> str:
    lines = []
    for line in body.splitlines():
        m = re.match(r"\s*(?:text|line|cont|para)\s+\"(.*)\"", line)
        if m:
            lines.append(m.group(1).replace("<PLAY_G>", "<PLAYER>"))
    return "|".join(lines).lower()


def qualify_label(raw: str, parent: str | None) -> str:
    if raw.startswith("."):
        return f"{parent}{raw}" if parent else raw
    return raw


def extract_text_block(
    content: str, search_from: int, search_until: int
) -> tuple[int, int, str] | None:
    chunk = content[search_from:search_until]
    tb = re.search(r"^\s*(?:text|line|cont|para)\s+\"", chunk, re.MULTILINE)
    if not tb:
        return None
    bstart = search_from + tb.start()
    done = None
    for dm in DONE_LINE.finditer(content, bstart, search_until):
        done = dm
    if not done:
        return None
    bend = done.end()
    return bstart, bend, content[bstart:bend]


def parse_labeled_blocks(content: str) -> dict[str, tuple[int, int, str]]:
    """Return label -> (start, end, body) for text blocks with labels."""
    blocks: dict[str, tuple[int, int, str]] = {}
    matches = list(LABEL.finditer(content))
    parent: str | None = None
    for i, m in enumerate(matches):
        raw_label = m.group(1)
        if not raw_label.startswith("."):
            parent = raw_label
        label = qualify_label(raw_label, parent)
        start = m.end()
        end = matches[i + 1].start() if i + 1 < len(matches) else len(content)
        chunk = content[start:end]
        first = None
        for line in chunk.splitlines():
            stripped = line.strip()
            if not stripped or stripped.startswith(";"):
                continue
            first = stripped
            break
        if not first or not first.startswith('text "'):
            continue
        extracted = extract_text_block(content, start, end)
        if not extracted:
            continue
        bstart, bend, body = extracted
        blocks[label] = (bstart, bend, body)
    return blocks


def looks_english(body: str) -> bool:
    return bool(ENGLISH_HINT.search(body))


def resolve_file_override(file_overrides: dict[str, str], label: str) -> str | None:
    if label in file_overrides:
        return file_overrides[label]
    if "." in label:
        short = label[label.rindex(".") :]
        if short in file_overrides:
            return file_overrides[short]
    return None


def parse_inline_blocks(content: str) -> list[tuple[int, int, str]]:
    """Anonymous text ... done blocks (no preceding label with text)."""
    blocks: list[tuple[int, int, str]] = []
    labeled = parse_labeled_blocks(content)
    labeled_ranges = [(s, e) for s, e, _ in labeled.values()]
    for tm in TEXT_START.finditer(content):
        bstart = tm.start()
        if any(s <= bstart < e for s, e in labeled_ranges):
            continue
        done = None
        for dm in DONE_LINE.finditer(content, bstart):
            done = dm
            break
        if not done:
            continue
        bend = done.end()
        body = content[bstart:bend]
        blocks.append((bstart, bend, body))
    return blocks


def build_en_to_de() -> dict[str, str]:
    mapping: dict[str, str] = {}
    if not PRET_REF.is_dir() or not GER_REF.is_dir():
        return mapping
    for pret_file in PRET_REF.glob("*.asm"):
        ger_file = GER_REF / pret_file.name
        if not ger_file.exists():
            continue
        pret_blocks = parse_labeled_blocks(pret_file.read_text(encoding="utf-8"))
        ger_blocks = parse_labeled_blocks(ger_file.read_text(encoding="utf-8"))
        for label, (_, _, en_body) in pret_blocks.items():
            if label not in ger_blocks:
                continue
            _, _, de_body = ger_blocks[label]
            key = normalize_block(en_body)
            if key:
                mapping[key] = adapt_de(de_body)
    return mapping


def build_label_to_de() -> dict[str, dict[str, str]]:
    by_file: dict[str, dict[str, str]] = {}
    if not GER_REF.is_dir():
        return by_file
    for ger_file in GER_REF.glob("*.asm"):
        blocks = parse_labeled_blocks(ger_file.read_text(encoding="utf-8"))
        by_file[ger_file.name] = {
            label: adapt_de(body) for label, (_, _, body) in blocks.items()
        }
    return by_file


def translate_file(
    path: Path,
    label_de: dict[str, dict[str, str]],
    en_to_de: dict[str, str],
    *,
    dry_run: bool = False,
) -> tuple[int, int, list[str]]:
    content = path.read_text(encoding="utf-8")
    fname = path.name
    file_overrides = OVERRIDES_BY_FILE.get(fname, {})
    ref_labels = label_de.get(fname, {})
    labeled = parse_labeled_blocks(content)
    inline = parse_inline_blocks(content)
    replacements: list[tuple[int, int, str]] = []
    misses: list[str] = []

    for label, (start, end, body) in labeled.items():
        override = resolve_file_override(file_overrides, label)
        if override:
            replacements.append((start, end, override.rstrip() + "\n"))
            continue
        if label in OVERRIDES_BY_LABEL:
            replacements.append((start, end, OVERRIDES_BY_LABEL[label].rstrip() + "\n"))
            continue
        if label in ref_labels:
            replacements.append((start, end, ref_labels[label].rstrip() + "\n"))
            continue
        key = normalize_block(body)
        if key in en_to_de:
            replacements.append((start, end, en_to_de[key].rstrip() + "\n"))
            continue
        if looks_english(body):
            misses.append(f"{fname}:{label}")

    for start, end, body in inline:
        key = normalize_block(body)
        if key in INLINE_OVERRIDES:
            replacements.append((start, end, INLINE_OVERRIDES[key].rstrip() + "\n"))
        elif key in en_to_de:
            replacements.append((start, end, en_to_de[key].rstrip() + "\n"))
        elif looks_english(body):
            misses.append(f"{fname}:inline@{start}")

    replacements.sort(key=lambda x: x[0], reverse=True)
    new_content = content
    for start, end, new_body in replacements:
        new_content = new_content[:start] + new_body + new_content[end:]

    if not dry_run and replacements:
        path.write_text(new_content, encoding="utf-8", newline="\n")

    return len(replacements), len(misses), misses


def main(argv: list[str]) -> int:
    dry_run = "--dry-run" in argv
    only: set[str] | None = None
    if "--only" in argv:
        idx = argv.index("--only")
        only = set(argv[idx + 1].split(","))

    label_de = build_label_to_de()
    en_to_de = build_en_to_de()
    print(f"GER label maps: {len(label_de)}")
    print(f"EN->DE pairs: {len(en_to_de)}")

    files = sorted(MAPS.glob("*.asm"))
    if only:
        files = [f for f in files if f.name in only]

    total_rep = total_miss = 0
    all_misses: list[str] = []
    for path in files:
        rep, miss, misses = translate_file(path, label_de, en_to_de, dry_run=dry_run)
        total_rep += rep
        total_miss += miss
        all_misses.extend(misses)

    print(f"Files: {len(files)}")
    print(f"Blocks replaced: {total_rep}")
    print(f"Unresolved: {total_miss}")
    if all_misses:
        miss_path = ROOT / "tools" / "maps_untranslated.txt"
        miss_path.write_text("\n".join(all_misses[:5000]), encoding="utf-8")
        print(f"Miss list: {miss_path} ({len(all_misses)} lines)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))