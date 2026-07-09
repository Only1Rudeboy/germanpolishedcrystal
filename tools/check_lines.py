import re
import sys

path = sys.argv[1]
limit = int(sys.argv[2]) if len(sys.argv) > 2 else 999
text = open(path, encoding="utf-8").read()
blocks = re.split(r"\n(?=SECTION )", text)[:limit]
for b in blocks:
    m = re.match(r'SECTION "(\w+)"', b)
    if not m:
        continue
    name = m.group(1)
    lines = re.findall(r'(?:text|next|page) "([^"]*)"', b)
    mx = max((len(l.rstrip("@")) for l in lines), default=0)
    bad = [(i, l, len(l.rstrip("@"))) for i, l in enumerate(lines) if len(l.rstrip("@")) > 18]
    if bad:
        print(f"{name} max={mx}")
        for i, l, n in bad:
            print(f"  {i}: {n} {l}")