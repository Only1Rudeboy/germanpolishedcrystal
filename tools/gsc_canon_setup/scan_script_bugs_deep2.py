# -*- coding: utf-8 -*-
"""Even deeper: orphan .Script, if!DEF, scene parity, text_ram structure vs upstream."""
from pathlib import Path
from collections import defaultdict
import re

ROOT = Path(__file__).resolve().parents[2]
UP = ROOT / "_upstream_extract" / "polishedcrystal-master"
OUT = Path(__file__).resolve().parent / "_script_bugs_deep2_report.md"

SKIP = {"backup", "text_backup", "_upstream", "maps_backup"}


def skip(p: Path) -> bool:
    return any(x in str(p) for x in SKIP) or ".bak" in p.name


def main():
    issues = []

    # --- 1) .Script: without any sdefer .Script in file ---
    for p in (ROOT / "maps").glob("*.asm"):
        t = p.read_text(encoding="utf-8", errors="replace")
        if re.search(r"^\.Script:\s*$", t, re.M):
            if "sdefer .Script" not in t and "sdefer .Script" not in t.replace("\t", " "):
                # also allow sdefer .Script with spaces
                if not re.search(r"sdefer\s+\.Script", t):
                    issues.append(
                        ("ORPHAN_DOT_SCRIPT", p.name, 0, ".Script: exists but no sdefer .Script")
                    )

    # --- 2) if!DEF without space (preprocessor risk) ---
    for base in [ROOT / "maps", ROOT / "engine", ROOT / "data", ROOT / "home"]:
        if not base.exists():
            continue
        for p in base.rglob("*.asm"):
            if skip(p):
                continue
            for i, line in enumerate(p.read_text(encoding="utf-8", errors="replace").splitlines(), 1):
                if re.search(r"\bif!(DEF|DEBUG|FAITHFUL)", line):
                    issues.append(
                        ("IF_BANG_NOSPACE", str(p.relative_to(ROOT)), i, line.strip()[:80])
                    )

    # --- 3) Scene label that is only 'end' while upstream has more ---
    if UP.exists():
        for up in (UP / "maps").glob("*.asm"):
            loc = ROOT / "maps" / up.name
            if not loc.exists():
                continue
            ut = up.read_text(encoding="utf-8", errors="replace")
            lt = loc.read_text(encoding="utf-8", errors="replace")
            # scene_script X, SCENE
            for m in re.finditer(r"scene_script\s+(\w+)\s*,", ut):
                lab = m.group(1)
                if lab == "DoNothingScript":
                    continue
                # extract local label body until next top-level label
                mloc = re.search(rf"^{re.escape(lab)}:\n((?:(?!^[A-Za-z_]\w*:).*\n){{0,15}})", lt, re.M)
                mup = re.search(rf"^{re.escape(lab)}:\n((?:(?!^[A-Za-z_]\w*:).*\n){{0,15}})", ut, re.M)
                if not mloc or not mup:
                    continue
                lbody = mloc.group(1)
                ubody = mup.group(1)
                # local only end, upstream has sdefer or real cmds
                lcmds = [x.strip() for x in lbody.splitlines() if x.strip() and not x.strip().startswith(";")]
                ucmds = [x.strip() for x in ubody.splitlines() if x.strip() and not x.strip().startswith(";")]
                if lcmds == ["end"] and ucmds != ["end"] and any(
                    c.startswith("sdefer") or c not in ("end",) for c in ucmds
                ):
                    line = lt[: mloc.start()].count("\n") + 1
                    issues.append(
                        (
                            "SCENE_STUBBED",
                            f"maps/{up.name}",
                            line,
                            f"{lab}: local only end; upstream has {ucmds[:5]}",
                        )
                    )

    # --- 4) text_ram after text string without line/cont and without trailing space ---
    # (display glue risk) — report only maps+phone
    glue = []
    for base in [ROOT / "maps", ROOT / "data" / "phone" / "text"]:
        if not base.exists():
            continue
        for p in base.rglob("*.asm"):
            if skip(p):
                continue
            lines = p.read_text(encoding="utf-8", errors="replace").splitlines()
            for i in range(len(lines) - 1):
                m = re.match(r'^\s*(text|line|cont|para)\s+"(.*)"\s*$', lines[i])
                if not m:
                    continue
                s = m.group(2)
                j = i + 1
                while j < len(lines) and lines[j].strip() == "":
                    j += 1
                if j >= len(lines):
                    continue
                if re.match(r"^\s*text_ram\b", lines[j]):
                    if s and s[-1] not in " \t.!?…-–—/":
                        if re.search(r"[A-Za-z0-9äöüÄÖÜß>]$", s):
                            glue.append(
                                (
                                    "GLUE_NO_SPACE",
                                    str(p.relative_to(ROOT)),
                                    i + 1,
                                    f'"{s}" + text_ram',
                                )
                            )
    issues.extend(glue)

    # --- 5) done with nothing after text_ram hanging mid-paragraph (no done later in 15 lines) ---
    for base in [ROOT / "maps", ROOT / "data" / "phone" / "text"]:
        if not base.exists():
            continue
        for p in base.rglob("*.asm"):
            if skip(p):
                continue
            lines = p.read_text(encoding="utf-8", errors="replace").splitlines()
            for i, line in enumerate(lines):
                if not re.match(r"^\s*text_ram\b", line.strip()):
                    continue
                # look ahead 12 lines for done/prompt
                window = lines[i : i + 12]
                terminators = any(
                    x.strip() in ("done", "prompt") or x.strip().startswith("text_end")
                    for x in window
                )
                # if next non-empty is para/line continuing, OK even without immediate done
                # flag only if next top-level label appears before done
                found_term = False
                found_label = False
                for x in lines[i + 1 : i + 25]:
                    sx = x.strip()
                    if sx in ("done", "prompt") or sx.startswith("text_end"):
                        found_term = True
                        break
                    if re.match(r"^[A-Za-z_]\w*:\s*$", sx):
                        found_label = True
                        break
                if found_label and not found_term:
                    issues.append(
                        (
                            "TEXT_RAM_NO_TERMINATOR",
                            str(p.relative_to(ROOT)),
                            i + 1,
                            "text_ram then label before done/prompt",
                        )
                    )

    # --- 6) Compare text_ram count in matching map files (rough drift) ---
    if UP.exists():
        for up in (UP / "maps").glob("*.asm"):
            loc = ROOT / "maps" / up.name
            if not loc.exists():
                continue
            ut = up.read_text(encoding="utf-8", errors="replace")
            lt = loc.read_text(encoding="utf-8", errors="replace")
            uc = len(re.findall(r"\btext_ram\b", ut))
            lc = len(re.findall(r"\btext_ram\b", lt))
            if uc > 0 and lc < uc:
                issues.append(
                    (
                        "TEXT_RAM_COUNT_DROP",
                        f"maps/{up.name}",
                        0,
                        f"upstream text_ram={uc} local={lc}",
                    )
                )
            ud = len(re.findall(r"\btext_decimal\b", ut))
            ld = len(re.findall(r"\btext_decimal\b", lt))
            if ud > 0 and ld < ud:
                issues.append(
                    (
                        "TEXT_DECIMAL_COUNT_DROP",
                        f"maps/{up.name}",
                        0,
                        f"upstream text_decimal={ud} local={ld}",
                    )
                )

    # --- 7) getmonname without following writetext containing text_ram nearby ---
    # soft: getmonname X, STRING_BUFFER_N then writetext should use that buffer
    for p in (ROOT / "maps").glob("*.asm"):
        lines = p.read_text(encoding="utf-8", errors="replace").splitlines()
        for i, line in enumerate(lines):
            m = re.search(r"getmonname\s+\w+\s*,\s*(STRING_BUFFER_\d+)", line)
            if not m:
                continue
            buf = m.group(1)
            # find next writetext within 8 lines
            for j in range(i + 1, min(i + 10, len(lines))):
                wm = re.search(r"writetext\s+(\w+)", lines[j])
                if wm:
                    # look up that text label for text_ram wStringBufferN
                    lab = wm.group(1)
                    # map STRING_BUFFER_3 -> wStringBuffer3
                    wbuf = "w" + buf.replace("STRING_", "String").replace(
                        "BUFFER_", "Buffer"
                    )
                    # actually STRING_BUFFER_3 -> wStringBuffer3
                    num = buf.split("_")[-1]
                    wbuf = f"wStringBuffer{num}"
                    # find label body
                    body_m = re.search(
                        rf"^{lab}:\n((?:(?!^[A-Za-z_]\w*:).*\n){{0,20}})",
                        "\n".join(lines) + "\n",
                        re.M,
                    )
                    if body_m and wbuf not in body_m.group(1) and "text_ram" not in body_m.group(1):
                        issues.append(
                            (
                                "GETMONNAME_UNUSED",
                                f"maps/{p.name}",
                                i + 1,
                                f"getmonname {buf} then {lab} has no text_ram",
                            )
                        )
                    break

    # dedupe
    seen = set()
    uniq = []
    for it in issues:
        if it not in seen:
            seen.add(it)
            uniq.append(it)

    by = defaultdict(list)
    for kind, rel, line, msg in uniq:
        by[kind].append((rel, line, msg))

    out = [
        "# Deep scan pass 2",
        "",
        f"**Total: {len(uniq)}**",
        "",
    ]
    print(f"TOTAL {len(uniq)}")
    for kind in sorted(by.keys()):
        items = by[kind]
        out.append(f"## {kind} ({len(items)})")
        print(f"{kind}: {len(items)}")
        for rel, line, msg in items[:150]:
            out.append(f"- `{rel}:{line}` — {msg}")
            if len(items) <= 60:
                print(f"  {rel}:{line} {msg}")
        if len(items) > 150:
            out.append(f"- ... +{len(items)-150}")
        out.append("")

    OUT.write_text("\n".join(out) + "\n", encoding="utf-8")
    print("wrote", OUT)
    return uniq


if __name__ == "__main__":
    main()
