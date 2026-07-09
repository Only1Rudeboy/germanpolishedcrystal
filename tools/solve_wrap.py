#!/usr/bin/env python3
import pathlib

MAX = 18
N = 6

def vowel_cuts(word):
    if len(word) <= MAX:
        return [(word, "")]
    out = []
    for cut in range(MAX - 1, 2, -1):
        if word[cut - 1] in "aeiouäöüAEIOUÄÖÜ":
            out.append((word[:cut] + "-", word[cut:]))
    if not out:
        out.append((word[: MAX - 1] + "-", word[MAX - 1 :]))
    return out


def solve_tokens(tokens, line_idx=0, cur="", acc=None):
    if acc is None:
        acc = []
    if line_idx == N:
        return acc if not tokens and not cur else None
    if not tokens:
        if cur:
            if line_idx == N - 1 and len(cur) <= MAX:
                out = acc + [cur]
                while len(out) < N:
                    out.append("")
                return out[:N]
        elif line_idx <= N:
            out = acc[:]
            while len(out) < N:
                out.append("")
            return out[:N]
        return None

    tok = tokens[0]
    rest = tokens[1:]

    # whole token fits on current line
    trial = f"{cur} {tok}".strip() if cur else tok
    if len(trial) <= MAX:
        r = solve_tokens(rest, line_idx, trial, acc)
        if r:
            return r

    # commit current line, start token on next
    if cur and len(cur) <= MAX:
        r = solve_tokens(tokens, line_idx + 1, tok, acc + [cur])
        if r:
            return r

    # hyphenate token at line start
    if not cur and len(tok) > MAX:
        for left, right in vowel_cuts(tok):
            if len(left) > MAX:
                continue
            nxt = ([right] + rest) if right else rest
            r = solve_tokens(nxt, line_idx + 1, left, acc)
            if r:
                return r

    return None


def wrap(text):
    return solve_tokens(text.split())


ns = {}
exec((pathlib.Path(__file__).parent / "dex_de_text.py").read_text(encoding="utf-8"), ns)
for k in list(ns["TEXT"].keys())[:18]:
    r = wrap(ns["TEXT"][k])
    print("===", k, "===")
    if not r:
        print("FAILED", ns["TEXT"][k])
    else:
        joined = " ".join(x.replace("-", "") for x in r if x).replace("  ", " ")
        # verify content
        src = ns["TEXT"][k]
        for i, l in enumerate(r):
            print(f"{i}: {len(l):2d} {l}")
    print()