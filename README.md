# Pokémon Polished Crystal — deutsche GSC-Kanon-Lokalisierung

Deutsche Lokalisierung von [Rangi42/polishedcrystal](https://github.com/Rangi42/polishedcrystal) **3.2.3**.  
Kein eigenes Spiel — nur der **Text-Layer** im Stil von **Pokémon Kristall (GSC-DE)**.

| | |
|---|---|
| **Status** | WIP — spielbar, Feedback erwünscht |
| **Basis** | Polished Crystal 3.2.3 · pret/pokecrystal |
| **Aktuell pure-DE** | **ROM 3.2.3.058** (Pass-2: common.asm-Ketten + EN-Gfx ENDE/Judge/Diplom) |
| **Branch** | **`master`** (einziger Entwicklungs-Branch / GitHub-Default) |
| **Upstream** | [Rangi42/polishedcrystal](https://github.com/Rangi42/polishedcrystal) |
| **Disassembly** | [pret/pokecrystal](https://github.com/pret/pokecrystal) |

> Mit **Grok 4.5** (xAI) und **Claude** (Anthropic) unterstützt. Es können noch Fehler, Zeilenumbrüche oder einzelne EN-Stellen vorkommen.  
> **Feedback willkommen** (Issues / PRs).  
> **Nur pure DE-Lokalisierung** 

---

## Inhaltsverzeichnis (Lokalisierung)

1. [Schnellstart](#schnellstart)
2. [Changelog (aktuell)](#changelog-aktuell)
3. [ROM-Übersicht 001–058](#rom-übersicht-001058)
4. [Was ist übersetzt?](#was-ist-übersetzt)
5. [Qualitätsregeln](#qualitätsregeln)
6. [Orden & Orte](#orden--orte)
7. [Tools & Docs](#tools--docs)
8. [Residuen](#residuen)
9. [Credits](#credits-lokalisierung)
10. *[Originalspiel-README (DE-Übersetzung)](#pokémon-polished-crystal)* — Features von Polished Crystal selbst

---

## Schnellstart

1. Repo klonen / bauen → siehe [`INSTALL.md`](INSTALL.md)  
2. Fertige **ROMs liegen nicht im Repo** (Copyright) — lokal mit `tools/save_rom_versioned.ps1` versionieren  
3. **Vollständige ROM-Historie:** [`docs/ROM_HISTORY.md`](docs/ROM_HISTORY.md)  
4. Frühphase 001–015: [`docs/ROM_HISTORY_001-015.md`](docs/ROM_HISTORY_001-015.md)  
5. **Nach jedem pure-DE-Build:** README-Changelog + ROM-Übersicht + `tools/_rom_build_version.txt` mitziehen (Tag = ROM-Nummer **.0xx**)

---

## Changelog (aktuell)

Neueste pure-DE-Builds zuerst (**058 → 000**). Detail-Historie: [`docs/ROM_HISTORY.md`](docs/ROM_HISTORY.md).

> **Pflicht:** Jede neue Desktop-/`original\`-ROM **3.2.3.0xx** bekommt hier einen Changelog-Block mit **Datum**, **Commit-Hash** und Inhalt, plus Eintrag in der ROM-Übersicht.  
> **Datum** = Git-Commit-Datum des zugehörigen Feature-Commits (UTC/lokal laut Repo). Mehrere ROMs am selben Tag = mehrere Feature-Batches hintereinander. Zwischenbuilds ohne eigenen Commit sind markiert.

### 058 · 2026-07-24 — Pass-2: Systemtext-Ketten + EN-Grafiken

#### common.asm / battle.asm / std_text
- Heilung: „wurde von der Vergiftung/Verbrennung geheilt“ (kein EN-Calque)
- Tausch: Mon → OT ohne leeres `text ""` / mid-scroll
- Enemy-Item-on-Mon: Item- und Ziel-Zeile getrennt
- TM/HM: `beibringen?` / `nicht lernen` ohne extra A-Druck mittendrin
- Schnäppchen: Komma + Preis mit Punkt, dann Frage
- Markt: `erhalten.` auf Item-Zeile
- Move-Forget / Daycare-„sehen?“: mon auf eigener Zeile
- AP maximiert: **„wurden maximiert.“**
- Wrap: **„wurde von USER umschlungen!“**
- Käferturnier 2./3. Platz: `line` statt extra `para` nach Namen
- MistText: Dump-treu wieder `<USER>s` (GSC-DE)

#### Grafik (1-bit Pixel)
- `gfx/credits/theend.png`: **ENDE** (statt THE END)
- `gfx/stats/judge_stats.png`: DE-Kurzlabels KP/ANGR/VERT/INIT/SPAN/SPVE
- `gfx/diploma/diploma.png`: **GRATULATION** / **DIPLOM**
- Status-Icons (GIF/PAR/…) bereits DE (Claude-055) — bestätigt

#### Klassen
- Candela/Blanche/Spark: `Arena-Leiter` → **Arenaleiter**

### 057 · 2026-07-24 — Multi-Agent P0-Bugfixes (Namen / UI / Kampf / Maps)

6 parallele Explore-Agenten (Claude-ähnliche Bugklassen) → gezielter Fix-Batch.

#### Artnamen / Trainer
- **WYNAUT**→**ISSO**, **AMBIPOM**→**AMBIDIFFEL** (`data/pokemon/names.asm`)
- Zwillinge GSC-DE: **EVA & UTE**, **NORA & JO**, **LEA & IDA**
- Klassen: **Vogelfänger**, **Feuerspucker**, **Snowboarder**

#### Kampf / System-Text
- **MistText:** EN-Genitiv `USER>s` entfernt → `USER ist von WEISSNEBEL…`
- **ProtectedByText:** `ist geschützt durch …`
- Multi-Hit / Daycare-Level / Käferturnier-Punkte: Zahl + Einheit ohne harte `line`-Trennung

#### EN-UI-Reste
- Link: `Waiting…!` → **`Warte…!`**
- Ei-Nickname: **`Ei@`** (statt Egg)
- Trendy-Phrase Default: **`Nichts@`**
- Memory-Game: **№.Karten** / **№.Züge**
- Optionen: **US-Maß** (statt Imperial)
- Facade: **GIF/BRT/PAR** (statt Psn/Brn/Prz)

#### Maps
- Leerzeichen nach `text_ram` (Celadon-Villa, Teak-Schrein, Mania)
- Geld-Angebote reflow (Digda-Höhle, Route-32-Haus)
- `gefangenes #MON` ≤18 (Bill / Anemonia)
- Mon/Wochentag auf eigener Zeile (Bills Opa, Käferturnier-Gate)
- Hotel/Indigo/Trainer-Haus: mon-Name-Reflows

### 056 · 2026-07-24 — Claude-055 auf GitHub-`master` integriert

Commit: `cfe8d2bf0` (+ Docs-Follow-up)

- Claude-Arbeit aus `Desktop\germanpolishedcrystal-master-claude` (ROM **055**) in die pure-DE-Historie auf **`master`** gemergt (kein History-Rewrite)
- Verified rebuild (`make crystal`); Desktop-ROM **3.2.3.056**
- README/ROM_HISTORY: Claude-Fixes dokumentiert

### 055 · 2026-07-23 — Grafik-Übersetzung + Namens-Audit + Zeilenumbruch-Fixes *(Claude)*

Quelle: lokale Weiterarbeit in `germanpolishedcrystal-master-claude` (Commit dort: `4befb80`).  
Inhalt = Feature-Stand **055**; auf GitHub als **056**-Rebuild unter voller Historie 001–054.

#### Grafiken auf Deutsch
- Typ-Badges: `gfx/battle/types.png`
- Status-Icons: Kampf / Stats / Gegner (`gfx/battle/status*.png`, `gfx/stats/status.png`)
- Type-Chart „Basisitem“: `gfx/type_chart/bg.png` + `ob.png` (inkl. GHOST/STEEL-Zeile & ATK/DEF-Achse)
- U-Glyph- und Font-Fix: `gfx/font/vwf.png` (3×5-Pixelfont für Icon-Grafiken)

#### Pokémon-Artnamen-Audit
- **#001–#251** gegen GSC-DE-Dump geprüft; **10 echte Fehler** korrigiert, u. a.:
  - Tausch-Bug **Sneasel/Qwilfish** (SNIEBEL / BALDORFISH)
  - ALPUMA→**ALPOLLO**, AIPOM→**GRIFFEL**, WOOPER→**FELINO**, ESPEON→**PSIANA**
  - SLOWKING→**LASCHOKING**, DUNSPARCE→**DUMMISEL**, SCIZOR→**SCHEROX**, KINGDRA→**SEEDRAKING**
- Namen **#252–294** (Polished-exklusiv) gegen offizielle DE-Quellen verifiziert

#### Team-Rocket-Vorstand (offizielle DE-Namen)
| EN | DE |
|---|---|
| Archer | **Apollo** |
| Ariana | **Athena** |
| Proton | **Lance** |
| Petrel | **Lambda** |

#### Bugfixes / Überläufe
- **Landmark-Zeilenumbruch** (Pokégear-Kartenname, 12-Zeichen): Klippenhöhle, Azuria-Höhle, Magnettunnel, Schneegipfel, Pokémon-Liga/-Villa/-Labor
- **Doppelkomma-Bug** beim Zurückrufen im Kampf: `NAME,, komm zurück!` → `NAME, komm zurück!`
- **10 Eigenart-Text-Überläufe** im Summary (u. a. „Sehr trotzig“, „Hinterhältig“, „Willensstark“)
- Weitere Zeilenumbruch-/Überlauf-Fixes: Ecruteak-Schrein-Segnung, Lorelei (Eispfad), Rocket-Grunt-Klasse (**Rüpel**→**Rocket** GSC-Kanon), Jessie&James-Klasse, Fähigkeiten-Slideout-Box (Tile-Korruption bei langen Namen wie „Feuerfänger“)
- Map-Dialoge: Blackthorn-PC, Klippenrand-Pass, Tagespflege, Digda-Höhle, Ilex-Tor, Mr.#MON-Haus, Radioturm, Route 32/38/47, Alph-Ruinen, Einheitstunnel

#### Tooling (Claude-Nebencommits 2026-07-20)
- `tools/apply_gsc_dump_items_moves.py`: ROOT-Variable, Imports (`Path`/`re`), Script-Erweiterung für `descriptions.asm`

### 054 · 2026-07-17 — Stadt-Landmarks GSC-CAPS + Startmenü

Commit: `80e31e3c9`

- **Fly-/Karten-Landmarks:** alle GSC-Städte und Routen auf Dump-**CAPS**  
  (`NEUBORKIA`, `ROSALIA CITY`, `VIOLA CITY`, `DUKATIA CITY`, … · `ROUTE 1`–`46`)  
- Weitere Orte CAPS (u. a. `DUNKELHÖHLE`, `STEINEICHEN-WALD`, `SCHNELLBOOT`, `VERTANIA-WALD`, `DUELLTURM`, PC-Orte)
- **Startmenü** (Dump 91–99): `#COM@` statt `<PO><KE>Com@`; Käferturnier-Ende **`FERTIG@`** (statt „Beenden“)
- Rest-Startmenü bereits Dump-treu: `#DEX` · `#MON` · `BEUTEL` · `SICHERN` · `OPTION` · `ZURÜCK`

### 053 · 2026-07-17 — LEUCHTTURM / EISPFAD + Lind-Phone

Commit: `88ba9d755`

- Dialog **LEUCHTTURM** (Olivine Lighthouse) statt Title-Case „Leuchtturm“
- Phone PROF. LIND: **EISPFAD**; Grammatik *„soll es einen geben“*
- Music-Player-Songtitel CAPS (EISPFAD, DRACHENHÖHLE, MONDBERG, …)

### 052 · 2026-07-17 — Landmark-Gebäude CAPS + Shop-over18

Commit: `7a24f7949` (inkl. voriger Continue-/Mega-Batch-Commits auf `master`)

- Landmarks Gebäude: **RADIOTURM**, **ZINNTURM**, **TURMRUINE**, **ALPH-RUINEN**, **KNOFENSA-TURM**, **NATIONAL PARK**, **INDIGO PLATEAU**, …
- GiovannisCave / Eusine: RADIOTURM · ZINNTURM
- Celadon-Shop: over18-Splits (PIKACHU-Poster, Teppiche, Riesen-ONIX)
- Vorlauf auf `master` (vor .052-Build): Mega-Batch NPC-GSC (6-Agent), Continue-Pass Shops/Phone/CAPS, Dialog-Doppelstrich → `…`

### 051 · 2026-07-16 / 2026-07-17 — GSC-Kanon-Feinschliff (großer Pass)

Commits u. a.: `97c2fcee8` (16.), `f7490fae4` / `aa1749c40` / Tutor- & Kampf-Batch (17.)

System-, Kampf-, Item- und Dialog-Fixes im **Kristall-DE-Stil** (TEXTBOX ≤18). Multi-Agent-Scans + gezielte Fixes. CI wieder grün.

- **Stabilität:** Beeren-Crash (`rst $38` / Pluralize-Bank); Item-Terminator; Ability-Zeilen `Gegn. NAME` / `hat Ability`; battle USER/TARGET reflow; PC **PROF. EICHs PC**; Dex-Zeilen GSC; Wochentage DE; Status **GIF/PAR/SLF/BRT/GFR/TOX/K.O**; Shiny-Code aus pure entfernt  
- **Items:** Premierball, Luftballon, ~57 Namen GSC/offiziell, Fangtexte **„Toll!“**, CI ohne Glitzerbonbon  
- **UI/Dex:** **GR./GEW.**, NPC-Tausch-Reflow, **DUNKELHÖHLE**+Ö-Glyph, Arealiste DE, **Durchbruch**  
- **Story:** Route-31 „Tach auch!“, Rivale **`???`**, Telefon „speichert …s Nummer“, Kampftexte GSC, Map-CAPS, Ability-Descs ≤18  
- **Tutoren EN→DE:** Bodyslam, Ausdauer, Tiefschlag, Lawine, Bizarroraum, Abschlag, Agilität, Trickbetrug, Nachahmer, Zen-Kopfstoß  
- **Anglizismen behalten:** Wow / Hey / Yeah / O.K. / Cool / Items / Earl  

### 050 · 2026-07-16 — Summary-Reiter (PNG)

Commits: `398f3827a`, `b2b3c3476`, `8542fede6`, …

- Status-Screen-Tabs (OAM): **EP · Fähig. · Item · Att. · Ort · Ei** (statt Exp./Ability/Move/Met/Egg)  
- Fundort-Zeile: `Tag, Lv.15` statt `Tag bei Lv.15`  
- Pixel-Feinschliff Tabs (Fähig. / Gefund. / Ort); Ability-Tab-Label-Iterationen  

### 049 · 2026-07-16 — `#COM` / `#DEX`-Casing

Commit: `bf9876f7f`

- **PokéCOM** statt „PokéCom“ im Spezial-Item-/Pokégear-Kontext (`#COM`)  
- **`#DEX`** im Menü; Dialoge `#Com` → `#COM` (Center, Radio, …)  

### 048 · 2026-07-16 — QWERTZ / pure-DE v0.9

Commit: `99c599182`

- **QWERTZ**-Tastatur (DE-Layout), Standard in Optionen  
- Textstand pure-DE **v0.9** (ohne Shiny-Arbeitskopie)  

### 047 · 2026-07-16 — Optionen-Menüs / Perfect-DVs

Commit: `34ae9bd96`

- Optionen-Menüs weiter poliert  
- Perfect-DVs-Labels / Menü-Overflow-Feinschliff  

### 046 · 2026-07-16 — Kampf-Stil / Optionen GSC-DE

Commit: `194c64ce7`

- Kampf-Stil & Optionen-Texte GSC-DE (`battle style` & Co.)  

### 045 · 2026-07-16 — Script-Stubs Upstream-Restore

Commit: `fbee0f8a8`

- Kritische **Script-Stubs 1:1** Upstream: Mr.#MON-Ei, Route-43-Maut, Sudowoodo+Flee, Spielhalle, Alph, Phone-`jumpstd`, Rocket-Base, Buena-Preise  

### 044 · 2026-07-16 — Schwachstellen-Pass

Commit: `51443e17f`

- Restliches `#MON`, Phone „Sorry“, Item `(TRAGEN)`, over18 Elm/NG+, tote EN-Kommentare  

### 043 · 2026-07-16 — Dex QC + Aprikoko

Commit: `966573762`

- Dex **#001–#251** dump-soft (**251/251**)  
- Aprikoko-Box/Kurt; `#mon`→`#MON`; Parkball/EI-TICKET dokumentiert  

### 042 · 2026-07-16 — Mail- & Key-Items Finish

Commit: `bde6c87ea`

- Briefe, UP-GRADE (SILPH CO.), Key-Item-Texte  
- QC ~139 GSC-Item-Descs = Dump  

### 041 · 2026-07-16 — Items erweitert (Steine/Beeren)

Commit: `7ed6cea99`

- Evoli-Steine, Hyperheiler/Wutkeks, Beeren, King-Stein, Scope-Linse, Lauch, Seide, Buntflügel, Schiggykanne  
- Moves safe re-apply  

### 040 · 2026-07-16 — Items + Moves dump-Basis

Commit: `37edaa097`

- ~117 Item- + ~119 Move-Beschreibungen dump-nah  
- Fähigkeiten bleiben Regel **C** (PC-only DE)  

### 039 · 2026-07-16 — JOHTO/KANTO CAPS + `{d:}`-Docs

Commit: `77a071215`

- Dialog-CAPS **JOHTO** / **KANTO**  
- Dynamische Breite `{d:…}` dokumentiert  

### 038 · 2026-07-16 — over18 / Rufe / Scherzbuch

Commit: `17d564b25`

- over18-Reflow; Mon-Rufe CAPS; Scherzbuch-Autoren; „Total cool!“  

### 037 · 2026-07-16 — Speaker / Journal / VERKÄUFER

Commit: `6430b8bc7`

- Zwillinge/Guests/Devs CAPS; **VERKÄUFER**  
- Journal: PHILENA IVY / STEVEN / CYNTHIA / WESTWOOD / WILLOW  

### 036 · 2026-07-16 — Namen-Konsistenz (JUTTA/HANNES/…)

Commit: `12fe0274e`

- JUTTA / HANNES / SATORU; IVY / FAITH / CHERYL / REI  
- Trade/Wonder-OTs CAPS; KIRK / SILVER  

### 035 · 2026-07-16 — Trainer-Namen GSC-Map + CAPS

Commit: `8357b0cd4`

- Trainer-Namen pret↔Dump-Map; Rest CAPS  
- BT-OTs; Guest-Speaker CAPS; Phone Dump-align  

### 034 · 2026-07-16 — Zwischenbuild (Phone → Trainer-Namen)

- Übergang Phone-fertig → Trainer-Namen-Block  
- Rebuild / Teilpass ohne eigenen großen Feature-Commit  

### 033 · 2026-07-16 — Alle Phone-Rematch-Namen DE

Commit: `6af12bbc5`

- **Alle** Phone-Rematch-Trainer-Anzeigenamen DE (Dump-align)  

### 032 · 2026-07-16 — Radio / Pokégear / Duellturm

Commit: `b7be4c76f`

- Phone-Namen-Teil; #MON-Kanal & EICHs Talk  
- Song/Landmark **Duellturm**  

### 031 · 2026-07-16 — Buena-Passwörter GSC-DE

Commit: `f7150d7cb`

- Passwörter: NEUBORKIA / ROSALIA / AZALEA  
- Typen FLUG / KÄFER / PFLANZE; Radio EICH / #MON-Musik / Glückskanal  

### 030 · 2026-07-16 — Phone-Anzeigenamen (REINHOLD …)

Commit: `1cbc2ecd0`

- Joey→**REINHOLD**, Wade→**ALFONS**, Ralph→**RALF**, Anthony→**ANTON**, Chad→**UDO**, Tiffany→**TIFFY**, Erin→**LOTTE**  

### 029 · 2026-07-16 — Phone/Buena/Shamouti/LOTTE

Commit: `f022783a4`

- Phone Caller+Overworld dump-nah; Buena-Telefon + Radio in `common.asm`  
- Lyra-Phone; Shamouti/Faraway; Erin→**LOTTE**  

### 028 · 2026-07-16 — Zwischenstand vor LOTTE

- Textstand **vor** Erin→LOTTE; Basis für 029  

### 027 · 2026-07-16 — Optional-Scan (Sorry / CAPS)

Commit: `a81bcb44d`

- EN-„Sorry“→DE; Phone `#MON`  
- DimCave / KRAFTWERK / AZURIA / GELBER WALD / Shamouti CAPS  

### 026 · 2026-07-16 — Rest-Pass (`#MON` / Uni / Turm / common)

Commit: `c014cc252`

- `#mon`→`#MON` global (~700+)  
- Celadon-Uni/Hotel; **DUELLTURM** + Kampffabrik  
- Telefon Mama/LIND/BILL; `common.asm` / `std_text`; Fanclub, Dojo, Yellow Forest, …  

### 025 · 2026-07-16 — Rest-Kanto + FARBORDEN

Commit: `77b90539c`

- MARMORIA … ZINNOBER; Arenen FELS–ERDORDEN, **FARBORDEN**  
- Safari, Kraftwerk, SILPH; Liga-Tor; Badge-Kurz **Farbe**  

### 024 · 2026-07-16 — Liga + Kanto-Start + M.S. AQUA + Silberberg

Commit: `f5f0ab91c`

- **TOP VIER:** WILLI, KOGA, BRUNO, MELANIE, SIEGFRIED; Ruhmeshalle  
- ALABASTIA / VERTANIA; PROF. EICH; ROT am Silberberg  
- Route 22/26/27 / SIEGESSTRASSE  

### 023 · 2026-07-16 — Badge-String-QC (Flügel + Route 23)

Commit: `6f9a69f11`

- Zephyr→**FLÜGELORDEN** (Viola-Haus)  
- Route-23-Badge-Checks alle DE (Flügel/Insekt/Basis/Phantom/Faust/Stahl/Eis/Drachen)  

### 022 · 2026-07-16 — Anemonia / Rocket / Ebenholz (Faust + Drache)

Commit: `19cdfb0c6`

- HARTWIG/**FAUSTORDEN**; Rocket-Passwörter FLEGMONRUTE / RATTIKARLRUTE / PREISET GIOVANNI  
- SANDRA/**DRACHENORDEN**; Drachenschrein-Quiz; Route 44–46 / Eispfad  

### 021 · 2026-07-16 — Teak / See / Oliviana (Phantom + Stahl)

Commit: `ba14352a6`

- JENS/**PHANTOMORDEN**; Brand-/Zinnturm; Tanztheater; Route 38–39  
- Mahagoni/NORBERT; JASMIN/**STAHLORDEN**; Leuchtturm; STÄRKE-Fix (Anemonia)  

### 020 · 2026-07-16 — Mid-Johto (Route 34–37 / BASISORDEN)

Commit: `0cccdff22`

- Route 34–37, Pension, **DUKATIA**, BIANKA/**BASISORDEN**  
- Kaufhaus, Spielhalle, Radioturm, Untergrund, Nationalpark, Käferturnier  

### 019 · 2026-07-16 — Azalea / Ilex / Union / INSEKTORDEN

Commit: `38fcd9069` (+ `0fed834e9`-Linie)

- Route 32–33, **Azalea**, Flegmon-Brunnen, Holzkohle, Kurt, Ilex, Einheitstunnel  
- **INSEKTORDEN** (KAI)  

### 018 · 2026-07-16 — Route 32 → Azalea-Eingang

Commit: `0fed834e9`

- Route 32 dump-align; Richtung Flegmon-Brunnen / Ilex / Union  
- Azalea-Eingang  

### 017 · 2026-07-15 / 2026-07-16 — Zwischenbuild Viola → Route 32

- Viola-Umfeld & Übergang Route 32  
- Arena-/Schild-Texte; Checkpoint vor Azalea-Batch  

### 016 · 2026-07-15 — Viola-Feinschliff (Gramps / FALK / PKMN-ARENA)

Commit: `d6aa5a2e1`

- Gramps / FALK / **PKMN-ARENA**-Wortlaut dump-nah  

### 015 · 2026-07-15 — Route 31 / Viola / Knofensa / FLÜGELORDEN

Commit: `530c8902c`

- Route 31, **Viola**, Knofensa-Turm, **FALK**  
- Orden **FLÜGELORDEN** (nicht Zephyr); ARENALEITER CAPS; Badge-Kurz **Flügel**  

### 014 · 2026-07-15 — Mama „Schatz“ + Rosalia-Dump

Commit: `255ed33fe`

- Mama: Dump „Baby“ → Override **Schatz**  
- ROSALIA, Rival, Eich-Abschied, Guide Center/Mart  

### 013 · 2026-07-15 — Route 30 / Mr.#MON / Cherrygrove

Commit: `a0bad05a7`

- Route 30, Mr.#MON, Cherrygrove weiter dump-align  

### 012 · 2026-07-15 — Early-Game Dump (Mama / Neuborkia / Rosalia)

Commit: `3213043cb`

- Mama / **NEUBORKIA** / Cherrygrove dump-nah  
- #MON-COM, Mama-Auftrag, Route 29, Anfänger-Guide; Polished **LYRA** bleibt  

### 011 · 2026-07-15 — Intro „verschlafen“

Commit: `1f403806e`

- Intro-Text **verschlafen** (statt „genickert“)  

### 010 · 2026-07-15 — Deep-Scan stubbed Scenes + dynamic text

Commit: `c96491575`

- Weitere stubbed Scenes (Häfen, Cable Club, Zinnturm, Drachenschrein, Teak-Arena, Rocket B3F, …)  
- Dynamischer Text Spielhalle/Friseure/Käferturnier/Alph; mid-`@`-String-Abbrüche  

### 009 · 2026-07-15 — Softlocks: `sdefer` + premature `done`

Commits: `27988389d`, `086d10d70`, `2b9ba2e09`

- **11×** fehlende `sdefer`; **68×** premature `done` vor `text_ram`/`text_decimal`  
- Elm MeetElm-Cutscene; Lyra Starter-Mon-Name; DayCare-Lyra-Pronomen  

### 008 · 2026-07-12 / 2026-07-15 — GSC-Canon-Marker + Overflow-Fixes

Commits: `da787a836` (12.), `fa38060bc` (15.), …

- Markierung **German GSC-canon localization**  
- Kampftext-Overflow / Datei-Korruption gefixt  
- README/WIP-Hinweise  

### 007 · 2026-07-12 — Title-Screen DE-Credit + Docs

Commits: `36578c8bc`, `485f8d4a0`, `8e9c8a911`, …

- Title-Screen DE-Credit + Lesbarkeit (uppercase/spacing)  
- README/INSTALL DE; WIP-Hinweis  

### 006 · 2026-07-11 / 2026-07-12 — Proofreading + Charmap Ö

Commits: `4370a1209` (Ö), `641690175`, `74185b56d` … `7e1af432e`

- Großes **Ö** im Charmap  
- Proofreading-Runden (Grammatik, UI, Party, PC, BSOD)  
- EN-Reste; New-Game-Optionen-Labels gekürzt  

### 005 · 2026-07-11 — Proofreading Runde 1–2

Commits: `641690175`, `74185b56d`

- Native-Speaker-Pass: ~97 Issues / 72 Dateien  
- Zweite Runde: 29 Grammar/Spelling-Fixes  

### 004 · 2026-07-10 — Reflow Dex/Items/Moves + Casing

Commits: `7fab35dd5`, `d2209750d`, `4ba4f1b9a`, …

- Dex-/Item-/Move-/Ability-Reflow fortgesetzt  
- `#COM`/`#DEX`-Casing-Korrekturen; Rest-`line`/`line`-Bugs  

### 003 · 2026-07-10 — Massiver 18-Zeichen-Reflow

Commit: `b92c82d01`

- Dialoge auf **≤18** Anzeigezeichen  
- **~1736×** `line`/`line` → `line`/`cont` (Rendering-Bug)  
- DST-Overflow; Grammar `dass`→`das`; `#COM`-Casing  

### 002 · 2026-07-10 — Checkpoint funktionierender DE-Build

Commit: `21b180fbf`

- Bestätigter spielbarer deutscher Build (Checkpoint)  

### 001 · 2026-07-09 — Erster versionierter DE-Build

Commit: `65a2cf4f5`

- Initial upload: **Deutsche Übersetzung gestartet**  
- Erster versionierter pure-DE-Text-Layer (Polished Crystal 3.2.3)  

### 000 · vor 2026-07-09 — Phase 0 (keine ROM-Nummer)

Keine fortlaufende `.000`-ROM. Session-Phasen-Builds ohne Zähler (lokal, nicht Repo):

- Phase 1 UI · Phase 2 Kampf · Phase 3 Namen · Phase 4 Descs · Phase 5a Start-Johto  
- Desktop-Labels z. B. `phase1-ui.gbc`, `phase2-battle.gbc`, `p4p5a.gbc`, `5a-viola.gbc`, …  
- Ab **001** beginnt die nummerierte pure-DE-Serie (`tools/save_rom_versioned.ps1`)  

---

## ROM-Übersicht 001–058

| Block | Thema |
|---|---|
| **001–008** | Fundament DE, Reflow, Proofreading |
| **009–011** | Softlocks & Script-Fixes |
| **012–018** | Early-Johto Dump (bis Azalea-Eingang) |
| **019–023** | Mid-Johto + Badge-QC |
| **024–026** | Liga, Kanto, Rest-Pass |
| **027–033** | Phone / Buena / Radio |
| **034–039** | Namen, CAPS, Feinschliff |
| **040–045** | Items, Moves, Dex, Script-Stubs |
| **046–048** | Optionen, QWERTZ / v0.9 |
| **049** | `#COM` / `#DEX`-Casing (PokéCOM) |
| **050** | Summary-Reiter DE (EP/Fähig./Att./Ort/Ei) |
| **051** | GSC-Kanon-Feinschliff (Kampf/UI/Items/Tutoren/CI) |
| **052** | Landmark-Gebäude CAPS + Shop-over18 + Mega-/Continue-Batch |
| **053** | LEUCHTTURM / EISPFAD + Lind-Phone-Grammatik |
| **054** | Stadt-/Routen-Landmarks CAPS + Startmenü `#COM` / `FERTIG` |
| **055** | Grafik-DE + Artnamen-Audit + Rocket-Vorstand + Überlauf-Fixes *(Claude)* |
| **056** | Claude-055 auf GitHub-`master` integriert + verified rebuild |
| **057** | Multi-Agent P0: ISSO/AMBIDIFFEL, Zwillinge, Waiting, Maps |
| **058** | Pass-2: common-Ketten + ENDE/Judge/Diplom-Gfx |

Detail pro Nummer: [`docs/ROM_HISTORY.md`](docs/ROM_HISTORY.md)  
Zähler: `tools/_rom_build_version.txt` · **aktuell 058** · nächster Build: **059**

---

## Was ist übersetzt?

| Bereich | Inhalt |
|---|---|
| **Karten / NPCs** | ~607 Map-Skripte (Dialoge, Schilder, Story) |
| **Telefon** | Caller, Overworld, Rematch-Namen |
| **System / Kampf** | `common.asm`, Kampftexte, findet/erhält, Whiteout, … |
| **UI** | Startmenü, Beutel, Optionen, Party, PC, Summary |
| **Daten** | Artnamen, Dex, Attacken, Fähigkeiten, Wesen, Items, Orden, Typen |
| **Orte** | GSC-DE-Glossar (NEUBORKIA, DUKATIA CITY, …) |
| **BT & Co.** | Duellturm / Kampffabrik UI & Trainertexte |

### Bewusst nicht 1:1 Kristall

- Polished-only-Inhalte (neue Orte, Features) → DE im **GSC-Stil**, kein Dump  
- Gen-3+ (Fähigkeiten, Wesen, phys./spez. Split) → offizielle DE-Begriffe  
- Grafik-Text in manchen Tiles/Logos kann EN bleiben  

---

## Qualitätsregeln

| Regel | Detail |
|---|---|
| **A / B / C** | **A** Dump 1:1 · **B** Dump + PC-Mechanik · **C** PC-only DE + CAPS |
| **Breite** | TEXTBOX **18**; `#MON` / `#BALL` / `#DEX` / `#COM` = 7; `<PLAYER>` = 7 |
| **`{d:NAME}`** | Wird beim Assemblieren ersetzt (feste Breite) |
| **Verboten** | `<PLAY_G>` · `;` in Strings · `@` mitten im String |
| **Formulierungen** | `findet` / `erhält` · `PKMN-ARENA von …` · CAPS-Orte |
| **Override** | Mama: **Schatz** (nicht Dump „Baby“) |

---

## Orden & Orte

### Johto (Dump → Kurzname UI)

| Orden | Kurz | Orden | Kurz |
|---|---|---|---|
| FLÜGELORDEN | Flügel | STAHLORDEN | Stahl |
| INSEKTORDEN | Insekt | FAUSTORDEN | Faust |
| BASISORDEN | Basis | EISORDEN | Gletscher *(UI)* |
| PHANTOMORDEN | Phantom | DRACHENORDEN | Drache |

### Kanto

| Orden | Kurz | Orden | Kurz |
|---|---|---|---|
| FELSORDEN | Fels | SEELEN-/SUMPFORDEN | Seele / Sumpf |
| QUELLORDEN | Quell | VULKANORDEN | Vulkan |
| DONNERORDEN | Donner | ERDORDEN | Erde |
| FARBORDEN | Farbe | | |

### Orte (Auswahl)

NEUBORKIA · ROSALIA · VIOLA · AZALEA · DUKATIA · TEAK · OLIVIANA · ANEMONIA · MAHAGONIA · EBENHOLZ · ALABASTIA · VERTANIA · MARMORIA · AZURIA · ORANIA · LAVANDIA · PRISMANIA · FUCHSANIA · SAFFRONIA · ZINNOBERINSEL · INDIGO PLATEAU · SILBERBERG · SEE DES ZORNS · KNOFENSA-TURM · M.S. AQUA · DUELLTURM

---

## Tools & Docs

| Datei / Ordner | Zweck |
|---|---|
| [`INSTALL.md`](INSTALL.md) | Bauen (DE) |
| [`docs/ROM_HISTORY.md`](docs/ROM_HISTORY.md) | ROM 001–055 Detail / Historie |
| `tools/save_rom_versioned.ps1` | Desktop-ROM `.001`, `.002`, … |
| `tools/_gsc_de_crystal_msg.txt` | GSC-DE-Dump-Referenz |
| `tools/gsc_canon_setup/` | Batch-Regeln & Scanner |

---

## Residuen

- Grafik-Text in manchen Tiles/Logos kann EN bleiben  
- PC-only-Ecken (z. B. Navel/Faraway-Jungle, Shamouti-Stubs) — Feinschliff nach Playtest  
- Polished-only-Dialoge / restliche EN-Sätze nach Playtest  
- Stil, Breite, Kanon-Namen: Feedback erwünscht  
- ~~Stadt-Landmarks Title Case~~ → erledigt in **054**  
- ~~Startmenü `PokéCom` / Beenden~~ → erledigt in **054** (`#COM` / `FERTIG`)  

---

## Branch

Nur **`master`** — Default auf GitHub, CI (`build.yml` + Dev Rolling Release) und Entwicklung.  
Shiny-/ARBEITSKOPIE-Gameplay gehört **nicht** ins Repo.

---

## Credits (Lokalisierung)

| | |
|---|---|
| **Spiel / Engine** | Rangi42 & Polished-Crystal-Mitwirkende |
| **Disassembly** | pret / pokecrystal |
| **DE GSC-Kanon-Lokalisierung** | Only1Rudeboy |
| **KI-Unterstützung** | Grok 4.5 (xAI); Claude (Anthropic) ab ROM **055** — WIP |

---

# Pokémon Polished Crystal

> **Übersetzungshinweis:** Der folgende Abschnitt ist die **deutsche Übersetzung** der originalen README von Polished Crystal (Rangi42). Er beschreibt das **Originalspiel** und seine Features — nicht die Lokalisierungsarbeit oben. Der englische Originaltext findet sich im Upstream-Repository.

Dies ist ein eigenes Pokémon-Spiel auf Basis der [Pokémon-Crystal-Disassembly](https://github.com/pret/pokecrystal).

Ziel ist genau das, was der Titel sagt: eine verbesserte, polierte Version von Pokémon Crystal. Es behebt Fehler, berücksichtigt offizielle Spieländerungen seit 2001 und bringt eigene Ideen ein. Viele Features stellen entfallene R/B/G-Inhalte wieder her oder stammen aus HG/SS.

Seit Jahren gab es vage Pläne für ein eigenes Pokémon-Spiel. Die Arbeit an der Crystal-Disassembly und die saubere Code-Organisation sind beeindruckend. Durch die Open-Source-Freigabe (und inspirierende ROM-Hacks) wird dieses Spiel endlich Realität.

> Es gibt viele Wege, Spiele zu machen, aber die Art, wie wir bei Game Freak arbeiten, unterscheidet sich vielleicht von anderen Firmen. Das heißt: Wir ändern und verfeinern ständig, was wir uns ausgedacht haben. Um ein spaßiges Spiel noch spaßiger und runder zu machen, nehmen wir das Vorhandene und denken es von vorn. Und um das Spiel möglichst unterhaltsam zu machen, ändern und justieren wir endlos, egal wie lange es dauert. Das mag nicht der beste Weg sein, aber ich halte diese Feinarbeit für wichtig, damit unsere Spiele spaßig und besser werden.
>
> — Junichi Masuda, „[HIDDEN POWER of masuda No. 7](https://www.gamefreak.co.jp/blog/dir_english/?p=21)“

## Herunterladen und spielen

Die **aktuelle offizielle Release-Version** des Originals ist **v3.2.3** (das „Polished Crystal“-Release). Sie ist von Anfang bis Ende spielbar und enthält große Überarbeitungen an Gameplay, Mechanik und Komfort. Ein ausführlicherer Changelog folgt noch; die wichtigsten Punkte stehen unten.

- **[v3.2.3 hier herunterladen (Original-Release)](https://github.com/Rangi42/polishedcrystal/releases/tag/v3.2.3)**

> **Zu diesem Fork:** Für die **deutsche Fassung** baust du idealerweise **aus diesem Repository** (oder nutzt eine selbst erstellte ROM). Offizielle Upstream-ROMs sind **englisch**.

Die vorherige offizielle Version war [v3.1.1](https://github.com/Rangi42/polishedcrystal/releases/tag/v3.1.1) (1. Februar 2025).

*Fragen zu Spiel oder Patchen? [Lies die FAQ](FAQ.md)!* (FAQ im Upstream ggf. noch auf Englisch.)

## Was ist neu in v3.2.3

Kurze Zusammenfassung der großen Änderungen und Ergänzungen. Ein detaillierter Changelog folgt.

- **Anpassbarer Neues-Spiel-Setup:** Wesen und Fähigkeiten ein/aus, EV-Regeln (klassisch unbegrenzt, modern 510, oder aus), plus weitere Optionen vor dem Start.
- **DVs bestimmen nicht mehr Wesen/Schillernd/Geschlecht/Icognito-Form:** DVs beeinflussen weiter leichte Farbvarianten derselben Art; alles andere läuft getrennt.
- **Überarbeitete Kampf-Engine und HUD:**
  - Fähigkeiten werden unterstützt.
  - Attacken verhalten sich näher an modernen Versionen.
  - Kleinere HUD-Verbesserungen machen Kämpfe flüssiger.
- **Neue Attacken-Animationen:** Viele Attacken haben aktualisierte Animationen.
- **Optimierte Engine und 60-fps-Overworld:** Starke Engine-Optimierung; die Overworld läuft mit 60 Bildern pro Sekunde.
- **Neues Lagersystem:** PC-Oberfläche näher an modernen Spielen — Boxen wechseln, Pokémon verschieben, Team verwalten mit weniger Speicher-Ärger.
- **HGSS-inspirierter Pokédex:** Basiswerte, Eigruppen und eine ausführlichere Fundort-Karte mit *allen* Erhaltsmethoden.
- **Besseres Overworld-Wetter:** Statt nur Abdunkeln siehst du echten Regen, Schnee oder Sandstürme in passenden Gebieten.
- **Neue Status-Übersicht:** Ersetzt den klassischen Statusbildschirm. Zeigt Wesen, Fähigkeiten, gesehen/gefangen und mehr.

## Features

Die volle Feature-Liste steht in [FEATURES.md](FEATURES.md). Auszüge:

- **289 Pokémon-Arten**, inklusive neuer Entwicklungen, plus **56 kosmetische Formen** (z. B. Karpador-Muster, Flug-/Surf-Pikachu, Arbok-Muster, Icognito-Formen) und **46 Varianten** (Alola, Galar, Hisui, …) — insgesamt **391 einzigartige Pokémon**.
- **73 neue Attacken** (72 bei Faithful-Builds), **75 TMs** und **31 Attacken-Lehrer**.
- Moderne Mechaniken: **Fee-Typ**, **physisch/speziell-Split**, **Wesen**, **Fähigkeiten** und mehr.
- **Unbegrenzte TMs** und Komfort wie **Laufschuhe** und dauerhaftes **Schutz**.
- **Neue/überarbeitete Karten:** teils aus R/B/G, teils aus HG/SS „devamped“, plus Originale.
- **Neue Charaktere** u. a. Lorelei und Agatha (R/B/G), Lyra und Team-Rocket-Führung (HG/SS).
- **Mehr Postgame:** Arenaleiter-Rematches, neues Event nach dem Kampf gegen Rot, und mehr.
- **Bessere Levelkurve** mit stetig steigender Herausforderung.
- **Musik und Grafik** aus neueren Generationen adaptiert.

## Diskussion

Fragen oder Kommentare? Schau auf eine dieser Seiten oder schreib dort. (Zuerst die [FAQ](FAQ.md) lesen!)

- [Discord](https://discord.gg/ZK5pqK8)
- [Skeetendo](https://hax.iimarckus.org/topic/6874/)
- [PokéCommunity](http://www.pokecommunity.com/showthread.php?t=373172)
- [Romhack.me](http://www.romhack.me/polishedcrystal/wall/)
- [/r/PokemonROMHacks](https://www.reddit.com/r/PokemonROMhacks/comments/51kbcn/pok%C3%A9mon_polished_crystal_200/)
- [Nuzlocke Forums](http://s7.zetaboards.com/Nuzlocke_Forum/topic/11003710/)
- [Pokémon Hackers Online](http://www.pokemonhackersonline.com/showthread.php?t=15811)

Zusätzliche Ressource:

- [PolishedDex](https://www.polisheddex.app/) — Online-Begleiter für Polished Crystal: durchsuchbarer Pokédex, Attacken, Items, Orte, Fähigkeiten, Events und Team-Builder. Enthält FAQ und Links zu den offiziellen ROM-Releases — praktisch zum Nachschlagen beim Spielen. *(Inhalte dort beziehen sich auf das Original und sind größtenteils auf Englisch.)*

## Screenshots

![title-screen](screenshots/title-screen.png)
![which-photo](screenshots/which-photo.png)
![running-shoes](screenshots/running-shoes.png)
![town-map](screenshots/town-map.png)

![lyra](screenshots/lyra.png)
![cherrygrove-city](screenshots/cherrygrove-city.png)
![pokemon-center](screenshots/pokemon-center.png)
![bag](screenshots/bag.png)

![oaks-aide](screenshots/oaks-aide.png)
![move-tutor](screenshots/move-tutor.png)
![moss-rock](screenshots/moss-rock.png)
![rich-boy](screenshots/rich-boy.png)

![tm43](screenshots/tm43.png)
![game-corner-prizes](screenshots/game-corner-prizes.png)
![goldenrod-move-tutor](screenshots/goldenrod-move-tutor.png)
![eviolite](screenshots/eviolite.png)

![wonder-trade](screenshots/wonder-trade.png)
![ecruteak-shrine](screenshots/ecruteak-shrine.png)
![cowgirl](screenshots/cowgirl.png)
![olivine-city](screenshots/olivine-city.png)

![remoraid](screenshots/remoraid.png)
![team-rocket](screenshots/team-rocket.png)
![steelix](screenshots/steelix.png)
![custom-map](screenshots/custom-map.png)

![ice-rock](screenshots/ice-rock.png)
![hex-maniac](screenshots/hex-maniac.png)
![route-45](screenshots/route-45.png)
![summary](screenshots/summary.png)

![leppa-berry](screenshots/leppa-berry.png)
![regional-forms](screenshots/regional-forms.png)
![move-reminder](screenshots/move-reminder.png)
![moves](screenshots/moves.png)

![sylveon-moonblast](screenshots/sylveon-moonblast.png)
![togetic-fairy-wind](screenshots/togetic-fairy-wind.png)
![aerodactyl-fossil](screenshots/aerodactyl-fossil.png)
![cerulean-city](screenshots/cerulean-city.png)

![celadon-city](screenshots/celadon-city.png)
![weather](screenshots/weather.png)
![viridian-forest](screenshots/viridian-forest.png)
![mismagius](screenshots/mismagius.png)

![fighting-dojo](screenshots/fighting-dojo.png)
![silph-co](screenshots/silph-co.png)
![stormy-beach](screenshots/stormy-beach.png)
![rock-tunnel](screenshots/rock-tunnel.png)

![safari-zone](screenshots/safari-zone.png)
![soul-house](screenshots/soul-house.png)
![cinnabar-island](screenshots/cinnabar-island.png)
![seafoam-islands](screenshots/seafoam-islands.png)
