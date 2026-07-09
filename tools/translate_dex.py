#!/usr/bin/env python3
"""Translate dex_entries.asm from English backup with proper line wrapping."""
import re
import sys
from pathlib import Path

MAX_LINE = 18

# Category translations
CATEGORIES = {
    "Seed": "Samen", "Lizard": "Eidechse", "Flame": "Flamme", "Tiny Turtle": "Minikröte",
    "Turtle": "Schildkröte", "Shellfish": "Panzer", "Worm": "Wurm", "Cocoon": "Kokon",
    "Butterfly": "Falter", "Hairy Bug": "Raupe", "Poison Bee": "Giftbiene",
    "Tiny Bird": "Minivogel", "Bird": "Vogel", "Mouse": "Ratte", "Beak": "Pick",
    "Snake": "Schlange", "Cobra": "Kobra", "Mouse": "Maus", "Fox": "Fuchs",
    "Balloon": "Ballon", "Bat": "Fledermaus", "Weed": "Unkraut", "Mushroom": "Pilz",
    "Insect": "Insekt", "Mole": "Maulwurf", "Scratch": "Katze", "Duck": "Ente",
    "Pig Monkey": "Schwein", "Puppy": "Welpe", "Legendary": "Legendär",
    "Tadpole": "Kaulquappe", "Psi": "Psi", "Superpower": "Kraftprotz",
    "Flower": "Blume", "Jellyfish": "Qualle", "Rock": "Fels", "Fire Horse": "Feuerpferd",
    "Dopey": "Dösig", "Magnet": "Magnet", "Wild Duck": "Wildente", "Twin Bird": "Duovogel",
    "Sea Lion": "Seehund", "Sludge": "Schlamm", "Bivalve": "Muschel", "Gas": "Gas",
    "Shadow": "Schatten", "Rock Snake": "Felsnatter", "Hypnosis": "Hypnose",
    "River Crab": "Krebs", "Pincer": "Kneifer", "Ball": "Ball", "Egg": "Ei",
    "Lonely": "Einsam", "Bone Keeper": "Knochen", "Kicking": "Tritte",
    "Punching": "Schläge", "Licking": "Lecker", "Poison Gas": "Giftgas",
    "Spikes": "Stachel", "Drill": "Bohrer", "Egg": "Ei", "Vine": "Ranke",
    "Parent": "Elter", "Dragon": "Drache", "Goldfish": "Goldfisch", "Star Shape": "Stern",
    "Barrier": "Barriere", "Mantis": "Mantis", "Human Shape": "Humanoid",
    "Electric": "Elektro", "Spitfire": "Feuer", "Stag Beetle": "Hirschkäfer",
    "Bull": "Bulle", "Fish": "Fisch", "Atrocious": "Grässlich", "Transport": "Transport",
    "Transform": "Transform", "Evolution": "Evolution", "Bubble Jet": "Blubstrahl",
    "Lightning": "Blitz", "Flame": "Flamme", "Virtual": "Virtuell",
    "Spiral": "Spirale", "Shellfish": "Panzer", "Shellfish": "Panzer",
    "Fossil": "Fossil", "Sleeping": "Schlaf", "Freeze": "Gefrier", "Electric": "Elektro",
    "Flame": "Flamme", "Dragon": "Drache", "Genetic": "Genetik", "New Species": "Neuart",
    "Leaf": "Laub", "Leaf": "Laub", "Fire Mouse": "Feuermaus", "Volcano": "Vulkan",
    "Big Jaw": "Großmaul", "Scout": "Späher", "Long Body": "Langkörper",
    "Owl": "Eule", "Five Star": "Fünfstern", "String Spit": "Faden",
    "Bat": "Fledermaus", "Angler": "Angler", "Tiny Mouse": "Minimaus",
    "Star Shape": "Stern", "Balloon": "Ballon", "Spike Ball": "Stachelball",
    "Mime": "Pantomime", "Long Leg": "Langbein", "Tiny Bird": "Minivogel",
    "Cottonweed": "Watt", "Aqua Mouse": "Aquamaus", "Imitation": "Imitation",
    "Frog": "Frosch", "Cottonweed": "Watt", "Long Tail": "Langschweif",
    "Seed": "Samen", "Sun": "Sonne", "Clear Wing": "Klarflügel",
    "Water Fish": "Wasserfisch", "Sun": "Sonne", "Moonlight": "Mondlicht",
    "Darkness": "Finsternis", "Royal": "König", "Symbol": "Symbol",
    "Patient": "Geduld", "Long Neck": "Langhals", "Bagworm": "Beutel",
    "Land Snake": "Landschlange", "Fly Scorpion": "Skorpion", "Iron Snake": "Stahl",
    "Fairy": "Fee", "Balloon": "Ballon", "Balloon": "Ballon", "Pin Cluster": "Stachel",
    "Living Armor": "Panzer", "Mold": "Schimmel", "Single Horn": "Einhörner",
    "Sharp Claw": "Scharfklaue", "Little Bear": "Kleinbär", "Hibernator": "Schläfer",
    "Lava": "Lava", "Lava": "Lava", "Pig": "Schwein", "Swine": "Schwein",
    "Coral": "Koralle", "Jet": "Düse", "Jet": "Düse", "Delivery": "Lieferung",
    "Kite": "Drachen", "Armor Bird": "Panzer", "Dark": "Finster", "Dark": "Finster",
    "Dragon": "Drache", "Long Nose": "Langrüssler", "Armor": "Panzer",
    "Virtual": "Virtuell", "Big Horn": "Großhorn", "Painter": "Maler",
    "Scuffle": "Rauf", "Handstand": "Handstand", "Kiss": "Kuss",
    "Live Coal": "Glühkohle", "Milk Cow": "Milchkuh", "Happiness": "Freude",
    "Thunder": "Donner", "Volcano": "Vulkan", "Aurora": "Aurora",
    "Rock Skin": "Steinhaut", "Hard Shell": "Hartschale", "Armor": "Panzer",
    "Diving": "Taucher", "Rainbow": "Regenbogen", "Time Travel": "Zeitreise",
    "Wood Gecko": "Gecko", "Wood Gecko": "Gecko", "Wood Gecko": "Gecko",
    "Chick": "Küken", "Young Fowl": "Junggeflügel", "Flame": "Flamme",
    "Mud Fish": "Schlammling", "Mud Fish": "Schlammling", "Mud Fish": "Schlammling",
    "Bite": "Biss", "Bite": "Biss", "Tiny Raccoon": "Kleinwaschbär",
    "Rushing": "Hastig", "Spot Panda": "Panda", "Weather": "Wetter",
    "Mushroom": "Pilz", "Mushroom": "Pilz", "Mushroom": "Pilz",
    "Slacker": "Faulpelz", "Wild Monkey": "Wildaffe", "Playful": "Verspielt",
    "Optimism": "Optimist", "Polka Dot": "Tüpfel", "Cotton Bird": "Wattvogel",
    "Water Weed": "Wasserpflanze", "Jolly": "Heiter", "Goldfish": "Goldfisch",
    "Moonlight": "Mondlicht", "Spotlight": "Scheinwerfer", "Rendezvous": "Rendezvous",
    "Tiny Bird": "Minivogel", "Woodpecker": "Specht", "Tiny Bird": "Minivogel",
    "Beaver": "Biber", "Fish": "Fisch", "Bright": "Hell", "Time Travel": "Zeitreise",
    "Penguin": "Pinguin", "Penguin": "Pinguin", "Balloon": "Ballon", "Balloon": "Ballon",
    "Scarecrow": "Vogelscheuche", "Mantis": "Mantis", "Warm Body": "Warmkörper",
    "Chime": "Glocken", "Old Cat": "Altkatze", "Meteorite": "Meteorit",
    "Ninja": "Ninja", "Shed": "Häutung", "Whiskers": "Schnurrhaar",
    "Ruffian": "Raufbold", "Deceiver": "Betrüger", "Iron Ant": "Eisenameise",
    "Meditate": "Meditation", "Meditate": "Meditation", "Lightning": "Blitz",
    "Discharge": "Entladung", "Cheering": "Jubel", "Cheering": "Jubel",
    "Firefly": "Glühwürmchen", "Stag Beetle": "Hirschkäfer", "Hermit Crab": "Einsiedler",
    "Magnet": "Magnet", "Magnet": "Magnet", "Luring": "Köder", "Compass": "Kompass",
    "Sound Wave": "Schallwelle", "Sound Wave": "Schallwelle", "Cactus": "Kaktus",
    "Scarecrow": "Vogelscheuche", "Cotton Bird": "Wattvogel", "Humming": "Summend",
    "Ice Break": "Eisbrecher", "Clap": "Klatschen", "Balloon": "Ballon",
    "Form Change": "Formwandel", "Emotion": "Gefühl", "Emotion": "Gefühl",
    "Emotion": "Gefühl", "Emotion": "Gefühl", "Emotion": "Gefühl",
    "Emotion": "Gefühl", "Emotion": "Gefühl", "Emotion": "Gefühl",
    "Eon": "Ewig", "Eon": "Ewig", "Sea Basin": "Meeresboden",
    "Continent": "Kontinent", "Sky High": "Himmel", "Wish": "Wunsch",
    "DNA": "DNS", "DNA": "DNS", "DNA": "DNS", "DNA": "DNS",
    "Longevity": "Langlebig", "Sea Drifter": "Meerestreibender",
    "Seafaring": "Seefahrer", "Aurora": "Aurora", "Zen Charm": "Zen-Charme",
    "Cavern": "Höhle", "Cavern": "Höhle", "Cavern": "Höhle",
    "Lunar": "Mond", "Sunne": "Sonne", "Moon": "Mond",
    "Grass Snake": "Grasnatter", "Grass Snake": "Grasnatter", "Regal": "Königlich",
    "Fire Pig": "Feuerschwein", "Fire Pig": "Feuerschwein", "Mega Fire Pig": "Mega-Feuer",
    "Sea Otter": "Seeotter", "Discipline": "Disziplin", "Formidable": "Imposant",
    "Lookout": "Wachposten", "Puppy": "Welpe", "Loyal Dog": "Treuhund",
    "Puppy": "Welpe", "Big-Hearted": "Großherzig", "Chinchilla": "Chinchilla",
    "Scarf": "Schal", "Bud": "Knospe", "Blossom": "Blüte", "Grass Monkey": "Grasaffe",
    "Thorn Monkey": "Dornaffe", "High Temp": "Hochtemperatur", "Ember": "Glut",
    "Spray": "Sprüher", "Geyser": "Geysir", "Mantle": "Mantel", "Mantle": "Mantel",
    "Mantle": "Mantel", "Mantle": "Mantel", "Mantle": "Mantel",
    "Bat": "Fledermaus", "Courting": "Balz", "Listening": "Horcher",
    "Muscular": "Muskulös", "Muscular": "Muskulös", "Muscular": "Muskulös",
    "Tadpole": "Kaulquappe", "Vibration": "Vibration", "Vibration": "Vibration",
    "Judo": "Judo", "Karate": "Karate", "Cotton Puff": "Wattwolke",
    "Wind Chime": "Windspiel", "Bulb": "Zwiebel", "Turn Tail": "Kehrtwende",
    "Desert Croc": "Wüstenkrok", "Desert Abom": "Wüstenabscheu",
    "Desert Croc": "Wüstenkrok", "Chinchilla": "Chinchilla", "Scarf": "Schal",
    "Fixation": "Fixierung", "Manipulate": "Manipulation", "Astral Body": "Astral",
    "Caring": "Fürsorglich", "Attaching": "Anhaftend", "Nurturing": "Pflegend",
    "Centipede": "Tausendfüßler", "Curlipede": "Rollfüßler", "Megapede": "Megafüßler",
    "Cotton Puff": "Wattwolke", "Wind Chime": "Windspiel", "Bulb": "Zwiebel",
    "Hostile": "Feindselig", "Hostile": "Feindselig", "Cave": "Höhle",
    "Mole": "Maulwurf", "Subterrene": "Untergrund", "Hearing": "Hörend",
    "Muscular": "Muskulös", "Muscular": "Muskulös", "Muscular": "Muskulös",
    "Muscular": "Muskulös", "Muscular": "Muskulös", "Muscular": "Muskulös",
    "Muscular": "Muscular", "Muscular": "Muskulös",
}

# Full entry translations keyed by section name (without PokedexEntry suffix)
# Built from official German + natural translation of PC English text
ENTRY_TEXTS = {}

def wrap_text(text, max_len=MAX_LINE):
    """Wrap text into lines at word boundaries, max max_len chars."""
    words = text.replace('\n', ' ').split()
    lines = []
    current = ""
    for word in words:
        test = (current + " " + word).strip() if current else word
        if len(test) <= max_len:
            current = test
        else:
            if current:
                lines.append(current)
            # Handle long words with hyphen
            if len(word) > max_len:
                while len(word) > max_len - 1:
                    lines.append(word[:max_len - 1] + "-")
                    word = word[max_len - 1:]
                current = word
            else:
                current = word
    if current:
        lines.append(current)
    return lines

def format_entry(section, label, category, lines, extra_lines=None):
    """Format a pokedex entry in ASM format matching English structure."""
    out = [f'SECTION "{section}", ROMX', f'{label}::']
    if extra_lines:
        out.extend(extra_lines)
    cat = CATEGORIES.get(category, category)
    out.append(f'\tdb "{cat}@"')
    
    if not lines:
        out.append('\ttext "?"')
        out.append('\tdone')
        return '\n'.join(out) + '\n'
    
    # Use page after 3 lines (text + 2 next), then next for rest
    result_lines = []
    result_lines.append(f'\ttext "{lines[0]}"')
    i = 1
    next_count = 0
    while i < len(lines):
        if next_count == 2 and i < len(lines):
            result_lines.append(f'\tpage "{lines[i]}"')
            i += 1
            next_count = 0
        else:
            suffix = ".@" if i == len(lines) - 1 else ""
            line = lines[i].rstrip('.') + suffix if suffix else lines[i]
            result_lines.append(f'\tnext "{line}"')
            next_count += 1
            i += 1
    
    # Ensure last line ends with .@
    last = result_lines[-1]
    if not last.endswith('.@"'):
        if last.endswith('"'):
            result_lines[-1] = last[:-1] + '.@"'
    
    return '\n'.join(out + result_lines) + '\n\n'

def parse_english_file(path):
    """Parse English dex entries file into structured entries."""
    content = Path(path).read_text(encoding='utf-8')
    entries = []
    current = None
    extra = []
    
    for line in content.split('\n'):
        m = re.match(r'SECTION "(\w+)PokedexEntry"', line)
        if m:
            if current:
                entries.append(current)
            current = {'section': line.strip().replace('SECTION "', '').replace('", ROMX', ''),
                         'label': m.group(1) + 'PokedexEntry',
                         'name': m.group(1),
                         'extra': [], 'category': '', 'lines': []}
            extra = []
            continue
        if current is None:
            continue
        if line.strip().startswith('if DEF') or line.strip().startswith('else') or line.strip().startswith('endc'):
            current['extra'].append(line)
            continue
        m = re.match(r'\tdb "(.+?)@"', line)
        if m:
            current['category'] = m.group(1)
            continue
        m = re.match(r'\t(?:text|next|page) "(.+)"', line)
        if m:
            current['lines'].append(m.group(1).rstrip('@').rstrip('.'))
    
    if current:
        entries.append(current)
    return entries

def load_translations(trans_file):
    """Load entry translations from JSON if available."""
    import json
    if trans_file.exists():
        return json.loads(trans_file.read_text(encoding='utf-8'))
    return {}

def main():
    base = Path(__file__).parent.parent
    en_file = base / 'data' / 'pokemon' / 'dex_entries_en.asm'
    out_file = base / 'data' / 'pokemon' / 'dex_entries.asm'
    trans_file = base / 'tools' / 'dex_translations.json'
    
    entries = parse_english_file(en_file)
    translations = load_translations(trans_file)
    
    output = []
    missing = []
    for entry in entries:
        name = entry['name']
        if name in translations:
            text = translations[name]['text']
            cat = translations[name].get('category', entry['category'])
            lines = wrap_text(text)
            section = f'{name}PokedexEntry'
            output.append(format_entry(section, entry['label'], 
                           CATEGORIES.get(cat, cat) if cat in CATEGORIES else translations[name].get('category_de', cat),
                           lines, entry['extra'] if entry['extra'] else None))
        else:
            missing.append(name)
    
    if missing:
        print(f"Missing {len(missing)} translations. Need dex_translations.json")
        print("First 20 missing:", missing[:20])
        # Write missing list
        (base / 'tools' / 'dex_missing.txt').write_text('\n'.join(missing), encoding='utf-8')
        return 1
    
    out_file.write_text(''.join(output), encoding='utf-8')
    print(f"Wrote {len(output)} entries to {out_file}")
    return 0

if __name__ == '__main__':
    sys.exit(main())