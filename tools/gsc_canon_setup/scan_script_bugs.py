# -*- coding: utf-8 -*-
"""Scan for localization-induced script/text bugs."""
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[2]
OUT = Path(__file__).resolve().parent / "_script_bugs_report.md"

SKIP = {"backup", "text_backup", "_upstream", "maps_backup"}


def skip(p: Path) -> bool:
    return any(x in str(p) for x in SKIP) or ".bak" in p.name


def scan_file(path: Path):
    t = path.read_text(encoding="utf-8", errors="replace")
    lines = t.splitlines()
    rel = str(path.relative_to(ROOT))
    issues = []

    # 1) Label: only end then .Script: without sdefer (scene corruption)
    for i, line in enumerate(lines):
        if re.match(r"^\w[\w.]*:\s*$", line):
            # look ahead for blank lines + lone end + .Script
            j = i + 1
            while j < len(lines) and lines[j].strip() == "":
                j += 1
            if j < len(lines) and lines[j].strip() == "end":
                k = j + 1
                while k < len(lines) and lines[k].strip() == "":
                    k += 1
                if k < len(lines) and re.match(r"^\.Script:\s*$", lines[k]):
                    # check if sdefer appears between label and end
                    block = "\n".join(lines[i : j + 1])
                    if "sdefer" not in block:
                        issues.append(
                            (
                                "MISSING_SDEFER",
                                i + 1,
                                f"{line.strip()} ends before .Script without sdefer",
                            )
                        )

    # 2) done immediately followed by text_ram / text_decimal (same text script)
    # Require tabs/indent continuity (still script body)
    for i in range(len(lines) - 2):
        if lines[i].strip() != "done":
            continue
        # skip if previous line is blank (might be end of block) - still check
        j = i + 1
        while j < len(lines) and lines[j].strip() == "":
            j += 1
        if j >= len(lines):
            continue
        nxt = lines[j].strip()
        # only if next is text_ram/decimal WITHOUT a new label
        if re.match(r"^(text_ram|text_decimal)\b", nxt):
            # previous non-empty should be a text/line/cont string
            p = i - 1
            while p >= 0 and lines[p].strip() == "":
                p -= 1
            if p >= 0 and re.match(
                r'^(text|line|cont|para|next|page)\s+"', lines[p].strip()
            ):
                # exclude if there's a label between done and text_ram (shouldn't with our scan)
                issues.append(
                    (
                        "DONE_BEFORE_RAM",
                        i + 1,
                        f"done then {nxt[:50]} (after {lines[p].strip()[:40]})",
                    )
                )

    # 3) writethistext blocks: done mid-block before text_ram/decimal
    for i, line in enumerate(lines):
        if "writethistext" in line or line.strip() == "writethistext":
            # scan next 20 lines for done then text_ram
            chunk = lines[i : i + 25]
            for k in range(len(chunk) - 1):
                if chunk[k].strip() == "done":
                    for m in range(k + 1, min(k + 5, len(chunk))):
                        if chunk[m].strip() == "":
                            continue
                        if re.match(r"^(text_ram|text_decimal)\b", chunk[m].strip()):
                            issues.append(
                                (
                                    "WRITETHIS_DONE_RAM",
                                    i + 1 + k,
                                    f"writethistext block has done before {chunk[m].strip()[:40]}",
                                )
                            )
                        break

    return issues


def main():
    all_issues = []
    roots = [ROOT / "maps", ROOT / "data" / "phone" / "text", ROOT / "data" / "text"]
    for base in roots:
        if not base.exists():
            continue
        for path in sorted(base.rglob("*.asm")):
            if skip(path):
                continue
            iss = scan_file(path)
            for kind, line, msg in iss:
                all_issues.append((kind, str(path.relative_to(ROOT)), line, msg))

    # group
    by_kind = {}
    for kind, rel, line, msg in all_issues:
        by_kind.setdefault(kind, []).append((rel, line, msg))

    lines = ["# Script/text structure bug scan", ""]
    lines.append(f"**Total issues: {len(all_issues)}**")
    lines.append("")
    for kind, items in sorted(by_kind.items()):
        lines.append(f"## {kind} ({len(items)})")
        for rel, line, msg in items[:200]:
            lines.append(f"- `{rel}:{line}` — {msg}")
            print(f"{kind} {rel}:{line} {msg}")
        if len(items) > 200:
            lines.append(f"- ... +{len(items)-200}")
        lines.append("")

    OUT.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print("wrote", OUT)
    print("TOTAL", len(all_issues))
    for k, v in by_kind.items():
        print(f"  {k}: {len(v)}")


if __name__ == "__main__":
    main()
