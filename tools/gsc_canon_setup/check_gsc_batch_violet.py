# -*- coding: utf-8 -*-
"""Compare Route31 / Violet / Sprout Tower strings to GSC-DE dump."""
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[2]
DUMP = (ROOT / "tools" / "_gsc_de_crystal_msg.txt").read_text(encoding="utf-8", errors="replace")
DUMP_FLAT = (
    DUMP.replace("<LINE>", " ")
    .replace("<PARA>", " ")
    .replace("<CONT>", " ")
    .replace("<BSP>", " ")
)
DUMP_FLAT = re.sub(r"\{[^}]+\}", " ", DUMP_FLAT)
DUMP_FLAT = re.sub(r"\s+", " ", DUMP_FLAT)

FILES = [
    "maps/Route31.asm",
    "maps/Route31VioletGate.asm",
    "maps/VioletCity.asm",
    "maps/VioletMart.asm",
    "maps/VioletPokeCenter1F.asm",
    "maps/VioletGym.asm",
    "maps/VioletNicknameSpeechHouse.asm",
    "maps/EarlsPokemonAcademy.asm",
    "maps/SproutTower1F.asm",
    "maps/SproutTower2F.asm",
    "maps/SproutTower3F.asm",
    "maps/RuinsOfAlphOutside.asm",
    "maps/Route32.asm",
]

# Dump phrases expected in this segment
CANON = [
    "ROUTE 31",
    "VIOLA CITY",
    "ROSALIA CITY",
    "KNOFENSA-TURM",
    "KNOFENSA",
    "EARL",
    "#MON-AKADEMIE",
    "FALK",
    "ARENALEITER",
    "PKMN-ARENA",
    "ZEPHYR",  # may be order name
    "BRIEF",
    "AZALEA",
]


def extract(path: Path):
    t = path.read_text(encoding="utf-8", errors="replace")
    out = []
    for i, line in enumerate(t.splitlines(), 1):
        if line.lstrip().startswith(";"):
            continue
        for m in re.finditer(r'(?:text|line|cont|para|next|page)\s+"([^"]*)"', line):
            if m.group(1):
                out.append((i, m.group(1)))
    return t, out


def main():
    report = ["# GSC dump batch: Route31 / Viola / Knofensa-Turm", ""]
    issues = []
    for rel in FILES:
        p = ROOT / rel
        if not p.exists():
            report.append(f"- MISSING {rel}")
            continue
        blob, strs = extract(p)
        report.append(f"## `{rel}` ({len(strs)} strings)")
        # EN leftovers
        en = re.compile(
            r"\b(I'm|I'll|don't|can't|Hello|Welcome|Thank you|Please|Sorry|"
            r"Sprout Tower|Violet City|Gym Leader|Earl's)\b",
            re.I,
        )
        for i, s in strs:
            if en.search(s):
                issues.append((rel, i, "EN", s))
                report.append(f"- EN L{i}: {s}")
        # place naming
        if "Violet" in blob and "VIOLA" not in blob:
            issues.append((rel, 0, "PLACE", "Violet without VIOLA"))
        if "Sprout" in blob:
            issues.append((rel, 0, "PLACE", "Sprout EN leftover"))
            report.append("- PLACE: Sprout EN")
        # sample first texts
        for i, s in strs[:8]:
            report.append(f"  - L{i}: {s}")
        report.append("")

    report.append("## Issues")
    for it in issues:
        report.append(f"- {it}")
        print("ISSUE", it)
    if not issues:
        report.append("- (none from auto)")
    print("issues", len(issues))

    out = Path(__file__).resolve().parent / "_gsc_batch_violet_report.md"
    out.write_text("\n".join(report) + "\n", encoding="utf-8")
    print("wrote", out)

    # Print key local sign texts for manual dump compare
    for rel in [
        "maps/Route31.asm",
        "maps/VioletCity.asm",
        "maps/SproutTower1F.asm",
        "maps/VioletGym.asm",
        "maps/EarlsPokemonAcademy.asm",
    ]:
        p = ROOT / rel
        if not p.exists():
            continue
        t = p.read_text(encoding="utf-8", errors="replace")
        print("====", rel)
        for lab in re.findall(r"^(\w*(?:Sign|Gym|Tower|Academy|Text)\w*):\n", t, re.M):
            if "Sign" in lab or "Gym" in lab or lab.endswith("Text") and (
                "Sign" in lab or "Welcome" in lab or "Intro" in lab or "Falk" in lab or "Earl" in lab
            ):
                m = re.search(rf"^{lab}:\n((?:(?!^[A-Za-z_]\w*:).*\n){{0,20}})", t, re.M)
                if m:
                    body = re.sub(r'\s+(text|line|cont|para)\s+"([^"]*)"', r" \2", m.group(0))
                    body = re.sub(r"\s+", " ", body)[:180]
                    print(" ", lab, ":", body)


if __name__ == "__main__":
    main()
