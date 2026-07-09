#!/usr/bin/env python3
"""Generate German dex_entries.asm from English source + translation data."""
import re
import pathlib

SRC = pathlib.Path(__file__).resolve().parent.parent / "data" / "pokemon" / "dex_entries.asm"
DST = SRC  # overwrite in place

MAX_WIDTH = 18

# category: English -> German (short form for db line)
CAT = {
    "Seed": "Samen", "Lizard": "Eidechse", "Flame": "Flamme",
    "Tiny Turtle": "Minikröte", "Turtle": "Schildkröte",
    "Shellfish": "Panzerweich", "Shell": "Panzer", "Worm": "Wurm",
    "Cocoon": "Kokon", "Butterfly": "Falter", "Hairy Bug": "Raupe",
    "Poison Bee": "Giftbiene", "Tiny Bird": "Minivogel", "Bird": "Vogel",
    "Rat": "Ratte", "Beak": "Pick", "Snake": "Schlange", "Cobra": "Natter",
    "Mouse": "Maus", "Poison Pin": "Giftstachel", "Drill": "Bohrer",
    "Fairy": "Fee", "Fox": "Fuchs", "Balloon": "Ballon", "Bat": "Fledermaus",
    "Weed": "Unkraut", "Flower": "Blume", "Mushroom": "Pilz", "Insect": "Insekt",
    "Poison Moth": "Giftmotte", "Mole": "Maulwurf", "Scratch Cat": "Katze",
    "Classy Cat": "Samtpfote", "Duck": "Ente", "Pig Monkey": "Schweinaffe",
    "Puppy": "Welpe", "Legendary": "Legendär", "Tadpole": "Quappe",
    "Psi": "Psi", "Superpower": "Kraftprotz", "Flycatcher": "Fliegenfalle",
    "Jellyfish": "Qualle", "Rock": "Felsen", "Megaton": "Gewicht",
    "Fire Horse": "Feuerpferd", "Dopey": "Dösig", "Hermit Crab": "Einsiedler",
    "Squatter": "Schmarotzer", "Magnet": "Magnet", "Wild Duck": "Entoron",
    "Twin Bird": "Duovogel", "Triple Bird": "Triovogel", "Sea Lion": "Seehund",
    "Sludge": "Schlamm", "Bivalve": "Muschel", "Gas": "Gas", "Shadow": "Schatten",
    "Rock Snake": "Felsenschlange", "Hypnosis": "Hypnose",
    "River Crab": "Flusskrabbe", "Pincer": "Schere", "Ball": "Ball", "Egg": "Ei",
    "Coconut": "Kokosnuss", "Lonely": "Einsam", "Bone Keeper": "Knochenhüter",
    "Kicking": "Kicker", "Punching": "Puncher", "Licking": "Schlecker",
    "Poison Gas": "Giftgas", "Spikes": "Stachel", "Vine": "Kletterer",
    "Parent": "Mutter", "Dragon": "Drache", "Goldfish": "Goldfisch",
    "Star Shape": "Stern", "Mysterious": "Mysterium", "Barrier": "Barriere",
    "Mantis": "Sichelkäfer", "Human Shape": "Humanoid", "Electric": "Elektro",
    "Spitfire": "Feuer", "Stag Beetle": "Hirschkäfer", "Wild Bull": "Wildbulle",
    "Fish": "Fisch", "Atrocious": "Brutal", "Transport": "Transport",
    "Transform": "Transform", "Evolution": "Evolution", "Bubble Jet": "Blubber",
    "Lightning": "Blitz", "Virtual": "Virtuell", "Spiral": "Spirale",
    "Fossil": "Fossil", "Sleeping": "Schläfer", "Freeze": "Gefrier",
    "Genetic": "Genmutant", "New Species": "Neuart", "Leaf": "Laub", "Herb": "Kraut",
    "Fire Mouse": "Feuermaus", "Volcano": "Vulkan", "Big Jaw": "Großmaul",
    "Scout": "Späher", "Long Body": "Langgliedrig", "Owl": "Eule",
    "Five Star": "Fünfstern", "String Spit": "Faden", "Long Leg": "Langbein",
    "Angler": "Laternen", "Light": "Leuchte", "Tiny Mouse": "Minimaus",
    "Spike Ball": "Stachelball", "Happiness": "Freude", "Little Bird": "Spatz",
    "Mystic": "Mystik", "Wool": "Wolle", "Aqua Mouse": "Aquamaus",
    "Aqua Rabbit": "Aquahase", "Imitation": "Nachahmer", "Frog": "Frosch",
    "Cottonweed": "Löwenzahn", "Long Tail": "Langschweif", "Sun": "Sonne",
    "Clear Wing": "Libelle", "Water Fish": "Fisch", "Moonlight": "Mondlicht",
    "Darkness": "Finsternis", "Royal": "König", "Screech": "Kreischer",
    "Symbol": "Symbol", "Patient": "Geduldig", "Long Neck": "Langhals",
    "Bagworm": "Beutel", "Land Snake": "Landraupe", "FlyScorpion": "Skorpion",
    "Iron Snake": "Eisen", "Scissors": "Schere", "Mold": "Schimmel",
    "Single Horn": "Horn", "Sharp Claw": "Scharfklaue", "Little Bear": "Jungbär",
    "Hibernator": "Winterschlaf", "Lava": "Lava", "Pig": "Schwein",
    "Swine": "Wildschwein", "Coral": "Koralle", "Jet": "Jet", "Delivery": "Kurier",
    "Kite": "Drachen", "Armor Bird": "Panzer", "Dark": "Dunkel",
    "Long Nose": "Rüssel", "Armor": "Panzer", "Painter": "Maler",
    "Scuffle": "Rauf", "Handstand": "Radler", "Kiss": "Kuss",
    "Live Coal": "Glut", "Milk Cow": "Milchkuh", "Thunder": "Donner",
    "Aurora": "Polarlicht", "Rock Skin": "Steinhaut", "Hard Shell": "Rüstepanzer",
    "Diving": "Tauchen", "Rainbow": "Regenbogen", "Time Travel": "Zeitreise",
    "Polka Dot": "Tüpfel", "Bright": "Strahl", "Magical": "Magie",
    "Big Boss": "Don", "Bonsai": "Bonsai", "Mime": "Mime",
    "Playhouse": "Spielhaus", "Big Eater": "Vielfraß", "Magnet Area": "Magnetzone",
    "Thunderbolt": "Donnerkeil", "Blast": "Detonator", "Jubilee": "Festtag",
    "Ogre Darner": "Libelle", "Verdant": "Blattgrün", "Fresh Snow": "Neuschnee",
    "FangScorpio": "Fangskorpion", "Twin Tusk": "Doppelstoßzahn",
    "Intertwined": "Band", "Viking": "Wikinger", "Comedian": "Komiker",
    "Axe": "Axt", "Peat": "Torf", "Free Climb": "Free Climber",
    "Pin Cluster": "Stachel", "Spiny Fish": "Stachler", "Rage Monkey": "Wutaffe",
    "Unique Horn": "Einhorn", "Dancing": "Tänzer", "Cruel": "Grausam",
    "Strong Legs": "Starkbein", "Malevolent": "Unheil", "Hexpert": "Hexenmeister",
    "Ghost Flame": "Geisterflamme", "Poison Fish": "Giftfisch", "Sphere": "Kugel",
}

# Full German dex text per entry label (official Crystal/GS style for Gen1-2)
TEXT = {}

def load_text_from_file():
    data_file = pathlib.Path(__file__).resolve().parent / "dex_de_text.py"
    if data_file.exists():
        ns = {}
        exec(data_file.read_text(encoding="utf-8"), ns)
        TEXT.update(ns.get("TEXT", {}))

def normalize(s):
    s = s.replace("Pokémon", "#mon").replace("Pokemon", "#mon")
    s = s.replace("POKéMON", "#mon").replace("POKEMON", "#mon")
    s = s.replace("POKéMON", "#mon")
    s = re.sub(r"\s+", " ", s).strip()
    return s

def wrap_text(full_text, width=MAX_WIDTH):
    full_text = normalize(full_text)
    words = full_text.split()
    if not words:
        return [""] * 6

    raw = []
    cur = ""
    for w in words:
        trial = f"{cur} {w}".strip() if cur else w
        if len(trial) <= width:
            cur = trial
        else:
            if cur:
                raw.append(cur)
            while len(w) > width:
                cut = width - 1
                while cut > 3 and w[cut - 1] not in "aeiouäöüAEIOUÄÖÜ":
                    cut -= 1
                if cut <= 3:
                    cut = width - 1
                raw.append(w[:cut] + "-")
                w = w[cut:]
            cur = w
    if cur:
        raw.append(cur)

    lines = raw[:]
    guard = 0
    while len(lines) != 6 and guard < 1000:
        guard += 1
        if len(lines) > 6:
            done = False
            for i in range(len(lines) - 1):
                comb = lines[i] + " " + lines[i + 1]
                if len(comb) <= width:
                    lines[i:i + 2] = [comb]
                    done = True
                    break
            if not done:
                i = max(range(len(lines) - 1), key=lambda x: len(lines[x]) + len(lines[x + 1]))
                a, b = lines[i], lines[i + 1]
                sp = a.rfind(" ", 0, width)
                if sp < 2:
                    sp = max(1, len(a) // 2)
                lines[i:i + 2] = [a[:sp].strip(), (a[sp:] + " " + b).strip()]
        else:
            i = max(range(len(lines)), key=lambda x: len(lines[x]))
            line = lines[i]
            if len(line) < 4 or " " not in line:
                lines.append("")
            else:
                sp = line.rfind(" ", 0, width)
                if sp < 2:
                    sp = line.find(" ", max(1, len(line) // 2))
                if sp < 2:
                    lines.append("")
                else:
                    lines[i:i + 1] = [line[:sp].strip(), line[sp + 1:].strip()]

    while len(lines) < 6:
        lines.append("")
    return lines[:6]

def format_entry_text(lines):
    tags = ["text", "next", "next", "page", "next", "next"]
    out = []
    for i, (tag, line) in enumerate(zip(tags, lines)):
        suffix = "@" if i == 5 else ""
        out.append(f'\t{tag} "{line}{suffix}"')
    return "\n".join(out)

def translate_category(en_cat):
    return CAT.get(en_cat, en_cat)

def parse_entries(src_text):
    """Parse source into structured entries."""
    entries = []
    blocks = re.split(r'\n(?=SECTION )', src_text)
    for block in blocks:
        if not block.strip():
            continue
        m = re.match(r'SECTION "(\w+)"', block)
        if not m:
            continue
        name = m.group(1)
        label = f"{name}::"
        # extract category
        cat = None
        cat_block = None
        if "if DEF(FAITHFUL)" in block:
            cm = re.search(
                r'if DEF\(FAITHFUL\)\s*\r?\n\s*db "([^"]+)"@\s*\r?\nelse\s*\r?\n\s*db "([^"]+)"@\s*\r?\nendc',
                block)
            if cm:
                cat_block = ("faithful", cm.group(1), cm.group(2))
                cat = cm.group(1)
        if cat is None:
            cm = re.search(r'\tdb "([^"]+)@"', block)
            if cm:
                cat = cm.group(1)
        # extract text lines
        text_lines = re.findall(r'(?:text|next|page) "([^"]*)"', block)
        entries.append({
            "name": name,
            "block": block,
            "cat": cat,
            "cat_block": cat_block,
            "text_lines": text_lines,
        })
    return entries

FAITHFUL_CATS = {
    "BlastoisePokedexEntry": ("Panzerweich", "Panzer"),
    "SlowbroPlainPokedexEntry": ("Einsiedler", "Schmarotzer"),
    "SlowbroGalarianPokedexEntry": ("Einsiedler", "Schmarotzer"),
}

def rebuild_entry(ent, de_cat, de_lines):
    name = ent["name"]
    lines = [f'SECTION "{name}", ROMX', f'{name}::']
    if name in FAITHFUL_CATS:
        f_cat, e_cat = FAITHFUL_CATS[name]
        lines.append("if DEF(FAITHFUL)")
        lines.append(f'\tdb "{f_cat}@"')
        lines.append("else")
        lines.append(f'\tdb "{e_cat}@"')
        lines.append("endc")
    elif ent["cat_block"]:
        _, f_cat, e_cat = ent["cat_block"]
        lines.append("if DEF(FAITHFUL)")
        lines.append(f'\tdb "{translate_category(f_cat)}@"')
        lines.append("else")
        lines.append(f'\tdb "{translate_category(e_cat)}@"')
        lines.append("endc")
    else:
        lines.append(f'\tdb "{de_cat}@"')
    lines.append(format_entry_text(de_lines))
    return "\n".join(lines)

def main():
    load_text_from_file()
    src = SRC.read_text(encoding="utf-8")
    entries = parse_entries(src)
    out_parts = []
    count = 0
    for ent in entries:
        name = ent["name"]
        if name in TEXT:
            full = TEXT[name]
        else:
            # fallback: join english and mark for manual - use simple translation placeholder
            full = " ".join(ent["text_lines"]).rstrip("@")
        de_cat = translate_category(ent["cat"]) if ent["cat"] else ""
        de_lines = wrap_text(full)
        out_parts.append(rebuild_entry(ent, de_cat, de_lines))
        count += 1
    result = "\n\n".join(out_parts) + "\n"
    DST.write_text(result, encoding="utf-8")
    print(f"Wrote {count} entries to {DST}")

if __name__ == "__main__":
    main()