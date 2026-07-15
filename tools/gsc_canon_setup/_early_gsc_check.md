# Early game GSC-DE check (post ROM 011)

## ROM 011
- `Desktop\polishedcrystal-3.2.3.011.gbc`
- MD5: `D2BFE0DC0B48A5A7A1DF92CA603E002F` (pre mom/newbark polish if rebuilt later)

## Sections reviewed
1. Clock / overslept (common.asm) — **GSC dump 1:1** after prior fix  
2. PlayersHouse1F (Mom) — **aligned to dump** (#MON-COM, Baby, Errand) + Polished LYRA  
3. NewBarkTown — dump match for Wow/Yo/gefährlich/Schilder; #COM + LABOR caps  
4. Route29 — NEUBORKIA CAPS; dump-like ledge text  
5. CherrygroveCity — Anfänger/O.K./Tricks; Map-KARTE; MR. #mon house  

## GSC dump confirmations (canon, not “wrong EN”)
| Phrase | Verdict |
|---|---|
| „Wow, dein #COM ist beeindruckend!“ | **GSC dump** |
| „Yo, <PLAYER>!“ | **GSC dump** |
| „Es ist gefährlich, ohne #MON…“ | **GSC dump** |
| „Beeile dich, Baby!“ | **GSC dump** |
| „Ich habe verschlafen!“ | **GSC dump** |

## Polished-only (Class B/C, OK)
- LYRA in Mom-Intro / New Bark / Route 29  
- Laufschuhe-Anleitung (not in GSC)  
- Debug-Radio only under `if DEF(DEBUG)`  

## Still Class B (Polished narrative, GSC tone)
- ElmsLab full intro with both trainers  
- Rival Cherrygrove longer PC lines vs short GSC Silver  
