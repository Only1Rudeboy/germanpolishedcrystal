# -*- coding: utf-8 -*-
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[2]
DUMP = (ROOT / "tools" / "_gsc_de_crystal_msg.txt").read_text(encoding="utf-8", errors="replace")

files = [
    "maps/Route31.asm",
    "maps/VioletCity.asm",
    "maps/SproutTower1F.asm",
    "maps/SproutTower2F.asm",
    "maps/SproutTower3F.asm",
    "maps/VioletGym.asm",
    "maps/EarlsPokemonAcademy.asm",
    "maps/Route32.asm",
    "maps/VioletNicknameSpeechHouse.asm",
    "maps/VioletMart.asm",
    "maps/VioletPokeCenter1F.asm",
]


def dump_has(s: str) -> bool:
    # normalize mon spelling
    variants = [s, s.replace("#mon", "#MON"), s.replace("#MON", "#mon")]
    return any(v in DUMP for v in variants if v)


for f in files:
    p = ROOT / f
    if not p.exists():
        print("MISSING", f)
        continue
    t = p.read_text(encoding="utf-8", errors="replace")
    print("====", f)
    # all multi-line text labels ending with Text:
    for m in re.finditer(
        r"^(\w+):\n((?:(?!^[A-Za-z_]\w*:).*\n){0,30})",
        t,
        re.M,
    ):
        lab = m.group(1)
        if not (
            "Sign" in lab
            or "Welcome" in lab
            or lab.endswith("Text")
            and any(
                x in lab
                for x in (
                    "Sign",
                    "Gym",
                    "Tower",
                    "Earl",
                    "Falk",
                    "Sage",
                    "Intro",
                    "After",
                    "Beaten",
                    "Seen",
                    "Route31",
                    "Route32",
                    "Violet",
                    "Sprout",
                    "Academy",
                    "Mail",
                    "Kurt",
                    "Guide",
                )
            )
        ):
            # still take *SignText and main NPC texts
            if not re.search(
                r"(Sign|Gym|Tower|Earl|Falk|Sage|Academy|Mail|Youngster|Fisher|Bird)",
                lab,
            ):
                continue
        body = re.findall(r'"([^"]*)"', m.group(2))
        joined = " ".join(body)
        if not joined.strip():
            continue
        # flag if short unique phrase not in dump (heuristic)
        flag = ""
        # check distinctive multi-word chunks
        for chunk in re.findall(r"[A-ZÄÖÜ#][A-ZÄÖÜa-zäöüß\- ]{8,40}", joined):
            chunk = chunk.strip()
            if len(chunk) < 10:
                continue
            if not dump_has(chunk) and not dump_has(chunk.replace(" ", "")):
                # skip if mostly soft hyphen fragments
                if chunk.count("-") > 2:
                    continue
                flag = " ?dump"
                break
        print(f"  {lab}:{flag}")
        print(f"    {joined[:200]}")
