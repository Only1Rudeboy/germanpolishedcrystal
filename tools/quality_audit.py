#!/usr/bin/env python3
"""Comprehensive quality audit for Polished Crystal DE translation."""
from __future__ import annotations

import json
import re
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
REPORT = Path(__file__).resolve().parent / "quality_audit_report.txt"

MAX_LINE = 18
SCAN_DIRS = ["maps", "data", "text"]
SKIP_FILES = {"data/credits_strings.asm"}

TEXT_CMD = re.compile(
    r'^\s*(text_ram|text_decimal|text_far|text_farend|text_asm|text_promptbutton|'
    r"text|line|para|cont|next|page|prompt|done)\b"
)
STRING_PAT = re.compile(
    r'(?:text|line|cont|para|next|page)\s+"([^"]*)"'
)
PLACEHOLDER = re.compile(r"\{d:[^}]+\}")
BROKEN_PH = re.compile(r"\{d:[^}]*-")

# Broader English detection in any dialog string
EN_WORDS = re.compile(
    r"\b("
    r"the|you|your|you're|i'm|it's|what|this|that|how|why|"
    r"please|welcome|hello|good morning|good evening|"
    r"pokemon|pokémon|trainer|battle|fight|catch|"
    r"we're|they're|there's|here's|don't|can't|won't|"
    r"let's|gonna|gotta|sup|yeah|okay|sorry|thanks|"
    r"my |wild |played the|is reported|having tea|"
    r"bright blue|middle name|grand-"
    r")\b",
    re.I,
)

# German style violations
STYLE_ISSUES = [
    ("Oh statt Ach", re.compile(r'"(?:[^"]*\b)Oh[!, ]', re.I)),
    ("Hi statt Hallo", re.compile(r'"(?:[^"]*\b)Hi[,! ]', re.I)),
    ("Pokemon statt #mon", re.compile(r"\bPokemon\b|\bPokémon\b", re.I)),
    ("<……> statt …", re.compile(r"<……>")),
    ("ae/oe/ue statt Umlaut", re.compile(r"\b(?:[Aa]e|[Oo]e|[Uu]e)[a-zäöü]")),
]

INVALID_ROM_CHARS = re.compile(r"[âêîôûàèìòùç]")
TODO_MARK = re.compile(r'\bTODO\b|text "TODO"', re.I)

issues: dict[str, list[str]] = {}


def add(cat: str, msg: str) -> None:
    issues.setdefault(cat, []).append(msg)


def visible_len(s: str) -> int:
    return len(PLACEHOLDER.sub("##", s).rstrip("@"))


def scan_asm_files() -> None:
    long_lines = 0
    en_hits = 0
    style_hits = 0
    invalid_char_hits = 0
    todo_hits = 0
    broken_ph = 0

    for sub in SCAN_DIRS:
        base = ROOT / sub
        if not base.exists():
            continue
        for path in sorted(base.rglob("*.asm")):
            rel = str(path.relative_to(ROOT)).replace("\\", "/")
            if rel in SKIP_FILES:
                continue
            lines = path.read_text(encoding="utf-8", errors="replace").splitlines()

            # Text structure: plain text after line/cont
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
                        "text_ram",
                        "text_decimal",
                        "text_far",
                        "text_farend",
                        "text_asm",
                        "text_promptbutton",
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

                sm = STRING_PAT.search(raw)
                if not sm:
                    continue
                s = sm.group(1)

                if BROKEN_PH.search(s):
                    broken_ph += 1
                    add("BROKEN_PLACEHOLDER", f"{rel}:{i}: {s[:60]}")

                n = visible_len(s)
                if n > MAX_LINE:
                    long_lines += 1
                    add("LINE_LENGTH", f"{rel}:{i} ({n}): {s[:70]}")

                if INVALID_ROM_CHARS.search(s):
                    invalid_char_hits += 1
                    add("INVALID_CHAR", f"{rel}:{i}: {s[:70]}")

                if TODO_MARK.search(raw):
                    todo_hits += 1
                    add("TODO", f"{rel}:{i}: {raw.strip()[:80]}")

                # Skip credits / proper names / attack names in English
                if rel.startswith("data/credits"):
                    continue
                if EN_WORDS.search(s):
                    # ignore German false positives
                    low = s.lower()
                    if "the" in low and any(
                        g in low
                        for g in (
                            "wetter",
                            "wächter",
                            "welt",
                            "west",
                            "weiter",
                            "wert",
                        )
                    ):
                        pass
                    else:
                        en_hits += 1
                        add("ENGLISH", f"{rel}:{i}: {s[:80]}")

                for name, pat in STYLE_ISSUES:
                    if pat.search(raw):
                        style_hits += 1
                        add("STYLE", f"{rel}:{i} [{name}]: {s[:70]}")

    add(
        "SUMMARY_COUNTS",
        f"long_lines={long_lines} english={en_hits} style={style_hits} "
        f"invalid_chars={invalid_char_hits} todo={todo_hits} broken_ph={broken_ph}",
    )


def scan_translation_progress() -> None:
    prog = ROOT / "translation_progress.json"
    if not prog.exists():
        add("PROGRESS", "translation_progress.json missing — run translation_progress.py")
        return
    # refresh
    subprocess.run(
        [sys.executable, str(ROOT / "tools" / "translation_progress.py")],
        cwd=ROOT,
        capture_output=True,
        text=True,
    )
    d = json.loads(prog.read_text(encoding="utf-8"))
    add(
        "PROGRESS",
        f"maps_done={d['maps_done']}/{d['maps_total']} "
        f"partial={d['maps_partial']} open={d['maps_open']} "
        f"en_remaining≈{d['english_lines_remaining']}",
    )
    for f in sorted(d["files"], key=lambda x: -x["eng_lines"]):
        if f["status"] in ("open", "partial") and f["eng_lines"] > 0:
            add(
                "MAP_STATUS",
                f"{f['file']}: status={f['status']} eng={f['eng_lines']} "
                f"ger={f['ger_lines']} ref={f['ref_available']}",
            )


def run_build() -> None:
    bash = Path(r"C:\msys64\usr\bin\bash.exe")
    if not bash.exists():
        add("BUILD", "msys64 bash not found — skipped")
        return
    cmd = (
        'export PATH="/mingw64/bin:/c/Users/Rudeboy/Downloads/polishedcrystal-master/'
        'polishedcrystal-master/tools/make/bin:$PATH" ; '
        "cd /c/Users/Rudeboy/Downloads/polishedcrystal-master/polishedcrystal-master "
        "&& make crystal 2>&1"
    )
    r = subprocess.run([str(bash), "-lc", cmd], capture_output=True, text=True, timeout=600)
    out = r.stdout + r.stderr
    gbc = ROOT / "polishedcrystal-3.2.3.gbc"
    if gbc.exists():
        add("BUILD", f"ROM exists: {gbc.stat().st_size} bytes")
    else:
        add("BUILD", "ROM file NOT created")
    if r.returncode == 0:
        add("BUILD", "make crystal: SUCCESS")
    else:
        add("BUILD", f"make crystal: exit {r.returncode}")
        for line in out.splitlines():
            if "error:" in line.lower() or "aborted" in line.lower():
                add("BUILD", line.strip())
    if "unknown ROM bank" in out:
        add("BUILD", "bankends: unknown ROM bank (4MB validation)")


def write_report() -> None:
    lines = ["=" * 60, "POLISHED CRYSTAL DE — QUALITY AUDIT", "=" * 60, ""]
    order = [
        "BUILD",
        "PROGRESS",
        "SUMMARY_COUNTS",
        "MAP_STATUS",
        "TEXT_STRUCTURE",
        "BROKEN_PLACEHOLDER",
        "LINE_LENGTH",
        "INVALID_CHAR",
        "TODO",
        "STYLE",
        "ENGLISH",
    ]
    for cat in order:
        items = issues.get(cat, [])
        if not items:
            continue
        lines.append(f"## {cat} ({len(items)})")
        lines.append("-" * 40)
        show = items if cat in ("BUILD", "PROGRESS", "SUMMARY_COUNTS", "MAP_STATUS") else items[:80]
        for item in show:
            lines.append(item)
        if len(items) > len(show):
            lines.append(f"  ... +{len(items) - len(show)} more")
        lines.append("")

    REPORT.write_text("\n".join(lines), encoding="utf-8")
    print("\n".join(lines[:80]))
    if len(lines) > 80:
        print(f"\n... full report: {REPORT}")


def main() -> int:
    print("Running quality audit...")
    scan_asm_files()
    scan_translation_progress()
    run_build()
    write_report()
    critical = sum(
        len(issues.get(c, []))
        for c in (
            "TEXT_STRUCTURE",
            "BROKEN_PLACEHOLDER",
            "LINE_LENGTH",
            "INVALID_CHAR",
            "TODO",
        )
    )
    return 1 if critical else 0


if __name__ == "__main__":
    raise SystemExit(main())