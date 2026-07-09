#!/usr/bin/env python3
"""Apply first-read German paragraphs to crystal_paragraphs.py and rebuild dex."""

import importlib.util
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent
sys_path = ROOT / "build_final_dex.py"

# Import build_final_dex components
spec = importlib.util.spec_from_file_location("bfd", ROOT / "build_final_dex.py")
bfd = importlib.util.module_from_spec(spec)
spec.loader.exec_module(bfd)

spec2 = importlib.util.spec_from_file_location("sp", ROOT / "shorten_paragraphs.py")
sp = importlib.util.module_from_spec(spec2)
spec2.loader.exec_module(sp)

spec3 = importlib.util.spec_from_file_location("fp", ROOT / "fetch_de_paragraphs.py")
fp = importlib.util.module_from_spec(spec3)
spec3.loader.exec_module(fp)

EN = (ROOT.parent / "data" / "pokemon" / "dex_entries_en.asm").read_text(encoding="utf-8")
en_names = re.findall(r'SECTION "([^"]+)"', EN)

# First-read German paragraphs (crystal style, from translation pass)
FIRST_READ = {
    "BulbasaurPokedexEntry": "Solange es jung ist, nutzt es Nährstoffe aus den Samen auf seinem Rücken zum Wachsen.",
    "IvysaurPokedexEntry": "Die Knospe auf seinem Rücken wächst und nimmt Nährstoffe auf. Beim Aufblühen verströmt sie einen angenehmen Duft.",
    "VenusaurPokedexEntry": "Wärmt es sich und nimmt Sonnenlicht auf, verströmen seine Blüten einen angenehmen Duft.",
    "CharmanderPokedexEntry": "Ist es gesund, brennt die Flamme an seiner Schwanzspitze kräftig, selbst wenn es etwas nass wird.",
    "CharmeleonPokedexEntry": "Wird es im Kampf wütend, stößt es heftige Flammen aus und verbrennt damit seine Umgebung.",
    "CharizardPokedexEntry": "Mit seinen Flügeln fliegt es hoch. Die Feuertemperatur steigt mit seiner Kampferfahrung.",
    "SquirtlePokedexEntry": "Fühlt es sich bedroht, zieht es die Beine in seinen Panzer und spritzt Wasser aus dem Mund.",
    "WartortlePokedexEntry": "Sein langer, behaarter Schweif ist ein Symbol für Langlebigkeit und macht es bei älteren Menschen beliebt.",
    "BlastoisePokedexEntry": "Es pflanzt die Füße fest auf den Boden, bevor es Wasser aus den Düsen auf seinem Rücken abschießt.",
    "CaterpiePokedexEntry": "Es kriecht in Blätterwerk, wo es sich unter gleichfarbigen Blättern tarnt.",
    "MetapodPokedexEntry": "Dies ist seine Vorstufe. In diesem Stadium kann es nur erstarren und bleibt regungslos, um Angriffen auszuweichen.",
    "ButterfreePokedexEntry": "Es flattert von Blume zu Blume und sammelt Nektar. Es kann sogar weit entfernte blühende Blumen erkennen.",
    "WeedlePokedexEntry": "Der Stachel auf seinem Kopf sondert ein starkes Gift ab. Es nutzt diesen giftigen Stachel zur Verteidigung.",
    "KakunaPokedexEntry": "Es ist kaum bewegungsfähig und lehnt sich an starke Bäume, während es auf seine Entwicklung wartet.",
    "BeedrillPokedexEntry": "Es besiegt Beute mit scharfen, giftigen Stacheln und bringt sie in sein Nest als Nahrung.",
    "PidgeyPokedexEntry": "Es schlägt schnell mit den Flügeln im Gras und wirbelt Staub auf, um Insektenbeute hervorzulocken.",
    "PidgeottoPokedexEntry": "Es fliegt langsam im Kreis und hält dabei Ausschau nach Beute.",
    "PidgeotPokedexEntry": "Dieses #mon fliegt mit Mach-2-Geschwindigkeit auf Beutejagd. Seine großen Krallen gelten als furchterregende Waffen.",
    "RattataPlainPokedexEntry": "Die enorme Vitalität dieses #mon erlaubt es ihm, überall zu leben. Es vermehrt sich auch sehr schnell.",
    "RaticatePlainPokedexEntry": "Die Schwimmhäute an seinen Hinterbeinen ermöglichen es ihm, Flüsse zu überqueren. Es sucht weit nach Nahrung.",
    "SpearowPokedexEntry": "Zum Schutz seines Reviers fliegt es unaufhörlich umher und gibt hohe Schreie von sich.",
    "FearowPokedexEntry": "Es greift mit seinem langen Schnabel an. Seine Reichweite ist überraschend groß, daher ist Vorsicht geboten.",
    "EkansPokedexEntry": "Es züngelt mit der Zungenspitze, um den Geruch von Beute zu erschnüffern, und schluckt sie dann im Ganzen.",
    "ArbokPokedexEntry": "Um Gegner einzuschüchtern, breitet es die Brust weit und stößt unheimliche Laute aus seinem Maul.",
    "PikachuPokedexEntry": "Wenn es wütend ist, entlädt es sofort die in den Backentaschen gespeicherte Energie.",
    "RaichuPlainPokedexEntry": "Sind seine elektrischen Backentaschen leer, hebt es den Schweif, um Elektrizität aus der Luft zu sammeln.",
    "SandshrewPlainPokedexEntry": "Es bevorzugt trockene, sandige Orte, da es den Sand zum Schutz nutzt, wenn es bedroht wird.",
    "SandslashPlainPokedexEntry": "Es kann gut klettern, rollt sich zu einem stacheligen Ball und greift Gegner von oben an.",
    "NidoranFPokedexEntry": "Klein und sehr fügsam, schützt es sich mit seinem kleinen, giftigen Horn, wenn es angegriffen wird.",
    "NidorinaPokedexEntry": "Es hat ein sanftes Wesen. Wird es bedroht, richtet es die Stacheln über seinem ganzen Körper auf.",
    "NidoqueenPokedexEntry": "Die harten Schuppen, die seinen starken Körper bedecken, bieten ausgezeichneten Schutz vor jedem Angriff.",
    "NidoranMPokedexEntry": "Es bewegt ständig seine großen Ohren in viele Richtungen, um Gefahr sofort zu erkennen.",
    "NidorinoPokedexEntry": "Es ist leicht reizbar und stößt mit seinem Horn an, sobald es einen Angreifer bemerkt.",
    "NidokingPokedexEntry": "Es greift mit Armen, Beinen und Schweif kraftvoll an. Nahkampf ist seine Spezialität.",
}

FIRST_READ.update(sp.OVERRIDES)
FIRST_READ.update(fp.MANUAL_DE)

# Load remaining from crystal_paragraphs if not in FIRST_READ
spec4 = importlib.util.spec_from_file_location("cp", ROOT / "crystal_paragraphs.py")
cp = importlib.util.module_from_spec(spec4)
spec4.loader.exec_module(cp)

paragraphs = {}
for name in en_names:
    if name in FIRST_READ:
        paragraphs[name] = FIRST_READ[name]
    elif name in cp.PARAGRAPHS:
        p = cp.PARAGRAPHS[name]
        if "wird Schwanzspitze" not in p and "beliebt Langlebigkeit" not in p:
            paragraphs[name] = p.rstrip(" .") + "."
        else:
            # fallback shorten from EN via pokeapi manual
            paragraphs[name] = cp.PARAGRAPHS[name]
    else:
        raise SystemExit(f"Missing {name}")

# Write crystal_paragraphs.py
lines = ["# German Pokedex paragraphs", "PARAGRAPHS = {"]
for name in en_names:
    t = paragraphs[name].replace("\\", "\\\\").replace('"', '\\"')
    lines.append(f'    "{name}": "{t}",')
lines.append("}")
lines.append("")
lines.append("CATEGORIES = {")
for k, v in cp.CATEGORIES.items():
    if isinstance(v, list):
        lines.append(f'    "{k}": [{", ".join(chr(34)+x+chr(34) for x in v)}],')
    else:
        lines.append(f'    "{k}": "{v}",')
lines.append("}")
(ROOT / "crystal_paragraphs.py").write_text("\n".join(lines) + "\n", encoding="utf-8")
print("Updated crystal_paragraphs.py")

# Rebuild dex
import subprocess
subprocess.check_call(["python", str(ROOT / "build_final_dex.py")])
print("Done")