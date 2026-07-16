# Nächster Dump-Batch (Merker)

**Nach Early-Game-QC (ROM 023+):** hier weitermachen.

## Geplanter 5×-Block
1. **Indigo / Liga** – TOP VIER, Champ **ROT**, Indigo Plateau
2. **Kanto-Start** – **ORANIA** (Pallet), **VERTANIA** (Viridian), Lab EICH, Route 1–2
3. **M.S. AQUA** – Schiff, Passagiere, Sabrina-related if any
4. **Mt. Silver** – Mt. Silver exterior/interior, ROT-Kampf

## Nicht vergessen
- Dump-Quelle: `tools/_gsc_de_crystal_msg.txt`
- Regeln: ≤18, CAPS Orte, `<PLAYER>` nie `<PLAY_G>`, kein `;` in Text
- Badge-Kurznamen Johto bereits: Flügel/Insekt/Basis/Phantom/Stahl/Faust/Gletscher/Drache
- Kanto-Orden Dump: FELS/QUELL/DONNER/REGENBOGEN/SEELEN/SUMPF/VULKAN/ERDE

## Early-Game QC-Stand
- Strukturell OK (kein PLAY_G, kein over18 in early maps scanner)
- Fixes: Zephyr-Abzeichen→FLÜGELORDEN (Viola-Haus); Route23 alle EN-Badge-Strings→DE
- Residual: ElmsLab & frühe Routen oft `#mon` statt Dump `#MON` (Stil, kein Crash)
