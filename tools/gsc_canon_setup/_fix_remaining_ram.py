# -*- coding: utf-8 -*-
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[2]
p = ROOT / "maps" / "GoldenrodUnderground.asm"
t = p.read_text(encoding="utf-8")

replacements = [
    (
        r'HaircutBrosText_SlightlyHappier:\n\ttext "sieht fröhlicher"\n\tline "aus\."\n\tdone',
        'HaircutBrosText_SlightlyHappier:\n\ttext_ram wStringBuffer3\n\ttext " sieht"\n\tline "fröhlicher aus."\n\tdone',
    ),
    (
        r'HaircutBrosText_Happier:\n\ttext "sieht glücklich"\n\tline "aus\."\n\tdone',
        'HaircutBrosText_Happier:\n\ttext_ram wStringBuffer3\n\ttext " sieht"\n\tline "glücklich aus."\n\tdone',
    ),
    (
        r'HaircutBrosText_MuchHappier:\n\tline "ist entzückt!"\n\tdone',
        'HaircutBrosText_MuchHappier:\n\ttext_ram wStringBuffer3\n\ttext " ist"\n\tline "entzückt!"\n\tdone',
    ),
]
for pat, rep in replacements:
    t2, n = re.subn(pat, rep, t)
    print(pat[:40], "->", n)
    t = t2
p.write_text(t, encoding="utf-8", newline="\n")
print("written")

# mid-string @ in maps (not terminator-only)
hits = []
for mp in (ROOT / "maps").glob("*.asm"):
    for i, line in enumerate(mp.read_text(encoding="utf-8", errors="replace").splitlines(), 1):
        m = re.search(r'(text|line|cont|para|next|page)\s+"([^"]*)"', line)
        if not m:
            continue
        s = m.group(2)
        if "@" in s and not (s.endswith("@") and s.count("@") == 1 and not s.startswith("@")):
            # @ only as terminator at end is OK for some systems; mid @ bad
            if "@" in s[:-1] or s == "@" or s.startswith("@"):
                hits.append((mp.name, i, s))
        elif s.startswith("@"):
            hits.append((mp.name, i, s))
print("mid @ hits", len(hits))
for h in hits:
    print(h)
