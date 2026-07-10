#!/usr/bin/env python3
import pathlib
from collections import deque

MAX = 18
N = 6


def hyphen_splits(word):
    if len(word) <= MAX:
        return [(word, "")]
    out = []
    for cut in range(MAX - 1, 2, -1):
        if word[cut - 1] in "aeiouäöüAEIOUÄÖÜ":
            out.append((word[:cut] + "-", word[cut:]))
    if not out:
        out.append((word[: MAX - 1] + "-", word[MAX - 1 :]))
    return out


def solve(text):
    words = text.split()

    def expand(idx):
        """Yield (next_idx, piece) including hyphen pieces."""
        if idx >= len(words):
            return
        w = words[idx]
        if len(w) <= MAX:
            yield idx + 1, w
        else:
            for left, right in hyphen_splits(w):
                if right:
                    # push right as next pseudo-word by recursion in search state
                    yield idx, left  # left ends line; right handled separately
                else:
                    yield idx + 1, left

    # state: word_i, cur_line, lines_tuple
    q = deque([(0, "", ())])
    seen = set()
    while q:
        wi, cur, lines = q.popleft()
        if len(lines) > N:
            continue
        key = (wi, cur, lines)
        if key in seen:
            continue
        seen.add(key)

        if wi == len(words) and not cur:
            if len(lines) == N:
                return list(lines)
            if len(lines) < N:
                pad = lines + ("",) * (N - len(lines))
                return list(pad[:N])
            continue

        if wi == len(words):
            if cur and len(cur) <= MAX and len(lines) == N - 1:
                return list(lines + (cur,))
            continue

        w = words[wi]

        # try placing word (or piece) on current line
        pieces = [w] if len(w) <= MAX else [p[0] for p in hyphen_splits(w)]
        for pi, piece in enumerate(pieces):
            trial = f"{cur} {piece}".strip() if cur else piece
            if len(trial) <= MAX:
                if len(piece) < len(w) or piece.endswith("-"):
                    # hyphenated chunk ends line
                    nl = lines + (trial,) if trial else lines
                    if piece.endswith("-"):
                        rest = w[len(piece.rstrip("-")) :]
                        nwords = words[:wi] + [rest] + words[wi + 1 :]
                        # restart with modified words - messy
                        pass
                    else:
                        q.append((wi + 1, "", nl))
                else:
                    q.append((wi + 1, trial, lines))

        # newline before word
        if cur and len(cur) <= MAX:
            q.append((wi, w, lines + (cur,)))

    # DFS with word list mutation for hyphenation
    def dfs(wlist, ln, cur, acc):
        if ln == N:
            if not wlist and not cur:
                return acc
            return None
        if not wlist:
            if cur and ln == N - 1 and len(cur) <= MAX:
                return acc + [cur]
            return None

        w = wlist[0]
        trial = f"{cur} {w}".strip() if cur else w
        if len(trial) <= MAX:
            r = dfs(wlist[1:], ln, trial, acc)
            if r:
                return r
        if cur and len(cur) <= MAX:
            r = dfs(wlist, ln + 1, w, acc + [cur])
            if r:
                return r
        if not cur and len(w) > MAX:
            for left, right in hyphen_splits(w):
                if len(left) > MAX:
                    continue
                nxt = ([right] + wlist[1:]) if right else wlist[1:]
                r = dfs(nxt, ln + 1, left, acc)
                if r:
                    return r
        return None

    return dfs(words, 0, "", [])


ns = {}
exec((pathlib.Path(__file__).parent / "dex_de_text.py").read_text(encoding="utf-8"), ns)
for k in list(ns["TEXT"].keys())[:18]:
    t = ns["TEXT"][k]
    r = solve(t)
    print(k, len(t), r)
    if r:
        for i, l in enumerate(r):
            bad = " BAD" if len(l) > MAX else ""
            print(f"  {i}: {len(l):2d} {l!r}{bad}")
    print()