#!/usr/bin/env python3
"""Comprehensive QC for Polished Crystal DE translation."""
from __future__ import annotations

import re
import subprocess
from collections import defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
REPORT = Path(__file__).resolve().parent / "comprehensive_qc_report.txt"
SCAN_DIRS = [ROOT / "maps", ROOT / "data"]
SKIP = {"data/credits_strings.asm"}
STRING = re.compile(r'(?:text|line|cont|para|next|page)\s+"([^"]*)"')
TEXT_CMD = re.compile(
    r'^\s*(text_ram|text_decimal|text_far|text_farend|text_asm|text_promptbutton|'
    r"text|line|para|cont|next|page|prompt|done)\b"
)
PLACEHOLDER = re.compile(r"\{d:[^}]+\}")
TOKEN_WIDTH = {
    "<PLAYER>": 7, "<RIVAL>": 7, "<ENEMY>": 7, "<USER>": 7, "<TARGET>": 7,
    "<STR_VAR1>": 8, "<STR_VAR2>": 8, "<STR_VAR3>": 8, "<ITEM>": 8,
    "<MOVE>": 8, "<POKE>": 4, "<PK><MN>": 2, "<PO><KE>": 2,
    "#mon": 4, "#MON": 4, "#dex": 4, "#DEX": 4,
}

issues: dict[str, list[str]] = defaultdict(list)


def vis(s: str) -> int:
    s = PLACEHOLDER.sub("##", s).rstrip("@")
    w = i = 0
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


def add(cat: str, msg: str) -> None:
    issues[cat].append(msg)


def scan_dialogue() -> None:
    formal = re.compile(
        r"\b(Findest Du|was Dein |was Deine |Für Dich|Ziehen Dein|#mon Für|Dich Auf!|"
        r"Sie können deinen|möschtest|rischtisch|Machen Sie)\b"
    )
    en_phrases = re.compile(
        r"\b(Special Feature:|Advanced Tips!|good morning|good evening|thank you|"
        r"let's go|what's up|my name is|nice to meet)\b",
        re.I,
    )
    pokemon_dialog = re.compile(r"\b(Pokemon|Pokémon)\b")
    bad_ellipsis = re.compile(r"<……>")
    broken_quote = re.compile(r'""\s*$')  # ASCII "" at end inside string line

    long_count = 0
    borderline = 0
    strings = 0

    for base in SCAN_DIRS:
        if not base.exists():
            continue
        for path in sorted(base.rglob("*.asm")):
            if "_upstream_extract" in str(path):
                continue
            rel = str(path.relative_to(ROOT)).replace("\\", "/")
            if rel in SKIP:
                continue
            lines = path.read_text(encoding="utf-8", errors="replace").splitlines()

            in_block = False
            last_plain = False
            for i, raw in enumerate(lines, 1):
                m = TEXT_CMD.match(raw)
                if m:
                    cmd = m.group(1)
                    if cmd == "done":
                        in_block = False
                        last_plain = False
                    elif cmd in (
                        "text_ram", "text_decimal", "text_far", "text_farend",
                        "text_asm", "text_promptbutton",
                    ):
                        last_plain = False
                    elif cmd == "text":
                        if in_block and last_plain:
                            add("TEXT_STRUCTURE", f"{rel}:{i}: {raw.strip()}")
                        in_block = True
                        last_plain = True
                    elif cmd in ("line", "cont"):
                        if in_block:
                            last_plain = True
                    elif cmd == "para":
                        last_plain = False

                sm = STRING.search(raw)
                if not sm:
                    continue
                s = sm.group(1)
                strings += 1

                if s in ("TODO", "?", ".", "!", "…"):
                    add("SUSPICIOUS_SHORT", f"{rel}:{i}: {s!r}")

                vl = vis(s)
                if vl > 17:
                    long_count += 1
                    add("LINE_TOO_LONG", f"{rel}:{i}: disp={vl} {s!r}")
                elif vl >= 17:
                    borderline += 1

                if formal.search(s):
                    add("FORMAL_PRONOUN", f"{rel}:{i}: {s}")
                if en_phrases.search(s):
                    add("EN_PHRASE", f"{rel}:{i}: {s}")
                if pokemon_dialog.search(s):
                    add("POKEMON_NOT_MON", f"{rel}:{i}: {s}")
                if bad_ellipsis.search(s):
                    add("BAD_ELLIPSIS", f"{rel}:{i}: {s}")
                if broken_quote.search(s) and not s.endswith("\u201d\""):
                    # flag only pure ASCII double-double-quote endings
                    if s.endswith('""') and "\u201c" not in s and "\u201d" not in s:
                        add("BROKEN_QUOTE", f"{rel}:{i}: {s}")

    add("STATS", f"dialog_strings={strings}")
    add("STATS", f"long_lines={long_count}")
    add("STATS", f"borderline_17={borderline}")


def scan_build() -> None:
    rom = ROOT / "polishedcrystal-3.2.3.gbc"
    if rom.exists():
        add("BUILD", f"ROM: {rom.stat().st_size} bytes")
    bash = Path(r"C:\Program Files\Git\bin\bash.exe")
    if bash.exists():
        r = subprocess.run(
            [str(bash), "-lc",
             f"cd '{ROOT.as_posix()}' && tools/make/bin/make.exe -q crystal 2>&1"],
            capture_output=True, text=True, timeout=120, cwd=ROOT,
        )
        if r.returncode == 0:
            add("BUILD", "make crystal: OK")
        else:
            err = [ln for ln in (r.stdout + r.stderr).splitlines()
                   if "error:" in ln.lower() or "fatal:" in ln.lower()]
            add("BUILD", f"make crystal: exit {r.returncode}")
            for e in err[:8]:
                add("BUILD", e)


def main() -> None:
    scan_dialogue()
    scan_build()

    lines = ["=" * 60, "COMPREHENSIVE QC — POLISHED CRYSTAL DE", "=" * 60, ""]
    real_cats = [c for c in issues if c != "STATS"]
    for cat in ["BUILD", "STATS", "LINE_TOO_LONG", "FORMAL_PRONOUN", "EN_PHRASE",
                "POKEMON_NOT_MON", "BROKEN_QUOTE", "BAD_ELLIPSIS", "SUSPICIOUS_SHORT",
                "TEXT_STRUCTURE"] + sorted(set(real_cats) - {
                    "BUILD", "STATS", "LINE_TOO_LONG", "FORMAL_PRONOUN", "EN_PHRASE",
                    "POKEMON_NOT_MON", "BROKEN_QUOTE", "BAD_ELLIPSIS", "SUSPICIOUS_SHORT",
                    "TEXT_STRUCTURE"}):
        if cat not in issues:
            continue
        lines.append(f"## {cat} ({len(issues[cat])})")
        lines.append("-" * 40)
        for item in issues[cat][:60]:
            lines.append(item)
        if len(issues[cat]) > 60:
            lines.append(f"  ... +{len(issues[cat]) - 60} more")
        lines.append("")

    REPORT.write_text("\n".join(lines), encoding="utf-8")
    print(REPORT.read_text(encoding="utf-8"))
    critical = sum(len(issues.get(c, [])) for c in
                   ["LINE_TOO_LONG", "FORMAL_PRONOUN", "EN_PHRASE", "BROKEN_QUOTE", "BUILD"]
                   if c != "BUILD" or any("error" in x.lower() or "exit" in x for x in issues.get("BUILD", [])))
    return 1 if any(issues.get(c) for c in ["LINE_TOO_LONG", "FORMAL_PRONOUN", "EN_PHRASE", "BROKEN_QUOTE"]) else 0


if __name__ == "__main__":
    raise SystemExit(main())