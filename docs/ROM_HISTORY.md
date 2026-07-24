# ROM-Historie — Polished Crystal DE (GSC-Kanon)

Vollständige Liste der **lokal versionierten Builds**  
`polishedcrystal-3.2.3.001` … `polishedcrystal-3.2.3.056`  
(Zähler: `tools/save_rom_versioned.ps1` / `tools/_rom_build_version.txt`).

**ROMs liegen nicht im Repo** (Copyright). Hier steht nur, **was** pro Nummer (bzw. Nummernblock) typischerweise gebaut und getestet wurde.

Quellen: Git-Commits, README-Changelog, `CONTINUE.md`, Session-Notizen (2026-07).  
Wo eine Nummer **kein** eigener Feature-Commit war, ist das als Zwischen-/Rebuild markiert.

**Aktueller Zähler:** **056** (nächster Build wäre **057**).  
**Spiel-Basis:** Polished Crystal **3.2.3** · Fork: [Only1Rudeboy/germanpolishedcrystal](https://github.com/Only1Rudeboy/germanpolishedcrystal) · Branch **`master`**

---

## Phasen-Überblick

| Phase | ROM | Thema |
|---|---|---|
| 0 | *(vor .001)* | Session-ROMs / Phasen-Builds ohne fortlaufende Nummer |
| A | **001–008** | Fundament DE-Lokalisierung, Reflow, Proofreading |
| B | **009–011** | Kritische Softlocks (`sdefer`, `text_ram`, Deep-Scan) |
| C | **012–018** | Early-Johto GSC-Dump (Start → Viola → Richtung Azalea) |
| D | **019–023** | Mid-Johto Dump + Badge-QC |
| E | **024–026** | Liga, Kanto, Rest-Pass |
| F | **027–033** | Optionals, Phone, Buena, Radio |
| G | **034–039** | Namen, CAPS, Feinschliff |
| H | **040–045** | Items/Moves/Dex-QC + Script-Stubs |
| I | **046–049** | Optionen-UI, QWERTZ / v0.9, `#COM`-Casing |
| J | **050–054** | Summary-Tabs, GSC-Feinschliff, Landmark-CAPS, Startmenü |
| K | **055–056** | Grafik-Übersetzung, Namens-Audit, Claude-Merge auf GitHub-`master` |

---

## Phase 0 — Vor der Nummernserie

Frühe Session-ROMs (siehe `CONTINUE.md`), z. B.:

| Label (Desktop) | Inhalt (Kurz) |
|---|---|
| `…-phase3-names` / `…-phase4-desc` / `…-p4p5a` | Phasen 3–5a: Namen, Beschreibungen, Start-Story |
| `…-5a-neuborkia` / `…-5a-viola` / `…-5a-dense` / `…-5a5-azalea` … | Johto densify / Gym-Canon-Batches |
| `…-5b1-teak` … `…-5d-kanto` / `…-5c-liga` | Teak → Kanto / Liga |
| `…-qc-final` / `…-qc2-mega` / `…-rim56` / `…-gsc-canon` | QC- und Rand-Passes |

Ab **`.001`** zählt `save_rom_versioned.ps1` fortlaufend.

---

## Phase A — 001–008 · Fundament

| ROM | Inhalt |
|---|---|
| **001** | Erster versionierter DE-Build nach Initial-Upload (`65a2cf4f5`). Spielbarer deutscher Text-Layer. |
| **002** | Checkpoint / frühe Stabilität (`21b180fbf`-Linie). |
| **003–004** | **Reflow ≤ 18** Zeichen; massenhaft `line`/`line` → `line`/`cont`; DST; `#COM`/`#DEX`-Casing; Dex/Items/Moves/Abilities reflow (`b92c82d01` …). |
| **005–006** | Proofreading-Runden (Grammatik, UI, Party, PC, BSOD); EN-Reste; New-Game-Optionen-Labels gekürzt. Charmap **Ö**. |
| **007** | Title-Screen DE-Credit + Lesbarkeit; README/INSTALL DE; WIP-Hinweis. |
| **008** | Markierung **German GSC-canon localization** (`fa38060bc`); Kampftext-Overflow / Datei-Korruption gefixt. |

**Ergebnis ~008:** Vollständig deutsch spielbar; noch nicht überall dump-1:1.

---

## Phase B — 009–011 · Softlocks & Scripts

| ROM | Commit (u. a.) | Inhalt |
|---|---|---|
| **009** | `27988389d`, `086d10d70`, `2b9ba2e09` | **11×** fehlende `sdefer`; **68×** premature `done` vor `text_ram`/`text_decimal`; Elm MeetElm-Cutscene; **Lyra** Starter-Mon-Name; DayCare-Lyra-Pronomen. |
| **010** | `c96491575` | Deep-Scan: weitere stubbed Scenes (Häfen, Cable Club, Zinnturm, Drachenschrein, Teak-Arena, Rocket B3F, …); dynamischer Text Spielhalle/Friseure/Käferturnier/Alph; mid-`@`-String-Abbrüche. |
| **011** | `1f403806e` | Intro-Text **verschlafen** (statt „genickert“). |

**Ergebnis ~011:** Start-Story und viele globale Events wieder stabil (Upstream-Logik).

---

## Phase C — 012–018 · Early-Johto Dump *(inkl. 016 / 017)*

| ROM | Commit (u. a.) | Inhalt |
|---|---|---|
| **012** | `3213043cb` | Mama / **NEUBORKIA** / Cherrygrove dump-nah; #MON-COM; Mama-Auftrag; Route 29; Anfänger-Guide. Polished **LYRA** bleibt. |
| **013** | `a0bad05a7` | Route 30, Mr.#MON, Cherrygrove weiter dump-align. |
| **014** | `255ed33fe` | Mama: Dump „Baby“ → User-Override **Schatz**. ROSALIA, Rival, Eich-Abschied, Guide Center/Mart. |
| **015** | `530c8902c` | Route 31, **Viola**, Knofensa-Turm, **FALK**; Orden **FLÜGELORDEN** (nicht Zephyr); ARENALEITER CAPS; Badge-Kurz **Flügel**. |
| **016** | `d6aa5a2e1` | **Viola-Feinschliff:** Gramps / FALK / **PKMN-ARENA**-Wortlaut dump-nah (Gramps-Dialog, Arena-Formulierung). |
| **017** | *(Zwischenbuild, Folge von 016 / Vorbereitung 018)* | Viola-Umfeld & Übergang Route 32: weitere Arena-/Schild-Texte, Build-Checkpoint vor Azalea-Batch. |
| **018** | `0fed834e9` (+ Übergang) | **Route 32 → Azalea-Start:** Flegmon-Brunnen-Richtung, Ilex/Union-Vorbereitung; dump-align Route 32 und Azalea-Eingang. |

**Ergebnis ~018:** Early-Johto bis vor/in Azalea GSC-spürbar; Regelwerk **A/B/C** etabliert.

---

## Phase D — 019–023 · Mid-Johto + Badge-QC

| ROM | Commit (u. a.) | Inhalt |
|---|---|---|
| **019** | `38fcd9069` / `0fed834e9` | Route 32–33, **Azalea**, Flegmon-Brunnen, Holzkohle, Kurt, Ilex, Einheitstunnel; **INSEKTORDEN** (KAI). |
| **020** | `0cccdff22` | Mid-Johto: Route 34–37, Pension, **DUKATIA**, BIANKA/**BASISORDEN**, Kaufhaus, Spielhalle, Radioturm, Untergrund, Nationalpark, Käferturnier. |
| **021** | `ba14352a6` | **TEAK** / See des Zorns / Oliviana: JENS/**PHANTOMORDEN**; Brand-/Zinnturm; Tanztheater; Route 38–39; Mahagoni/NORBERT; JASMIN/**STAHLORDEN**; Leuchtturm; STÄRKE-Fix (Anemonia). |
| **022** | `19cdfb0c6` | **Anemonia** + Rocket-Base + Ebenholz: HARTWIG/**FAUSTORDEN**; Passwörter FLEGMONRUTE/RATTIKARLRUTE/PREISET GIOVANNI; SANDRA/**DRACHENORDEN**; Drachenschrein-Quiz; Route 44–46/Eispfad. |
| **023** | `6f9a69f11` | Early-Game-QC: Zephyr→**FLÜGELORDEN** (Viola-Haus); Route-23-Badge-Checks alle DE (Flügel/Insekt/Basis/Phantom/Faust/Stahl/Eis/Drachen). |

---

## Phase E — 024–026 · Liga, Kanto, Rest-Pass

| ROM | Commit (u. a.) | Inhalt |
|---|---|---|
| **024** | `f5f0ab91c` | **Liga + Kanto-Start + M.S. AQUA + SILBERBERG:** TOP VIER (WILLI, KOGA, BRUNO, MELANIE, SIEGFRIED); Ruhmeshalle; ALABASTIA/VERTANIA; PROF. EICH; ROT am Silberberg; Route 22/26/27/SIEGESSTRASSE. |
| **025** | `77b90539c` | **Rest-Kanto:** MARMORIA … ZINNOBER; Arenen FELS–ERDORDEN, **FARBORDEN**; Safari, Kraftwerk, SILPH; Liga-Tor. Badge-Kurz **Farbe**. |
| **026** | `c014cc252` | **Rest-Pass:** `#mon`→`#MON` global (~700+); Celadon-Uni/Hotel; **DUELLTURM** + Kampffabrik; Telefon Mama/LIND/BILL; `common.asm`/`std_text`; Fanclub, Dojo, Yellow Forest, … |

---

## Phase F — 027–033 · Optionals, Phone, Buena

| ROM | Commit (u. a.) | Inhalt |
|---|---|---|
| **027** | `a81bcb44d` | Optional-Scan: EN-„Sorry“→DE; Phone `#MON`; DimCave/KRAFTWERK/AZURIA/GELBER WALD/Shamouti CAPS. |
| **028** | *(Zwischenstand vor LOTTE)* | Textstand **vor** Erin→LOTTE; Basis für 029. |
| **029** | `f022783a4` | Phone Caller+Overworld dump-nah; Buena-Telefon + Radio in `common.asm`; Lyra-Phone; Shamouti/Faraway/…; Erin→**LOTTE**. |
| **030** | `1cbc2ecd0` | Phone-Anzeigenamen: Joey→**REINHOLD**, Wade→**ALFONS**, Ralph→**RALF**, Anthony→**ANTON**, Chad→**UDO**, Tiffany→**TIFFY**, Erin→**LOTTE**. |
| **031** | `f7150d7cb` | Buena-Passwörter GSC-DE: NEUBORKIA/ROSALIA/AZALEA; Typen FLUG/KÄFER/PFLANZE; Radio EICH / #MON-Musik / Glückskanal. |
| **032** | `b7be4c76f` | Phone-Namen-Teil; Pokégear/Radio #MON-Kanal & EICHs Talk; Song/Landmark **Duellturm**. |
| **033** | `6af12bbc5` | **Alle** Phone-Rematch-Trainer-Anzeigenamen DE (Dump-align). |

---

## Phase G — 034–039 · Namen & Feinschliff

| ROM | Commit (u. a.) | Inhalt |
|---|---|---|
| **034** | *(Zwischenbuild / Zähler-Schritt)* | Übergang Phone-fertig → Trainer-Namen-Block; kein eigener großer README-Feature-Commit (Rebuild/Teilpass). |
| **035** | `8357b0cd4` | Trainer-Namen GSC-DE-Map pret↔Dump; Rest CAPS; BT-OTs; Guest-Speaker CAPS; Phone Dump-align. |
| **036** | `12fe0274e` | Namen-Konsistenz: JUTTA/HANNES/SATORU; IVY/FAITH/CHERYL/REI; Trade/Wonder-OTs CAPS; KIRK/SILVER. |
| **037** | `6430b8bc7` | Speaker-Feinschliff: Zwillinge/Guests/Devs CAPS; VERKÄUFER; Journal PHILENA IVY / STEVEN / CYNTHIA / WESTWOOD / WILLOW. |
| **038** | `17d564b25` | Feinschliff: over18-Reflow; Mon-Rufe CAPS; Scherzbuch-Autoren; „Total cool!“. |
| **039** | `77a071215` | **JOHTO/KANTO** CAPS; `{d:…}`-Breite dokumentiert. |

---

## Phase H — 040–045 · Items, Moves, Dex, Scripts

| ROM | Commit (u. a.) | Inhalt |
|---|---|---|
| **040** | `37edaa097` | Items + Attacken dump-nah (Basis): ~117 Items + ~119 Move-Blöcke; Fähigkeiten bleiben **C**. |
| **041** | `7ed6cea99` | Items erweitert: Evoli-Steine, Hyperheiler/Wutkeks, Beeren, King-Stein, Scope-Linse, Lauch, Seide, Buntflügel, Schiggykanne; Moves safe re-apply. |
| **042** | `bde6c87ea` | Mail-/Key-Items Finish: Briefe, UP-GRADE (SILPH CO.), Key-Item-Texte; QC ~139 GSC-Item-Descs = Dump. |
| **043** | `966573762` | Optionals + Dex-QC: Aprikoko-Box/Kurt; Dex #001–#251 dump-soft **251/251**; `#mon`→`#MON`; Parkball/EI-TICKET dokumentiert. |
| **044** | `51443e17f` | Schwachstellen-Pass: restl. `#MON`, Phone „Sorry“, Item `(TRAGEN)`, over18 Elm/NG+, tote EN-Kommentare. |
| **045** | `fbee0f8a8` | **Kritische Script-Stubs (Upstream-Restore):** Mr.#MON Mystery-Ei, Route-43-Maut, Sudowoodo+Flee, Spielhalle, Alph, Phone-jumpstd, Rocket-Base, Buena-Preise. Nur 1:1 Rangi42-Logik. |

---

## Phase I — 046–049 · Optionen, QWERTZ / v0.9, Casing

| ROM | Commit (u. a.) | Inhalt |
|---|---|---|
| **046** | `194c64ce7` | Kampf-Stil / Optionen-Menü GSC-DE-Polishing (`battle style` & Co.). |
| **047** | `34ae9bd96` | Optionen-Menüs weiter: Perfect-DVs-Labels / Menü-Polishing. |
| **048** | `99c599182` | **QWERTZ-Tastatur** (DE-Layout); Standard in Optionen **QWERTZ**. Entspricht pure-DE-Linie **v0.9**-Textstand (ohne Shiny-Arbeitskopie). |
| **049** | `bf9876f7f` | **`#COM` / `#DEX`:** PokéCOM (nicht PokéCom) im Spezial-Item-Menü; Dialoge `#Com`→`#COM`. |

**Desktop (typisch):**  
`polishedcrystal-3.2.3.049.gbc` · früher `…048` / `…-de-v0.9.gbc` / `…-latest.gbc`

---

## Phase J — 050–054 · Summary, Feinschliff, Landmark-CAPS, Startmenü

| ROM | Commit (u. a.) | Inhalt |
|---|---|---|
| **050** | *(Summary-Tabs)* | Status-Screen-Tabs DE: **EP · Fähig. · Item · Att. · Ort · Ei**; Fundort `Tag, Lv.15`. |
| **051** | `f7490fae4` u. a. | **GSC-Kanon-Feinschliff:** Kampf/UI/Items/Tutoren, Beeren-Crash, Premierball, CI (kein Glitzerbonbon in pure), Mega-Batch-Vorbereitung. |
| **052** | `7a24f7949` | Landmark-**Gebäude** CAPS (RADIOTURM, ZINNTURM, …); Celadon-Shop over18; GiovannisCave/Eusine; Mega-/Continue-Batch auf `master`. |
| **053** | `88ba9d755` | Dialog **LEUCHTTURM** / Phone **EISPFAD**; Lind-Phone-Grammatik; Music-Player CAPS. |
| **054** | `80e31e3c9` | **Stadt-/Routen-Landmarks** Dump-CAPS (`ROSALIA CITY`, `ROUTE n`, …); Startmenü **`#COM@`** + Käferturnier **`FERTIG@`**. |

---

## Phase K — 055–056 · Grafik-Übersetzung, Namens-Audit, Claude-Merge

| ROM | Commit | Inhalt |
|---|---|---|
| **055** | Claude `4befb80` (lokal) | **Grafiken DE:** Typ-Badges, Status-Icons, Type-Chart-Basisitem (inkl. GHOST/STEEL-Overlay), U-Glyph/Font-Fix. **Namens-Audit:** #1–251 GSC-Dump (10 Fixes, u. a. Sneasel/Qwilfish), #252–294 verifiziert; Rocket-Vorstand Apollo/Athena/Lance/Lambda. **Überläufe:** Landmarks, Doppelkomma-Rückruf, Eigenarten, Map-Dialoge, Ability-Slideout. |
| **056** | `cfe8d2bf0` | Claude-055 in pure-DE-**`master`** integriert (Historie 001–054 erhalten) + verified rebuild. |

**Desktop (typisch):**  
`polishedcrystal-3.2.3.056.gbc` · `…-latest.gbc` · Kopie unter `pokemon polished crystal roms\original\`

**Nächster Zähler:** **057**.

---

## Arbeitskopie (nicht in pure-DE-Serie)

Separates Experimenten-Pfad `germanpolishedcrystal-ARBEITSKOPIE` / Shiny-Builds (**nicht** im Git-Repo):

- Shiny: max DVs, Fangrate /4  
- Legendaries stärker (+10 % / +20 % Hierarchy)  
- Item **Glitzerbonbon** (SHINY_CANDY) ×6 Endgame-Orte  
- ROM z. B. `polishedcrystal-ARBEITSKOPIE-shiny-maxdv.gbc`  

→ **nicht** Teil der reinen Lokalisierungs-Serie 001–055 auf **`master`**.

---

## Master-Liste (eine Zeile pro Nummer)

| # | Kurz |
|---|---|
| **001** | Erster versionierter DE-Build |
| **002** | Checkpoint / Stabilität |
| **003** | Reflow 18 / line·cont (Start) |
| **004** | Reflow Dex/Items/Moves fortgesetzt |
| **005** | Proofreading Runde 1–2 |
| **006** | Proofreading + Charmap Ö |
| **007** | Title DE-Credit, README/INSTALL |
| **008** | GSC-canon-Marker, Overflow-Fixes |
| **009** | sdefer + premature done + Lyra/Elm |
| **010** | Deep-Scan stubbed Scenes + dynamic text |
| **011** | Intro „verschlafen“ |
| **012** | Neuborkia/Mama/Cherrygrove dump |
| **013** | Route 30 / Mr.#MON dump |
| **014** | Mama **Schatz** + ROSALIA |
| **015** | Route 31 / Viola / **FLÜGELORDEN** |
| **016** | Viola Gramps / PKMN-ARENA-Wortlaut |
| **017** | Viola→Route-32-Übergang (Zwischenbuild) |
| **018** | Route 32 / Azalea-Eingang dump |
| **019** | Azalea / Ilex / **INSEKTORDEN** |
| **020** | Dukatia / **BASISORDEN** / Mid-Johto |
| **021** | Teak–Oliviana / Phantom + Stahl |
| **022** | Anemonia–Ebenholz / Faust + Drache |
| **023** | Badge-String-QC (Flügel + Route 23) |
| **024** | Liga + Kanto-Start + M.S. Aqua + Silberberg |
| **025** | Rest-Kanto + Farborden |
| **026** | Rest-Pass #MON / Uni / Turm / common |
| **027** | Optional-Scan Sorry / CAPS |
| **028** | Zwischenstand vor LOTTE |
| **029** | Phone/Buena/Shamouti/LOTTE |
| **030** | Phone-Namen REINHOLD … TIFFY |
| **031** | Buena-Passwörter + Radio-Typen |
| **032** | Radio/Pokégear + Duellturm-Landmark |
| **033** | Alle Phone-Rematch-Namen DE |
| **034** | Zwischenbuild → Trainer-Namen |
| **035** | Trainer-Namen-Map + CAPS |
| **036** | JUTTA/HANNES/… Trade-OTs |
| **037** | Speaker/Journal/VERKÄUFER |
| **038** | over18 / Rufe / Scherzbuch |
| **039** | JOHTO/KANTO CAPS + `{d:}`-Docs |
| **040** | Items + Moves dump-Basis |
| **041** | Beeren/Steine/Items erweitert |
| **042** | Mail + Key-Items Finish |
| **043** | Dex 251/251 + Aprikoko-QC |
| **044** | Schwachstellen-Pass |
| **045** | Upstream Script-Stubs restore |
| **046** | Optionen Kampf-Stil polish |
| **047** | Optionen-Menüs / Perfect-DVs-Labels |
| **048** | **QWERTZ** / pure-DE v0.9 |
| **049** | `#COM` / `#DEX` Casing (PokéCOM) |
| **050** | Summary-Reiter DE (EP/Fähig./Att./Ort/Ei) |
| **051** | GSC-Kanon-Feinschliff (Kampf/UI/Items/Tutoren/CI) |
| **052** | Landmark-Gebäude CAPS + Shop-over18 + Mega-/Continue |
| **053** | LEUCHTTURM / EISPFAD + Lind-Phone |
| **054** | Stadt-/Routen-CAPS + Startmenü `#COM` / `FERTIG` |
| **055** | Grafik-DE + Artnamen-Audit + Rocket-Vorstand + Überlauf-Fixes *(Claude)* |
| **056** | Claude-055 auf GitHub-`master` + verified rebuild |
| **057** | *(noch nicht — nächster Zähler)* |

---

## Wichtige Commits (chronologisch, Auswahl)

```
65a2cf4f5  Initial DE upload
b92c82d01  Reflow 18 + line/cont
fa38060bc  GSC-canon localization marker
2b9ba2e09  Lyra mon name (text_ram)
086d10d70  Elm MeetElm sdefer
27988389d  Global sdefer + premature done     → ~009
c96491575  Deep scan stubs                    → ~010
1f403806e  verschlafen                        → ~011
3213043cb  Early game dump                    → ~012
255ed33fe  Mama Schatz                        → ~014
530c8902c  Route 31 / Viola / FLÜGELORDEN     → ~015
d6aa5a2e1  Violet gramps / PKMN-ARENA         → ~016
0fed834e9  Route 32 / Azalea start            → ~018
38fcd9069  Azalea / INSEKTORDEN               → ~019
0cccdff22  Mid-Johto BASISORDEN               → ~020
ba14352a6  Teak / Olivine                     → ~021
19cdfb0c6  Cianwood / Blackthorn              → ~022
6f9a69f11  Badge QC                           → ~023
f5f0ab91c  League + Kanto start               → ~024
77b90539c  Rest-Kanto                         → ~025
c014cc252  Rest-pass                          → ~026
a81bcb44d  Optional scan                      → ~027
f022783a4  Phone/Buena/LOTTE                  → ~029
1cbc2ecd0  Phone display names                → ~030
f7150d7cb  Buena passwords                    → ~031
b7be4c76f  Radio / Duellturm                  → ~032
6af12bbc5  All phone rematch names            → ~033
8357b0cd4  Trainer names                      → ~035
12fe0274e  Name consistency                   → ~036
6430b8bc7  Speakers / journals                → ~037
17d564b25  Feinschliff                        → ~038
77a071215  JOHTO/KANTO CAPS                   → ~039
37edaa097  Items+moves dump                   → ~040
7ed6cea99  Items berries/stones               → ~041
bde6c87ea  Mail/key items                     → ~042
966573762  Dex QC 251                         → ~043
51443e17f  Schwachstellen                     → ~044
fbee0f8a8  Script stubs upstream              → ~045
194c64ce7  Options battle style               → ~046
34ae9bd96  Options / perfect DVs labels       → ~047
99c599182  QWERTZ keyboard                    → ~048
bf9876f7f  #COM / #DEX casing                 → ~049
```

---

## Hinweis zu MD5s

Einzelne Desktop-MD5s von `.001` … `.048` wurden nicht alle im Git archiviert.  
**049** und Aliase liegen lokal auf dem Desktop des Maintainers; ROMs werden **nicht** auf GitHub hochgeladen.

Siehe auch die ältere Detail-Datei nur für die Frühphase:  
[`docs/ROM_HISTORY_001-015.md`](ROM_HISTORY_001-015.md) (wird von dieser Master-Liste abgedeckt und ergänzt).
