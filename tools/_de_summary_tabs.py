# -*- coding: utf-8 -*-
"""Pixel-perfect DE summary tab titles — fixed baseline, clean glyphs."""
from pathlib import Path

from PIL import Image

ROOT = Path(__file__).resolve().parents[1]
BAK = ROOT / "gfx" / "stats" / "summary_sprites.png.bak"
PNG = ROOT / "gfx" / "stats" / "summary_sprites.png"
W, DG = 255, 85


def merge_letters(letters: list[list[str]], gap: int = 1) -> list[str]:
    rows = [""] * 8
    for li, let in enumerate(letters):
        assert len(let) == 8, li
        w = len(let[0])
        assert all(len(r) == w for r in let), li
        if li:
            for y in range(8):
                rows[y] += " " * gap
        for y in range(8):
            rows[y] += let[y]
    return rows


def paint_row(im: Image.Image, row: int, art: list[str]) -> None:
    assert len(art) == 8
    width = max(len(r) for r in art)
    assert width <= 32, width
    x0 = (32 - width) // 2
    y0 = row * 8
    for y in range(8):
        for x in range(32):
            im.putpixel((x, y0 + y), W)
        line = art[y].ljust(width)
        for i, c in enumerate(line):
            if c == "#":
                im.putpixel((x0 + i, y0 + y), DG)


def copy_row(im: Image.Image, bak: Image.Image, row: int) -> None:
    y0 = row * 8
    for y in range(8):
        for x in range(32):
            im.putpixel((x, y0 + y), bak.getpixel((x, y0 + y)))


def L(*body6: str, desc: str | None = None) -> list[str]:
    """6 body rows (+ optional descender row) → 8-row glyph, equal width."""
    w = max(len(r) for r in body6)
    rows = []
    for r in body6:
        rows.append(r.ljust(w))
    while len(rows) < 6:
        rows.append(" " * w)
    rows = rows[:6]
    rows.append((desc or "").ljust(w)[:w] if desc else " " * w)
    rows.append(" " * w)
    return rows


def main() -> None:
    bak = Image.open(BAK).convert("L")
    im = bak.copy()

    # --- Letter library (Exp./Ability style, baseline y0–5) ---
    E = L("####", "#   ", "### ", "#   ", "#   ", "####")
    P = L("### ", "#  #", "### ", "#   ", "#   ", "#   ")
    F = L("####", "#   ", "### ", "#   ", "#   ", "#   ")
    # ä: two solid dots on row0, a-body like Item's e
    AE = L("# # ", "    ", " ## ", "#  #", "#  #", " ###")
    H = L("#  ", "#  ", "## ", "# #", "# #", "# #")
    I = L("#", " ", "#", "#", "#", "#")
    # g with descender (Egg style)
    G = L("     ", "     ", " ### ", "#   #", " ### ", "    #", desc=" ### ")
    DOT = L(" ", " ", " ", " ", " ", "#")
    A = L(" ## ", "#  #", "#  #", "####", "#  #", "#  #")
    T = L(" #  ", "### ", " #  ", " #  ", " #  ", " ## ")
    O = L(" ## ", "#  #", "#  #", "#  #", "#  #", " ## ")
    R = L("   ", "   ", "## ", "# #", "#  ", "#  ")

    # EP
    paint_row(im, 2, merge_letters([E, P], gap=1))
    # Fähig.
    fahig = merge_letters([F, AE, H, I, G, DOT], gap=1)
    print("Fähig width", len(fahig[0]))
    assert len(fahig[0]) <= 32, len(fahig[0])
    paint_row(im, 3, fahig)
    # Item original
    copy_row(im, bak, 4)
    # Att.
    paint_row(im, 5, merge_letters([A, T, T, DOT], gap=1))
    # Ort
    paint_row(im, 6, merge_letters([O, R, T], gap=1))
    # Ei
    paint_row(im, 7, merge_letters([E, I], gap=1))

    im.save(PNG)
    print("saved", PNG)

    for row in range(2, 8):
        print(f"=== {row} ===")
        for y in range(8):
            print(
                "".join(
                    "#" if im.getpixel((x, row * 8 + y)) == DG else " "
                    for x in range(32)
                )
            )

    big = im.resize((32 * 16, 80 * 16), Image.NEAREST)
    out = Image.new("RGB", big.size, (255, 255, 255))
    for y in range(big.height):
        for x in range(big.width):
            v = big.getpixel((x, y))
            out.putpixel((x, y), (0, 0, 0) if v < 128 else (255, 255, 255))
    prev = ROOT / "tools" / "_summary_tabs_de_preview.png"
    out.save(prev)
    print("preview", prev)


if __name__ == "__main__":
    main()
