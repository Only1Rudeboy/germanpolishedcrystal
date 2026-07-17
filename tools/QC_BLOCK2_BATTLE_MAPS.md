# Block 2: Battle-Rest + Maps CAPS (2026-07-17)

## Method
- 2 explore subagents (battle remaining, maps place CAPS)
- Local pattern scans + GSC dump cross-check
- Overflow-safe layouts (Gegn. NAME alone on line)

## Battle fixes (data/text/battle.asm)
| Area | GSC now |
|------|---------|
| LightScreen/Reflect effect | SPEZ. VER / VERT steigt |
| Screen fade | LICHTSCHILD / REFLEKTOR / BODYGUARD schwindet |
| Mist | WEISSNEBEL umgeben/schützt/schwindet |
| Safeguard | BODYGUARD beschützt / verschleiert |
| Belly Drum | ANGRIFFS-WERT erhöhen |
| Transform | ben. VERWANDLER / Typ-#MON |
| Perish | werden in 3 Runden K.O. gehen |
| Protect hit | Der Schutz wendet Schaden ab |
| Disable suite | blockiert / BLOCKIERT |
| Item activate | USERs ITEM aktiviert |
| Wild bait | Wildes NAME frisst/wütend |
| Level-up | erreicht LV N |
| Encore end | ZUGABE hört auf |
| Stat caps | steigt/sinkt nicht mehr |
| Future Sight | SEHER erfasst / schlug fehl |
| Haze | Statusänderungen aufgehoben |
| **SubTookDamage** | **nimmt Schaden für** (was broken) |
| Brick Break | LICHTSCHILD/REFLEKTOR CAPS |
| Charge item | pumpt sich auf |

## Maps CAPS / species (20+ files)
- DUKATIA / VIOLA / NEUBORKIA / #MON-CENTER / Profi-Tipps
- TAUBOGA, ICOGNITO, URSARING, ENTEI, CELEBI, SUICUNE, KNOFENSA
- ARENALEITER/IN journals
- SYMPABÄLLE / TURBOBÄLLE
- VIOLA-FRIEDHOF, ANEMONIA-Apotheke, #COM CENTER
- Labels/identifiers left as English (PIDGEOTTO const)

## Not in this block
- Final-mon slang (Comeback, Yeehah)
- Full Kanto place sweep
- Move names Egelsamen Title Case in moves/names.asm
