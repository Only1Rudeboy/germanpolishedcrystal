#!/usr/bin/env python3
from pathlib import Path
import shutil
import subprocess

ROOT = Path(__file__).resolve().parent.parent
UP = ROOT / "_upstream_extract/polishedcrystal-master"

def test_plural(use_upstream: bool):
    src = UP / "data/text/plural_table.asm" if use_upstream else ROOT / "data/text/plural_table.asm"
    bak = ROOT / "data/text/plural_table.asm.baktest"
    if not use_upstream:
        shutil.copy(ROOT / "data/text/plural_table.asm", bak)
    else:
        shutil.copy(ROOT / "data/text/plural_table.asm", bak)
        shutil.copy(src, ROOT / "data/text/plural_table.asm")
    try:
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
        label = "upstream" if use_upstream else "german"
        print(label, ":", r.stderr.strip() or "LINK OK")
        return r.returncode == 0
    finally:
        shutil.move(bak, ROOT / "data/text/plural_table.asm")
        (ROOT / "test.gbc").unlink(missing_ok=True)

if __name__ == "__main__":
    test_plural(False)
    test_plural(True)