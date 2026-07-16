LyraPhoneGreetingText_Morn:
	text "Oh, <PLAYER>!"
	line "Guten Morgen!"
	prompt

LyraPhoneGreetingText_Day:
	text "Oh, <PLAYER>! Wie"
	line "geht's dir?"
	prompt

LyraPhoneGreetingText_Eve:
	text "Oh, <PLAYER>!"
	line "Guten Abend!"
	prompt

LyraPhoneGreetingText_Nite:
	text "… <PLAYER>! Guten"
	line "Abend!"
	para "Du bist spät"
	line "wach."
	prompt

LyraPhoneLandmarkText:
	text "Wo bist du"
	line "gerade?"
	cont ""
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
	line "alles, O.K.?"
	prompt

LyraPhoneNextMoveQuestionText:
	text "Also, <PLAYER>…"

	para "Soll ich dir"
	line "sagen, wann dein"
	cont "#MON"

	para "seine nächste"
	line "Attacke lernt?"
	done

LyraPhoneNextMoveRefusedText:
	text "Haha, dann"
	line "verrate ich's"
	cont "nicht!"
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
	text "Jedenfalls …"
	line "Schön, mal wieder"
	cont "mit dir zu reden,"
	cont "<PLAYER>."
	para "Ruf mich wieder"
	line "an!"
	done

LyraPhoneSpecialText_YellowForest:
	text "Hi, <PLAYER>! Wie"
	line "geht's?"
	para "Warst du schon im"
	line "Gelben Wald?"
	para "Ich wollte hin,"
	line "aber ich hörte,"
	para "Team Rocket"
	line "treibt da Unfug."
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
	text "<PLAYER>! Hallo!"

	para "Ich habe meinen"
	line "ersten Orden!"

	para "FALKs Tauboss"
	line "ist stark, aber"

	para "meins hat"
	line "gewonnen! Ich"
	cont "musste dir das"

	para "erzählen,"
	line "<PLAYER>. Du hast"
	cont "deinen"

	para "ersten Orden in"
	line "Kanto? Super!"

	para "Lass uns beide"
	line "weiter Orden"
	cont "holen."

	para "Wir sehen uns in"
	line "der Liga!"
	done

LyraPhoneSpecialText_LyrasEgg:
	text "<PLAYER>! Hallo!"

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
	cont "Ei!"

	para "Ist das nicht"
	line "toll?"

	para "Ich trainiere ein"
	line "volles Team,"

	para "wenn du es haben"
	line "willst…"

	para "Jedenfalls hab"
	line "das Ei im Hort"

	para "gelassen, falls"
	line "es willst!"

	para "Ich weiß, du"
	line "gut darauf"
	cont "aufpassen,"
	cont "<PLAYER>."

	para "Tschüss!"
	done
