#!/usr/bin/env python3
"""Audit ROM size and overflow banks."""
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent


def audit_map(path: Path) -> None:
    m = path.read_text(encoding="utf-8", errors="replace")
    for line in m.splitlines()[:8]:
        if "ROM0:" in line or "ROMX:" in line:
            print(line)
    for bank in range(125, 132):
        key = f"ROMX bank #{bank}:"
        idx = m.find(key)
        if idx < 0:
            continue
        end = m.find("ROMX bank #", idx + 10)
        if end < 0:
            end = m.find("SRAM bank", idx)
        chunk = m[idx:end]
        secs = re.findall(r'SECTION: \$([0-9a-f]+)-\$([0-9a-f]+)', chunk)
        total = sum(int(e, 16) - int(s, 16) + 1 for s, e in secs)
        blocks = re.findall(r'\["([^"]*BlockData[^"]*)"\]', chunk)
        print(f"Bank {bank}: {len(secs)} sections, ~{total} B, BlockData: {len(blocks)}")


def audit_rom(path: Path) -> None:
    data = path.read_bytes()
    last = max(i for i, v in enumerate(data) if v != 0xFF)
    print(f"\n{path.name}: last used {hex(last)} (+{last - 0x200000} past 2MB)")


if __name__ == "__main__":
    audit_map(ROOT / "polishedcrystal-3.2.3.map")
    for name in ["polishedcrystal-3.2.3.gbc", "polishedcrystal-3.2.3-FEHLER.gbc"]:
        p = ROOT / name
        if p.exists():
            audit_rom(p)