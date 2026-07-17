# -*- coding: utf-8 -*-
from pathlib import Path
import re

# --- Battle brick break ---
p = Path("data/text/battle.asm")
t = p.read_text(encoding="utf-8")
t2 = t
t2 = t2.replace(
'''BrokeLightScreenText:
	text "<USER>"
	line "zerstörte den"
	cont "Lichtschild des"
	cont "Ziels!"
	prompt''',
'''BrokeLightScreenText:
	; GSC-near CAPS
	text "<USER>"
	line "zerstörte den"
	cont "LICHTSCHILD des"
	cont "Ziels!"
	prompt''')
t2 = t2.replace(
'''BrokeReflectText:
	text "<USER>"
	line "zerstörte den"
	cont "Reflektor des"
	cont "Ziels!"
	prompt''',
'''BrokeReflectText:
	text "<USER>"
	line "zerstörte den"
	cont "REFLEKTOR des"
	cont "Ziels!"
	prompt''')
if t2 != t:
    p.write_text(t2, encoding="utf-8")
    print("battle brick OK")

# --- Maps place CAPS - careful replacements only in dialogue strings ---
# Process map by map for safety

def fix_map_text_lines(content):
    """Apply place/species CAPS fixes only on text/line/cont/para/next string lines."""
    out = []
    for line in content.splitlines(keepends=True):
        stripped = line.lstrip()
        if stripped.startswith(";") or not re.search(r'(text|line|cont|para|next)\s+"', line):
            out.append(line)
            continue
        # extract and replace inside quotes only
        def repl_quoted(m):
            s = m.group(1)
            # place names - title case to GSC CAPS
            reps = [
                ("Dukatia City", "DUKATIA CITY"),
                ("Dukatia-ARENA", "DUKATIA-ARENA"),
                ("Dukatia", "DUKATIA"),
                ("Viola City", "VIOLA CITY"),
                ("Rosalia City", "ROSALIA CITY"),
                ("Azalea City", "AZALEA CITY"),
                ("Ebenholz City", "EBENHOLZ CITY"),
                ("Teak City", "TEAK CITY"),
                ("Anemonia City", "ANEMONIA CITY"),
                ("Oliviana City", "OLIVIANA CITY"),
                ("Marmoria City", "MARMORIA CITY"),
                ("Neuborkia", "NEUBORKIA"),
                ("Pidgeotto", "TAUBOGA"),
                ("Icognito", "ICOGNITO"),
                ("#-Com", "#COM"),
                ("#MON-Center", "#MON-CENTER"),
                ("#mon-Center", "#MON-CENTER"),
                ("#MON-Centern", "#MON-CENTERN"),
                ("Erweiterte Tipps!", "Profi-Tipps!"),
                ("Erweiterte Tipps", "Profi-Tipps"),
            ]
            for a, b in reps:
                s = s.replace(a, b)
            # Arenaleiter only when not already ARENALEITER
            s = re.sub(r'(?<!ARENA)Arenaleiterin', 'ARENALEITERIN', s)
            s = re.sub(r'(?<!ARENA)Arenaleiter', 'ARENALEITER', s)
            return m.group(0)[0:m.start(1)-m.start()] + '"' + s + '"' if False else f'{m.group(0)[:m.start(1)-m.start()]}"' 
        # simpler: replace in whole line if it's a string line
        newline = line
        for a, b in [
            ('"Dukatia City', '"DUKATIA CITY'),
            ("Dukatia City", "DUKATIA CITY"),
            ("Dukatia-ARENA", "DUKATIA-ARENA"),
            ("Dukatia", "DUKATIA"),
            ("Viola City", "VIOLA CITY"),
            ("Rosalia City", "ROSALIA CITY"),
            ("Azalea City", "AZALEA CITY"),
            ("Ebenholz City", "EBENHOLZ CITY"),
            ("Teak City", "TEAK CITY"),
            ("Anemonia City", "ANEMONIA CITY"),
            ("Oliviana City", "OLIVIANA CITY"),
            ("Marmoria City", "MARMORIA CITY"),
            ("seit Neuborkia!", "seit NEUBORKIA!"),
            ("Neuborkia!", "NEUBORKIA!"),
            ("Pidgeotto", "TAUBOGA"),
            ("Icognito", "ICOGNITO"),
            ("#-Com", "#COM"),
            ("#MON-Center", "#MON-CENTER"),
            ("#mon-Center", "#MON-CENTER"),
            ("#MON-Centern", "#MON-CENTERN"),
            ("Erweiterte Tipps!", "Profi-Tipps!"),
            ("Erweiterte Tipps", "Profi-Tipps"),
            ("Als Arenaleiter", "Als ARENALEITER"),
            ("der Arenaleiter", "der ARENALEITER"),
            ("Arenaleiter wurde", "ARENALEITER wurde"),
            ("line \"Arenaleiter\"", "line \"ARENALEITER\""),
            ("cont \"Arenaleiterin\"", "cont \"ARENALEITERIN\""),
        ]:
            if a in newline:
                newline = newline.replace(a, b)
        out.append(newline)
    return "".join(out)

maps_dir = Path("maps")
changed_files = []
# Only Johto-focused + ruins + dark cave + listed
targets = list(maps_dir.glob("*.asm"))
for mp in targets:
    raw = mp.read_text(encoding="utf-8")
    # only process if might need fix
    keys = ["Dukatia", "Viola City", "Neuborkia", "Pidgeotto", "Icognito", "#-Com",
            "#MON-Center", "Erweiterte Tipps", "Arenaleiter", "Rosalia City",
            "Azalea City", "Ebenholz City", "Teak City"]
    if not any(k in raw for k in keys):
        continue
    new = fix_map_text_lines(raw)
    if new != raw:
        mp.write_text(new, encoding="utf-8")
        changed_files.append(mp.name)

print("maps changed:", len(changed_files))
for f in sorted(changed_files):
    print(" ", f)

# Verify remaining bad hits in dialogue
print("\n=== VERIFY remaining ===")
for pat in ["Dukatia", "Viola City", "Neuborkia", "Pidgeotto", "Icognito", "#-Com",
            "Erweiterte Tipps", "line \"Arenaleiter\"", "#MON-Center"]:
    hits = []
    for mp in maps_dir.glob("*.asm"):
        for i, line in enumerate(mp.read_text(encoding="utf-8").splitlines(), 1):
            if line.strip().startswith(";"):
                continue
            if not re.search(r'(text|line|cont|para|next)\s+"', line):
                continue
            if pat in line:
                hits.append(f"{mp.name}:{i}:{line.strip()[:80]}")
    if hits:
        print(pat, len(hits))
        for h in hits[:5]:
            print(" ", h)
