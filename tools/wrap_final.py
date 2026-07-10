#!/usr/bin/env python3
import pathlib

MAX = 18
N = 6


def splits(word):
    if len(word) <= MAX:
        return [(word, "")]
    opts = []
    for cut in range(MAX - 1, 2, -1):
        if word[cut - 1] in "aeiouäöüAEIOUÄÖÜ":
            opts.append((word[:cut] + "-", word[cut:]))
    return opts or [(word[: MAX - 1] + "-", word[MAX - 1 :])]


def solve_words(words, line=0, cur="", acc=None):
    if acc is None:
        acc = []
    if line == N:
        return acc if (not words and not cur) else None
    if not words:
        if cur and line == N - 1 and len(cur) <= MAX:
            out = acc + [cur]
            while len(out) < N:
                out.append("")
            return out[:N]
        if not cur and line <= N:
            out = acc[:]
            while len(out) < N:
                out.append("")
            return out[:N]
        return None

    w = words[0]
    rest = words[1:]

    trial = f"{cur} {w}".strip() if cur else w
    if len(trial) <= MAX:
        r = solve_words(rest, line, trial, acc)
        if r is not None:
            return r

    if cur and len(cur) <= MAX:
        r = solve_words(words, line + 1, w, acc + [cur])
        if r is not None:
            return r

    if not cur:
        if len(w) <= MAX:
            r = solve_words(rest, line, w, acc)
            if r is not None:
                return r
        for left, right in splits(w):
            if len(left) > MAX:
                continue
            nxt = ([right] + rest) if right else rest
            r = solve_words(nxt, line + 1, left, acc)
            if r is not None:
                return r

    return None


# Hand-tuned mirrors of English dex line breaks
WRAPS = {
    "BulbasaurPokedexEntry": [
        "Solange es jung",
        "ist, nutzt es",
        "Nährstoffe aus den",
        "Samen auf seinem",
        "Rücken zum",
        "Wachsen.",
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
        "fliegt es hoch. Die",
        "Feuertemperatur",
        "steigt mit seiner",
        "Kampferfah-",
        "rung.",
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
        "ist ein Symbol",
        "für Langlebigkeit",
        "und macht es bei",
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
        "es sich unter",
        "gleichfarbigen",
        "Blättern",
        "tarnt.",
    ],
    "MetapodPokedexEntry": [
        "Dies ist seine Vor-",
        "stufe. In diesem",
        "Stadium kann es nur",
        "erstarren und bleibt",
        "regungslos, um Angrif-",
        "fen auszuweichen.",
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

ns = {}
exec((pathlib.Path(__file__).parent / "dex_de_text.py").read_text(encoding="utf-8"), ns)
TEXT = ns["TEXT"]

# fix remaining bad lines interactively
fixes = {
    "IvysaurPokedexEntry": [
        "Die Knospe auf",
        "seinem Rücken",
        "wächst und nimmt",
        "Nährstoffe auf.",
        "Beim Aufblühen ve-",
        "rströmt sie einen angenehmen Duft.",
    ],
    "WartortlePokedexEntry": [
        "Sein langer,",
        "behaarter Schweif",
        "ist ein Symbol",
        "für Langlebigkeit",
        "und macht es bei",
        "älteren Menschen beliebt.",
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
    "PidgeotPokedexEntry": [
        "Dieses #mon fliegt",
        "mit Mach-2-",
        "Geschwindigkeit",
        "auf Beutejagd.",
        "Seine großen",
        "Krallen gelten als furchtbare Waffen.",
    ],
}
WRAPS.update(fixes)

# auto-fix Ivysaur, Wartortle, Weedle, Kakuna, Pidgeot with redistribution
WRAPS["IvysaurPokedexEntry"] = [
    "Die Knospe auf",
    "seinem Rücken",
    "wächst und nimmt",
    "Nährstoffe auf.",
    "Beim Aufblühen ve-",
    "rströmt sie einen angenehmen Duft.",
]
# still bad line 6 - use redistribution from Wartortle pattern
WRAPS["WartortlePokedexEntry"] = [
    "Sein langer,",
    "behaarter Schweif",
    "ist ein Symbol",
    "für Langlebigkeit",
    "und macht es bei",
    "älteren Menschen beliebt.",
]
WRAPS["WeedlePokedexEntry"] = [
    "Der Stachel auf",
    "seinem Kopf",
    "sondert ein",
    "starkes Gift ab.",
    "Es nutzt diesen",
    "giftigen Stachel zur Verteidigung.",
]
WRAPS["KakunaPokedexEntry"] = [
    "Es ist kaum",
    "bewegungsfähig und",
    "lehnt sich an",
    "starke Bäume,",
    "während es auf",
    "seine Entwicklung wartet.",
]
WRAPS["PidgeotPokedexEntry"] = [
    "Dieses #mon fliegt",
    "mit Mach-2-",
    "Geschwindigkeit",
    "auf Beutejagd.",
    "Seine großen",
    "Krallen gelten als furchtbare Waffen.",
]

# Apply solver for entries still failing manual check
for k in list(TEXT.keys())[:18]:
    manual = WRAPS.get(k)
    if manual:
        ok = all(len(l) <= MAX for l in manual)
        joined = "".join(x.replace("-", "") for x in manual)
        src = TEXT[k].replace(" ", "").replace("-", "")
        chk = joined.replace(" ", "")
        if ok and src == chk:
            continue
    r = solve_words(TEXT[k].split())
    if r:
        WRAPS[k] = r

print("VERIFY")
for k in list(TEXT.keys())[:18]:
    lines = WRAPS.get(k)
    print(k)
    if not lines:
        print("  MISSING")
        continue
    src = TEXT[k].replace(" ", "")
    got = "".join(l.replace("-", "") for l in lines).replace(" ", "")
    for i, l in enumerate(lines):
        print(f"  {i}: {len(l):2d} {l!r}" + (" BAD" if len(l) > MAX else ""))
    if src != got:
        print("  TEXT MISMATCH")
        print("  expected:", TEXT[k])
        print("  got:", " ".join(lines))
    print()