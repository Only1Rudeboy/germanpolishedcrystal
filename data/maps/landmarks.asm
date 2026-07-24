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

; GSC-DE Dump landmarks (CAPS). ¯ = Zeilenumbruch (BSP/SHY im Dump).
NewBarkTownName:       rawchar "NEUBORKIA@"
CherrygroveCityName:   rawchar "ROSALIA¯CITY@"
VioletCityName:        rawchar "VIOLA CITY@"
AzaleaTownName:        rawchar "AZALEA¯CITY@"
GoldenrodCityName:     rawchar "DUKATIA¯CITY@"
EcruteakCityName:      rawchar "TEAK¯CITY@"
OlivineCityName:       rawchar "OLIVIANA¯CITY@"
CianwoodCityName:      rawchar "ANEMONIA¯CITY@"
MahoganyTownName:      rawchar "MAHAGONIA¯CITY@"
BlackthornCityName:    rawchar "EBENHOLZ¯CITY@"
LakeOfRageName:        rawchar "SEE DES¯ZORNS@"
SilverCaveName:        rawchar "SILBERHÖHLE@"
SproutTowerName:       rawchar "KNOFENSA-¯TURM@"
VioletOutskirtsName:   rawchar "VIOLA-¯UMGEBUNG@"
RuinsOfAlphName:       rawchar "ALPH-RUINEN@"
UnionCaveName:         rawchar "EINHEITS-¯TUNNEL@"
SlowpokeWellName:      rawchar "FLEGMON-¯BRUNNEN@"
RadioTowerName:        rawchar "RADIOTURM@"
PowerPlantName:        rawchar "KRAFTWERK@"
NationalParkName:      rawchar "NATIONAL¯PARK@"
BellchimeTrailName:    rawchar "GLOCKENPFAD@"
TinTowerName:          rawchar "ZINNTURM@"
LighthouseName:        rawchar "LEUCHTTURM@"
WhirlIslandsName:      rawchar "STRUDEL-¯INSELN@"
MtMortarName:          rawchar "KESSELBERG@"
DragonsDenName:        rawchar "DRACHEN-¯HÖHLE@"
IcePathName:           rawchar "EISPFAD@"
PalletTownName:        rawchar "ALABASTIA@"
ViridianCityName:      rawchar "VERTANIA¯CITY@"
PewterCityName:        rawchar "MARMORIA¯CITY@"
CeruleanCityName:      rawchar "AZURIA¯CITY@"
LavenderTownName:      rawchar "LAVANDIA@"
VermilionCityName:     rawchar "ORANIA¯CITY@"
CeladonCityName:       rawchar "PRISMANIA¯CITY@"
SaffronCityName:       rawchar "SAFFRONIA¯CITY@"
FuchsiaCityName:       rawchar "FUCHSANIA¯CITY@"
CinnabarIslandName:    rawchar "ZINNOBER-¯INSEL@"
; rawchar hat kein #-Ngram → „Pokémon“ ausschreiben
PokemonLeagueName:     rawchar "Pokémon-¯LIGA@"
VictoryRoadName:       rawchar "SIEGES-¯STRASSE@"
IndigoPlateauName:     rawchar "INDIGO¯PLATEAU@"
MtMoonName:            rawchar "MONDBERG@"
RockTunnelName:        rawchar "FELSTUNNEL@"
LavRadioTowerName:     rawchar "RADIOTURM¯LAV.@"
SoulHouseName:         rawchar "PKMN-HAUS@"
CeladonUniversityName: rawchar "PRISMANIA-¯UNIVERSITÄT@"
SafariZoneName:        rawchar "SAFARI-ZONE@"
SeafoamIslandsName:    rawchar "SEESCHAUM-¯INSELN@"
PokemonMansionName:    rawchar "Pokémon-¯VILLA@"
CinnabarVolcanoName:   rawchar "ZINNOBER-¯VULKAN@"
CeruleanCaveName:      rawchar "AZURIA-¯HÖHLE@"
CeruleanCapeName:      rawchar "AZURIA-KAP@"
LuckyIslandName:       rawchar "GLÜCKS-¯INSEL@"
Route1Name:            rawchar "ROUTE 1@"
Route2Name:            rawchar "ROUTE 2@"
Route3Name:            rawchar "ROUTE 3@"
Route4Name:            rawchar "ROUTE 4@"
Route5Name:            rawchar "ROUTE 5@"
Route6Name:            rawchar "ROUTE 6@"
Route7Name:            rawchar "ROUTE 7@"
Route8Name:            rawchar "ROUTE 8@"
Route9Name:            rawchar "ROUTE 9@"
Route10Name:           rawchar "ROUTE 10@"
Route11Name:           rawchar "ROUTE 11@"
Route12Name:           rawchar "ROUTE 12@"
Route13Name:           rawchar "ROUTE 13@"
Route14Name:           rawchar "ROUTE 14@"
Route15Name:           rawchar "ROUTE 15@"
Route16Name:           rawchar "ROUTE 16@"
Route17Name:           rawchar "ROUTE 17@"
Route18Name:           rawchar "ROUTE 18@"
Route19Name:           rawchar "ROUTE 19@"
Route20Name:           rawchar "ROUTE 20@"
Route21Name:           rawchar "ROUTE 21@"
Route22Name:           rawchar "ROUTE 22@"
Route23Name:           rawchar "ROUTE 23@"
Route24Name:           rawchar "ROUTE 24@"
Route25Name:           rawchar "ROUTE 25@"
Route26Name:           rawchar "ROUTE 26@"
Route27Name:           rawchar "ROUTE 27@"
Route28Name:           rawchar "ROUTE 28@"
Route29Name:           rawchar "ROUTE 29@"
Route30Name:           rawchar "ROUTE 30@"
Route31Name:           rawchar "ROUTE 31@"
Route32Name:           rawchar "ROUTE 32@"
Route33Name:           rawchar "ROUTE 33@"
Route34Name:           rawchar "ROUTE 34@"
Route35Name:           rawchar "ROUTE 35@"
Route36Name:           rawchar "ROUTE 36@"
Route37Name:           rawchar "ROUTE 37@"
Route38Name:           rawchar "ROUTE 38@"
Route39Name:           rawchar "ROUTE 39@"
Route40Name:           rawchar "ROUTE 40@"
Route41Name:           rawchar "ROUTE 41@"
Route42Name:           rawchar "ROUTE 42@"
Route43Name:           rawchar "ROUTE 43@"
Route44Name:           rawchar "ROUTE 44@"
Route45Name:           rawchar "ROUTE 45@"
Route46Name:           rawchar "ROUTE 46@"
Route47Name:           rawchar "ROUTE 47@"
Route48Name:           rawchar "ROUTE 48@"
DarkCaveName:          rawchar "DUNKELHÖHLE@"
IlexForestName:        rawchar "STEINEICHEN-¯WALD@"
BurnedTowerName:       rawchar "TURMRUINE@"
FastShipName:          rawchar "SCHNELLBOOT@"
ViridianForestName:    rawchar "VERTANIA-¯WALD@"
DiglettsCaveName:      rawchar "DIGDAs¯HÖHLE@"
TohjoFallsName:        rawchar "TOHJO-FÄLLE@"
UndergroundPathName:   rawchar "UNTERGRUND-¯TUNNEL@"
BattleTowerName:       rawchar "DUELLTURM@"
CliffEdgeGateName:     rawchar "KLIPPENRAND-¯PASS@"
CliffCaveName:         rawchar "KLIPPEN-¯HÖHLE@"
YellowForestName:      rawchar "GELBER¯WALD@"
QuietCaveName:         rawchar "STILLE¯HÖHLE@"
CherrygroveBayName:    rawchar "ROSALIA-¯BUCHT@"
GoldenrodHarborName:   rawchar "DUKATIA-¯HAFEN@"
MagnetTunnelName:      rawchar "MAGNET¯TUNNEL@"
Route32CoastName:      rawchar "ROUTE 32¯KÜSTE@"
Route34CoastName:      rawchar "ROUTE 34¯KÜSTE@"
Route35CoastName:      rawchar "ROUTE 35¯KÜSTE@"
StormyBeachName:       rawchar "STURMSTRAND@"
MurkySwampName:        rawchar "TRÜBSUMPF@"
RuggedRoadName:        rawchar "HOLPRIGE¯STRASSE@"
SnowtopMountainName:   rawchar "SCHNEE¯GIPFEL@"
ScaryCaveName:         rawchar "GRUSELHÖHLE@"
DimCaveName:           rawchar "DÄMMERHÖHLE@"
UragaChannelName:      rawchar "URAGA-KANAL@"
ShamoutiIslandName:    rawchar "SHAMOUTI-¯INSEL@"
BeautifulBeachName:    rawchar "SCHÖNER¯STRAND@"
RockyBeachName:        rawchar "FELSSTRAND@"
NoisyForestName:       rawchar "LAUTER¯WALD@"
ShrineRuinsName:       rawchar "SCHREIN-¯RUINEN@"
ShamoutiTunnelName:    rawchar "SHAMOUTI-¯TUNNEL@"
WarmBeachName:         rawchar "WARMER¯STRAND@"
ShamoutiCoastName:     rawchar "SHAMOUTI-¯KÜSTE@"
FireIslandName:        rawchar "FEUER-¯INSEL@"
IceIslandName:         rawchar "EIS-¯INSEL@"
LightningIslandName:   rawchar "BLITZ-¯INSEL@"
Route49Name:           rawchar "ROUTE 49@"
ValenciaIslandName:    rawchar "VALENCIA-¯INSEL@"
NavelRockName:         rawchar "NABELFELSEN@"
FarawayIslandName:     rawchar "FERNE¯INSEL@"
SinjohRuinsName:       rawchar "SINJOH-¯RUINEN@"
MystriStageName:       rawchar "MYSTRI-¯BÜHNE@"
CinnabarLabName:       rawchar "Pokémon-¯LABOR@"
SpecialMapName:        rawchar "?@"
