import re, pathlib, sys
sys.path.insert(0, str(pathlib.Path(__file__).parent))
from dex_de_text import TEXT
from gen_dex_de import wrap_text, normalize

p = pathlib.Path(__file__).resolve().parent.parent / "data" / "pokemon" / "dex_entries.asm"
asm = p.read_text(encoding="utf-8")
blocks = re.split(r'\n(?=SECTION )', asm)
bad = []
for block in blocks:
    m = re.match(r'SECTION "(\w+)"', block)
    if not m:
        continue
    name = m.group(1)
    asm_words = normalize(" ".join(re.findall(r'(?:text|next|page) "([^"]*)"', block))).split()
    src = TEXT.get(name, "")
    src_words = normalize(src).split()
    if asm_words != src_words:
        bad.append((name, len(src_words), len(asm_words)))

print(f"integrity_failures={len(bad)}")
for name, sw, aw in bad[:15]:
    print(name, sw, aw)