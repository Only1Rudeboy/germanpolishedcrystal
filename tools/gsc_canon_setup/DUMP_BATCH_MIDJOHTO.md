# GSC-DE Dump-Abgleich – Mid-Johto Batch

## Projekt
`C:\Users\Rudeboy\Desktop\pokemon polierter kristall\polishedcrystal-master\polishedcrystal-master`

## Dump-Quelle
`tools/_gsc_de_crystal_msg.txt` (UTF-8). Lesen mit Python:

```python
from pathlib import Path
lines = Path("tools/_gsc_de_crystal_msg.txt").read_text(encoding="utf-8").splitlines()
print(lines[N-1])  # 1-basiert
```

## Regeln (zwingend)
1. **TEXTBOX_INNERW = 18**. `#MON`/`#mon`/`#BALL` zählen als **7** Zeichen. `<PLAYER>`/`<PLAY_G>` = **7**.
2. **Klassen:**
   - **A** (Schilder, Story-NPCs, Arena-Leiter, bekannte GSC-Dialoge): Dump **1:1** (Zeilenumbrüche an 18 anpassen, Inhalt behalten).
   - **B** (PC-Mechanik + Dump-Text): Dump-Wording wo möglich; PC-Mechanik behalten (andere TM-Nr., PC-only NPCs).
   - **C** (PC-only): Natürliches DE, CAPS-Orte, ≤18.
3. **Ortsnamen CAPS** wie Dump: `DUKATIA CITY`, `AZALEA CITY`, `NATIONALPARK`, `RADIOTURM`, `STEINEICHENWALD`, `TEAK CITY`, `ROUTE nn`, `PKMN-ARENA`, `KAUFHAUS`, `SPIELHALLE`, `FAHRRADLADEN`, `PENSION`, `UNTERGRUND`.
4. **#MON** groß wo Dump `#MON` hat.
5. Kommentar `; GSC-DE Dump` bei geänderten Blöcken.
6. **Keine** Script-Logik brechen (labels, events, `done`/`promptbutton`/`text_ram`).
7. **Keine** `@` mitten im String (außer echte `@` terminator patterns im Engine-Code).
8. Ellipsis: Dump oft `…` (ein Zeichen) – ok.
9. Badge DUKATIA: Dump = **BASISORDEN** (nicht PLANORDEN / Plain). Kurzname Badge-Liste: **Basis**.
10. Nur **zugewiesene Dateien** editieren. Keine anderen Maps, kein git push, kein make (Orchestrator baut).
11. Wenn Dump und PC-Szene strukturell abweichen: Dump-Inhalt in die vorhandenen Labels mappen; PC-only Labels behalten und dezent polieren.
12. Quality > speed: lieber korrekte Zeilen als Massen-Paraphrase.

## Wichtige Dump-Anker (1-basiert, ca.)
- BIANKA / BASISORDEN: 1644–1666
- FAHRRADLADEN: 1667–1673
- Glücklichkeits-Rater: 1675+
- KAUFHAUS-Intros: 1723–1732
- NATIONALPARK-Schilder: 1963–1964, 1976–1977
- PENSION: 2217–2218, 7990–7993, 2968
- ROUTE 34 Schild: 2966; PENSION 2968
- DUKATIA Schilder/NPCs: 6305–6340
- ROUTE 35: 6493; ROUTE 36: 6171; ROUTE 37: 6958
- Landmarks: 9266–9269

Weitere Texte: im Dump nach Keywords suchen (DUKATIA, BIANKA, NATIONALPARK, RADIOTURM, PENSION, KAUFHAUS, SPIELHALLE, FAHRRAD, ROUTE 3x).

## Ausgabe
Am Ende: kurze Liste geänderter Dateien + was angepasst wurde + offene Unsicherheiten.
