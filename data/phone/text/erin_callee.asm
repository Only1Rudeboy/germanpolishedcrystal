ErinAnswerPhoneText:
	text "Ja, hier ist"
	line ""
	text_ram wStringBuffer3
	text "…"

	para "Oh. Hi, <PLAYER>!"
	line "Guten Morgen!"
	done

ErinAnswerPhoneDayText:
	text "Ja, hier ist"
	line ""
	text_ram wStringBuffer3
	text "…"

	para "Oh, hi, <PLAYER>!"
	line "Juhu!"
	done

ErinAnswerPhoneNiteText:
	text "Ja, hier ist"
	line ""
	text_ram wStringBuffer3
	text "…"

	para "Oh, hi, <PLAYER>!"
	done

ErinGreetText:
	text "<PLAYER>!"

	para "Ich bin's, "
	text_ram wStringBuffer3
	text "!"
	line "Guten Morgen!"
	done

ErinGreetDayText:
	text "<PLAYER>!"

	para "Ich bin's, "
	text_ram wStringBuffer3
	text "!"
	line "Arbeitest du"
	cont "hart?"
	done

ErinGreetNiteText:
	text "<PLAYER>!"

	para "Ich bin's, "
	text_ram wStringBuffer3
	text "!"
	line "Warst du wach?"
	done

ErinGenericText:
	text "Züchtest du deine"
	line "#mon?"

	para "Hey, "
	text_ram wStringBuffer3
	text "s "
	text_ram wStringBuffer4
	text " sieht"
	cont "gut aus!"
	done
