#!/usr/bin/env python3
"""Scan all dialog lines for display width > MAX (default 17)."""
from __future__ import annotations

import argparse
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
DEFAULT_DIRS = ["maps", "data", "text", "engine", "home"]
SKIP = {"data/credits_strings.asm"}
LINE_PAT = re.compile(r'(?:text|line|cont|para|next|page)\s+"([^"]*)"')
PH = re.compile(r"\{d:[^}]+\}")

# On-screen width of control tokens (Crystal / DE convention)
TOKEN_WIDTH = {
    "<PLAYER>": 7,
    "<RIVAL>": 7,
    "<ENEMY>": 7,
    "<USER>": 7,
    "<TARGET>": 7,
    "<STR_VAR1>": 8,
    "<STR_VAR2>": 8,
    "<STR_VAR3>": 8,
    "<ITEM>": 8,
    "<MOVE>": 8,
    "<POKE>": 4,
    "<PK><MN>": 2,
    "<PO><KE>": 2,
    "#mon": 4,
    "#MON": 4,
    "#dex": 4,
    "#DEX": 4,
    "#COM": 4,
    "#gear": 5,
    "#ball": 5,
    "#BÄLLE": 6,
}


def display_width(s: str) -> int:
    s = PH.sub("##", s).rstrip("@")
    w = 0
    i = 0
    while i < len(s):
        matched = False
        for tok, tw in sorted(TOKEN_WIDTH.items(), key=lambda x: -len(x[0])):
            if s[i : i + len(tok)] == tok:
                w += tw
                i += len(tok)
                matched = True
                break
        if not matched:
            w += 1
            i += 1
    return w


def raw_visible(s: str) -> int:
    """Length with tags and {d:...} removed entirely."""
    s = PH.sub("", s)
    for tok in sorted(TOKEN_WIDTH, key=len, reverse=True):
        s = s.replace(tok, "")
    return len(s.rstrip("@"))


def scan(max_width: int, dirs: list[str]) -> list[tuple[str, int, int, int, str]]:
    bad: list[tuple[str, int, int, int, str]] = []
    for sub in dirs:
        base = ROOT / sub
        if not base.exists():
            continue
        for path in sorted(base.rglob("*.asm")):
            rel = str(path.relative_to(ROOT)).replace("\\", "/")
            if rel in SKIP:
                continue
            text = path.read_text(encoding="utf-8", errors="replace")
            for lineno, line in enumerate(text.splitlines(), 1):
                m = LINE_PAT.search(line)
                if not m:
                    continue
                s = m.group(1)
                dw = display_width(s)
                rv = raw_visible(s)
                if dw > max_width or rv > max_width:
                    bad.append((rel, lineno, dw, rv, s))
    return bad


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("-m", "--max", type=int, default=16)
    ap.add_argument("--dirs", nargs="*", default=DEFAULT_DIRS)
    args = ap.parse_args()

    bad = scan(args.max, args.dirs)
    out = Path(__file__).parent / "line_width_report.txt"
    with out.open("w", encoding="utf-8") as fp:
        fp.write(f"MAX display/raw width: {args.max}\n")
        fp.write(f"Lines over limit: {len(bad)}\n\n")
        for rel, ln, dw, rv, s in bad:
            fp.write(f"{rel}:{ln} disp={dw} raw={rv}: {s}\n")

    print(f"MAX={args.max}  lines over limit: {len(bad)}")
    for rel, ln, dw, rv, s in bad[:25]:
        print(f"  {rel}:{ln} disp={dw} raw={rv}: {s[:60]}")
    if len(bad) > 25:
        print(f"  ... +{len(bad) - 25} more")
    print(f"Report: {out}")


if __name__ == "__main__":
    main()