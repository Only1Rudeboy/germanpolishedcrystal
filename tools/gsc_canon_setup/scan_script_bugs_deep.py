# -*- coding: utf-8 -*-
"""
Deep scan for localization-induced script/text structural bugs.
Covers maps, data/text, data/phone, engine, home, mobile, etc.
"""
from pathlib import Path
from collections import defaultdict
import re

ROOT = Path(__file__).resolve().parents[2]
OUT = Path(__file__).resolve().parent / "_script_bugs_deep_report.md"
UP = ROOT / "_upstream_extract" / "polishedcrystal-master"

SKIP_PARTS = {
    "backup", "text_backup", "text_backup_clamped", "_upstream", "maps_backup",
    "__pycache__", "rgbds", "rgbds_linux",
}


def skip(p: Path) -> bool:
    return any(x in p.parts for x in SKIP_PARTS) or any(
        x in p.name for x in (".bak", ".o", ".exe")
    )


def iter_asm():
    for base in [
        ROOT / "maps",
        ROOT / "data",
        ROOT / "engine",
        ROOT / "home",
        ROOT / "mobile",
        ROOT / "audio",
    ]:
        if not base.exists():
            continue
        for p in base.rglob("*.asm"):
            if not skip(p):
                yield p


def scan_done_before_dynamic(lines, rel):
    """done then text_ram/text_decimal without a label in between."""
    issues = []
    for i, line in enumerate(lines):
        if line.strip() != "done":
            continue
        j = i + 1
        while j < len(lines) and lines[j].strip() == "":
            j += 1
        if j >= len(lines):
            continue
        # stop if label
        if re.match(r"^[\w.]+:\s*$", lines[j].strip()) or re.match(
            r"^\.\w+:\s*$", lines[j].strip()
        ):
            continue
        nxt = lines[j].strip()
        if re.match(r"^(text_ram|text_decimal)\b", nxt):
            p = i - 1
            while p >= 0 and lines[p].strip() == "":
                p -= 1
            prev = lines[p].strip() if p >= 0 else ""
            if re.match(r'^(text|line|cont|para|next|page)\s+"', prev):
                issues.append(
                    ("DONE_BEFORE_DYNAMIC", rel, i + 1, f"{prev[:50]} → done → {nxt[:40]}")
                )
    return issues


def scan_prompt_before_dynamic(lines, rel):
    """prompt/done mid-string before text_ram (same class of bug)."""
    issues = []
    for i, line in enumerate(lines):
        s = line.strip()
        if s not in ("prompt", "done"):
            continue
        j = i + 1
        while j < len(lines) and lines[j].strip() == "":
            j += 1
        if j >= len(lines):
            continue
        if re.match(r"^[\w.]+:", lines[j].strip()):
            continue
        nxt = lines[j].strip()
        if re.match(r"^(text_ram|text_decimal)\b", nxt):
            p = i - 1
            while p >= 0 and lines[p].strip() == "":
                p -= 1
            prev = lines[p].strip() if p >= 0 else ""
            if re.match(r'^(text|line|cont|para|next|page)\s+"', prev):
                issues.append(
                    (
                        f"{s.upper()}_BEFORE_DYNAMIC",
                        rel,
                        i + 1,
                        f"{prev[:45]} → {s} → {nxt[:40]}",
                    )
                )
    return issues


def scan_missing_sdefer(lines, rel):
    """Label ends immediately then .Script without sdefer."""
    issues = []
    text = "\n".join(lines)
    # Label:\n blanks \tend\n blanks \t?.Script:
    pat = re.compile(
        r"^([A-Za-z_][\w]*):[ \t]*\n"
        r"(?:[ \t]*\n)*"
        r"\tend[ \t]*\n"
        r"(?:[ \t]*\n)*"
        r"\.Script:",
        re.M,
    )
    for m in pat.finditer(text):
        block = m.group(0)
        if "sdefer" in block:
            continue
        line_no = text[: m.start()].count("\n") + 1
        issues.append(
            ("MISSING_SDEFER", rel, line_no, f"{m.group(1)}: ends before .Script")
        )
    return issues


def scan_orphan_script_after_end(lines, rel):
    """
    After a labeled script's 'end', more commands appear before next top-level label
    without being under a new label — often a duplicated tail.
    Conservative: only flag if after 'end' we see script commands (not text/data)
    for 3+ consecutive non-empty lines without a label.
    """
    issues = []
    script_cmds = re.compile(
        r"^(opentext|closetext|writetext|writethistext|showtext|promptbutton|"
        r"waitbutton|waitsfx|playsound|applymovement|turnobject|setevent|"
        r"setscene|addcellnum|givepoke|getmonname|special|pause|showemote|"
        r"follow|stopfollow|sjump|sjumpfwd|ifequal|iftrue|iffalse|"
        r"checkevent|faceplayer|endtext|waitendtext)\b"
    )
    i = 0
    while i < len(lines):
        if re.match(r"^[A-Za-z_]\w*:\s*$", lines[i]):
            # find first end in this script
            j = i + 1
            saw_cmd = False
            while j < len(lines):
                s = lines[j].strip()
                if re.match(r"^[A-Za-z_]\w*:\s*$", s) or re.match(r"^SECTION\b", s):
                    break
                if s == "end" and saw_cmd:
                    # look after end
                    k = j + 1
                    orphan = []
                    while k < len(lines):
                        sk = lines[k].strip()
                        if sk == "" or sk.startswith(";"):
                            k += 1
                            continue
                        if re.match(r"^[A-Za-z_]\w*:\s*$", sk) or re.match(
                            r"^SECTION\b", sk
                        ):
                            break
                        if sk.startswith("if ") or sk.startswith("if!") or sk == "endc":
                            orphan.append(sk)
                            k += 1
                            continue
                        if script_cmds.match(sk) or sk == "end":
                            orphan.append(sk)
                            k += 1
                            continue
                        break
                    # if we collected script-like lines ending with end, flag
                    if len(orphan) >= 4 and "end" in orphan:
                        issues.append(
                            (
                                "ORPHAN_AFTER_END",
                                rel,
                                j + 1,
                                f"after {lines[i].strip()} ~{len(orphan)} orphan cmds",
                            )
                        )
                    break
                if s and not s.startswith(";") and s not in ("",):
                    if script_cmds.match(s) or s.startswith("if"):
                        saw_cmd = True
                j += 1
        i += 1
    return issues


def scan_unclosed_text(lines, rel):
    """text blocks that never hit done/prompt/text_end before next label (heuristic)."""
    issues = []
    i = 0
    while i < len(lines):
        s = lines[i].strip()
        # start of a text entry often Label: then text "
        if re.match(r"^[A-Za-z_]\w*:\s*$", s) or re.match(r"^\.\w+:\s*$", s):
            # look for text " soon
            j = i + 1
            while j < len(lines) and lines[j].strip() == "":
                j += 1
            if j < len(lines) and re.match(r'^text\s+"', lines[j].strip()):
                # scan until done/prompt/text_end or next top-level label
                k = j
                ended = False
                while k < len(lines):
                    sk = lines[k].strip()
                    if k > j and re.match(r"^[A-Za-z_]\w*:\s*$", sk):
                        break
                    if sk in ("done", "prompt", "text_end") or sk.startswith(
                        "text_end"
                    ):
                        ended = True
                        break
                    if sk in ("farwritetext",) or sk.startswith("text_far"):
                        ended = True
                        break
                    k += 1
                if not ended and k - j > 2:
                    # might be multi-part - only flag if has text lines
                    body = [lines[x].strip() for x in range(j, min(k, j + 30))]
                    if any(re.match(r'^(text|line|cont|para)\s+"', b) for b in body):
                        # check if ends with text_ram hanging
                        last = ""
                        for b in reversed(body):
                            if b:
                                last = b
                                break
                        if re.match(r"^(text_ram|text_decimal)\b", last):
                            issues.append(
                                (
                                    "HANGING_DYNAMIC_NO_DONE",
                                    rel,
                                    i + 1,
                                    f"{s} ends with {last[:40]}",
                                )
                            )
        i += 1
    return issues


def scan_double_done(lines, rel):
    issues = []
    for i in range(len(lines) - 1):
        if lines[i].strip() == "done" and lines[i + 1].strip() == "done":
            issues.append(("DOUBLE_DONE", rel, i + 1, "consecutive done"))
    return issues


def scan_empty_line_only_text(lines, rel):
    """text \"\" alone mid-block sometimes intentional; flag text \"\" followed by done only."""
    issues = []
    for i in range(len(lines) - 1):
        if re.match(r'^\s*text\s+""\s*$', lines[i]) and lines[i + 1].strip() == "done":
            issues.append(("EMPTY_TEXT_DONE", rel, i + 1, 'text "" then done'))
    return issues


def scan_vs_upstream_sdefer(rel_path: Path):
    """If upstream has sdefer for a label, local must too."""
    issues = []
    if not UP.exists():
        return issues
    up = UP / rel_path
    loc = ROOT / rel_path
    if not up.exists() or not loc.exists():
        return issues
    ut = up.read_text(encoding="utf-8", errors="replace")
    lt = loc.read_text(encoding="utf-8", errors="replace")
    for m in re.finditer(r"^(\w+):\n\tsdefer \.Script\n\tend\n", ut, re.M):
        lab = m.group(1)
        if not re.search(rf"^{re.escape(lab)}:\n\tsdefer \.Script\n\tend\n", lt, re.M):
            # find line
            m2 = re.search(rf"^{re.escape(lab)}:", lt, re.M)
            line = lt[: m2.start()].count("\n") + 1 if m2 else 0
            issues.append(
                ("UPSTREAM_SDEFER_MISSING", str(rel_path), line, f"{lab} has sdefer upstream")
            )
    return issues


def scan_vs_upstream_done_dynamic(rel_path: Path):
    """
    Count local done→dynamic occurrences that are NOT present in upstream
    (upstream-valid patterns like intentional structure excluded by comparing presence).
    """
    return []  # handled by absolute local scan


def scan_writethis_incomplete(lines, rel):
    """writethistext block that hits done before text_ram/decimal inside indent."""
    issues = []
    for i, line in enumerate(lines):
        if "writethistext" not in line:
            continue
        # look at following indented lines
        for k in range(i + 1, min(i + 40, len(lines))):
            s = lines[k]
            if s.strip() and not s.startswith("\t") and not s.startswith(" "):
                break
            if s.strip() == "done":
                # peek ahead
                for m in range(k + 1, min(k + 6, len(lines))):
                    sm = lines[m].strip()
                    if sm == "":
                        continue
                    if re.match(r"^(text_ram|text_decimal)\b", sm):
                        issues.append(
                            (
                                "WRITETHIS_DONE_DYNAMIC",
                                rel,
                                k + 1,
                                f"writethis @L{i+1}: done then {sm[:40]}",
                            )
                        )
                    break
    return issues


def scan_text_without_terminator_in_engine(lines, rel):
    """engine often uses text_farend - skip heavy false positives."""
    return []


def main():
    all_issues = []
    file_count = 0
    for path in iter_asm():
        file_count += 1
        try:
            lines = path.read_text(encoding="utf-8", errors="replace").splitlines()
        except Exception as e:
            all_issues.append(("READ_ERROR", str(path.relative_to(ROOT)), 0, str(e)))
            continue
        rel = str(path.relative_to(ROOT))
        for fn in (
            scan_done_before_dynamic,
            scan_prompt_before_dynamic,
            scan_missing_sdefer,
            scan_double_done,
            scan_writethis_incomplete,
            scan_unclosed_text,
            scan_orphan_script_after_end,
            scan_empty_line_only_text,
        ):
            try:
                all_issues.extend(fn(lines, rel))
            except Exception as e:
                all_issues.append(("SCAN_ERR", rel, 0, f"{fn.__name__}: {e}"))

    # Upstream sdefer parity for all maps
    if UP.exists() and (UP / "maps").exists():
        for up in (UP / "maps").glob("*.asm"):
            rel = Path("maps") / up.name
            if (ROOT / rel).exists():
                try:
                    all_issues.extend(scan_vs_upstream_sdefer(rel))
                except Exception as e:
                    all_issues.append(("SCAN_ERR", str(rel), 0, str(e)))
    # dedupe
    seen = set()
    uniq = []
    for it in all_issues:
        key = (it[0], it[1], it[2], it[3])
        if key not in seen:
            seen.add(key)
            uniq.append(it)
    all_issues = uniq

    by = defaultdict(list)
    for kind, rel, line, msg in all_issues:
        by[kind].append((rel, line, msg))

    out_lines = [
        "# Deep script/text bug scan",
        "",
        f"Scanned **{file_count}** asm files under maps/data/engine/home/mobile/audio.",
        f"**Total unique issues: {len(all_issues)}**",
        "",
    ]
    print(f"files={file_count} issues={len(all_issues)}")
    for kind in sorted(by.keys()):
        items = by[kind]
        out_lines.append(f"## {kind} ({len(items)})")
        print(f"{kind}: {len(items)}")
        for rel, line, msg in items[:300]:
            out_lines.append(f"- `{rel}:{line}` — {msg}")
            if len(items) <= 80:
                print(f"  {rel}:{line} {msg}")
        if len(items) > 300:
            out_lines.append(f"- ... +{len(items)-300}")
        out_lines.append("")

    OUT.write_text("\n".join(out_lines) + "\n", encoding="utf-8")
    print("wrote", OUT)

    # summary counts for critical
    crit = sum(
        len(by[k])
        for k in by
        if k
        in (
            "DONE_BEFORE_DYNAMIC",
            "PROMPT_BEFORE_DYNAMIC",
            "MISSING_SDEFER",
            "UPSTREAM_SDEFER_MISSING",
            "WRITETHIS_DONE_DYNAMIC",
            "DOUBLE_DONE",
            "ORPHAN_AFTER_END",
            "HANGING_DYNAMIC_NO_DONE",
        )
    )
    print("CRITICAL_SUM", crit)
    return len(all_issues)


if __name__ == "__main__":
    raise SystemExit(0 if main() == 0 else 0)  # always 0; report is the result
