#!/usr/bin/env python3
"""Extract German paragraphs from dex_entries_en + manual translation source."""

import re
from pathlib import Path

# Source: German paragraphs recovered from polished crystal translation work
# Each entry: section_name -> full paragraph (with #mon)

ROOT = Path(__file__).resolve().parent.parent
EN_PATH = ROOT / "data" / "pokemon" / "dex_entries_en.asm"
SRC_PATH = Path(__file__).resolve().parent / "dex_de_source.txt"
OUT_PATH = Path(__file__).resolve().parent / "dex_de_paragraphs.py"


def parse_en(content):
    entries = []
    for block in re.split(r"\n(?=SECTION )", content):
        m = re.match(r'SECTION "([^"]+)"', block)
        if not m:
            continue
        name = m.group(1)
        cats = re.findall(r'\tdb "([^"]+)"', block)
        lines = re.findall(r'(?:text|next|page) "([^"]*)"', block)
        en = " ".join(lines).replace("@", " ").strip()
        entries.append({"name": name, "cats": cats, "en": en})
    return entries


def smart_join_lines(lines):
    out = ""
    for line in lines:
        line = line.replace("@", "")
        if not out:
            out = line
        elif line.startswith(" ") or out.endswith(("-", " ")):
            out += line
        elif out.endswith("-") or (line and line[0].islower() and not line[0].isupper()):
            out = out.rstrip("-") + line
        else:
            out += " " + line
    return re.sub(r"\s+", " ", out).strip()


def parse_source_paragraphs(text):
    result = {}
    for block in re.split(r"\n(?=SECTION )", text):
        m = re.match(r'SECTION "([^"]+)"', block)
        if not m:
            continue
        name = m.group(1)
        lines = re.findall(r'(?:text|next|page) "([^"]*)"', block)
        if lines:
            result[name] = smart_join_lines(lines)
    return result


def main():
    en_entries = parse_en(EN_PATH.read_text(encoding="utf-8"))
    if SRC_PATH.exists():
        src = parse_source_paragraphs(SRC_PATH.read_text(encoding="utf-8"))
    else:
        src = {}

    CATEGORY_DE = {
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
        "Puppy": "Welpe", "Legendary": "Legendär", "Tadpole": "Quappe", "Psi": "Psi",
        "Superpower": "Kraftprotz", "Flycatcher": "Fliegenfalle", "Jellyfish": "Qualle",
        "Rock": "Felsen", "Megaton": "Gewicht", "Fire Horse": "Feuerpferd",
        "Dopey": "Dösig", "Hermit Crab": "Einsiedler", "Squatter": "Schmarotzer",
        "Magnet": "Magnet", "Wild Duck": "Entoron", "Twin Bird": "Duovogel",
        "Triple Bird": "Triovogel", "Sea Lion": "Seehund", "Sludge": "Schlamm",
        "Bivalve": "Muschel", "Gas": "Gas", "Shadow": "Schatten",
        "Rock Snake": "Felsenschlange", "Hypnosis": "Hypnose",
        "River Crab": "Flusskrabbe", "Pincer": "Schere", "Ball": "Ball",
        "Egg": "Ei", "Coconut": "Kokosnuss", "Lonely": "Einsam",
        "Bone Keeper": "Knochenhüter", "Kicking": "Kicker", "Punching": "Puncher",
        "Licking": "Schlecker", "Poison Gas": "Giftgas", "Spikes": "Stachel",
        "Vine": "Kletterer", "Parent": "Mutter", "Dragon": "Drache",
        "Goldfish": "Goldfisch", "Star Shape": "Stern", "Mysterious": "Mysterium",
        "Barrier": "Barriere", "Mantis": "Sichelkäfer", "Human Shape": "Humanoid",
        "Electric": "Elektro", "Spitfire": "Feuer", "Stag Beetle": "Hirschkäfer",
        "Wild Bull": "Wildbulle", "Fish": "Fisch", "Atrocious": "Brutal",
        "Transport": "Transport", "Transform": "Transform", "Evolution": "Evolution",
        "Bubble Jet": "Blubber", "Lightning": "Blitz", "Virtual": "Virtuell",
        "Spiral": "Spirale", "Fossil": "Fossil", "Sleeping": "Schläfer",
        "Freeze": "Gefrier", "Genetic": "Genmutant", "New Species": "Neuart",
        "Leaf": "Laub", "Herb": "Kraut", "Fire Mouse": "Feuermaus", "Volcano": "Vulkan",
        "Big Jaw": "Großmaul", "Scout": "Späher", "Long Body": "Langgliedrig",
        "Owl": "Eule", "Five Star": "Fünfstern", "String Spit": "Faden",
        "Long Leg": "Langbein", "Angler": "Laternen", "Light": "Leuchte",
        "Tiny Mouse": "Minimaus", "Spike Ball": "Stachelball", "Happiness": "Freude",
        "Little Bird": "Spatz", "Mystic": "Mystik", "Wool": "Wolle",
        "Aqua Mouse": "Aquamaus", "Aqua Rabbit": "Aquahase", "Imitation": "Nachahmer",
        "Frog": "Frosch", "Cottonweed": "Löwenzahn", "Long Tail": "Langschweif",
        "Sun": "Sonne", "Clear Wing": "Libelle", "Water Fish": "Fisch",
        "Moonlight": "Mondlicht", "Darkness": "Finsternis", "Royal": "König",
        "Screech": "Kreischer", "Symbol": "Symbol", "Patient": "Geduldig",
        "Long Neck": "Langhals", "Bagworm": "Beutel", "Land Snake": "Landraupe",
        "FlyScorpion": "Skorpion", "Iron Snake": "Eisen", "Scissors": "Schere",
        "Mold": "Schimmel", "Single Horn": "Horn", "Sharp Claw": "Scharfklaue",
        "Little Bear": "Jungbär", "Hibernator": "Winterschlaf", "Lava": "Lava",
        "Pig": "Schwein", "Swine": "Wildschwein", "Coral": "Koralle", "Jet": "Jet",
        "Delivery": "Kurier", "Kite": "Drachen", "Armor Bird": "Panzer", "Dark": "Dunkel",
        "Long Nose": "Rüssel", "Armor": "Panzer", "Big Horn": "Großhorn",
        "Painter": "Maler", "Scuffle": "Rauf", "Handstand": "Radler", "Kiss": "Kuss",
        "Live Coal": "Glut", "Milk Cow": "Milchkuh", "Thunder": "Donner",
        "Aurora": "Polarlicht", "Rock Skin": "Steinhaut", "Hard Shell": "Rüstepanzer",
        "Diving": "Tauchen", "Rainbow": "Regenbogen", "Time Travel": "Zeitreise",
        "Polka Dot": "Tüpfel", "Bright": "Strahl", "Magical": "Magie",
        "Big Boss": "Don", "Bonsai": "Bonsai", "Mime": "Mime", "Playhouse": "Spielhaus",
        "Big Eater": "Vielfraß", "Magnet Area": "Magnetzone", "Thunderbolt": "Donnerkeil",
        "Blast": "Detonator", "Jubilee": "Festtag", "Ogre Darner": "Libelle",
        "Verdant": "Blattgrün", "Fresh Snow": "Neuschnee", "FangScorpion": "Fangskorpion",
        "Twin Tusk": "Doppelstoßzahn", "Intertwined": "Band", "Viking": "Wikinger",
        "Comedian": "Komiker", "Axe": "Axt", "Peat": "Torf", "Free Climb": "Freikletterer",
        "Pin Cluster": "Stachel", "Spiny Fish": "Stachler", "Rage Monkey": "Wutaffe",
        "Unique Horn": "Einhorn", "Dancing": "Tänzer", "Cruel": "Grausam",
        "Strong Legs": "Starkbein", "Malevolent": "Unheil", "Hexpert": "Hexenmeister",
        "Ghost Flame": "Geisterflamme", "Sphere": "Kugel", "Poison Fish": "Giftfisch",
    }

    lines = ["# German Pokedex paragraphs", "PARAGRAPHS = {"]
    cat_lines = ["", "CATEGORIES = {"]

    for e in en_entries:
        name = e["name"]
        para = src.get(name, "")
        if not para:
            raise SystemExit(f"Missing source paragraph: {name}")
        para = para.replace("Pokémon", "#mon").replace("Pokemon", "#mon")
        lines.append(f'    "{name}": "{para.replace(chr(92), chr(92)+chr(92)).replace(chr(34), chr(92)+chr(34))}",')

        if e["cats"]:
            if len(e["cats"]) == 1:
                c = e["cats"][0].replace("@", "")
                cat_lines.append(f'    "{name}": "{CATEGORY_DE.get(c, c)}",')
            else:
                vals = ", ".join(f'"{CATEGORY_DE.get(c.replace("@",""), c.replace("@",""))}"' for c in e["cats"])
                cat_lines.append(f'    "{name}": [{vals}],')

    lines.extend(cat_lines)
    lines.append("}")
    OUT_PATH.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(f"Wrote {len(en_entries)} paragraphs")


if __name__ == "__main__":
    main()