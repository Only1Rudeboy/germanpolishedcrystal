# Pokémon Polished Crystal — deutsche GSC-Kanon-Lokalisierung

> **Hinweis: Dies ist eine Übersetzung / ein Übersetzungs-Fork.**  
> Dieses Repository enthält **keine eigenständige Neuentwicklung von Polished Crystal**, sondern eine **deutsche Lokalisierung** von [Rangi42/polishedcrystal](https://github.com/Rangi42/polishedcrystal) (Version **3.2.3**).  
> Spielinhalt, Mechanik und Features stammen vom Originalprojekt. Hier wurde der **spielbare Text-Layer** ins Deutsche gebracht — im Stil der offiziellen **Pokémon Kristall (GSC-DE)**-Lokalisierung, soweit das möglich und sinnvoll ist.

### Status: Work in Progress (WIP)

> **Dieses Projekt ist noch WIP.**  
> Die Lokalisierung wurde mit Unterstützung von **Grok 4.5** (xAI) erstellt und überarbeitet. Trotz umfangreicher QC-Scans und Rest-Passes können **weiterhin Fehler, unsaubere Zeilenumbrüche, Inkonsistenzen oder vereinzelte englische/unidiomatische Stellen** auftreten.  
>  
> **Feedback ist ausdrücklich erwünscht** — gerne zu Tippfehlern, zu langen Zeilen, falschen Orts-/Attackennamen, stilistisch unpassenden Dialogen oder allem, was sich „nicht nach GSC-DE“ anfühlt. Issues und Pull Requests auf GitHub helfen sehr.

**Original:** [Rangi42/polishedcrystal](https://github.com/Rangi42/polishedcrystal) · **Basis-Disassembly:** [pret/pokecrystal](https://github.com/pret/pokecrystal)

### Updates / Changelog (Lokalisierung) — seit Projektbeginn

Vollständige Historie der **deutschen GSC-Kanon-Lokalisierung** dieses Forks (neueste zuerst).  
ROM-Versionen beziehen sich auf lokal versionierte Builds (`tools/save_rom_versioned.ps1`); ROMs liegen **nicht** im Repo.

#### Phase 2026-07 — GSC-Dump-Abgleich, QC, Rest-Pass (aktuell)

| Zeitraum / Commit-Schwerpunkt | Inhalt |
|---|---|
| **ROM 3.2.3.037** | **Speaker-Feinschliff:** Zwillinge/Guests/Devs CAPS; VERKÄUFER; Journal PHILENA IVY / STEVEN / CYNTHIA / WESTWOOD / WILLOW; FAITH-Reflow. |
| **ROM 3.2.3.036** | **Namen-Konsistenz:** JUTTA/HANNES/SATORU; IVY/FAITH/CHERYL/REI; Trade/Wonder-OTs CAPS; KIRK/SILVER. |
| **ROM 3.2.3.035** | **Trainer-Namen-Block:** GSC-DE-Map pret↔Dump; Rest CAPS; BT-OTs; Guest-Speaker CAPS; Phone Dump-align. |
| **ROM 3.2.3.033** | **Phone-Anzeigenamen komplett (Dump-align):** Alle Phone-Rematch-Trainer DE. |
| **ROM 3.2.3.032** | **Optionals:** Phone-Namen-Teil; Pokégear/Radio #MON-Kanal & EICHs Talk; Song/Landmark **Duellturm**. |
| **ROM 3.2.3.031** | **Buena-Passwörter GSC-DE dump:** NEUBORKIA/ROSALIA CITY/AZALEA CITY; Typen FLUG/KÄFER/PFLANZE; Radios EICHs PKMN-Talk / #MON-Musik / Glückskanal. |
| **ROM 3.2.3.030** | **Phone-Trainer-Anzeigenamen GSC-DE:** Joey→**REINHOLD**, Wade→**ALFONS**, Ralph→**RALF**, Anthony→**ANTON**, Chad→**UDO**, Tiffany→**TIFFY**, Erin→**LOTTE** (Dump-backed; weitere Phone-Namen folgen). |
| **ROM 3.2.3.029** | **Optional-Batch (gleichwertig Story):** Alle Phone-**Caller** + **Overworld** dump-nah DE; **Buena**-Telefon + Radio-Blöcke in `common.asm`; **Lyra**-Phone; **Shamouti**-Inseln (Hotel/Restaurant/Küste/PC/Schrein/Tunnel/Tourist); **Faraway**/Valencia/DimCave3–4/Cliff/YellowForest; Erin→**LOTTE**; QC ohne PLAY_G/EN-Hotspots. (028 = Textstand vor LOTTE.) |
| **ROM 3.2.3.027** | **Optional-Scan/PC-Pass:** EN-„Sorry“→DE; Telefon-Caller/Overworld `#MON`; DimCave/KRAFTWERK/AZURIA CAPS; GELBER WALD CAPS; Shamouti-Tunnel CAPS. |
| **ROM 3.2.3.026** · `c014cc252` | **Rest-Pass / Optionals:** `#mon`→`#MON` global (Maps + data/text + Phone, ~700+ Treffer); Celadon-Universität + Hotel/Wohnaccessoires; **DUELLTURM** + Kampffabrik; Telefon (Mama, LIND, BILL, Trainer-Anrufe dump-nah); `common.asm`/`std_text` (Pension, Namen-Bewerter, VM-Feldtexte, Schwester); Misc (Earl-Akademie, Fanclub, Mania, Soul House, #COM-Center, Museum, Dojo, Yellow Forest, …). |
| **ROM 3.2.3.025** · `77b90539c` | **Rest-Kanto:** MARMORIA, AZURIA, ORANIA, LAVANDIA, PRISMANIA, FUCHSANIA, SAFFRONIA, ZINNOBER; Arenen (FELS–ERDORDEN, **FARBORDEN**); SAFARI-ZONE; KRAFTWERK; SILPH; Liga-Tor (SILBERBERG/TOP VIER). Badge-Kurzname **Farbe**. |
| **ROM 3.2.3.024** · `f5f0ab91c` | **Liga + Kanto-Start + M.S. AQUA + SILBERBERG:** TOP VIER (WILLI, KOGA, BRUNO, MELANIE, SIEGFRIED); Ruhmeshalle; ALABASTIA/VERTANIA/Route 1–2; PROF. EICH-Labor; Schiff + Häfen; ROT am SILBERBERG; Route 22/26/27/SIEGESSTRASSE. |
| **ROM 3.2.3.023** · `6f9a69f11` | **Early-Game-QC:** Zephyr-Abzeichen→**FLÜGELORDEN** (Viola-Haus); Route-23-Badge-Checks alle DE (Flügel/Insekt/Basis/Phantom/Faust/Stahl/Eis/Drachen). |
| **ROM 3.2.3.022** · `19cdfb0c6` | **Anemonia + Rocket-Base + Ebenholz:** HARTWIG/**FAUSTORDEN**; Passwörter FLEGMONRUTE/RATTIKARLRUTE/PREISET GIOVANNI; Weisen-Trio; Route 44–46/Eispfad; SANDRA/**DRACHENORDEN** + Drachenschrein-Quiz. |
| **ROM 3.2.3.021** · `ba14352a6` | **TEAK / See des Zorns / Oliviana:** JENS/**PHANTOMORDEN**; Brandturm/Zinnturm/Tanztheater; Route 38–39/KUHMUH; Mahagoni/NORBERT; SEE DES ZORNS; JASMIN/**STAHLORDEN**; Leuchtturm; Route 40–41. PC-Fix: STÄRKE bleibt Anemonia (nicht Café Oliviana). |
| **ROM 3.2.3.020** · `0cccdff22` | **Mid-Johto:** Route 34–37, Pension, DUKATIA (Schilder, Kurt-Fluss, Arena BIANKA/**BASISORDEN**), Kaufhaus, Spielhalle, Radioturm, Untergrund, Nationalpark, Käferturnier. |
| **ROM 3.2.3.019** · `38fcd9069` / `0fed834e9` | Route 32–33, Azalea, Flegmon-Brunnen, Holzkohle, Kurt, Ilex, Einheitstunnel; **INSEKTORDEN** (KAI). |
| **ROM 3.2.3.015–018** | Route 31 / Viola / Knofensa / FALK **FLÜGELORDEN**; Gramps PKMN-ARENA; Folge-Builds. |
| **Mom / Start** · `255ed33fe` … | Baby→**Schatz** (User-Override); dump-align Neuborkia, ROSALIA, Route 29–30, Mr.#MON. |
| **Bugfixes kritisch** · `2b9ba2e09` … `c96491575` | Lyra „erhält“ ohne Mon-Name; LIND-Labor-Intro (`sdefer`); 11× sdefer + 68× premature `done`; Deep-Scan stubbed Scenes + `@` mid-string; „genickert“→verschlafen. ROM **009–011+**. |
| **Repo / Docs** | INSTALL.md DE; README WIP + Feedback; GitHub `Only1Rudeboy/germanpolishedcrystal` (main+master). |

#### Phase früher — Grundübersetzung & Proofreading (Git-Historie)

| Commit-Schwerpunkt | Inhalt |
|---|---|
| `65a2cf4f5` | **Initial upload** — deutsche Übersetzung gestartet |
| `21b180fbf` | Checkpoint: bestätigter funktionierender DE-Build |
| `b92c82d01` … `7fab35dd5` | Reflow auf max. **18** Zeichen; Fix massenhaft `line`/`line`→`line`/`cont`; DST; `#COM`/`#DEX`-Casing; Pokédex/Items/Attacken/Fähigkeiten reflow |
| `641690175` … `86773d0df` | Native-Speaker- / Proofreading-Runden (Grammatik, UI, BSOD, New-Game-Optionen) |
| `4370a1209` | Charmap: großes **Ö** für Umlaute |
| `36578c8bc` / `485f8d4a0` | Title-Screen: DE-Credit + Lesbarkeit |
| `fa38060bc` | Markierung als **German GSC-canon localization** für PC **3.2.3** |
| `8e9c8a911` / `fa077c415` | Deutsche README, WIP-Hinweis, Feedback willkommen |

#### Johto-Orden-Kurznamen (Dump → Trainerkarte)

| Dump | Kurz |
|---|---|
| FLÜGELORDEN | Flügel |
| INSEKTORDEN | Insekt |
| BASISORDEN | Basis |
| PHANTOMORDEN | Phantom |
| STAHLORDEN | Stahl |
| FAUSTORDEN | Faust |
| EISORDEN | Gletscher *(Kurzname UI; Dialog oft EISORDEN)* |
| DRACHENORDEN | Drache |

#### Kanto-Orden-Kurznamen

| Dump | Kurz |
|---|---|
| FELSORDEN | Fels |
| QUELLORDEN | Quell |
| DONNERORDEN | Donner |
| FARBORDEN | Farbe |
| SEELENORDEN / SUMPFORDEN | Seele / Sumpf *(FAITHFUL-Reihenfolge)* |
| VULKANORDEN | Vulkan |
| ERDORDEN | Erde |

#### Qualitätsregeln (dauerhaft)

| Regel | Detail |
|---|---|
| **A / B / C** | A = GSC-Dump 1:1 · B = Dump + PC-Mechanik · C = PC-only DE + CAPS |
| **Breite** | TEXTBOX_INNERW **18**; `#MON`/`#BALL`/`#DEX`/`#COM` = 7; `<PLAYER>` = 7 |
| **Verboten** | `<PLAY_G>` (unmapped); `;` in Textstrings; `@` mitten im String |
| **Formulierungen** | `findet` / `erhält` · `PKMN-ARENA von …` · CAPS-Orte (NEUBORKIA, DUKATIA CITY, …) |
| **User-Override** | Mama: **Schatz** statt Dump „Baby“ |

#### DE-Ortsnamen (Auswahl)

NEUBORKIA · ROSALIA CITY · VIOLA CITY · AZALEA CITY · DUKATIA CITY · TEAK CITY · OLIVIANA CITY · ANEMONIA CITY · MAHAGONIA CITY · EBENHOLZ CITY · ALABASTIA · VERTANIA CITY · MARMORIA CITY · AZURIA CITY · ORANIA CITY · LAVANDIA · PRISMANIA CITY · FUCHSANIA CITY · SAFFRONIA CITY · ZINNOBERINSEL · INDIGO PLATEAU · SILBERBERG · SEE DES ZORNS · STEINEICHENWALD · KNOFENSA-TURM · M.S. AQUA · DUELLTURM

#### Tools (Auswahl, im Repo)

- `tools/save_rom_versioned.ps1` — versionierte ROM-Builds  
- `tools/_gsc_de_crystal_msg.txt` — GSC-DE-Dump-Referenz  
- `tools/gsc_canon_setup/` — Batch-Regeln, Extrakte, Scanner  
- `tools/_fix_mon_caps.py` — `#mon`→`#MON` in Textstrings  

#### Bekannte Residuen / Feedback willkommen

- Grafik-Text in manchen Tiles/Logos kann EN bleiben  
- Phone-Trainer-Anzeigenamen: **alle Rematch-Phone-Kontakte DE** (Dump-Rematch-Zählung + PICNICKER/BUG-Anker); Feinschliff nach Playtest willkommen  
- PC-only-Ecken (Navel/Faraway-Jungle nur Schreie, Shamouti-Hotel-Stubs) und Feinschliff nach Playtest  
- Spieler-Feedback zu Stil, Breite und Kanon-Namen ist erwünscht  

---



## Was in diesem Übersetzungsprojekt gemacht wurde

Ziel war kein „irgendwie Deutsch“, sondern eine **GSC-kanonische** DE-Fassung von Polished Crystal 3.2.3: Ortsnamen, Systemmeldungen, Menüs und Dialoge sollen sich anfühlen wie die deutsche Kristall-Version — inklusive Textbox-Breite und typischer Formulierungen.

### Umfang der Lokalisierung

| Bereich | Inhalt |
|---|---|
| **Karten / NPCs** | Alle **607** Map-Skripte: Dialoge, Schilder, Items, Story |
| **Telefon** | Anrufer-/Anruferinnen-Texte, Overworld-Telefon |
| **Systemtexte** | `common.asm`, Kampftexte, Standard-Dialoge (Items finden/erhalten, Whiteout, EP, …) |
| **Menüs & UI** | Startmenü, Beutel, Optionen, Party-Menü, PC, Zusammenfassungs-UI |
| **Pokémon** | Deutsche Artnamen (CAPS), Pokédex-Einträge, Kategorien |
| **Attacken** | Offizielle DE-Namen (≤12 Zeichen), Beschreibungen |
| **Fähigkeiten** | DE-Namen und Beschreibungen (Gen-3+-System, offizielle Begriffe) |
| **Wesen & Charakteristika** | z. B. Robust, Solo, Mutig … |
| **Typen, Items, Orden** | Typennamen, Item-Namen/Beschreibungen, Orden, Trainerklassen |
| **Orte / Landmarks** | GSC-DE-Glossar (Neuborkia, Dukatia City, Knofensa-Turm, …) |
| **Battle Tower & Co.** | DE-Trainertexte und UI-Strings |

### Methode & Qualitätsregeln

- **Klassen A / B / C**
  - **A** — Original-GSC-Orte: wo möglich **1:1** zum deutschen Kristall-Dump  
  - **B** — GSC + Polished-Zusatz: Originalteile am Dump, PC-Zusatz im GSC-Ton  
  - **C** — nur Polished (z. B. Shamouti, neue Orte): DE + Glossar + Breite, kein Dump-Zwang  
- **Textbox-Breite:** max. **18** Anzeigezeichen (mit Expandern wie `#MON` = 7, `<PLAYER>` = 7)  
- **Systemformulierungen (GSC):**  
  - `<PLAYER> findet …` · `<PLAYER> erhält …`  
  - `PKMN-ARENA von …`  
  - Whiteout: *kein kampffähiges #MON* / *fällt in Ohnmacht*  
- **Glossar** für Johto/Kanto-Orte, Arenaleiter-Namen und feste Phrasen  
- **Batch-Arbeit 0–6** + **GSC-Dump-Abgleich** (Johto → Liga → Kanto) + **Rest-Pass** (CAPS, `#MON`, Uni, Telefon, common, DUELLTURM)  
- **QC-Scans** gegen EN-Reste, Script-Bugs (`sdefer`/`done`/`@`), Breite und Glossar-Konsistenz  

### Bewusst *nicht* „1:1 Kristall“

Polished Crystal ist **größer** als das Original von 2001. Deshalb:

- **Neue Inhalte** (Polished-only-Karten, neue Pokémon, neue Dialoge) sind auf **DE im GSC-Stil**, haben aber keinen offiziellen Kristall-Dump.  
- **Gen-3+-Systeme** (Wesen, Fähigkeiten, phys./spez. Split, …) nutzen **offizielle deutsche Namen**, die es in GSC so noch nicht gab.  
- **Eigennamen** (z. B. Joey, Kurt) und **internationale Gleichnamen** (z. B. AZALEA CITY, Whirlpool, Pikachu) bleiben wie im DE-Kanon üblich.  
- **Grafik-Text** in manchen Tiles/Logos kann weiterhin EN sein; der Fokus lag auf dem **Script-/Daten-Text**.

### Build / ROM

- Zielversion: **Polished Crystal 3.2.3** mit dieser DE-Lokalisierung  
- Fertige ROMs werden **nicht** in diesem Repo veröffentlicht (Copyright). Bitte selbst bauen — siehe Original-Anleitung im Upstream bzw. `INSTALL.md`.  
- Upstream bleibt [Rangi42/polishedcrystal](https://github.com/Rangi42/polishedcrystal); dieses Repo ist der **deutsche Lokalisierungs-Fork**.

### Credits (Lokalisierung)

- **Originalspiel / Engine / Features:** Rangi42 und alle Polished-Crystal-Mitwirkenden  
- **Disassembly-Basis:** pret / pokecrystal  
- **Deutsche GSC-Kanon-Lokalisierung dieses Forks:** Only1Rudeboy  
- **KI-Unterstützung:** Grok 4.5 (xAI) — WIP, Fehler möglich; Feedback willkommen  

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
