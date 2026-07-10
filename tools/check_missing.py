import re, pathlib, sys
sys.path.insert(0, str(pathlib.Path(__file__).parent))
from dex_de_text import TEXT
p = pathlib.Path(__file__).resolve().parent.parent / "data" / "pokemon" / "dex_entries.asm"
names = re.findall(r'SECTION "(\w+)"', p.read_text(encoding="utf-8"))
missing = [n for n in names if n not in TEXT]
print("TEXT count", len(TEXT))
print("sections", len(names))
print("missing", len(missing))
print(missing)