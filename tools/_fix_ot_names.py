from pathlib import Path
import re

p = Path("data/events/wonder_trade/ot_names.asm")
t = p.read_text(encoding="utf-8")

# Restore control-code name (7 bytes: M r . PK MN @ @)
t = re.sub(
    r'rawchar "[^"]*" ; \$27',
    'rawchar "MR.<PK><MN>@@" ; $27',
    t,
)
# LI'L D + one @ = 7 chars
t = re.sub(
    r"rawchar \"[^\"]*\" ; \$8d",
    "rawchar \"LI'L D@\" ; $8d",
    t,
)

# Verify all rawchar fields are 7 *display units* for simple strings;
# for control codes, leave as restored.
lines = t.splitlines()
for i, l in enumerate(lines, 1):
    m = re.search(r'rawchar "([^"]+)"', l)
    if not m:
        continue
    s = m.group(1)
    # approximate byte length: replace <PK> <MN> <PKMN> etc with 1
    approx = re.sub(r"<[^>]+>", "X", s)
    if len(approx) != 7:
        print(f"LEN {len(approx)} line {i}: {l.strip()}")

p.write_text(t, encoding="utf-8")
print("wrote", p)

# Buena password fix: <PKMN> -> <PK><MN>
bp = Path("data/radio/buenas_passwords.asm")
bt = bp.read_text(encoding="utf-8")
bt2 = bt.replace("<PKMN>", "<PK><MN>")
if bt2 != bt:
    bp.write_text(bt2, encoding="utf-8")
    print("fixed buenas_passwords PKMN tag")
else:
    print("buenas already ok or different tag")
    for i, l in enumerate(bt.splitlines(), 1):
        if "RadioStations" in l or "PK" in l:
            print(i, l)
