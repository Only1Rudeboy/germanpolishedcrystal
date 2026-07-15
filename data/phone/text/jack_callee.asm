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

	para "Wie läuft's,"
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
	text "<PLAYER>, guten"
	line "Morgen!"

	para "Ich bin's, "
	text_ram wStringBuffer3
	text ". Wie geht's?"
	done

JackGreetDayText:
	text "<PLAYER>, hi!"

	para "Ich bin's, "
	text_ram wStringBuffer3
	text ". Schönes Wetter!"
	done

JackGreetNiteText:
	text "<PLAYER>, guten"
	line "Abend!"

	para "Ich bin's, "
	text_ram wStringBuffer3
	text ". Hast du Zeit?"
	done

JackGenericText:
	text "Wie gehen deine"
	line "#mon?"

	para "Mein "
	text_ram wStringBuffer4
	text "ist so neugierig,"
	line "das"
	para "ist ein Problem."
	line "Vielleicht wie"
	cont "ich …"
	done
