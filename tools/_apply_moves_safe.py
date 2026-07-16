#!/usr/bin/env python3
"""Dump-align move descriptions only for single-label / unambiguous GSC blocks."""
from __future__ import annotations

import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
DUMP = (ROOT / "tools" / "_gsc_de_crystal_msg.txt").read_text(
    encoding="utf-8", errors="replace"
).splitlines()


def dump_to_block(raw: str) -> str:
    s = raw.strip()
    if s.endswith("@"):
        s = s[:-1]
    s = s.replace("<PKMN>", "#MON").replace("<PK><MN>", "#MON")
    parts = [p for p in s.split("<NEXT>") if p != ""]
    if not parts:
        parts = ["?"]
    out = [f'\ttext "{parts[0]}"']
    for p in parts[1:]:
        out.append(f'\tnext "{p}"')
    out += ["\tdone", ""]
    return "\n".join(out)


def camel_to_const(name: str) -> str:
    special = {
        "DoubleSlap": "DOUBLESLAP",
        "Thunderpunch": "THUNDERPUNCH",
        "Thundershock": "THUNDERSHOCK",
        "Vicegrip": "VICEGRIP",
        "Sonicboom": "SONICBOOM",
        "Softboiled": "SOFTBOILED",
        "Selfdestruct": "SELFDESTRUCT",
        "BubbleBeam": "BUBBLEBEAM",
        "Dynamicpunch": "DYNAMICPUNCH",
        "DynamicPunch": "DYNAMICPUNCH",
        "Dragonbreath": "DRAGONBREATH",
        "DragonBreath": "DRAGONBREATH",
        "Extremespeed": "EXTREMESPEED",
        "ExtremeSpeed": "EXTREMESPEED",
        "Ancientpower": "ANCIENTPOWER",
        "AncientPower": "ANCIENTPOWER",
        "Poisonpowder": "POISONPOWDER",
        "FaintAttack": "FAINT_ATTACK",
        "FeintAttack": "FAINT_ATTACK",
        "HiJumpKick": "HI_JUMP_KICK",
        "SandAttack": "SAND_ATTACK",
        "DoubleEdge": "DOUBLE_EDGE",
        "Twineedle": "TWINEEDLE",
        "PinMissile": "PIN_MISSILE",
        "FuryAttack": "FURY_ATTACK",
        "HornDrill": "HORN_DRILL",
        "TakeDown": "TAKE_DOWN",
        "TailWhip": "TAIL_WHIP",
        "PoisonSting": "POISON_STING",
        "DoubleKick": "DOUBLE_KICK",
        "JumpKick": "JUMP_KICK",
        "RollingKick": "ROLLING_KICK",
        "MegaPunch": "MEGA_PUNCH",
        "MegaKick": "MEGA_KICK",
        "CometPunch": "COMET_PUNCH",
        "PayDay": "PAY_DAY",
        "FirePunch": "FIRE_PUNCH",
        "IcePunch": "ICE_PUNCH",
        "RazorWind": "RAZOR_WIND",
        "SwordsDance": "SWORDS_DANCE",
        "WingAttack": "WING_ATTACK",
        "VineWhip": "VINE_WHIP",
        "BodySlam": "BODY_SLAM",
        "WaterGun": "WATER_GUN",
        "HydroPump": "HYDRO_PUMP",
        "IceBeam": "ICE_BEAM",
        "DrillPeck": "DRILL_PECK",
        "LowKick": "LOW_KICK",
        "SeismicToss": "SEISMIC_TOSS",
        "MegaDrain": "MEGA_DRAIN",
        "LeechSeed": "LEECH_SEED",
        "RazorLeaf": "RAZOR_LEAF",
        "SolarBeam": "SOLAR_BEAM",
        "StunSpore": "STUN_SPORE",
        "SleepPowder": "SLEEP_POWDER",
        "PetalDance": "PETAL_DANCE",
        "StringShot": "STRING_SHOT",
        "DragonRage": "DRAGON_RAGE",
        "FireSpin": "FIRE_SPIN",
        "ThunderWave": "THUNDER_WAVE",
        "RockThrow": "ROCK_THROW",
        "NightShade": "NIGHT_SHADE",
        "EggBomb": "EGG_BOMB",
        "BoneClub": "BONE_CLUB",
        "SpikeCannon": "SPIKE_CANNON",
        "SkullBash": "SKULL_BASH",
        "DreamEater": "DREAM_EATER",
        "PoisonGas": "POISON_GAS",
        "LeechLife": "LEECH_LIFE",
        "LovelyKiss": "LOVELY_KISS",
        "SkyAttack": "SKY_ATTACK",
        "DizzyPunch": "DIZZY_PUNCH",
        "AcidArmor": "ACID_ARMOR",
        "FurySwipes": "FURY_SWIPES",
        "HyperFang": "HYPER_FANG",
        "TriAttack": "TRI_ATTACK",
        "SuperFang": "SUPER_FANG",
        "TripleKick": "TRIPLE_KICK",
        "SpiderWeb": "SPIDER_WEB",
        "MindReader": "MIND_READER",
        "FlameWheel": "FLAME_WHEEL",
        "CottonSpore": "COTTON_SPORE",
        "PowderSnow": "POWDER_SNOW",
        "MachPunch": "MACH_PUNCH",
        "ScaryFace": "SCARY_FACE",
        "SweetKiss": "SWEET_KISS",
        "BellyDrum": "BELLY_DRUM",
        "SludgeBomb": "SLUDGE_BOMB",
        "MudSlap": "MUD_SLAP",
        "ZapCannon": "ZAP_CANNON",
        "DestinyBond": "DESTINY_BOND",
        "PerishSong": "PERISH_SONG",
        "IcyWind": "ICY_WIND",
        "BoneRush": "BONE_RUSH",
        "LockOn": "LOCK_ON",
        "GigaDrain": "GIGA_DRAIN",
        "FalseSwipe": "FALSE_SWIPE",
        "MilkDrink": "MILK_DRINK",
        "FuryCutter": "FURY_CUTTER",
        "SteelWing": "STEEL_WING",
        "MeanLook": "MEAN_LOOK",
        "SleepTalk": "SLEEP_TALK",
        "HealBell": "HEAL_BELL",
        "PainSplit": "PAIN_SPLIT",
        "SacredFire": "SACRED_FIRE",
        "BatonPass": "BATON_PASS",
        "RapidSpin": "RAPID_SPIN",
        "SweetScent": "SWEET_SCENT",
        "IronTail": "IRON_TAIL",
        "MetalClaw": "METAL_CLAW",
        "VitalThrow": "VITAL_THROW",
        "MorningSun": "MORNING_SUN",
        "HiddenPower": "HIDDEN_POWER",
        "CrossChop": "CROSS_CHOP",
        "RainDance": "RAIN_DANCE",
        "SunnyDay": "SUNNY_DAY",
        "MirrorCoat": "MIRROR_COAT",
        "PsychUp": "PSYCH_UP",
        "ShadowBall": "SHADOW_BALL",
        "FutureSight": "FUTURE_SIGHT",
        "RockSmash": "ROCK_SMASH",
        "BeatUp": "BEAT_UP",
        "KarateChop": "KARATE_CHOP",
        "QuickAttack": "QUICK_ATTACK",
        "DefenseCurl": "DEFENSE_CURL",
        "SmokeScreen": "SMOKESCREEN",
        "Smokescreen": "SMOKESCREEN",
        "ConfuseRay": "CONFUSE_RAY",
        "LightScreen": "LIGHT_SCREEN",
        "FocusEnergy": "FOCUS_ENERGY",
        "MirrorMove": "MIRROR_MOVE",
        "SelfDestruct": "SELFDESTRUCT",
        "FireBlast": "FIRE_BLAST",
        "DoubleTeam": "DOUBLE_TEAM",
        "PsychicM": "PSYCHIC_M",
        "HyperBeam": "HYPER_BEAM",
        "HornAttack": "HORN_ATTACK",
        "PayDay": "PAY_DAY",
        "FirePunch": "FIRE_PUNCH",
        "IcePunch": "ICE_PUNCH",
        "WingAttack": "WING_ATTACK",
        "RollingKick": "ROLLING_KICK",
        "SandAttack": "SAND_ATTACK",
        "DoubleEdge": "DOUBLE_EDGE",
        "TailWhip": "TAIL_WHIP",
        "PoisonSting": "POISON_STING",
        "PinMissile": "PIN_MISSILE",
        "Sonicboom": "SONICBOOM",
        "Flamethrower": "FLAMETHROWER",
        "WaterGun": "WATER_GUN",
        "HydroPump": "HYDRO_PUMP",
        "IceBeam": "ICE_BEAM",
        "BubbleBeam": "BUBBLEBEAM",
        "AuroraBeam": "AURORA_BEAM",
        "DrillPeck": "DRILL_PECK",
        "LowKick": "LOW_KICK",
        "SeismicToss": "SEISMIC_TOSS",
        "MegaDrain": "MEGA_DRAIN",
        "LeechSeed": "LEECH_SEED",
        "RazorLeaf": "RAZOR_LEAF",
        "SolarBeam": "SOLAR_BEAM",
        "Poisonpowder": "POISONPOWDER",
        "StunSpore": "STUN_SPORE",
        "SleepPowder": "SLEEP_POWDER",
        "PetalDance": "PETAL_DANCE",
        "StringShot": "STRING_SHOT",
        "DragonRage": "DRAGON_RAGE",
        "FireSpin": "FIRE_SPIN",
        "Thundershock": "THUNDERSHOCK",
        "Thunderbolt": "THUNDERBOLT",
        "ThunderWave": "THUNDER_WAVE",
        "RockThrow": "ROCK_THROW",
        "NightShade": "NIGHT_SHADE",
        "DefenseCurl": "DEFENSE_CURL",
        "ConfuseRay": "CONFUSE_RAY",
        "LightScreen": "LIGHT_SCREEN",
        "FocusEnergy": "FOCUS_ENERGY",
        "MirrorMove": "MIRROR_MOVE",
        "EggBomb": "EGG_BOMB",
        "BoneClub": "BONE_CLUB",
        "FireBlast": "FIRE_BLAST",
        "SkullBash": "SKULL_BASH",
        "SpikeCannon": "SPIKE_CANNON",
        "AcidArmor": "ACID_ARMOR",
        "HiJumpKick": "HI_JUMP_KICK",
        "DreamEater": "DREAM_EATER",
        "PoisonGas": "POISON_GAS",
        "LeechLife": "LEECH_LIFE",
        "LovelyKiss": "LOVELY_KISS",
        "SkyAttack": "SKY_ATTACK",
        "DizzyPunch": "DIZZY_PUNCH",
        "FurySwipes": "FURY_SWIPES",
        "HyperFang": "HYPER_FANG",
        "TriAttack": "TRI_ATTACK",
        "SuperFang": "SUPER_FANG",
        "Vicegrip": "VICEGRIP",
        "Guillotine": "GUILLOTINE",
        "RazorWind": "RAZOR_WIND",
        "SwordsDance": "SWORDS_DANCE",
        "KarateChop": "KARATE_CHOP",
        "CometPunch": "COMET_PUNCH",
        "MegaPunch": "MEGA_PUNCH",
        "MegaKick": "MEGA_KICK",
        "DoubleSlap": "DOUBLESLAP",
        "DoubleKick": "DOUBLE_KICK",
        "JumpKick": "JUMP_KICK",
        "TakeDown": "TAKE_DOWN",
        "BodySlam": "BODY_SLAM",
        "HornDrill": "HORN_DRILL",
        "FuryAttack": "FURY_ATTACK",
        "HornAttack": "HORN_ATTACK",
        "Dynamicpunch": "DYNAMICPUNCH",
        "Dragonbreath": "DRAGONBREATH",
        "Extremespeed": "EXTREMESPEED",
        "Ancientpower": "ANCIENTPOWER",
        "Conversion2": "CONVERSION2",
        "CottonSpore": "COTTON_SPORE",
        "PowderSnow": "POWDER_SNOW",
        "ScaryFace": "SCARY_FACE",
        "FaintAttack": "FAINT_ATTACK",
        "SweetKiss": "SWEET_KISS",
        "BellyDrum": "BELLY_DRUM",
        "SludgeBomb": "SLUDGE_BOMB",
        "MudSlap": "MUD_SLAP",
        "ZapCannon": "ZAP_CANNON",
        "DestinyBond": "DESTINY_BOND",
        "PerishSong": "PERISH_SONG",
        "IcyWind": "ICY_WIND",
        "BoneRush": "BONE_RUSH",
        "LockOn": "LOCK_ON",
        "GigaDrain": "GIGA_DRAIN",
        "FalseSwipe": "FALSE_SWIPE",
        "MilkDrink": "MILK_DRINK",
        "FuryCutter": "FURY_CUTTER",
        "SteelWing": "STEEL_WING",
        "MeanLook": "MEAN_LOOK",
        "SleepTalk": "SLEEP_TALK",
        "HealBell": "HEAL_BELL",
        "PainSplit": "PAIN_SPLIT",
        "SacredFire": "SACRED_FIRE",
        "BatonPass": "BATON_PASS",
        "RapidSpin": "RAPID_SPIN",
        "SweetScent": "SWEET_SCENT",
        "IronTail": "IRON_TAIL",
        "MetalClaw": "METAL_CLAW",
        "VitalThrow": "VITAL_THROW",
        "MorningSun": "MORNING_SUN",
        "HiddenPower": "HIDDEN_POWER",
        "CrossChop": "CROSS_CHOP",
        "RainDance": "RAIN_DANCE",
        "SunnyDay": "SUNNY_DAY",
        "MirrorCoat": "MIRROR_COAT",
        "PsychUp": "PSYCH_UP",
        "ShadowBall": "SHADOW_BALL",
        "FutureSight": "FUTURE_SIGHT",
        "RockSmash": "ROCK_SMASH",
        "BeatUp": "BEAT_UP",
        "QuickAttack": "QUICK_ATTACK",
        "SandAttack": "SAND_ATTACK",
        "DoubleEdge": "DOUBLE_EDGE",
        "TailWhip": "TAIL_WHIP",
        "PoisonSting": "POISON_STING",
        "PinMissile": "PIN_MISSILE",
        "WaterGun": "WATER_GUN",
        "HydroPump": "HYDRO_PUMP",
        "IceBeam": "ICE_BEAM",
        "DrillPeck": "DRILL_PECK",
        "LowKick": "LOW_KICK",
        "SeismicToss": "SEISMIC_TOSS",
        "MegaDrain": "MEGA_DRAIN",
        "LeechSeed": "LEECH_SEED",
        "RazorLeaf": "RAZOR_LEAF",
        "SolarBeam": "SOLAR_BEAM",
        "StringShot": "STRING_SHOT",
        "DragonRage": "DRAGON_RAGE",
        "FireSpin": "FIRE_SPIN",
        "ThunderWave": "THUNDER_WAVE",
        "RockThrow": "ROCK_THROW",
        "NightShade": "NIGHT_SHADE",
        "DoubleTeam": "DOUBLE_TEAM",
        "DefenseCurl": "DEFENSE_CURL",
        "ConfuseRay": "CONFUSE_RAY",
        "LightScreen": "LIGHT_SCREEN",
        "FocusEnergy": "FOCUS_ENERGY",
        "MirrorMove": "MIRROR_MOVE",
        "Selfdestruct": "SELFDESTRUCT",
        "EggBomb": "EGG_BOMB",
        "BoneClub": "BONE_CLUB",
        "FireBlast": "FIRE_BLAST",
        "SkullBash": "SKULL_BASH",
        "SpikeCannon": "SPIKE_CANNON",
        "AcidArmor": "ACID_ARMOR",
        "HiJumpKick": "HI_JUMP_KICK",
        "DreamEater": "DREAM_EATER",
        "PoisonGas": "POISON_GAS",
        "LeechLife": "LEECH_LIFE",
        "LovelyKiss": "LOVELY_KISS",
        "SkyAttack": "SKY_ATTACK",
        "DizzyPunch": "DIZZY_PUNCH",
        "FurySwipes": "FURY_SWIPES",
        "HyperFang": "HYPER_FANG",
        "TriAttack": "TRI_ATTACK",
        "SuperFang": "SUPER_FANG",
        "PayDay": "PAY_DAY",
        "FirePunch": "FIRE_PUNCH",
        "IcePunch": "ICE_PUNCH",
        "Thunderpunch": "THUNDERPUNCH",
        "SwordsDance": "SWORDS_DANCE",
        "WingAttack": "WING_ATTACK",
        "VineWhip": "VINE_WHIP",
        "DoubleKick": "DOUBLE_KICK",
        "RollingKick": "ROLLING_KICK",
        "JumpKick": "JUMP_KICK",
        "TakeDown": "TAKE_DOWN",
        "BodySlam": "BODY_SLAM",
        "DoubleEdge": "DOUBLE_EDGE",
        "TailWhip": "TAIL_WHIP",
        "HornDrill": "HORN_DRILL",
        "FuryAttack": "FURY_ATTACK",
        "HornAttack": "HORN_ATTACK",
        "HyperBeam": "HYPER_BEAM",
        "PsychicM": "PSYCHIC_M",
        "QuickAttack": "QUICK_ATTACK",
        "Softboiled": "SOFTBOILED",
        "Sonicboom": "SONICBOOM",
        "Vicegrip": "VICEGRIP",
        "KarateChop": "KARATE_CHOP",
        "DoubleSlap": "DOUBLESLAP",
        "CometPunch": "COMET_PUNCH",
        "MegaPunch": "MEGA_PUNCH",
        "MegaKick": "MEGA_KICK",
        "Twineedle": "TWINEEDLE",
        "PinMissile": "PIN_MISSILE",
        "BubbleBeam": "BUBBLEBEAM",
        "AuroraBeam": "AURORA_BEAM",
        "DrillPeck": "DRILL_PECK",
        "LowKick": "LOW_KICK",
        "SeismicToss": "SEISMIC_TOSS",
        "MegaDrain": "MEGA_DRAIN",
        "LeechSeed": "LEECH_SEED",
        "RazorLeaf": "RAZOR_LEAF",
        "SolarBeam": "SOLAR_BEAM",
        "Poisonpowder": "POISONPOWDER",
        "StunSpore": "STUN_SPORE",
        "SleepPowder": "SLEEP_POWDER",
        "PetalDance": "PETAL_DANCE",
        "StringShot": "STRING_SHOT",
        "DragonRage": "DRAGON_RAGE",
        "FireSpin": "FIRE_SPIN",
        "Thundershock": "THUNDERSHOCK",
        "Thunderbolt": "THUNDERBOLT",
        "ThunderWave": "THUNDER_WAVE",
        "RockThrow": "ROCK_THROW",
        "NightShade": "NIGHT_SHADE",
        "DoubleTeam": "DOUBLE_TEAM",
        "DefenseCurl": "DEFENSE_CURL",
        "Smokescreen": "SMOKESCREEN",
        "ConfuseRay": "CONFUSE_RAY",
        "LightScreen": "LIGHT_SCREEN",
        "FocusEnergy": "FOCUS_ENERGY",
        "MirrorMove": "MIRROR_MOVE",
        "Selfdestruct": "SELFDESTRUCT",
        "EggBomb": "EGG_BOMB",
        "BoneClub": "BONE_CLUB",
        "FireBlast": "FIRE_BLAST",
        "SkullBash": "SKULL_BASH",
        "SpikeCannon": "SPIKE_CANNON",
        "AcidArmor": "ACID_ARMOR",
        "HiJumpKick": "HI_JUMP_KICK",
        "DreamEater": "DREAM_EATER",
        "PoisonGas": "POISON_GAS",
        "LeechLife": "LEECH_LIFE",
        "LovelyKiss": "LOVELY_KISS",
        "SkyAttack": "SKY_ATTACK",
        "DizzyPunch": "DIZZY_PUNCH",
        "FurySwipes": "FURY_SWIPES",
        "HyperFang": "HYPER_FANG",
        "TriAttack": "TRI_ATTACK",
        "SuperFang": "SUPER_FANG",
        "FlameWheel": "FLAME_WHEEL",
        "CottonSpore": "COTTON_SPORE",
        "PowderSnow": "POWDER_SNOW",
        "MachPunch": "MACH_PUNCH",
        "ScaryFace": "SCARY_FACE",
        "FaintAttack": "FAINT_ATTACK",
        "SweetKiss": "SWEET_KISS",
        "BellyDrum": "BELLY_DRUM",
        "SludgeBomb": "SLUDGE_BOMB",
        "MudSlap": "MUD_SLAP",
        "ZapCannon": "ZAP_CANNON",
        "DestinyBond": "DESTINY_BOND",
        "PerishSong": "PERISH_SONG",
        "IcyWind": "ICY_WIND",
        "BoneRush": "BONE_RUSH",
        "LockOn": "LOCK_ON",
        "GigaDrain": "GIGA_DRAIN",
        "FalseSwipe": "FALSE_SWIPE",
        "MilkDrink": "MILK_DRINK",
        "FuryCutter": "FURY_CUTTER",
        "SteelWing": "STEEL_WING",
        "MeanLook": "MEAN_LOOK",
        "SleepTalk": "SLEEP_TALK",
        "HealBell": "HEAL_BELL",
        "PainSplit": "PAIN_SPLIT",
        "SacredFire": "SACRED_FIRE",
        "Dynamicpunch": "DYNAMICPUNCH",
        "Dragonbreath": "DRAGONBREATH",
        "BatonPass": "BATON_PASS",
        "RapidSpin": "RAPID_SPIN",
        "SweetScent": "SWEET_SCENT",
        "IronTail": "IRON_TAIL",
        "MetalClaw": "METAL_CLAW",
        "VitalThrow": "VITAL_THROW",
        "MorningSun": "MORNING_SUN",
        "HiddenPower": "HIDDEN_POWER",
        "CrossChop": "CROSS_CHOP",
        "RainDance": "RAIN_DANCE",
        "SunnyDay": "SUNNY_DAY",
        "MirrorCoat": "MIRROR_COAT",
        "PsychUp": "PSYCH_UP",
        "Extremespeed": "EXTREMESPEED",
        "Ancientpower": "ANCIENTPOWER",
        "ShadowBall": "SHADOW_BALL",
        "FutureSight": "FUTURE_SIGHT",
        "RockSmash": "ROCK_SMASH",
        "BeatUp": "BEAT_UP",
        "Conversion2": "CONVERSION2",
        "SpiderWeb": "SPIDER_WEB",
        "MindReader": "MIND_READER",
        "Megahorn": "MEGAHORN",
    }
    if name in special:
        return special[name]
    s1 = re.sub(r"([A-Z]+)([A-Z][a-z])", r"\1_\2", name)
    s2 = re.sub(r"([a-z0-9])([A-Z])", r"\1_\2", s1)
    return s2.upper()


def main() -> None:
    t = (ROOT / "tools" / "_pret_move_constants.asm").read_text(encoding="utf-8")
    moves: list[str] = []
    started = False
    for line in t.splitlines():
        m = re.match(r"^\tconst\s+([A-Z][A-Z0-9_]*)", line)
        if not m:
            continue
        name = m.group(1)
        if name.startswith("ANIM_") or name.startswith("NUM_"):
            continue
        if name == "POUND":
            started = True
        if not started:
            continue
        moves.append(name)
        if name == "BEAT_UP":
            break
    gsc = {m: DUMP[304 + i] for i, m in enumerate(moves)}

    path = ROOT / "data" / "moves" / "descriptions.asm"
    text = path.read_text(encoding="utf-8")
    pattern = re.compile(
        r"^((?:[A-Za-z0-9_]+Description:\n)+)((?:\t(?:text|next|line|cont|para|done).*\n)+)",
        re.M,
    )
    replaced = 0
    skipped = 0

    def sub(m: re.Match) -> str:
        nonlocal replaced, skipped
        labels = m.group(1)
        lab_list = re.findall(r"([A-Za-z0-9_]+)Description:", labels)
        keys = []
        for lab in lab_list:
            k = camel_to_const(lab)
            if k in gsc:
                keys.append(k)
        if not keys:
            return m.group(0)
        # Only pure GSC label sets with identical dump text
        if any(camel_to_const(lab) not in gsc for lab in lab_list):
            skipped += 1
            return m.group(0)
        texts = {gsc[k] for k in keys}
        if len(texts) > 1:
            skipped += 1
            return m.group(0)
        replaced += 1
        return labels + dump_to_block(gsc[keys[0]])

    def dump_to_block(raw: str) -> str:
        s = raw.strip()
        if s.endswith("@"):
            s = s[:-1]
        s = s.replace("<PKMN>", "#MON").replace("<PK><MN>", "#MON")
        parts = [p for p in s.split("<NEXT>") if p != ""]
        if not parts:
            parts = ["?"]
        out = [f'\ttext "{parts[0]}"']
        for p in parts[1:]:
            out.append(f'\tnext "{p}"')
        out += ["\tdone", ""]
        return "\n".join(out)

    # bind local dump_to_block into sub via default - redefine sub properly
    def sub2(m: re.Match) -> str:
        nonlocal replaced, skipped
        labels = m.group(1)
        lab_list = re.findall(r"([A-Za-z0-9_]+)Description:", labels)
        keys = []
        for lab in lab_list:
            k = camel_to_const(lab)
            if k in gsc:
                keys.append(k)
        if not keys:
            return m.group(0)
        if any(camel_to_const(lab) not in gsc for lab in lab_list):
            skipped += 1
            return m.group(0)
        texts = {gsc[k] for k in keys}
        if len(texts) > 1:
            skipped += 1
            return m.group(0)
        replaced += 1
        return labels + dump_to_block(gsc[keys[0]])

    new_text = pattern.sub(sub2, text).replace("#mon", "#MON")
    path.write_text(new_text, encoding="utf-8")
    print(f"safe move blocks replaced={replaced} skipped_mixed={skipped}")


if __name__ == "__main__":
    main()
