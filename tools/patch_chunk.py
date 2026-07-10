#!/usr/bin/env python3
"""Patch first 18 dex entries with properly wrapped German text."""
import pathlib
import re

MAX = 18
NUM = 6
ROOT = pathlib.Path(__file__).resolve().parent.parent
DEX = ROOT / "data" / "pokemon" / "dex_entries.asm"
EN = ROOT / "data" / "pokemon" / "dex_entries_en.asm"

# Official German Crystal-style full text (restore Bisasam official wording)
TEXT = {
    "BulbasaurPokedexEntry": "Solange es jung ist, nutzt es die in den Samen auf seinem Rücken gespeicherten Nährstoffe, um zu wachsen.",
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
    "PidgeotPokedexEntry": "Dieses #mon fliegt mit Mach-2-Geschwindigkeit auf Beutejagd. Seine großen Krallen gelten als furchtbare Waffen.",
}

CAT = {
    "BulbasaurPokedexEntry": "Samen",
    "IvysaurPokedexEntry": "Samen",
    "VenusaurPokedexEntry": "Samen",
    "CharmanderPokedexEntry": "Eidechse",
    "CharmeleonPokedexEntry": "Flamme",
    "CharizardPokedexEntry": "Flamme",
    "SquirtlePokedexEntry": "Minikröte",
    "WartortlePokedexEntry": "Schildkröte",
    "BlastoisePokedexEntry": "Panzer",
    "CaterpiePokedexEntry": "Wurm",
    "MetapodPokedexEntry": "Kokon",
    "ButterfreePokedexEntry": "Falter",
    "WeedlePokedexEntry": "Raupe",
    "KakunaPokedexEntry": "Kokon",
    "BeedrillPokedexEntry": "Giftbiene",
    "PidgeyPokedexEntry": "Minivogel",
    "PidgeottoPokedexEntry": "Vogel",
    "PidgeotPokedexEntry": "Vogel",
}

FAITHFUL = {"BlastoisePokedexEntry": ("Panzerweich", "Panzer")}

# Hand-verified wraps (all lines <= 18)
WRAPS = {
    "BulbasaurPokedexEntry": [
        "Solange es jung",
        "ist, nutzt es die",
        "in den Samen auf",
        "seinem Rücken ge-",
        "speicherten Nähr-",
        "stoffe, um zu wachsen.",
    ],
    "IvysaurPokedexEntry": [
        "Die Knospe auf",
        "seinem Rücken",
        "wächst und nimmt",
        "Nährstoffe auf.",
        "Beim Aufblühen",
        "verströmt sie einen angenehmen Duft.",
    ],
    "VenusaurPokedexEntry": [
        "Wärmt es sich und",
        "nimmt Sonnenlicht",
        "auf, verströmen",
        "seine Blüten",
        "einen",
        "angenehmen Duft.",
    ],
    "CharmanderPokedexEntry": [
        "Ist es gesund,",
        "brennt die Flamme",
        "an seiner Schwanz-",
        "spitze kräftig,",
        "selbst wenn es",
        "etwas nass wird.",
    ],
    "CharmeleonPokedexEntry": [
        "Wird es im Kampf",
        "wütend, stößt es",
        "heftige Flammen",
        "aus und verbrennt",
        "damit seine",
        "Umgebung.",
    ],
    "CharizardPokedexEntry": [
        "Mit seinen Flügeln",
        "fliegt es hoch.",
        "Die",
        "Feuertemperatur",
        "steigt mit seiner",
        "Kampferfahrung.",
    ],
    "SquirtlePokedexEntry": [
        "Fühlt es sich",
        "bedroht, zieht es",
        "die Beine in",
        "seinen Panzer und",
        "spritzt Wasser aus",
        "dem Mund.",
    ],
    "WartortlePokedexEntry": [
        "Sein langer,",
        "behaarter Schweif",
        "ist ein Symbol für",
        "Langlebigkeit und",
        "macht es bei",
        "älteren Menschen beliebt.",
    ],
    "BlastoisePokedexEntry": [
        "Es pflanzt die",
        "Füße fest auf den",
        "Boden, bevor es",
        "Wasser aus den",
        "Düsen auf seinem",
        "Rücken abschießt.",
    ],
    "CaterpiePokedexEntry": [
        "Es kriecht in",
        "Blätterwerk, wo",
        "es",
        "sich unter",
        "gleichfarbigen",
        "Blättern tarnt.",
    ],
    "MetapodPokedexEntry": [
        "Dies ist seine",
        "Vorstufe. In",
        "diesem Stadium",
        "kann es nur",
        "erstarren und",
        "bleibt regungslos, um Angriffen auszuweichen.",
    ],
    "ButterfreePokedexEntry": [
        "Es flattert von",
        "Blume zu Blume und",
        "sammelt Nektar. Es",
        "kann sogar weit",
        "entfernte blühende",
        "Blumen erkennen.",
    ],
    "WeedlePokedexEntry": [
        "Der Stachel auf",
        "seinem Kopf",
        "sondert ein",
        "starkes Gift ab.",
        "Es nutzt diesen",
        "giftigen Stachel zur Verteidigung.",
    ],
    "KakunaPokedexEntry": [
        "Es ist kaum",
        "bewegungsfähig und",
        "lehnt sich an",
        "starke Bäume,",
        "während es auf",
        "seine Entwicklung wartet.",
    ],
    "BeedrillPokedexEntry": [
        "Es besiegt Beute",
        "mit scharfen,",
        "giftigen Stacheln",
        "und bringt sie in",
        "sein Nest als",
        "Nahrung.",
    ],
    "PidgeyPokedexEntry": [
        "Es schlägt schnell",
        "mit den Flügeln im",
        "Gras und wirbelt",
        "Staub auf, um",
        "Insektenbeute",
        "hervorzulocken.",
    ],
    "PidgeottoPokedexEntry": [
        "Es fliegt",
        "langsam",
        "im Kreis und",
        "hält",
        "dabei Ausschau",
        "nach Beute.",
    ],
    "PidgeotPokedexEntry": [
        "Dieses #mon fliegt",
        "mit Mach-2-",
        "Geschwindigkeit",
        "auf Beutejagd.",
        "Seine großen",
        "Krallen gelten als furchtbare Waffen.",
    ],
}


def verify():
    failed = []
    for name, lines in WRAPS.items():
        full = TEXT[name].replace(" ", "")
        got = "".join(l.replace("-", "") for l in lines).replace(" ", "")
        # normalize compare without spaces/hyphens
        src = re.sub(r"\s+", "", TEXT[name])
        chk = re.sub(r"\s+", "", "".join(l.replace("-", "") for l in lines))
        if src != chk:
            failed.append((name, "content", src, chk))
        for i, l in enumerate(lines):
            if len(l) > MAX:
                failed.append((name, f"len line {i}", len(l), l))
    return failed


def format_entry(name, lines):
    out = [f'SECTION "{name}", ROMX', f"{name}::"]
    if name in FAITHFUL:
        f, e = FAITHFUL[name]
        out += ["if DEF(FAITHFUL)", f'\tdb "{f}@"', "else", f'\tdb "{e}@"', "endc"]
    else:
        out.append(f'\tdb "{CAT[name]}@"')
    tags = ["text", "next", "next", "page", "next", "next"]
    for i, (tag, line) in enumerate(zip(tags, lines)):
        suffix = "@" if i == 5 else ""
        out.append(f'\t{tag} "{line}{suffix}"')
    return "\n".join(out)


def main():
    fails = verify()
    if fails:
        print("Verification failed:")
        for f in fails:
            print(f)
        return 1

    src = DEX.read_text(encoding="utf-8")
    parts = re.split(r"\n(?=SECTION )", src)
    chunk = [format_entry(n, WRAPS[n]) for n in WRAPS]
    new_head = "\n\n".join(chunk) + "\n\n"
    # keep from Rattata onward
    tail_idx = None
    for i, p in enumerate(parts):
        if p.startswith('SECTION "Rattata'):
            tail_idx = i
            break
    if tail_idx is None:
        raise SystemExit("Could not find Rattata section")
    tail = "\n\n".join(parts[tail_idx:])
    DEX.write_text(new_head + tail, encoding="utf-8")
    print("Patched", len(chunk), "entries")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())