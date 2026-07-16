# GSC-DE Dump – Liga / Kanto-Start / M.S. Aqua / Mt. Silver (5×)

## Projekt
`C:\Users\Rudeboy\Desktop\pokemon polierter kristall\polishedcrystal-master\polishedcrystal-master`

## Dump
- `tools/_gsc_de_crystal_msg.txt` (UTF-8)
- Extrakt: `tools/gsc_canon_setup/_dump_league_kanto_extract.txt`
- Index: `tools/gsc_canon_setup/_dump_league_kanto_index.txt`

## Regeln (Qualität)
1. TEXTBOX **18**; `#MON`/`#BALL`/`#DEX`/`#COM` = **7**; `<PLAYER>` = **7**
2. **Niemals** `<PLAY_G>` (unmapped!) → immer `<PLAYER>`
3. **Kein** `;` in Textstrings
4. **A** = Dump 1:1 · **B** = PC+Dump · **C** = PC-only DE + CAPS
5. CAPS: `INDIGO PLATEAU`, `ORANIA CITY`, `VERTANIA CITY`, `ALABASTIA`, `TOP VIER`, `#MON LIGA`, `SIEGESSTRASSE`, `M.S. AQUA`, `SILBERBERG`, `PROF. EICH`, `WILLI`, `KOGA`, `BRUNO`, `MELANIE`, `SIEGFRIED`, `ROT`, `BLAU`
6. `; GSC-DE Dump` an geänderten Dump-Blöcken
7. Nur zugewiesene Dateien. Kein make/git.
8. PC-Reihenfolge TOP VIER kann WILLI → KOGA → BRUNO → MELANIE → SIEGFRIED sein (PC); Dump-Texte pro Person mappen, nicht Räume vertauschen.
9. Engine-Labels unbenennen lassen (WillsRoom etc.).

## Wichtige Dump-Anker
- TOP VIER intro WILLI ~5505+, BRUNO ~5511, MELANIE ~5514, EICH nach Liga ~5521
- M.S. AQUA ~2791–2920
- VERTANIA Schilder ~6991–6993
- ORANIA ~7030–7043 (Vermilion harbor is ORANIA in DE Crystal)
- ROUTE 26 ~6799, SIEGESSTRASSE ~3074, 6786
- SILBERBERG ~3632
- FELSORDEN etc. Kanto gyms later if in scope

## PC-Hinweis
- Pallet = ORANIA in DE dump is actually Vermilion for harbor; Pallet Town DE = ALABASTIA
- Confirm landmarks: ALABASTIA=Pallet, VERTANIA=Viridian, ORANIA=Vermilion
- Reds house / Oak lab in ALABASTIA
