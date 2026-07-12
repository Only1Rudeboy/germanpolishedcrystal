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

Die komplette deutsche Lokalisierung umfasst alle sichtbaren Spieltexte: Dialoge auf allen Karten, Item-, Attacken- und Fähigkeitsbeschreibungen, Pokédex-Einträge, Kampftexte, Telefon-/Mail-Texte sowie das komplette Menü- und UI-System (Taschenmenü, PC-Box, Pokémon-Zusammenfassung, Optionen, Startbildschirm-Einstellungen usw.).

Kurzer Überblick über die wichtigsten Arbeitsschritte:

- **Vollständige Ersttexterstellung** des gesamten Spieltexts ins Deutsche, inklusive aller Karten (`maps/`) und Datentabellen (`data/`).
- **Mehrere unabhängige Korrekturlese-Runden** (Grammatik, Rechtschreibung, Zeichensetzung), bei denen jeder Änderungsvorschlag gegen eine Liste von über 1.370 offiziellen Eigennamen und dokumentierten Stil-Konventionen geprüft wurde – damit absichtliche Design-Entscheidungen (Sprechweisen einzelner Charaktere, knapper Menü-Stil, feste GROSSSCHREIBUNG bei Spielbegriffen) nicht versehentlich "korrigiert" werden.
- **Nachträgliche Vollabdeckung des Programmcodes (`engine/`)**: Das komplette Menü- und System-UI war in den ursprünglichen Korrekturrunden nie erfasst worden. Diese Lücke wurde geschlossen und dabei mehrere echte Fehler gefunden und behoben.
- **Gezielte Suche nach übrig gebliebenem, unübersetztem Englisch** im gesamten Text-Corpus – u. a. ein komplett unübersetztes Museumsschild in Marmoria City und unübersetzter Mail-Item-Text wurden dabei gefunden und nachträglich übersetzt.
- **Technische Anpassungen**, die für eine korrekte deutsche Darstellung nötig waren:
  - Neuer Zeichensatz-Eintrag für ein großes „Ö“, das im Original-Font fehlte.
  - Breitenanpassung der Ja/Nein-Dialogbox, damit „Nein“ nicht abgeschnitten wird.
  - Behebung eines Kompressions-Bugs (Zeichensatz-Ngram-Unstimmigkeit zwischen Englisch und Deutsch), der zu fehlerhaft dargestelltem Text führen konnte.
  - Zahlreiche Zeilenumbruch-Anpassungen, da deutsche Wörter im Schnitt länger sind als die englischen Originale und die feste Zeichenbreite pro Textzeile (18–19 Zeichen, je nach Textbox-Typ) sonst überschritten worden wäre.
  - Korrektur von Groß-/Kleinschreibungs-Inkonsistenzen bei den `#DEX`/`#COM`-Platzhaltern.
  - Behebung mehrerer UI-Textüberläufe, z. B. zu lange Beschriftungen im „Neues Spiel“-Einstellungsmenü.
- **„Pokegear“** wurde durchgängig zu **„PokéCom“** umbenannt.
- Ein kleiner Startbildschirm-Hinweis wurde ergänzt: „DE VERSION: ONLY1_RUDEBOY“, ohne die bestehende Copyright-Zeile zu verändern.
- Jede Änderung wurde vor der Veröffentlichung mit zwei unabhängigen, komplett neu kompilierten ROM-Builds gegengeprüft (identischer MD5-Hash), um sicherzustellen, dass keine Änderung versehentlich etwas anderes kaputt macht.

Was die Übersetzung **nicht** anfasst: offizielle Eigennamen, feststehende Spielbegriffe und bewusste stilistische Entscheidungen der Originalübersetzung bleiben unverändert – das Ziel ist eine Übersetzung, die sich liest, als wäre sie offiziell, nicht eine, die alles "eindeutscht".

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
