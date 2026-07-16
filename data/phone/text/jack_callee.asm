JackAnswerPhoneText:
	text "Hallo. Hier ist"
	line ""
	text_ram wStringBuffer3
	text "…"

	para "Guten Morgen,"
	line "<PLAYER>!"
	done

JackAnswerPhoneDayText:
	text "Hallo. Hier ist"
	line ""
	text_ram wStringBuffer3
	text "…"

	para "Wie geht's"
	line "<PLAYER>?"
	done

JackAnswerPhoneNiteText:
	text "Hallo. Hier ist"
	line ""
	text_ram wStringBuffer3
	text "…"

	para "Guten Abend,"
	line "<PLAYER>!"
	done

JackGreetText:
	text "<PLAYER>,"
	line "guten Morgen!"

	para "Ich, "
	text_ram wStringBuffer3
	text "."
	line "Wie geht es dir?"
	done

JackGreetDayText:
	text "<PLAYER>, Tach!"

	para "Ich, "
	text_ram wStringBuffer3
	text "."
	line "Ist es heute"
	cont "nicht schön?"
	done

JackGreetNiteText:
	text "<PLAYER>,"
	line "guten Abend!"

	para "Ich, "
	text_ram wStringBuffer3
	text "."
	line "Hast du Zeit?"
	done

JackGenericText:
	text "Wie geht es deinen"
	line "#MON?"

	para "Mein "
	text_ram wStringBuffer4
	line "ist so neugierig."

	para "Das ist ein Pro-"
	line "blem. Es ist"
	cont "ein wenig wie ich…"
	done
