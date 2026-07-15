# Rest-Pass Report (extreme residual) — DONE

## Scope
Targeted GSC-canon system phrases + last CAPS/width nits after Batches 0–6 + species QC.

## Patches applied

### System: `fand` → `findet` (item found)
| File | Change |
|---|---|
| `maps/CeruleanGym.asm` | `<PLAYER> findet` Maschinenteil |
| `maps/HiddenTreeGrotto.asm` | `<PLAYER> findet` + fix dead text after early `done` |
| `maps/LakeOfRage.asm` | `<PLAYER> findet` / Rote Schuppe (reflow width) |
| `maps/LuckyIsland.asm` | `<PLAYER> findet` Glücks-Ei |
| `maps/MystriStage.asm` | `<PLAYER> findet` + reflow Ei |
| `maps/YellowForest.asm` | `<PLAYER> findet` Surf-Pikachu |

### System: `erhielt` → `erhält` (item/gift received)
| File | Change |
|---|---|
| `maps/CeladonGameCorner.asm` | `<PLAYER> erhält` / 18 Münzen |
| `maps/CeladonMansion3F.asm` | `<PLAYER> erhält` Diplom |
| `maps/EusinesHouse.asm` | `<PLAYER> erhält` Abra-Puppe |
| `maps/RuinsOfAlphResearchCenter.asm` | `<PLAYER> erhält` ICOGNITO-Puppe |
| `data/text/common.asm` `_FoundWingsText` | `<PLAYER> erhält` |
| `data/text/common.asm` `Text_Gained` | ` erhält@` (EP, matches Crystal dump) |

### Place CAPS
| File | Change |
|---|---|
| `maps/SilphCo3F.asm` | `Azalea City` → `AZALEA CITY` |

### Width
| File | Change |
|---|---|
| `data/battle_tower/trainer_text.asm` | `Toll! Bist du jetzt` → split ≤18 |

## Intentionally left (correct narrative / non-UI)
- NPC past tense: „Ich fand…“, „die ich fand“, DayCare „Ich erhielt…“ (matches Crystal dump)
- UnionCave: „in dieser Höhle fand!“ (NPC story)
- Dex / phone narrative uses of fand
- Credits strings >18 (proper names / roles; different UI width)
- Backup folders (`maps_backup_*`) — not in build

## Post-pass QC
| Check | Result |
|---|---|
| Maps EN | 0 |
| Maps width>18 | 0 |
| Maps place mixed EN | 0 |
| `#mon-ARENA` | 0 |
| Phone EN/width | 0 |
| Common EN/width | 0 |
| SYS `<PLAYER> fand/erhielt` live | **0** |
| Glossary findet / erhält | 23 / 44 (up from prior) |
| Residual fand / erhielt | narrative only |

## ROM build
| | |
|---|---|
| Build | **3.2.3.008** |
| Desktop | `polishedcrystal-3.2.3.008.gbc` |
| Latest | `polishedcrystal-3.2.3-latest.gbc` |
| MD5 | `AA6789CC80C1658DBC9DEAF502315839` |
| Free space | ~49.47% (bankends OK) |

## Result: **DONE**
