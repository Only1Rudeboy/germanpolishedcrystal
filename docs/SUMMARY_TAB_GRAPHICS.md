# Status-Screen-Reiter (Summary Tabs) — manuell bearbeiten

Die Reiter-Texte (**EP / Fähig. / Item / Att. / Gefund. / Ei**) sind **Pixel-Grafik**, kein Script-Text.

## Dateien (pure-DE-Repo)

Basisordner:
```
C:\Users\Rudeboy\Desktop\pokemon polierter kristall\polishedcrystal-master\polishedcrystal-master\
```

| Datei | Rolle |
|---|---|
| `gfx\stats\summary_sprites.png` | **Hauptquelle** – hier zeichnen (32×80 px) |
| `gfx\stats\summary_sprites.png.bak` | Backup der originalen EN-Grafik |
| `gfx\stats\summary_sprites.2bpp` | Build-Zwischenschritt (gitignore, wird erzeugt) |
| `gfx\stats\summary_sprites.2bpp.lzp` | Komprimiert, wird von der Engine geladen (gitignore) |
| `gfx\stats\summary_sprites.pal` | Palette (nicht der Text selbst) |
| `gfx\misc.asm` | `INCBIN "gfx/stats/summary_sprites.2bpp.lzp"` |
| `constants\summary_constants.asm` | Tile-IDs der Reiter-Titel |
| `engine\pokemon\summary\*.asm` | Welcher Reiter welche Tile-ID nutzt |
| `tools\_de_summary_tabs.py` | Optional: Generator-Skript |
| `tools\_tab_*.png` | Vergrößerte Vorschauen (nur Kontrolle) |

## Shiny-Arbeitskopie (gleiche Dateien kopieren)

```
C:\Users\Rudeboy\Desktop\germanpolishedcrystal-ARBEITSKOPIE\
```
mindestens:
```
gfx\stats\summary_sprites.png
gfx\stats\summary_sprites.2bpp
gfx\stats\summary_sprites.2bpp.lzp
```

## Aufbau von `summary_sprites.png`

- **Größe:** 32×80 Pixel  
- **Tiles:** 4×10 Stück à 8×8  
- **Farbe:** 4 Graustufen (Text = dunkelgrau 85, Hintergrund weiß 255)  
- **Zeilen (je 8 px hoch = 1 Reiter-Zeile):**

| Zeile (Y) | Inhalt (ca.) | Tab-Label |
|---|---|---|
| 0 | UI-Kästchen | — |
| 1 | A→INFO | — |
| **2** | **EP** | Exp / EP |
| **3** | **Fähig.** | Ability |
| **4** | **Item** | Item (meist Original belassen) |
| **5** | **Att.** | Move |
| **6** | **Gefund.** | Met / Fundort |
| **7** | **Ei** | Egg |
| 8–9 | Pfeile | — |

Jeder Titel ist **max. 32 px breit** (4 Tiles), horizontal zentriert in der Zeile.

## Tile-IDs im Code

`constants/summary_constants.asm`:
```
SUMMARY_TILE_OAM_EXP_TITLE      ; Zeile 2 → EP
SUMMARY_TILE_OAM_ABILITY_TITLE  ; Zeile 3 → Fähig.
SUMMARY_TILE_OAM_ITEM_TITLE     ; Zeile 4 → Item
SUMMARY_TILE_OAM_MOVE_TITLE     ; Zeile 5 → Att.
SUMMARY_TILE_OAM_MET_TITLE      ; Zeile 6 → Gefund.
SUMMARY_TILE_OAM_EGG_TITLE      ; Zeile 7 → Ei
```

## Nach manueller PNG-Änderung → ROM neu bauen

Im Projektordner (mit `rgbds\*.exe`):

```bat
rgbds\rgbgfx.exe -o gfx\stats\summary_sprites.2bpp gfx\stats\summary_sprites.png
tools\lzpcompress.exe gfx\stats\summary_sprites.2bpp gfx\stats\summary_sprites.2bpp.lzp
```

Dann normal `make` (Windows-rgbds im PATH setzen wie üblich).

Shiny-Kopie: dieselben drei Dateien (`.png` / `.2bpp` / `.2bpp.lzp`) nach  
`germanpolishedcrystal-ARBEITSKOPIE\gfx\stats\` kopieren und dort bauen.

## Tipps zum Zeichnen

- Editor: **Aseprite**, **GraphicsGale**, **GIMP** (Indexfarbe / 4 Farben)  
- Stift **1 px**, kein Anti-Alias  
- Umlaute (ä) bei 8 px Höhe: besser **Ä** (A + zwei Punkte) als kleines ä  
- Nach dem Speichern immer **2bpp + lzp** neu erzeugen, sonst ändert sich die ROM nicht  
