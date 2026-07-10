import re, pathlib
ROOT = pathlib.Path(__file__).parent.parent
PAT = re.compile(r'(?:text|line|cont|para)\s+"([^"]*)"')
n = 0
for sub in ("maps", "data", "text"):
    for f in (ROOT / sub).rglob("*.asm"):
        for l in f.read_text(encoding="utf-8").splitlines():
            m = PAT.search(l)
            if m and len(m.group(1).rstrip("@")) > 17:
                n += 1
print(n)