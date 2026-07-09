#!/usr/bin/env python3
"""Temporarily swap ngrams to upstream and test link."""
from pathlib import Path
import shutil
import subprocess
import sys

ROOT = Path(__file__).resolve().parent.parent

def swap_upstream_ngrams():
    local = (ROOT / "constants/charmap.asm").read_text(encoding="utf-8")
    up = (ROOT / "_upstream_extract/polishedcrystal-master/constants/charmap.asm").read_text(encoding="utf-8")
    start = local.index("\tnewcharmap default, compressing")
    end = local.index("DEF NGRAMS_END")
    up_start = up.index("\tnewcharmap default, compressing")
    up_end = up.index("DEF NGRAMS_END")
    new = local[:start] + up[up_start:up_end] + local[end:]
    (ROOT / "constants/charmap.asm").write_text(new, encoding="utf-8")
    shutil.copy(
        ROOT / "_upstream_extract/polishedcrystal-master/data/text/ngrams.asm",
        ROOT / "data/text/ngrams.asm",
    )

def main():
    charmap_bak = ROOT / "constants/charmap.asm.bak"
    ngrams_bak = ROOT / "data/text/ngrams.asm.bak"
    shutil.copy(ROOT / "constants/charmap.asm", charmap_bak)
    shutil.copy(ROOT / "data/text/ngrams.asm", ngrams_bak)
    try:
        swap_upstream_ngrams()
        env = {"PATH": str(ROOT / "tools/make/bin") + ":" + os.environ.get("PATH", "")}
        rgbasm = ROOT / "rgbds/rgbasm.exe"
        rgblink = ROOT / "rgbds/rgblink.exe"
        objs = [
            "main.o", "home.o", "ram.o", "audio.o", "audio/music_player.o",
            "data/pokemon/dex_entries.o", "data/pokemon/egg_moves.o",
            "data/pokemon/evos_attacks.o", "data/maps/map_data.o",
            "data/text/common.o", "data/tilesets.o", "engine/movie/credits.o",
            "engine/overworld/events.o", "gfx/minis_icons.o", "gfx/pokemon.o",
            "gfx/sprites.o", "gfx/trainers.o", "gfx/items.o", "gfx/misc.o",
        ]
        subprocess.run([str(rgbasm), "-Weverything", "-Wtruncation=1", "-E", "-Q8", "-P", "includes.asm", "-o", "home.o", "home.asm"], cwd=ROOT, check=True)
        cmd = [str(rgblink), "-Weverything", "-Wtruncation=1", "-M", "-l", "layout.link", "-o", "test.gbc"] + objs
        r = subprocess.run(cmd, cwd=ROOT, capture_output=True, text=True)
        print(r.stdout)
        print(r.stderr)
        print("exit", r.returncode)
    finally:
        shutil.move(charmap_bak, ROOT / "constants/charmap.asm")
        shutil.move(ngrams_bak, ROOT / "data/text/ngrams.asm")
        (ROOT / "test.gbc").unlink(missing_ok=True)

if __name__ == "__main__":
    import os
    main()