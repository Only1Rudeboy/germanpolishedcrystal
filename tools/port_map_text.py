#!/usr/bin/env python3
"""
Port German dialogue from pokecrystal-mobile-ger-maps into Polished Crystal maps.
Matches text blocks by label name; keeps PC structure, adapts placeholders.
"""
from __future__ import annotations

import argparse
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
REF = Path(r"C:\Users\Rudeboy\Downloads\pokecrystal-mobile-ger-maps\maps")
MAPS = ROOT / "maps"

BLOCK_START = re.compile(r"^([A-Za-z_][A-Za-z0-9_]*):\s*(?:;.*)?$")
TEXT_LINE = re.compile(r'^(\s+)(text|line|cont|para|prompt|done|end|waitbutton|waitendtext)\b(.*)$', re.I)

ADAPT = [
    (re.compile(r"<PLAY_G>"), "<PLAYER>"),
    (re.compile(r"<RIVAL>"), "<RIVAL>"),
    (re.compile(r"#MON\b"), "#mon"),
    (re.compile(r"PKMN\b"), "#mon"),
    (re.compile(r"PROF\. OAK\b"), "Prof.Lind"),
    (re.compile(r"PROF\.LIND\b"), "Prof.Lind"),
    (re.compile(r"NEUBORKIA\b"), "Neuborkia"),
    (re.compile(r"<……>"), "…"),
    (re.compile(r"<\.\.\.\.>"), "…"),
]


def adapt_line(s: str) -> str:
    for pat, repl in ADAPT:
        s = pat.sub(repl, s)
    return s


def extract_blocks(text: str) -> dict[str, list[str]]:
    lines = text.splitlines()
    blocks: dict[str, list[str]] = {}
    i = 0
    while i < len(lines):
        m = BLOCK_START.match(lines[i])
        if not m:
            i += 1
            continue
        label = m.group(1)
        body: list[str] = []
        j = i + 1
        while j < len(lines):
            if BLOCK_START.match(lines[j]):
                break
            if TEXT_LINE.match(lines[j]) or lines[j].strip() in ("done", "prompt", "end"):
                body.append(lines[j])
            elif body and lines[j].strip() == "":
                body.append(lines[j])
            elif body and not lines[j].startswith("\t") and not lines[j].startswith(" "):
                break
            j += 1
        if body and any(TEXT_LINE.match(x) for x in body):
            blocks[label] = [adapt_line(x) for x in body]
        i = j if j > i else i + 1
    return blocks


def replace_blocks(pc_text: str, ref_blocks: dict[str, list[str]]) -> tuple[str, int]:
    lines = pc_text.splitlines()
    out: list[str] = []
    i = 0
    replaced = 0
    while i < len(lines):
        m = BLOCK_START.match(lines[i])
        if m and m.group(1) in ref_blocks:
            label = m.group(1)
            out.append(lines[i])
            i += 1
            # skip old body
            while i < len(lines):
                if BLOCK_START.match(lines[i]):
                    break
                if TEXT_LINE.match(lines[i]) or (out and lines[i].strip() in ("done", "prompt", "end")):
                    i += 1
                    continue
                if i < len(lines) and lines[i].strip() == "" and out:
                    # peek: more text?
                    nxt = lines[i + 1] if i + 1 < len(lines) else ""
                    if TEXT_LINE.match(nxt) or nxt.strip() in ("done", "prompt", "end"):
                        i += 1
                        continue
                    break
                if out and not lines[i].startswith(("\t", " ")):
                    break
                i += 1
            out.extend(ref_blocks[label])
            replaced += 1
        else:
            out.append(lines[i])
            i += 1
    return "\n".join(out) + ("\n" if pc_text.endswith("\n") else ""), replaced


def port_file(name: str, dry_run: bool = False) -> int:
    ref_path = REF / name
    pc_path = MAPS / name
    if not ref_path.exists() or not pc_path.exists():
        return 0
    ref_blocks = extract_blocks(ref_path.read_text(encoding="utf-8", errors="replace"))
    pc_text = pc_path.read_text(encoding="utf-8", errors="replace")
    new_text, n = replace_blocks(pc_text, ref_blocks)
    if n and not dry_run:
        pc_path.write_text(new_text, encoding="utf-8")
    return n


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("files", nargs="*", help="map asm filenames")
    ap.add_argument("--list-open", action="store_true")
    ap.add_argument("--priority", action="store_true")
    ap.add_argument("--all-ref", action="store_true", help="port every map with DE reference")
    ap.add_argument("--dry-run", action="store_true")
    args = ap.parse_args()

    priority = [
        "NewBarkTown.asm", "Route29.asm", "Route30.asm", "Route31.asm",
        "CherrygroveCity.asm", "VioletCity.asm", "VioletGym.asm",
        "AzaleaTown.asm", "AzaleaGym.asm", "GoldenrodCity.asm",
        "GoldenrodUnderground.asm", "RadioTower1F.asm", "RadioTower2F.asm",
        "EcruteakCity.asm", "MahoganyTown.asm", "BlackthornCity.asm",
        "Route32.asm", "Route33.asm", "Route34.asm", "Route35.asm",
        "Route36.asm", "Route37.asm", "Route38.asm", "Route39.asm",
        "Route40.asm", "Route41.asm", "Route42.asm", "Route43.asm",
        "Route44.asm", "Route45.asm", "Route46.asm",
        "PewterCity.asm", "CeruleanCity.asm", "VermilionCity.asm",
        "CeladonCity.asm", "FuchsiaCity.asm", "SaffronCity.asm",
        "ViridianCity.asm", "IndigoPlateau.asm",
    ]

    if args.list_open:
        for p in sorted(MAPS.glob("*.asm")):
            if (REF / p.name).exists():
                print(p.name)
        return

    if args.all_ref:
        targets = sorted(p.name for p in MAPS.glob("*.asm") if (REF / p.name).exists())
    else:
        targets = args.files or (priority if args.priority else [])
    total = 0
    for name in targets:
        n = port_file(name, dry_run=args.dry_run)
        if n:
            print(f"{name}: {n} blocks")
            total += n
    print(f"total blocks ported: {total}")


if __name__ == "__main__":
    main()