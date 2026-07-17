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
	li "Blitzball"
	li "Finsterball"
	li "Traumball"

	li "Premierball" ; EN Premier Ball / DE-offiziell (nicht „Bonusball“)
	li "Erinnerball"

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
	li "X-SpezAngr"
	li "X-SpezVert"
	li "X-Treffer"
	li "Angriffplus"
if DEF(FAITHFUL)
	li "Megablock"
else
	li "Schutzplus"
endc

	li "Fähigkapsel"
	li "Fähig-Patch"

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

	li "Kuschelglo"
	li "Muschelglo"

	li "Muskelband"
	li "Weisenbrille"
	li "Expertengurt"
	li "Lichtlehm"
	li "Lebensorb"
	li "Fokusgurt"
	li "Metronom"
	li "Eisenball"
	li "Trödelschw"
	li "Schicksalb"
	li "Fesselklaue"
	li "Wechselpz"
	li "Sogwurzel"

	li "Evolith"
	li "Wehrstein"
	li "Ballonschw"
	li "Rote Karte"
	li "Bindeband"
	li "Auswechsler"

	li "Schwächepakt"
	li "Sturmweste"
	li "Schutzbrille"

	li "Schutzpols"

	li "Kehlspray"
	li "Fluchtpack"
	li "Wehrstiefel"
	li "Fehlerpakt"
	li "Zimmerserv"

	li "Klarumulett"
	li "Spiegelkraut"
	li "Boxhandschuh"
	li "Tarnumhang"
	li "Zinkwürfel"

	li "Kugelblitz"
	li "Lauchstange"
	li "Kampfknochen"
	li "Lucky Punch"
	li "Metallstaub"
	li "Schnellstaub"
	li "Rüstung"

	li "Scope-Linse"
	li "Weitlinse"
	li "Zoomlinse"

	li "Seelenkraut"
	li "Kraftkraut"
	li "Weißkraut"

	li "Feuchtstein"
	li "Hitzestein"
	li "Glattstein"
	li "Kaltstein"

	li "Wahlband"
	li "Wahlschal"
	li "Wahlglas"

	li "Feuerorb"
	li "Giftorb"
	li "Giftschlamm"

	li "Machoarmband"
	li "Kraftgewicht"
	li "Kraftarmband"
	li "Kraftgurt"
	li "Kraftlinse"
	li "Kraftband"
	li "Kraftfußband"

	li "Drachenhaut"
	li "Up-Grade"
	li "Rätseldisk"
	li "Protektor"
	li "Elektrisator"
	li "Magmatisator"
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
	li "Seltenknoc"
	li "Flegmonrute"

	li "Helixfossil"
	li "Domfossil"
	li "Bernstein"
	li "Glitzerbonbon"

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