SaffronGym_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  8, 17, SAFFRON_CITY, 2
	warp_event  9, 17, SAFFRON_CITY, 2
	warp_event 11, 14, SAFFRON_GYM, 18
	warp_event 19, 14, SAFFRON_GYM, 19
	warp_event 19, 10, SAFFRON_GYM, 20
	warp_event  0, 10, SAFFRON_GYM, 21
	warp_event  4,  2, SAFFRON_GYM, 22
	warp_event 11,  4, SAFFRON_GYM, 23
	warp_event  0, 14, SAFFRON_GYM, 24
	warp_event 19,  2, SAFFRON_GYM, 25
	warp_event 15, 16, SAFFRON_GYM, 26
	warp_event  4, 16, SAFFRON_GYM, 27
	warp_event  4,  8, SAFFRON_GYM, 28
	warp_event  8,  2, SAFFRON_GYM, 29
	warp_event 15,  8, SAFFRON_GYM, 30
	warp_event 15,  4, SAFFRON_GYM, 31
	warp_event  0,  4, SAFFRON_GYM, 32
	warp_event 19, 16, SAFFRON_GYM, 3
	warp_event 19,  8, SAFFRON_GYM, 4
	warp_event  0,  8, SAFFRON_GYM, 5
	warp_event  4,  4, SAFFRON_GYM, 6
	warp_event 11,  2, SAFFRON_GYM, 7
	warp_event  0, 16, SAFFRON_GYM, 8
	warp_event 19,  4, SAFFRON_GYM, 9
	warp_event 15, 14, SAFFRON_GYM, 10
	warp_event  4, 14, SAFFRON_GYM, 11
	warp_event  4, 10, SAFFRON_GYM, 12
	warp_event  8,  4, SAFFRON_GYM, 13
	warp_event 15, 10, SAFFRON_GYM, 14
	warp_event 15,  2, SAFFRON_GYM, 15
	warp_event  0,  2, SAFFRON_GYM, 16
	warp_event 11, 10, SAFFRON_GYM, 17
	warp_event  8, 10, SAFFRON_GYM, 3

	def_coord_events

	def_bg_events
	bg_event  8, 15, BGEVENT_READ, SaffronGymStatue

	def_object_events
	object_event  9,  8, SPRITE_SABRINA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronGymSabrinaScript, -1
	object_event  2,  3, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerMediumDoris, -1
	object_event  9,  3, SPRITE_PSYCHIC, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPsychicLeon, -1
	object_event 17,  3, SPRITE_PSYCHIC, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPsychicJared, -1
	object_event  2,  9, SPRITE_HEX_MANIAC, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerHexManiacLuna, -1
	object_event 17,  9, SPRITE_HEX_MANIAC, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerHexManiacNatalie, -1
	object_event  2, 15, SPRITE_PSYCHIC, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPsychicFranklin, -1
	object_event 17, 15, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerMediumRebecca, -1
	object_event  9, 14, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SaffronGymGuyScript, -1

SaffronGymSabrinaScript:
	faceplayer
	opentext
	checkflag ENGINE_SOULBADGE
	iftruefwd .FightDone
	writetext SabrinaIntroText
	waitbutton
	closetext
	winlosstext SabrinaWinLossText, 0
	loadtrainer SABRINA, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_SABRINA
	setevent EVENT_BEAT_MEDIUM_DORIS
	setevent EVENT_BEAT_PSYCHIC_LEON
	setevent EVENT_BEAT_PSYCHIC_JARED
	setevent EVENT_BEAT_HEX_MANIAC_LUNA
	setevent EVENT_BEAT_HEX_MANIAC_NATALIE
	setevent EVENT_BEAT_PSYCHIC_FRANKLIN
	setevent EVENT_BEAT_MEDIUM_REBECCA
	opentext
	givebadge SOULBADGE, KANTO_REGION
	callstd kantopostgymevents
.FightDone:
	checkevent EVENT_GOT_TM29_PSYCHIC
	iftrue_jumpopenedtext SabrinaFightDoneText
	writetext SabrinaMarshBadgeText
	promptbutton
	verbosegivetmhm TM_PSYCHIC
	setevent EVENT_GOT_TM29_PSYCHIC
	jumpthisopenedtext

	text "TM29 ist Psychic."

	para "Es kann die"
	line "SP.-VERT des"
	cont "Zieles senken."

	para "Du wirst ein"
	line "gefürchteter und"
	cont "beliebter Champ!"
	done

GenericTrainerMediumDoris:
	generictrainer MEDIUM, DORIS, EVENT_BEAT_MEDIUM_DORIS, MediumDorisSeenText, MediumDorisBeatenText

	text "Mist! Ich habe"
	line "vergessen, dass"
	cont "ich meine"
	cont "Niederlage gegen"
	cont "dich voraussah."
	done
GenericTrainerPsychicLeon:
	generictrainer PSYCHIC_T, LEON, EVENT_BEAT_PSYCHIC_LEON, PsychicLeonSeenText, PsychicLeonBeatenText

	text "Sabrinas Kraft ist"
	line "stärker als meine!"
	done

GenericTrainerPsychicJared:
	generictrainer PSYCHIC_T, JARED, EVENT_BEAT_PSYCHIC_JARED, PsychicJaredSeenText, PsychicJaredBeatenText

	text "Der KARATE-"
	line "MEISTER, Leiter"

	para "des KARATE DOJO,"
	line "ist gerade von"
	cont "SABRINA besiegt"
	cont "worden."
	done
GenericTrainerHexManiacLuna:
	generictrainer HEX_MANIAC, LUNA, EVENT_BEAT_HEX_MANIAC_LUNA, HexManiacLunaSeenText, HexManiacLunaBeatenText

	text "ALAKAZAM ist ein"
	line "mächtiges #mon,"

	para "deshalb benutzen"
	line "HEX MANIACS"

	para "seinen Namen für"
	line "starke Zauber."
	done

GenericTrainerHexManiacNatalie:
	generictrainer HEX_MANIAC, NATALIE, EVENT_BEAT_HEX_MANIAC_NATALIE, HexManiacNatalieSeenText, HexManiacNatalieBeatenText

	text "Vielleicht bin ich"
	line "nicht für Hex"
	cont "Maniacs gemacht…"
	done

GenericTrainerPsychicFranklin:
	generictrainer PSYCHIC_T, FRANKLIN, EVENT_BEAT_PSYCHIC_FRANKLIN, PsychicFranklinSeenText, PsychicFranklinBeatenText

	text "Du hast auch deine"
	line "Seele gestärkt,"
	cont "nicht nur deine"
	cont "Fähigkeiten."
	done
GenericTrainerMediumRebecca:
	generictrainer MEDIUM, REBECCA, EVENT_BEAT_MEDIUM_REBECCA, MediumRebeccaSeenText, MediumRebeccaBeatenText

	text "Woher kommt deine"
	line "Kraft?"
	done
SaffronGymGuyScript:
	checkevent EVENT_BEAT_SABRINA
	iftrue_jumptextfaceplayer SaffronGymGuyWinText
	jumpthistextfaceplayer

	text "He! Ein CHAMP in"
	line "spe!"

	para "Ein Trainer deines"
	line "Kalibers"

	para "braucht sicher"
	line "keine Anweisung,"

	para "wie mit Psycho-"
	line "#mon umzugehen"
	cont "ist, nicht wahr?"

	para "Ich erwarte Großes"
	line "von dir!"

	para "Viel Glück!"
	done
SaffronGymStatue:
	gettrainername SABRINA, 1, STRING_BUFFER_4
	checkflag ENGINE_SOULBADGE
	iftruefwd .Beaten
	jumpstd gymstatue1
.Beaten:
	jumpstd gymstatue2

SabrinaIntroText:
	text "SABRINA: Ich"
	line "wusste, dass du"
	cont "kommen würdest…"

	para "Vor drei Jahren"
	line "sah ich dich in"
	cont "einer Vision."

	para "Du willst meinen"
	line "ORDEN haben."

	para "Ich habe keine"
	line "Freude am Kämpfen,"

	para "aber als LEITERIN"
	line "ist es meine"

	para "Pflicht, all denen"
	line "einen ORDEN zu"

	para "geben, die sich"
	line "als würdig"
	cont "erwiesen haben."

	para "Da du es wünschst,"
	line "werde ich dir"
	cont "meine psychischen"
	cont "Kräfte zeigen!"
	done





SabrinaWinLossText:
	text "SABRINA: Deine"
	line "Stärke…"

	para "übertrifft meine"
	line "Vorahnungen bei"
	cont "weitem…"

	para "Vielleicht ist es"
	line "nicht möglich,"

	para "alles vorherzu-"
	line "sagen, was die"
	cont "Zukunft bringt…"

	para "Gut, du hast dir"
	line "den SUMPFORDEN"
	cont "verdient."
	done





SabrinaMarshBadgeText:
	text "SABRINA: Der"
	line "SUMPFORDEN"

	para "aktiviert deine"
	line "unterbewussten"
	cont "Kräfte…"

	para "Obwohl ich nicht"
	line "in der Lage war,"
	cont "deine Stärke"
	cont "vorauszusehen,"
	cont "weiß ich das ganz"
	cont "sicher."

	para "Du wirst ein"
	line "gefeierter und"
	cont "beliebter CHAMP"
	cont "werden!"
	done





SabrinaFightDoneText:
	text "SABRINA: Deine"
	line "Zuneigung zu"
	cont "deinen"

	para "#mon hat meine"
	line "Psychostärke"
	cont "übertroffen…"

	para "Die Kraft der"
	line "Liebe ist meiner"

	para "Ansicht nach auch"
	line "eine Art von"
	cont "Psychostärke…"
	done





MediumDorisSeenText:
	text "Hehehehe… Ich habe"
	line "es deutlich vor"
	cont "mir."

	para "Ich kann in deine"
	line "Seele blicken!"
	done





MediumDorisBeatenText:
	text "Obwohl ich in dir"
	line "lesen kann, habe"
	cont "ich verloren…"
	done





PsychicLeonSeenText:
	text "Du kannst meiner"
	line "Psycho-Kraft nicht"
	cont "widerstehen!"
	done

PsychicLeonBeatenText:
	text "Meine Vorhersage"
	line "war falsch…"
	done

PsychicJaredSeenText:
	text "Das KARATE DOJO"
	line "nebenan war früher"
	cont "die #mon-ARENA"
	cont "der Stadt."
	done





PsychicJaredBeatenText:
	text "Ich war leicht zu"
	line "besiegen…"
	done





HexManiacLunaSeenText:
	text "Abra, Kadabra,"
	line "Alakazam!"
	done

HexManiacLunaBeatenText:
	text "Mein Fluch schlug"
	line "fehl?"
	done

HexManiacNatalieSeenText:
	text "Kämpfen wir!"
	line "Mwahaha!"
	done

HexManiacNatalieBeatenText:
	text "Mwaha--cough!"
	done

PsychicFranklinSeenText:
	text "Psychische Stärke"
	line "ist die Kraft"
	cont "deiner Seele."
	done





PsychicFranklinBeatenText:
	text "Deine Seele ist"
	line "stärker als meine!"
	done





MediumRebeccaSeenText:
	text "Die Kraft all"
	line "derer, die du"
	cont "besiegt hast,"
	cont "offenbart sich"
	cont "mir!"
	done





MediumRebeccaBeatenText:
	text "Stark… Viel zu"
	line "stark…"
	done





SaffronGymGuyWinText:
	text "Das war wieder ein"
	line "fantastischer"
	cont "Kampf!"
	done
