import re
from pathlib import Path

p = Path(__file__).resolve().parent.parent / "data" / "pokemon" / "dex_entries.asm"
content = p.read_text(encoding="utf-8")
issues = []
for m in re.finditer(r'(text|next|page) "([^"]*)"', content):
    s = m.group(2)
    core = s.replace("@", "")
    if len(core) > 18:
        issues.append(f"{len(core):2d} {core}")
print("Lines > 18:", len(issues))
for i in issues[:40]:
    print(i)

sections = re.split(r"SECTION ", content)[1:]
no_at = []
for sec in sections:
    name = sec.split('"')[1]
    texts = re.findall(r'(?:text|next|page) "([^"]*)"', sec)
    if texts and not texts[-1].endswith("@"):
        no_at.append(name)
print("Missing @:", len(no_at), no_at[:5])
print("Sections:", len(sections))