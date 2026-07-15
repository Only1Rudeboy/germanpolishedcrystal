MACRO landmark
; x, y, name
	db \1 + 8, \2 + 16
	dw \3
ENDM

Landmarks:
	table_width 4
	landmark  -8, -16, SpecialMapName
	landmark 140, 100, NewBarkTownName
	landmark 120, 100, Route29Name
	landmark 100, 100, CherrygroveCityName
	landmark  92, 100, CherrygroveBayName
	landmark 100,  80, Route30Name
	landmark  96,  60, Route31Name
	landmark  84,  60, VioletCityName
	landmark  86,  58, SproutTowerName
	landmark  84,  52, VioletOutskirtsName
	landmark  76,  76, RuinsOfAlphName
	landmark  84,  92, Route32Name
	landmark  92, 112, Route32CoastName
	landmark  84, 124, UnionCaveName
	landmark  76, 124, Route33Name
	landmark  68, 124, AzaleaTownName
	landmark  76, 116, SlowpokeWellName
	landmark  52, 124, IlexForestName
	landmark  52, 108, Route34Name
	landmark  36, 120, Route34CoastName
	landmark  44, 132, StormyBeachName
	landmark  52, 132, MurkySwampName
	landmark  52,  92, GoldenrodCityName
	landmark  50,  92, RadioTowerName
	landmark  44,  92, GoldenrodHarborName
	landmark  68,  92, MagnetTunnelName
	landmark  52,  76, Route35Name
	landmark  44,  76, Route35CoastName
	landmark  52,  60, NationalParkName
	landmark  64,  60, Route36Name
	landmark  68,  52, Route37Name
	landmark  68,  44, EcruteakCityName
	landmark  69,  42, BellchimeTrailName
	landmark  70,  42, TinTowerName
	landmark  66,  42, BurnedTowerName
	landmark  52,  44, Route38Name
	landmark  36,  48, Route39Name
	landmark  36,  36, RuggedRoadName
	landmark  36,  28, SnowtopMountainName
	landmark  36,  60, OlivineCityName
	landmark  38,  62, LighthouseName
	landmark  28,  64, Route40Name
	landmark  28,  52, BattleTowerName
	landmark  28,  92, WhirlIslandsName
	landmark  28, 100, Route41Name
	landmark  20, 100, CianwoodCityName
	landmark  18,  98, CliffEdgeGateName
	landmark  12, 100, Route47Name
	landmark  12,  96, CliffCaveName
	landmark  12,  92, Route48Name
	landmark  12,  84, YellowForestName
	landmark  12, 108, QuietCaveName
	landmark  92,  44, Route42Name
	landmark  84,  44, MtMortarName
	landmark 108,  44, MahoganyTownName
	landmark 108,  36, Route43Name
	landmark 108,  28, LakeOfRageName
	landmark 120,  44, Route44Name
	landmark 128,  40, IcePathName
	landmark 132,  44, BlackthornCityName
	landmark 132,  36, DragonsDenName
	landmark 132,  64, Route45Name
	landmark 116,  68, DarkCaveName
	landmark 124,  88, Route46Name
	landmark 144,  60, SilverCaveName
	landmark 102, 124, FastShipName
	landmark 120,  28, SinjohRuinsName
	landmark 120,  28, MystriStageName
	assert_table_length KANTO_LANDMARK
	landmark  52, 100, PalletTownName
	landmark  52,  88, Route1Name
	landmark  52,  76, ViridianCityName
	landmark  52,  68, Route2Name
	landmark  52,  60, ViridianForestName
	landmark  52,  44, PewterCityName
	landmark  64,  44, Route3Name
	landmark  76,  44, MtMoonName
	landmark  92,  44, Route4Name
	landmark 108,  44, CeruleanCityName
	landmark 100,  36, CeruleanCaveName
	landmark 108,  36, Route24Name
	landmark 124,  28, Route25Name
	landmark 140,  28, CeruleanCapeName
	landmark 108,  52, Route5Name
	landmark 114,  66, UndergroundPathName
	landmark 108,  68, Route6Name
	landmark 108,  76, VermilionCityName
	landmark 116,  68, DiglettsCaveName
	landmark  96,  60, Route7Name
	landmark 124,  60, Route8Name
	landmark 124,  44, Route9Name
	landmark 140,  52, Route10Name
	landmark 140,  44, RockTunnelName
	landmark 148,  52, PowerPlantName
	landmark 148,  44, DimCaveName
	landmark 140,  60, LavenderTownName
	landmark 142,  58, LavRadioTowerName
	landmark 142,  62, SoulHouseName
	landmark  84,  60, CeladonCityName
	landmark  82,  62, CeladonUniversityName
	landmark 108,  60, SaffronCityName
	landmark 124,  76, Route11Name
	landmark 140,  76, Route12Name
	landmark 132,  92, Route13Name
	landmark 124, 100, Route14Name
	landmark 108, 108, Route15Name
	landmark 136, 104, LuckyIslandName
	landmark  68,  60, Route16Name
	landmark  76,  88, Route17Name
	landmark  80, 108, Route18Name
	landmark  92, 108, FuchsiaCityName
	landmark  92, 100, SafariZoneName
	landmark  64, 108, UragaChannelName
	landmark  60, 116, ScaryCaveName
	landmark  92, 120, Route19Name
	landmark  80, 132, Route20Name
	landmark  68, 132, SeafoamIslandsName
	landmark  52, 132, CinnabarIslandName
	landmark  50, 130, PokemonMansionName
	landmark  54, 130, CinnabarVolcanoName
	landmark  52, 116, Route21Name
	landmark  40,  76, Route22Name
	landmark  20, 100, Route27Name
	landmark  12, 100, TohjoFallsName
	landmark  28,  92, Route26Name
	landmark  28,  76, PokemonLeagueName
	landmark  28,  64, Route23Name
	landmark  28,  52, VictoryRoadName
	landmark  28,  36, IndigoPlateauName
	landmark  16,  76, Route28Name
	landmark  54, 134, CinnabarLabName
	landmark  68,  52, ShamoutiIslandName
	landmark  84,  60, BeautifulBeachName
	landmark  68,  40, RockyBeachName
	landmark  76,  40, NoisyForestName
	landmark  84,  44, ShrineRuinsName
	landmark  52,  52, ShamoutiTunnelName
	landmark  52,  60, WarmBeachName
	landmark  52,  72, ShamoutiCoastName
	landmark  60,  76, FireIslandName
	landmark  76,  76, IceIslandName
	landmark  92,  76, LightningIslandName
	landmark  68, 116, Route49Name
	landmark  76, 116, ValenciaIslandName
	landmark 132, 100, NavelRockName
	landmark  24, 120, FarawayIslandName
	assert_table_length NUM_LANDMARKS

NewBarkTownName:       rawchar "Neuborkia@"
CherrygroveCityName:   rawchar "Rosalia¯City@"
VioletCityName:        rawchar "Viola City@"
AzaleaTownName:        rawchar "Azalea¯City@"
GoldenrodCityName:     rawchar "Dukatia¯City@"
EcruteakCityName:      rawchar "Teak¯City@"
OlivineCityName:       rawchar "Oliviana¯City@"
CianwoodCityName:      rawchar "Anemonia¯City@"
MahoganyTownName:      rawchar "Mahagonia¯City@"
BlackthornCityName:    rawchar "Ebenholz¯City@"
LakeOfRageName:        rawchar "See des¯Zorns@"
SilverCaveName:        rawchar "Silberberghöhle@"
SproutTowerName:       rawchar "Knofensa-¯Turm@"
VioletOutskirtsName:   rawchar "Viola-¯Umgebung@"
RuinsOfAlphName:       rawchar "Alph-Ruinen@"
UnionCaveName:         rawchar "Einheits-¯Tunnel@"
SlowpokeWellName:      rawchar "Flegmon-¯Brunnen@"
RadioTowerName:        rawchar "Funkturm@"
PowerPlantName:        rawchar "Kraftwerk@"
NationalParkName:      rawchar "Nationalpark@"
BellchimeTrailName:    rawchar "Glockenpfad@"
TinTowerName:          rawchar "Zinnturm@"
LighthouseName:        rawchar "Leuchtturm@"
WhirlIslandsName:      rawchar "Strudel-¯inseln@"
MtMortarName:          rawchar "Kesselberg@"
DragonsDenName:        rawchar "Drachenhöhle@"
IcePathName:           rawchar "Eispfad@"
PalletTownName:        rawchar "Alabastia@"
ViridianCityName:      rawchar "Vertania¯City@"
PewterCityName:        rawchar "Marmoria¯City@"
CeruleanCityName:      rawchar "Azuria¯City@"
LavenderTownName:      rawchar "Lavandia@"
VermilionCityName:     rawchar "Orania¯City@"
CeladonCityName:       rawchar "Prismania¯City@"
SaffronCityName:       rawchar "Saffronia¯City@"
FuchsiaCityName:       rawchar "Fuchsania¯City@"
CinnabarIslandName:    rawchar "Zinnober-¯insel@"
; rawchar hat kein #-Ngram → „Pokémon“ ausschreiben
PokemonLeagueName:     rawchar "Pokémon-Liga@"
VictoryRoadName:       rawchar "Sieges-¯straße@"
IndigoPlateauName:     rawchar "Indigo-¯Plateau@"
MtMoonName:            rawchar "Mondberg@"
RockTunnelName:        rawchar "Felstunnel@"
LavRadioTowerName:     rawchar "Lavandia-¯Funkturm@"
SoulHouseName:         rawchar "Seelenhaus@"
CeladonUniversityName: rawchar "Prismania-¯Universität@"
SafariZoneName:        rawchar "Safari-Zone@"
SeafoamIslandsName:    rawchar "Seeschaum-¯inseln@"
PokemonMansionName:    rawchar "Pokémon-Villa@"
CinnabarVolcanoName:   rawchar "Zinnober-¯Vulkan@"
CeruleanCaveName:      rawchar "Azuria-Höhle@"
CeruleanCapeName:      rawchar "Azuria-Kap@"
LuckyIslandName:       rawchar "Glücks-¯Insel@"
Route1Name:            rawchar "Route 1@"
Route2Name:            rawchar "Route 2@"
Route3Name:            rawchar "Route 3@"
Route4Name:            rawchar "Route 4@"
Route5Name:            rawchar "Route 5@"
Route6Name:            rawchar "Route 6@"
Route7Name:            rawchar "Route 7@"
Route8Name:            rawchar "Route 8@"
Route9Name:            rawchar "Route 9@"
Route10Name:           rawchar "Route 10@"
Route11Name:           rawchar "Route 11@"
Route12Name:           rawchar "Route 12@"
Route13Name:           rawchar "Route 13@"
Route14Name:           rawchar "Route 14@"
Route15Name:           rawchar "Route 15@"
Route16Name:           rawchar "Route 16@"
Route17Name:           rawchar "Route 17@"
Route18Name:           rawchar "Route 18@"
Route19Name:           rawchar "Route 19@"
Route20Name:           rawchar "Route 20@"
Route21Name:           rawchar "Route 21@"
Route22Name:           rawchar "Route 22@"
Route23Name:           rawchar "Route 23@"
Route24Name:           rawchar "Route 24@"
Route25Name:           rawchar "Route 25@"
Route26Name:           rawchar "Route 26@"
Route27Name:           rawchar "Route 27@"
Route28Name:           rawchar "Route 28@"
Route29Name:           rawchar "Route 29@"
Route30Name:           rawchar "Route 30@"
Route31Name:           rawchar "Route 31@"
Route32Name:           rawchar "Route 32@"
Route33Name:           rawchar "Route 33@"
Route34Name:           rawchar "Route 34@"
Route35Name:           rawchar "Route 35@"
Route36Name:           rawchar "Route 36@"
Route37Name:           rawchar "Route 37@"
Route38Name:           rawchar "Route 38@"
Route39Name:           rawchar "Route 39@"
Route40Name:           rawchar "Route 40@"
Route41Name:           rawchar "Route 41@"
Route42Name:           rawchar "Route 42@"
Route43Name:           rawchar "Route 43@"
Route44Name:           rawchar "Route 44@"
Route45Name:           rawchar "Route 45@"
Route46Name:           rawchar "Route 46@"
Route47Name:           rawchar "Route 47@"
Route48Name:           rawchar "Route 48@"
DarkCaveName:          rawchar "Dunkelhöhle@"
IlexForestName:        rawchar "Steineichen-¯wald@"
BurnedTowerName:       rawchar "Turmruine@"
FastShipName:          rawchar "Schnell-¯dampfer@"
ViridianForestName:    rawchar "Vertania-¯Wald@"
DiglettsCaveName:      rawchar "Digda-Höhle@"
TohjoFallsName:        rawchar "Tohjo-Fälle@"
UndergroundPathName:   rawchar "Untergrund-¯tunnel@"
BattleTowerName:       rawchar "Kampfturm@"
CliffEdgeGateName:     rawchar "Klippenrand-¯Pass@"
CliffCaveName:         rawchar "Klippenhöhle@"
YellowForestName:      rawchar "Gelber¯Wald@"
QuietCaveName:         rawchar "Stille¯Höhle@"
CherrygroveBayName:    rawchar "Rosalia-¯Bucht@"
GoldenrodHarborName:   rawchar "Dukatia-¯Hafen@"
MagnetTunnelName:      rawchar "Magnettunnel@"
Route32CoastName:      rawchar "Route 32¯Küste@"
Route34CoastName:      rawchar "Route 34¯Küste@"
Route35CoastName:      rawchar "Route 35¯Küste@"
StormyBeachName:       rawchar "Sturmstrand@"
MurkySwampName:        rawchar "Trübsumpf@"
RuggedRoadName:        rawchar "Holprige¯Straße@"
SnowtopMountainName:   rawchar "Schneegipfel@"
ScaryCaveName:         rawchar "Gruselhöhle@"
DimCaveName:           rawchar "Dämmerhöhle@"
UragaChannelName:      rawchar "Uraga-Kanal@"
ShamoutiIslandName:    rawchar "Shamouti-¯Insel@"
BeautifulBeachName:    rawchar "Schöner¯Strand@"
RockyBeachName:        rawchar "Felsstrand@"
NoisyForestName:       rawchar "Lauter¯Wald@"
ShrineRuinsName:       rawchar "Schrein-¯ruinen@"
ShamoutiTunnelName:    rawchar "Shamouti-¯Tunnel@"
WarmBeachName:         rawchar "Warmer¯Strand@"
ShamoutiCoastName:     rawchar "Shamouti-¯Küste@"
FireIslandName:        rawchar "Feuer-¯Insel@"
IceIslandName:         rawchar "Eis-¯Insel@"
LightningIslandName:   rawchar "Blitz-¯Insel@"
Route49Name:           rawchar "Route 49@"
ValenciaIslandName:    rawchar "Valencia-¯Insel@"
NavelRockName:         rawchar "Nabelfelsen@"
FarawayIslandName:     rawchar "Ferne¯Insel@"
SinjohRuinsName:       rawchar "Sinjoh-¯Ruinen@"
MystriStageName:       rawchar "Mystri-¯Bühne@"
CinnabarLabName:       rawchar "Pokémon-Labor@"
SpecialMapName:        rawchar "?@"
