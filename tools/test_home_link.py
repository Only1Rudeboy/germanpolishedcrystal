#!/usr/bin/env python3
"""Test link after swapping files to upstream copies."""
from pathlib import Path
import shutil
import subprocess
import sys

ROOT = Path(__file__).resolve().parent.parent
UP = ROOT / "_upstream_extract/polishedcrystal-master"

def test_swap(files):
    backups = {}
    try:
        for rel in files:
            src = ROOT / rel
            bak = src.with_suffix(src.suffix + ".baktest")
            shutil.copy(src, bak)
            backups[rel] = bak
            shutil.copy(UP / rel, src)
        rgbasm = ROOT / "rgbds/rgbasm.exe"
        rgblink = ROOT / "rgbds/rgblink.exe"
        subprocess.run(
            [str(rgbasm), "-Weverything", "-Wtruncation=1", "-E", "-Q8", "-P", "includes.asm", "-o", "home.o", "home.asm"],
            cwd=ROOT, check=True,
        )
        objs = [
            "main.o", "home.o", "ram.o", "audio.o", "audio/music_player.o",
            "data/pokemon/dex_entries.o", "data/pokemon/egg_moves.o",
            "data/pokemon/evos_attacks.o", "data/maps/map_data.o",
            "data/text/common.o", "data/tilesets.o", "engine/movie/credits.o",
            "engine/overworld/events.o", "gfx/minis_icons.o", "gfx/pokemon.o",
            "gfx/sprites.o", "gfx/trainers.o", "gfx/items.o", "gfx/misc.o",
        ]
        cmd = [str(rgblink), "-Weverything", "-Wtruncation=1", "-M", "-l", "layout.link", "-o", "test.gbc"] + objs
        r = subprocess.run(cmd, cwd=ROOT, capture_output=True, text=True)
        print("files:", files)
        print(r.stderr.strip() or "LINK OK")
        return r.returncode == 0
    finally:
        for rel, bak in backups.items():
            shutil.move(bak, ROOT / rel)
        (ROOT / "test.gbc").unlink(missing_ok=True)

if __name__ == "__main__":
    label = sys.argv[1] if len(sys.argv) > 1 else "charmap+ngrams"
    files = {
        "charmap": ["constants/charmap.asm"],
        "ngrams": ["data/text/ngrams.asm"],
        "charmap+ngrams": ["constants/charmap.asm", "data/text/ngrams.asm"],
        "common": ["data/text/common.asm"],
        "all3": ["constants/charmap.asm", "data/text/ngrams.asm", "data/text/common.asm"],
    }[label]
    ok = test_swap(files)
    sys.exit(0 if ok else 1)