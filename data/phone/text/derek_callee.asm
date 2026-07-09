DerekAnswerPhoneText:
	text "Hi, <PLAYER>?"

	para "Guten Morgen,"
	line "pika."
	line "Was gibt's, pika?"
	done

DerekAnswerPhoneDayText:
	text "Hi, <PLAYER>?"

	para "Guten Tag, pika,"
	line "was gibt's, pika?"
	done

DerekAnswerPhoneNiteText:
	text "Hi, <PLAYER>?"

	para "Guten Abend,"
	line "pika,"
	line "was gibt's, pika?"
	done

DerekGreetText:
	text "<PLAYER>, pika,"
	line "guten Morgen!"

	para "Ich bin's, "
	text_ram wStringBuffer3
	text ", wie"
	line "geht's, pika?"
	done

DerekGreetDayText:
	text "<PLAYER>, pika,"
	line "schöner Tag!"

	para "Ich bin's, "
	text_ram wStringBuffer3
	text ", wie"
	line "geht's, pika?"
	done

DerekGreetNiteText:
	text "<PLAYER>, pika,"
	line "guten Abend!"

	para "Ich bin's, "
	text_ram wStringBuffer3
	text ". Warst"
	line "du wach, pika?"
	done

DerekGenericText:
	text "Das musst du"
	line "hören!"
	line "Mein liebes"

	para ""
	text_ram wStringBuffer4
	text " hat"
	line "mich angesehen"
	cont "und"
	cont "gegrinst!"

	para "Unsere Herzen"
	line "schlagen als"
	cont "eins!"
	done
