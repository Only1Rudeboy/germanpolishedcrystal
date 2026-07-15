# Species QC (strict EN leftovers)

**Total real EN leftovers: 2**
**Move name overflow (>12): 0**

## `data/pokemon/names.asm` — EN leftovers: 0
- (none)

## `data/pokemon/dex_entries.asm` — EN leftovers: 1
- L206: Habitat zu be-

## `data/moves/names.asm` — EN leftovers: 0
- (none)

## `data/moves/descriptions.asm` — EN leftovers: 1
- L1091: Geister-Pokémon.

## `data/abilities/names.asm` — EN leftovers: 0
- (none)

## `data/abilities/descriptions.asm` — EN leftovers: 0
- (none)

## `data/natures.asm` — EN leftovers: 0
- (none)

## `data/characteristics.asm` — EN leftovers: 0
- (none)

## `data/types/names.asm` — EN leftovers: 0
- (none)

## `data/items/names.asm` — EN leftovers: 0
- (none)

## `data/items/key_names.asm` — EN leftovers: 0
- (none)

## `data/items/descriptions.asm` — EN leftovers: 0
- (none)

## Move names >12 chars: 0
- (none)

## Pokemon names: 290
- first5: BISASAM, BISAKNOSP, BISAFLOR, GLUMANDA, GLUTEXO
- mid5: LAVADOS, DRATINI, DRAGONIR, DRAGORAN, MEWTU
- last5: MYRIADOR, DUMMIMISEL, FARIGIRAF, SUELORD, EPITAFF
- EN starter leftovers: none

## Dex vs GSC-DE sanity
- OK: BISASAM Samen
- OK: GLUMANDA Echse
- OK: German next/page structure
- OK: no common EN seed text
- OK: no 'This Pokemon'

## Natures (Wesen)
- Robust, Solo, Mutig, Hart, Frech, Kühn, Sanft, Locker, Pfiffig, Lasch, Scheu, Hastig, Ernst, Froh, Naiv, Mäßig, Mild, Still, Zaghaft, Hitzig, Ruhig, Zart, Forsch, Sorgfalt, Kauzig

## Ability name samples
- first10: Duftnote, Niesel, Temposchub, Kampfpanzer, Robustheit, Feuchtigkeit, Flexibilität, Sandschleier, Statik, Voltabsorber
- last10: Affenfokus, Reaktionsgas, Pastellhülle, Schnellschuss, Windreiter, Wiederkäuer, Scharfkantig, Schweifrüstung, Geistiges Auge, Endland

## Status summary
| Area | Status |
|---|---|
| Pokemon-Namen (DE GSC, CAPS) | DONE |
| Pokédex-Einträge | DONE (Crystal DE + spätere Gen DE-Stil) |
| Attacken-Namen (≤12) | DONE |
| Attacken-Beschreibungen | DONE (DE) |
| Fähigkeiten-Namen | DONE (DE/official) |
| Fähigkeiten-Beschreibungen | DONE (DE) |
| Wesen (Natures) | DONE (Robust/Solo/…) |
| Charakteristika | DONE (DE) |
| Typen | DONE (Normal/Kampf/…) |
| Items Namen+Desc | DONE (prior work) |

**Verdict: already GSC-canon DE for these data tables. No further patches required.**

Notes on the 2 “EN leftovers” above: false positives only
(`Habitat` = DE loanword, `Pokémon` = DE spelling).  
Dex categories with trailing `.` (e.g. `Doppelstoß.`, `Magnetgebi.`) are
length-limited abbreviations, not English leftovers.
