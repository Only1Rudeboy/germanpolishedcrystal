#!/usr/bin/env python3
"""Print translation progress bar for the user."""
import json
from pathlib import Path

p = Path(__file__).resolve().parent.parent / "translation_progress.json"
d = json.loads(p.read_text(encoding="utf-8"))

def bar(n, total, w=32):
    pct = n / total if total else 0
    f = int(w * pct)
    return f"[{'█' * f}{'░' * (w - f)}] {pct * 100:5.1f}%"

print("═" * 40)
print("  POLISHED CRYSTAL DE — ÜBERSETZUNG")
print("═" * 40)
print()
print("Maps komplett:")
print(" ", bar(d["maps_done"], d["maps_total"]))
print(f"  {d['maps_done']} / {d['maps_total']}  (+ {d['maps_partial']} teilweise, {d['maps_open']} offen)")
print()
print("Dialogzeilen:")
print(" ", bar(d["dialogue_lines_translated_est"], d["dialogue_lines_total"]))
print(f"  ~{d['dialogue_lines_translated_est']} / {d['dialogue_lines_total']}  (~{d['english_lines_remaining']} EN übrig)")
print()
open_files = sorted(
    [f for f in d["files"] if f["status"] == "open" and f["eng_lines"] > 0],
    key=lambda x: -x["eng_lines"],
)[:12]
if open_files:
    print("Größte offene Maps:")
    for f in open_files:
        ref = " [DE-Ref]" if f["ref_available"] else " [PC-only]"
        print(f"  • {f['file']}: {f['eng_lines']} EN-Zeilen{ref}")
print("═" * 40)