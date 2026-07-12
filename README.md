# Pokémon Polished Crystal (Deutsche Übersetzung)

Das ist die deutsche Version von dem Pokémon-Spiel Polished Crystal, basierend auf [der Pokémon Crystal Disassembly](https://github.com/pret/pokecrystal).

Die deutsche Version ist vollständig durchgespielbar: **alle Spieltexte sind übersetzt** und wurden über mehrere Runden hinweg gegengeprüft (siehe [Was wurde übersetzt?](#was-wurde-übersetzt) unten).

Größten Dank gehen an Rangi42, der das Spiel decompiled hat.

---

Übersetzung des originalen Posts von https://github.com/Rangi42

Mein Ziel ist es, genau das zu schaffen, was der Titel verspricht: eine verbesserte, polierte Version von Pokémon Crystal. Es behebt Bugs, berücksichtigt offizielle Änderungen seit 2001 und fügt einige eigene neue Ideen hinzu. Viele Features stellen Inhalte wieder her, die aus R/B/Y entfernt wurden, oder sind ursprünglich aus HG/SS.

Ich hatte schon seit Jahren vage Pläne, ein eigenes Pokémon-Spiel zu machen. Ich bin sehr beeindruckt von der Arbeit, die in die Disassembly von Pokémon Crystal und die Organisation des Codes geflossen ist. Dank der Open-Source-Veröffentlichung (und den ROM-Hackern, die mich inspiriert haben) wird dieses Projekt endlich Realität.

> Es gibt viele Wege, Spiele zu entwickeln, aber die Art, wie wir bei Game Freak arbeiten, unterscheidet sich vielleicht etwas von anderen Unternehmen. Wir ändern und verfeinern ständig, was wir uns ausgedacht haben. Um ein bereits gutes Spiel noch besser und polierter zu machen, nehmen wir das, was wir haben, und denken es komplett neu. Und um das Spiel so spaßig wie möglich zu machen, führen wir endlose Änderungen und Anpassungen durch – egal, wie lange es dauert. Es ist vielleicht nicht der beste Weg, aber ich glaube, diese Feinarbeit ist wichtig, damit unsere Spiele wirklich Spaß machen und besser werden.
>
> — Junichi Masuda, "[HIDDEN POWER of masuda No. 7](https://www.gamefreak.co.jp/blog/dir_english/?p=21)"

## Download und Spielen

Die **aktuelle offizielle Version** ist **v3.2.3** („Polished Crystal“-Release). Das Spiel ist von Anfang bis Ende komplett spielbar und enthält umfangreiche Überarbeitungen der Spielmechaniken und der Quality-of-Life-Features.

- **[v3.2.3 (Englisch) hier herunterladen](https://github.com/Rangi42/polishedcrystal/releases/tag/v3.2.3)**

Die vorherige offizielle Version war [v3.1.1](https://github.com/Rangi42/polishedcrystal/releases/tag/v3.1.1) (1. Februar 2025).

*Falls du Fragen zum Spielen oder Patchen hast, lies bitte zuerst die [FAQ](FAQ.md) (Englisch)!*

**Deutsche Übersetzung:** Um die deutsche ROM zu bekommen, baue das Projekt selbst mit `make` (siehe [INSTALL.md](INSTALL.md)) oder frag im Repository nach der aktuellsten gebauten Version. Die ROM-Datei selbst wird nicht im Git-Repository mitgeführt.

## Was wurde übersetzt?

Die komplette deutsche Lokalisierung umfasst alle sichtbaren Spieltexte: Dialoge auf allen Karten, Item-, Attacken- und Fähigkeitsbeschreibungen, Pokédex-Einträge, Kampftexte, Telefon-/Mail-Texte sowie das komplette Menü- und UI-System (Taschenmenü, PC-Box, Pokémon-Zusammenfassung, Optionen, Startbildschirm-Einstellungen usw.). Im Folgenden eine vollständige, chronologische Übersicht über die Arbeit, die seit Projektbeginn in die Übersetzung geflossen ist.

**Ersttexterstellung.** Der gesamte Spieltext wurde von Grund auf ins Deutsche übersetzt, inklusive aller Karten (`maps/`) und sämtlicher Datentabellen (`data/`) – also Item-Beschreibungen, Attacken- und Fähigkeitstexte, Pokédex-Einträge und mehr. Das war die Grundlage, auf der alle weiteren Runden aufgebaut haben.

**Zeilenlängen- und Layout-Korrektur.** Deutsche Wörter sind im Schnitt deutlich länger als ihre englischen Originale, wodurch viele Textzeilen die feste Zeichenbreite pro Zeile (18–19 Zeichen, je nach Textbox-Typ) überschritten und abgeschnitten wurden. Diese Überläufe wurden in mehreren Durchgängen aufgespürt und behoben – zunächst 119 gefundene Verstöße, danach eine zweite Batch mit 23 weiteren betroffenen Dateien, gefolgt von einem projektweiten Rescan, der am Ende auf null verbleibende Verstöße kam.

**Vollständiger Text-Reflow.** Über den reinen Zeilenlängen-Fix hinaus wurde der komplette Spieltext noch einmal systematisch neu umgebrochen, damit Sätze nicht nur technisch passen, sondern auch natürlich lesbar sind. Getestet wurde das Verfahren zunächst an einer einzelnen Pilotregion (Neubach City/New Bark Town), bevor es aufs gesamte Spiel ausgerollt wurde; dabei wurde auch ein Bug im `line`/`cont`-Textmakro-System gefunden und behoben. Anschließend wurden separat noch einmal gezielt alle Item-, Attacken- und Fähigkeitsbeschreibungen umgebrochen und dabei nebenbei Grammatikfehler korrigiert.

**Zeichensatz- und Encoding-Fixes.** Der ursprüngliche Zeichensatz des Spiels enthielt kein großes „Ö” – dieser Font-Eintrag wurde neu ergänzt. Außerdem wurde ein Kompressions-Bug im Zeichensatz-System gefunden: Ein Unterschied zwischen den für Englisch und Deutsch verwendeten „Ngram”-Tabellen (Zeichenfolgen-Kürzel zur Textkompression) konnte zu fehlerhaft dargestelltem Text führen. Der erste Korrekturversuch stellte sich als unzureichend heraus und musste zurückgenommen werden; erst eine zweite, gründlichere Untersuchung fand die tatsächliche Ursache und behob sie sauber.

**Ja/Nein-Dialogbox.** Das deutsche Wort „Nein” wurde in der Ja/Nein-Auswahlbox abgeschnitten dargestellt. Ein erster, oberflächlicher Patch verbreiterte nur die Box, behob aber nicht die eigentliche Ursache; die spätere, tiefere Untersuchung fand den echten Bug in der Positionierungs-Routine der Box (`GetYesNoBoxPosition`) und behob ihn dort direkt.

**Namenskonsistenz.** „Pokegear” wurde projektweit durchgängig zu „PokéCom” umbenannt (Menütexte, Dialoge, Item-Referenzen). Zusätzlich wurden Groß-/Kleinschreibungs-Inkonsistenzen bei den `#DEX`/`#COM`-Platzhaltern vereinheitlicht.

**Aufbau von Korrekturlese-Infrastruktur.** Für konsistente, nachvollziehbare Korrekturrunden wurde eine Whitelist mit über 1.370 offiziellen Eigennamen sowie ein Dokument mit festgelegten Stil-Konventionen (z. B. absichtliche GROSSSCHREIBUNG bei Spielbegriffen, knapper Menü-Stil, feste Sprechweisen einzelner Charaktere) erstellt. Jeder Korrekturvorschlag wird seitdem gegen diese Liste geprüft, damit bewusste Design-Entscheidungen nicht versehentlich “korrigiert” werden. Zusätzlich wurde ein eigenes Skript gebaut, das Text direkt aus den `.asm`-Dateien extrahiert und in prüfbare Sätze zerlegt, sowie die Verfügbarkeit von LanguageTool (ein Grammatikprüf-Tool) für Stichprobenkontrollen evaluiert.

**Mehrstufige Korrekturlese-Runden.** Der komplette Text wurde in mehreren voneinander unabhängigen Runden gegengelesen: zunächst zehn parallele, KI-gestützte Korrekturdurchgänge („Muttersprachler-Stil”-Prüfung) mit insgesamt 97 gemeldeten Fundstellen, von denen jede einzelne manuell geprüft und nur bei tatsächlicher Berechtigung übernommen wurde. Es folgte ein rein deterministischer, skriptbasierter Scan des gesamten Text-Corpus (kein Sprachmodell, reines Mustersuchen) kombiniert mit LanguageTool-Stichproben, dann eine zweite, komplett unabhängige weitere Korrekturrunde, deren Ergebnisse mit der ersten zusammengeführt und erneut manuell trianiert wurden. Danach folgte eine dritte Runde mit gezieltem Tiefen-Review der textlich umfangreichsten Dateien.

**Schließen der Programmcode-Lücke.** Das komplette Menü- und System-UI (`engine/`-Verzeichnis: Taschenmenü, PC-Box, Zusammenfassungs-Bildschirm, Optionsmenüs usw.) war in den ursprünglichen Korrekturrunden nie erfasst worden, da sich diese auf die Karten- und Datentexte konzentriert hatten. Diese Lücke wurde in einer eigenen Runde vollständig geschlossen und dabei zwei echte Fehler gefunden: ein unvollständiger Satz in der PC-Box-Beschreibung („Der Rest sind Eier oder kennt VM.” – fehlendes Wort) und ein fehlender Artikel in der Emulator-Kompatibilitätsmeldung.

**Gezielte Suche nach Restenglisch.** Ein deterministischer Scan nach unübersetzten englischen Textresten im gesamten Corpus fand zwei komplett unübersetzte Stellen: ein Museumsschild in Marmoria City („Pewter Museum of Science”) sowie ein doppelt vorkommender Mail-Item-Text („Dark Cave leads to another road”), der an zwei Stellen im Code dupliziert war und daher beide Male gefixt werden musste.

**UI-Textüberläufe (aus Spieltests gemeldet).** Zwei Layout-Bugs, die sich erst beim tatsächlichen Spielen zeigten, wurden nach Rückmeldung mit Screenshot behoben: Im „Neues Spiel”-Optionsmenü liefen die Beschriftungen „Getauschte Pokemon” und „Entwicklung im Kampf” über ihre Textbox hinaus und wurden zu „Tausch-#mon” bzw. „Entw. im Kampf” gekürzt.

**Startbildschirm-Anpassung.** Ein zusätzlicher Hinweis „DE VERSION: ONLY1_RUDEBOY” wurde auf dem Startbildschirm ergänzt, ohne die bestehende Copyright-Zeile („© 2026 Rangi42 v3.2.3”) zu verändern. Dafür wurde die VRAM- und Tile-Grafikpipeline des Titelbildschirms tiefergehend untersucht, um ungenutzten Grafikspeicher zu finden. Eine erste Version war in normaler Groß-/Kleinschreibung mit engem Zeichenabstand kaum lesbar; nach Rückmeldung wurde der Text auf reine Großschreibung mit normalem Zeichenabstand umgestellt.

**Build-Verifikation.** Jede einzelne Änderungsrunde wurde vor Auslieferung mit zwei unabhängigen, komplett neu kompilierten ROM-Builds gegengeprüft (identischer MD5-Hash zwischen beiden Builds sowie korrekte Dateigröße), um sicherzustellen, dass eine Änderung nicht versehentlich etwas anderes kaputt macht.

Was die Übersetzung **nicht** anfasst: offizielle Eigennamen, feststehende Spielbegriffe und bewusste stilistische Entscheidungen der Originalübersetzung bleiben unverändert – das Ziel ist eine Übersetzung, die sich liest, als wäre sie offiziell, nicht eine, die alles “eindeutscht”.

Falls dir beim Spielen ein abgeschnittener Text, ein Layout-Fehler oder ein verbliebener Tippfehler auffällt: Bitte als Issue melden (siehe unten) – Rückmeldungen aus dem tatsächlichen Spielen sind die zuverlässigste Fehlerquelle, die es für dieses Projekt gibt.

## Was ist neu in v3.2.3?

Hier eine kurze Zusammenfassung der wichtigsten Änderungen und Neuerungen aus dem englischen Original-Projekt (Gameplay, nicht Übersetzung). Ein detaillierter Changelog erscheint bald.

- **Anpassbare Neue-Spiel-Einstellungen:** Du kannst nun Natures und Abilities ein-/ausschalten, die EV-Mechanik wählen (klassisch ohne Limit, modernes 510-Limit oder deaktiviert) und weitere Spieloptionen vor dem Start konfigurieren.
- **DVs bestimmen nicht mehr Nature, Shininess, Geschlecht oder Unown-Form:** DVs beeinflussen weiterhin leichte Farbvariationen, alles andere wird jetzt separat gehandhabt.
- **Überarbeitete Kampf-Engine und HUD:**
  - Abilities werden jetzt vollständig unterstützt.
  - Attacken verhalten sich näher an ihren modernen Gegenstücken.
  - Kleinere HUD-Verbesserungen für flüssigere Kämpfe.
- **Überarbeitete Attacken-Animationen:** Viele Attacken haben neue Animationen.
- **Optimierte Engine und 60 fps Overworld:** Die Engine wurde stark optimiert, die Oberwelt läuft jetzt mit 60 Bildern pro Sekunde.
- **Neues Pokémon-Lager-System:** Die PC-Oberfläche ähnelt modernen Pokémon-Spielen. Du kannst Boxen wechseln, Pokémon verschieben und dein Team verwalten – mit minimalen Speicherproblemen.
- **HGSS-inspirierter Pokédex:** Der neue Pokédex zeigt Basiswerte, Ei-Gruppen und eine detaillierte Fundort-Karte mit *allen* Fangmethoden.
- **Verbessertes Wetter in der Oberwelt:** Statt nur Abdunkelung siehst du jetzt echten Regen, Schnee oder Sandstürme.
- **Überarbeiteter Zusammenfassungs-Bildschirm:** Ersetzt den alten Status-Bildschirm. Zeigt Nature, Abilities, gesehene und gefangene Pokémon und mehr.

## Features

Eine vollständige Liste findest du in [FEATURES.md](FEATURES.md) (Englisch). Einige Highlights:

- **289 Pokémon-Arten**, inklusive neuer Entwicklungen, plus **56 kosmetische Formen** (z. B. Magikarp-Muster, Pikachu Fly/Surf, Arbok-Muster, Unown-Formen) und **46 Varianten** (Alola, Galar, Hisui usw.) → insgesamt **391 einzigartige Pokémon**.
- **73 neue Attacken** (72 in der treuen Variante), **75 TMs** und **31 Attacken-Lehrer**.
- Moderne Mechaniken wie **Fairy-Typ**, **Physisch/Spezial-Split**, **Natures**, **Abilities** und vieles mehr.
- **Unbegrenzte TMs** sowie Quality-of-Life-Features wie **Laufschuhe** und permanenter **Repel**.
- **Neue/überarbeitete Karten**: Einige aus R/B/Y, einige aus HG/SS angepasst, plus originale Orte.
- **Neue Charaktere** wie Lorelei und Agatha (R/B/Y), Lyra und die Team Rocket Executives (HG/SS) und weitere.
- **Mehr Post-Game-Inhalte**: Rematches gegen Arenaleiter, ein neues Event nach dem Kampf gegen Red und mehr.
- **Verbesserte Levelkurve** mit stetig steigender Herausforderung.
- **Musik und Grafiken** aus neueren Generationen übernommen.

## Diskussion

Fragen oder Anmerkungen zur **deutschen Übersetzung** gerne direkt hier im Repository als Issue melden.

Für allgemeine Fragen zum Original-Spiel (Gameplay, Mechaniken) kannst du dich an die englischsprachige Community wenden (lies zuerst die [FAQ](FAQ.md), falls du allgemeine Fragen hast!):

- [Discord](https://discord.gg/ZK5pqK8)
- [Skeetendo](https://hax.iimarckus.org/topic/6874/)
- [PokéCommunity](http://www.pokecommunity.com/showthread.php?t=373172)
- [Romhack.me](http://www.romhack.me/polishedcrystal/wall/)
- [/r/PokemonROMHacks](https://www.reddit.com/r/PokemonROMhacks/comments/51kbcn/pok%C3%A9mon_polished_crystal_200/)
- [Nuzlocke Forums](http://s7.zetaboards.com/Nuzlocke_Forum/topic/11003710/)
- [Pokémon Hackers Online](http://www.pokemonhackersonline.com/showthread.php?t=15811)

Zusätzliche Ressource:

- [PolishedDex](https://www.polisheddex.app/) — Ein praktischer Online-Begleiter für Polished Crystal mit durchsuchbarem Pokédex, Attacken-Liste, Item-Liste, Fundorten, Abilities, Events und Team-Builder.

## Screenshots

*Die folgenden Screenshots zeigen teilweise noch die englische Originalversion.*

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
