#!/usr/bin/env python3
"""Shorten German paragraphs to fit 6 lines x 18 chars."""

import importlib.util
import re
from pathlib import Path

MAX_CHARS = 88  # ~6 lines * 18, conservative for hyphenation

spec = importlib.util.spec_from_file_location(
    "dex_de_paragraphs",
    Path(__file__).parent / "dex_de_paragraphs.py",
)
mod = importlib.util.module_from_spec(spec)
spec.loader.exec_module(mod)

# Crystal-style overrides (shorter, faithful to EN dex_entries_en.asm)
OVERRIDES = {
    "BulbasaurPokedexEntry": "Solange es jung ist, nutzt es Nährstoffe aus den Samen auf seinem Rücken zum Wachsen.",
    "IvysaurPokedexEntry": "Die Knospe auf seinem Rücken wächst und nimmt Nährstoffe auf. Beim Aufblühen verströmt sie einen angenehmen Duft.",
    "VenusaurPokedexEntry": "Wärmt es sich und nimmt Sonnenlicht auf, verströmen seine Blüten einen angenehmen Duft.",
    "CharmanderPokedexEntry": "Ist es gesund, brennt die Flamme an seiner Schwanzspitze kräftig, selbst wenn es etwas nass wird.",
    "CharmeleonPokedexEntry": "Wird es im Kampf wütend, stößt es heftige Flammen aus und verbrennt damit seine Umgebung.",
    "CharizardPokedexEntry": "Mit seinen Flügeln fliegt es hoch. Die Feuertemperatur steigt mit seiner Kampferfahrung.",
    "SquirtlePokedexEntry": "Fühlt es sich bedroht, zieht es die Beine in seinen Panzer und spritzt Wasser aus dem Mund.",
    "WartortlePokedexEntry": "Sein langer Schweif ist ein Symbol für Langlebigkeit und macht es bei älteren Menschen beliebt.",
    "BlastoisePokedexEntry": "Es pflanzt die Füße fest auf den Boden, bevor es Wasser aus den Düsen auf seinem Rücken abschießt.",
    "CaterpiePokedexEntry": "Es kriecht in Blätterwerk, wo es sich unter gleichfarbigen Blättern tarnt.",
    "MetapodPokedexEntry": "Dies ist seine Vorstufe. In diesem Stadium kann es nur erstarren und bleibt regungslos, um Angriffen auszuweichen.",
    "ButterfreePokedexEntry": "Es flattert von Blume zu Blume und sammelt Nektar. Es kann sogar weit entfernte blühende Blumen erkennen.",
    "WeedlePokedexEntry": "Der Stachel auf seinem Kopf sondert ein starkes Gift ab. Es nutzt diesen giftigen Stachel zur Verteidigung.",
    "KakunaPokedexEntry": "Es ist kaum bewegungsfähig und lehnt sich an Bäume, während es auf seine Entwicklung wartet.",
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
    "NidoqueenPokedexEntry": "Die harten Schuppen auf seinem Körper bieten ausgezeichneten Schutz vor jedem Angriff.",
    "NidoranMPokedexEntry": "Es bewegt ständig seine großen Ohren in viele Richtungen, um Gefahr sofort zu erkennen.",
    "NidorinoPokedexEntry": "Es ist leicht reizbar und stößt mit seinem Horn an, sobald es einen Angreifer bemerkt.",
    "NidokingPokedexEntry": "Es greift mit Armen, Beinen und Schweif kraftvoll an. Nahkampf ist seine Spezialität.",
    "FearowPokedexEntry": "Es greift mit seinem langen Schnabel an. Seine Reichweite ist groß, Vorsicht!",
    "PidgeotPokedexEntry": "Dieses #mon fliegt mit Mach-2 auf Beutejagd. Seine Krallen sind furchterregende Waffen.",
    "IvysaurPokedexEntry": "Die Knospe auf seinem Rücken wächst und nimmt Nährstoffe auf. Beim Blühen duftet sie.",
    "MetapodPokedexEntry": "Dies ist seine Vorstufe. Es kann nur erstarren und bleibt regungslos, um Angriffen auszuweichen.",
    "WeedlePokedexEntry": "Der Stachel auf seinem Kopf sondert Gift. Es schützt sich damit.",
    "DratiniPokedexEntry": "Es häutet sich beim Wachsen. Ein Wasserstrahl schützt es dabei.",
    "RaticatePlainPokedexEntry": "Schwimmhäute an seinen Hinterbeinen ermöglichen Flussüberquerungen. Es sucht weit nach Nahrung.",
    "MewtwoArmoredPokedexEntry": "Mit verstärkter Verteidigung und Psycho-Angriffen durch die Rüstung ist Mewtu unaufhaltsam.",
    "NinetalesPlainPokedexEntry": "Man sagt, es lebe tausend Jahre und jeder seiner Schweife sei mit übernatürlicher Kraft beladen.",
    "ZubatPokedexEntry": "Tagsüber versammelt es sich mit anderen und hängt an Decken alter Gebäude und Höhlen.",
    "OddishPokedexEntry": "Tagsüber hält es sich kühl unter der Erde, um die Sonne zu meiden. Es wächst beim Baden im Mondlicht.",
    "DiglettPlainPokedexEntry": "Es gräbt unter der Erde und knabbert an Wurzeln, wobei es den Kopf nur zeigt, wenn die Sonne nicht scheint.",
    "MankeyPokedexEntry": "Es lebt in Gruppen in den Baumkronen. Verliert es seine Gruppe aus den Augen, wird es vor Wut wütend.",
    "PrimeapePokedexEntry": "Es verprügelt jeden, der es wütend macht, und verfolgt ihn bis ans Ende der Welt.",
    "ArcaninePokedexEntry": "Eine alte Bilderrolle zeigt, dass Menschen von seiner Bewegung angezogen wurden, wenn es über Prärien rannte.",
    "PoliwhirlPokedexEntry": "Obwohl es gut laufen kann, lebt es lieber unter Wasser, wo es weniger Gefahr gibt.",
    "AlakazamPokedexEntry": "Es hat einen IQ von 5000. Es berechnet vieles, um im Kampf stets im Vorteil zu sein.",
    "BellsproutPokedexEntry": "Bemerkt es etwas Bewegtes, schleudert es sofort seine Ranke auf das Objekt.",
    "SlowpokePlainPokedexEntry": "Es ist stets geistesabwesend und reagiert nicht, selbst wenn man in seinen leckeren Schweif beißt.",
    "MagnemitePokedexEntry": "Die Elektrizität der Einheiten an beiden Seiten seines Körpers machen es zu einem starken Magneten.",
    "OnixPokedexEntry": "Beim Graben absorbiert es viele harte Objekte, wodurch sein Körper so fest wird.",
    "ExeggutorPlainPokedexEntry": "Lebt es in guter Umgebung, wachsen viele Köpfe. Ein abfallender Kopf wird zu einem Owei.",
    "GoldeenPokedexEntry": "In der Laichzeit schwimmen sie anmutig im Wasser und suchen ihren idealen Partner.",
    "OmanytePokedexEntry": "In der Urzeit schwamm es auf dem Meeresboden und fraß Plankton. Fossilien werden gefunden.",
    "PichuPokedexEntry": "Es kann Elektrizität noch nicht gut speichern. Jeder Schock lässt es Energie entweichen.",
    "IgglybuffPokedexEntry": "Statt mit kurzen Beinen zu laufen, hüpft es auf seinem weichen, zarten Körper umher.",
    "PinecoPokedexEntry": "Es spuckt eine Flüssigkeit aus, mit der es Baumrinde an seinen Körper klebt. Sie härtet an der Luft.",
    "ScizorPokedexEntry": "Die stählernen Scheren dieses #mon zermalmen jedes harte Objekt, das sie packen.",
    "SlugmaPokedexEntry": "Sie sammeln sich in besonders heißen Gebieten. Kühlt es ab, wird die Haut hart.",
    "BonslyPokedexEntry": "Es bevorzugt trockene Luft. Beim Anpassen der Feuchtigkeit tropft tränenartige Flüssigkeit.",
    "MagbyPokedexEntry": "Es spuckt von Natur aus heiße Flammen. Viele deuten auf einen Vulkanausbruch hin.",
}


def shorten(text: str) -> str:
    if len(text) <= MAX_CHARS:
        return text
    # Keep first sentence(s) until under limit
    sentences = re.split(r"(?<=[.!?])\s+", text)
    out = ""
    for s in sentences:
        trial = (out + " " + s).strip()
        if len(trial) <= MAX_CHARS:
            out = trial
        else:
            break
    if out:
        return out
    # Hard truncate at word boundary
    words = text.split()
    out = ""
    for w in words:
        trial = (out + " " + w).strip()
        if len(trial) <= MAX_CHARS - 1:
            out = trial
        else:
            break
    return out + "."


def main():
    new = {}
    for name, text in mod.PARAGRAPHS.items():
        new[name] = OVERRIDES.get(name, shorten(text))

    lines = list(open(Path(__file__).parent / "dex_de_paragraphs.py", encoding="utf-8"))
    # Rebuild PARAGRAPHS section
    out = ["# German Pokedex paragraphs (crystal-length)", "PARAGRAPHS = {"]
    order = [k.split('"')[1] for k in lines if k.strip().startswith('"') and "PokedexEntry" in k]
    seen = set()
    for name in mod.PARAGRAPHS:
        if name in seen:
            continue
        seen.add(name)
        t = new[name].replace("\\", "\\\\").replace('"', '\\"')
        out.append(f'    "{name}": "{t}",')
    out.append("}")
    # Keep CATEGORIES from original
    cat_start = next(i for i, l in enumerate(lines) if l.startswith("CATEGORIES"))
    out.extend(lines[cat_start:])
    Path(__file__).parent.joinpath("dex_de_paragraphs.py").write_text("\n".join(out), encoding="utf-8")
    print("Updated paragraphs")


if __name__ == "__main__":
    main()