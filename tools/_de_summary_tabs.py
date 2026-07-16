# -*- coding: utf-8 -*-
"""
Redraw summary tab titles (Exp/Ability/Item/Move/Met/Egg) in GSC-DE.
Reuses pixel glyphs from the original English sheet for consistent style.
"""
from pathlib import Path
from PIL import Image

ROOT = Path(__file__).resolve().parents[1]
PNG = ROOT / "gfx" / "stats" / "summary_sprites.png"
BAK = ROOT / "gfx" / "stats" / "summary_sprites.png.bak"

W, LG, DG, BLK = 255, 170, 85, 0


def load_row(im: Image.Image, row: int):
    return [[im.getpixel((x, row * 8 + y)) for x in range(32)] for y in range(8)]


def crop_glyph(row_px, x0, x1):
    """Crop columns [x0, x1) from an 8x32 row; trim empty columns."""
    cols = list(range(x0, x1))
    # trim left/right empty (only W)
    while cols and all(row_px[y][cols[0]] == W for y in range(8)):
        cols.pop(0)
    while cols and all(row_px[y][cols[-1]] == W for y in range(8)):
        cols.pop()
    if not cols:
        return [[W] for _ in range(8)]
    return [[row_px[y][x] for x in cols] for y in range(8)]


def build_font(bak: Image.Image):
    """Pull letters from original English labels."""
    exp = load_row(bak, 2)       # Exp.
    abi = load_row(bak, 3)       # Ability
    itm = load_row(bak, 4)       # Item
    mov = load_row(bak, 5)       # Move
    met = load_row(bak, 6)       # Met
    egg = load_row(bak, 7)       # Egg

    # Manual column ranges from visual inspection of original sheet
    g = {}
    # Exp.: E x:4-7, p:10-13? actually "Exp." E=4-7, x≈9-12, p≈13-16, .=17-18
    # Better: use multiple sources
    # Ability: A(4-7) b(9-12) i(14-15) l(17-18) i(20-21) t(23-25) y(27-30)
    g["A"] = crop_glyph(abi, 4, 8)
    g["b"] = crop_glyph(abi, 9, 13)
    g["i"] = crop_glyph(abi, 14, 16)
    g["l"] = crop_glyph(abi, 17, 19)
    g["t"] = crop_glyph(abi, 23, 26)
    g["y"] = crop_glyph(abi, 27, 32)

    # Item: I(7-9) t(11-13) e(15-18) m(20-26)
    g["I"] = crop_glyph(itm, 7, 10)
    g["e"] = crop_glyph(itm, 15, 19)
    g["m"] = crop_glyph(itm, 20, 27)

    # Move: M(6-10) o(12-16) v(17-21) e(22-26)
    g["M"] = crop_glyph(mov, 6, 11)
    g["o"] = crop_glyph(mov, 12, 16)
    g["v"] = crop_glyph(mov, 17, 21)

    # Met: M, e, t already
    g["E"] = crop_glyph(egg, 9, 13)  # E from Egg
    g["g"] = crop_glyph(egg, 15, 19)
    # second g of Egg
    g["."] = crop_glyph(exp, 24, 27) if False else None

    # Exp. for E, x, p, .
    # Exp row: E(9-12) x(14-17) p(19-22) .(24-25) and trailing
    g["E"] = crop_glyph(exp, 9, 13)
    g["x"] = crop_glyph(exp, 14, 18)
    g["p"] = crop_glyph(exp, 19, 23)
    g["."] = crop_glyph(exp, 24, 26)

    # Met: M(9-13) e(15-19) t(21-24)
    g["M"] = crop_glyph(met, 9, 14)
    g["e"] = crop_glyph(met, 15, 19)
    g["t"] = crop_glyph(met, 21, 25)

    # Egg: E(9-12) g(14-18) g(20-24)
    g["g"] = crop_glyph(egg, 14, 19)

    # Item I again
    g["I"] = crop_glyph(itm, 7, 10)
    g["m"] = crop_glyph(itm, 20, 27)

    # Ability lowercase bits
    g["a"] = None  # craft from A scaled? use custom
    g["r"] = crop_glyph(abi, 9, 13)  # wrong

    # Build a few missing glyphs by hand in same 85-ink style
    def px(*rows):
        # rows are strings with # = DG; pad to 8 tall, 1px top margin
        width = max(len(r) for r in rows)
        out = [[W] * width for _ in range(8)]
        for y, line in enumerate(rows):
            yy = y + 1
            if yy >= 8:
                break
            for x, c in enumerate(line):
                if c == "#":
                    out[yy][x] = DG
        return out

    # Fill any missing needed for DE words
    g["P"] = px(
        "### ",
        "#  #",
        "### ",
        "#   ",
        "#   ",
        "#   ",
    )
    g["F"] = px(
        "####",
        "#   ",
        "### ",
        "#   ",
        "#   ",
        "#   ",
    )
    g["ä"] = px(
        "# #",
        "   ",
        " ##",
        "#  #",
        " ###",
        "#  #",
    )
    g["h"] = px(
        "#  ",
        "#  ",
        "## ",
        "# #",
        "# #",
        "# #",
    )
    g["n"] = px(
        "   ",
        "   ",
        "## ",
        "# #",
        "# #",
        "# #",
    )
    g["r"] = px(
        "  ",
        "  ",
        "##",
        "# ",
        "# ",
        "# ",
    )
    g["O"] = px(
        " ## ",
        "#  #",
        "#  #",
        "#  #",
        "#  #",
        " ## ",
    )
    g["u"] = px(
        "   ",
        "   ",
        "# #",
        "# #",
        "# #",
        " ##",
    )
    g["A"] = crop_glyph(abi, 4, 8)
    g["t"] = crop_glyph(met, 21, 25)
    g["i"] = crop_glyph(abi, 14, 16)
    # lowercase a for Att. if needed - use from nowhere: craft
    g["a"] = px(
        "   ",
        " ##",
        "  #",
        " ##",
        "# #",
        " ##",
    )
    # space
    g[" "] = [[W], [W], [W], [W], [W], [W], [W], [W]]

    return g


def measure(font, text, gap=1):
    return sum(len(font[c][0]) for c in text) + gap * max(0, len(text) - 1)


def blit(im, font, text, row, gap=1):
    w = measure(font, text, gap)
    while w > 32 and gap > 0:
        gap -= 1
        w = measure(font, text, gap)
    if w > 32:
        raise SystemExit(f"too wide: {text!r} = {w}px")
    x0 = (32 - w) // 2
    y0 = row * 8
    # clear
    for y in range(8):
        for x in range(32):
            im.putpixel((x, y0 + y), W)
    x = x0
    for ch in text:
        if ch not in font or font[ch] is None:
            raise SystemExit(f"missing glyph {ch!r}")
        g = font[ch]
        gw = len(g[0])
        for yy in range(8):
            for xx in range(gw):
                v = g[yy][xx]
                if v != W:
                    im.putpixel((x + xx, y0 + yy), v)
        x += gw + gap


def main():
    if not BAK.exists():
        BAK.write_bytes(PNG.read_bytes())
    bak = Image.open(BAK).convert("L")
    im = bak.copy()
    font = build_font(bak)

    # Row 2 Exp. → EP
    blit(im, font, "EP", 2, gap=1)
    # Row 3 Ability → Fähig.  (Fähigkeit kurz)
    blit(im, font, "Fähig.", 3, gap=1)
    # Row 4 Item → Item
    blit(im, font, "Item", 4, gap=1)
    # Row 5 Move → Att.
    blit(im, font, "Att.", 5, gap=1)
    # Row 6 Met → Ort
    blit(im, font, "Ort", 6, gap=1)
    # Row 7 Egg → Ei
    blit(im, font, "Ei", 7, gap=1)

    im.save(PNG)
    print("saved", PNG)

    # preview
    big = im.resize((32 * 10, 80 * 10), Image.NEAREST)
    out = Image.new("RGB", big.size, (255, 255, 255))
    for y in range(big.height):
        for x in range(big.width):
            v = big.getpixel((x, y))
            c = 255 if v > 200 else (40 if v < 100 else 90)
            out.putpixel((x, y), (c, c, c))
    prev = ROOT / "tools" / "_summary_tabs_de_preview.png"
    out.save(prev)
    print("preview", prev)

    # ASCII check
    for row in range(2, 8):
        print(f"--- row {row} ---")
        for y in range(8):
            line = ""
            for x in range(32):
                v = im.getpixel((x, row * 8 + y))
                line += "#" if v < 100 else ("." if v < 200 else " ")
            print(line)


if __name__ == "__main__":
    main()
