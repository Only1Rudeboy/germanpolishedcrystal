import re
from pathlib import Path

p = Path(__file__).parent.parent / "data/pokemon/dex_entries.asm"
lines = p.read_text(encoding="utf-8").splitlines()
out = []
i = 0
fixed = 0
while i < len(lines):
    line = lines[i]
    if re.match(r'\t(?:next|page) ""', line) and out and i + 1 < len(lines):
        prev = out[-1]
        nxt = lines[i + 1]
        pm = re.match(r'\t(text|next|page) "(.+)"', prev)
        nm = re.match(r'\t(next|page) "(.+)"', nxt)
        if pm and nm:
            merged = pm.group(2) + " " + nm.group(2)
            if len(merged) <= 18:
                out[-1] = f'\t{pm.group(1)} "{merged}"'
                i += 2
                fixed += 1
                continue
    out.append(line)
    i += 1
p.write_text("\n".join(out) + "\n", encoding="utf-8")
remain = sum(1 for l in out if 'next ""' in l)
print(f"Fixed {fixed} empty lines, {remain} remain")