#!/usr/bin/env python3
"""Auto-translate dex_entries preserving English line structure."""
import re
import time
import urllib.parse
import urllib.request
import json
from pathlib import Path

CACHE_FILE = Path(__file__).parent / 'dex_line_cache.json'

def translate_line(text, cache):
    if text in cache:
        return cache[text]
    # Skip already German or special
    if not text or text == '?' or text.startswith('#'):
        cache[text] = text
        return text
    # Check if mostly ASCII English
    try:
        q = urllib.parse.quote(text)
        url = f"https://api.mymemory.translated.net/get?q={q}&langpair=en|de"
        req = urllib.request.Request(url, headers={'User-Agent': 'polishedcrystal-de/1.0'})
        with urllib.request.urlopen(req, timeout=15) as resp:
            data = json.loads(resp.read().decode())
        result = data.get('responseData', {}).get('translatedText', text)
        # Fix common issues
        result = result.replace('Pokémon', '#mon').replace('Pokemon', '#mon')
        result = result.replace('POKéMON', '#mon').replace('PokéMON', '#mon')
        cache[text] = result
        time.sleep(0.3)  # rate limit
        return result
    except Exception as e:
        print(f"  FAIL: {text[:40]}... ({e})")
        cache[text] = text
        return text

def translate_category(cat, cache):
    key = f"CAT:{cat}"
    if key in cache:
        return cache[key]
    result = translate_line(cat, cache)
    cache[key] = result
    return result

def process_file(en_path, out_path):
    cache = {}
    if CACHE_FILE.exists():
        cache = json.loads(CACHE_FILE.read_text(encoding='utf-8'))
    
    lines = Path(en_path).read_text(encoding='utf-8').split('\n')
    out_lines = []
    total = 0
    translated = 0
    
    for line in lines:
        m = re.match(r'(\t(?:db|text|next|page) )"(.+?)(@?)"', line)
        if m:
            prefix, text, suffix = m.groups()
            total += 1
            if prefix.strip() == 'db':
                new_text = translate_category(text, cache)
            else:
                new_text = translate_line(text, cache)
            if new_text != text:
                translated += 1
            out_lines.append(f'{prefix}"{new_text}{suffix}"')
        else:
            out_lines.append(line)
        
        if total % 50 == 0 and total > 0:
            CACHE_FILE.write_text(json.dumps(cache, ensure_ascii=False, indent=2), encoding='utf-8')
            print(f"  Progress: {total} strings, {translated} translated")
    
    CACHE_FILE.write_text(json.dumps(cache, ensure_ascii=False, indent=2), encoding='utf-8')
    Path(out_path).write_text('\n'.join(out_lines), encoding='utf-8')
    print(f"Done: {translated}/{total} strings translated")
    print(f"Output: {out_path}")

if __name__ == '__main__':
    base = Path(__file__).parent.parent
    process_file(
        base / 'data' / 'pokemon' / 'dex_entries_en.asm',
        base / 'data' / 'pokemon' / 'dex_entries.asm'
    )