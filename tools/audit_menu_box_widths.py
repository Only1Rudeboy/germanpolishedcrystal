#!/usr/bin/env python3
"""Audit menu_coords vs menu string lengths (STATICMENU_CURSOR style).

Geometry (GetMenuTextStartCoord + Textbox borders):
  text starts at x1+1 (+1 if CURSOR bit 7)
  last tile before right border: x2-1
  max tiles with cursor: x2 - x1 - 2
  max tiles without cursor: x2 - x1 - 1

Tile width: mostly 1; treat #MON/#BALL/#DEX/#COM as 7 (project policy).
"""
from __future__ import annotations

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]

# Rough charmap: count tiles for menu labels
MACRO_7 = re.compile(r"#(?:MON|BALL|DEX|COM)")

COORD_RE = re.compile(
    r"menu_coords\s+(\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)"
)
STR_RE = re.compile(r'^\s*db\s+"([^"]*)"@?\s*$')
# also db "foo@"
STR_RE2 = re.compile(r'^\s*db\s+"([^"]*)@"')
FLAGS_RE = re.compile(r"^\s*db\s+(\$?[0-9A-Fa-fx]+)\s*;?\s*(?:flags)?", re.I)
ITEMS_RE = re.compile(r"^\s*db\s+(\d+)\s*;?\s*items?", re.I)
HEADER_RE = re.compile(r"^([A-Za-z0-9_]+):\s*$")


# {d:CONST} / {d:wram} print decimals at runtime (prize menus: usually ≤5 digits)
DECIMAL_MACRO = re.compile(r"\{d:[^}]+\}")


def tile_width(s: str) -> int:
    s = s.replace("@", "")
    # decimal macros → assume 5 digits (worst-case prize coins)
    s = DECIMAL_MACRO.sub("00000", s)
    # expand 7-tile macros first
    w = 0
    i = 0
    while i < len(s):
        m = MACRO_7.match(s, i)
        if m:
            w += 7
            i = m.end()
            continue
        # <PLAYER> etc. — rare in menus; count as 7 worst-case
        if s[i] == "<":
            j = s.find(">", i)
            if j != -1:
                tag = s[i : j + 1]
                if tag in ("<PLAYER>", "<PLAY_G>", "<USER>", "<TARGET>", "<ENEMY>"):
                    w += 7
                else:
                    w += max(1, j - i - 1)
                i = j + 1
                continue
        w += 1
        i += 1
    return w


def parse_flag(raw: str) -> int | None:
    raw = raw.strip()
    try:
        if raw.startswith("$"):
            return int(raw[1:], 16)
        if raw.lower().startswith("0x"):
            return int(raw, 16)
        return int(raw, 0)
    except ValueError:
        return None


def audit_file(path: Path) -> list[dict]:
    text = path.read_text(encoding="utf-8", errors="replace")
    lines = text.splitlines()
    issues = []
    i = 0
    current_header = None
    while i < len(lines):
        hm = HEADER_RE.match(lines[i])
        if hm:
            current_header = hm.group(1)
        m = COORD_RE.search(lines[i])
        if not m:
            i += 1
            continue
        x1, y1, x2, y2 = map(int, m.groups())
        # Look ahead for MenuData flags + strings
        flags = None
        n_items = None
        strings: list[str] = []
        header_name = current_header or path.name
        j = i + 1
        # scan next ~40 lines for this menu block
        while j < len(lines) and j < i + 45:
            if COORD_RE.search(lines[j]) and j > i:
                break
            if HEADER_RE.match(lines[j]) and "MenuData" not in lines[j] and j > i + 2:
                # new unrelated header — stop if we already have strings
                if strings:
                    break
            fm = FLAGS_RE.match(lines[j])
            if fm and flags is None and ("flag" in lines[j].lower() or "$" in fm.group(1)):
                flags = parse_flag(fm.group(1))
            im = ITEMS_RE.match(lines[j])
            if im and n_items is None:
                n_items = int(im.group(1))
            sm = STR_RE2.search(lines[j]) or STR_RE.match(lines[j])
            if sm:
                s = sm.group(1)
                # skip empty / pure control
                if s and not s.startswith("\\"):
                    strings.append(s)
            j += 1

        if not strings:
            i += 1
            continue

        has_cursor = True
        if flags is not None:
            has_cursor = bool(flags & 0x80)  # STATICMENU_CURSOR
        max_fit = (x2 - x1 - 2) if has_cursor else (x2 - x1 - 1)
        if max_fit < 1:
            max_fit = 0

        widths = [(s, tile_width(s)) for s in strings]
        longest = max(widths, key=lambda t: t[1])
        if longest[1] > max_fit:
            issues.append(
                {
                    "file": str(path.relative_to(ROOT)).replace("\\", "/"),
                    "header": header_name,
                    "line": i + 1,
                    "coords": f"menu_coords {x1}, {y1}, {x2}, {y2}",
                    "x1": x1,
                    "x2": x2,
                    "flags": f"${flags:02x}" if flags is not None else "?",
                    "cursor": has_cursor,
                    "max_fit": max_fit,
                    "longest": longest[0],
                    "longest_w": longest[1],
                    "overflow": longest[1] - max_fit,
                    "need_x1": x2 - 2 - longest[1] if has_cursor else x2 - 1 - longest[1],
                    "all": widths,
                }
            )
        i += 1
    return issues


def main() -> int:
    roots = [ROOT / "maps", ROOT / "engine", ROOT / "data", ROOT / "home"]
    files: list[Path] = []
    for r in roots:
        if r.is_dir():
            files.extend(r.rglob("*.asm"))
    files = sorted(set(files))
    all_issues: list[dict] = []
    for f in files:
        all_issues.extend(audit_file(f))

    # Sort by overflow desc
    all_issues.sort(key=lambda d: (-d["overflow"], d["file"], d["line"]))

    out = ROOT / "tools" / "MENU_BOX_WIDTH_AUDIT.txt"
    lines = [
        "Menu box width audit (cursor-aware)",
        f"Issues: {len(all_issues)}",
        "max_fit = x2-x1-2 with STATICMENU_CURSOR ($80), else x2-x1-1",
        "",
    ]
    for it in all_issues:
        lines.append(
            f"{it['file']}:{it['line']}  {it['header']}\n"
            f"  {it['coords']}  flags={it['flags']} cursor={it['cursor']}\n"
            f"  max_fit={it['max_fit']}  longest={it['longest_w']} \"{it['longest']}\"  overflow=+{it['overflow']}\n"
            f"  suggest x1={max(0, it['need_x1'])}  (menu_coords {max(0, it['need_x1'])}, y1, {it['x2']}, y2)\n"
            f"  strings: {', '.join(f'{s}({w})' for s,w in it['all'])}\n"
        )
    out.write_text("\n".join(lines), encoding="utf-8")
    print(f"Wrote {out} ({len(all_issues)} issues)")
    for it in all_issues[:40]:
        print(
            f"+{it['overflow']} {it['file']}:{it['line']} "
            f"\"{it['longest']}\"({it['longest_w']}>{it['max_fit']}) "
            f"{it['coords']}"
        )
    if len(all_issues) > 40:
        print(f"... and {len(all_issues)-40} more (see report)")
    return 0 if not all_issues else 1


if __name__ == "__main__":
    sys.exit(main())
