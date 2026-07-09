LyraPhoneGreetingText_Morn:
	text "Oh, <PLAYER>!"
	line "Guten Morgen!"
	prompt

LyraPhoneGreetingText_Day:
	text "Oh, <PLAYER>!"
	line "Wie geht's dir?"
	prompt

LyraPhoneGreetingText_Eve:
	text "Oh, <PLAYER>!"
	line "Guten Abend!"
	prompt

LyraPhoneGreetingText_Nite:
	text "…<PLAYER>!"
	line "Guten Abend!"

	para "Du bist spät"
	line "wach."
	prompt

LyraPhoneLandmarkText:
	text "Wo bist du"
	line "gerade?"
	line ""
	text_ram wStringBuffer4
	text "?"
	prompt

LyraPhoneKantoText:
	text "Du bist ganz in"
	line "Kanto!"
	prompt

LyraPhoneIslandsText:
	text "Du erkundest eine"
	line "tropische Insel…"

	para "Ich bin neidisch,"
	line "<PLAYER>!"
	prompt

LyraPhoneJohtoText_Generic:
	text "Erzähl mir später"
	line "alles, OK?"
	prompt

LyraPhoneNextMoveQuestionText:
	text "Also, <PLAYER>…"

	para "Soll ich dir"
	line "sagen,"
	line "wann dein #mon"

	para "seine nächste"
	line "Attacke lernt?"
	done

LyraPhoneNextMoveRefusedText:
	text "Haha, dann"
	line "verrate"
	line "ich's nicht!"
	prompt

LyraPhoneNextMoveLevelText:
	text_ram wStringBuffer3
	line "lernt seine"
	cont "nächste"
	cont "Attacke auf"
	cont "Level "
	text_decimal hScriptVar, 1, 3
	text ":"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

LyraPhoneNoNextMoveText:
	text_ram wStringBuffer3
	line "lernt keine"
	cont "weiter"

	para "en Attacken nur"
	line "durch"
	cont "Levelaufstieg."
	prompt

LyraPhoneNoEggMovesText:
	text "Eier lernen keine"
	line "Attacken! …Oder?"
	prompt

LyraPhoneEndText:
	text "Jedenfalls…"
	line "Schön,"
	line "mal wieder mit"
	cont "dir"
	cont "zu reden,"
	cont "<PLAYER>."

	para "Ruf mich wieder"
	line "an!"
	done

LyraPhoneSpecialText_YellowForest:
	text "Hi, <PLAYER>!"
	line "Wie geht's?"

	para "Warst du schon im"
	line "Gelben Wald?"

	para "Ich wollte hin,"
	line "aber ich hörte,"

	para "Team Rocket"
	line "treibt"
	line "da Unfug."

	para "Ich will mich da"
	line "nicht"
	cont "reinmischen!"

	para "Du hast Team"
	line "Rocket schon mal"

	para "besiegt, oder"
	line "<PLAYER>?"

	para "Das ist so mutig"
	line "von dir!"

	para "Viel Glück auf"
	line "deiner Reise!"
	done

LyraPhoneSpecialText_FirstBadge:
	text "<PLAYER>! Hi!"

	para "Ich habe meinen"
	line "ersten Orden!"

	para "Falkners Tauboss"
	line "ist stark, aber"

	para "meins hat"
	line "gewonnen!"
	line "Ich musste dir"
	cont "das"

	para "erzählen,"
	line "<PLAYER>."
	line "Du hast deinen"

	para "ersten Orden in"
	line "Kanto? Super!"

	para "Lass uns beide"
	line "weiter Orden"
	cont "holen."

	para "Wir sehen uns in"
	line "der Liga!"
	done

LyraPhoneSpecialText_LyrasEgg:
	text "<PLAYER>! Hi!"

	para "Geht's dir gut"
	line "gegen Kantos"

	para "Arenaleiter? Ich"
	line "bin sicher, ja!"

	para "Hör mal, hör mal!"

	para "Ich habe mein "
	text_ram wStringBuffer4
	line "im Hort bei Oma"

	para "und Opa gelassen,"
	line "und sie fanden"
	cont "ein"
	cont "Ei!"

	para "Ist das nicht"
	line "toll?"

	para "Ich trainiere ein"
	line "volles Team,"
	cont "also…"

	para "wenn du es haben"
	line "willst…"

	para "Jedenfalls hab"
	line "ich"
	line "das Ei im Hort"

	para "gelassen, falls"
	line "du es willst!"

	para "Ich weiß, du"
	line "wirst"
	line "gut darauf"
	cont "aufpas-"
	cont "sen, <PLAYER>."

	para "Tschüss!"
	done
