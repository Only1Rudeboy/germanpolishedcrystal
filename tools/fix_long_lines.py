#!/usr/bin/env python3
"""Split map dialog lines that exceed safe on-screen display width."""
import pathlib
import re
import sys

MAX = 16  # DE textbox: 18 tiles; 17 clips in-game — 16 is safe with # tokens
VOWELS = "aeiouäöüAEIOUÄÖÜ"
ROOT = pathlib.Path(__file__).parent.parent
SKIP = {"data/credits_strings.asm"}
SCAN_DIRS = ("maps", "data", "text", "engine", "home")
PAT = re.compile(r'^(\s*)(text|line|cont|para|next|page)\s+"([^"]*)"\s*$')
PH = re.compile(r"\{d:[^}]+\}")
TOKEN_WIDTH = {
    "<PLAYER>": 7, "<RIVAL>": 7, "<ENEMY>": 7, "<USER>": 7, "<TARGET>": 7,
    "<STR_VAR1>": 8, "<STR_VAR2>": 8, "<STR_VAR3>": 8, "<ITEM>": 8, "<MOVE>": 8,
    "<POKE>": 4, "<PK><MN>": 2, "<PO><KE>": 2,
    "#mon": 4, "#MON": 4, "#dex": 4, "#DEX": 4,
    "#COM": 4, "#gear": 5, "#ball": 5, "#BÄLLE": 6,
}


def display_width(s: str) -> int:
    s = PH.sub("##", s).rstrip("@")
    w = 0
    i = 0
    while i < len(s):
        matched = False
        for tok, tw in sorted(TOKEN_WIDTH.items(), key=lambda x: -len(x[0])):
            if s[i : i + len(tok)] == tok:
                w += tw
                i += len(tok)
                matched = True
                break
        if not matched:
            w += 1
            i += 1
    return w


def max_fit_index(s: str) -> int:
    """Longest prefix index where display_width(s[:idx]) <= MAX."""
    best = 0
    for i in range(1, len(s) + 1):
        if display_width(s[:i]) <= MAX:
            best = i
        else:
            break
    return best


def next_kind(kind: str) -> str:
    if kind in ("text", "para"):
        return "line"
    return "cont"


def protect_placeholders(s: str) -> tuple[str, dict[str, str]]:
    """Replace {d:...} and <TAG> tokens with opaque placeholders."""
    mapping: dict[str, str] = {}

    def repl(m: re.Match) -> str:
        key = f"\x00PH{len(mapping)}\x00"
        mapping[key] = m.group(0)
        return key

    s = re.sub(r"\{d:[^}]+\}", repl, s)
    s = re.sub(r"<[A-Z0-9_]+>", repl, s)
    return s, mapping


def restore_placeholders(s: str, mapping: dict[str, str]) -> str:
    for key, val in mapping.items():
        s = s.replace(key, val)
    return s


def split_chunk(s: str) -> tuple[str, str]:
    """Return (first_part, remainder). first_part display width <= MAX."""
    if display_width(s) <= MAX:
        return s, ""

    split_at = max_fit_index(s)
    if split_at <= 0:
        split_at = 1

    window = s[:split_at]
    if " " in window:
        sp = window.rfind(" ")
        if sp > 0:
            return s[:sp], s[sp + 1 :]

    protected, ph_map = protect_placeholders(s)
    prot_split = max_fit_index(protected)
    if prot_split <= 0:
        prot_split = 1

    prot_window = protected[:prot_split]
    if " " not in protected[: prot_split + 3]:
        for cut in range(prot_split - 1, 2, -1):
            if protected[cut - 1] in VOWELS and "\x00" not in protected[max(0, cut - 5) : cut + 1]:
                first = restore_placeholders(protected[:cut] + "-", ph_map)
                rest = restore_placeholders(protected[cut:], ph_map)
                return first, rest
        cut = max(1, prot_split - 1)
        first = restore_placeholders(protected[:cut] + "-", ph_map)
        rest = restore_placeholders(protected[cut:], ph_map)
        return first, rest

    first = restore_placeholders(protected[:prot_split], ph_map)
    rest = restore_placeholders(protected[prot_split:].lstrip(), ph_map)
    return first, rest


def fix_file(path: pathlib.Path, dry_run: bool = False) -> int:
    lines = path.read_text(encoding="utf-8").splitlines(keepends=True)
    changed = 0
    i = 0
    while i < len(lines):
        m = PAT.match(lines[i].rstrip("\n"))
        if not m:
            i += 1
            continue
        indent, kind, text = m.group(1), m.group(2), m.group(3)
        core = text.rstrip("@")
        if display_width(core) <= MAX:
            i += 1
            continue

        first, rest = split_chunk(core)

        new_lines = []
        first_text = first + ("@" if text.endswith("@") and not rest else "")
        new_lines.append(f'{indent}{kind} "{first_text}"\n')

        overflow_kind = next_kind(kind)
        while rest:
            chunk, rest = split_chunk(rest)
            at = "@" if text.endswith("@") and not rest else ""
            new_lines.append(f'{indent}{overflow_kind} "{chunk}{at}"\n')
            overflow_kind = "cont"

        lines[i : i + 1] = new_lines
        changed += 1
        i += len(new_lines)

    if changed and not dry_run:
        path.write_text("".join(lines), encoding="utf-8", newline="\n")
    return changed


def main():
    dry = "--dry-run" in sys.argv
    total = 0
    files = 0
    if len(sys.argv) > 1 and not sys.argv[1].startswith("-"):
        targets = [ROOT / a for a in sys.argv[1:] if not a.startswith("-")]
    else:
        targets = []
        for sub in SCAN_DIRS:
            base = ROOT / sub
            if base.exists():
                targets.extend(sorted(base.rglob("*.asm")))
        targets = [p for p in targets if str(p.relative_to(ROOT)).replace("\\", "/") not in SKIP]
    for path in targets:
        n = fix_file(path, dry_run=dry)
        if n:
            files += 1
            total += n
            print(f"{path.name}: {n}")
    print(f"Fixed {total} lines in {files} files" + (" (dry run)" if dry else ""))


if __name__ == "__main__":
    main()