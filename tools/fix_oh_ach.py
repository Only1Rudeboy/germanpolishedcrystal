#!/usr/bin/env python3
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent / "maps"

FIXES = {
    "CeladonUniversityHyperTestRoom.asm": [(r'text "Oh nein!', r'text "Ach nein!')],
    "DragonShrine.asm": [(r'text "Oh, ich', r'text "Ach, ich')],
    "DragonsDenB1F.asm": [(r'text "Oh, du', r'text "Ach, du')],
    "EarlsPokemonAcademy.asm": [(r'text "Oh! Du', r'text "Ach! Du')],
    "ElmsLab.asm": [(r'text "Oh, heh!', r'text "Ach, heh!')],
    "FastShipB1F.asm": [(r'text "Oh, oh', r'text "Ach, ach')],
    "FastShipCabins_NNW_NNE_NE.asm": [(r'text "Oh, nein', r'text "Ach, nein')],
    "GoldenrodBillsHouse.asm": [(r'text "Oh, du', r'text "Ach, du')],
    "GoldenrodUnderground.asm": [(r'text "Oh, oh, oh!', r'text "Ach, ach, ach!')],
    "NewBarkTown.asm": [(r'text "Oh! Dein', r'text "Ach! Dein')],
    "PewterCity.asm": [(r'text "Oh, du', r'text "Ach, du')],
    "PlayersHouse1F.asm": [(r'text "Oh, <PLAYER>!', r'text "Ach, <PLAYER>!')],
    "RadioTower4F.asm": [(r'text "Oh, nein!', r'text "Ach, nein!')],
    "Route20.asm": [(r'text "Oh, nein!', r'text "Ach, nein!')],
    "Route25.asm": [(r'text "Oh! Verm', r'text "Ach! Verm')],
    "Route34.asm": [(r'text "Oh nein!', r'text "Ach nein!')],
    "Route34IlexForestGate.asm": [(r'text "Oh, interessant', r'text "Ach, interessant')],
    "Route35.asm": [(r'text "Oh, ich', r'text "Ach, ich')],
    "Route35CoastSouth.asm": [(r'text "Oh nein!', r'text "Ach nein!')],
    "Route36NationalParkGate.asm": [(r'text "Oh, oh', r'text "Ach, ach')],
    "Route37.asm": [(r'text "Oh, du', r'text "Ach, du')],
    "Route46.asm": [(r'text "Oh, Mist', r'text "Ach, Mist')],
    "Route9.asm": [(r'text "Oh, Mist!', r'text "Ach, Mist!')],
    "TeamRocketBaseB2F.asm": [(r'text "Oh, ein', r'text "Ach, ein')],
    "UnionCave1F.asm": [(r'text "Oh, oh, oh!', r'text "Ach, ach, ach!')],
    "UnionCaveB2F.asm": [(r'text "Oh, nein!', r'text "Ach, nein!')],
    "EcruteakCity.asm": [(r'text "Ich will im', r'text "Ich möchte im')],
    "SproutTower3F.asm": [(r'text "Ich will sehen,', r'text "Ich möchte sehen,')],
    "ScaryCave1F.asm": [(r'text "Mira will viel,', r'text "Mira möchte viel,')],
}

for fname, reps in FIXES.items():
    path = ROOT / fname
    if not path.exists():
        continue
    text = path.read_text(encoding="utf-8")
    orig = text
    for old, new in reps:
        text = re.sub(old, new, text)
    if text != orig:
        path.write_text(text, encoding="utf-8")
        print(f"fixed {fname}")