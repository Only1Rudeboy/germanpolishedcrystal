# Polished Crystal DE – Phasen-Checkliste (Canon-Stil)

> **Session-Übergabe:** Siehe auch **`CONTINUE.md`** im Projektroot  
> (was erledigt ist, nächstes Paket, ROM-MD5, Prompt für neue Chats).

**Ziel:** Jede Phase hat ein klares Gate. Erst Gate grün, dann nächste Phase.  
**Stil:** DE-Kristall (GSC), kurze Zeilen, Artnamen GROSS, korrekte `#`/`#mon`-Breiten.  
**Regel:** Pro Arbeitspaket = Backup → Edit → Auto-Checks → Build → In-Game-Test → hier abhaken.

**Aktuelle Release-ROM (Stand letzter Build):**  
`Desktop/polishedcrystal-3.2.3-de-canon.gbc` (MD5 je Build neu notieren)

**Hilfsskripte:**
- `tools/scan_true_width.py` – Zeilenbreite (echte `#`/`#mon`-Breite)
- `tools/scan_english_ui.py` – EN-Reste in UI
- `tools/verify_npc_width.py` / `tools/fix_npc_dialogs_final.py` – nur mit Vorsicht
- `tools/DE_TRANSLATION_NOTES.md` – Unsicherheiten

**Auto-Checks (vor jedem Gate):**
```text
[ ] make crystal  (bankends $80 Warnung ok/ignoriert wie bisher)
[ ] py tools/scan_true_width.py          → over18 = 0 (Maps oder Scope)
[ ] Script-Count bei Map-Edits unverändert
[ ] In-Game Stichprobe des Scopes
```

---

## Phase 0 – Fundament

**Ziel:** Regeln + Werkzeuge, die man nie wieder bricht.

| # | Aufgabe | Dateien / Ort | Done |
|---|---------|---------------|------|
| 0.1 | Stil-Regeln festgeschrieben | `tools/DE_TRANSLATION_NOTES.md` | [x] |
| 0.2 | `#` = 4, `#mon` = 7 in Width-Tools | `tools/fix_npc_dialogs_final.py`, `scan_true_width.py` | [x] |
| 0.3 | Artnamen GROSS | `data/pokemon/names.asm` | [x] |
| 0.4 | Width-Scan Maps over18=0 | `tools/scan_true_width.py` | [x] |
| 0.5 | Phasen-Checkliste angelegt | diese Datei | [x] |
| 0.6 | Glossar Kernbegriffe (Lind, #Com, Beutel, Basis-Items, TM/VM) | unten Phase 0 Glossar | [x] |
| 0.7 | Backup-Konvention dokumentiert | `maps_backup_*`, ROM-Namen mit MD5 | [ ] |
| 0.8 | EN-UI-Scan bereinigt (False Positives ok, echte Treffer 0) | `tools/scan_english_ui.py` | [ ] |

### Glossar (verbindlich)

| EN / intern | DE Canon |
|-------------|----------|
| Pack / Bag | Beutel |
| Key Items | Basis-Items |
| TM/HM | TM/VM |
| Fight / PKMN / Bag / Run | Kampf / PKMN / Beutel / Flucht |
| Use / Give / Toss / Quit | Nutz / Geb. / Weg / Ende |
| Prof. Elm | Prof. Lind |
| Pokégear / #Com | #Com (Anzeige: PokéCom) |
| Species names | IMMER GROSS |
| Wild appear | `Ein wildes` + Zeile + `NAME!` |

**Gate 0:** Regeln + Tools dokumentiert, Checkliste existiert, Build reproduzierbar.  
**Gate 0 Status:** [x] weitgehend (0.7–0.8 noch offen)

---

## Phase 1 – System-UI

**Ziel:** Alle Menüs, die man ständig sieht, canon + kein Overflow.

| # | Screen | Dateien | Done |
|---|--------|---------|------|
| 1.1 | Startmenü | `engine/menus/start_menu.asm` | [x] (Breite 8–19) |
| 1.2 | Beutel Taschen | `data/items/pocket_names.asm` | [x] |
| 1.3 | Beutel Menü Nutz/Geb./Weg | `engine/items/pack.asm` | [x] |
| 1.4 | Beutel Meldungen | `data/text/common.asm` (_AskThrowAway…, Register…) | [x] |
| 1.5 | Kampfmenü 4er | `engine/battle/menu.asm` | [x] |
| 1.6 | Optionen Namen | `data/options/option_names.asm`, `engine/menus/options_menu.asm` | [x] |
| 1.7 | Optionen Beschreibungen | `data/options/options_descriptions.asm` | [x] |
| 1.8 | Namensvergabe | `engine/menus/naming_screen.asm` | [x] |
| 1.9 | Party-Menü | `party_menu.asm`, `data/mon_menu.asm`, `mon_menu.asm` | [x] |
| 1.10 | Status / Summary | `summary/blue_page.asm` (KP), `pink_page.asm` | [x] |
| 1.11 | PC / Box-UI | `bills_pc_ui.asm`, `pokecenter_pc.asm`, PC-Texte common.asm | [x] |
| 1.12 | Markt Kaufen/Verkaufen | `common.asm` Mart* + mart.asm Labels | [x] |
| 1.13 | Speichern / Titel / Intro-Menü | Save-Texte common.asm, main_menu.asm (bereits DE) | [x] |
| 1.14 | In-Game: alle Screens 1× durchklicken | User-Test empfohlen | [ ] |

**Gate 1:** Jede Zeile in 1.1–1.13 DE + Breite ok + In-Game 1.14.  
**Gate 1 Status:** [ ] Code grün, **1.14 User-In-Game-Test offen**

### Arbeitspaket-Reihenfolge Phase 1 (Rest)
1. ~~1.8–1.13~~ erledigt 2026-07-13  
2. `1.14` Full click-test durch User → dann Gate 1 [x]  
3. Weiter mit **Phase 2.6–2.8** oder **Phase 5a**

---

## Phase 2 – Kampftexte komplett

| # | Block | Dateien | Done |
|---|-------|---------|------|
| 2.1 | Wild / Trainer Anfang-Ende | `data/text/battle.asm` (Appear, Fled, Money, Defeated) | [x] |
| 2.2 | Attacke einsetzen + Treffer | UsedMove*, Critical, SuperEffective, Miss… | [x] |
| 2.3 | Status | Gift, Brand, Para, Schlaf, Frost, Verwirrung | [x] |
| 2.4 | Wetter / Feld | Sandsturm, Regen, Sonne, Hagel, Stacheln… | [x] |
| 2.5 | Kampf-Items / Ball / Rückruf | battle.asm + common Go/Zurück-Texte | [x] |
| 2.6 | Polished-only (Fähigkeiten-Meldungen) | Notify*, Frisk, AngerPoint, Unnerve… | [x] Feinschliff |
| 2.7 | Scan/Stichprobe Kernstrings | `tools/scan_battle_de.py` | [x] |
| 2.8 | In-Game: wild, Trainer, Status, Flucht, Volltreffer | User | [ ] |

**Gate 2:** Kein EN in battle.asm-UI; 2.7+2.8 bestanden.  
**Gate 2 Status:** [ ] Code grün, **2.8 User-Kampf-Stichprobe offen**

---

## Phase 3 – Datenbanken (Namen)

| # | Liste | Datei | Done |
|---|-------|-------|------|
| 3.1 | Artnamen CAPS | `data/pokemon/names.asm` | [x] |
| 3.2 | Attackennamen DE | `data/moves/names.asm` | [x] |
| 3.3 | Itemnamen DE | `data/items/names.asm` | [x] |
| 3.4 | Basis-Items DE | `data/items/key_names.asm` | [x] |
| 3.5 | Fähigkeiten DE | `data/abilities/names.asm` | [x] |
| 3.6 | Trainerklassen | `data/trainers/class_names.asm` (PokéWiki) | [x] |
| 3.7 | Landmarks / Orte | `landmarks.asm` – `#mon` → `Pokémon-…` (kein rawchar-#) | [x] |
| 3.8 | Orden-Namen GSC-DE | `badge_names.asm` Plan/Nebel/Sturm/Mineral | [x] |

**Gate 3:** Keine EN-Art/Item-Kernnamen; Landmarks ohne rawchar-# Fehler.  
**Gate 3 Status:** [x] Code (Stichprobe PokéWiki/GSC; Polished-Klassen z. T. freier)

---

## Phase 4 – Beschreibungen (lang)

| # | Chunk | Datei | Done |
|---|-------|-------|------|
| 4.1 | Item-Beschreibungen | `data/items/descriptions.asm` (DE + Feinschliff) | [x] |
| 4.2 | Item-Batch B | in 4.1 enthalten (Datei schon komplett DE) | [x] |
| 4.3 | Attacken-Beschreibungen | `data/moves/descriptions.asm` | [x] |
| 4.4 | Fähigkeiten-Beschreibungen | `data/abilities/descriptions.asm` | [x] |
| 4.5 | Dex Johto | `dex_entries.asm` (bereits DE, Stichprobe OK) | [x] |
| 4.6 | Dex Rest / Polished | ditto (Scan: 0 echte EN-Sätze) | [x] |
| 4.7 | Width-Scan Beschreibungen | `tools/scan_desc_english.py` → width>18: 0 | [x] |

**Gate 4:** Width grün; Stichprobe 10 % gelesen.  
**Gate 4 Status:** [x] (Inhalt war größtenteils schon DE; Feinschliff 2026-07-13)

---

## Phase 5 – Map-Dialoge (Spieler-Pfad)

**Regel:** Nie ganzes `maps/` blind reflowen. Pro Gruppe Backup + Script-Count.

### 5a Start-Johto
| # | Gebiet | Beispiel-Maps | Done |
|---|--------|---------------|------|
| 5a.1 | Neuborkia Haus | `PlayersHouse1F.asm` Mama etc. | [x] (Nacharbeit CAPS/Width 2026-07-13) |
| 5a.2 | Neuborkia / Lind | `NewBarkTown.asm`, `ElmsLab.asm` Story-Dialoge | [x] (Kern; Itemnotify-Beere global gefixt) |
| 5a.3 | Route 29, Cherrygrove | `Route29.asm`, `CherrygroveCity.asm` Guide/Tutorial | [x] |
| 5a.4 | Viola + Turm + Gym | `Violet*.asm`, `SproutTower*.asm` | [x] |
| 5a.5 | Azalea + Slowpoke + Gym | `Azalea*.asm`, Brunnen, KURT, Arena, Ofen | [x] |
| 5a.6 | Goldsberg + Radio | `Goldenrod*`, `RadioTower*` Canon+densify | [x] |
| 5a.7 | In-Game Start / Gate-Scan | Ilex Cut/Celebi, Pfad-Scan over18=0 | [x] |
| 5a.8 | Route 30–31, Mr.#mon Haus Feinschliff | optional | [x] |

**Gate 5a:** [x] (Start→Goldsberg densified + Radio-Canon + Scan clean; User-Playtest empfohlen)

### 5b Mittel-Johto
| # | Gebiet | Done |
|---|--------|------|
| 5b.1 | Teak / Burned Tower / Dance | [x] |
| 5b.2 | Oliviana / Leuchtturm + Anemonia | [x] |
| 5b.3 | Mahagonia / Rocket Base | [x] |
| 5b.4 | See / Ebenholz / Eispfad / Drachenhöhle + Indigo-Pfad densify | [x] |
| 5b.5 | In-Game Playtest Johto | [ ] |

**Gate 5b:** [x] (Mittel-Johto densified+Canon-Kern; User-Playtest empfohlen)

### 5c End-Johto / Liga
| # | Gebiet | Done |
|---|--------|------|
| 5c.1 | Eispfad / Schwarzdorn | [x] (in 5b.4) |
| 5c.2 | Indigo / Elite / Champ / HoF | [x] |
| 5c.3 | Nachspiel (Silberberg, MS AQUA, Eich-Lab densify) | [x] densify |

**Gate 5c:** [x] (Liga-Canon + densify; User-Playtest TOP VIER empfohlen)

### 5d Kanto (falls im Spielpfad)
| # | Gebiet | Done |
|---|--------|------|
| 5d.1 | Frühes Kanto (Routen/Städte densify) | [x] |
| 5d.2 | Gyms / Orte (Canon-Leiter + Schilder) | [x] |
| 5d.3 | In-Game | [ ] Playtest |

**Gate 5d:** [x] (densify+Gym-Canon; Uni/Celadon Polished-only teils densified)

### 5e Polished-only Maps
| # | Gebiet | Done |
|---|--------|------|
| 5e.1 | Universität Celadon etc. | [ ] |
| 5e.2 | Inseln / Shamouti etc. | [ ] |
| 5e.3 | Battle Tower / Factory | [ ] |

**Gate 5e:** [ ]

**Gate 5 gesamt:** 5a–5e grün.  
**Gate 5 Status:** [ ]

---

## Phase 6 – Telefon, Radio, Credits, Spezial

| # | System | Dateien | Done |
|---|--------|---------|------|
| 6.1 | Telefon-Texte | `data/phone/text/*.asm` | [ ] Review |
| 6.2 | Radio | `engine/pokegear/`, radio-Texte | [ ] |
| 6.3 | Credits | `data/credits_strings.asm`, `engine/movie/credits.asm` | [ ] |
| 6.4 | Mail / Post | falls vorhanden | [ ] |
| 6.5 | Battle Tower Texte | `data/battle_tower/`, Maps | [ ] |

**Gate 6:** [ ]

---

## Phase 7 – Hardening (Fehlerjagd)

| # | Aufgabe | Done |
|---|---------|------|
| 7.1 | Full width-scan maps + data/text | [ ] |
| 7.2 | EN-UI-Scan (echte Treffer 0) | [ ] |
| 7.3 | Playthrough-Checkliste Kapitel 1–Ende | [ ] (eigene Liste unten) |
| 7.4 | Zwei-Augen / User-Bugliste abarbeiten | [ ] |
| 7.5 | Release-Kandidat ROM + MD5 | [ ] |

**Gate 7:** [ ]

### Playthrough-Kurzliste (Phase 7.3)
- [ ] Intro / Uhr / Mama / Lind / Starter  
- [ ] Erste Routes + Cherrygrove  
- [ ] 1.–8. Orden Johto  
- [ ] Radio / Rocket / Legenden-Schritte  
- [ ] Liga  
- [ ] Kanto-Start (falls)  
- [ ] Beutel / PC / Markt / Optionen unterwegs  
- [ ] Wildkampf + Trainerkampf Stichprobe pro Kapitel  

---

## Phase 8 – Freeze & Pflege

| # | Aufgabe | Done |
|---|---------|------|
| 8.1 | Text-Freeze erklärt (nur noch Bugfixes) | [ ] |
| 8.2 | Bug-Ticket-Format: Map, NPC, Screenshot, Soll-Text | [ ] |
| 8.3 | Finale ROM benannt + MD5 in README/Notes | [ ] |

**Gate 8 / Release:** [ ]

---

## Ticket-Format (Phase 8 / User-Meldungen)

```text
Ort:     [Map / Menü]
Wann:    [Story / Kampf / Beutel …]
Ist:     [was steht da / Screenshot]
Soll:    [Canon / gewünschter Text]
Datei:   [falls bekannt]
```

---

## Fortschritt (manuell aktualisieren)

| Phase | Gate | Status |
|-------|------|--------|
| 0 Fundament | 0 | grün (Rest 0.7–0.8) |
| 1 System-UI | 1 | grün (Code), 1.14 User-Test offen |
| 2 Kampf | 2 | grün (Code), 2.8 User-Test offen |
| 3 Namen | 3 | grün |
| 4 Beschreibungen | 4 | grün (+ A–C Stil) |
| 5 Maps | 5 | gelb (5a Start-Story Kern) |
| 6 Spezial | 6 | rot |
| 7 Hardening | 7 | rot |
| 8 Freeze | 8 | rot |

**Nächstes Arbeitspaket (empfohlen):**  
→ **Phase 1.8–1.10** (Naming, Party, Summary) abschließen, dann **1.11 PC**, dann **Gate 1**.

---

## Ja, das schaffen wir

Nicht in einer Session „alles perfekt“, aber **mit dieser Liste ohne System zu verlieren**:

1. Immer nur ein Kästchen-Block.  
2. Gate nicht überspringen.  
3. Nach jedem Block: Build + kurzer In-Game-Test.  
4. Unsicherheiten nach `DE_TRANSLATION_NOTES.md`, nicht raten und vergessen.

Wenn du sagst **„weiter mit Phase 1“**, arbeiten wir strikt die offenen 1.8–1.14 ab und haken hier ab.
