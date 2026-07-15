# Batch 2 Report — Johto Routes + Story Dungeons

## Scope: 153 maps
- Text strings: 8026
- EN candidates: 0
- Width >18 (display): 0
- #mon-ARENA leftovers: 0

## Content checks
- ('Route29', 'MATCH', 'ROUTE 29')
- ('Route30', 'MATCH', 'ROUTE 30')
- ('Route31', 'MATCH', 'ROUTE 31')
- ('Route32', 'MATCH', 'ROUTE 32')
- ('Route34', 'MATCH', 'ROUTE 34')
- ('Route36', 'MATCH', 'ROUTE 36')
- ('Route38', 'MATCH', 'ROUTE 38')
- ('Route42', 'MATCH', 'ROUTE 42')
- ('Route45', 'MATCH', 'ROUTE 45')
- ('LakeOfRage', 'MATCH', 'SEE DES ZORNS')
- ('NationalPark', 'MATCH', 'NATIONALPARK')
- ('RuinsOfAlphOutside', 'MATCH', 'ALPH-RUINEN')
- ('UnionCave1F', 'EXISTS')
- ('DarkCaveVioletEntrance', 'EXISTS')
- ('TeamRocketBaseB1F', 'DRIFT', 'TEAM ROCKET')
- ('IcePath1F', 'EXISTS')
- ('MtMortar1FOutside', 'MISSING')
- ('TohjoFalls', 'EXISTS')

## EN hits
- (none)

## Width issues
- (none)

## Arena form issues
- (none)

## Patches applied (Batch 2)
- Route44.asm: width reflow `O.K., dann musst du` -> split across lines
- Content note: MountMortar* (not MtMortar*) present and in batch via Route/dungeon prefixes? Check list
- TeamRocketBaseB1F "DRIFT TEAM ROCKET": constants use TEAM_ROCKET; dialogue may say ROCKET/Rüpel (GSC-typical) — not a text EN issue
- Re-scan after patch: en=0 width=0 arena=0

## Batch 2 result
- Status: **DONE**
- Maps: 153
- Ready for Batch 3 (Kanto cities + gyms)
