#!/usr/bin/env python3
"""GSC-DE style: player-facing #mon → #MON (exact token) in quoted text strings.

Only rewrites inside double-quoted strings on directive lines:
  text / line / cont / para / next / db

Scopes:
  maps/**/*.asm
  data/text/**/*.asm
  engine/phone/**/*.asm

Does not touch #MON already, comments-only lines, or mid-word matches
(e.g. #monica, #monopolis). Compounds like #mon-Journal become #MON-Journal.
"""
from __future__ import annotations

import re
import sys
from collections import defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]

DIRS = [
    ROOT / "maps",
    ROOT / "data" / "text",
    ROOT / "engine" / "phone",
]

# Active text/data directives (optional label before them).
DIR_RE = re.compile(
    r"(?i)^\s*(?:[\w.]+\s*:\s*)*(?:text|line|cont|para|next|db)\b"
)

# Exact token #mon — not #MON, not #monster / #monica / other letter continuations.
# Hyphen compounds (#mon-Journal) are allowed (hyphen is not a letter).
TOKEN_RE = re.compile(r"#mon(?![A-Za-zÄÖÜäöü])")

# Double-quoted string (simple; asm dialogue does not nest quotes).
QUOTE_RE = re.compile(r'"([^"]*)"')


def _split_code_comment(line: str) -> tuple[str, str, str]:
    """Split on first ; that is outside double quotes."""
    in_str = False
    for i, ch in enumerate(line):
        if ch == '"':
            in_str = not in_str
        elif ch == ";" and not in_str:
            return line[:i], ";", line[i + 1 :]
    return line, "", ""


def fix_line(line: str) -> tuple[str, int]:
    """Return (new_line, n_replacements). Leave comments-only lines alone."""
    stripped = line.lstrip()
    if not stripped or stripped.startswith(";"):
        return line, 0

    if ";" in line:
        code, sep, comment = _split_code_comment(line)
    else:
        code, sep, comment = line, "", ""

    if not DIR_RE.search(code):
        return line, 0

    n = 0

    def repl_quote(m: re.Match[str]) -> str:
        nonlocal n
        inner = m.group(1)
        new_inner, c = TOKEN_RE.subn("#MON", inner)
        n += c
        return f'"{new_inner}"'

    new_code = QUOTE_RE.sub(repl_quote, code)
    if n == 0:
        return line, 0
    return new_code + sep + comment, n


def process_file(path: Path) -> int:
    text = path.read_text(encoding="utf-8", errors="replace")
    newline = "\r\n" if "\r\n" in text else "\n"
    ends_with_nl = text.endswith("\n") or text.endswith("\r\n")
    raw_lines = text.splitlines()
    total = 0
    out_lines: list[str] = []
    for line in raw_lines:
        new_line, n = fix_line(line)
        total += n
        out_lines.append(new_line)
    if total:
        body = newline.join(out_lines)
        if ends_with_nl:
            body += newline
        path.write_text(body, encoding="utf-8", newline="")
    return total


def main() -> int:
    per_dir: dict[str, int] = defaultdict(int)
    per_dir_files: dict[str, int] = defaultdict(int)
    grand = 0
    files_changed = 0

    for base in DIRS:
        if not base.is_dir():
            print(f"skip missing: {base.relative_to(ROOT).as_posix()}", file=sys.stderr)
            continue
        key = base.relative_to(ROOT).as_posix()
        for path in sorted(base.rglob("*.asm")):
            n = process_file(path)
            if n:
                per_dir[key] += n
                per_dir_files[key] += 1
                grand += n
                files_changed += 1
                rel = path.relative_to(ROOT).as_posix()
                print(f"  {rel}: {n}")

    print()
    print("=== replacements per directory ===")
    for key in [d.relative_to(ROOT).as_posix() for d in DIRS]:
        print(
            f"  {key}: {per_dir.get(key, 0)} replacements "
            f"in {per_dir_files.get(key, 0)} files"
        )
    print(f"TOTAL: {grand} replacements in {files_changed} files")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
