ParryAnswerPhoneText:
	text "Jup, jup!"
	line "Hier "
	text_ram wStringBuffer3
	text "!"

	para "Haha, und hier"
	line "<PLAYER>!"
	done

ParryAnswerPhoneDayText:
	text "Jup, jup!"
	line "Hier "
	text_ram wStringBuffer3
	text "!"

	para "Haha, und hier"
	line "<PLAYER>!"
	done

ParryAnswerPhoneNiteText:
	text "Jup, jup!"
	line "Hier "
	text_ram wStringBuffer3
	text "!"

	para "Haha, und hier"
	line "<PLAYER>!"
	done

ParryGreetText:
	text "<PLAYER>, hier"
	line ""
	text_ram wStringBuffer3
	text "!"

	para "Hast du richtig"
	line "gefrühstückt?"
	done

ParryGreetDayText:
	text "<PLAYER>, hier"
	line ""
	text_ram wStringBuffer3
	text "!"

	para "Hast du richtig"
	line "zu Mittag"
	cont "gegessen?"
	done

ParryGreetNiteText:
	text "<PLAYER>, hier"
	line ""
	text_ram wStringBuffer3
	text "!"

	para "Hast du richtig"
	line "zu Abend"
	cont "gegessen?"
	done

ParryGenericText:
	text "Sehen deine #mon"
	line "gut aus?"

	para "Mein "
	text_ram wStringBuffer4
	text " und"
	line "ich — wir sehen"

	para "super aus!"
	line "Hahahah!"
	done
