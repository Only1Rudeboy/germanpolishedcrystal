; If you change the item names, also update PluralTable (see data/text/plural_table.asm)

	; use rawchars so VWF will work in the PC
	setcharmap no_ngrams

ItemNames::
	list_start
	li "Parkball"

	li "Pokéball"
	li "Superball"
	li "Hyperball"
	li "Meisterball"

	li "Safariball"

	li "Levelball"
	li "Köderball"
	li "Mondball"
	li "Freundesball"
	li "Turboball"
	li "Schwerball"
	li "Sympaball"

	li "Wiederball"
	li "Zeitball"
	li "Nestball"
	li "Netzball"
	li "Tauchball"
	li "Luxusball"
	li "Heilball"
	li "Flottball"
	li "Finsterball"
	li "Traumball"

	li "Premierball" ; EN Premier Ball / DE-offiziell (nicht „Bonusball“)
	li "Jubelball"

	li "Trank"
	li "Supertrank"
	li "Hypertrank"
	li "Top-Trank"

	li "Gegengift"
	li "Feuerheiler"
	li "Para-Heiler"
	li "Aufwecker"
	li "Eisheiler"
	li "Hyperheiler"
	li "Top-Genesung"

	li "Beleber"
	li "Top-Beleber"

	li "Äther"
	li "Top-Äther"
	li "Elixier"
	li "Top-Elixier"

	li "KP-Plus"
	li "Protein"
	li "Eisen"
	li "Carbon"
	li "Kalzium"
	li "Zink"
	li "Sonderbonbon"
	li "AP-Plus"
	li "AP-Max"

	li "Tafelwasser"
	li "Sprudel"
	li "Limonade"
	li "Kuhmuh-Milch"
if DEF(FAITHFUL)
	li "Wutkeks"
else
	li "Wutkeks"
endc
	li "Marmorkeks"

	li "Energiestaub"
	li "Kraftwurzel"
	li "Heilpuder"
	li "Vitalkraut"

	li "Zauberasche"

	li "Cheribeere"
	li "Chestobeere"
	li "Pechabeere"
	li "Rawstbeere"
	li "Aspearbeere"
	li "Leppabeere"
	li "Oranbeere"
	li "Persimbeere"
	li "Miraculbeere"
	li "Sitrusbeere"

	li "Figybeere"

	li "Pomegbeere"
	li "Kelpsybeere"
	li "Qualotbeere"
	li "Hondewbeere"
	li "Grepabeere"
	li "Tamatobeere"

	li "Liechibeere"
	li "Ganlonbeere"
	li "Salacbeere"
	li "Petayabeere"
	li "Apicotbeere"
	li "Lansatbeere"
	li "Starfbeere"

	li "Enigmabeere"

	li "Custapbeere"

	li "Jabocabeere"
	li "Rowapbeere"

	li "Keebeere"
	li "Marangabeere"

	li "Beerensaft"

	li "Schutz"
	li "Superschutz"
	li "Top-Schutz"

	li "Fluchtseil"
	li "Poképuppe"

	li "Dünger"

if DEF(FAITHFUL)
	li "Honig"
else
	li "Süßhonig"
endc

	li "X-Angriff"
	li "X-Abwehr"
	li "X-Tempo"
	li "X-Sp.Ang."
	li "X-Sp.Vert"
	li "X-Genauig."
	li "Angriffplus"
if DEF(FAITHFUL)
	li "Megablock"
else
	li "Schutzplus"
endc

	li "Fähigk.Kaps."
	li "Fähigpflast."

	li "Blattstein"
	li "Feuerstein"
	li "Wasserstein"
	li "Donnerstein"
	li "Eisstein"
	li "Mondstein"
	li "Sonnenstein"
	li "Finsterstein"
	li "Glanzstein"
	li "Ewigstein"

	li "EP-Teiler"

	li "Seidenschal"
	li "Schwarzgurt"
	li "Hackattack"
	li "Giftstich"
	li "Pudersand"
	li "Granitstein"
	li "Silberstaub"
	li "Bannsticker"
	li "Metallmantel"
	li "Holzkohle"
	li "Zauberwasser"
	li "Wundersaat"
	li "Magnet"
	li "Krümmlöffel"
	li "Ewiges Eis"
	li "Drachenzahn"
	li "Schattenglas"
	li "Feenfeder"

	li "Berserk-Gen"
	li "Blendpuder"
	li "Flinkklaue"
	li "King-Stein"
	li "Münzamulett"
	li "Schutzband"
	li "Rauchball"
	li "Fokus-Band"
	li "Glücks-Ei"
	li "Überreste"

	li "Sanftglocke"
	li "Muschelgl."

	li "Muskelband"
	li "Weisenbrille"
	li "Expertengurt"
	li "Lichtlehm"
	li "Leben-Orb"
	li "Fokusgurt"
	li "Metronom"
	li "Eisenkugel"
	li "Schwerschw."
	li "Fatumknoten"
	li "Griffklaue"
	li "Wechselhülle"
	li "Großwurzel"

	li "Evolith"
	li "Beulenhelm"
	li "Luftballon"
	li "Rote Karte"
	li "Klammerband"
	li "Fluchtknopf"

	li "Schwächepol."
	li "Offensivw."
	li "Schutzbrille"

	li "Schutzpolst."

	li "Halsspray"
	li "Fluchttasche"
	li "Plateausch."
	li "Fehlschlags."
	li "Bizarroserv."

	li "Klaramulett"
	li "Spiegelkraut"
	li "Boxhandschuh"
	li "Tarnumhang"
	li "Gezinkwürfel"

	li "Kugelblitz"
	li "Lauchstange"
	li "Kampfknochen"
	li "Pointerfaust"
	li "Metallstaub"
	li "Flottstaub"
	li "Rüstung"

	li "Scope-Linse"
	li "Großlinse"
	li "Zoomlinse"

	li "Mentalkraut"
	li "Energiekraut"
	li "Schlohkraut"

	li "Nassbrocken"
	li "Heißbrocken"
	li "Glattbrocken"
	li "Eisbrocken"

	li "Wahlband"
	li "Wahlschal"
	li "Wahlbrille"

	li "Heiß-Orb"
	li "Toxik-Orb"
	li "Giftschleim"

	li "Machoband"
	li "Machtgewicht"
	li "Machtreif"
	li "Machtgurt"
	li "Machtlinse"
	li "Machtband"
	li "Machtkette"

	li "Drachenhaut"
	li "Up-Grade"
	li "Dubiosdisc"
	li "Schützer"
	li "Stromisierer"
	li "Magmaisierer"
	li "Scharfzahn"
	li "Scharfklaue"
	li "Ovalstein"
	li "Kuriosum"
	li "Bindeschnur"

	li "Silberblatt"
	li "Goldblatt"
	li "Minzblatt"
	li "Kronkorken"

	li "Nugget"
	li "Großnugget"
	li "Minipilz"
	li "Riesenpilz"
	li "Balsampilz"
	li "Perle"
	li "Riesenperle"
	li "Perlenkette"
	li "Sternenstaub"
	li "Sternenstück"
	li "Ziegelstein"
	li "Steinknochen"
	li "Flegmon-Rute"

	li "Helixfossil"
	li "Domfossil"
	li "Altbernstein"

	li "Blumenbrief"
	li "Surferbrief"
	li "Cyanbrief"
	li "Abbildbrief"
	li "Herzbrief"
	li "Anara-Brief"
	li "Morph-Brief"
	li "Kobaltbrief"
	li "Melodiebrief"
	li "Trugbrief"
	assert_list_length NUM_ITEMS + 1

	setcharmap default