"""Manual German translations for Polished Crystal-only map dialogue."""

# label -> body (text/line/cont/para ... done), no label line
OVERRIDES_BY_LABEL: dict[str, str] = {}

# filename -> label -> body
OVERRIDES_BY_FILE: dict[str, dict[str, str]] = {}

# Normalized English block (see translate_maps.normalize_block) -> German body
INLINE_OVERRIDES: dict[str, str] = {
    "there's always|such a refreshing|breeze here.": '''
	text "Hier weht immer ein"
	line "so erfrischender"
	cont "Wind."
	done''',
}

# --- NewBarkTown (Lyra + PC additions) ---
OVERRIDES_BY_FILE["NewBarkTown.asm"] = {
    "Text_LyraIntro": '''
	text "Lyra: Oh, hallo"
	line "<PLAYER>!"

	para "Ich war vorhin bei"
	line "dir zu Hause,"

	para "aber du hast noch"
	line "geschlafen."

	para "Ich helfe Prof.Lind"
	line "manchmal, weißt"

	para "du noch? Er startet"
	line "neue #mon-"

	para "Forschung und möchte,"
	line "dass wir beide"

	para "helfen. Komm, wir"
	line "schauen mal nach!"
	done''',
    "Text_LyraGoodbye1": '''
	text "Lyra: <PLAYER>!"

	para "Ich habe gehört, du"
	line "hast alle Orden in"
	cont "Johto."

	para "…Du bist wirklich"
	line "etwas Besonderes,"
	cont "<PLAYER>."

	para "Dass wir beide hier"
	line "unsere Reise"

	para "begonnen haben…"
	line ""

	para "Ich helfe Prof.Lind"
	line "so gut ich kann,"

	para "aber gegen den"
	line "Liga-Champion"

	para "käme ich nie an."
	line ""

	para "…Bevor du gehst…"
	line ""

	para "Wie wäre es mit"
	line "noch einem Kampf?"

	para "Ich will sehen, was"
	line "für ein Trainer du"
	cont "geworden bist!"
	done''',
    "Text_LyraGoodbyeWin": '''
	text "Du bist so talentiert"
	line "wie ich erwartet"
	cont "habe!"
	done''',
    "Text_LyraGoodbyeLoss": '''
	text "Hoffentlich hast du"
	line "mich nicht gewähren"
	cont "lassen…"
	done''',
    "Text_LyraGoodbye2": '''
	text "…Danke, <PLAYER>."

	para "Man merkt, wie viel"
	line "Arbeit und Liebe"

	para "du in deine #mon"
	line "gesteckt hast."

	para "…Also, das ist"
	line "Abschied."

	para "Du schaffst die"
	line "#mon-Liga!"

	para "Du wirst ein"
	line "großartiger"
	cont "Champion!"
	done''',
    "LyrasHouseSignText": '''
	text "Lyras Haus"
	done''',
    "ElmsLabSignText": '''
	text "LIND-#mon-LABOR"
	done''',
    "NewBarkTownSignText": '''
	text "Neuborkia"

	para "Die Stadt, in der"
	line "der Wind der Er-"
	cont "neuerung weht"
	done''',
    "PlayersHouseSignText": '''
	text "Haus von <PLAYER>"
	done''',
}

# --- ElmsLab (Lyra + PC-Erweiterungen) ---
OVERRIDES_BY_FILE["ElmsLab.asm"] = {
    "ElmAfterTheftText7": '''
	text "Und ruf mich auch"
	line "mal an."

	para "Wenn du wissen"
	line "willst, wie sich"

	para "deine #mon"
	line "entwickeln,"

	para "ist meine For-"
	line "schung unschätz-"
	cont "bar!"
	done''',
    "ElmGiveOddSouvenirText2": '''
	text "Das ist ein Sou-"
	line "venir von Herrn"
	cont "#mon."

	para "Er sagte, es sei"
	line "ein Andenken von"

	para "seiner Reise auf"
	line "eine tropische"
	cont "Insel."

	para "Angeblich gibt es"
	line "#mon-Arten, die"

	para "es gerne tragen."
	done''',
    "LyraAnnouncesGymChallengeText": '''
	text "Lyra: Da bist du,"
	line "<PLAYER>!"

	para "Ich habe deinen"
	line "Kampf gegen den"
	cont "Champion im TV"
	cont "gesehen."

	para "Du warst unglaub-"
	line "lich!"

	para "Das hat mich"
	line "inspiriert,"
	cont "<PLAYER>."

	para "Auch wenn ich"
	line "dieses Level nie"
	cont "erreiche…"

	para "Ich will es"
	line "versuchen."

	para "Ich will sehen,"
	line "was ich kann."

	para "Prof.Lind, es tut"
	line "mir leid, dass ich"

	para "hier nicht mehr"
	line "helfen kann."

	para "Ich fordere alle"
	line "Arenen in Johto"

	para "heraus und will"
	line "in die #mon-"
	cont "Liga!"

	para "Wünsch mir Glück!"
	line "Bis später!"
	done''',
    "ElmAfterTicketText": '''
	text "LIND: Nun gut,"
	line "<PLAYER>, ihr"

	para "habt beide eure"
	line "eigenen Wege."

	para "Ob sie die Liga"
	line "zuerst erreicht?"

	para "Grüß Prof.Eich in"
	line "Kanto von mir!"
	done''',
    "ElmBeforeBattleText": '''
	text "LIND: <PLAYER>!"
	line "Wie läuft deine"
	cont "#mon-Reise?"
	done''',
    "ElmByTheWayText": '''
	text "Da du schon hier"
	line "bist, <PLAYER>…"
	done''',
    "ElmAskBattleText": '''
	text "Ich könnte etwas"
	line "Kampfpraxis"

	para "gegen einen"
	line "talentierten"

	para "Trainer wie dich"
	line "gebrauchen."

	para "Wie wäre es,"
	line "<PLAYER>?"
	done''',
    "ElmSeenText": '''
	text "Zeig mir, wie weit"
	line "du gekommen bist"

	para "seit Neuborkia!"
	done''',
    "ElmWinText": '''
	text "Erstaunlich!"
	done''',
    "ElmLoseText": '''
	text "Hast du es mir"
	line "leicht gemacht?"
	done''',
    "ElmRefusedBattleText": '''
	text "Wenn deine #mon"
	line "Heilung brauchen,"

	para "benutze einfach"
	line "die Maschine hier."
	done''',
    "ElmsLabLyraWhichPokemonText": '''
	text "Welches #mon"
	line "nimmst du,"
	cont "<PLAYER>?"
	done''',
    "LyraChoosesStarterText": '''
	text "Lyra: Dann nehme"
	line "ich dieses hier!"
	done''',
    "LyraReceivedStarterText": '''
	text "Lyra erhält"
	line ""
	text_ram wStringBuffer3
	text "!"
	done''',
    "LyraNicknamedChikoritaText": '''
	text "Lyra: So süß! Ich"
	line "nenne es Chicory!"
	done''',
    "LyraNicknamedCyndaquilText": '''
	text "Lyra: So süß! Ich"
	line "nenne es Cinder!"
	done''',
    "LyraNicknamedTotodileText": '''
	text "Lyra: So süß! Ich"
	line "nenne es Toto!"
	done''',
    "ElmsLabLyraChallengeText": '''
	text "Lyra: <PLAYER>!"
	line "Lass uns unsere"

	para "#mon in einem"
	line "Kampf kennen-"
	cont "lernen!"
	done''',
    "ElmsLabLyraWinText": '''
	text "Gut gemacht,"
	line "<PLAYER>!"
	done''',
    "ElmsLabLyraLossText": '''
	text "Juhu! Ich hab"
	line "gewonnen!"
	done''',
    "ElmsLabLyraText_YouWon": '''
	text "Das war ein"
	line "spannender Kampf!"
	done''',
    "ElmsLabLyraText_YouLost": '''
	text "Das war ein"
	line "spannender Kampf!"
	done''',
    "ElmsLabLyraThankYouText": '''
	text "Danke für das"
	line "#mon, Prof.Lind!"
	done''',
    "ElmsLabLyraSeeYouText": '''
	text "<PLAYER>, bis"
	line "später!"

	para "Viel Spaß bei"
	line "deinem Auftrag!"
	done''',
    "ElmsLabLyraTheftInnocentText": '''
	text "Lyra: Moment!"
	line "<PLAYER> hat damit"
	cont "nichts zu tun!"

	para "Ich sah einen"
	line "rothaarigen Jungen"
	cont "am Gebäude!"
	done''',
    "ElmsLabLyraTheftGoodbyeText": '''
	text "Lyra: <PLAYER>,"
	line "gut, dass er"

	para "deine Unschuld"
	line "erkannt hat."

	para "Hoffentlich gibt"
	line "der Dieb das"
	cont "#mon zurück…"

	para "Also, bis bald!"
	done''',
}

INLINE_OVERRIDES.update({
    "elm: i'm proud|of you, <player>.|i was right to|trust you with|a #mon!": '''
	text "LIND: Ich bin stolz"
	line "auf dich, <PLAYER>."

	para "Es war richtig,"
	line "dir ein #mon"
	cont "anzuvertrauen!"
	done''',
    "your #mon|looks cute too!": '''
	text "Dein #mon sieht"
	line "auch süß aus!"
	done''',
})

# --- LyrasHouse ---
OVERRIDES_BY_FILE["LyrasHouse1F.asm"] = {
    "LyrasSinkText": '''
	text "Das Waschbecken"
	line "glänzt."
	done''',
    "LyrasStoveText": '''
	text "Auf dem Herd"
	line "köchelt Curry."
	done''',
}

INLINE_OVERRIDES.update({
    "let's see what's|in the fridge…|fresh water and|rice balls!": '''
	text "Mal sehen, was im"
	line "Kühlschrank ist…"

	para "Frisches Wasser"
	line "und Reisbällchen!"
	done''',
    "there's a movie on|tv: a girl with|her hair in pig-|tails is walking|up a brick road.|i'd better get|going too!": '''
	text "Im TV läuft ein"
	line "Film: Ein Mädchen"

	para "mit Zöpfen geht"
	line "einen Backstein-"
	cont "weg entlang."

	para "Ich sollte auch"
	line "losgehen!"
	done''',
})

OVERRIDES_BY_FILE["LyrasHouse2F.asm"] = {
    "LyrasHouseLyraText": '''
	text "Lyra: Hi, <PLAYER>!"

	para "Hmm… Meine #mon"
	line "nehmen vielleicht"

	para "in letzter Zeit"
	line "etwas zu…"
	done''',
    "LyrasHousePCText": '''
	text "Du solltest nicht"
	line "am PC von anderen"
	cont "herumpfuschen!"
	done''',
    "LyrasHouseN64Text": '''
	text "Eine limitierte"
	line "Pikachu-Edition"
	cont "des N64!"
	done''',
}

# --- Route29 (Lyra + PC) ---
OVERRIDES_BY_FILE["Route29.asm"] = {
    "CatchingTutorialRefusedText": '''
	text "Schade… Ich wollte"
	line "mal mein Fang-"
	cont "können zeigen…"

	para "Na ja, nimm das"
	line "hier."
	cont "Viel Glück!"
	done''',
    "CatchingTutorialGoodbyeText": '''
	text "Lyra: Bis bald!"
	done''',
}

# --- Route31 (Finch / Tutor, PC) ---
OVERRIDES_BY_FILE["Route31.asm"] = {
    ".AfterText2": '''
	text "Du hast die Wirkung"
	line "eines Luftballons"
	cont "im Kampf gesehen."

	para "Vielleicht triffst"
	line "du andere Trainer"

	para "wie mich in Johto."
	line "Sie suchen Stärke."

	para "Fordere sie am"
	line "besten heraus!"
	done''',
    ".IntroText": '''
	text "Ich bin ein Trainer,"
	line "der Luftballons im"
	cont "Kampf nutzt."

	para "Ich will von deiner"
	line "Stärke überzeugt"
	cont "werden…"

	para "Besiege alle Trainer"
	line "auf Route 30 und 31,"

	para "dann tritt mir"
	line "gegenüber!"
	done''',
    ".QuestionText": '''
	text "Du hast alle Trainer"
	line "hier besiegt!"

	para "Dann bist du bereit,"
	line "mich herauszu-"
	cont "fordern!"

	para "Kämpfen wir?"
	done''',
    ".RefusedText": '''
	text "Du willst deine"
	line "Stärke nicht mit"
	cont "meiner messen?"

	para "Ich gebe dir mein"
	line "Spezial-Item, wenn"
	cont "du gewinnst…"
	done''',
    ".SeenText": '''
	text "Freut mich! Ich"
	line "stehe dir als"

	para "Luftballon-Nutzer"
	line "entgegen!"
	done''',
    ".BeatenText": '''
	text "Du hast mich zu"
	line "Boden gebracht…"
	done''',
    ".AfterText1": '''
	text "Ein toller Kampf!"
	line "Du bist ein"

	para "aufstrebender"
	line "Trainer!"

	para "Hier ist ein"
	line "Beweis unseres"
	cont "Kampfes."

	para "Ein Luftballon!"
	line "Nimm ihn, mein"
	cont "starker Freund!"
	done''',
}

INLINE_OVERRIDES.update({
    "ok then…": '''
	text "Na gut…"
	done''',
    "you don't have a|silver leaf,|though…": '''
	text "Du hast aber kein"
	line "Silberblatt…"
	done''',
    "there! now your|#mon knows|sleep talk!": '''
	text "So! Dein #mon"
	line "kennt jetzt"
	cont "Schlafrede!"
	done''',
    "i'm waiting for|#mon that|appear only in|the evening or|at night.": '''
	text "Ich warte auf"
	line "#mon, die"

	para "nur am Abend oder"
	line "in der Nacht"
	cont "auftauchen."
	done''',
    # --- Johto gyms (PC variants / inline macro blocks) ---
    "do you know the|benefits of the|hive badge?|if you have it,|#mon up to <lv>30|will obey you,|even traded ones.|#mon that know|cut will be able|to use it outside|of battle too.|here, i also want|you to have this.": '''
	text "Kennst du die Vor-"
	line "züge des INSEKT-"
	cont "ORDENs?"

	para "Durch ihn gehor-"
	line "chen dir #mon"
	cont "bis zu Level 30."

	para "Deine #mon"
	line "können ZERSCHNEI-"
	cont "DER nun auch"
	cont "außerhalb des"
	cont "Kampfes anwenden."

	para "Bitte nimm auch"
	line "dies!"
	done''',
    "tm69 contains|u-turn.|it lets your #-|mon attack, then|switch out right|away.|isn't that great?|i discovered it!": '''
	text "TM69 enthält"
	line "U-Turn."

	para "Dein #mon"
	line "greift an und"

	para "wechselt danach"
	line "sofort aus."

	para "Ist das nicht toll?"
	line "Ich habe es ent-"
	cont "deckt!"
	done''',
    "yo, challenger!|bugsy's young, but|his knowledge of|bug #mon is for|real.|it's going to be|tough without my|advice.|let's see… bug|#mon don't like|fire.|flying-type moves|are super effec-|tive too.": '''
	text "Yo, Herausfor-"
	line "derer!"

	para "KAI ist zwar jung,"
	line "aber sein Wissen"

	para "über Käfer-#-"
	line "MON ist unüber-"
	cont "trefflich."

	para "Ohne meine Tipps"
	line "wird der Kampf für"
	cont "dich sehr hart."

	para "Mal sehen… Käfer-"
	line "#mon mögen kein"
	cont "Feuer."

	para "Auch Flug-Attacken"
	line "sind sehr effek-"
	cont "tiv."
	done''',
    "mimi: you want to|see the leader?|we come first!": '''
	text "UTE: Du willst zum"
	line "LEITER? Erst sind"
	cont "wir dran!"
	done''',
    "mimi: our bug|#mon lost!|oh, what a|shame.": '''
	text "UTE: Unsere Käfer-"
	line "#mon haben ver-"
	cont "loren!"

	para "Oh, was für eine"
	line "Schande."
	done''',
    "amy & mimi: oh,|double goodness!": '''
	text "EVA & UTE: Oh, um"
	line "Himmels Willen!"
	done''',
    "by using a tm, a|#mon will|instantly learn a|new move.|a tm can be used|as many times as|you want.|tm51 contains|roost.|it lands on the|ground to restore|half the max hp.": '''
	text "Mit einer VM kann"
	line "ein #mon sofort"

	para "eine neue Attacke"
	line "lernen."

	para "Eine VM kannst du"
	line "so oft nutzen, wie"
	cont "du willst."

	para "VM51 enthält"
	line "Roost."

	para "Es landet am Boden"
	line "und stellt die"
	cont "Hälfte der max KP"
	cont "wieder her."
	done''',
    "it's attract!|it makes full use|of a #mon's|charm.|isn't it just per-|fect for a cutie|like me? ♥": '''
	text "Es ist ANZIEHUNG!"
	line "Es bringt den"

	para "Charme eines"
	line "#mon voll zur"
	cont "Geltung."

	para "Passt das nicht"
	line "perfekt zu einem"
	cont "süßen Ding wie"
	cont "mir? ♥"
	done''',
    "yo! champ in|making!|this gym is home|to normal-type|#mon trainers.|i recommend you|use fighting-type|#mon.|but be careful--|fairy #mon|resist fighting-|type moves,|and they're used|here too!": '''
	text "Yo! Zukünftiger"
	line "Champion!"

	para "Diese ARENA ist"
	line "die Heimat von"
	cont "Normal-Trainern."

	para "Ich empfehle dir,"
	line "Kampf-#mon"
	cont "einzusetzen."

	para "Aber Vorsicht—"
	line "Fee-#mon"

	para "widerstehen Kampf-"
	line "Attacken,"

	para "und die setzen"
	line "wir hier auch ein!"
	done''',
    "it's shadow ball.|it causes damage|and may reduce|special defense.|use it if it|appeals to you.": '''
	text "Shadow Ball."
	line "Verursacht Schaden"

	para "und kann die"
	line "Spezial-Vert"

	para "senken. Nutze es,"
	line "wenn es dir gefällt."
	done''',
    "that tm contains|avalanche.|it deals more|damage if the user|was hurt first.|it demonstrates|the harshness of|winter.": '''
	text "Diese VM enthält"
	line "Avalanche."

	para "Sie richtet mehr"
	line "Schaden an, wenn"

	para "der Anwender zuerst"
	line "getroffen wurde."

	para "So zeigt sie die"
	line "Härte des Winters."
	done''',
    "the boulders|blocked the|waterfall!": '''
	text "Die Felsen"
	line "blockierten den"
	cont "Wasserfall!"
	done''',
    "i won't admit|this.": '''
	text "Ich gestehe das"
	line "nicht ein."

	para "Ich mag verloren"
	line "haben, aber du"

	para "bist noch nicht"
	line "reif für die"
	cont "#mon-Liga."

	para "Ich weiß. Stelle"
	line "dich der Drachen-"
	cont "Trainer-Heraus-"
	cont "forderung."

	para "Hinter der ARENA"
	line "liegt die"
	cont "DRACHENHÖHLE."

	para "In deren Mitte ist"
	line "ein Schrein. Gehe"
	cont "dorthin."

	para "Falls du beweisen"
	line "kannst, dass du"

	para "deine faulen"
	line "Ideale aufgegeben"

	para "hast, werde ich"
	line "dich als einen"

	para "Trainer ansehen,"
	line "der würdig ist,"

	para "einen Orden"
	line "zu erhalten!"
	done''',
    "what's the matter?|aren't you headed": '''
	text "Was ist los?"

	para "Gehst du nicht zur"
	line "#mon-Liga?"

	para "Kennst du den"
	line "Weg nicht?"

	para "Gehe von hier nach"
	line "Neuborkia."

	para "SURFE dann nach"
	line "Osten. Der Weg"

	para "wird dann sehr be-"
	line "schwerlich."

	para "Wage es nicht, in"
	line "der #mon-Liga"
	cont "zu verlieren!"

	para "Das würde meine"
	line "Niederlage gegen"

	para "dich noch ver-"
	line "schlimmern!"

	para "Gib alles!"
	done''',
    "i lost!|i'm speechless!": '''
	text "Ich habe verloren!"
	line "Ich bin sprachlos!"
	done''',
})

# --- Johto gyms ---
OVERRIDES_BY_FILE["AzaleaGym.asm"] = {
    "TrainerTwinsAmyandmimiBeatenText": '''
	text "EVA & UTE: Oh, um"
	line "Himmels Willen!"
	done''',
    "GenericTrainerTwinsAmyandmimi2.SeenText": '''
	text "UTE: Du willst zum"
	line "LEITER? Erst sind"
	cont "wir dran!"
	done''',
}

OVERRIDES_BY_FILE["VioletGym.asm"] = {
    "VioletGymGuyFalknerAwayText": '''
	text "Hey! Du kannst"
	line "FALK gerade nicht"
	cont "herausfordern."

	para "Er ist in der"
	line "DUNKELHÖHLE und"
	cont "bändigt einen"

	para "URSARING, das ei-"
	line "nen jungen Trainer"
	cont "angegriffen hat."

	para "Komm später wieder."
	done''',
}

OVERRIDES_BY_FILE["GoldenrodGym.asm"] = {
    "SrandjrJoandcath1SeenText": '''
	text "Jo: Wenn du"
	line "BIANKA willst,"

	para "musst du erst"
	line "an mir vorbei!"

	para "Cath, klang das"
	line "cool?"
	done''',
    "SrandjrJoandcath1BeatenText": '''
	text "Jo: Verlieren ist"
	line "gar nicht cool!"
	done''',
    "SrandjrJoandcath2SeenText": '''
	text "Cath: Ich will"
	line "BIANKA besiegen,"

	para "aber erst kämpfen"
	line "wir gegen dich!"
	done''',
    "SrandjrJoandcath2BeatenText": '''
	text "Cath: Oh nein,"
	line "nein, nein!"
	done''',
}

OVERRIDES_BY_FILE["BlackthornGym1F.asm"] = {
    "BlackthornGymClairScript.GoToDragonsDenText": '''
	text "Ich gestehe das"
	line "nicht ein."

	para "Ich mag verloren"
	line "haben, aber du"

	para "bist noch nicht"
	line "reif für die"
	cont "#mon-Liga."

	para "Ich weiß. Stelle"
	line "dich der Drachen-"
	cont "Trainer-Heraus-"
	cont "forderung."

	para "Hinter der ARENA"
	line "liegt die"
	cont "DRACHENHÖHLE."

	para "In deren Mitte ist"
	line "ein Schrein. Gehe"
	cont "dorthin."

	para "Falls du beweisen"
	line "kannst, dass du"

	para "deine faulen"
	line "Ideale aufgegeben"

	para "hast, werde ich"
	line "dich als einen"

	para "Trainer ansehen,"
	line "der würdig ist,"

	para "einen Orden"
	line "zu erhalten!"
	done''',
    "ClairPokemonLeagueDirectionsText": '''
	text "Was ist los?"

	para "Gehst du nicht zur"
	line "#mon-Liga?"

	para "Kennst du den"
	line "Weg nicht?"

	para "Gehe von hier nach"
	line "Neuborkia."

	para "SURFE dann nach"
	line "Osten. Der Weg"

	para "wird dann sehr be-"
	line "schwerlich."

	para "Wage es nicht, in"
	line "der #mon-Liga"
	cont "zu verlieren!"

	para "Das würde meine"
	line "Niederlage gegen"

	para "dich noch ver-"
	line "schlimmern!"

	para "Gib alles!"
	done''',
}

OVERRIDES_BY_FILE["OlivineGym.asm"] = {
    "OlivineGymLassConnie.SeenText": '''
	text "Kicher… Ich weiß,"
	line "wie gut du bist,"

	para "das habe ich am"
	line "LEUCHTTURM gesehen."

	para "Zeig das JASMIN"
	line "auch!"

	para "Viel Glück!"
	done''',
    "OlivineGymLassConnie.AfterText": '''
	text "Du bist toll…"
	line "Mit so viel Po-"

	para "tenzial solltest"
	line "du noch höher"
	cont "hinaus."

	para "Warst du schon in"
	line "MAHAGONIA CITY?"
	done''',
    "OlivineGymGentlemanPreston.SeenText": '''
	text "Ich wusste, dass"
	line "du kommen würdest."

	para "Danke, dass du der"
	line "ARENALEITERIN ge-"
	cont "holfen hast,"

	para "aber ein Kampf"
	line "ist etwas anderes."

	para "Los geht's!"
	done''',
    "OlivineGymGentlemanPreston.AfterText": '''
	text "Beeindruckend!"
	line "Hol dir noch mehr"

	para "Orden mit so viel"
	line "Können!"
	done''',
}

OVERRIDES_BY_FILE["CianwoodGym.asm"] = {
    "CianwoodGymBlackBeltText": '''
	text "Der ARENA-Guide hat"
	line "zu viel Angst vor"
	cont "uns, um zu bleiben."

	para "Was für ein Weich-"
	line "ling!"
	done''',
    "CianwoodGymChuckTrainingText": '''
	text "Er ist so in sein"
	line "Training vertieft,"

	para "dass er dich nicht"
	line "bemerkt."
	done''',
    "CianwoodGymBoulderText": '''
	text "Der Felsen"
	line "blockiert den"
	cont "Wasserfall."
	done''',
    "CianwoodGymChucksBoulderText": '''
	text "Der Felsen ist zu"
	line "schwer zum Bewegen."
	done''',
}

INLINE_OVERRIDES.update({
    "jo: i'm helping my|junior cath to|earn a badge|from whitney.|she's improving|gradually.": '''
	text "Jo: Ich helfe mei-"
	line "ner Junior Cath,"

	para "einen Orden von"
	line "BIANKA zu holen."

	para "Sie wird langsam"
	line "besser."
	done''',
    "cath: i keep on|losing to whitney.|it's depressing.|i'm ok! if i lose,|i'll just try|harder next time!": '''
	text "Cath: Ich verliere"
	line "immer gegen BIANKA."

	para "Das ist deprimie-"
	line "rend."

	para "Schon gut! Wenn"
	line "ich verliere,"

	para "versuche ich es"
	line "beim nächsten Mal"
	cont "nochmal!"
	done''',
})