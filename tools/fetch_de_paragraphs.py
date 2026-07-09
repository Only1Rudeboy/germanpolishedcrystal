#!/usr/bin/env python3
"""Fetch German flavor text from PokeAPI (parallel) and build dex_de_paragraphs.py."""

import json
import re
import urllib.request
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
EN_PATH = ROOT / "data" / "pokemon" / "dex_entries_en.asm"
OUT_PATH = Path(__file__).resolve().parent / "dex_de_paragraphs.py"

CUSTOM_MAP = {
    "RattataPlainPokedexEntry": "rattata",
    "RaticatePlainPokedexEntry": "raticate",
    "RaichuPlainPokedexEntry": "raichu",
    "SandshrewPlainPokedexEntry": "sandshrew",
    "SandslashPlainPokedexEntry": "sandslash",
    "NidoranFPokedexEntry": "nidoran-f",
    "NidoranMPokedexEntry": "nidoran-m",
    "VulpixPlainPokedexEntry": "vulpix",
    "NinetalesPlainPokedexEntry": "ninetales",
    "DiglettPlainPokedexEntry": "diglett",
    "DugtrioPlainPokedexEntry": "dugtrio",
    "MeowthPlainPokedexEntry": "meowth",
    "PersianPlainPokedexEntry": "persian",
    "GeodudePlainPokedexEntry": "geodude",
    "GravelerPlainPokedexEntry": "graveler",
    "GolemPlainPokedexEntry": "golem",
    "PonytaPlainPokedexEntry": "ponyta",
    "RapidashPlainPokedexEntry": "rapidash",
    "SlowpokePlainPokedexEntry": "slowpoke",
    "FarfetchDPlainPokedexEntry": "farfetchd",
    "GrimerPlainPokedexEntry": "grimer",
    "MukPlainPokedexEntry": "muk",
    "ExeggutorPlainPokedexEntry": "exeggutor",
    "MarowakPlainPokedexEntry": "marowak",
    "WeezingPlainPokedexEntry": "weezing",
    "MrMimePlainPokedexEntry": "mr-mime",
    "TaurosPlainPokedexEntry": "tauros",
    "GyaradosPlainPokedexEntry": "gyarados",
    "MewtwoPlainPokedexEntry": "mewtwo",
    "TyphlosionPlainPokedexEntry": "typhlosion",
    "WooperPlainPokedexEntry": "wooper",
    "SlowkingPlainPokedexEntry": "slowking",
    "CorsolaPlainPokedexEntry": "corsola",
    "ArticunoPlainPokedexEntry": "articuno",
    "ZapdosPlainPokedexEntry": "zapdos",
    "MoltresPlainPokedexEntry": "moltres",
}

CATEGORY_DE = {
    "Seed": "Samen", "Lizard": "Eidechse", "Flame": "Flamme", "Tiny Turtle": "Minikröte",
    "Turtle": "Schildkröte", "Shellfish": "Panzerweich", "Shell": "Panzer", "Worm": "Wurm",
    "Cocoon": "Kokon", "Butterfly": "Falter", "Hairy Bug": "Raupe", "Poison Bee": "Giftbiene",
    "Tiny Bird": "Minivogel", "Bird": "Vogel", "Rat": "Ratte", "Beak": "Pick", "Snake": "Schlange",
    "Cobra": "Natter", "Mouse": "Maus", "Poison Pin": "Giftstachel", "Drill": "Bohrer",
    "Fairy": "Fee", "Fox": "Fuchs", "Balloon": "Ballon", "Bat": "Fledermaus", "Weed": "Unkraut",
    "Flower": "Blume", "Mushroom": "Pilz", "Insect": "Insekt", "Poison Moth": "Giftmotte",
    "Mole": "Maulwurf", "Scratch Cat": "Katze", "Classy Cat": "Samtpfote", "Duck": "Ente",
    "Pig Monkey": "Schweinaaffe", "Puppy": "Welpe", "Legendary": "Legendär", "Tadpole": "Quappe",
    "Psi": "Psi", "Superpower": "Kraftprotz", "Flycatcher": "Fliegenfalle", "Jellyfish": "Qualle",
    "Rock": "Felsen", "Megaton": "Gewicht", "Fire Horse": "Feuerpferd", "Dopey": "Dösig",
    "Hermit Crab": "Einsiedler", "Squatter": "Schmarotzer", "Magnet": "Magnet",
    "Wild Duck": "Entoron", "Twin Bird": "Duovogel", "Triple Bird": "Triovogel",
    "Sea Lion": "Seehund", "Sludge": "Schlamm", "Bivalve": "Muschel", "Gas": "Gas",
    "Shadow": "Schatten", "Rock Snake": "Felsenschlange", "Hypnosis": "Hypnose",
    "River Crab": "Flusskrabbe", "Pincer": "Schere", "Ball": "Ball", "Egg": "Ei",
    "Coconut": "Kokosnuss", "Lonely": "Einsam", "Bone Keeper": "Knochenhüter",
    "Kicking": "Kicker", "Punching": "Puncher", "Licking": "Schlecker", "Poison Gas": "Giftgas",
    "Spikes": "Stachel", "Vine": "Kletterer", "Parent": "Mutter", "Dragon": "Drache",
    "Goldfish": "Goldfisch", "Star Shape": "Stern", "Mysterious": "Mysterium",
    "Barrier": "Barriere", "Mantis": "Sichelkäfer", "Human Shape": "Humanoid",
    "Electric": "Elektro", "Spitfire": "Feuer", "Stag Beetle": "Hirschkäfer",
    "Wild Bull": "Wildbulle", "Fish": "Fisch", "Atrocious": "Brutal", "Transport": "Transport",
    "Transform": "Transform", "Evolution": "Evolution", "Bubble Jet": "Blubber",
    "Lightning": "Blitz", "Virtual": "Virtuell", "Spiral": "Spirale", "Fossil": "Fossil",
    "Sleeping": "Schläfer", "Freeze": "Gefrier", "Genetic": "Genmutant", "New Species": "Neuart",
    "Leaf": "Laub", "Herb": "Kraut", "Fire Mouse": "Feuermaus", "Volcano": "Vulkan",
    "Big Jaw": "Großmaul", "Scout": "Späher", "Long Body": "Langgliedrig", "Owl": "Eule",
    "Five Star": "Fünfstern", "String Spit": "Faden", "Long Leg": "Langbein",
    "Angler": "Laternen", "Light": "Leuchte", "Tiny Mouse": "Minimaus",
    "Spike Ball": "Stachelball", "Happiness": "Freude", "Little Bird": "Spatz",
    "Mystic": "Mystik", "Wool": "Wolle", "Aqua Mouse": "Aquamaus", "Aqua Rabbit": "Aquahase",
    "Imitation": "Nachahmer", "Frog": "Frosch", "Cottonweed": "Löwenzahn",
    "Long Tail": "Langschweif", "Sun": "Sonne", "Clear Wing": "Libelle", "Water Fish": "Fisch",
    "Moonlight": "Mondlicht", "Darkness": "Finsternis", "Royal": "König", "Screech": "Kreischer",
    "Symbol": "Symbol", "Patient": "Geduldig", "Long Neck": "Langhals", "Bagworm": "Beutel",
    "Land Snake": "Landraupe", "FlyScorpion": "Skorpion", "Iron Snake": "Eisen",
    "Scissors": "Schere", "Mold": "Schimmel", "Single Horn": "Horn", "Sharp Claw": "Scharfklaue",
    "Little Bear": "Jungbär", "Hibernator": "Winterschlaf", "Lava": "Lava", "Pig": "Schwein",
    "Swine": "Wildschwein", "Coral": "Koralle", "Jet": "Jet", "Delivery": "Kurier",
    "Kite": "Drachen", "Armor Bird": "Panzer", "Dark": "Dunkel", "Long Nose": "Rüssel",
    "Armor": "Panzer", "Big Horn": "Großhorn", "Painter": "Maler", "Scuffle": "Rauf",
    "Handstand": "Radler", "Kiss": "Kuss", "Live Coal": "Glut", "Milk Cow": "Milchkuh",
    "Thunder": "Donner", "Aurora": "Polarlicht", "Rock Skin": "Steinhaut",
    "Hard Shell": "Rüstepanzer", "Diving": "Tauchen", "Rainbow": "Regenbogen",
    "Time Travel": "Zeitreise", "Polka Dot": "Tüpfel", "Bright": "Strahl", "Magical": "Magie",
    "Big Boss": "Don", "Bonsai": "Bonsai", "Mime": "Mime", "Playhouse": "Spielhaus",
    "Big Eater": "Vielfraß", "Magnet Area": "Magnetzone", "Thunderbolt": "Donnerkeil",
    "Blast": "Detonator", "Jubilee": "Festtag", "Ogre Darner": "Libelle", "Verdant": "Blattgrün",
    "Fresh Snow": "Neuschnee", "FangScorpion": "Fangskorpion", "Twin Tusk": "Doppelstoßzahn",
    "Intertwined": "Band", "Viking": "Wikinger", "Comedian": "Komiker", "Axe": "Axt",
    "Peat": "Torf", "Free Climb": "Freikletterer", "Pin Cluster": "Stachel",
    "Spiny Fish": "Stachler", "Rage Monkey": "Wutaffe", "Unique Horn": "Einhorn",
    "Dancing": "Tänzer", "Cruel": "Grausam", "Strong Legs": "Starkbein", "Malevolent": "Unheil",
    "Hexpert": "Hexenmeister", "Ghost Flame": "Geisterflamme", "Sphere": "Kugel",
    "Poison Fish": "Giftfisch",
}

# Manual German for custom/modern forms not in PokeAPI
MANUAL_DE = {
    "GyaradosRedPokedexEntry": "Durch die rasche Zwangsentwicklung behielt dieses Garados die roten Schuppen eines Karpador.",
    "MewtwoArmoredPokedexEntry": "Mit verstärkter Verteidigung und verstärkten Psycho-Angriffen durch die Rüstung ist Mewtu unaufhaltsam.",
    "RattataAlolanPokedexEntry": "Es interessiert sich nur für Frisches. Nimmst du es einkaufen, hilft es bei der Auswahl.",
    "RaticateAlolanPokedexEntry": "Es lässt Rattfratz-Untergebene Nahrung sammeln und frisst nur das Beste und Nahrhafteste.",
    "RaichuAlolanPokedexEntry": "Reibt man seine Wangen, verströmt es einen süßen Duft. Man bekommt aber auch einen leichten Schock.",
    "SandshrewAlolanPokedexEntry": "Es lebt auf Schneebergen. Sein Stahlpanzer ist so hart, dass es sich nicht einrollen kann.",
    "SandslashAlolanPokedexEntry": "Viele klettern auf Schneeberge, um die Eiszapfen dieses #mon im Morgenlicht zu sehen.",
    "VulpixAlolanPokedexEntry": "Betrachtet man seine lockigen Haare im Mikroskop, sieht man kleine Eiskristalle entstehen.",
    "NinetalesAlolanPokedexEntry": "Es führt Menschen den Berg hinab, damit sie schnell gehen und das Gebiet verlassen.",
    "DiglettAlolanPokedexEntry": "Das metallreiche Gestein seiner Heimat ließ Stahlbarthaare auf seinem Kopf wachsen.",
    "DugtrioAlolanPokedexEntry": "Seine metallischen Barthaare sind schwer, daher ist es langsam, kann aber durch Fels graben.",
    "MeowthAlolanPokedexEntry": "Hochintelligent und stolz, ist es berühmt schwer zu zähmen. Das macht es auch beliebt.",
    "GrimerAlolanPokedexEntry": "Ein zur Müllbeseitigung eingesetztes Sleima entwickelte sich zu dieser Form.",
    "MukAlolanPokedexEntry": "Sleimoks Färbung wird lebhafter, je mehr es von seinem Lieblingsgericht Müll frisst.",
    "ExeggutorAlolanPokedexEntry": "Es schwingt den langen Hals wie eine Peitsche gegen Gegner. Dadurch wird auch es selbst schwindelig.",
    "MarowakAlolanPokedexEntry": "Es entzündet den Knochen in der Hand und tanzt nachts, um gefallene Gefährten zu betrauern.",
    "MeowthGalarianPokedexEntry": "Diese mutigen #mon haben Münzen auf der Stirn. Härtere Münzen bringen mehr Respekt.",
    "PersianAlolanPokedexEntry": "Es hat das edelste Fell. Das Wellen im Kampf hat eine eigene Schönheit.",
    "GeodudeAlolanPokedexEntry": "Sein Körper ist magnetischer Stein. Eisensand haftet an den stärksten magnetischen Stellen.",
    "GravelerAlolanPokedexEntry": "Sein ganzer Körper ist elektrisch geladen durch die Steine, die es frisst. Es ist sehr jähzornig.",
    "GolemAlolanPokedexEntry": "Es schießt elektrisch geladene Felsen. Schrammt man nur daran, wird man betäubt.",
    "PonytaGalarianPokedexEntry": "Es blickt dir in die Augen und liest dein Herz. Findet es Böses, zieht es sich zurück.",
    "RapidashGalarianPokedexEntry": "Ein Psycho-Angriff aus seinem Horn kann selbst dickes Blech durchschlagen.",
    "SlowpokeGalarianPokedexEntry": "Normalerweise träumerisch, wird sein Blick manchmal plötzlich scharf. Vielleicht liegt es am Futter.",
    "SlowbroGalarianPokedexEntry": "Ein Muschas-Biss löste eine chemische Reaktion aus und machte Lahmus zu einem Gift-#mon.",
    "FarfetchDGalarianPokedexEntry": "Diese besonderen Porenta sind tapfere Krieger und kämpfen mit dicken, festen Lauchstangen.",
    "WeezingGalarianPokedexEntry": "Es nimmt verschmutzte Luftpartikel auf. Statt Kot auszuscheiden, stößt es saubere Luft aus.",
    "MrMimeGalarianPokedexEntry": "Es kann Kälte von den Fußsohlen abgeben und tanzt den ganzen Tag auf gefrorenem Boden.",
    "ArticunoGalarianPokedexEntry": "Als Arktos bekannt, feuert dieses #mon Strahlen ab, die Gegner wie erstarrt lähmen.",
    "ZapdosGalarianPokedexEntry": "Wenn sich seine Federn reiben, entsteht ein Knistern wie elektrische Entladungen.",
    "MoltresGalarianPokedexEntry": "Die finstere Aura um dieses #mon, die wie Feuer lodert, gab ihm den Namen Lavados.",
    "SlowkingGalarianPokedexEntry": "Gift und der Schock der Entwicklung ließen Muschas die Kontrolle über Laschoking übernehmen.",
    "CorsolaGalarianPokedexEntry": "Plötzlicher Klimawandel löschte dieses #mon aus. Es saugt über Äste fremde Lebenskraft.",
    "GrowlitheHisuianPokedexEntry": "Sie patrouillieren zu zweit ihr Revier. Ihr Fell enthält vulkanisches Gestein.",
    "ArcanineHisuianPokedexEntry": "Trotz seiner Masse fintiert es geschickt und führt Gegner beim Tanz vorbei.",
    "VoltorbHisuianPokedexEntry": "Wird es aufgeregt, entlädt es Strom aus dem Bauch und lacht dabei.",
    "ElectrodeHisuianPokedexEntry": "Das Gewebe an seiner Oberfläche ähnelt stark einer Aprikoko.",
    "TyphlosionHisuianPokedexEntry": "Man sagt, es reinige verlorene Seelen mit seinen Flammen und geleite sie ins Jenseits.",
    "QwilfishHisuianPokedexEntry": "Fischer hassen es, weil es Gift aus Stacheln spritzt und alles besprüht.",
    "SneaselHisuianPokedexEntry": "Seine robusten Krallen eignen sich fürs Klettern. Sie tropfen Gift in die Beute.",
    "WooperPaldeanPokedexEntry": "Sie gehen zu dritt oder viert und helfen einander beim Gang durch gefährliche Sümpfe.",
    "TaurosPaldeanPokedexEntry": "Die Kampfrasse kämpft aus nächster Nähe und trifft mit kurzen Hörnern Schwachstellen.",
    "TaurosPaldeanFirePokedexEntry": "Die Hörner der Flammenrasse erreichen über 1800 Grad. Aufstoß verursacht Brandwunden.",
    "TaurosPaldeanWaterPokedexEntry": "Die Aqua-Rasse schwimmt, indem es Wasser aus den Hörnern spritzt. Hoher Körperfettanteil lässt es schweben.",
    "UrsalunaBloodmoonPokedexEntry": "Mit dem linken Auge sieht es im Dunkeln und schützt sich mit hartem Schlamm wie Eisen.",
    "AmbipomPokedexEntry": "Geteilte Schweife sind so geschickt, dass Ambidiffel seine Hände kaum noch nutzt.",
    "HonchkrowPokedexEntry": "Es ist von Natur aus gnadenlos und verzeiht Fehler seiner Kramurx-Anhänger nie.",
    "MismagiusPokedexEntry": "Seine Rufe klingen wie Beschwörungen zur Qual des Gegners. Es erscheint unerwartet.",
    "BonslyPokedexEntry": "Es bevorzugt trockene Luft. Beim Feuchtigkeitsausgleich tropft wassertropfenartige Flüssigkeit.",
    "MimeJrPokedexEntry": "Es ahmt Mimik und Gesten nach, um die Gefühle anderer zu verstehen.",
    "HappinyPokedexEntry": "Es trägt einen runden, eiförmigen Stein im Bauchbeutel und schenkt ihn Freunden.",
    "MunchlaxPokedexEntry": "In seiner Gier zu fressen vergisst es das Futter, das es im Fell versteckt hat.",
    "MantykePokedexEntry": "Man organisiert Touren, um dieses #mon mit Remoraid über die Wellen gleiten zu sehen.",
    "WeavilePokedexEntry": "Es lebt in Schneeregionen und ritzt mit Krallen Muster in Bäume als Signal.",
    "MagnezonePokedexEntry": "Es entwickelte sich durch ein spezielles Magnetfeld. Drei Einheiten erzeugen Magnetismus.",
    "LickilickyPokedexEntry": "Die lange Zunge ist stets mit Speichel benetzt. Er enthält ein betäubendes Lösungsmittel.",
    "RhyperiorPokedexEntry": "Aus Löchern in seinen Handflächen schießt es Georok. Sein Panzer hält Vulkanausbrüche stand.",
    "TangrowthPokedexEntry": "Es fängt Beute mit aus Ranken gewachsenen Armen. Verliert es welche, stört das es nicht.",
    "ElectivirePokedexEntry": "Es drückt die Schweifspitzen an den Gegner und entlädt über 20000 Volt.",
    "MagmortarPokedexEntry": "Viele Fabriken nutzen noch die Flammen von Magbrust zur Metallverarbeitung.",
    "TogekissPokedexEntry": "Es segnet Menschen, die einander respektieren und unnötigen Streit meiden.",
    "YanmegaPokedexEntry": "Seine Kieferkraft ist enorm. Im Flug beißt es Gegner im Vorbeisausen auseinander.",
    "LeafeonPokedexEntry": "Wie eine Pflanze nutzt es Photosynthese und ist stets von klarer Luft umgeben.",
    "GlaceonPokedexEntry": "Es erzeugt kleine Eiskristalle, indem es die Temperatur der Umgebungsluft senkt.",
    "GliscorPokedexEntry": "Sein Flug ist lautlos. Mit dem langen Schweif trägt es Beute fort, dann greifen die Fangzähne.",
    "MamoswinePokedexEntry": "Seine Stoßzähne bestehen aus Eis. Nach der Eiszeit wurde die Population kleiner.",
    "PorygonZPokedexEntry": "Sein Programm wurde für fremde Dimensionen geändert. Es funktionierte nicht wie geplant.",
    "SylveonPokedexEntry": "Es wickelt bandartige Fühler um den Arm seines geliebten Trainers und geht mit ihm.",
    "PerrserkerPokedexEntry": "Nach vielen Kämpfen entwickelte es gefährliche Krallen, die wie Dolche wirken.",
    "CursolaPokedexEntry": "Vorsicht vor dem ectoplasmischen Körper um seine Seele. Berührung lässt einen erstarren.",
    "SirfetchDPokedexEntry": "Nach dem Abwehren mit dem harten Blattschild schlägt es mit dem scharfen Lauch zurück.",
    "MrRimePokedexEntry": "Es ist sehr begabt im Stepptanz und schwingt seinen Eisstock im Takt eleganter Bewegungen.",
    "WyrdeerPokedexEntry": "Das Bartfell hält Wärme gut und ist ein wertvoller Stoff für Winterkleidung.",
    "KleavorPokedexEntry": "Es fällt mit groben Äxten hohe Bäume und schützt sich mit hartem Stein.",
    "UrsalunaPokedexEntry": "Dieses #mon hat einen kräftigen Körper und kann Torf nach Belieben formen.",
    "SneaslerPokedexEntry": "Es hat virulentes Gift und starke Körperkraft. Es lebt lieber allein als im Rudel.",
    "OverqwilPokedexEntry": "Stacheln und wildes Temperament brachten ihm den Namen Meeresungeheuer. Es schlürft Gift.",
    "DudunsparcePokedexEntry": "Mit dem harten Schweif bohrt es Nester in tiefes Gestein. Sie können über zehn Kilometer reichen.",
    "FarigirafPokedexEntry": "Da Hirnwellen von Kopf und Schweif synchron sind, ist seine Psycho-Kraft zehnmal stärker.",
    "ClodsirePokedexEntry": "Wird es angegriffen, stößt es dicke Stacheln aus dem Körper. Ein riskanter Schachzug.",
    "AnnihilapePokedexEntry": "Als seine Wut einen kritischen Punkt überschritt, erlangte es Kraft jenseits seines Körpers.",
    "AzurillPokedexEntry": "Sein Schweif enthält Nährstoffe fürs Wachstum. Es spielt, indem es auf dem Schweif hüpft.",
    "WynautPokedexEntry": "Es bewegt sich meist im Rudel. Einzelne drücken sich zusammen, um ihren Mut zu stärken.",
}


def parse_en_entries(content: str):
    entries = []
    for block in re.split(r"\n(?=SECTION )", content):
        m = re.match(r'SECTION "([^"]+)"', block)
        if not m:
            continue
        name = m.group(1)
        cats = re.findall(r'\tdb "([^"]+)"', block)
        entries.append({"name": name, "cats": cats})
    return entries


def species_slug(name: str) -> str:
    if name in CUSTOM_MAP:
        return CUSTOM_MAP[name]
    if name in MANUAL_DE:
        return ""
    base = name.replace("PokedexEntry", "")
    base = re.sub(
        r"(Plain|Alolan|Galarian|Hisuian|Paldean|PaldeanFire|PaldeanWater|Bloodmoon|Red|Armored)$",
        "",
        base,
    )
    repl = {
        "FarfetchD": "farfetchd", "MrMime": "mr-mime", "MrRime": "mr-rime",
        "HoOh": "ho-oh", "NidoranF": "nidoran-f", "NidoranM": "nidoran-m",
        "MimeJr": "mime-jr", "Porygon2": "porygon2", "PorygonZ": "porygon-z",
    }
    for k, v in repl.items():
        base = base.replace(k, v)
    return re.sub(r"([a-z])([A-Z])", r"\1-\2", base).lower()


def fetch_german_text(slug: str) -> str:
    url = f"https://pokeapi.co/api/v2/pokemon-species/{slug}"
    req = urllib.request.Request(url, headers={"User-Agent": "PolishedCrystal-Translation/1.0"})
    with urllib.request.urlopen(req, timeout=20) as resp:
        data = json.load(resp)
    preferred = ["y", "x", "omega-ruby", "alpha-sapphire", "sun", "moon", "ultra-sun", "ultra-moon"]
    texts = [e for e in data.get("flavor_text_entries", []) if e["language"]["name"] == "de"]
    by_version = {e["version"]["name"]: e["flavor_text"] for e in texts}
    flavor = ""
    for v in preferred:
        if v in by_version:
            flavor = by_version[v]
            break
    if not flavor and texts:
        flavor = texts[0]["flavor_text"]
    flavor = re.sub(r"[\n\f\r]+", " ", flavor)
    flavor = re.sub(r"\s+", " ", flavor).strip()
    return (
        flavor.replace("POKéMON", "#mon")
        .replace("Pokémon", "#mon")
        .replace("Pokemon", "#mon")
    )


def fetch_one(entry: dict) -> tuple[str, str]:
    name = entry["name"]
    if name in MANUAL_DE:
        return name, MANUAL_DE[name]
    slug = species_slug(name)
    try:
        return name, fetch_german_text(slug)
    except Exception as exc:
        print(f"FAIL {name}: {exc}")
        return name, ""


def main():
    en_entries = parse_en_entries(EN_PATH.read_text(encoding="utf-8"))
    paragraphs = {}
    with ThreadPoolExecutor(max_workers=16) as pool:
        futures = {pool.submit(fetch_one, e): e for e in en_entries}
        for fut in as_completed(futures):
            name, text = fut.result()
            if text:
                paragraphs[name] = text

    missing = [e["name"] for e in en_entries if e["name"] not in paragraphs]
    if missing:
        raise SystemExit(f"Missing {len(missing)}: {missing[:8]}")

    lines = ["# German Pokedex paragraphs", "PARAGRAPHS = {"]
    for e in en_entries:
        text = paragraphs[e["name"]].replace("\\", "\\\\").replace('"', '\\"')
        lines.append(f'    "{e["name"]}": "{text}",')
    lines.append("}")
    lines.append("")
    lines.append("CATEGORIES = {")
    for e in en_entries:
        if not e["cats"]:
            continue
        if len(e["cats"]) == 1:
            c = e["cats"][0].replace("@", "")
            lines.append(f'    "{e["name"]}": "{CATEGORY_DE.get(c, c)}",')
        else:
            vals = ", ".join(f'"{CATEGORY_DE.get(c.replace("@",""), c.replace("@",""))}"' for c in e["cats"])
            lines.append(f'    "{e["name"]}": [{vals}],')
    lines.append("}")

    OUT_PATH.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(f"Wrote {len(paragraphs)} German paragraphs")


if __name__ == "__main__":
    main()