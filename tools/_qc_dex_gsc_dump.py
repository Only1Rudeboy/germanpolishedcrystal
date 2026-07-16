# -*- coding: utf-8 -*-
"""QC: GSC-DE Pokédex (#001–#251) vs crystal DE msg dump.

Extracts 251 kind/body pairs from three clusters in tools/_gsc_de_crystal_msg.txt
and compares to data/pokemon/dex_entries.asm via national pointer order.
"""
from __future__ import annotations

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
DEX = ROOT / "data" / "pokemon" / "dex_entries.asm"
PTRS = ROOT / "data" / "pokemon" / "dex_entry_pointers.asm"
CRYSTAL = ROOT / "tools" / "_gsc_de_crystal_msg.txt"
REPORT = ROOT / "tools" / "_qc_dex_gsc_report.txt"

GSC_COUNT = 251
# 0-indexed inclusive line ranges of kind@ lines (crystal dump clusters)
CLUSTERS = [(5525, 5652), (7584, 7711), (9288, 9533)]


def dump_to_lines(body: str) -> list[str]:
    body = body.rstrip("@")
    lines: list[str] = []
    for page in body.split("@"):
        for part in page.split("<NEXT>"):
            if part != "":
                lines.append(part)
    return lines


def soft(lines: list[str]) -> list[str]:
    out = [L.rstrip() for L in lines]
    while out and out[-1] == "":
        out.pop()
    return out


def extract_crystal_dex() -> list[tuple[str, list[str]]]:
    lines = CRYSTAL.read_text(encoding="utf-8").splitlines()
    pairs: list[tuple[str, list[str]]] = []
    for start, end in CLUSTERS:
        i = start
        while i <= end and i < len(lines):
            kind_line = lines[i]
            if (
                not kind_line.endswith("@")
                or kind_line.startswith("{")
                or "<" in kind_line
            ):
                i += 1
                continue
            if i + 1 >= len(lines) or "<NEXT>" not in lines[i + 1]:
                i += 1
                continue
            pairs.append((kind_line[:-1], dump_to_lines(lines[i + 1])))
            i += 2
    return pairs


def parse_asm() -> dict[str, tuple[str, list[str]]]:
    text = DEX.read_text(encoding="utf-8")
    pat = re.compile(
        r"^([A-Za-z0-9_]+)PokedexEntry::\s*\n"
        r'\tdb "([^"]*)@"\s*\n'
        r'((?:\t(?:text|next|page) "[^"]*"\s*\n)+)',
        re.M,
    )
    out: dict[str, tuple[str, list[str]]] = {}
    for m in pat.finditer(text):
        name = m.group(1)
        kind = m.group(2)
        blines = re.findall(r'(?:text|next|page) "([^"]*)"', m.group(3))
        if blines and blines[-1].endswith("@"):
            blines[-1] = blines[-1][:-1]
        out[name] = (kind, blines)
    return out


def parse_order() -> list[str]:
    return re.findall(
        r"dba ([A-Za-z0-9_]+)PokedexEntry",
        PTRS.read_text(encoding="utf-8"),
    )


def norm_kind(k: str) -> str:
    return (
        k.upper()
        .replace("\u00ad", "")
        .replace("-", "")
        .replace(" ", "")
        .replace(".", "")
        .replace("/", "")
    )


def main() -> int:
    crystal = extract_crystal_dex()
    asm = parse_asm()
    order = parse_order()
    print(f"crystal_gsc={len(crystal)} asm={len(asm)} pointers={len(order)}")
    if len(crystal) != GSC_COUNT:
        print(f"WARNING: expected {GSC_COUNT}, got {len(crystal)}")

    exact = soft_ok = 0
    kind_mm: list = []
    body_mm: list = []
    trail: list = []
    missing: list = []
    width: list = []

    for n in range(1, min(GSC_COUNT, len(crystal)) + 1):
        name = order[n - 1]
        if name not in asm:
            missing.append((n, name))
            continue
        d_kind, d_lines = crystal[n - 1]
        a_kind, a_lines = asm[name]
        if norm_kind(a_kind) != norm_kind(d_kind):
            kind_mm.append((n, name, a_kind, d_kind))
        if a_lines == d_lines:
            exact += 1
            soft_ok += 1
        elif soft(a_lines) == soft(d_lines):
            soft_ok += 1
            trail.append((n, name))
        else:
            body_mm.append((n, name, a_lines, d_lines))
        for L in a_lines:
            if len(L.rstrip()) > 18:
                width.append((n, name, L, len(L)))

    print(f"exact body:     {exact}/{len(crystal)}")
    print(f"soft body:      {soft_ok}/{len(crystal)} (rstrip trail spaces/empty)")
    print(f"trail-only:     {len(trail)}")
    print(f"real body mm:   {len(body_mm)}")
    print(f"kind mm:        {len(kind_mm)}")
    print(f"missing:        {len(missing)}")
    print(f"width>18:       {len(width)}")

    for n, name, a, d in body_mm:
        print(f"#{n:03d} {name}\n  ASM={a}\n  DMP={d}")
    for row in kind_mm:
        print(f"KIND #{row[0]} {row[1]} ASM={row[2]!r} DUMP={row[3]!r}")

    eng_re = re.compile(
        r"\b(the|and|with|from|that|this|when|its|their|strong|powerful)\b",
        re.I,
    )
    eng = [
        name
        for name, (_k, ls) in asm.items()
        if eng_re.search(" ".join(ls))
    ]
    print(f"english-ish any dex: {len(eng)}")
    for e in eng[:15]:
        print(" ", e)

    with REPORT.open("w", encoding="utf-8") as f:
        f.write(
            f"exact={exact} soft={soft_ok} trail={len(trail)} "
            f"body_mm={len(body_mm)} kind_mm={len(kind_mm)}\n"
        )
        for n, name, a, d in body_mm:
            f.write(f"#{n} {name}\nASM={a}\nDUMP={d}\n\n")
    print(f"Wrote {REPORT}")
    return 0 if not body_mm and not kind_mm and not missing else 1


if __name__ == "__main__":
    sys.exit(main())
