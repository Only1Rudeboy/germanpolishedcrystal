# -*- coding: utf-8 -*-
"""Batch 5: Polished-exclusive + remaining maps — thorough EN/width scan."""
from pathlib import Path
import re
from collections import defaultdict

ROOT = Path(__file__).resolve().parents[2]
MAPS = ROOT / "maps"
OUT = Path(__file__).resolve().parent

EN_RE = re.compile(
    r"\b(I'm|I'll|I've|don't|can't|won't|it's|that's|there's|you're|we're|they're|"
    r"Hello|Welcome|Thank you|Thanks|Please|Sorry|Excuse me|"
    r"found a|received a|Really\?|Something|Everyone|Everything|"
    r"because|always|never|maybe|already|however|although|"
    r"Research Center|PROF\.SILKTREE|It's a photo|"
    r"\bThe\b|\bYou\b|\bYour\b|\bThis is\b|\bThat is\b)\b",
    re.I,
)
# Stronger: English-only phrases common in leftover polish
EN_EXTRA = re.compile(
    r"\b(Battle Tower|Battle Factory|Wonder Trade|Gym Leader|"
    r"Poke Center|Poké Center|Itemfinder|Great Ball|Ultra Ball|"
    r"Master Ball|Potion|Super Potion|Full Restore|"
    r"coming soon|work in progress|placeholder|TODO)\b",
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
    r"dieser|diese|über|unter|man|mir|dir|ihm|uns|euch|dich|sich|hallo|willkommen|"
    r"danke|bitte|entschuldigung|kampf|turm|fabrik|insel|hotel|strand)\b",
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
        for x in (OUT / "_batch5_maps.txt").read_text(encoding="utf-8").splitlines()
        if x.strip()
    ]
    en_hits = []
    width_issues = []
    arena_form = []
    sign_blocks = []
    stats = defaultdict(int)

    for name in batch:
        path = MAPS / f"{name}.asm"
        if not path.exists():
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
                width_issues.append((name, i, disp_len(s), s[:100]))
            # EN detection
            if re.search(r"[äöüÄÖÜß]", s):
                continue
            if DE_HINT.search(s):
                # still flag strong EN mixed
                if EN_EXTRA.search(s) and re.search(r"\b(the|you|your|don't|can't|hello|welcome)\b", s, re.I):
                    en_hits.append((name, i, s[:100], "mixed"))
                continue
            if EN_PURE.search(s) or EN_RE.search(s) or EN_EXTRA.search(s):
                en_hits.append((name, i, s[:100], "en"))

        for sm in re.finditer(r"^(\w*Sign\w*):\s*$", t, re.M):
            rest = t[sm.end() :]
            bm = re.search(r"(.*?)\n\tdone", rest, re.S)
            if bm:
                flat = re.sub(r"\s+", " ", bm.group(1)).strip()
                sign_blocks.append((name, sm.group(1), flat[:140]))
                stats["signs"] += 1

    lines = [
        "# Batch 5 Report — Polished-exclusive + remaining",
        "",
        f"## Scope: {len(batch)} maps",
        f"- Strings: {stats['strings']}",
        f"- Signs: {stats['signs']}",
        f"- EN: {len(en_hits)}",
        f"- Width>18: {len(width_issues)}",
        f"- #mon-ARENA leftovers: {len(arena_form)}",
        "",
        "## EN hits (all)",
    ]
    for h in en_hits:
        lines.append(f"- {h[0]}:{h[1]} [{h[3]}] {h[2]}")
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
    lines += ["", "## Signs"]
    for n, lab, flat in sign_blocks:
        lines.append(f"- {n}.{lab}: {flat}")

    report = OUT / "_batch5_report.md"
    report.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(f"maps={stats['maps']} en={len(en_hits)} width={len(width_issues)} signs={stats['signs']}")
    for h in en_hits:
        print("EN", h[0], h[1], h[2])
    for w in width_issues:
        print("W", w[0], w[1], w[2], w[3])
    print("wrote", report)


if __name__ == "__main__":
    main()
