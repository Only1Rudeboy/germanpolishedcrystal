# -*- coding: utf-8 -*-
"""Compare early-game local strings to GSC-DE crystal dump phrases."""
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[2]
DUMP = ROOT / "tools" / "_gsc_de_crystal_msg.txt"
OUT = Path(__file__).resolve().parent / "_early_gsc_check.md"

# Key GSC dump phrases for early game (must appear or close equivalent)
CANON_SNIPPETS = [
    # time set / oak intro related
    ("Ich habe verschlafen!", "oversleep"),
    ("Uah! Ich habe verschlafen!", "oversleep yikes"),
    # mom / house (common Crystal DE)
    ("PROF. LIND", "elm name"),
    ("NEUBORKIA", "new bark"),
    # lab
    ("PKMN-ARENA", "gym phrasing optional early"),
]

# Load dump as one big searchable string (normalized)
dump_raw = DUMP.read_text(encoding="utf-8", errors="replace") if DUMP.exists() else ""
# expand LINE/PARA markers for fuzzy search
dump_flat = dump_raw.replace("<LINE>", " ").replace("<PARA>", " ").replace("<CONT>", " ")
dump_flat = re.sub(r"\{[^}]+\}", " ", dump_flat)
dump_flat = re.sub(r"\s+", " ", dump_flat)

files = [
    "data/text/common.asm",
    "data/text/std_text.asm",
    "maps/PlayersHouse1F.asm",
    "maps/PlayersHouse2F.asm",
    "maps/NewBarkTown.asm",
    "maps/ElmsLab.asm",
    "maps/ElmsHouse.asm",
    "maps/Route29.asm",
    "maps/Route2946Gate.asm",
    "maps/CherrygroveCity.asm",
    "maps/CherrygrovePokeCenter1F.asm",
    "maps/CherrygroveMart.asm",
    "maps/GuideGentsHouse.asm",
    "maps/CherrygroveGymSpeechHouse.asm",
    "maps/CherrygroveEvolutionSpeechHouse.asm",
    "maps/MrPokemonsHouse.asm",
    "maps/Route30.asm",
    "maps/Route30BerrySpeechHouse.asm",
    "maps/Route31.asm",
    "maps/Route31VioletGate.asm",
]

# Extract all quoted text strings from early files
def extract_strings(path: Path):
    t = path.read_text(encoding="utf-8", errors="replace")
    out = []
    for i, line in enumerate(t.splitlines(), 1):
        if line.lstrip().startswith(";"):
            continue
        for m in re.finditer(r'(?:text|line|cont|para|next|page)\s+"([^"]*)"', line):
            s = m.group(1)
            if s and not s.startswith("?"):
                out.append((i, s))
    return out


# Red flags: EN leftovers / non-GSC tone
EN_RE = re.compile(
    r"\b(I'm|I'll|I've|don't|can't|Hello|Welcome|Thank you|Please|Sorry|"
    r"overslept|napped|Yikes|genickert|genickt)\b",
    re.I,
)
# awkward modern DE that isn't classic GSC
MODERN_RE = re.compile(
    r"\b(Huch!|super cool|mega |echt krass|Digga|Bro)\b",
    re.I,
)

# Known GSC terms that should appear in early maps
EXPECTED_GSC = {
    "maps/NewBarkTown.asm": ["NEUBORKIA", "LIND", "ROSALIA"],
    "maps/ElmsLab.asm": ["LIND", "#mon"],
    "maps/PlayersHouse1F.asm": ["Mama", "LIND"],
}

lines_out = ["# Early game GSC-DE text check", ""]
en_hits = []
modern_hits = []
all_strings = []

for rel in files:
    p = ROOT / rel
    if not p.exists():
        lines_out.append(f"- MISSING `{rel}`")
        continue
    strs = extract_strings(p)
    all_strings.append((rel, strs))
    for i, s in strs:
        if EN_RE.search(s):
            en_hits.append((rel, i, s))
        if MODERN_RE.search(s):
            modern_hits.append((rel, i, s))

lines_out.append("## EN / non-canon word hits")
lines_out.append(f"- count: {len(en_hits)}")
for x in en_hits:
    lines_out.append(f"- `{x[0]}:{x[1]}` {x[2]!r}")
    print("EN", x)
if not en_hits:
    lines_out.append("- (none)")
lines_out.append("")

lines_out.append("## Modern tone hits")
lines_out.append(f"- count: {len(modern_hits)}")
for x in modern_hits:
    lines_out.append(f"- `{x[0]}:{x[1]}` {x[2]!r}")
    print("MODERN", x)
if not modern_hits:
    lines_out.append("- (none)")
lines_out.append("")

# Spot-check key local multi-line blocks against dump
# Build local full text blobs for critical labels by reading files
def file_blob(rel):
    return (ROOT / rel).read_text(encoding="utf-8", errors="replace")


# Specific GSC phrases to look for in dump and local
checks = [
    ("common overslept", "data/text/common.asm", "Ich habe", "verschlafen"),
    ("common uah", "data/text/common.asm", "Uah!", "verschlafen"),
    ("lab choose mon", "maps/ElmsLab.asm", "Bällen", "trainierst"),
    ("newbark sign", "maps/NewBarkTown.asm", "NEUBORKIA", None),
    ("mom elm", "maps/PlayersHouse1F.asm", "LIND", None),
]

lines_out.append("## Key phrase presence")
for name, rel, a, b in checks:
    blob = file_blob(rel) if (ROOT / rel).exists() else ""
    ok_a = a in blob if a else True
    ok_b = b in blob if b else True
    in_dump_a = a in dump_flat if a else True
    status = "OK" if ok_a and ok_b else "MISSING_LOCAL"
    lines_out.append(f"- {name}: local={status} dump_has_a={in_dump_a}")
    print(name, status, "dump", in_dump_a)

# Extract mom intro texts sample
lines_out.append("")
lines_out.append("## Sample strings (PlayersHouse1F first 25)")
ph = ROOT / "maps/PlayersHouse1F.asm"
if ph.exists():
    for i, s in extract_strings(ph)[:25]:
        lines_out.append(f"- L{i}: {s}")

lines_out.append("")
lines_out.append("## Sample strings (NewBarkTown first 30)")
nb = ROOT / "maps/NewBarkTown.asm"
if nb.exists():
    for i, s in extract_strings(nb)[:30]:
        lines_out.append(f"- L{i}: {s}")

lines_out.append("")
lines_out.append("## Sample strings (ElmsLab key texts)")
el = ROOT / "maps/ElmsLab.asm"
if el.exists():
    t = el.read_text(encoding="utf-8", errors="replace")
    for label in [
        "ElmText_Intro",
        "ElmText_ChooseAPokemon",
        "TakeCyndaquilText",
        "LyraReceivedStarterText",
        "ElmDirectionsText1",
        "LabWhereGoingText",
    ]:
        m = re.search(rf"^{label}:\n((?:(?!^[A-Za-z_]\w*:).*\n){{0,25}})", t, re.M)
        if m:
            blob = re.sub(r'\s+(text|line|cont|para)\s+"([^"]*)"', r" \2", m.group(0))
            blob = re.sub(r"\s+", " ", blob)
            lines_out.append(f"- **{label}**: {blob[:200]}")

OUT.write_text("\n".join(lines_out) + "\n", encoding="utf-8")
print("wrote", OUT)
