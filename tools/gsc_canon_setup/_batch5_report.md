# Batch 5 Report — Polished-exclusive + remaining

## Scope: 96 maps
- Strings: 3734
- Signs: 28
- EN: 0
- Width>18: 0
- #mon-ARENA leftovers: 0

## EN hits (all)
- (none)

## Width issues (all)
- (none)

## Arena leftovers
- (none)

## Signs
- BattleTowerOutside.BattleTowerOutsideSignText: text "Kampfturm" para "Die ultimative" line "Trainer-" cont "Herausforderung!"
- BeautifulBeach.BeautifulBeachWelcomeSignText: text "Willkommen auf" line "Shamouti-Insel!" para "Die Hauptinsel" line "liegt im Westen."
- BeautifulBeach.BeautifulBeachVillaSignText: text "Insel-Villa"
- Colosseum.MapColosseumSignpost1Script: special Special_Colosseum newloadmap MAPSETUP_LINKRETURN end CableClubFriendScript: jumpthistext text "Dein Freund ist" line "bereit."
- FarawayIsland.FarawayIslandSignText: text "Die Schrift" line "verblasst, als" cont "wäre sie" para "vor langer Zeit" line "geschrieben …" para "' … ber, 6. Tag" para "Sollte je 
- NoisyForest.NoisyForestSignpostText: text "Lauter Wald"
- PokeCenter2F.PokeCenter2FLinkRecordSign: reanchormap special Special_DisplayLinkRecord endtext LinkReceptionistScript_Trade: if!DEF(DEBUG) checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM i
- PokemonFanClub.PokemonFanClubListenSignText: text "Anderen Trainern" line "hören wir höflich" cont "zu."
- PokemonFanClub.PokemonFanClubBraggingSignText: text "Wenn jemand" line "prahlt, wird" para "sofort" line "zurückgeprahlt!"
- RockyBeach.RockyBeachSign1Text: text "Felsstrand"
- RockyBeach.RockyBeachSign2Text: text "Lauter Wald voraus" para "Weg zu den" line "Schreinruinen"
- Route49.Route49SignText: text "ROUTE 49" line "Valencia-Insel"
- RuggedRoadSouth.RuggedRoadSouthAdvancedTipsSignText: text "Profi-Tipps!" para "K.O.-t dein" line "#mon den Gegner" cont "und" para "trägt es ein" line "Kraftitem für mehr" cont "EP-Gewinn," par
- ShamoutiHotel1F.ShamoutiHotelRestaurantSignText: text "Oasis-Restaurant"
- ShamoutiIsland.ShamoutiIslandSignText: text "Shamouti-Insel"
- ShamoutiIsland.ShamoutiHotelSignText: text "Shamouti-Hotel"
- ShamoutiIsland.ShamoutiTouristCenterSignText: text "Shamouti" line "Touristen-Info"
- SinjohRuins.SinjohRuinsSignpostText: text "Sinjoh-Ruinen"
- TrainerHouse1F.TrainerHouseSign1Text: text "Übungskämpfe" line "werden unten in" para "der ÜBUNGSHALLE" line "abgehalten." para "Auch erfahrene" line "Trainer können" cont "gerne
- TrainerHouse1F.TrainerHouseSign2Text: text "Bei den" line "Trainingskämpfen" cont "gelten" para "keine Regeln oder" line "Vorgaben. Wie bei" para "den Feldkämpfen" line "ist alle
- UragaChannelEast.UragaChannelSignText: text "Uraga-Kanal"
- UragaChannelEast.ScaryCaveEastSignText: text "Auf dem Schild ist" line "Graffiti …" para "'Diese Höhle ist" line "gruselig!'"
- UragaChannelWest.ScaryCaveWestSignText: text "Uraga-Kanal voraus" para "Betrete ihn nur" line "von Route 18 im" cont "Westen!"
- ValenciaIsland.ValenciaIslandSignText: text "Valencia-Insel" para "Bittere Orangen" line "und süße Brisen"
- ValenciaIsland.ValenciaIslandGoneFishingSignText: text "Bin angeln" para "(Im Urlaub in" line "Alola!)"
- ValenciaIsland.IvysLabSignText: text "Ivy-Forschung" line "Nr. 2"
- ValenciaIsland.IvysHouseSignText: text "Ivys Haus"
- WarmBeach.WarmBeachShackSignText: text "Strandhütte"

## Patches applied (Batch 5)

### Width reflows
- LuckyIsland.asm: "Toll! Sieht so aus."
- MrPokemonsHouse.asm: several PROF. LIND / PROF. EICH lines ≤18

### Sign DE polish (PC-only maps)
- ShamoutiHotel1F: Oasis-Restaurant
- ShamoutiIsland: Touristen-Info (was "Tourist Center")
- ValenciaIsland: Ivy-Forschung Nr. 2 (drop EN "Bayview")

### Notes
- Class C (Polished-only): no Crystal dump 1:1 — DE + width + glossary only
- Battle Tower/Factory, Shamouti, Valencia, islands, Rocket Hideout, Soul House floors, etc.: already DE
- Final re-scan: EN=0, width=0, arena leftovers=0

## Batch 5 result: **DONE**
Remaining for Batch 6: Re-QC across all batches + phone text + final consistency pass
