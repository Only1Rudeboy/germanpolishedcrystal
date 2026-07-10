import re, pathlib
p = pathlib.Path(__file__).resolve().parent.parent / "data" / "pokemon" / "dex_entries.asm"
t = p.read_text(encoding="utf-8")
entries = len(re.findall(r'^SECTION "', t, re.M))
lines = re.findall(r'(?:text|next|page) "([^"]*)"', t)
long = [(i+1, l) for i, l in enumerate(lines) if len(l.rstrip("@")) > 18]
english = [l for l in lines if re.search(r'\b(the|and|its|with|from|when|this)\b', l, re.I)]
print(f"entries={entries}")
print(f"text_lines={len(lines)}")
print(f"over_18_chars={len(long)}")
if long[:8]:
    print("long samples:", long[:8])
print(f"english_looking={len(english)}")
if english[:5]:
    print("en samples:", english[:5])