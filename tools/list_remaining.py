#!/usr/bin/env python3
"""List map files that still need translation work."""
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
data = json.loads((ROOT / "translation_progress.json").read_text(encoding="utf-8"))
files = data["files"]

open_f = sorted([f for f in files if f["status"] == "open"], key=lambda x: (-x["eng_lines"], x["file"]))
partial_f = sorted([f for f in files if f["status"] == "partial"], key=lambda x: (-x["eng_lines"], x["file"]))

print(f"OFFEN: {len(open_f)} Dateien, {sum(f['eng_lines'] for f in open_f)} EN-Zeilen")
print(f"TEILWEISE: {len(partial_f)} Dateien, {sum(f['eng_lines'] for f in partial_f)} EN-Zeilen")
print()

for label, group in [("OFFEN", open_f), ("TEILWEISE", partial_f)]:
    print(f"=== {label} ===")
    ref_group = [f for f in group if f["ref_available"]]
    pc_group = [f for f in group if not f["ref_available"]]
    for sublabel, sub in [("Mit DE-Referenz (port_map_text.py)", ref_group), ("PC-only / manuell", pc_group)]:
        if not sub:
            continue
        print(f"\n--- {sublabel} ({len(sub)}) ---")
        for f in sub:
            print(f"  maps/{f['file']:<42} {f['eng_lines']:3} EN")
    print()