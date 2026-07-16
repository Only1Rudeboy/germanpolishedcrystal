# QC early-game + early-Johto maps for dump batch safety issues
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[1]
MAPS = ROOT / "maps"

# Early story path through Azalea/Ilex/Union + Violet
EARLY = re.compile(
    r"^(NewBark|PlayersHouse|ElmsLab|ElmsHouse|Route29|Route30|Route31|Route32|Route33|"
    r"Cherrygrove|Violet|Sprout|MrPokemon|Azalea|Slowpoke|Charcoal|Kurt|Ilex|"
    r"UnionCave|DarkCaveViolet|RuinsOfAlph|DayCare|Route34)\w*\.asm$",
    re.I,
)

TEXT_RE = re.compile(r'^\t(text|line|cont|para|next)\s+"(.*)"\s*$')
# rough printable width: #MON/#mon/#BALL/#COM = 7, <PLAYER>/<PLAY_G> = 7
CTRL = re.compile(r"#MON|#mon|#BALL|#COM|#DEX|#PKMN|<PLAYER>|<PLAY_G>|<PLAY_G>|<RIVAL>|<TARGET>|<USER>")

def disp_len(s: str) -> int:
    s2 = s
    for m in re.finditer(r"#(?:MON|mon|BALL|COM|DEX|PKMN)|<(?:PLAYER|PLAY_G|RIVAL|TARGET|USER)>", s):
        pass
    # replace known tokens
    for tok, n in (
        ("#MON", 7), ("#mon", 7), ("#BALL", 7), ("#COM", 7), ("#DEX", 7), ("#PKMN", 7),
        ("<PLAYER>", 7), ("<PLAY_G>", 7), ("<RIVAL>", 7),
    ):
        s2 = s2.replace(tok, "X" * n)
    # strip other <...> control tags as 0 width for rough check
    s2 = re.sub(r"<[^>]+>", "", s2)
    return len(s2)

issues = []
over18 = []
files = sorted(p for p in MAPS.glob("*.asm") if EARLY.match(p.name))
print(f"Scanning {len(files)} early maps…")

for f in files:
    lines = f.read_text(encoding="utf-8").splitlines()
    for i, line in enumerate(lines, 1):
        if "<PLAY_G>" in line:
            issues.append((str(f.relative_to(ROOT)), i, "PLAY_G", line.strip()[:100]))
        if "fixed_facing" in line and not line.strip().startswith(";"):
            issues.append((str(f.relative_to(ROOT)), i, "fixed_facing", line.strip()[:100]))
        m = TEXT_RE.match(line)
        if not m:
            continue
        s = m.group(2)
        if ";" in s:
            issues.append((str(f.relative_to(ROOT)), i, "semicolon", line.strip()[:100]))
        # unmapped-ish chars often seen
        for ch in s:
            if ch in "{}|\\`" and not (ch in "{}" and "{d:" in s):
                # allow {d:NUM} style
                if "{d:" in s and ch in "{}":
                    continue
                issues.append((str(f.relative_to(ROOT)), i, f"char {ch!r}", line.strip()[:100]))
                break
        w = disp_len(s)
        if w > 18:
            over18.append((str(f.relative_to(ROOT)), i, w, s))

# badge names
badge = (ROOT / "data/events/badge_names.asm").read_text(encoding="utf-8")
print("\n=== BADGE NAMES ===")
for line in badge.splitlines():
    if line.strip().startswith("li "):
        print(line.strip())

print(f"\n=== STRUCTURAL ISSUES: {len(issues)} ===")
for row in issues[:80]:
    print(f"{row[0]}:{row[1]} [{row[2]}] {row[3]}")

print(f"\n=== OVER 18 (first 40 of {len(over18)}): ===")
for row in over18[:40]:
    print(f"{row[0]}:{row[1]} w={row[2]} {row[3]!r}")

# key dump spot-checks: known phrases that must exist
checks = {
    "maps/PlayersHouse1F.asm": ["Schatz", "FLÜGEL"],  # mom may use Schatz
    "maps/ElmsLab.asm": ["PROF. LIND", "#MON"],
    "maps/Route29.asm": ["ROUTE 29"],
    "maps/CherrygroveCity.asm": ["ROSALIA"],
    "maps/VioletCity.asm": ["VIOLA", "PKMN-ARENA"],
    "maps/VioletGym.asm": ["FLÜGELORDEN", "FALK"],
    "maps/AzaleaGym.asm": ["INSEKTORDEN", "KAI"],
    "maps/AzaleaTown.asm": ["AZALEA", "FLEGMON"],
    "maps/Route32.asm": ["ROUTE 32", "VIOLA CITY"],
}
print("\n=== KEY PHRASE SPOT-CHECK ===")
for path, phrases in checks.items():
    p = ROOT / path
    if not p.exists():
        print(f"MISSING FILE {path}")
        continue
    t = p.read_text(encoding="utf-8")
    for ph in phrases:
        ok = ph in t
        print(f"{'OK' if ok else 'MISS'} {path}: {ph!r}")

# sdefer / done-before-ram quick grep style
print("\n=== DONE-BEFORE-text_ram rough scan (early maps) ===")
ram_re = re.compile(r"\t(text_ram|text_decimal|text_start)\b")
done_re = re.compile(r"\tdone\b")
# not perfect but flag labels where done appears before any text_ram in same text block
for f in files:
    lines = f.read_text(encoding="utf-8").splitlines()
    in_text = False
    saw_ram_after_open = False
    last_text_start = 0
    for i, line in enumerate(lines, 1):
        if re.match(r"^[A-Za-z0-9_\.]+:", line) and not line.startswith("\t"):
            in_text = False
        if re.match(r"^\ttext\s+", line):
            in_text = True
            saw_ram_after_open = False
            last_text_start = i
        if in_text and ram_re.search(line):
            saw_ram_after_open = True
        if in_text and done_re.search(line) and not saw_ram_after_open:
            # look ahead 3 lines for text_ram? already ended
            pass
        # flag: done then later text_ram without new text start - classic bug
    # simpler: lines with done followed within 5 lines by text_ram in same label
    for i, line in enumerate(lines):
        if "\tdone" in line:
            for j in range(i + 1, min(i + 8, len(lines))):
                if re.match(r"^[A-Za-z0-9_\.]+:", lines[j]) and not lines[j].startswith("\t"):
                    break
                if "text_ram" in lines[j] or "text_decimal" in lines[j]:
                    print(f"SUSPECT done->ram {f.name}:{i+1} then {j+1}")
                    break

print("\nDONE")
