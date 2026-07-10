#!/usr/bin/env python3
"""Draw German umlaut glyphs into gfx/font/*.png (Polished Crystal DE).

Tile index = char_code - 0x80 (see constants/charmap.asm).

Target slots (PC DE charmap):
  $C1 (65) Ü   $C9 (73) ß   $CA (74) ä   $CC (76) ü
  $CD (77) ö   $CE (78) Ä   $CF (79) Ö

Reference: pret/pokecrystal gfx/font/french_german.png (official DE/FR glyphs).
"""
from __future__ import annotations

import urllib.request
from io import BytesIO
from pathlib import Path

from PIL import Image

ROOT = Path(__file__).resolve().parents[1]
FONT_DIR = ROOT / "gfx" / "font"

# PC tile index -> pret french_german tile index
PRET_COPY = {
    0x41: 0x42,  # Ü <- pret Ü ($c2)
    0x49: 0x4F,  # ß <- pret ß (tile 79)
    0x4A: 0x43,  # ä <- pret ä ($c3)
    0x4C: 0x45,  # ü <- pret ü ($c5)
    0x4D: 0x44,  # ö <- pret ö ($c4)
    0x4E: 0x40,  # Ä <- pret Ä ($c0)
    0x4F: 0x41,  # Ö <- pret Ö ($c1)
}

# Base letter tile indices (char - 0x80)
BASE_LOWER = {"ä": 0x20, "ö": 0x2E, "ü": 0x34}  # a, o, u
BASE_UPPER = {"Ä": 0x00, "Ö": 0x0E, "Ü": 0x14}  # A, O, U

TYPEFACE_FONTS = [
    "normal.png",
    "narrow.png",
    "bold.png",
    "italic.png",
    "serif.png",
    "micr.png",
    "chicago.png",
    "vwf.png",  # variable-width font (map names etc.)
]

INK = 0
PAPER = 255


def load_pret_reference() -> Image.Image:
    url = "https://raw.githubusercontent.com/pret/pokecrystal/master/gfx/font/french_german.png"
    data = urllib.request.urlopen(url, timeout=30).read()
    return Image.open(BytesIO(data)).convert("L")


def tile_index_to_box(idx: int) -> tuple[int, int, int, int]:
    col, row = idx % 16, idx // 16
    return col * 8, row * 8, col * 8 + 8, row * 8 + 8


def get_tile(img: Image.Image, idx: int) -> Image.Image:
    return img.crop(tile_index_to_box(idx))


def set_tile(img: Image.Image, idx: int, tile: Image.Image) -> None:
    img.paste(tile, tile_index_to_box(idx)[:2])


def tile_pixels(tile: Image.Image) -> list[list[int]]:
    px = tile.load()
    return [[px[x, y] for x in range(8)] for y in range(8)]


def from_pixels(rows: list[list[int]]) -> Image.Image:
    tile = Image.new("L", (8, 8), PAPER)
    px = tile.load()
    for y, row in enumerate(rows):
        for x, v in enumerate(row):
            px[x, y] = v
    return tile


def shift_down(rows: list[list[int]], n: int = 1, fill: int = PAPER) -> list[list[int]]:
    out = [[fill] * 8 for _ in range(8)]
    for y in range(8 - n):
        out[y + n] = rows[y][:]
    return out


def add_lower_umlaut_dots(rows: list[list[int]]) -> list[list[int]]:
    out = [r[:] for r in rows]
    for x in (2, 4):
        out[0][x] = INK
    return out


def add_upper_umlaut_dots(rows: list[list[int]]) -> list[list[int]]:
    """Match pret style: two-dot umlaut uses rows 0-1 above shifted letter."""
    shifted = shift_down(rows, 2)
    for x in (2, 4):
        shifted[0][x] = INK
    # Small connectors like official font (pret Ä/Ö/Ü)
    shifted[1][2] = INK
    shifted[1][4] = INK
    return shifted


def make_esszet_from_s(rows_s: list[list[int]]) -> list[list[int]]:
    """ß based on s with long-tail shape (fallback when no pret tile)."""
    out = [[PAPER] * 8 for _ in range(8)]
    # Top bowl
    for x in range(2, 6):
        out[2][x] = INK
    for x in range(1, 6):
        out[3][x] = INK
    out[4][1] = INK
    out[4][5] = INK
    for x in range(2, 6):
        out[5][x] = INK
    # Descender / z-like hook
    out[6][5] = INK
    out[6][6] = INK
    out[7][4] = INK
    out[7][5] = INK
    out[7][6] = INK
    return out


def apply_generated_glyphs(img: Image.Image, pret: Image.Image | None) -> None:
    px = img.load()

    for dst, src in PRET_COPY.items():
        if pret is not None:
            set_tile(img, dst, get_tile(pret, src))
            continue

    # Generated per-font (if no pret)
    for ch, base_idx in BASE_LOWER.items():
        dst = {"ä": 0x4A, "ö": 0x4D, "ü": 0x4C}[ch]
        base = tile_pixels(get_tile(img, base_idx))
        set_tile(img, dst, from_pixels(add_lower_umlaut_dots(base)))

    for ch, base_idx in BASE_UPPER.items():
        dst = {"Ä": 0x4E, "Ö": 0x4F, "Ü": 0x41}[ch]
        base = tile_pixels(get_tile(img, base_idx))
        set_tile(img, dst, from_pixels(add_upper_umlaut_dots(base)))

    if pret is not None:
        set_tile(img, 0x49, get_tile(pret, 0x4F))
    else:
        s_rows = tile_pixels(get_tile(img, 0x32))
        set_tile(img, 0x49, from_pixels(make_esszet_from_s(s_rows)))


def apply_hybrid_glyphs(img: Image.Image, pret: Image.Image) -> None:
    """Use pret glyphs as umlaut templates, re-base lowercase on each font's letters."""
    # Uppercase: copy pret glyphs directly (best match to official Crystal)
    for dst, src in ((0x41, 0x42), (0x4E, 0x40), (0x4F, 0x41)):
        pret_tile = tile_pixels(get_tile(pret, src))
        base_idx = {0x41: 0x14, 0x4E: 0x00, 0x4F: 0x0E}[dst]
        base = tile_pixels(get_tile(img, base_idx))
        # Merge: pret umlaut header (rows 0-2) + font body from row 2+
        merged = [[PAPER] * 8 for _ in range(8)]
        for y in range(8):
            for x in range(8):
                if y <= 2 and pret_tile[y][x] == INK:
                    merged[y][x] = INK
                elif y >= 2 and base[y][x] == INK:
                    merged[y][x] = INK
        set_tile(img, dst, from_pixels(merged))

    # Lowercase: pret umlaut dots on font base letter
    for dst, src, base_idx in (
        (0x4A, 0x43, 0x20),
        (0x4D, 0x44, 0x2E),
        (0x4C, 0x45, 0x34),
    ):
        pret_tile = tile_pixels(get_tile(pret, src))
        base = tile_pixels(get_tile(img, base_idx))
        merged = [row[:] for row in base]
        for y in range(2):
            for x in range(8):
                if pret_tile[y][x] == INK:
                    merged[y][x] = INK
        set_tile(img, dst, from_pixels(merged))

    # ß: use pret tile, but thicken to match font weight from local s
    pret_esz = tile_pixels(get_tile(pret, 0x4F))
    local_s = tile_pixels(get_tile(img, 0x32))
    merged = [row[:] for row in pret_esz]
    # If font is very light, keep pret; else blend descender from pret only
    set_tile(img, 0x49, from_pixels(merged))


def process_font(path: Path, pret: Image.Image) -> None:
    img = Image.open(path).convert("L")
    if path.name == "normal.png":
        # Normal font: direct pret glyphs (official reference)
        for dst, src in PRET_COPY.items():
            set_tile(img, dst, get_tile(pret, src))
    else:
        apply_hybrid_glyphs(img, pret)
    img.save(path)
    print(f"Updated {path.name}")


def main() -> None:
    pret = load_pret_reference()
    for name in TYPEFACE_FONTS:
        path = FONT_DIR / name
        if not path.exists():
            print(f"Skip missing {name}")
            continue
        process_font(path, pret)
    print("Done. Rebuild with: make gfx/font/normal.1bpp (etc.)")


if __name__ == "__main__":
    main()