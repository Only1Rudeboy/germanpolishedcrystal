SinjohRuinsHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, SINJOH_RUINS, 2
	warp_event  3,  7, SINJOH_RUINS, 2

	def_coord_events

	def_bg_events
	bg_event  1,  1, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  2,  1, BGEVENT_JUMPSTD, difficultbookshelf

	def_object_events
	object_event  5,  4, SPRITE_CYNTHIA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, SinjohRuinsHouseCynthiaScript, EVENT_SINJOH_RUINS_HOUSE_CYNTHIA
	object_event  5,  3, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SinjohRuinsHousePokefanmText, -1
	object_event  2,  4, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SinjohRuinsHouseGrampsScript, -1
	pokemon_event  2,  3, ABRA, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BROWN, SinjohRuinsHouseAbraText, -1

	object_const_def
	const SINJOHRUINSHOUSE_CYNTHIA

SinjohRuinsHouseGrampsScript:
	faceplayer
	opentext
	writetext SinjohRuinsHouseGrampsText
	yesorno
	iffalse_jumpopenedtext SinjohRuinsHouseGrampsNoText
	writetext SinjohRuinsHouseGrampsYesText
	waitbutton
	closetext
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
	warp NEW_BARK_TOWN, 15, 6
	end

SinjohRuinsHouseCynthiaScript:
	checkevent EVENT_BEAT_CYNTHIA
	iftrue_jumptextfaceplayer SinjohRuinsHouseCynthiaAfterText
	faceplayer
	opentext
	writetext SinjohRuinsHouseCynthiaChallengeText
	yesorno
	iffalse_jumpopenedtext SinjohRuinsHouseCynthiaNoText
	writetext SinjohRuinsHouseCynthiaYesText
	waitbutton
	closetext
	winlosstext SinjohRuinsHouseCynthiaWinText, 0
	setlasttalked SINJOHRUINSHOUSE_CYNTHIA
	loadtrainer CYNTHIA, 2
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CYNTHIA
	jumpthistext

SinjohRuinsHouseCynthiaAfterText:
	text "Cynthia: Was für"
	line "ein unglaublicher"
	cont "Kampf!"

	para "Du bist ein"
	line "großartiger"
	cont "Trainer, und es"

	para "würde mich freuen,"
	line "dich wieder zu"
	cont "sehen."
	done

SinjohRuinsHousePokefanmText:
	text "Vor langer Zeit"
	line "hatten Menschen"

	para "eine engere"
	line "Bindung zu"
	cont "#mon."

	para "Mythen und"
	line "Legenden über"
	cont "mächtige #mon"
	cont "entstanden,"

	para "und diese Legenden"
	line "verbreiteten sich"
	cont "in andere"
	cont "Regionen."

	para "Die Ruinen hier"
	line "wurden von den"

	para "Ureinwohnern von"
	line "Alph in Johto und"

	para "der Lanzen-Säule"
	line "in Sinnoh"
	cont "beeinflusst."
	done

SinjohRuinsHouseGrampsText:
	text "Du wirkst so fehl"
	line "am Platz —"

	para "du weißt nicht"
	line "einmal, warum du"
	cont "hier bist."

	para "Soll mein Abra"
	line "dich nach Hause"
	cont "teleportieren?"
	done

SinjohRuinsHouseGrampsYesText:
	text "O.K. Stell dir"
	line "dein Haus vor…"
	done
SinjohRuinsHouseGrampsNoText:
	text "O.K. Alles Gute!"
	done
SinjohRuinsHouseAbraText:
	text "ABRA: Aabra…"
	done
SinjohRuinsHouseCynthiaChallengeText:
	text "Cynthia: Hallo,"
	line "<PLAYER>."

	para "Bist du gut in"
	line "Form geblieben?"

	para "Du hast die TOP"
	line "VIER im Rückkampf"
	cont "besiegt! Gut"
	cont "gemacht!"

	para "Ich bin neugierig,"
	line "was du seit"

	para "unserem letzten"
	line "Treffen gelernt"
	cont "hast."

	para "Sollen wir noch"
	line "einmal kämpfen,"
	cont "<PLAYER>?"
	done

SinjohRuinsHouseCynthiaNoText:
	text "Cynthia: Komm"
	line "jederzeit wieder,"

	para "wenn du es dir"
	line "anders überlegst."
	done

SinjohRuinsHouseCynthiaYesText:
	text "Cynthia: Bevor ich"
	line "mein #mon"
	cont "schicke,"

	para "beginnt mein Herz"
	line "immer zu rasen…"
	done

SinjohRuinsHouseCynthiaWinText:
	text "Ich kann mich"
	line "nicht erinnern,"

	para "wann ich zuletzt"
	line "so übertrumpft"
	cont "wurde!"
	done
