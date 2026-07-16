# -*- coding: utf-8 -*-
"""Scan for GSC textbox overflow: more than 2 lines without cont/para."""
from __future__ import annotations

import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def is_cmd(s: str, name: str) -> bool:
    s = s.strip()
    return bool(re.match(rf"^{name}(\s|$|\")", s))


def scan_file(path: Path) -> list[dict]:
    try:
        lines = path.read_text(encoding="utf-8", errors="replace").splitlines()
    except OSError:
        return []

    issues: list[dict] = []
    i = 0
    n = len(lines)
    while i < n:
        raw = lines[i]
        stripped = raw.strip()
        if not (
            is_cmd(stripped, "text")
            or stripped.startswith("text_ram")
            or stripped.startswith("text_decimal")
            or stripped.startswith("text_start")
        ):
            # also allow blocks starting with only text_ram after label
            i += 1
            continue

        # walk back if previous non-empty is a label for context
        block_start = i
        block: list[tuple[int, str]] = []
        j = i
        while j < n:
            l = lines[j]
            s = l.strip()
            block.append((j + 1, s))
            if is_cmd(s, "done") or is_cmd(s, "prompt") or s == "text_end" or s.startswith("text_end"):
                break
            # next top-level label ends block
            if j > i and l and not l[0].isspace() and not s.startswith(";") and ":" in s.split()[0]:
                block.pop()
                j -= 1
                break
            # SECTION ends
            if j > i and s.startswith("SECTION"):
                block.pop()
                j -= 1
                break
            j += 1

        # Simulate 2-line box
        # Rules (approx GSC):
        # - text / text_ram / text_decimal write on current line
        # - line advances to next row (1->2, 2->3 = overflow unless we treat as error)
        # - cont scrolls (keeps writing on bottom line / row 2)
        # - para resets to row 1
        row = 0
        overflows: list[tuple[int, str, int]] = []
        cmds_preview: list[str] = []
        has_line = False

        for ln, s in block:
            if not s or s.startswith(";"):
                continue
            kind = None
            if is_cmd(s, "text") or s.startswith("text_ram") or s.startswith("text_decimal") or s.startswith("text_start"):
                kind = "write"
            elif is_cmd(s, "line"):
                kind = "line"
                has_line = True
            elif is_cmd(s, "cont"):
                kind = "cont"
            elif is_cmd(s, "para"):
                kind = "para"
            elif is_cmd(s, "done") or is_cmd(s, "prompt") or s.startswith("text_end"):
                kind = "end"
            else:
                continue

            cmds_preview.append(s[:70])
            if kind == "write":
                if row == 0:
                    row = 1
            elif kind == "line":
                row += 1
                if row > 2:
                    overflows.append((ln, s, row))
            elif kind == "cont":
                # after cont, content goes to bottom line
                row = 2
            elif kind == "para":
                row = 0  # next write starts fresh
            elif kind == "end":
                break

        # Special pattern: multiple line "" around text_ram (the known bug style)
        multi_empty_line = 0
        for ln, s in block:
            if re.match(r'^line\s+""\s*$', s) or re.match(r"^line\s+''\s*$", s):
                multi_empty_line += 1

        if overflows:
            issues.append(
                {
                    "file": str(path.relative_to(ROOT)).replace("\\", "/"),
                    "start": block_start + 1,
                    "overflows": overflows,
                    "preview": cmds_preview[:14],
                    "empty_lines": multi_empty_line,
                }
            )
        i = max(j + 1, i + 1)

    return issues


def main() -> None:
    globs = [
        "data/text/**/*.asm",
        "maps/**/*.asm",
        "engine/**/*.asm",
        "data/phone/**/*.asm",
        "data/events/**/*.asm",
    ]
    files: list[Path] = []
    for g in globs:
        files.extend(ROOT.glob(g))
    files = sorted(set(files))

    all_issues: list[dict] = []
    for f in files:
        all_issues.extend(scan_file(f))

    # Also find the specific anti-pattern: line "" then text_ram then line (not cont)
    pattern_issues: list[tuple[str, int, str]] = []
    pat = re.compile(
        r'line\s+""\s*\n\s*text_ram[^\n]+\n\s*line\s+',
        re.MULTILINE,
    )
    for f in files:
        try:
            t = f.read_text(encoding="utf-8", errors="replace")
        except OSError:
            continue
        for m in pat.finditer(t):
            line_no = t[: m.start()].count("\n") + 1
            snippet = m.group(0).replace("\n", " | ")[:120]
            pattern_issues.append((str(f.relative_to(ROOT)).replace("\\", "/"), line_no, snippet))

    out = ROOT / "tools" / "_textbox_overflow_report.txt"
    with out.open("w", encoding="utf-8") as fh:
        fh.write(f"TEXTBOX OVERFLOW SCAN\n")
        fh.write(f"Blocks with row>2 via line without cont/para: {len(all_issues)}\n")
        fh.write(f"Pattern line\"\"+text_ram+line: {len(pattern_issues)}\n\n")

        fh.write("=== PATTERN: line \"\" + text_ram + line (should usually be cont) ===\n")
        for path, ln, snip in pattern_issues:
            fh.write(f"{path}:{ln}: {snip}\n")

        fh.write("\n=== OVERFLOW BLOCKS ===\n")
        for iss in all_issues:
            fh.write(f"\n{iss['file']}:{iss['start']}  empty_line_cmds={iss['empty_lines']}\n")
            for ln, s, row in iss["overflows"]:
                fh.write(f"  OVERFLOW @{ln} row={row}: {s}\n")
            fh.write("  PREVIEW:\n")
            for p in iss["preview"]:
                fh.write(f"    {p}\n")

    print(f"Report: {out}")
    print(f"Overflow blocks: {len(all_issues)}")
    print(f"line\"\"+text_ram+line patterns: {len(pattern_issues)}")
    print("\n--- Pattern hits ---")
    for path, ln, snip in pattern_issues[:40]:
        print(f"{path}:{ln}: {snip}")
    print("\n--- Overflow sample (first 30) ---")
    for iss in all_issues[:30]:
        print(f"{iss['file']}:{iss['start']} -> {iss['overflows'][0]}")


if __name__ == "__main__":
    main()
