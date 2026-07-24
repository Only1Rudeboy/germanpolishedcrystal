	; rawchars, damit `plural` Strings umdrehen kann
	setcharmap no_ngrams

MACRO plural
	for i, CHARLEN(\1)
		db STRCHAR(\1, CHARLEN(\1) - 1 - i)
	endr
	db "@", \2, "@"
ENDM

PluralTable:
	; Reihenfolge ist wichtig: längere Suffixe vor kürzeren!
	; Deutsche Pluralregeln für Item-Namen (siehe data/items/names.asm)
if !DEF(FAITHFUL)
	plural "kuchen",     "kuchen"     ; Zornskuchen
endc
	plural "honig",     "honig"      ; Honig, Süßer Honig
	plural "beere",     "beeren"     ; Amrenabeere, Maronbeere, etc.
	plural "ung",       "ungen"      ; Top-Genesung
	plural "ball",      "bälle"      ; Pokéball, Superball, etc.
	plural "ank",       "änke"       ; Trank, Supertrank, Hypertrank, Top-Trank
	plural "bonbon",    "bonbons"    ; Sonderbonbon
	plural "stein",     "steine"     ; Blattstein, Feuerstein, etc.
	plural "mantel",    "mäntel"     ; Metallmantel
	plural "asche",     "aschen"     ; Zauberasche
	plural "urzel",     "urzeln"     ; Kraftwurzel, Großwurzel
	plural "raut",      "räuter"     ; Vitalkraut, Mentalkraut, Spiegelkraut, etc.
	plural "staub",     "stäube"     ; Energiestaub, Silberstaub, Sternenstaub, Blendpuder
	plural "stück",     "stücke"     ; Sternenstück, Ziegelstück
	plural "brief",     "briefe"     ; Blumenbrief, Wellenbrief, etc.
	plural "fossil",    "fossilien"  ; Helixfossil, Domfossil
	plural "klaue",     "klauen"     ; Flinkklaue, Griffklaue, Scharfklaue
	plural "kette",     "ketten"     ; Perlenkette, Machtkette
	plural "hülle",     "hüllen"     ; Wechselhülle
	plural "knopf",     "knöpfe"     ; Fluchtknopf
	plural "helm",      "helme"      ; Beulenhelm
	plural "glas",      "gläser"     ; Schattenglas
	plural "brille",    "brillen"    ; Wahlbrille, Schutzbrille
	plural "gurt",      "gurte"      ; Schwarzgurt, Fokusgurt, Expertengurt, Machtgurt
	plural "schal",     "schals"     ; Seidenschal, Wahlschal
	plural "seil",      "seile"      ; Fluchtseil
	plural "band",      "bänder"     ; Klammerband, Machoband, Wahlband, Machtband
	plural "tasche",    "taschen"    ; Fluchttasche
	plural "brocken",   "brocken"    ; Nass-/Heiß-/Glatt-/Eisbrocken
	plural "ohle",      "ohlen"      ; Holzkohle
	plural "amen",      "amen"       ; Mystosamen
	plural "löffel",    "löffel"     ; Krümmlöffel
	plural "ilch",      "ilch"       ; Kuhmuh-Milch
	plural "ift",       "ifte"       ; Gegengift
	plural "ade",       "aden"       ; Limonade
	plural "sand",      "sand"       ; Pudersand
	plural "utz",       "utz"        ; Schutz, Superschutz, Top-Schutz (kein Plural-s)
	plural "stats",     "stats"      ; Schutzstats
	plural "block",     "blöcke"     ; Megablock
	plural "puder",     "puder"      ; Heilpuder
	plural "stiefel",   "stiefel"    ; Bleistiefel
	plural "Plus",      "Plus"       ; KP-Plus, AP-Plus
	plural "ax",        "ax"         ; AP-Max
	plural "ith",       "ithe"       ; Evolith
	plural "rb",        "rbe"        ; Leben-Orb, Heiß-Orb, Tox-Orb
	plural "ier",       "iere"       ; Elixier, Top-Elixier
	plural "er",        "er"         ; Beleber, Feuerheiler, Para-Heiler, Äther, etc.
	plural "el",        "eln"        ; Sprudel
	plural "s",         "s"          ; Carbon, Protein, Eisen, Kalzium, Zink, Nugget, etc.
	plural "",          "s"          ; alles andere (Nuggets, Evolithe, etc.)
PluralTableEnd:

	setcharmap default