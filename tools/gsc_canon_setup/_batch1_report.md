# Batch 0+1 Report — GSC Canon Maps

## Setup (0)
- Glossar: tools/gsc_canon_setup/GLOSSAR.md
- Klassen: A=GSC, B=GSC+PC, C=PC-only
- Regeln: nur DRIFT/EN patchen; MATCH unberührt

## Batch 1 scope
- Maps: 140
- Text strings (approx): 9431
- Sign labels: 77

## City sign / gym checks
- ('NewBarkTown', 'NEUBORKIA', 'MATCH', True, True)
- ('CherrygroveCity', 'ROSALIA CITY', 'MATCH', True, True)
- ('VioletCity', 'VIOLA CITY', 'MATCH', True, True)
- ('AzaleaTown', 'AZALEA CITY', 'MATCH', True, True)
- ('AzaleaTown', 'PKMN-ARENA', 'MATCH', True, True)
- ('AzaleaTown', 'FLEGMON', 'MATCH', True, True)
- ('GoldenrodCity', 'DUKATIA CITY', 'MATCH', True, True)
- ('GoldenrodCity', 'PKMN-ARENA', 'MATCH', True, True)
- ('EcruteakCity', 'TEAK CITY', 'MATCH', True, True)
- ('OlivineCity', 'OLIVIANA CITY', 'MATCH', True, True)
- ('OlivineCity', 'PKMN-ARENA', 'MATCH', True, True)
- ('CianwoodCity', 'ANEMONIA CITY', 'MATCH', True, True)
- ('MahoganyTown', 'MAHAGONIA CITY', 'MATCH', True, True)
- ('MahoganyTown', 'PKMN-ARENA', 'MATCH', True, True)
- ('BlackthornCity', 'EBENHOLZ CITY', 'MATCH', True, True)
- ('BlackthornCity', 'PKMN-ARENA', 'MATCH', True, True)
- ('NewBarkTown', 'LIND-#mon-LABOR', 'MATCH', True, True)
- ('VioletCity', 'KNOFENSA-TURM', 'MATCH', True, True)

## EN candidates: 0

## Width >18 (#mon=7): 31
- AzaleaGym:72 len=20 '#mon bis <LV> 30,'
- AzaleaGym:262 len=20 'EVA: Hallo! Forderst'
- ElmsLab:1210 len=19 '<PLAYER>, ich zähle'
- ElmsLab:1352 len=19 '… <PLAYER>. Der Weg'
- ElmsLab:1471 len=19 'Danke, <PLAYER>! Du'
- ElmsLab:1494 len=19 'LIND: <PLAYER>, ich'
- ElmsLab:1524 len=19 '<PLAYER>! Rate mal!'
- ElmsLab:1555 len=19 'LIND: Hi, <PLAYER>!'
- ElmsLab:1618 len=19 'ja schon, <PLAYER>.'
- ElmsLab:1687 len=19 'LIND: <PLAYER>! Wie'
- ElmsLab:1923 len=19 '<PLAYER> öffnet ein'
- ElmsLab:1937 len=19 '<PLAYER> öffnet ein'
- ElmsLab:1951 len=19 '<PLAYER> öffnet ein'
- ElmsLab:1967 len=19 '<PLAYER> öffnet ein'
- GoldenrodPokecomCenter1F:277 len=24 'Rechts: <PK><MN>-Richter'
- IlexForest:1049 len=19 'LYRA: Hi, <PLAYER>.'
- IlexForest:1066 len=19 'LYRA: …<PLAYER>? Du'
- KurtsHouse:481 len=19 'KURT: Hi, <PLAYER>!'
- KurtsHouse:555 len=19 'KURT: Ah, <PLAYER>!'
- LyrasHouse2F:22 len=19 'LYRA: Hi, <PLAYER>!'
- ManiasHouse:163 len=19 '<PLAYER> erhält ein'
- OlivineCafe:177 len=19 'Bis bald, <PLAYER>!'
- RadioTower2F:421 len=21 'BUENA: Hallo! Ich bin'
- RadioTower2F:457 len=21 'BUENA: Hallo! Hast du'
- RadioTower2F:474 len=19 'Auf, <PLAYER>. Mach'
- RadioTower2F:541 len=19 'BUENA: Yo! <PLAYER>'
- RadioTower2F:600 len=34 '{d:BLUE_CARD_POINT_CAP} Punkte auf'
- RadioTower2F:607 len=39 '{d:BLUE_CARD_POINT_CAP} Punkten, aber …'
- RadioTower2F:610 len=19 '<PLAYER>. Ich mache'
- RadioTower2F:658 len=19 'BUENA: <PLAYER>, In'
- VioletPokeCenter1F:112 len=19 '<PLAYER>, nimmst du'

## Sign issues: 0

## Stats
- city_match: 18
- maps: 140
- signs: 77
- strings: 9431
- width: 31

## Patches applied (Batch 1)
- Width reflow: AzaleaGym (EVA), GoldenrodPokecomCenter1F (PKMN-Richter), RadioTower2F (BUENA x2)
- City/gym signs already MATCH from prior GSC pass (Azalea, Blackthorn, Cianwood, Mahogany, Celadon, Ecruteak, NewBark lab, PKMN-ARENA rename)
- EN pure: 0 hits in Batch 1
- No remaining #mon-ARENA leftovers

## Batch 1 result
- Status: **DONE** (scan + residual width fixes)
- Maps covered: 140 Johto town/building maps
- City/gym canon checks: 18/18 MATCH
- Ready for Batch 2 (Johto routes + dungeons)
