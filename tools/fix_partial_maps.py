#!/usr/bin/env python3
"""Apply German translations to remaining partial map files."""
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent / "maps"

REPLACEMENTS: dict[str, list[tuple[str, str]]] = {
    "Route3.asm": [
        (
            '\ttext "Looks like I need"\n\tline "more training!"\n\tdone\n\n.SeenText:\n\ttext "Youngster? Good-"\n\tline "ness, how rude!"\n\n\tpara "Call me Shorts"\n\tline "Boy!"\n\tdone\n\n.BeatenText:\n\ttext "That is…"\n\tline "Fail Boy…"\n\tdone',
            '\ttext "Sieht aus, als"\n\tline "bräuchte ich mehr"\n\tcont "Training!"\n\tdone\n\n.SeenText:\n\ttext "Youngster? Wie"\n\tline "unhöflich!"\n\n\tpara "Nenn mich Shorts"\n\tline "Boy!"\n\tdone\n\n.BeatenText:\n\ttext "Das heißt…"\n\tline "Fail Boy…"\n\tdone',
        ),
        (
            '\ttext "You must have"\n\tline "trained under a"\n\tcont "well-known master!"\n\tdone\n\n.SeenText:\n\ttext "Slow down and give"\n\tline "me the chance to"\n\tcont "defeat you!"\n\tdone\n\n.BeatenText:\n\ttext "I\'ve been beaten"\n\tline "at my own game…"\n\tdone',
            '\ttext "Du musst bei"\n\tline "einem bekannten"\n\tcont "Meister trainiert"\n\tcont "haben!"\n\tdone\n\n.SeenText:\n\ttext "Langsamer! Gib mir"\n\tline "eine Chance, dich"\n\tcont "zu besiegen!"\n\tdone\n\n.BeatenText:\n\ttext "Ich wurde bei"\n\tline "meinem eigenen"\n\tcont "Spiel geschlagen…"\n\tdone',
        ),
        (
            '\ttext "You came all the"\n\tline "way from Johto?"\n\n\tpara "You must be very"\n\tline "persistent!"\n\tdone\n\n.SeenText:\n\ttext "Wait a moment!"\n\tline "Come fight me!"\n\tdone\n\n.BeatenText:\n\ttext "You did it…"\n\tdone',
            '\ttext "Du bist den ganzen"\n\tline "Weg aus Johto"\n\tcont "gekommen?"\n\n\tpara "Du musst sehr"\n\tline "hartnäckig sein!"\n\tdone\n\n.SeenText:\n\ttext "Moment! Kämpf"\n\tline "gegen mich!"\n\tdone\n\n.BeatenText:\n\ttext "Du hast es"\n\tline "geschafft…"\n\tdone',
        ),
        (
            '\ttext "All right, guess I"\n\tline "should carry my"\n\tcont "Bag again!"\n\tdone\n\n.SeenText:\n\ttext "My Bag is digging"\n\tline "into my shoulders!"\n\n\tpara "I\'ll take a break"\n\tline "and have a battle!"\n\tdone',
            '\ttext "Na gut, ich sollte"\n\tline "meine Tasche wieder"\n\tcont "tragen!"\n\tdone\n\n.SeenText:\n\ttext "Meine Tasche gräbt"\n\tline "sich in meine"\n\tcont "Schultern!"\n\n\tpara "Ich mache Pause"\n\tline "und kämpfe!"\n\tdone',
        ),
    ],
    "Route15.asm": [
        (
            'PokefanfBooneSeenText:\n\ttext "Hey, your"\n\tline "#mon…"\n\n\tpara "Show me. Show me."\n\tline "Show me!"\n\tdone\n\nPokefanfBooneBeatenText:\n\ttext "Yay! That was"\n\tline "great!"\n\tdone\n\nPokefanfEleanorSeenText:\n\ttext "All right,"\n\tline "#mon, time for"\n\tcont "a battle!"\n\tdone\n\nPokefanfEleanorBeatenText:\n\ttext "Oh, well…"\n\tdone',
            'PokefanfBooneSeenText:\n\ttext "Hey, deine"\n\tline "#mon…"\n\n\tpara "Zeig sie mir."\n\tline "Zeig sie mir!"\n\tdone\n\nPokefanfBooneBeatenText:\n\ttext "Juhu! Das war"\n\tline "toll!"\n\tdone\n\nPokefanfEleanorSeenText:\n\ttext "Na gut,"\n\tline "#mon, Zeit für"\n\tcont "einen Kampf!"\n\tdone\n\nPokefanfEleanorBeatenText:\n\ttext "Na ja…"\n\tdone',
        ),
        (
            '\ttext "My #mon aren\'t"\n\tline "weak! Your #mon"\n\tcont "are too strong!"\n\tdone',
            '\ttext "Meine #mon sind"\n\tline "nicht schwach!"\n\n\tpara "Deine #mon sind"\n\tline "zu stark!"\n\tdone',
        ),
        (
            'TwinsKayandtia1SeenText:\n\ttext "We\'re the twins"\n\tline "Kay and Tia!"\n\n\tpara "Do you know which"\n\tline "one I am?"\n\tdone\n\nTwinsKayandtia1BeatenText:\n\ttext "Tia and Kay both"\n\tline "lost…"\n\tdone\n\nTwinsKayandtia2SeenText:\n\ttext "We\'re the twins"\n\tline "Kay and Tia!"\n\n\tpara "Do you know which"\n\tline "one I am?"\n\tdone\n\nTwinsKayandtia2BeatenText:\n\ttext "Tia and Kay both"\n\tline "lost…"\n\tdone',
            'TwinsKayandtia1SeenText:\n\ttext "Wir sind die"\n\tline "Zwillinge Kay"\n\tcont "und Tia!"\n\n\tpara "Weißt du, welche"\n\tline "von uns ich bin?"\n\tdone\n\nTwinsKayandtia1BeatenText:\n\ttext "Tia und Kay haben"\n\tline "beide verloren…"\n\tdone\n\nTwinsKayandtia2SeenText:\n\ttext "Wir sind die"\n\tline "Zwillinge Kay"\n\tcont "und Tia!"\n\n\tpara "Weißt du, welche"\n\tline "von uns ich bin?"\n\tdone\n\nTwinsKayandtia2BeatenText:\n\ttext "Tia und Kay haben"\n\tline "beide verloren…"\n\tdone',
        ),
        ('\ttext "Oh, nein!"\n\tline "Wie konnte ich nur"', '\ttext "Ach, nein!"\n\tline "Wie konnte ich nur"'),
    ],
}

def apply_file(fname: str, reps: list[tuple[str, str]]) -> int:
    path = ROOT / fname
    text = path.read_text(encoding="utf-8")
    count = 0
    for old, new in reps:
        if old in text:
            text = text.replace(old, new)
            count += 1
    if count:
        path.write_text(text, encoding="utf-8")
        print(f"{fname}: {count} blocks")
    return count

if __name__ == "__main__":
    total = 0
    for fname, reps in REPLACEMENTS.items():
        total += apply_file(fname, reps)
    print(f"total: {total}")