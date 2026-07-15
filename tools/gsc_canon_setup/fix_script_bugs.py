# -*- coding: utf-8 -*-
"""Fix MISSING_SDEFER and DONE_BEFORE_RAM script/text bugs."""
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[2]

SKIP = {"backup", "text_backup", "_upstream", "maps_backup"}


def skip(p: Path) -> bool:
    return any(x in str(p) for x in SKIP) or ".bak" in p.name


def fix_sdefer(text: str) -> tuple[str, int]:
    """Label + end + .Script without sdefer -> insert sdefer."""
    n = 0

    def repl(m):
        nonlocal n
        n += 1
        label = m.group(1)
        blanks_before = m.group(2)
        blanks_after = m.group(3)
        return f"{label}:\n\tsdefer .Script\n\tend\n{blanks_after}.Script:"

    # Label:\n [blanks] \tend\n [blanks] .Script:
    pat = re.compile(
        r"^([A-Za-z_][\w.]*):[ \t]*\n"
        r"((?:[ \t]*\n)*)"
        r"\tend[ \t]*\n"
        r"((?:[ \t]*\n)*)"
        r"\.Script:",
        re.M,
    )
    # Only fix if sdefer not already between label and .Script
    out = []
    last = 0
    for m in pat.finditer(text):
        block = m.group(0)
        if "sdefer" in block:
            continue
        n += 1
        out.append(text[last : m.start()])
        # preserve single blank style
        out.append(f"{m.group(1)}:\n\tsdefer .Script\n\tend\n\n.Script:")
        last = m.end()
    out.append(text[last:])
    return "".join(out), n


def fix_done_before_ram(text: str) -> tuple[str, int]:
    """
    Remove premature 'done' between a text string line and text_ram/text_decimal
    when they are part of the same scripted text (no intervening label).
    """
    lines = text.splitlines(keepends=True)
    n = 0
    i = 0
    out = []
    while i < len(lines):
        line = lines[i]
        stripped = line.strip()
        if stripped == "done" and i + 1 < len(lines):
            # look ahead skipping blanks
            j = i + 1
            while j < len(lines) and lines[j].strip() == "":
                j += 1
            if j < len(lines):
                nxt = lines[j].strip()
                if re.match(r"^(text_ram|text_decimal)\b", nxt):
                    # previous non-empty must be text/line/cont/para/next/page "
                    p = len(out) - 1
                    while p >= 0 and out[p].strip() == "":
                        p -= 1
                    if p >= 0 and re.match(
                        r'^(text|line|cont|para|next|page)\s+"', out[p].strip()
                    ):
                        # ensure we don't skip if next after ram is a label only (new section)
                        # Keep fix: drop this done line (and no extra blanks we need)
                        n += 1
                        i += 1
                        continue
        out.append(line)
        i += 1
    return "".join(out), n


def main():
    total_s = total_d = 0
    changed = []
    for base in [ROOT / "maps", ROOT / "data" / "phone" / "text", ROOT / "data" / "text"]:
        if not base.exists():
            continue
        for path in sorted(base.rglob("*.asm")):
            if skip(path):
                continue
            orig = path.read_text(encoding="utf-8", errors="replace")
            t, ns = fix_sdefer(orig)
            t2, nd = fix_done_before_ram(t)
            if ns or nd:
                path.write_text(t2, encoding="utf-8", newline="\n")
                total_s += ns
                total_d += nd
                changed.append((str(path.relative_to(ROOT)), ns, nd))
                print(f"fixed {path.relative_to(ROOT)} sdefer={ns} done_ram={nd}")
    print(f"TOTAL sdefer fixes={total_s} done_before_ram={total_d} files={len(changed)}")
    report = Path(__file__).resolve().parent / "_script_bugs_fixed.md"
    lines = [
        "# Script bugs fixed",
        "",
        f"- sdefer inserts: {total_s}",
        f"- premature done removals: {total_d}",
        f"- files: {len(changed)}",
        "",
    ]
    for rel, ns, nd in changed:
        lines.append(f"- `{rel}` sdefer={ns} done_ram={nd}")
    report.write_text("\n".join(lines) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
