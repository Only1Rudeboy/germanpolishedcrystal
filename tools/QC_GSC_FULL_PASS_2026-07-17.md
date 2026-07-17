# GSC Full Pass Report (2026-07-17)

## Method
- 4 parallel explore subagents: battle, UI/system, early Johto maps, phone
- Automated EN/non-GSC pattern scans
- Cross-check vs `tools/_gsc_de_crystal_msg.txt`

## Applied this session (high-impact)

### Battle (`data/text/battle.asm`)
- Sleep/freeze/recharge, obedience pack, DELEGATOR (Substitute), STACHLER, weather start/end
- Infatuation/Endure/trap/Foresight/Thief/Destiny Bond, menu edge cases
- HitNTimes → Erleidet N Treffer, BLOCKIERT, etc. (~50 strings)

### System UI
- Save: SICHERN / hat das Spiel gesichert
- PC: schaltet (Präsens), ITEM-LAGERUNGS-SYSTEM
- Start menu: #DEX, BEUTEL, SICHERN, OPTION, ZURÜCK
- Pokedex: Treffer/, n. Name (was English Results/by Name)
- Phone register: already speichert NAMEs Nummer

### Maps / phone
- Mom: Baby! (GSC)
- Dark Cave Falkner: TAUBOGA, VIOLA CITY, ARENALEITER
- Buena: Sorry, verwählt!

## Remaining backlog (next passes)

### Battle still open
- Screen fade (LICHTSCHILD/REFLEKTOR/BODYGUARD) full CAPS wording
- Belly Drum, Mist, Safeguard, Transform full GSC
- Ability messages (Polished-only → GSC-near tone)
- Final mon slang (Comeback, Yeehah)

### Items
- Truncated names: Trödelschw, Schicksalb, Wechselpz, Zimmerserv…
- Official DE renames: Luftballon, Leben-Orb, Offensivweste, Macht-*

### Maps
- Title-case places in some NPCs (Dukatia City → DUKATIA CITY)
- Ruins Icognito / #-Com
- Kurt Sympabälle/Turbobälle calques
- Tip signs: unify Profi-Tipps

### Phone
- Callers: optional restore GSC "Sorry" (liz, brent, wade, gina, elm)
- Lyra phone (PC-only) GSC-near polish

### Policy
- Keep dump anglicisms that ARE GSC: Yeah, Wow, Hi, Cool, Items, O.K., Earl dialect
- Do not re-run tools/_fix_battle_gsc_de.py blindly (stale targets)

## ROM
See commit + polishedcrystal-3.2.3.gbc after build.
