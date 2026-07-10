#!/usr/bin/env python3
"""Translate dex entries as whole paragraphs, then wrap properly."""
import re
import json
import time
import urllib.parse
import urllib.request
from pathlib import Path

MAX = 18
BASE = Path(__file__).parent.parent
CACHE = Path(__file__).parent / 'dex_para_cache.json'

CAT_MAP = {
    "Seed": "Samen", "Lizard": "Eidechse", "Flame": "Flamme", "Tiny Turtle": "Minikröte",
    "Turtle": "Schildkröte", "Shellfish": "Panzer", "Shell": "Panzer", "Worm": "Wurm",
    "Cocoon": "Kokon", "Butterfly": "Falter", "Hairy Bug": "Raupe", "Poison Bee": "Giftbiene",
    "Tiny Bird": "Minivogel", "Bird": "Vogel", "Rat": "Ratte", "Beak": "Pick",
    "Snake": "Schlange", "Cobra": "Kobra", "Mouse": "Maus", "Fox": "Fuchs",
    "Balloon": "Ballon", "Bat": "Fledermaus", "Weed": "Unkraut", "Mushroom": "Pilz",
    "Insect": "Insekt", "Poison Moth": "Giftmotte", "Mole": "Maulwurf",
    "Scratch Cat": "Katze", "Classy Cat": "Samtpfote", "Duck": "Ente",
    "Pig Monkey": "Schwein", "Puppy": "Welpe", "Legendary": "Legendär",
    "Tadpole": "Kaulquappe", "Psi": "Psi", "Superpower": "Kraftprotz",
    "Flower": "Blume", "Flycatcher": "Fliegenfalle", "Jellyfish": "Qualle",
    "Rock": "Fels", "Megaton": "Megaton", "Fire Horse": "Feuerpferd", "Dopey": "Dösig",
    "Hermit Crab": "Einsiedler", "Squatter": "Schmarotzer", "Magnet": "Magnet",
    "Wild Duck": "Wildente", "Twin Bird": "Duovogel", "Triple Bird": "Triovogel",
    "Sea Lion": "Seehund", "Sludge": "Schlamm", "Bivalve": "Muschel", "Gas": "Gas",
    "Shadow": "Schatten", "Rock Snake": "Felsnatter", "Hypnosis": "Hypnose",
    "River Crab": "Krebs", "Pincer": "Kneifer", "Ball": "Ball", "Egg": "Ei",
    "Lonely": "Einsam", "Bone Keeper": "Knochen", "Kicking": "Tritte",
    "Punching": "Schläge", "Licking": "Lecker", "Poison Gas": "Giftgas",
    "Spikes": "Stachel", "Drill": "Bohrer", "Vine": "Ranke", "Parent": "Elter",
    "Dragon": "Drache", "Goldfish": "Goldfisch", "Star Shape": "Stern",
    "Barrier": "Barriere", "Mantis": "Mantis", "Human Shape": "Humanoid",
    "Electric": "Elektro", "Spitfire": "Feuer", "Stag Beetle": "Hirschkäfer",
    "Bull": "Bulle", "Fish": "Fisch", "Atrocious": "Grässlich", "Transport": "Transport",
    "Transform": "Transform", "Evolution": "Evolution", "Bubble Jet": "Blubstrahl",
    "Lightning": "Blitz", "Virtual": "Virtuell", "Spiral": "Spirale",
    "Fossil": "Fossil", "Sleeping": "Schlaf", "Freeze": "Gefrier",
    "Genetic": "Genetik", "New Species": "Neuart", "Leaf": "Laub",
    "Fire Mouse": "Feuermaus", "Volcano": "Vulkan", "Big Jaw": "Großmaul",
    "Scout": "Späher", "Long Body": "Langkörper", "Owl": "Eule",
    "Five Star": "Fünfstern", "String Spit": "Faden", "Long Leg": "Langbein",
    "Tiny Mouse": "Minimaus", "Cottonweed": "Watt", "Aqua Mouse": "Aquamaus",
    "Imitation": "Imitation", "Frog": "Frosch", "Long Tail": "Langschweif",
    "Sun": "Sonne", "Clear Wing": "Klarflügel", "Water Fish": "Wasserfisch",
    "Moonlight": "Mondlicht", "Darkness": "Finsternis", "Royal": "König",
    "Symbol": "Symbol", "Patient": "Geduld", "Long Neck": "Langhals",
    "Bagworm": "Beutel", "Land Snake": "Landschlange", "Fly Scorpion": "Skorpion",
    "Iron Snake": "Stahl", "Fairy": "Fee", "Pin Cluster": "Stachel",
    "Living Armor": "Panzer", "Mold": "Schimmel", "Single Horn": "Einhörner",
    "Sharp Claw": "Scharfklaue", "Little Bear": "Kleinbär", "Hibernator": "Schläfer",
    "Lava": "Lava", "Pig": "Schwein", "Swine": "Schwein", "Coral": "Koralle",
    "Jet": "Düse", "Delivery": "Lieferung", "Kite": "Drachen", "Armor Bird": "Panzer",
    "Dark": "Finster", "Long Nose": "Langrüssler", "Armor": "Panzer",
    "Big Horn": "Großhorn", "Painter": "Maler", "Scuffle": "Rauf",
    "Handstand": "Handstand", "Kiss": "Kuss", "Live Coal": "Glühkohle",
    "Milk Cow": "Milchkuh", "Happiness": "Freude", "Thunder": "Donner",
    "Aurora": "Aurora", "Rock Skin": "Steinhaut", "Hard Shell": "Hartschale",
    "Diving": "Taucher", "Rainbow": "Regenbogen", "Time Travel": "Zeitreise",
    "Wood Gecko": "Gecko", "Chick": "Küken", "Young Fowl": "Junggeflügel",
    "Mud Fish": "Schlammling", "Bite": "Biss", "Coconut": "Kokosnuss",
    "Poison Pin": "Giftpin", "Cotton Puff": "Wattwolke", "Wind Chime": "Windspiel",
    "Bulb": "Zwiebel", "Cactus": "Kaktus", "Humming": "Summend",
    "Ice Break": "Eisbrecher", "Clap": "Klatschen", "Form Change": "Formwandel",
    "Emotion": "Gefühl", "Eon": "Ewig", "Sea Basin": "Meeresboden",
    "Continent": "Kontinent", "Sky High": "Himmel", "Wish": "Wunsch",
    "DNA": "DNS", "Longevity": "Langlebig", "Sea Drifter": "Treibgut",
    "Seafaring": "Seefahrer", "Zen Charm": "Zen-Charme", "Cavern": "Höhle",
    "Lunar": "Mond", "Sunne": "Sonne", "Moon": "Mond", "Grass Snake": "Grasnatter",
    "Regal": "Königlich", "Fire Pig": "Feuerschwein", "Mega Fire Pig": "Mega-Feuer",
    "Sea Otter": "Seeotter", "Discipline": "Disziplin", "Formidable": "Imposant",
    "Lookout": "Wachposten", "Loyal Dog": "Treuhund", "Big-Hearted": "Großherzig",
    "Chinchilla": "Chinchilla", "Scarf": "Schal", "Bud": "Knospe", "Blossom": "Blüte",
    "Grass Monkey": "Grasaffe", "Thorn Monkey": "Dornaffe", "High Temp": "Hochtemperatur",
    "Ember": "Glut", "Spray": "Sprüher", "Geyser": "Geysir", "Mantle": "Mantel",
    "Courting": "Balz", "Listening": "Horcher", "Muscular": "Muskulös",
    "Vibration": "Vibration", "Judo": "Judo", "Karate": "Karate",
    "Fixation": "Fixierung", "Manipulate": "Manipulation", "Astral Body": "Astral",
    "Caring": "Fürsorglich", "Attaching": "Anhaftend", "Nurturing": "Pflegend",
    "Centipede": "Tausendfüßler", "Curlipede": "Rollfüßler", "Megapede": "Megafüßler",
    "Hostile": "Feindselig", "Cave": "Höhle", "Subterrene": "Untergrund",
    "Hearing": "Hörend", "Genmutant": "Genmutant", "Torf": "Torf",
    "Giftfisch": "Giftfisch", "Wildbulle": "Wildbulle",
}

def translate(text, cache, retries=0):
    if text in cache and cache[text] != text:
        return cache[text]
    try:
        q = urllib.parse.quote(text[:500])  # API limit
        url = f"https://api.mymemory.translated.net/get?q={q}&langpair=en|de"
        req = urllib.request.Request(url, headers={'User-Agent': 'pc-de/1.0'})
        with urllib.request.urlopen(req, timeout=20) as resp:
            data = json.loads(resp.read().decode())
        result = data['responseData']['translatedText']
        result = result.replace('Pokémon', '#mon').replace('Pokemon', '#mon')
        result = result.replace('POKéMON', '#mon')
        if result == text and retries < 2:
            time.sleep(3.0)
            return translate(text, cache, retries + 1)
        cache[text] = result
        time.sleep(1.0)
        return result
    except Exception as e:
        print(f'ERR: {e}')
        time.sleep(5.0)
        if retries < 2:
            return translate(text, cache, retries + 1)
        return cache.get(text, text)

def translate_cat(cat, cache):
    if cat in CAT_MAP:
        return CAT_MAP[cat]
    return translate(cat, cache)

def wrap(text):
    words = text.replace('\n', ' ').split()
    lines, cur = [], ''
    for w in words:
        t = (cur + ' ' + w).strip() if cur else w
        if len(t) <= MAX:
            cur = t
        else:
            if cur:
                lines.append(cur)
            if len(w) > MAX:
                while len(w) > MAX - 1:
                    lines.append(w[:MAX-1] + '-')
                    w = w[MAX-1:]
                cur = w
            else:
                cur = w
    if cur:
        lines.append(cur)
    # Ensure last line ends with period for .@ suffix
    if lines and not lines[-1].endswith('.'):
        lines[-1] += '.'
    return lines

def fmt_entry(name, cat, lines, extra):
    section = f'{name}PokedexEntry'
    o = [f'SECTION "{section}", ROMX', f'{section}::']
    if extra:
        o.extend(extra)
    o.append(f'\tdb "{cat}@"')
    if len(lines) == 1:
        t = lines[0]
        if t.endswith('.'):
            t = t[:-1]
        o.append(f'\ttext "{t}.@"')
        return '\n'.join(o)
    o.append(f'\ttext "{lines[0]}"')
    i, nc = 1, 0
    while i < len(lines):
        is_last = (i == len(lines) - 1)
        if nc == 2 and i < len(lines) and not is_last:
            o.append(f'\tpage "{lines[i]}"')
            i += 1
            nc = 0
        else:
            txt = lines[i]
            if is_last:
                if txt.endswith('.'):
                    txt = txt[:-1]
                o.append(f'\tnext "{txt}.@"')
            else:
                o.append(f'\tnext "{txt}"')
            nc += 1
            i += 1
    return '\n'.join(o)

def parse_entries(content):
    blocks = re.split(r'\n(?=SECTION "\w+PokedexEntry")', content)
    entries = []
    for block in blocks:
        if not block.strip():
            continue
        m = re.search(r'SECTION "(\w+)PokedexEntry"', block)
        if not m:
            continue
        name = m.group(1)
        extra = [l for l in block.split('\n') if l.strip().startswith(('if DEF', 'else', 'endc'))]
        cat_m = re.search(r'\tdb "(.+?)@"', block)
        cat = cat_m.group(1) if cat_m else '?'
        text_lines = []
        for lm in re.finditer(r'\t(?:text|next|page) "(.+?)"', block):
            t = lm.group(1).rstrip('@').rstrip('.')
            if t.endswith('-'):
                t = t[:-1]
            text_lines.append(t)
        paragraph = ' '.join(text_lines)
        entries.append({'name': name, 'cat': cat, 'paragraph': paragraph, 'extra': extra})
    return entries

def main():
    cache = json.loads(CACHE.read_text(encoding='utf-8')) if CACHE.exists() else {}
    en = (BASE / 'data/pokemon/dex_entries_en.asm').read_text(encoding='utf-8')
    entries = parse_entries(en)
    out = []
    for i, e in enumerate(entries):
        de_para = translate(e['paragraph'], cache)
        de_cat = translate_cat(e['cat'], cache) if e['cat'] not in ('?',) else e['cat']
        lines = wrap(de_para)
        out.append(fmt_entry(e['name'], de_cat, lines, e['extra']))
        if (i + 1) % 20 == 0:
            CACHE.write_text(json.dumps(cache, ensure_ascii=False, indent=2), encoding='utf-8')
            print(f'{i+1}/{len(entries)} done')
    CACHE.write_text(json.dumps(cache, ensure_ascii=False, indent=2), encoding='utf-8')
    (BASE / 'data/pokemon/dex_entries.asm').write_text('\n\n'.join(out) + '\n', encoding='utf-8')
    print(f'Wrote {len(out)} entries')

if __name__ == '__main__':
    main()