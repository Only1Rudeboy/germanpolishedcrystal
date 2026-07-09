#!/usr/bin/env python3
"""Report likely English dialogue remaining in maps/*.asm."""
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
MAPS = ROOT / "maps"

PATTERNS = [
    re.compile(r'\b(the|you|your|what|wait|hello|good morning|good evening|it\'s|i\'m|my |wild )\b', re.I),
    re.compile(r'\b(pokemon|pokémon)\b', re.I),
    re.compile(r'text "(The |You |Your |What |Hello|Good |It\'s |I\'m )'),
]

def is_text_line(line: str) -> bool:
    return bool(re.match(r'\s*(?:text|line|cont|para)\s+"', line))


def main() -> int:
    hits = 0
    files = 0
    for path in sorted(MAPS.glob("*.asm")):
        file_hits = 0
        for i, line in enumerate(path.read_text(encoding="utf-8").splitlines(), 1):
            if not is_text_line(line):
                continue
            if any(p.search(line) for p in PATTERNS):
                if file_hits == 0:
                    files += 1
                file_hits += 1
                hits += 1
                if file_hits <= 3:
                    print(f"{path.name}:{i}: {line.strip()}")
        if file_hits > 3:
            print(f"  ... +{file_hits - 3} more in {path.name}")
    print(f"\nFiles with likely English: {files}")
    print(f"Likely English text lines: {hits}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())