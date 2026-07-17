#!/usr/bin/env python3
"""Redraw uppercase Ö ($c7 / tile $47) cleanly in all typeface fonts."""
from pathlib import Path
from PIL import Image

FONT_DIR = Path("gfx/font")
OE_TILE = 0x47  # $c7 - $80
INK, PAPER = 0, 255

TYPEFACE = [
    "normal.png", "narrow.png", "bold.png", "italic.png",
    "serif.png", "micr.png", "chicago.png", "vwf.png",
]

# Clean 8x8 Ö (matches pret/GSC style proportions)
OE_NORMAL = [
    "..#..#..",
    "..#..#..",
    "..###...",
    ".#...#..",
    "#.....#.",
    "#.....#.",
    ".#...#..",
    "..###...",
]
OE_BOLD = [
    ".##..##.",
    ".##..##.",
    ".#####..",
    "##...##.",
    "##...##.",
    "##...##.",
    "##...##.",
    ".#####..",
]
OE_NARROW = [
    ".#..#...",
    ".#..#...",
    ".####...",
    "#....#..",
    "#....#..",
    "#....#..",
    "#....#..",
    ".####...",
]

def rows_to_tile(rows):
    t = Image.new("L", (8, 8), PAPER)
    px = t.load()
    for y, row in enumerate(rows):
        for x, c in enumerate(row):
            if c == "#":
                px[x, y] = INK
    return t

def set_tile(img, idx, tile):
    col, row = idx % 16, idx // 16
    img.paste(tile, (col * 8, row * 8))

def get_tile(img, idx):
    col, row = idx % 16, idx // 16
    return img.crop((col*8, row*8, col*8+8, row*8+8))

for name in TYPEFACE:
    path = FONT_DIR / name
    if not path.exists():
        continue
    img = Image.open(path).convert("L")
    if "bold" in name:
        tile = rows_to_tile(OE_BOLD)
    elif "narrow" in name or "micr" in name:
        tile = rows_to_tile(OE_NARROW)
    else:
        tile = rows_to_tile(OE_NORMAL)
    set_tile(img, OE_TILE, tile)
    img.save(path)
    t = get_tile(img, OE_TILE)
    p = t.load()
    print(f"=== {name} ===")
    for y in range(8):
        print("".join("#" if p[x,y] < 128 else "." for x in range(8)))

# Force rebuild of font 1bpp by deleting generated files
import os
for name in TYPEFACE:
    bpp = FONT_DIR / name.replace(".png", ".1bpp")
    if bpp.exists():
        bpp.unlink()
        print("deleted", bpp)
    # vwf special
    if name == "vwf.png":
        for extra in ["vwf.2bpp", "vwf.vwf.1bpp"]:
            p = FONT_DIR / extra
            if p.exists():
                p.unlink()
                print("deleted", p)

print("OK")
