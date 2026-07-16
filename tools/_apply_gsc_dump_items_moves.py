#!/usr/bin/env python3
"""Apply GSC-DE dump move + item descriptions. Abilities stay C (untouched)."""
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
    out.append("\tdone")
    out.append("")
    return "\n".join(out)


def camel_to_const(name: str) -> str:
    """Thunderpunch -> THUNDERPUNCH, KarateChop -> KARATE_CHOP, DoubleSlap -> DOUBLE_SLAP then fix."""
    special = {
        "DoubleSlap": "DOUBLESLAP",
        "Thunderpunch": "THUNDERPUNCH",
        "Thundershock": "THUNDERSHOCK",
        "ThunderShock": "THUNDERSHOCK",
        "Vicegrip": "VICEGRIP",
        "Sonicboom": "SONICBOOM",
        "Softboiled": "SOFTBOILED",
        "Selfdestruct": "SELFDESTRUCT",
        "SelfDestruct": "SELFDESTRUCT",
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
        "HighJumpKick": "HI_JUMP_KICK",
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
        "DoubleSlap": "DOUBLESLAP",
        "BodySlam": "BODY_SLAM",
        "WaterGun": "WATER_GUN",
        "HydroPump": "HYDRO_PUMP",
        "IceBeam": "ICE_BEAM",
        "Psybeam": "PSYBEAM",
        "AuroraBeam": "AURORA_BEAM",
        "HyperBeam": "HYPER_BEAM",
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
        "Kinesis": "KINESIS",
        "DreamEater": "DREAM_EATER",
        "PoisonGas": "POISON_GAS",
        "LeechLife": "LEECH_LIFE",
        "LovelyKiss": "LOVELY_KISS",
        "SkyAttack": "SKY_ATTACK",
        "DizzyPunch": "DIZZY_PUNCH",
        "Flash": "FLASH",
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
        "Megahorn": "MEGAHORN",
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
        "Harden": "HARDEN",
        "Minimize": "MINIMIZE",
        "SmokeScreen": "SMOKESCREEN",
        "Smokescreen": "SMOKESCREEN",
        "ConfuseRay": "CONFUSE_RAY",
        "Withdraw": "WITHDRAW",
        "Barrier": "BARRIER",
        "LightScreen": "LIGHT_SCREEN",
        "Haze": "HAZE",
        "Reflect": "REFLECT",
        "FocusEnergy": "FOCUS_ENERGY",
        "Bide": "BIDE",
        "Metronome": "METRONOME",
        "MirrorMove": "MIRROR_MOVE",
        "Amnesia": "AMNESIA",
        "Telepathy": "TELEPATHY",  # not GSC
        "PsychicM": "PSYCHIC_M",
        "FireBlast": "FIRE_BLAST",
        "Waterfall": "WATERFALL",
        "Swift": "SWIFT",
        "SuperSonic": "SUPERSONIC",
        "Supersonic": "SUPERSONIC",
        "SonicBoom": "SONICBOOM",
        "Disable": "DISABLE",
        "Ember": "EMBER",
        "Flamethrower": "FLAMETHROWER",
        "Mist": "MIST",
        "Surf": "SURF",
        "Blizzard": "BLIZZARD",
        "Peck": "PECK",
        "Counter": "COUNTER",
        "Strength": "STRENGTH",
        "Absorb": "ABSORB",
        "Growth": "GROWTH",
        "Thunder": "THUNDER",
        "Thunderbolt": "THUNDERBOLT",
        "Earthquake": "EARTHQUAKE",
        "Fissure": "FISSURE",
        "Dig": "DIG",
        "Toxic": "TOXIC",
        "Confusion": "CONFUSION",
        "Hypnosis": "HYPNOSIS",
        "Meditate": "MEDITATE",
        "Agility": "AGILITY",
        "Rage": "RAGE",
        "Teleport": "TELEPORT",
        "NightShade": "NIGHT_SHADE",
        "Mimic": "MIMIC",
        "Screech": "SCREECH",
        "DoubleTeam": "DOUBLE_TEAM",
        "Recover": "RECOVER",
        "Lick": "LICK",
        "Smog": "SMOG",
        "Sludge": "SLUDGE",
        "FireBlast": "FIRE_BLAST",
        "Clamp": "CLAMP",
        "SpikeCannon": "SPIKE_CANNON",
        "Constrict": "CONSTRICT",
        "Glare": "GLARE",
        "Barrage": "BARRAGE",
        "LeechLife": "LEECH_LIFE",
        "Transform": "TRANSFORM",
        "Bubble": "BUBBLE",
        "Spore": "SPORE",
        "Flash": "FLASH",
        "Psywave": "PSYWAVE",
        "Splash": "SPLASH",
        "Crabhammer": "CRABHAMMER",
        "Explosion": "EXPLOSION",
        "FurySwipes": "FURY_SWIPES",
        "Bonemerang": "BONEMERANG",
        "Rest": "REST",
        "RockSlide": "ROCK_SLIDE",
        "HyperFang": "HYPER_FANG",
        "Sharpen": "SHARPEN",
        "Conversion": "CONVERSION",
        "TriAttack": "TRI_ATTACK",
        "Slash": "SLASH",
        "Substitute": "SUBSTITUTE",
        "Struggle": "STRUGGLE",
        "Sketch": "SKETCH",
        "Thief": "THIEF",
        "Nightmare": "NIGHTMARE",
        "FlameWheel": "FLAME_WHEEL",
        "Snore": "SNORE",
        "Curse": "CURSE",
        "Flail": "FLAIL",
        "Conversion2": "CONVERSION2",
        "Aeroblast": "AEROBLAST",
        "Reversal": "REVERSAL",
        "Spite": "SPITE",
        "Protect": "PROTECT",
        "MachPunch": "MACH_PUNCH",
        "Detect": "DETECT",
        "Outrage": "OUTRAGE",
        "Sandstorm": "SANDSTORM",
        "Endure": "ENDURE",
        "Charm": "CHARM",
        "Rollout": "ROLLOUT",
        "Swagger": "SWAGGER",
        "Spark": "SPARK",
        "Attract": "ATTRACT",
        "Return": "RETURN",
        "Present": "PRESENT",
        "Frustration": "FRUSTRATION",
        "Safeguard": "SAFEGUARD",
        "Magnitude": "MAGNITUDE",
        "Encore": "ENCORE",
        "Pursuit": "PURSUIT",
        "IronTail": "IRON_TAIL",
        "MetalClaw": "METAL_CLAW",
        "MorningSun": "MORNING_SUN",
        "Synthesis": "SYNTHESIS",
        "Moonlight": "MOONLIGHT",
        "Twister": "TWISTER",
        "Crunch": "CRUNCH",
        "PsychUp": "PSYCH_UP",
        "Whirlpool": "WHIRLPOOL",
        "Gust": "GUST",
        "Whirlwind": "WHIRLWIND",
        "Fly": "FLY",
        "Bind": "BIND",
        "Slam": "SLAM",
        "Stomp": "STOMP",
        "Headbutt": "HEADBUTT",
        "HornAttack": "HORN_ATTACK",
        "Wrap": "WRAP",
        "Thrash": "THRASH",
        "TailWhip": "TAIL_WHIP",
        "Leer": "LEER",
        "Bite": "BITE",
        "Growl": "GROWL",
        "Roar": "ROAR",
        "Sing": "SING",
        "Supersonic": "SUPERSONIC",
        "Disable": "DISABLE",
        "Acid": "ACID",
        "Ember": "EMBER",
        "Mist": "MIST",
        "WaterGun": "WATER_GUN",
        "IceBeam": "ICE_BEAM",
        "Blizzard": "BLIZZARD",
        "Peck": "PECK",
        "Counter": "COUNTER",
        "Strength": "STRENGTH",
        "Absorb": "ABSORB",
        "Growth": "GROWTH",
        "Thunder": "THUNDER",
        "Earthquake": "EARTHQUAKE",
        "Dig": "DIG",
        "Toxic": "TOXIC",
        "Confusion": "CONFUSION",
        "Hypnosis": "HYPNOSIS",
        "Meditate": "MEDITATE",
        "Agility": "AGILITY",
        "QuickAttack": "QUICK_ATTACK",
        "Rage": "RAGE",
        "Teleport": "TELEPORT",
        "Mimic": "MIMIC",
        "Screech": "SCREECH",
        "DoubleTeam": "DOUBLE_TEAM",
        "Recover": "RECOVER",
        "Harden": "HARDEN",
        "Minimize": "MINIMIZE",
        "Smokescreen": "SMOKESCREEN",
        "ConfuseRay": "CONFUSE_RAY",
        "Withdraw": "WITHDRAW",
        "DefenseCurl": "DEFENSE_CURL",
        "Barrier": "BARRIER",
        "LightScreen": "LIGHT_SCREEN",
        "Haze": "HAZE",
        "Reflect": "REFLECT",
        "FocusEnergy": "FOCUS_ENERGY",
        "Bide": "BIDE",
        "Metronome": "METRONOME",
        "MirrorMove": "MIRROR_MOVE",
        "Selfdestruct": "SELFDESTRUCT",
        "Lick": "LICK",
        "Smog": "SMOG",
        "Sludge": "SLUDGE",
        "BoneClub": "BONE_CLUB",
        "FireBlast": "FIRE_BLAST",
        "Waterfall": "WATERFALL",
        "Clamp": "CLAMP",
        "Swift": "SWIFT",
        "SkullBash": "SKULL_BASH",
        "SpikeCannon": "SPIKE_CANNON",
        "Constrict": "CONSTRICT",
        "Amnesia": "AMNESIA",
        "Kinesis": "KINESIS",
        "Softboiled": "SOFTBOILED",
        "Glare": "GLARE",
        "DreamEater": "DREAM_EATER",
        "PoisonGas": "POISON_GAS",
        "Barrage": "BARRAGE",
        "LeechLife": "LEECH_LIFE",
        "LovelyKiss": "LOVELY_KISS",
        "SkyAttack": "SKY_ATTACK",
        "Transform": "TRANSFORM",
        "Bubble": "BUBBLE",
        "DizzyPunch": "DIZZY_PUNCH",
        "Spore": "SPORE",
        "Flash": "FLASH",
        "Psywave": "PSYWAVE",
        "Splash": "SPLASH",
        "AcidArmor": "ACID_ARMOR",
        "Crabhammer": "CRABHAMMER",
        "Explosion": "EXPLOSION",
        "FurySwipes": "FURY_SWIPES",
        "Bonemerang": "BONEMERANG",
        "Rest": "REST",
        "RockSlide": "ROCK_SLIDE",
        "HyperFang": "HYPER_FANG",
        "Sharpen": "SHARPEN",
        "Conversion": "CONVERSION",
        "TriAttack": "TRI_ATTACK",
        "SuperFang": "SUPER_FANG",
        "Slash": "SLASH",
        "Substitute": "SUBSTITUTE",
        "Struggle": "STRUGGLE",
        "Pound": "POUND",
        "KarateChop": "KARATE_CHOP",
        "CometPunch": "COMET_PUNCH",
        "MegaPunch": "MEGA_PUNCH",
        "PayDay": "PAY_DAY",
        "FirePunch": "FIRE_PUNCH",
        "IcePunch": "ICE_PUNCH",
        "Scratch": "SCRATCH",
        "Vicegrip": "VICEGRIP",
        "Guillotine": "GUILLOTINE",
        "RazorWind": "RAZOR_WIND",
        "SwordsDance": "SWORDS_DANCE",
        "Cut": "CUT",
        "Gust": "GUST",
        "WingAttack": "WING_ATTACK",
        "Whirlwind": "WHIRLWIND",
        "Fly": "FLY",
        "Bind": "BIND",
        "Slam": "SLAM",
        "VineWhip": "VINE_WHIP",
        "Stomp": "STOMP",
        "DoubleKick": "DOUBLE_KICK",
        "MegaKick": "MEGA_KICK",
        "JumpKick": "JUMP_KICK",
        "RollingKick": "ROLLING_KICK",
        "SandAttack": "SAND_ATTACK",
        "Headbutt": "HEADBUTT",
        "HornAttack": "HORN_ATTACK",
        "FuryAttack": "FURY_ATTACK",
        "HornDrill": "HORN_DRILL",
        "Tackle": "TACKLE",
        "BodySlam": "BODY_SLAM",
        "Wrap": "WRAP",
        "TakeDown": "TAKE_DOWN",
        "Thrash": "THRASH",
        "DoubleEdge": "DOUBLE_EDGE",
        "TailWhip": "TAIL_WHIP",
        "PoisonSting": "POISON_STING",
        "Twineedle": "TWINEEDLE",
        "PinMissile": "PIN_MISSILE",
        "Leer": "LEER",
        "Bite": "BITE",
        "Growl": "GROWL",
        "Roar": "ROAR",
        "Sing": "SING",
        "Supersonic": "SUPERSONIC",
        "Sonicboom": "SONICBOOM",
        "Disable": "DISABLE",
        "Acid": "ACID",
        "Ember": "EMBER",
        "Flamethrower": "FLAMETHROWER",
        "WaterGun": "WATER_GUN",
        "HydroPump": "HYDRO_PUMP",
        "Surf": "SURF",
        "IceBeam": "ICE_BEAM",
        "Blizzard": "BLIZZARD",
        "Psybeam": "PSYBEAM",
        "BubbleBeam": "BUBBLEBEAM",
        "AuroraBeam": "AURORA_BEAM",
        "HyperBeam": "HYPER_BEAM",
        "Peck": "PECK",
        "DrillPeck": "DRILL_PECK",
        "Submission": "SUBMISSION",
        "LowKick": "LOW_KICK",
        "Counter": "COUNTER",
        "SeismicToss": "SEISMIC_TOSS",
        "Strength": "STRENGTH",
        "Absorb": "ABSORB",
        "MegaDrain": "MEGA_DRAIN",
        "LeechSeed": "LEECH_SEED",
        "Growth": "GROWTH",
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
        "Thunder": "THUNDER",
        "RockThrow": "ROCK_THROW",
        "Earthquake": "EARTHQUAKE",
        "Fissure": "FISSURE",
        "Dig": "DIG",
        "Toxic": "TOXIC",
        "Confusion": "CONFUSION",
        "PsychicM": "PSYCHIC_M",
        "Hypnosis": "HYPNOSIS",
        "Meditate": "MEDITATE",
        "Agility": "AGILITY",
        "QuickAttack": "QUICK_ATTACK",
        "Rage": "RAGE",
        "Teleport": "TELEPORT",
        "NightShade": "NIGHT_SHADE",
        "Mimic": "MIMIC",
        "Screech": "SCREECH",
        "DoubleTeam": "DOUBLE_TEAM",
        "Recover": "RECOVER",
        "Harden": "HARDEN",
        "Minimize": "MINIMIZE",
        "Smokescreen": "SMOKESCREEN",
        "ConfuseRay": "CONFUSE_RAY",
        "Withdraw": "WITHDRAW",
        "DefenseCurl": "DEFENSE_CURL",
        "Barrier": "BARRIER",
        "LightScreen": "LIGHT_SCREEN",
        "Haze": "HAZE",
        "Reflect": "REFLECT",
        "FocusEnergy": "FOCUS_ENERGY",
        "Bide": "BIDE",
        "Metronome": "METRONOME",
        "MirrorMove": "MIRROR_MOVE",
        "Selfdestruct": "SELFDESTRUCT",
        "EggBomb": "EGG_BOMB",
        "Lick": "LICK",
        "Smog": "SMOG",
        "Sludge": "SLUDGE",
        "BoneClub": "BONE_CLUB",
        "FireBlast": "FIRE_BLAST",
        "Waterfall": "WATERFALL",
        "Clamp": "CLAMP",
        "Swift": "SWIFT",
        "SkullBash": "SKULL_BASH",
        "SpikeCannon": "SPIKE_CANNON",
        "Constrict": "CONSTRICT",
        "Amnesia": "AMNESIA",
        "Kinesis": "KINESIS",
        "Softboiled": "SOFTBOILED",
        "HiJumpKick": "HI_JUMP_KICK",
        "Glare": "GLARE",
        "DreamEater": "DREAM_EATER",
        "PoisonGas": "POISON_GAS",
        "Barrage": "BARRAGE",
        "LeechLife": "LEECH_LIFE",
        "LovelyKiss": "LOVELY_KISS",
        "SkyAttack": "SKY_ATTACK",
        "Transform": "TRANSFORM",
        "Bubble": "BUBBLE",
        "DizzyPunch": "DIZZY_PUNCH",
        "Spore": "SPORE",
        "Flash": "FLASH",
        "Psywave": "PSYWAVE",
        "Splash": "SPLASH",
        "AcidArmor": "ACID_ARMOR",
        "Crabhammer": "CRABHAMMER",
        "Explosion": "EXPLOSION",
        "FurySwipes": "FURY_SWIPES",
        "Bonemerang": "BONEMERANG",
        "Rest": "REST",
        "RockSlide": "ROCK_SLIDE",
        "HyperFang": "HYPER_FANG",
        "Sharpen": "SHARPEN",
        "Conversion": "CONVERSION",
        "TriAttack": "TRI_ATTACK",
        "SuperFang": "SUPER_FANG",
        "Slash": "SLASH",
        "Substitute": "SUBSTITUTE",
        "Struggle": "STRUGGLE",
    }
    if name in special:
        return special[name]
    s1 = re.sub(r"([A-Z]+)([A-Z][a-z])", r"\1_\2", name)
    s2 = re.sub(r"([a-z0-9])([A-Z])", r"\1_\2", s1)
    return s2.upper()


def load_gsc_move_descs() -> dict[str, str]:
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
    descs = [DUMP[i] for i in range(304, 304 + len(moves))]
    return dict(zip(moves, descs))


def apply_moves() -> int:
    path = ROOT / "data" / "moves" / "descriptions.asm"
    text = path.read_text(encoding="utf-8")
    gsc = load_gsc_move_descs()
    replaced = 0

    # Match description definition blocks
    pattern = re.compile(
        r"^((?:[A-Za-z0-9_]+Description:\n)+)((?:\t(?:text|next|line|cont|para|done).*\n)+)",
        re.M,
    )

    def sub(m: re.Match) -> str:
        nonlocal replaced
        labels = m.group(1)
        lab_list = re.findall(r"([A-Za-z0-9_]+)Description:", labels)
        key = None
        for lab in lab_list:
            k = camel_to_const(lab)
            if k in gsc:
                key = k
                break
        if not key:
            return m.group(0)
        replaced += 1
        return labels + dump_to_block(gsc[key])

    new_text = pattern.sub(sub, text)
    # normalize
    new_text = new_text.replace("#mon", "#MON")
    path.write_text(new_text, encoding="utf-8")
    return replaced


def load_item_dump() -> tuple[list[str], list[str]]:
    """Return parallel lists of non-TERU item dump names and descs."""
    names: list[str] = []
    for i in range(8481, 8737):
        l = DUMP[i].strip()
        if l.endswith("@"):
            names.append(l[:-1])
        else:
            break
    raw: list[str] = []
    for i in range(8737, 8935):
        l = DUMP[i].strip()
        if l == "PFUND@":
            break
        if l.endswith("@") and ("<NEXT>" in l or (len(l) > 12 and not re.match(r"^[A-ZÄÖÜ#][A-ZÄÖÜ\- #]*@$", l))):
            raw.append(l[:-1])
        elif l.endswith("@") and "<NEXT>" in l:
            raw.append(l[:-1])
    # walk names: skip TERU for desc consumption
    pairs_names: list[str] = []
    pairs_descs: list[str] = []
    di = 0
    for n in names:
        if n in ("TERU-SAMA", "?"):
            continue
        if di >= len(raw):
            break
        pairs_names.append(n)
        pairs_descs.append(raw[di])
        di += 1
    return pairs_names, pairs_descs


# Map dump CAPS name -> PC description label(s) to try
DUMP_NAME_TO_LABELS = {
    "MEISTERBALL": ["MasterBallDesc"],
    "HYPERBALL": ["UltraBallDesc"],
    "BLENDPUDER": ["BrightPowderDesc"],
    "SUPERBALL": ["GreatBallDesc"],
    "#BALL": ["PokeBallDesc"],
    "FAHRRAD": ["BicycleDesc"],
    "MONDSTEIN": ["MoonStoneDesc"],
    "GEGENGIFT": ["AntidoteDesc"],
    "FEUERHEILER": ["BurnHealDesc"],
    "EISHEILER": ["IceHealDesc"],
    "AUFWECKER": ["AwakeningDesc"],
    "PARA-HEILER": ["ParalyzeHealDesc", "ParlyzHealDesc"],
    "TOP-GENESUNG": ["FullRestoreDesc"],
    "TOP-TRANK": ["MaxPotionDesc"],
    "HYPERTRANK": ["HyperPotionDesc"],
    "SUPERTRANK": ["SuperPotionDesc"],
    "TRANK": ["PotionDesc"],
    "FLUCHTSEIL": ["EscapeRopeDesc"],
    "SCHUTZ": ["RepelDesc"],
    "TOP-ELIXIER": ["MaxElixirDesc"],
    "FEUERSTEIN": ["FireStoneDesc"],
    "DONNERSTEIN": ["ThunderStoneDesc", "ThunderstoneDesc"],
    "WASSERSTEIN": ["WaterStoneDesc"],
    "KP-PLUS": ["HPUpDesc"],
    "PROTEIN": ["ProteinDesc"],
    "EISEN": ["IronDesc"],
    "CARBON": ["CarbosDesc"],
    "LUCKY PUNCH": ["LuckyPunchDesc"],
    "KALZIUM": ["CalciumDesc"],
    "SONDERBONBON": ["RareCandyDesc"],
    "X-TREFFER": ["XAccuracyDesc"],
    "BLATTSTEIN": ["LeafStoneDesc"],
    "METALLSTAUB": ["MetalPowderDesc"],
    "NUGGET": ["NuggetDesc"],
    "#PUPPE": ["PokeDollDesc"],
    "HYPERHEILER": ["FullHealDesc"],
    "BELEBER": ["ReviveDesc"],
    "TOP-BELEBER": ["MaxReviveDesc"],
    "MEGABLOCK": ["GuardSpecDesc"],
    "SUPERSCHUTZ": ["SuperRepelDesc"],
    "TOP-SCHUTZ": ["MaxRepelDesc"],
    "ANGRIFFPLUS": ["DireHitDesc"],
    "TAFELWASSER": ["FreshWaterDesc"],
    "SPRUDEL": ["SodaPopDesc"],
    "LIMONADE": ["LemonadeDesc"],
    "X-ANGRIFF": ["XAttackDesc"],
    "X-ABWEHR": ["XDefendDesc"],
    "X-TEMPO": ["XSpeedDesc"],
    "X-SPEZIAL": ["XSpecialDesc"],
    "MÜNZKORB": ["CoinCaseDesc"],
    "DETEKTOR": ["ItemfinderDesc"],
    "EP-TEILER": ["ExpShareDesc"],
    "ANGEL": ["OldRodDesc"],
    "PROFIANGEL": ["GoodRodDesc"],
    "SILBERBLATT": ["SilverLeafDesc"],
    "SUPERANGEL": ["SuperRodDesc"],
    "AP-PLUS": ["PPUpDesc"],
    "ÄTHER": ["EtherDesc"],
    "TOP-ÄTHER": ["MaxEtherDesc"],
    "ELIXIER": ["ElixirDesc"],
    "ROTE HAUT": ["RedScaleDesc"],
    "GEHEIMTRANK": ["SecretPotionDesc"],
    "BOOTSTICKET": ["SSTicketDesc"],
    "RÄTSEL-EI": ["MysteryEggDesc"],
    "KLARGLOCKE": ["ClearBellDesc"],
    "SILBERFLÜGEL": ["SilverWingDesc"],
    "KUHMUH-MILCH": ["MoomooMilkDesc"],
    "FLINKKLAUE": ["QuickClawDesc"],
    "GGNGIFTBEERE": ["PSNCureBerryDesc", "AntidoteBerryDesc"],
    "GOLDBLATT": ["GoldLeafDesc"],
    "PUDERSAND": ["SoftSandDesc"],
    "HACKATTACK": ["SharpBeakDesc"],
    "ANTIPARBEERE": ["PRZCureBerryDesc"],
    "BRANDBEERE": ["BurntBerryDesc"],
    "EISBEERE": ["IceBerryDesc"],
    "GIFTSTICH": ["PoisonBarbDesc"],
    "KING-STEIN": ["KingsRockDesc"],
    "BITTERBEERE": ["BitterBerryDesc"],
    "MINZBEERE": ["MintBerryDesc"],
    "MINIPILZ": ["TinyMushroomDesc"],
    "RIESENPILZ": ["BigMushroomDesc"],
    "SILBERSTAUB": ["SilverPowderDesc"],
    "MÜNZAMULETT": ["AmuletCoinDesc"],
    "SCHUTZBAND": ["CleanseTagDesc"],
    "ZAUBERWASSER": ["MysticWaterDesc"],
    "KRÜMMLÖFFEL": ["TwistedSpoonDesc"],
    "SCHWARZGURT": ["BlackBeltDesc"],
    "SCHATTENGLAS": ["BlackGlassesDesc"],
    "FLEGMONRUTE": ["SlowpokeTailDesc"],
    "ROSA BAND": ["PinkBowDesc"],
    "LAUCHSTANGE": ["StickDesc"],
    "RAUCHBALL": ["SmokeBallDesc"],
    "EWIGES EIS": ["NeverMeltIceDesc"],
    "MAGNET": ["MagnetDesc"],
    "WUNDERBEERE": ["MiracleBerryDesc"],
    "PERLE": ["PearlDesc"],
    "RIESENPERLE": ["BigPearlDesc"],
    "EWIGSTEIN": ["EverstoneDesc"],
    "BANNSTICKER": ["SpellTagDesc"],
    "WUTKEKS": ["RageCandyBarDesc"],
    "GS-BALL": ["GSBallDesc"],
    "BLAUE KARTE": ["BlueCardDesc"],
    "WUNDERSAAT": ["MiracleSeedDesc"],
    "KAMPFKNOCHEN": ["ThickClubDesc"],
    "FOKUS-BAND": ["FocusBandDesc"],
    "ENERGIESTAUB": ["EnergypowderDesc", "EnergyPowderDesc"],
    "KRAFTWURZEL": ["EnergyRootDesc"],
    "HEILPUDER": ["HealPowderDesc"],
    "VITALKRAUT": ["RevivalHerbDesc"],
    "GRANITSTEIN": ["HardStoneDesc"],
    "GLÜCKS-EI": ["LuckyEggDesc"],
    "TÜRÖFFNER": ["CardKeyDesc"],
    "SPULE": ["MachinePartDesc"],
    "EI-TICKET": ["EggTicketDesc"],
    "FUNDSACHE": ["LostItemDesc"],
    "STERNENSTAUB": ["StardustDesc"],
    "STERNENSTÜCK": ["StarPieceDesc"],
    "KELLERÖFFNER": ["BasementKeyDesc"],
    "FAHRSCHEIN": ["PassDesc"],
    "HOLZKOHLE": ["CharcoalDesc"],
    "BEERENSAFT": ["BerryJuiceDesc"],
    "SCOPE-LINSE": ["ScopeLensDesc"],
    "METALLMANTEL": ["MetalCoatDesc"],
    "DRACHENZAHN": ["DragonFangDesc"],
    "ÜBERRESTE": ["LeftoversDesc"],
    "RÄTSELBEERE": ["MysteryBerryDesc"],
    "DRACHENHAUT": ["DragonScaleDesc"],
    "BERSERK-GEN": ["BerserkGeneDesc"],
    "ZAUBERASCHE": ["SacredAshDesc"],
    "SCHWERBALL": ["HeavyBallDesc"],
    "BLUMENBRIEF": ["FlowerMailDesc"],
    "LEVELBALL": ["LevelBallDesc"],
    "KÖDERBALL": ["LureBallDesc"],
    "TURBOBALL": ["FastBallDesc"],
    "KUGELBLITZ": ["LightBallDesc"],
    "FREUNDESBALL": ["FriendBallDesc"],
    "MONDBALL": ["MoonBallDesc"],
    "SYMPABALL": ["LoveBallDesc"],
    "SONNENSTEIN": ["SunStoneDesc"],
    "POLTURBO": ["PolkadotBowDesc"],  # may not match
}


def apply_items() -> int:
    names, descs = load_item_dump()
    dump_map = dict(zip(names, descs))
    path = ROOT / "data" / "items" / "descriptions.asm"
    text = path.read_text(encoding="utf-8")
    replaced = 0
    for dump_name, labels in DUMP_NAME_TO_LABELS.items():
        if dump_name not in dump_map:
            continue
        block = dump_to_block(dump_map[dump_name])
        for lab in labels:
            pat = re.compile(
                rf"^({lab}:\n)((?:\t(?:text|next|line|cont|para|done).*\n)+)",
                re.M,
            )
            text2, n = pat.subn(lambda m, b=block: m.group(1) + b, text, count=1)
            if n:
                text = text2
                replaced += 1
                break
    text = text.replace("#mon", "#MON")
    path.write_text(text, encoding="utf-8")

    # Item names: align a few dump-critical display forms
    npath = ROOT / "data" / "items" / "names.asm"
    nt = npath.read_text(encoding="utf-8")
    # X-SpezAngr is PC split; GSC had X-SPEZIAL — keep both SpA/SpD in PC but ensure X-Spezial exists if only one
    # Prefer dump "X-Spezial" only if PC has single special; PC has X-SpezAngr and X-SpezVert - leave
    if 'li "X-Spezial"' not in nt and 'li "X-SpezAngr"' in nt:
        pass  # PC-expanded, keep
    npath.write_text(nt, encoding="utf-8")
    return replaced


def main():
    print("GSC moves in dump:", len(load_gsc_move_descs()))
    mr = apply_moves()
    print("Move description blocks replaced:", mr)
    ir = apply_items()
    print("Item description labels replaced:", ir)


if __name__ == "__main__":
    main()
