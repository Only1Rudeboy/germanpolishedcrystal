# Deutsche Übersetzung – Stil & Unsicherheiten

Stand: Polished Crystal 3.2.3, DE im **Kristall-Canon-Stil**
(kurze Zeilen, Umbrüche wie GSC, Artnamen GROSS, kein 1:1-Englisch).

## Bereits im Canon-Stil (wesentliche Bereiche)

- **Kampftexte** (`data/text/battle.asm`): u. a. wildes Erscheinen, besiegt,
  setzt ein, Effektivität, Status, Flucht, Geld, Wetter
- **Artnamen** (`data/pokemon/names.asm`): ALLE GROSSBUCHSTABEN
- **Beutel / Rucksack**
  - Taschen: Items · Medizin · Bälle · TM/VM · Beeren · Basis-Items
  - Menü: Nutz / Geb. / Weg / Wahl / Ende
  - Meldungen: wegwerfen, registrieren, Eich-Hinweis
- **Startmenü**: Beutel, Sichern, Optionen, etc.
- **Kampfmenü**: Kampf / PKMN / Beutel / Flucht (Box verbreitert)
- **Item-/Basis-Item-Namen**, Attacken-Namen, Fähigkeiten-Namen (DE-Listen)
- **NPC-Dialoge** (Maps): weitgehend DE, Zeilenbreite mit korrektem `#`/`#mon`

## Unsicher / bewusst freier stilisiert

| Thema | Entscheidung | Unsicherheit |
|--------|--------------|--------------|
| **Taschen „Medizin“, „Beeren“** | Wie neuere DE-Spiele; GSC hatte nur 4 Taschen | GSC-Canon hat keine separate Medizin-/Beeren-Tasche |
| **„Basis-Items“** | DE-GSC/Gen3-Begriff für Key Items | Manche Übersetzungen: „Schlüssel-Items“ |
| **TM/VM** | VM = Versteckte Maschine (HM) | Grafik-Icons im Beutel evtl. noch EN-Layout |
| **„Anglo“ vs „Imperial“** | #dex-Einheiten | Offiziell selten so benannt; Alternative: „Zoll“ |
| **„Auto-Text“** | Text-Autoscroll | Kein 1:1-GSC-Begriff (Polished-Option) |
| **Schriftarten (Chicago, MICR…)** | Eigennamen belassen | – |
| **Polished-only Kampf** (Fähigkeiten, Mega, Z…) | DE-Fähigkeitsnamen + sinngemäße Texte | Kein GSC-Vorbild; an Gen4–8-DE angelehnt |
| **Polished-Orte / neue Story** | Bestehende DE-Map-Texte | Nicht alles 1:1 mit GSC-Dialogen abgleichbar |
| **Telefon-NPCs** | DE, teils gekürzt für Breite | Ton kann von GSC abweichen |
| **Dex-Einträge** | DE vorhanden | Länge/Qualität uneinheitlich möglich |
| **Credits / Tool-Programmierung** | Teilweise DE | Englische Credits-Namen bleiben |
| **Spitznamen** | Spieler-Eingabe | Artname nur default = CAPS |

### Beschreibungs-Glossar (Phase 4 A–C)

| Kurz | Lang |
|------|------|
| Angr. | Angriff |
| Vert. | Verteidigung |
| Tempo | Speed/Initiative |
| Sp.Ang. | Spezial-Angriff |
| Sp.Vert. | Spezial-Verteidigung |
| K.O. | kampfunfähig |
| (halten) | getragenes Item |
| für 1 Kampf. | X-Item-Dauer |
| zurückschrecken | flinch |

## Noch lohnende Folgearbeit

1. ~~Item-Beschreibungs-Stil~~ (A+B+C erledigt)
2. **PC / Lager / Box-UI** Feinschliff (Phase 1)
3. **Mart-Dialoge** (Kaufen/Verkaufen) Feinschliff
4. Einzelne **Map-NPCs** mit noch holprigem Umbruch nach `#mon`-Fix
5. **Handy-/Radio-Texte** Kanon-Abgleich

## Build-Hinweis

Nach Textänderungen typisch neu bauen:

- `main.o` (pack, battle, names, start menu, options)
- `data/text/common.o` (Beutel-Meldungen)
- ggf. `data/maps/map_data.o` (NPCs)
