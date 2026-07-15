# -*- coding: utf-8 -*-
"""Batch 4: Kanto routes 1–28 + remaining Kanto gates/houses — thorough scan."""
from pathlib import Path
import re
from collections import defaultdict

ROOT = Path(__file__).resolve().parents[2]
MAPS = ROOT / "maps"
OUT = Path(__file__).resolve().parent
CRYSTAL = ROOT / "tools" / "_gsc_de_crystal_msg.txt"

EN_RE = re.compile(
    r"\b(I'm|I'll|I've|don't|can't|won't|it's|that's|there's|you're|we're|they're|"
    r"Hello|Welcome|Thank you|Thanks|Please|Sorry|Excuse|"
    r"found a|received a|Really\?|Something|Everyone|Everything|"
    r"because|always|never|maybe|already|however|although|"
    r"Research Center|PROF\.SILKTREE|It's a photo)\b",
    re.I,
)
EN_PURE = re.compile(
    r"^(It's|It is|You |Your |The |This |That |I |I'm |Hello|Welcome|Thank|Please|Sorry|Found |Received )",
    re.I,
)
DE_HINT = re.compile(
    r"\b(ich|du|der|die|das|und|nicht|ein|eine|ist|sind|mit|von|für|auf|auch|was|wie|"
    r"wir|ihr|sie|mein|dein|hier|dort|noch|schon|aber|oder|wenn|denn|dass|sehr|mehr|"
    r"nur|zum|zur|bei|nach|kann|muss|soll|will|habe|hast|hat|den|dem|des|kein|alle|"
    r"dieser|diese|über|unter|man|mir|dir|ihm|uns|euch|dich|sich|route|stadt)\b",
    re.I,
)


def disp_len(s: str) -> int:
    s = s[:-1] if s.endswith("@") else s
    s = s.replace("#mon", "XXXXXXX").replace("#MON", "XXXXXXX")
    s = re.sub(r"<PLAYER>", "X" * 7, s)
    s = re.sub(r"<PLAY_G>", "X" * 7, s)
    s = re.sub(r"<RIVAL>", "X" * 7, s)
    s = re.sub(r"<LV>", "99", s)
    s = re.sub(r"<PK><MN>", "XXXX", s)
    s = re.sub(r"<PKMN>", "XXXX", s)
    s = re.sub(r"\{d:[^}]+\}", "99", s)
    s = re.sub(r"<[^>]+>", "X", s)
    return len(s)


def main():
    batch = [
        x.strip()
        for x in (OUT / "_batch4_maps.txt").read_text(encoding="utf-8").splitlines()
        if x.strip()
    ]
    crystal = CRYSTAL.read_text(encoding="utf-8") if CRYSTAL.exists() else ""

    # GSC route sign snippets from dump (ROUTE N often appears)
    gsc_route_hits = {}
    for n in range(1, 29):
        key = f"ROUTE {n}"
        gsc_route_hits[key] = key in crystal

    en_hits = []
    width_issues = []
    arena_form = []
    sign_blocks = []
    route_sign_checks = []
    stats = defaultdict(int)

    for name in batch:
        path = MAPS / f"{name}.asm"
        if not path.exists():
            route_sign_checks.append((name, "MISSING_FILE"))
            continue
        t = path.read_text(encoding="utf-8")
        stats["maps"] += 1
        stats["strings"] += len(
            re.findall(r'(?:text|line|cont|para|next|page)\s+"([^"]*)"', t)
        )
        if "#mon-ARENA" in t or "#MON-ARENA" in t:
            arena_form.append(name)

        for i, line in enumerate(t.splitlines(), 1):
            m = re.search(r'(?:text|line|cont|para|next|page)\s+"([^"]*)"', line)
            if not m:
                continue
            s = m.group(1)
            if not s:
                continue
            if disp_len(s) > 18:
                width_issues.append((name, i, disp_len(s), s[:90]))
            if re.search(r"[äöüÄÖÜß]", s):
                continue
            if DE_HINT.search(s):
                continue
            if EN_PURE.search(s) or EN_RE.search(s):
                en_hits.append((name, i, s[:100]))

        # all signs
        for sm in re.finditer(r"^(\w*Sign\w*):\s*$", t, re.M):
            label = sm.group(1)
            rest = t[sm.end() :]
            bm = re.search(r"(.*?)\n\tdone", rest, re.S)
            if not bm:
                continue
            block = bm.group(1)
            flat = re.sub(r"\s+", " ", block).strip()
            sign_blocks.append((name, label, flat[:140]))
            stats["signs"] += 1

        # Route number sign presence for RouteN maps
        mm = re.match(r"Route(\d+)", name)
        if mm:
            num = int(mm.group(1))
            if 1 <= num <= 28:
                # main sign often "ROUTE N" or "Route N"
                has = (f"ROUTE {num}" in t) or (f"Route {num}" in t)
                # also check city connectors GSC style
                route_sign_checks.append(
                    (name, "HAS_ROUTE_SIGN" if has else "NO_ROUTE_SIGN", num)
                )

    # Key GSC place names that should appear on certain routes
    landmark_checks = [
        ("Route1", ["ROUTE 1", "ALABASTIA", "VERTANIA"]),
        ("Route2North", ["ROUTE 2", "VERTANIA", "MARMORIA"]),
        ("Route2South", ["ROUTE 2"]),
        ("Route3", ["ROUTE 3", "MARMORIA", "MONDBERG"]),
        ("Route4", ["ROUTE 4", "AZURIA", "MONDBERG"]),
        ("Route5", ["ROUTE 5", "SAFFRONIA", "AZURIA"]),
        ("Route6", ["ROUTE 6", "ORANIA", "SAFFRONIA"]),
        ("Route7", ["ROUTE 7", "PRISMANIA", "SAFFRONIA"]),
        ("Route8", ["ROUTE 8", "LAVANDIA", "SAFFRONIA"]),
        ("Route9", ["ROUTE 9", "AZURIA"]),
        ("Route10North", ["ROUTE 10"]),
        ("Route10South", ["ROUTE 10"]),
        ("Route11", ["ROUTE 11", "ORANIA"]),
        ("Route12North", ["ROUTE 12"]),
        ("Route12South", ["ROUTE 12"]),
        ("Route13", ["ROUTE 13"]),
        ("Route14", ["ROUTE 14"]),
        ("Route15", ["ROUTE 15", "FUCHSANIA"]),
        ("Route16East", ["ROUTE 16"]),
        ("Route16West", ["ROUTE 16"]),
        ("Route17North", ["ROUTE 17", "RADWEG"]),
        ("Route17South", ["ROUTE 17"]),
        ("Route18East", ["ROUTE 18", "FUCHSANIA"]),
        ("Route18West", ["ROUTE 18"]),
        ("Route19", ["ROUTE 19"]),
        ("Route20", ["ROUTE 20"]),
        ("Route21", ["ROUTE 21", "ALABASTIA", "ZINNOBER"]),
        ("Route22", ["ROUTE 22", "VERTANIA"]),
        ("Route24", ["ROUTE 24", "AZURIA"]),
        ("Route25", ["ROUTE 25"]),
        ("Route26", ["ROUTE 26"]),
        ("Route27", ["ROUTE 27"]),
        ("Route28", ["ROUTE 28"]),
    ]
    landmark_results = []
    for mapname, keys in landmark_checks:
        # resolve actual file
        candidates = [mapname]
        if not (MAPS / f"{mapname}.asm").exists():
            candidates = [p.stem for p in MAPS.glob(f"{mapname}*.asm")]
        if not candidates:
            landmark_results.append((mapname, "MISSING", keys))
            continue
        path = MAPS / f"{candidates[0]}.asm"
        t = path.read_text(encoding="utf-8")
        # at least ROUTE number or first key
        found = [k for k in keys if k in t]
        miss = [k for k in keys if k not in t]
        # soft: only require ROUTE N present
        route_key = keys[0]
        status = "MATCH" if route_key in t else "DRIFT"
        landmark_results.append((path.stem, status, found, miss))

    lines = [
        "# Batch 4 Report — Kanto Routes + remaining gates",
        "",
        f"## Scope: {len(batch)} maps (Kanto routes 1–28 focus; dungeons mostly Batch 3)",
        f"- EN: {len(en_hits)}",
        f"- Width>18: {len(width_issues)}",
        f"- #mon-ARENA leftovers: {len(arena_form)}",
        f"- Sign labels: {stats['signs']}",
        f"- Strings: {stats['strings']}",
        "",
        "## Route sign presence",
    ]
    for r in route_sign_checks:
        lines.append(f"- {r}")
    lines += ["", "## Landmark / GSC name checks"]
    for r in landmark_results:
        lines.append(f"- {r}")
    lines += ["", "## EN hits (all)"]
    for h in en_hits:
        lines.append(f"- {h[0]}:{h[1]} {h[2]}")
    if not en_hits:
        lines.append("- (none)")
    lines += ["", "## Width issues (all)"]
    for w in width_issues:
        lines.append(f"- {w[0]}:{w[1]} L={w[2]} {w[3]!r}")
    if not width_issues:
        lines.append("- (none)")
    lines += ["", "## Arena leftovers"]
    for a in arena_form:
        lines.append(f"- {a}")
    if not arena_form:
        lines.append("- (none)")
    lines += ["", "## All sign blocks"]
    for name, label, flat in sign_blocks:
        lines.append(f"- {name}.{label}: {flat}")

    report = OUT / "_batch4_report.md"
    report.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(f"maps={stats['maps']} en={len(en_hits)} width={len(width_issues)} signs={stats['signs']}")
    for h in en_hits:
        print("EN", h[0], h[1], h[2])
    for w in width_issues:
        print("W", w[0], w[1], w[2], w[3])
    for r in landmark_results:
        if r[1] != "MATCH":
            print("LM", r)
    nosign = [r for r in route_sign_checks if r[1] == "NO_ROUTE_SIGN"]
    print("NO_ROUTE_SIGN count", len(nosign))
    for r in nosign:
        print(" ", r)
    print("wrote", report)


if __name__ == "__main__":
    main()
