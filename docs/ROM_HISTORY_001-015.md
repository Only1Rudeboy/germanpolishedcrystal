# ROM-Historie 3.2.3.001 – 3.2.3.015 (Frühphase)

> **Vollständige Liste 001–048:** siehe [`docs/ROM_HISTORY.md`](ROM_HISTORY.md)  
> (inkl. **016 / 017 / 018** und alles bis QWERTZ / v0.9).

Dokumentation der **frühen Desktop-ROM-Builds** (`polishedcrystal-3.2.3.001` … `.015` und eng verwandte Builds).  
Nummern beziehen sich auf lokale Builds mit `tools/save_rom_versioned.ps1` bzw. Session-ROMs; **ROMs liegen nicht im Repo**.

Rekonstruiert aus **Git-Commits**, **README-Changelog** und **CONTINUE.md** / Phasen-Checkliste (2026-07).

---

## Überblick

| Phase | ROM-Bereich (ca.) | Thema |
|---|---|---|
| A | **001–008** | Grundübersetzung, Reflow, Proofreading, erster GSC-Canon-Layer |
| B | **009–011** | **Kritische Script-Bugs** (LIND/Lyra, `sdefer`, `text_ram`) |
| C | **011–015** | Early-Game **GSC-Dump-Abgleich** + Start Story (Mama **Schatz**, Neuborkia → Viola) |

---

## A · ROM ~001–008 — Fundament der DE-Lokalisierung

### Was passiert ist

1. **Projektstart**
   - Deutscher Text-Layer für **Polished Crystal 3.2.3** begonnen  
   - Commit-Schwerpunkt: `65a2cf4f5` *Initial upload – Deutsche Übersetzung gestartet*  
   - Checkpoint funktionierender DE-Build (`21b180fbf`)

2. **Technische Text-Infrastruktur**
   - Zeilenbreite **≤ 18** Anzeigezeichen (TEXTBOX)  
   - Massive Korrektur `line`/`line` → `line`/`cont` (Rendering-Bug, 1000+ Stellen)  
   - Reflow von Dialogen, Pokédex, Item-/Attacken-/Fähigkeits-Beschreibungen  
   - Charmap: großes **Ö** / Umlaute korrekt darstellbar  
   - Casing `#COM` / `#DEX` / `#mon`-Breiten in Tools (`#`=4, `#mon`=7)

3. **Proofreading-Runden**
   - Native-Speaker- / QC-Passes (Grammatik, UI, Party-Menü, PC, BSOD)  
   - Reste englischer Strings entfernt  
   - New-Game-Optionen-Labels gekürzt (Menü-Overflow)

4. **Produkt / Docs**
   - Title-Screen: DE-Credit  
   - README: Übersetzungs-Hinweis, WIP, Feedback  
   - INSTALL.md auf Deutsch  
   - Markierung als **German GSC-canon localization** (`fa38060bc`)

5. **Phasen-Arbeit (parallel zu frühen ROMs)**  
   Laut `CONTINUE.md` / `DE_PHASE_CHECKLIST.md` u. a.:
   - Phase 0–1: System-UI (Startmenü, Beutel, Kampfmenü, Optionen, Naming, Party, PC, Markt)  
   - Phase 2: Kampftexte  
   - Phase 3–4: Namen, Beschreibungen  
   - Phase 5a: Start-Johto-Maps (Lind, Routes, …) — eigene Session-ROMs (`5a-*.gbc`, `p4p5a.gbc`, …)

6. **Stabilität**
   - Truncation-/Sandbox-Korruption an großen Dateien behoben (`e62c6d3b8`)  
   - Kampftexte: Overflow bei `<ENEMY>` + deutschem Nachsatz behoben (`da787a836`)

**Ergebnis ~008:** Spielbar auf Deutsch, noch nicht „GSC-dump-1:1“ überall; Fokus UI + Vollständigkeit + Breite.

---

## B · ROM **009–011** — Kritische Softlocks / Script-Bugs

Dieselben Fehlerklasse wie der bekannte **LIND / Lyra**-Startbug: Szenen endeten sofort (`end` ohne `sdefer`), oder `done` schnitt dynamischen Text ab.

| ROM (ca.) | Commit | Inhalt |
|---|---|---|
| **009** | `27988389d` | **11×** fehlende `sdefer` wiederhergestellt (u. a. Top Vier, Ruhmeshalle, Schiff, Nationalpark-Tore, Alph, Mahagoni-Markt). **68×** premature `done` vor `text_ram`/`text_decimal` entfernt (Namen/Zahlen sichtbar). DayCare-Lyra-Pronomen. Script-Scanner. |
| **~009** | `086d10d70` | **Elms Lab:** MeetElm-Cutscene wieder mit `sdefer` (vorher sofort zu Ende). Elm-Directions bereinigt. |
| **~009** | `2b9ba2e09` | **Lyra erhält Starter:** `text_ram` für Mon-Name wieder aktiv (vorher abgeschnitten). Gleicher Fix Battle Tower/Fabrik-UI. |
| **010** | `c96491575` | Deep-Scan: **8** weitere stubbed Scenes (Häfen, Cable Club, Zinnturm Suicune, Drachenschrein, Teak-Arena, Rocket B3F, …). `text_ram`/`text_decimal` Spielhalle, Glücks-Bewerter, Friseure, Käferturnier, Alph-PC; mid-`@` die Strings beendeten. |
| **011** | `1f403806e` | Intro **verschlafen** (nicht „genickert“). |

**Ergebnis ~011:** Start-Story und viele globale Events wieder **spielbar/stabil** (Upstream-Logik).

---

## C · ROM **011–018** — Early-Game GSC-Dump + Story-Start

Ab hier: Abgleich mit **offiziellem DE-Kristall-Dump** (`tools/_gsc_de_crystal_msg.txt`), nicht nur freie Übersetzung.

| ROM (ca.) | Commit / Fokus | Inhalt |
|---|---|---|
| **012** | `3213043cb` | Mama / Neuborkia / Cherrygrove dump-nah: #MON-COM, Mama-Auftrag, Laborschild, Route 29 **NEUBORKIA**, Anfänger-Guide. Polished **LYRA** bleibt. |
| **012–013** | `a0bad05a7` | Route 30, Mr.#MON, Cherrygrove dump-align. |
| **013–014** | `255ed33fe` | Mama: Dump „Baby“ → User-Override **Schatz**. Dump-align ROSALIA, Route 30, Mr.#MON; Guide Center/Mart, Rival, Eich-Abschied. |
| **015** | `530c8902c` | Route 31, **Viola**, Knofensa-Turm, FALK; Orden **FLÜGELORDEN** (nicht Zephyr); ARENALEITER CAPS; Arena-Guy/Schilder dump-nah; Badge-Kurz **Flügel**. |
| **016** | `d6aa5a2e1` | Viola-Feinschliff: Gramps / FALK / **PKMN-ARENA**-Wortlaut dump-nah. |
| **017** | Zwischenbuild | Viola → Route-32-Übergang; Checkpoint vor Azalea-Batch. |
| **018** | `0fed834e9` | Route 32 → Azalea-Eingang; Flegmon-Brunnen-Richtung, Ilex/Union-Vorbereitung. |

**Ergebnis ~015–018:** Early-Johto (Start bis Viola / Flügelorden und Richtung Azalea) **GSC-kanonisch** spürbar; Regelwerk A/B/C für Dump vs. PC-only etabliert.  
**Fortsetzung ab 019:** siehe [`ROM_HISTORY.md`](ROM_HISTORY.md).

---

## Was in 001–015 *noch nicht* der Fokus war

- Vollständiger Johto/Kanto-Dump-Pass (ab ~016–025)  
- Phone-Namen-Komplett (später ~030+)  
- Items/Attacken dump-nah en masse (später ~040+)  
- Dex 1–251 QC (später ~043)  
- QWERTZ (später v0.9 / 048)  
- Shiny-Experimente (nur **Arbeitskopie**, nicht pure-DE-main)

---

## Wichtige Commits (Kurzliste)

```
65a2cf4f5  Initial DE upload
b92c82d01  Reflow 18 + line/cont mass fix
641690175  Proofreading pass
fa38060bc  GSC-canon localization marker
2b9ba2e09  Lyra mon name (text_ram)
086d10d70  Elm MeetElm sdefer
27988389d  Global sdefer + premature done  → ROM 009
c96491575  Deep scan stubs + dynamic text → ROM 010
1f403806e  verschlafen
3213043cb  Early game dump + ROM 011/012
255ed33fe  Mama Schatz
530c8902c  Route 31 / Viola / FLÜGELORDEN  → ~015
d6aa5a2e1  Violet gramps / PKMN-ARENA      → ~016
0fed834e9  Route 32 / Azalea start         → ~018
```

---

## Hinweis

Einzelne MD5s der Desktop-Dateien `…001.gbc` … `…015.gbc` wurden nicht alle versioniert im Git gespeichert. Inhaltlich deckt diese Datei die **Arbeitspakete** ab, die in dieser Nummernspanne typischerweise gebaut und getestet wurden.
