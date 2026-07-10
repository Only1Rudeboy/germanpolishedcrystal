#!/usr/bin/env python3
import re
from pathlib import Path

text = Path("data/text/common.asm").read_text(encoding="utf-8")
sections = len(re.findall(r"^SECTION ", text, re.M))
labels = len(re.findall(r"^[A-Za-z_][A-Za-z0-9_]*::", text, re.M))
english = re.findall(
    r'(?:text|line|cont|para|next) "([^"]*\b(?:the |your |want |hello|trade |battle|pokemon|saving|welcome)\b[^"]*)"',
    text,
    re.I,
)
print(f"Sections: {sections}")
print(f"Labels (::): {labels}")
print(f"Possible English remnants: {len(english)}")
for s in english:
    print(f"  - {s}")