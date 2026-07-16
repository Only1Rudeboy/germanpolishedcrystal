# Rand-56 Dateien – erledigt

**Datum:** 2026-07-15  
**ROM:** `polishedcrystal-3.2.3-rim56.gbc`  
**MD5:** `A82784C0B714D4B241E8117C90A512CE`  
**Rim-QC:** EN=0, over18=0 (`tools/qc_rim_scan.py`)

## Bereits DE (nur geprüft, kein Rewrite)

| Bereich | Status |
|---------|--------|
| data/options/* | Namen + Beschreibungen DE |
| data/battle_tower/trainer_text.asm | DE |
| data/types/names.asm | DE |
| data/abilities names+desc | DE |
| data/natures.asm | DE |
| data/characteristics.asm | DE |
| data/mon_menu.asm | DE |
| data/events/badge_names.asm | DE Canon |
| data/pc/theme_names.asm | DE (frühere QC) |
| data/decorations/names.asm | DE |
| data/phone/text/* | bereits clean |

## Neu gefixt in dieser Runde

| Datei | Änderung |
|-------|----------|
| `data/events/elevator_floors.asm` | B4F→B4S … Roof→**Dach** |
| `data/phone/non_trainer_names.asm` | Disc Jockey→**Moderatorin** |
| `data/pc/bad_egg.asm` | Bad Egg→**Böse-Ei** |
| `data/credits_strings.asm` | Crystal Version→**Kristall-Version** |
| `data/pokedex_bio.asm` | Wachstums-/Schlüpf-Raten + Körperfarben DE |
| `data/player/default_names.asm` | Enby/Beta Defaults: Alex, Max |

## Bewusst EN gelassen

| Bereich | Grund |
|---------|--------|
| music_player Songtitel | Metadaten / Originaltitel |
| battle_tower Trainer-Vornamen | generierte Charakternamen |
| wonder_trade OT-Namen | Fan-Flavor (Red, Gold, …) |
| Ability-Lehnwörter (Download, Filter, …) | wie offizielle DE-Spiele |

## Nächster Schritt

In-Game-Playtest (Optionen, Aufzug, Dex-Bio, Credits, Bad Egg, Phone-Buena).
