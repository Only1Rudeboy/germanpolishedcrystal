#!/usr/bin/env python3
"""Find dialog blocks where plain 'text' follows line/cont (FATAL at build)."""
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
DIRS = [ROOT / "maps", ROOT / "data" / "text"]

CMD = re.compile(
    r"^\s*(text_ram|text_decimal|text_far|text_farend|text_asm|text_promptbutton|text|line|para|cont|prompt|done)\b"
)
RESET = re.compile(
    r"^\s*(opentext|closetext|endtext|waitendtext|writetext|writetextfar|"
    r"writethistext|jumpthisopenedtext|jumptextfaceplayer|script)\b"
)
LABEL = re.compile(r"^[A-Za-z_][A-Za-z0-9_.]*:")

errors = []
for base in DIRS:
    if not base.exists():
        continue
    for path in sorted(base.rglob("*.asm")):
        lines = path.read_text(encoding="utf-8").splitlines()
        in_block = False
        last_plain_text_line = False
        for i, raw in enumerate(lines, 1):
            if LABEL.match(raw.strip()):
                in_block = False
                last_plain_text_line = False
                continue
            if RESET.match(raw):
                in_block = False
                last_plain_text_line = False
                continue
            m = CMD.match(raw)
            if not m:
                continue
            cmd = m.group(1)
            if cmd == "done":
                in_block = False
                last_plain_text_line = False
                continue
            if cmd in ("text_ram", "text_decimal", "text_far", "text_farend", "text_asm", "text_promptbutton"):
                last_plain_text_line = False
                continue
            if cmd == "text":
                if in_block and last_plain_text_line:
                    errors.append((path.relative_to(ROOT), i, raw.strip()))
                in_block = True
                last_plain_text_line = True
            elif cmd in ("line", "cont"):
                if in_block:
                    last_plain_text_line = True
            elif cmd == "para":
                last_plain_text_line = False

for rel, line_no, content in errors:
    print(f"{rel}:{line_no}: {content}")
print(f"\nTotal: {len(errors)}")