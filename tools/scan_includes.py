#!/usr/bin/env python3
"""Scan ASM files for INCLUDE/INCBIN dependencies."""
from __future__ import annotations

import re
import sys
from pathlib import Path

INCLUDE_RE = re.compile(
    r'(?:^|[:;\s])(INCLUDE|INCBIN|include|incbin)\s+"([^"]+)"',
    re.MULTILINE,
)


def scan_file(path: Path, *, strict: bool, seen: set[Path]) -> list[str]:
    try:
        text = path.read_text(encoding="utf-8", errors="replace")
    except OSError as exc:
        if strict:
            raise SystemExit(f'Could not open file "{path}": {exc}')
        return []

    out: list[str] = []
    for m in INCLUDE_RE.finditer(text):
        kind, include_path = m.group(1), m.group(2)
        out.append(include_path)
        if kind.lower() == "include":
            inc = (path.parent / include_path).resolve()
            if inc not in seen and inc.exists():
                seen.add(inc)
                out.extend(scan_file(inc, strict=strict, seen=seen))
    return out


def main(argv: list[str]) -> int:
    strict = "-s" in argv or "--strict" in argv
    files = [a for a in argv[1:] if not a.startswith("-")]
    if not files:
        return 1
    seen: set[Path] = set()
    root = Path(files[0])
    seen.add(root.resolve())
    deps = scan_file(root, strict=strict, seen=seen)
    if deps:
        print(" ".join(deps), end=" ")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv))