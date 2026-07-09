#!/usr/bin/env python3
"""Wrap German dex text into exactly 6 lines, max 18 chars each."""
import pathlib
import re

MAX = 18
NUM_LINES = 6

def hyphenate(word, max_len=MAX):
    """Split word with trailing hyphen; max_len includes hyphen."""
    if len(word) <= max_len:
        return [(word, "")]
    limit = max_len - 1
    cuts = []
    for cut in range(limit, 2, -1):
        if word[cut - 1] in "aeiouäöüAEIOUÄÖÜ":
            cuts.append(cut)
    if not cuts:
        cuts = [limit]
    cut = cuts[0]
    return [(word[:cut] + "-", word[cut:])]


def wrap_six_lines(text):
    words = text.split()
    memo = {}

    def search(line_idx, word_idx, cur):
        key = (line_idx, word_idx, cur)
        if key in memo:
            return memo[key]
        if line_idx == NUM_LINES:
            if word_idx == len(words) and not cur:
                return []
            memo[key] = None
            return None

        results = []

        # Finish current line and start fresh
        if cur:
            rest = search(line_idx + 1, word_idx, "")
            if rest is not None:
                results.append([cur] + rest)

        if word_idx >= len(words):
            if cur and line_idx == NUM_LINES - 1:
                memo[key] = [cur]
                return [cur]
            memo[key] = None
            return None

        word = words[word_idx]

        # Add whole word to current line
        trial = f"{cur} {word}".strip() if cur else word
        if len(trial) <= MAX:
            rest = search(line_idx, word_idx + 1, trial)
            if rest is not None:
                results.append(rest)

        # Put word on new line (if current line non-empty)
        if cur:
            for whole, rem in ([(word, "")] if len(word) <= MAX else hyphenate(word)):
                if len(whole) > MAX:
                    continue
                tail_words = [rem] + words[word_idx + 1 :] if rem else words[word_idx + 1 :]
                rest = search(line_idx + 1, word_idx + (1 if not rem else 0), whole)
                if rem:
                    # manual push rem as partial
                    pass

        # Start word on fresh line when cur empty
        if not cur:
            if len(word) <= MAX:
                rest = search(line_idx, word_idx + 1, word)
                if rest is not None:
                    results.append(rest)
            else:
                for left, right in hyphenate(word):
                    if len(left) > MAX:
                        continue
                    new_words = ([right] if right else []) + words[word_idx + 1 :]
                    # re-run with modified words - use iterative approach instead
                    pass

        memo[key] = results[0] if results else None
        return memo[key]

    # Iterative BFS with word list mutation for hyphenation
    from collections import deque

    queue = deque([(0, 0, "", [])])
    while queue:
        line_idx, word_idx, cur, lines = queue.popleft()

        if line_idx == NUM_LINES:
            if word_idx == len(words) and not cur:
                while len(lines) < NUM_LINES:
                    lines.append("")
                return lines[:NUM_LINES]
            continue

        if word_idx >= len(words):
            if cur and line_idx == NUM_LINES - 1 and len(cur) <= MAX:
                out = lines + [cur]
                while len(out) < NUM_LINES:
                    out.append("")
                return out[:NUM_LINES]
            continue

        word = words[word_idx]
        trial = f"{cur} {word}".strip() if cur else word

        if len(trial) <= MAX:
            queue.append((line_idx, word_idx + 1, trial, lines))

        if cur and len(cur) <= MAX:
            queue.append((line_idx + 1, word_idx, word, lines + [cur]))

        if not cur:
            if len(word) <= MAX:
                queue.append((line_idx, word_idx + 1, word, lines))
            else:
                for left, right in hyphenate(word):
                    if len(left) > MAX:
                        continue
                    if right:
                        patched = words[:word_idx] + [right] + words[word_idx + 1 :]
                        # can't easily patch in BFS; use recursion below
                        pass

    # Recursive with patched words support
    def rec(word_list, line_idx, cur, acc):
        if line_idx == NUM_LINES:
            if not word_list and not cur:
                while len(acc) < NUM_LINES:
                    acc.append("")
                return acc[:NUM_LINES]
            return None

        if not word_list:
            if cur and line_idx == NUM_LINES - 1 and len(cur) <= MAX:
                out = acc + [cur]
                while len(out) < NUM_LINES:
                    out.append("")
                return out[:NUM_LINES]
            return None

        word = word_list[0]
        trial = f"{cur} {word}".strip() if cur else word
        if len(trial) <= MAX:
            r = rec(word_list[1:], line_idx, trial, acc)
            if r:
                return r

        if cur and len(cur) <= MAX:
            r = rec(word_list, line_idx + 1, word, acc + [cur])
            if r:
                return r

        if not cur:
            if len(word) <= MAX:
                r = rec(word_list[1:], line_idx, word, acc)
                if r:
                    return r
            else:
                for left, right in hyphenate(word):
                    if len(left) > MAX:
                        continue
                    nxt = ([right] + word_list[1:]) if right else word_list[1:]
                    r = rec(nxt, line_idx + 1, left, acc)
                    if r:
                        return r
        return None

    return rec(words, 0, "", [])


def format_entry(name, cat, lines, faithful=None):
    out = [f'SECTION "{name}", ROMX', f'{name}::']
    if faithful:
        out += ["if DEF(FAITHFUL)", f'\tdb "{faithful[0]}@"', "else", f'\tdb "{faithful[1]}@"', "endc"]
    else:
        out.append(f'\tdb "{cat}@"')
    tags = ["text", "next", "next", "page", "next", "next"]
    for tag, line in zip(tags, lines):
        suffix = "@" if tag == "next" and lines.index(line) == 5 else ""
        # fix suffix on last line only
    for i, (tag, line) in enumerate(zip(tags, lines)):
        suffix = "@" if i == 5 else ""
        out.append(f'\t{tag} "{line}{suffix}"')
    return "\n".join(out)


CAT = {
    "BulbasaurPokedexEntry": "Samen",
    "IvysaurPokedexEntry": "Samen",
    "VenusaurPokedexEntry": "Samen",
    "CharmanderPokedexEntry": "Eidechse",
    "CharmeleonPokedexEntry": "Flamme",
    "CharizardPokedexEntry": "Flamme",
    "SquirtlePokedexEntry": "Minikröte",
    "WartortlePokedexEntry": "Schildkröte",
    "CaterpiePokedexEntry": "Wurm",
    "MetapodPokedexEntry": "Kokon",
    "ButterfreePokedexEntry": "Falter",
    "WeedlePokedexEntry": "Raupe",
    "KakunaPokedexEntry": "Kokon",
    "BeedrillPokedexEntry": "Giftbiene",
    "PidgeyPokedexEntry": "Minivogel",
    "PidgeottoPokedexEntry": "Vogel",
    "PidgeotPokedexEntry": "Vogel",
}

FAITHFUL = {"BlastoisePokedexEntry": ("Panzerweich", "Panzer")}

if __name__ == "__main__":
    ns = {}
    exec((pathlib.Path(__file__).parent / "dex_de_text.py").read_text(encoding="utf-8"), ns)
    TEXT = ns["TEXT"]
    keys = list(TEXT.keys())[:18]
    for k in keys:
        lines = wrap_six_lines(TEXT[k])
        print(k, lines)
        if lines:
            for i, l in enumerate(lines):
                print(f"  {i}: {len(l):2d} {l}")