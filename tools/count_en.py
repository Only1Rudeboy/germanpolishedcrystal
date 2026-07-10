import re
en = open("data/pokemon/dex_entries_en.asm", encoding="utf-8").read()
for name in ["Bulbasaur", "Ivysaur", "Metapod", "Wartortle", "Weedle", "Kakuna", "Pidgeot"]:
    m = re.search(rf'SECTION "{name}PokedexEntry".*?(?=SECTION )', en, re.S)
    lines = re.findall(r'(?:text|next|page) "([^"]*)"', m.group(0))
    total = sum(len(l.rstrip("@")) for l in lines)
    print(name, "total", total, "lines", [len(l.rstrip("@")) for l in lines])