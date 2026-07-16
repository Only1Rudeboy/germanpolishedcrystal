# -*- coding: utf-8 -*-
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[1]


def main():
    files = (
        list((ROOT / "maps").rglob("*.asm"))
        + list((ROOT / "data" / "text").rglob("*.asm"))
        + list((ROOT / "data" / "phone").rglob("*.asm"))
    )

    print("=== mid-@ inside string (not terminator) ===")
    mid = []
    for f in files:
        t = f.read_text(encoding="utf-8", errors="replace")
        for i, line in enumerate(t.splitlines(), 1):
            if '"' not in line:
                continue
            for m in re.finditer(r'"([^"\\]*(?:\\.[^"\\]*)*)"', line):
                s = m.group(1)
                if re.search(r"@.", s):
                    mid.append(f"{f.relative_to(ROOT)}:{i}: {line.strip()[:100]}")
    for x in mid[:40]:
        print(x)
    print(f"total mid-@: {len(mid)}")

    print("\n=== cont then line (after optional text_ram/text) ===")
    pat = re.compile(
        r"^\s*cont\b.*\n(?:\s*;.*\n)*(?:\s*text_ram.*\n)*(?:\s*text\b.*\n)*\s*line\b",
        re.M,
    )
    hits = []
    for f in files:
        t = f.read_text(encoding="utf-8", errors="replace")
        for m in pat.finditer(t):
            ln = t[: m.start()].count("\n") + 1
            sn = m.group(0).replace("\n", " | ")[:110]
            hits.append(f"{f.relative_to(ROOT)}:{ln}: {sn}")
    for x in hits:
        print(x)
    print(f"total cont+line: {len(hits)}")

    print("\n=== steckte / erhält multi-line candidates ===")
    for f in files:
        t = f.read_text(encoding="utf-8", errors="replace")
        if "steckte" not in t and "erhält" not in t:
            continue
        lines = t.splitlines()
        for i, line in enumerate(lines):
            if "steckte" in line or ("erhält" in line and "text" in line):
                ctx = "\n".join(lines[i : i + 8])
                if ctx.count("line ") >= 3 or (
                    'line ""' in ctx and ctx.count("line ") >= 2
                ):
                    print(f"{f.relative_to(ROOT)}:{i+1}")
                    print(ctx)
                    print("---")


if __name__ == "__main__":
    main()
