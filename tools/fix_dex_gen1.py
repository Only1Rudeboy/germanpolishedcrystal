#!/usr/bin/env python3
"""Fix Gen 1 dex entries with proper German translations."""
import re
from pathlib import Path

MAX = 18
BASE = Path(__file__).parent.parent

def wrap(text):
    words = text.split()
    lines, cur = [], ""
    for w in words:
        t = (cur + " " + w).strip() if cur else w
        if len(t) <= MAX:
            cur = t
        else:
            if cur:
                lines.append(cur)
            cur = w
    if cur:
        lines.append(cur)
    return lines

def fmt_entry(section, label, cat, lines, extra=None):
    o = [f'SECTION "{section}", ROMX', f'{label}::']
    if extra:
        o.extend(extra)
    o.append(f'\tdb "{cat}@"')
    o.append(f'\ttext "{lines[0]}"')
    i, nc = 1, 0
    while i < len(lines):
        if nc == 2 and i < len(lines):
            o.append(f'\tpage "{lines[i]}"')
            i += 1
            nc = 0
        else:
            s = ".@" if i == len(lines) - 1 else ""
            o.append(f'\tnext "{lines[i]}{s}"')
            nc += 1
            i += 1
    return "\n".join(o) + "\n\n"

# Official German-style Pokedex text (adapted from PC English)
TRANSLATIONS = {
    "Bulbasaur": ("Samen", "Solange es jung ist, nutzt es die in den Samen auf seinem Rücken gespeicherten Nährstoffe, um zu wachsen."),
    "Ivysaur": ("Samen", "Die Knospe auf seinem Rücken wächst, indem sie Nährstoffe aufnimmt. Die Knospe gibt einen angenehmen Duft ab, wenn sie aufblüht."),
    "Venusaur": ("Samen", "Wenn es sich wärmt und Sonnenlicht aufnimmt, verströmen seine Blütenblätter einen angenehmen Duft."),
    "Charmander": ("Eidechse", "Ist es gesund, brennt die Flamme an seiner Schwanzspitze kräftig, selbst wenn es etwas nass wird."),
    "Charmeleon": ("Flamme", "Wird es im Kampf wütend, stößt es heftige Flammen aus und verbrennt damit seine Umgebung."),
    "Charizard": ("Flamme", "Es fliegt hoch mit seinen Flügeln. Die Feuertemperatur steigt mit seiner Kampferfahrung."),
    "Squirtle": ("Minikröte", "Fühlt es sich bedroht, zieht es die Beine in seinen Panzer und spritzt Wasser aus dem Mund."),
    "Wartortle": ("Schildkröte", "Sein langer, behaarter Schweif ist ein Symbol für Langlebigkeit und macht es bei älteren Menschen beliebt."),
    "Blastoise": ("Panzer", "Es pflanzt die Füße fest auf den Boden, bevor es Wasser aus den Düsen auf seinem Rücken abschießt."),
    "Caterpie": ("Wurm", "Es kriecht in Blätterwerk, wo es sich unter gleichfarbigen Blättern tarnt."),
    "Metapod": ("Kokon", "Dies ist seine Vorstufe. In diesem Stadium kann es nur erstarren und auszuweichen."),
    "Butterfree": ("Falter", "Es flattert von Blume zu Blume und sammelt Nektar. Es kann sogar weit entfernte blühende Blumen erkennen."),
    "Weedle": ("Raupe", "Der Stachel auf seinem Kopf sondert ein starkes Gift ab. Es nutzt diesen zur Verteidigung."),
    "Kakuna": ("Kokon", "Es ist kaum bewegungsfähig und lehnt sich an starke Bäume, während es auf Entwicklung wartet."),
    "Beedrill": ("Giftbiene", "Es besiegt Beute mit scharfen, giftigen Stacheln und bringt sie in sein Nest als Nahrung."),
    "Pidgey": ("Minivogel", "Es schlägt schnell mit den Flügeln im Gras und wirbelt Staub auf, um Insektenbeute hervorzulocken."),
    "Pidgeotto": ("Vogel", "Es fliegt langsam im Kreis und hält dabei Ausschau nach Beute."),
    "Pidgeot": ("Vogel", "Dieses #mon fliegt mit Mach-2-Geschwindigkeit auf Beutejagd. Seine großen Krallen gelten als furchtbare Waffen."),
}

def parse_entries(content):
    entries = []
    current = None
    for line in content.split("\n"):
        m = re.match(r'SECTION "(\w+)PokedexEntry"', line)
        if m:
            if current:
                entries.append(current)
            current = {"name": m.group(1), "label": m.group(1) + "PokedexEntry",
                       "section": f'{m.group(1)}PokedexEntry', "extra": [], "lines": []}
            continue
        if current is None:
            continue
        if line.strip().startswith(("if DEF", "else", "endc")):
            current["extra"].append(line)
            continue
        m = re.match(r'\tdb "(.+?)@"', line)
        if m:
            current["category"] = m.group(1)
    if current:
        entries.append(current)
    return entries

def main():
    content = (BASE / "data/pokemon/dex_entries.asm").read_text(encoding="utf-8")
    entries = parse_entries(content)
    
    # Split into sections by entry boundaries
    parts = re.split(r'(SECTION "\w+PokedexEntry", ROMX\n)', content)
    
    out_parts = []
    i = 0
    while i < len(parts):
        part = parts[i]
        m = re.match(r'SECTION "(\w+)PokedexEntry"', part) if i > 0 else None
        if i > 0 and parts[i-1].startswith('SECTION'):
            name_m = re.search(r'SECTION "(\w+)PokedexEntry"', parts[i-1])
            if name_m:
                name = name_m.group(1)
                if name in TRANSLATIONS:
                    cat, txt = TRANSLATIONS[name]
                    # Get extra lines (if DEF blocks) from part
                    extra = []
                    for eline in part.split('\n'):
                        if eline.strip().startswith(('if DEF', 'else', 'endc')):
                            extra.append(eline)
                        elif eline.strip().endswith('::'):
                            break
                    lines = wrap(txt)
                    out_parts[-1] = fmt_entry(f"{name}PokedexEntry", f"{name}PokedexEntry", cat, lines, extra if extra else None)
                    i += 1
                    continue
        out_parts.append(part)
        i += 1
    
    # Simpler approach: rebuild from parsed structure
    result = []
    entry_blocks = re.split(r'\n(?=SECTION "\w+PokedexEntry")', content)
    for block in entry_blocks:
        m = re.search(r'SECTION "(\w+)PokedexEntry"', block)
        if not m:
            result.append(block)
            continue
        name = m.group(1)
        if name in TRANSLATIONS:
            cat, txt = TRANSLATIONS[name]
            extra = [l for l in block.split('\n') if l.strip().startswith(('if DEF', 'else', 'endc'))]
            lines = wrap(txt)
            result.append(fmt_entry(f"{name}PokedexEntry", f"{name}PokedexEntry", cat, lines, extra if extra else None).rstrip())
        else:
            result.append(block)
    
    (BASE / "data/pokemon/dex_entries.asm").write_text("\n\n".join(result) + "\n", encoding="utf-8")
    print(f"Fixed {len(TRANSLATIONS)} Gen 1 entries")

if __name__ == "__main__":
    main()