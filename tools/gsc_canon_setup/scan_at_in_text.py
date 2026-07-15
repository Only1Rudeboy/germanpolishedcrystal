# -*- coding: utf-8 -*-
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[2]
hits = []
for base in [ROOT / "maps", ROOT / "data", ROOT / "engine", ROOT / "home"]:
    if not base.exists():
        continue
    for p in base.rglob("*.asm"):
        if any(x in p.parts for x in ("backup", "_upstream", "text_backup")):
            continue
        for i, l in enumerate(p.read_text(encoding="utf-8", errors="replace").splitlines(), 1):
            m = re.search(r'(text|line|cont|para|next|page)\s+"([^"]*)"', l)
            if not m:
                continue
            s = m.group(2)
            if "@" in s:
                hits.append((str(p.relative_to(ROOT)), i, l.strip()[:120], s))

print("hits", len(hits))
for rel, i, line, s in hits:
    print(f"{rel}:{i}: {line}")

Path(__file__).with_name("_at_in_text_report.md").write_text(
    "# @ inside text strings (terminates at runtime!)\n\n"
    + f"Total: {len(hits)}\n\n"
    + "\n".join(f"- `{r}:{i}` `{s}`" for r, i, _, s in hits)
    + "\n",
    encoding="utf-8",
)
