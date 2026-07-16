IvysLab_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4, 11, VALENCIA_ISLAND, 1
	warp_event  5, 11, VALENCIA_ISLAND, 1

	def_coord_events

	def_bg_events
	bg_event  5,  0, BGEVENT_JUMPTEXT, IvysLabWindowText
	bg_event  2,  1, BGEVENT_READ, IvysLabHealingMachine
	bg_event  6,  1, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  7,  1, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  8,  1, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  9,  1, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  0,  7, BGEVENT_READ, PokemonJournalProfIvyScript
	bg_event  1,  7, BGEVENT_READ, PokemonJournalProfIvyScript
	bg_event  2,  7, BGEVENT_READ, PokemonJournalProfIvyScript
	bg_event  3,  7, BGEVENT_READ, PokemonJournalProfIvyScript
	bg_event  6,  7, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  7,  7, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  8,  7, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  9,  7, BGEVENT_JUMPSTD, difficultbookshelf

	def_object_events
	object_event  4,  3, SPRITE_IVY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ProfIvyScript, -1
	object_event  5,  3, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, NIDORINO, -1, PAL_MON_PURPLE, OBJECTTYPE_SCRIPT, NO_FORM, IvysLabNidorinoScript, -1
	object_event  2,  9, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, IvysLabHopeScript, -1

	object_const_def
	const IVYSLAB_IVY
	const IVYSLAB_NIDORINO

ProfIvyScript:
	faceplayer
	opentext
	checkevent EVENT_HEALED_NIDORINO
	iftruefwd .GetItem
	writetext .RequestText
	yesorno
	iffalse_jumpopenedtext .NoBerryText
	checkitem LIECHI_BERRY
	iffalse_jumpopenedtext .NoBerryText
	takeitem LIECHI_BERRY
	checkitem LIECHI_BERRY
	iffalsefwd .Return1
	takeitem LIECHI_BERRY
	checkitem LIECHI_BERRY
	iffalsefwd .Return2
	takeitem LIECHI_BERRY
	writetext .OkayText
	waitbutton
	closetext
	turnobject IVYSLAB_IVY, RIGHT
	pause 15
	playmusic MUSIC_HEAL
	pause 60
	special RestartMapMusic
	pause 15
	showcrytext IvysLabNidorinoText, NIDORINO
	showemote EMOTE_HAPPY, IVYSLAB_NIDORINO, 15
	setevent EVENT_HEALED_NIDORINO
	setlasttalked IVYSLAB_IVY
	faceplayer
	opentext
.GetItem
	checkevent EVENT_GOT_MOON_STONE_FROM_IVY
	iftruefwd .GotItem
	writetext .ThanksText
	promptbutton
	verbosegiveitem MOON_STONE
	iffalse_endtext
	setevent EVENT_GOT_MOON_STONE_FROM_IVY
.GotItem:
	checkevent EVENT_BEAT_PROF_IVY
	iftrue_jumpopenedtext .AfterText
	writetext .ChallengeText
	yesorno
	iffalse_jumpopenedtext .NoText
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked IVYSLAB_IVY
	loadtrainer PROF_IVY, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_PROF_IVY
	jumptext .AfterText

.Return2:
	giveitem LIECHI_BERRY
.Return1:
	giveitem LIECHI_BERRY
	jumpthisopenedtext

.NoBerryText:
	text "IVY: Ich verstehe"
	line "…"
	para "Du hast keine drei"
	line "LIECHI-BEEREN zum"
	cont "Spenden."
	done

.RequestText:
	text "IVY: Hallo"
	line "nochmal, <PLAYER>!"
	para "Kann ich dich um"
	line "einen Gefallen"
	cont "bitten?"
	para "Dieses Nidorino"
	line "ist krank und"
	cont "meine"
	para "LUM-BEEREN helfen"
	line "nicht."
	para "Findest du bitte"
	line "drei LIECHI-BEEREN"
	cont "für es?"
	done

.OkayText:
	text "IVY: Perfekt!"
	line "Danke, <PLAYER>!"

	para "Mal sehen, ob das"
	line "Nidorino hilft…"
	done

.ThanksText:
	text "IVY: Danke,"
	line "<PLAYER>!"
	para "Nidorino sieht"
	line "viel gesünder aus!"
	para "Nimm das als"
	line "Dankeschön."
	done

.ChallengeText:
	text "IVY: Ich könnte"
	line "eine Pause vom"
	cont "Forschen"
	cont "gebrauchen."

	para "Wie wär's mit"
	line "einem schnellen"
	cont "Kampf?"
	done

.NoText:
	text "Na gut, dann"
	line "forsche ich"
	cont "einfach weiter."
	done

.SeenText:
	text "Professor gegen"
	line "Champion-los"
	cont "geht's!"
	done

.BeatenText:
	text "Keine"
	line "Überraschung!"
	done

.AfterText:
	text "IVY: Das war ein"
	line "aufregender Kampf!"
	done

IvysLabHopeScript:
	checkevent EVENT_HEALED_NIDORINO
	iftrue_jumptextfaceplayer .Text2
	jumpthistextfaceplayer

	text "HOPE: PROF. IVY"
	line "kümmert sich um"

	para "die #MON auf"
	line "dieser Insel."

	para "Gerade pflegt sie"
	line "ein krankes"
	cont "Nidorino."
	done

.Text2:
	text "HOPE: Danke, dass"
	line "du bei dem"
	cont "Nidorino geholfen"
	cont "hast!"
	done

IvysLabNidorinoScript:
	checkevent EVENT_HEALED_NIDORINO
	iftruefwd .Healed
	opentext
	writetext .WeakCry
	setmonval NIDORINO
	special PlaySlowCry
	promptbutton
	jumpthisopenedtext

	text "Sein Ruf ist"
	line "schwach…"
	done
.WeakCry:
	text "NIDORINO: Gyun…"
	done

.Healed:
	showcrytext IvysLabNidorinoText, NIDORINO
	end

IvysLabNidorinoText:
	text "NIDORINO: Nido!"
	done
IvysLabWindowText:
	text "Das Fenster ist"
	line "offen."

	para "Eine Meeresbrise"
	line "weht herein."
	done

IvysLabHealingMachine:
	opentext
	writetext .Text
	yesorno
	iftruefwd .HealParty
	endtext

.HealParty:
	special HealParty
	special SaveMusic
	playmusic MUSIC_NONE
	setval 1 ; Machine is in Elm's Lab
	special HealMachineAnim
	pause 30
	special RestoreMusic
	endtext

.Text:

	text "Willst du deine"
	line "#MON heilen?"
	done
PokemonJournalProfIvyScript:
	setflag ENGINE_READ_PROF_IVY_JOURNAL
	jumpthistext

	text "#MON Journal"
	para "Spezial: Prof."
	line "IVY!"
	para "PHILENA IVY"
	line "arbeitete mit"
	cont "ROCKO aus MARMORIA"
	para "an einem"
	line "glänzenden Onix"
	cont "und seinem"
	cont "Kristallkörper."
	done
