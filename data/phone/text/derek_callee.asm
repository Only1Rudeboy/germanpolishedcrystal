DerekAnswerPhoneText:
	text "Hi, <PLAYER>?"

	para "Guten Morgen,"
	line "pika. Was gibt's,"
	cont "pika?"
	done

DerekAnswerPhoneDayText:
	text "Hi, <PLAYER>?"

	para "Guten Tag, pika,"
	line "was gibt's, pika?"
	done

DerekAnswerPhoneNiteText:
	text "Hi, <PLAYER>?"

	para "Guten Abend, pika,"
	line "was gibt's, pika?"
	done

DerekGreetText:
	text "<PLAYER>, pika,"
	line "guten Morgen!"

	para "Ich bin's, "
	text_ram wStringBuffer3
	text ", wie geht's,"
	line "pika?"
	done

DerekGreetDayText:
	text "<PLAYER>, pika,"
	line "schöner Tag!"

	para "Ich bin's, "
	text_ram wStringBuffer3
	text ", wie geht's,"
	line "pika?"
	done

DerekGreetNiteText:
	text "<PLAYER>, pika,"
	line "guten Abend!"

	para "Ich bin's, "
	text_ram wStringBuffer3
	text ". Warst du wach,"
	line "pika?"
	done

DerekGenericText:
	text "Das musst du"
	line "hören! Mein liebes"

	para ""
	text_ram wStringBuffer4
	text " hat mich"
	line "angesehen und"
	cont "gegrinst!"

	para "Unsere Herzen"
	line "schlagen als eins!"
	done
