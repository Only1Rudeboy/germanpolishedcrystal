# Batch 4 Report — Kanto Routes + remaining gates

## Scope: 58 maps (Kanto routes 1–28 focus; dungeons mostly Batch 3)
- EN: 0
- Width>18: 0
- #mon-ARENA leftovers: 0
- Sign labels: 37
- Strings: 2900

## Route sign presence
- ('Route1', 'HAS_ROUTE_SIGN', 1)
- ('Route10North', 'NO_ROUTE_SIGN', 10)
- ('Route10PokeCenter1F', 'NO_ROUTE_SIGN', 10)
- ('Route10South', 'HAS_ROUTE_SIGN', 10)
- ('Route11', 'HAS_ROUTE_SIGN', 11)
- ('Route12North', 'NO_ROUTE_SIGN', 12)
- ('Route12South', 'HAS_ROUTE_SIGN', 12)
- ('Route12SuperRodHouse', 'NO_ROUTE_SIGN', 12)
- ('Route13', 'HAS_ROUTE_SIGN', 13)
- ('Route14', 'HAS_ROUTE_SIGN', 14)
- ('Route14LuckyIslandDual', 'NO_ROUTE_SIGN', 14)
- ('Route15', 'HAS_ROUTE_SIGN', 15)
- ('Route16East', 'HAS_ROUTE_SIGN', 16)
- ('Route16FuchsiaSpeechHouse', 'NO_ROUTE_SIGN', 16)
- ('Route16North', 'NO_ROUTE_SIGN', 16)
- ('Route16West', 'NO_ROUTE_SIGN', 16)
- ('Route17North', 'NO_ROUTE_SIGN', 17)
- ('Route17South', 'NO_ROUTE_SIGN', 17)
- ('Route18East', 'HAS_ROUTE_SIGN', 18)
- ('Route18West', 'NO_ROUTE_SIGN', 18)
- ('Route19', 'HAS_ROUTE_SIGN', 19)
- ('Route19BeachHouse', 'NO_ROUTE_SIGN', 19)
- ('Route20', 'NO_ROUTE_SIGN', 20)
- ('Route21', 'NO_ROUTE_SIGN', 21)
- ('Route22', 'NO_ROUTE_SIGN', 22)
- ('Route22Past', 'NO_ROUTE_SIGN', 22)
- ('Route23North', 'NO_ROUTE_SIGN', 23)
- ('Route23South', 'NO_ROUTE_SIGN', 23)
- ('Route24', 'NO_ROUTE_SIGN', 24)
- ('Route25', 'NO_ROUTE_SIGN', 25)
- ('Route26', 'HAS_ROUTE_SIGN', 26)
- ('Route26DayofWeekSiblingsHouse', 'NO_ROUTE_SIGN', 26)
- ('Route26HealSpeechHouse', 'NO_ROUTE_SIGN', 26)
- ('Route27', 'NO_ROUTE_SIGN', 27)
- ('Route27RestHouse', 'NO_ROUTE_SIGN', 27)
- ('Route28', 'HAS_ROUTE_SIGN', 28)
- ('Route28FamousSpeechHouse', 'NO_ROUTE_SIGN', 28)
- ('Route2North', 'NO_ROUTE_SIGN', 2)
- ('Route2NuggetSpeechHouse', 'NO_ROUTE_SIGN', 2)
- ('Route2South', 'HAS_ROUTE_SIGN', 2)
- ('Route3', 'NO_ROUTE_SIGN', 3)
- ('Route3PokeCenter1F', 'NO_ROUTE_SIGN', 3)
- ('Route4', 'NO_ROUTE_SIGN', 4)
- ('Route5', 'NO_ROUTE_SIGN', 5)
- ('Route5CleanseTagSpeechHouse', 'NO_ROUTE_SIGN', 5)
- ('Route5UndergroundPathEntrance', 'NO_ROUTE_SIGN', 5)
- ('Route6', 'NO_ROUTE_SIGN', 6)
- ('Route6UndergroundPathEntrance', 'NO_ROUTE_SIGN', 6)
- ('Route7', 'NO_ROUTE_SIGN', 7)
- ('Route8', 'NO_ROUTE_SIGN', 8)
- ('Route9', 'HAS_ROUTE_SIGN', 9)

## Landmark / GSC name checks
- ('Route1', 'MATCH', ['ROUTE 1', 'ALABASTIA', 'VERTANIA'], [])
- ('Route2North', 'DRIFT', [], ['ROUTE 2', 'VERTANIA', 'MARMORIA'])
- ('Route2South', 'MATCH', ['ROUTE 2'], [])
- ('Route3', 'DRIFT', ['MONDBERG'], ['ROUTE 3', 'MARMORIA'])
- ('Route4', 'DRIFT', ['MONDBERG'], ['ROUTE 4', 'AZURIA'])
- ('Route5', 'DRIFT', ['AZURIA'], ['ROUTE 5', 'SAFFRONIA'])
- ('Route6', 'DRIFT', ['ORANIA'], ['ROUTE 6', 'SAFFRONIA'])
- ('Route7', 'DRIFT', ['PRISMANIA'], ['ROUTE 7', 'SAFFRONIA'])
- ('Route8', 'DRIFT', [], ['ROUTE 8', 'LAVANDIA', 'SAFFRONIA'])
- ('Route9', 'MATCH', ['ROUTE 9', 'AZURIA'], [])
- ('Route10North', 'DRIFT', [], ['ROUTE 10'])
- ('Route10South', 'MATCH', ['ROUTE 10'], [])
- ('Route11', 'MATCH', ['ROUTE 11'], ['ORANIA'])
- ('Route12North', 'DRIFT', [], ['ROUTE 12'])
- ('Route12South', 'MATCH', ['ROUTE 12'], [])
- ('Route13', 'MATCH', ['ROUTE 13'], [])
- ('Route14', 'MATCH', ['ROUTE 14'], [])
- ('Route15', 'MATCH', ['ROUTE 15', 'FUCHSANIA'], [])
- ('Route16East', 'MATCH', ['ROUTE 16'], [])
- ('Route16West', 'DRIFT', [], ['ROUTE 16'])
- ('Route17North', 'DRIFT', ['RADWEG'], ['ROUTE 17'])
- ('Route17South', 'DRIFT', [], ['ROUTE 17'])
- ('Route18East', 'MATCH', ['ROUTE 18', 'FUCHSANIA'], [])
- ('Route18West', 'DRIFT', [], ['ROUTE 18'])
- ('Route19', 'MATCH', ['ROUTE 19'], [])
- ('Route20', 'DRIFT', [], ['ROUTE 20'])
- ('Route21', 'DRIFT', ['ZINNOBER'], ['ROUTE 21', 'ALABASTIA'])
- ('Route22', 'DRIFT', [], ['ROUTE 22', 'VERTANIA'])
- ('Route24', 'DRIFT', ['AZURIA'], ['ROUTE 24'])
- ('Route25', 'DRIFT', [], ['ROUTE 25'])
- ('Route26', 'MATCH', ['ROUTE 26'], [])
- ('Route27', 'DRIFT', [], ['ROUTE 27'])
- ('Route28', 'MATCH', ['ROUTE 28'], [])

## EN hits (all)
- (none)

## Width issues (all)
- (none)

## Arena leftovers
- (none)

## All sign blocks
- Route1.Route1SignText: text "ROUTE 1" para "ALABASTIA -" line "VERTANIA CITY"
- Route10North.RockTunnelSignText: text "FELSTUNNEL"
- Route10North.PowerPlantSignText: text "KRAFTWERK"
- Route10South.Route10SignText: text "ROUTE 10" para "AZURIA CITY -" line "LAVANDIA"
- Route11.Route11SignText: text "ROUTE 11"
- Route12North.FishingSpotSignText: text "ANGELPLATZ"
- Route12South.Route12SignText: text "ROUTE 12" line "NORDEN: LAVANDIA"
- Route13.Route13SignText: text "ROUTE 13" para "NÖRDLICH ZUR" line "SCHWEIGEBRÜCKE"
- Route13.Route13DirectionsSignText: text "Nördlich nach" line "LAVANDIA" para "Westlich nach" line "FUCHSANIA CITY"
- Route14.Route14SignText: text "ROUTE 14" para "FUCHSANIA CITY -" line "LAVANDIA"
- Route15.Route15SignText: text "ROUTE 15" para "FUCHSANIA CITY -" line "LAVANDIA"
- Route16East.Route16SignpostText: text "ROUTE 16"
- Route17North.CyclingRoadSignText: text "RADWEG" para "Es geht den ganzen" line "Weg nur bergab!"
- Route18East.Route18SignText: text "ROUTE 18" para "PRISMANIA CITY -" line "FUCHSANIA CITY"
- Route19.Route19SignText: text "ROUTE 19" para "FUCHSANIA CITY -" line "SEESCHAUMINSELN"
- Route19.CarefulSwimmingSignText: text "Sei auf der Hut," line "wenn du zu den" cont "SEESCHAUMINSELN" cont "schwimmst." para "ORDNUNGSAMT VON" line "FUCHSANIA CITY"
- Route20.CinnabarGymSignText: text "Was steht auf" line "diesem Schild?" para "PKMN-ARENA der" line "ZINNOBERINSEL" para "LEITUNG: PYRO"
- Route20.SeafoamIslandsSignText: text "SEESCHAUMINSELN"
- Route22.VictoryRoadEntranceSignText: text "#mon LIGA" para "SIEGESSTRASSE" line "EINGANG"
- Route22.Route22AdvancedTipsSignText: text "Prof-Tipps!" para "Neues Spiel+" line "behält dein" para "altes Geld," line "Kampfpunkte und" para "alle #mon im" line "PC!"
- Route23North.VictoryRoadSignText: text "SIEGESSTRASSE" line "EINGANG"
- Route24.Route24AdvancedTipsSignText: text "Profi-Tipps!" para "Die Fähigkeit Rohe" line "Gewalt" para "hebt Nebeneffekte" line "von Attacken auf," para "aber auch andere" line "
- Route26.Route26SignText: text "ROUTE 26" para "#mon LIGA" line "EMPFANG"
- Route27.TohjoFallsSignText: text "TOHJO-FÄLLE" para "Die Verbindung" line "zwischen KANTO und" cont "JOHTO"
- Route2North.Route2DiglettsCaveSignText: text "DIGDAs HÖHLE"
- Route2South.Route2SignText: text "ROUTE 2" para "VERTANIA CITY -" line "MARMORIA CITY"
- Route3.Route3MtMoonSquareSignText: text "MONDBERGPLATZ" para "Schutt abladen" line "verboten"
- Route4.MtMoonSignText: text "MONDBERG-TUNNEL"
- Route4.CableCarSignText: text "Seilbahn zum" line "MONDBERGPLATZ"
- Route5.Route5UndergroundPathSignText: text "TUNNELPFAD" para "AZURIA CITY -" line "ORANIA CITY"
- Route5.Route5AdvancedTipsSignText: text "Profi-Tipps!" para "Rasereigen ist ein" line "mächtiges Item," para "aber es verursacht" line "Verwirrung." para "Ein #mon mit" line "
- Route6.Route6UndergroundPathSignText: text "TUNNELPFAD" para "AZURIA CITY -" line "ORANIA CITY"
- Route6.Route6AdvancedTipsSignText: text "Profi-Tipps!" para "Manche Items" line "wirken schädlich" cont "für den Träger," para "wie ein Eisenball" line "oder ein" cont "Wahl-S
- Route7.Route7UndergroundPathSignText: text "Was steht auf dem" line "Flugblatt?" para "…Ruppige Trainer" line "tragen auf dem" para "TUNNELPFAD Kämpfe" line "aus." para "Da sich 
- Route8.Route8UndergroundPathSignText: text "Das Flugblatt ist" line "zerrissen." para "Es ist nicht mehr" line "lesbar…"
- Route9.Route9SignText: text "ROUTE 9" para "AZURIA CITY -" line "FELSTUNNEL"
- Route9.Route9AdvancedTipsSignText: text "Profi-Tipps!" para "Ein #mon mit" line "einem Toxik-Orb" cont "wird vergiftet," para "eines mit einem" line "Heiß-Orb" cont "verbrannt

## Patches applied (Batch 4) — thorough

### Sign GSC alignment
- Route1: ALABASTIA - / VERTANIA CITY
- Route2South: VERTANIA CITY - / MARMORIA CITY
- Route3: MONDBERGPLATZ Schutt abladen verboten (was Treppe hoch)
- Route9/10/14/15/18/19: CITY - connector format
- Route5/6 TUNNELPFAD: AZURIA CITY - / ORANIA CITY
- Route12South: ROUTE 12 / NORDEN: LAVANDIA
- Route16East: Route 16 -> ROUTE 16
- Route23North: SIEGESSTRASSE EINGANG
- Route10North: KRAFTWERK (drop redundant KANTO)

### Width
- Route3: Toll! Das ist heiß! reflow

### Notes on NO_ROUTE_SIGN
Many split outdoor maps (Route3,5,7,8,20–25, …) have **no ROUTE N post** in polished map data (only landmarks like DIGDAs HÖHLE, RADWEG, FELSTUNNEL, TUNNELPFAD). That is map design, not missing DE text. Did **not** invent new bg_events.

### Final re-scan
- maps=58, EN=0, width=0, arena leftovers=0
- Manual key-sign verification: all listed OK

## Batch 4 result: **DONE**
Next: Batch 5 (Polished-exclusive maps)
