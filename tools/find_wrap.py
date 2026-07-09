#!/usr/bin/env python3
import pathlib

MAX = 18
N = 6

def expand_words(text):
    """Expand into tokens; long words become hyphenated pieces."""
    tokens = []
    for word in text.split():
        if len(word) <= MAX:
            tokens.append(word)
        else:
            w = word
            while len(w) > MAX:
                cut = MAX - 1
                while cut > 2 and w[cut - 1] not in "aeiouäöüAEIOUÄÖÜ":
                    cut -= 1
                tokens.append(w[:cut] + "-")
                w = w[cut:]
            if w:
                tokens.append(w)
    return tokens


def pack(tokens):
    lines = []
    cur = ""
    for tok in tokens:
        trial = f"{cur} {tok}".strip() if cur else tok
        if len(trial) <= MAX:
            cur = trial
        else:
            lines.append(cur)
            cur = tok
    if cur:
        lines.append(cur)
    return lines


def search_lines(text, depth=0):
    words = text.split()
    memo = {}

    def rec(idx, line_no, cur, acc):
        key = (idx, line_no, cur)
        if key in memo:
            return memo[key]
        if line_no == N:
            if idx == len(words) and not cur:
                return acc
            return None
        if idx == len(words):
            if cur and line_no == N - 1 and len(cur) <= MAX:
                return acc + [cur]
            return None

        results = []
        word = words[idx]

        # extend current line with full word
        trial = f"{cur} {word}".strip() if cur else word
        if len(trial) <= MAX:
            r = rec(idx + 1, line_no, trial, acc)
            if r is not None:
                results.append(r)

        # commit line, start word on next
        if cur and len(cur) <= MAX:
            r = rec(idx, line_no + 1, word, acc + [cur])
            if r is not None:
                results.append(r)

        # hyphenate word when starting line
        if not cur and len(word) > MAX:
            for cut in range(MAX - 1, 2, -1):
                if word[cut - 1] in "aeiouäöüAEIOUÄÖÜ" or cut == MAX - 1:
                    left = word[:cut] + "-"
                    right = word[cut:]
                    if len(left) <= MAX:
                        nwords = ([right] if right else []) + words[idx + 1 :]
                        # recurse with modified word list - use index into modified
                        pass

        memo[key] = results[0] if results else None
        return memo[key]

    # brute: generate all partitions of words into <=6 groups with hyphenation
    from functools import lru_cache

    @lru_cache(maxsize=None)
    def dfs(wi, ln, cur):
        if ln == N:
            if wi == len(words) and not cur:
                return tuple()
            return None
        if wi == len(words):
            if cur and ln == N - 1 and len(cur) <= MAX:
                return (cur,)
            return None

        word = words[wi]
        out = []

        trial = f"{cur} {word}".strip() if cur else word
        if len(trial) <= MAX:
            r = dfs(wi + 1, ln, trial)
            if r is not None:
                out.append(r)

        if cur and len(cur) <= MAX:
            r = dfs(wi, ln + 1, word)
            if r is not None:
                out.append((cur,) + r)

        if not cur:
            if len(word) <= MAX:
                r = dfs(wi + 1, ln, word)
                if r is not None:
                    out.append(r)
            else:
                for cut in range(MAX - 1, 2, -1):
                    if word[cut - 1] in "aeiouäöüAEIOUÄÖÜ" or cut == MAX - 1:
                        left = word[:cut] + "-"
                        right = word[cut:]
                        if len(left) > MAX:
                            continue
                        if right:
                            new_words = words[:wi] + (right,) + words[wi + 1 :]
                            # can't easily change words in lru_cache dfs
                            break

        return out[0] if out else None

    # iterative deepening over hyphen positions - simpler: try all 6-line templates via recursion on char string
    s = text

    @lru_cache(maxsize=None)
    def split_at(pos, lines_left):
        if lines_left == 1:
            chunk = s[pos:].strip()
            if 0 < len(chunk) <= MAX:
                return (chunk,)
            if len(chunk) == 0:
                return ("",)
            return None
        if pos >= len(s):
            return None
        best = None
        # try end positions
        for end in range(pos + 1, min(pos + MAX + 1, len(s) + 1)):
            chunk = s[pos:end]
            if chunk.endswith("-") or end == len(s) or s[end] == " " or (end < len(s) and s[end - 1] == "-"):
                pass
            # only break at space or after hyphen
            if end < len(s) and s[end] != " " and not chunk.endswith("-"):
                continue
            piece = chunk.strip()
            if not piece or len(piece) > MAX:
                continue
            rest = split_at(end if end < len(s) and s[end] == " " else end, lines_left - 1)
            if end < len(s) and s[end] == " ":
                rest = split_at(end + 1, lines_left - 1)
            else:
                rest = split_at(end, lines_left - 1)
            if rest is not None:
                return (piece,) + rest
        # hyphenate within word
        for end in range(pos + 4, min(pos + MAX, len(s))):
            if s[end - 1] == " ":
                continue
            piece = s[pos:end].rstrip() + "-"
            if len(piece) > MAX:
                continue
            rest = split_at(end, lines_left - 1)
            if rest is not None:
                return (piece,) + rest
        return None

    return split_at(0, N)


ns = {}
exec((pathlib.Path(__file__).parent / "dex_de_text.py").read_text(encoding="utf-8"), ns)
for k in list(ns["TEXT"].keys())[:18]:
    text = ns["TEXT"][k]
    print("===", k, len(text), "===")
    r = search_lines(text)
    print(r)
    if r:
        for i, l in enumerate(r):
            print(f"  {i}: {len(l)} {l}")
    print()